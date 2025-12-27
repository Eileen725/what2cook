# Imports - Notwendige Module für die Flask-App
from flask import Flask, redirect, render_template, request, url_for
from dotenv import load_dotenv  # Lädt Umgebungsvariablen aus .env Datei
import os  # Zugriff auf Betriebssystem-Funktionen
import git  # Git-Integration für automatisches Deployment
import hmac  # Kryptographische Signatur-Überprüfung
import hashlib  # Hash-Funktionen für Signatur-Verifizierung
from db import db_read, db_write  # Datenbankfunktionen
from auth import login_manager, authenticate, register_user  # Authentifizierungs-Funktionen
from flask_login import login_user, logout_user, login_required, current_user  # Login-Management
import logging  # Logging für Debug-Informationen

# Logging-Konfiguration - zeigt Debug-Informationen in der Konsole
logging.basicConfig(
    level=logging.DEBUG,
    format="%(asctime)s [%(levelname)s] %(name)s: %(message)s",
)

# Umgebungsvariablen laden
load_dotenv()  # Lädt .env Datei
W_SECRET = os.getenv("W_SECRET")  # Webhook-Secret für GitHub

# Flask-App initialisieren
app = Flask(__name__)
app.config["DEBUG"] = True  # Debug-Modus aktiviert
app.secret_key = "supersecret"  # Secret Key für Session-Management

# Authentication initialisieren
login_manager.init_app(app)  # Flask-Login mit der App verbinden
login_manager.login_view = "login"  # Redirect zur Login-Seite wenn nicht eingeloggt

# DON'T CHANGE - Webhook-Signatur-Validierung
def is_valid_signature(x_hub_signature, data, private_key):
    """Überprüft ob der GitHub Webhook authentisch ist"""
    hash_algorithm, github_signature = x_hub_signature.split('=', 1)  # Trennt Algorithm und Signatur
    algorithm = hashlib.__dict__.get(hash_algorithm)  # Holt Hash-Algorithmus (z.B. sha256)
    encoded_key = bytes(private_key, 'latin-1')  # Konvertiert Secret zu Bytes
    mac = hmac.new(encoded_key, msg=data, digestmod=algorithm)  # Berechnet erwartete Signatur
    return hmac.compare_digest(mac.hexdigest(), github_signature)  # Vergleicht sicher

# DON'T CHANGE - GitHub Webhook für automatisches Deployment
@app.post('/update_server')
def webhook():
    """Empfängt GitHub Push-Events und aktualisiert den Server automatisch"""
    x_hub_signature = request.headers.get('X-Hub-Signature')  # Holt Signatur aus Header
    if is_valid_signature(x_hub_signature, request.data, W_SECRET):  # Prüft Signatur
        repo = git.Repo('./mysite')  # Öffnet Git-Repository
        origin = repo.remotes.origin  # Holt Remote-Verbindung
        origin.pull()  # Pullt neueste Änderungen von GitHub
        return 'Updated PythonAnywhere successfully', 200
    return 'Unathorized', 401  # Fehlgeschlagen wenn Signatur falsch

# ===== AUTHENTIFIZIERUNGS-ROUTES =====

@app.route("/login", methods=["GET", "POST"])
def login():
    """Login-Seite - Benutzer können sich anmelden"""
    error = None

    # POST: Benutzer hat Login-Formular abgeschickt
    if request.method == "POST":
        # Überprüfe Benutzername und Passwort in der Datenbank
        user = authenticate(
            request.form["username"],
            request.form["password"]
        )

        if user:
            login_user(user)  # Loggt Benutzer ein (Session erstellen)
            return redirect(url_for("index"))  # Weiterleitung zur Hauptseite

        error = "Benutzername oder Passwort ist falsch."

    # GET: Zeigt Login-Formular an
    return render_template(
        "auth.html",
        title="In dein Konto einloggen",
        action=url_for("login"),
        button_label="Einloggen",
        error=error,
        footer_text="Noch kein Konto?",
        footer_link_url=url_for("register"),
        footer_link_label="Registrieren"
    )


@app.route("/register", methods=["GET", "POST"])
def register():
    """Registrierungs-Seite - Neue Benutzer können sich registrieren"""
    error = None

    # POST: Benutzer hat Registrierungs-Formular abgeschickt
    if request.method == "POST":
        username = request.form["username"]  # Holt Benutzername aus Formular
        password = request.form["password"]  # Holt Passwort aus Formular

        ok = register_user(username, password)  # Versucht neuen Benutzer zu erstellen
        if ok:
            return redirect(url_for("login"))  # Erfolg: Weiterleitung zum Login

        error = "Benutzername existiert bereits."  # Fehler: Username schon vergeben

    # GET: Zeigt Registrierungs-Formular an
    return render_template(
        "auth.html",
        title="Neues Konto erstellen",
        action=url_for("register"),
        button_label="Registrieren",
        error=error,
        footer_text="Du hast bereits ein Konto?",
        footer_link_url=url_for("login"),
        footer_link_label="Einloggen"
    )

@app.route("/logout")
@login_required  # Nur eingeloggte Benutzer können sich ausloggen
def logout():
    """Logout - Benutzer abmelden"""
    logout_user()  # Beendet die Session des Benutzers
    return redirect(url_for("index"))  # Weiterleitung zur Hauptseite



# ===== HAUPTFUNKTIONEN DER APP =====

@app.route("/", methods=["GET", "POST"])
@login_required  # Nur eingeloggte Benutzer können diese Seite sehen
def index():
    """Hauptseite - Zeigt alle Rezepte des Benutzers an"""
    
    # GET: Zeigt die Rezept-Liste an
    if request.method == "GET":
        # Lädt alle Rezepte des aktuellen Benutzers aus der Datenbank
        rezepte = db_read("SELECT id, name, description FROM rezepte WHERE user_id=%s", (current_user.id,))
        return render_template("main_page.html", rezepte=rezepte)

    # POST: Neues Rezept hinzufügen
    name = request.form["name"]  # Holt Rezeptname aus Formular
    description = request.form["description"]  # Holt Beschreibung aus Formular
    # Speichert neues Rezept in der Datenbank
    db_write("INSERT INTO rezepte(user_id, name, description) VALUES (%s, %s, %s)", (current_user.id, name, description, ))
    return redirect(url_for("index"))  # Lädt Seite neu um neues Rezept anzuzeigen

@app.post("/complete")
@login_required  # Nur eingeloggte Benutzer
def complete():
    """Löscht ein Rezept (wenn Checkbox angeklickt wird)"""
    rezept_id = request.form.get("id")  # Holt die Rezept-ID aus dem Formular
    # Löscht das Rezept aus der Datenbank (nur wenn es dem Benutzer gehört)
    db_write("DELETE FROM rezepte WHERE user_id=%s AND id=%s", (current_user.id, rezept_id,))
    return redirect(url_for("index"))  # Zurück zur Hauptseite



@app.route("/rezept/<int:rezept_id>", methods=["GET", "POST"])
@login_required  # Nur eingeloggte Benutzer
def rezept_detail(rezept_id):
    """Detail-Seite für ein einzelnes Rezept"""
    # Lädt das Rezept aus der Datenbank (nur wenn es dem Benutzer gehört)
    rezept = db_read("SELECT id, name, description FROM rezepte WHERE user_id=%s AND id=%s", (current_user.id, rezept_id), single=True)
    
    # Fehler wenn Rezept nicht existiert oder nicht dem Benutzer gehört
    if not rezept:
        return "Rezept nicht gefunden", 404
    
    # Lädt alle Zutaten für dieses Rezept
    zutaten = db_read("SELECT id, name, number, einheit FROM zutaten WHERE rezept_id=%s", (rezept_id,))
    
    # Zeigt Template mit Rezept und Zutaten an
    return render_template("rezept_detail.html", rezept=rezept, zutaten=zutaten)


if __name__ == "__main__":
    # Startet den Flask Development Server
    # Wird nur ausgeführt wenn die Datei direkt aufgerufen wird (nicht bei Import)
    app.run()