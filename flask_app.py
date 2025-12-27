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

@app.route("/")
@login_required
def index():
    """Startseite mit Einleitung"""
    return render_template("home.html")

@app.route("/rezepte", methods=["GET", "POST"])
@login_required  # Nur eingeloggte Benutzer können diese Seite sehen
def meine_rezepte():
    """Meine Rezepte - Zeigt alle Rezepte des Benutzers an"""
    
    # GET: Zeigt die Rezept-Liste an
    if request.method == "GET":
        # Lädt alle Rezepte des aktuellen Benutzers aus der Datenbank
        rezepte = db_read("SELECT id, name, description FROM rezepte WHERE user_id=%s", (current_user.id,))
        return render_template("rezepte.html", rezepte=rezepte)

    # POST: Neues Rezept hinzufügen
    name = request.form["name"]  # Holt Rezeptname aus Formular
    description = request.form["description"]  # Holt Beschreibung aus Formular
    
    # Speichert neues Rezept in der Datenbank
    db_write("INSERT INTO rezepte(user_id, name, description) VALUES (%s, %s, %s)", (current_user.id, name, description))
    
    # Holt die ID des neu erstellten Rezepts
    rezept = db_read("SELECT id FROM rezepte WHERE user_id=%s ORDER BY id DESC LIMIT 1", (current_user.id,), single=True)
    rezept_id = rezept['id']
    
    # Speichert Zutaten (falls vorhanden)
    zutat_names = request.form.getlist("zutat_name[]")
    zutat_numbers = request.form.getlist("zutat_number[]")
    zutat_einheiten = request.form.getlist("zutat_einheit[]")
    
    for i in range(len(zutat_names)):
        if zutat_names[i].strip():  # Nur speichern wenn Name nicht leer
            number = float(zutat_numbers[i]) if zutat_numbers[i] else None
            einheit = zutat_einheiten[i] if zutat_einheiten[i] else None
            db_write("INSERT INTO zutaten(rezept_id, name, number, einheit) VALUES (%s, %s, %s, %s)",
                    (rezept_id, zutat_names[i], number, einheit))
    
    return redirect(url_for("meine_rezepte"))  # Lädt Seite neu um neues Rezept anzuzeigen

@app.route("/einkaufsliste", methods=["GET", "POST"])
@login_required
def einkaufsliste():
    """Einkaufsliste - Suche Rezepte nach Zutaten"""
    gefundene_rezepte = []
    suchbegriffe = []
    
    if request.method == "POST":
        # Hole Zutaten aus dem Formular
        zutaten_input = request.form.get("zutaten", "").strip()
        if zutaten_input:
            # Splitte die Zutaten (durch Komma getrennt)
            suchbegriffe = [z.strip().lower() for z in zutaten_input.split(",") if z.strip()]
            
            # Suche Rezepte die mindestens eine der Zutaten enthalten
            # Hole alle Rezepte des Benutzers mit ihren Zutaten
            rezepte = db_read(
                """SELECT DISTINCT r.id, r.name, r.description 
                   FROM rezepte r 
                   JOIN zutaten z ON r.id = z.rezept_id 
                   WHERE r.user_id=%s""", 
                (current_user.id,)
            )
            
            # Filtere Rezepte die mindestens eine gesuchte Zutat enthalten
            for rezept in rezepte:
                # Hole alle Zutaten für dieses Rezept
                zutaten = db_read(
                    "SELECT name FROM zutaten WHERE rezept_id=%s",
                    (rezept['id'],)
                )
                
                # Prüfe ob mindestens eine gesuchte Zutat vorhanden ist
                rezept_zutaten = [z['name'].lower() for z in zutaten]
                for suchbegriff in suchbegriffe:
                    if any(suchbegriff in zutat for zutat in rezept_zutaten):
                        # Füge Zutaten-Info zum Rezept hinzu
                        rezept['zutaten'] = zutaten
                        gefundene_rezepte.append(rezept)
                        break  # Rezept wurde schon hinzugefügt
    
    return render_template("einkaufsliste.html", 
                          rezepte=gefundene_rezepte, 
                          suchbegriffe=", ".join(suchbegriffe))

@app.post("/complete")
@login_required  # Nur eingeloggte Benutzer
def complete():
    """Löscht ein Rezept (wenn Checkbox angeklickt wird)"""
    rezept_id = request.form.get("id")  # Holt die Rezept-ID aus dem Formular
    # Löscht das Rezept aus der Datenbank (nur wenn es dem Benutzer gehört)
    db_write("DELETE FROM rezepte WHERE user_id=%s AND id=%s", (current_user.id, rezept_id,))
    return redirect(url_for("meine_rezepte"))  # Zurück zur Rezeptliste



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