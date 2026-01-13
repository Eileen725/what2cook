CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(250) NOT NULL UNIQUE,
    password VARCHAR(250) NOT NULL
);

CREATE TABLE rezepte (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NULL,  -- NULL = Allgemeines Rezept für alle
    name VARCHAR(250) NOT NULL,
    description VARCHAR(250) NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE zutaten (
    id INT AUTO_INCREMENT PRIMARY KEY,
    rezept_id INT NOT NULL,
    name VARCHAR(250) NOT NULL,
    number INT,
    einheit VARCHAR(50);
    FOREIGN KEY (rezept_id) REFERENCES rezepte(id)
);

CREATE TABLE rezept_anleitung (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    rezept_id INTEGER,
    step_number INTEGER,
    text TEXT
    
);


-- Beschreibungen von jedem Rezept (kann man noch ändern)
INSERT INTO rezepte (user_id, name, description) VALUES (NULL, 'Pizza', 'Klassischer Pizzateig mit Tomatensauce und Käse');
INSERT INTO rezepte (user_id, name, description) VALUES (NULL, 'Spaghetti', 'Spaghetti mit Butter - Kindheistklassiker');
INSERT INTO rezepte (user_id, name, description) VALUES (NULL, 'Tomatensauce', 'Frische Tomatensauce von scratch');
INSERT INTO rezepte (user_id, name, description) VALUES (NULL, 'toms Erdbeermarmeladenbrot mit Honig', 'Kindheitsklassiker');
INSERT INTO rezepte (user_id, name, description) VALUES (NULL, 'Cinque Pi', 'Cremige Pasta mit Rahm-Tomatensauce');
INSERT INTO rezepte (user_id, name, description) VALUES (NULL, 'Armer Ritter', 'Einfaches süsses Frühstück');
INSERT INTO rezepte (user_id, name, description) VALUES (NULL, 'Bruschetta', 'Klassische italienische Häpchenkost');
INSERT INTO rezepte (user_id, name, description) VALUES (NULL, 'tortilla de patatas', 'Traditioneller spanischer Klassiker');
INSERT INTO rezepte (user_id, name, description) VALUES (NULL, 'Bratkartoffeln', 'Knusprige Kartoffelwürfel, perfekt als Beilage');

INSERT INTO rezepte (user_id, name, description) VALUES (NULL, 'Spaghetti Bolognese', 'Klassische italienische Pasta mit Hackfleischsauce');
INSERT INTO rezepte (user_id, name, description) VALUES (NULL, 'Hähnchen-Curry', 'Cremiges indisches Curry mit zartem Hähnchenfleisch');
INSERT INTO rezepte (user_id, name, description) VALUES (NULL, 'Caesar Salad', 'Frischer Salat mit Parmesan und knusprigen Croutons');
INSERT INTO rezepte (user_id, name, description) VALUES (NULL, 'Tomatensuppe', 'Cremige Suppe aus frischen Tomaten');
INSERT INTO rezepte (user_id, name, description) VALUES (NULL, 'Pfannkuchen', 'Fluffige amerikanische Pancakes zum Frühstück');
INSERT INTO rezepte (user_id, name, description) VALUES (NULL, 'Guacamole', 'Mexikanischer Avocado-Dip');
INSERT INTO rezepte (user_id, name, description) VALUES (NULL, 'Rührei', 'Einfaches Frühstück mit Eiern');

-- Zutaten für Pizza (rezept_id 1)
INSERT INTO zutaten (rezept_id, name, number, einheit) VALUES (1, 'Mehl', 400, 'g');
INSERT INTO zutaten (rezept_id, name, number, einheit) VALUES (1, 'Salz', 1, 'KL');
INSERT INTO zutaten (rezept_id, name, number, einheit) VALUES (1, 'Olivenöl', 2, 'EL');
INSERT INTO zutaten (rezept_id, name, number, einheit) VALUES (1, 'Frischhefe', 15, 'g');
INSERT INTO zutaten (rezept_id, name, number, einheit) VALUES (1, 'Wasser', 2.5, 'dl');
INSERT INTO zutaten (rezept_id, name, number, einheit) VALUES (1, 'Tomatensauce', NULL, NULL);
INSERT INTO zutaten (rezept_id, name, number, einheit) VALUES (1, 'Käse', NULL, NULL);
INSERT INTO zutaten (rezept_id, name, number, einheit) VALUES (1, 'Toppings', NULL, NULL);

-- Zutaten für Spaghetti (rezept_id 2)
INSERT INTO zutaten (rezept_id, name, number, einheit) VALUES (2, 'Spaghetti', NULL, NULL);
INSERT INTO zutaten (rezept_id, name, number, einheit) VALUES (2, 'Wasser', NULL, NULL);
INSERT INTO zutaten (rezept_id, name, number, einheit) VALUES (2, 'Salz', NULL, NULL);
INSERT INTO zutaten (rezept_id, name, number, einheit) VALUES (2, 'Butter', NULL, NULL);

-- Zutaten für Tomatensauce (rezept_id 3)
INSERT INTO zutaten (rezept_id, name, number, einheit) VALUES (3, 'Tomaten', 8, NULL);
INSERT INTO zutaten (rezept_id, name, number, einheit) VALUES (3, 'Olivenöl', NULL, NULL);
INSERT INTO zutaten (rezept_id, name, number, einheit) VALUES (3, 'Knoblauch', 1, 'Zehe');
INSERT INTO zutaten (rezept_id, name, number, einheit) VALUES (3, 'Zwiebel', 0.5, NULL);
INSERT INTO zutaten (rezept_id, name, number, einheit) VALUES (3, 'Salz', NULL, NULL);
INSERT INTO zutaten (rezept_id, name, number, einheit) VALUES (3, 'Pfeffer', NULL, NULL);
INSERT INTO zutaten (rezept_id, name, number, einheit) VALUES (3, 'Kräuter', NULL, NULL);

-- Zutaten für Toms Erdbeermarmeladenbrot mit Honig (rezept_id 4)
INSERT INTO zutaten (rezept_id, name, number, einheit) VALUES (4, 'Brot', NULL, NULL);
INSERT INTO zutaten (rezept_id, name, number, einheit) VALUES (4, 'Marmelade', NULL, NULL);
INSERT INTO zutaten (rezept_id, name, number, einheit) VALUES (4, 'Honig', NULL, NULL);

-- Zutaten für Cinque Pi (rezept_id 5)
INSERT INTO zutaten (rezept_id, name, number, einheit) VALUES (5, 'Pasta', 500, 'g');
INSERT INTO zutaten (rezept_id, name, number, einheit) VALUES (5, 'Halbrahm', 4, 'dl');
INSERT INTO zutaten (rezept_id, name, number, einheit) VALUES (5, 'Tomatenpüree', 3, 'EL');
INSERT INTO zutaten (rezept_id, name, number, einheit) VALUES (5, 'Parmesan', 3, 'EL'); 
INSERT INTO zutaten (rezept_id, name, number, einheit) VALUES (5, 'Peterli', 2, 'EL');
INSERT INTO zutaten (rezept_id, name, number, einheit) VALUES (5, 'Muskatnuss', 1, 'Prise');
INSERT INTO zutaten (rezept_id, name, number, einheit) VALUES (5, 'Salz', NULL, NULL);
INSERT INTO zutaten (rezept_id, name, number, einheit) VALUES (5, 'Pfeffer', NULL, NULL);

-- Zutaten für Armer Ritter (rezept_id 6)
INSERT INTO zutaten (rezept_id, name, number, einheit) VALUES (6, 'Brot', 4, 'Scheiben');
INSERT INTO zutaten (rezept_id, name, number, einheit) VALUES (6, 'Ei', 1, NULL);
INSERT INTO zutaten (rezept_id, name, number, einheit) VALUES (6, 'Milch', 2.5, 'dl');
INSERT INTO zutaten (rezept_id, name, number, einheit) VALUES (6, 'Butter', 50, 'g');
INSERT INTO zutaten (rezept_id, name, number, einheit) VALUES (6, 'Zucker', NULL, NULL);
INSERT INTO zutaten (rezept_id, name, number, einheit) VALUES (6, 'Zimt', NULL, NULL);

-- Zutaten für Bruschetta (rezept_id 7)
INSERT INTO zutaten (rezept_id, name, number, einheit) VALUES (7, 'Brot', NULL, NULL);
INSERT INTO zutaten (rezept_id, name, number, einheit) VALUES (7, 'Olivenöl', 3, 'EL');
INSERT INTO zutaten (rezept_id, name, number, einheit) VALUES (7, 'Knoblauch', 1, 'Zehe');
INSERT INTO zutaten (rezept_id, name, number, einheit) VALUES (7, 'Tomaten', 600, 'g');
INSERT INTO zutaten (rezept_id, name, number, einheit) VALUES (7, 'Basilikum', NULL, NULL);
INSERT INTO zutaten (rezept_id, name, number, einheit) VALUES (7, 'Salz', NULL, NULL);
INSERT INTO zutaten (rezept_id, name, number, einheit) VALUES (7, 'Pfeffer', NULL, NULL);

-- Zutaten für tortilla de patatas (rezept_id 8)
INSERT INTO zutaten (rezept_id, name, number, einheit) VALUES (8, 'Zwiebel', 1, NULL);
INSERT INTO zutaten (rezept_id, name, number, einheit) VALUES (8, 'Kartoffeln', 350, 'g');
INSERT INTO zutaten (rezept_id, name, number, einheit) VALUES (8, 'Olivenöl', NULL, NULL);
INSERT INTO zutaten (rezept_id, name, number, einheit) VALUES (8, 'Eier', 4, NULL);
INSERT INTO zutaten (rezept_id, name, number, einheit) VALUES (8, 'Salz', NULL, NULL);
INSERT INTO zutaten (rezept_id, name, number, einheit) VALUES (8, 'Pfeffer', NULL, NULL);

-- Zutaten für Bratkartoffel (rezept_id 9)
INSERT INTO zutaten (rezept_id, name, number, einheit) VALUES (9, 'Kartoffeln', NULL, NULL);
INSERT INTO zutaten (rezept_id, name, number, einheit) VALUES (9, 'Butter', NULL, NULL);
INSERT INTO zutaten (rezept_id, name, number, einheit) VALUES (9, 'Salz', NULL, NULL);

--Neue Rezepte 27.12.2025

-- Zutaten für Spaghetti Bolognese (rezept_id 10)
INSERT INTO zutaten (rezept_id, name, number, einheit) VALUES (10, 'Spaghetti', 500, 'g');
INSERT INTO zutaten (rezept_id, name, number, einheit) VALUES (10, 'Hackfleisch', 400, 'g');
INSERT INTO zutaten (rezept_id, name, number, einheit) VALUES (10, 'Tomaten', 800, 'g');
INSERT INTO zutaten (rezept_id, name, number, einheit) VALUES (10, 'Zwiebeln', 2, 'Stück');
INSERT INTO zutaten (rezept_id, name, number, einheit) VALUES (10, 'Knoblauch', 3, 'Zehen');
INSERT INTO zutaten (rezept_id, name, number, einheit) VALUES (10, 'Olivenöl', 3, 'EL');
INSERT INTO zutaten (rezept_id, name, number, einheit) VALUES (10, 'Salz', NULL, NULL);
INSERT INTO zutaten (rezept_id, name, number, einheit) VALUES (10, 'Pfeffer', NULL, NULL);

-- Zutaten für Hähnchen-Curry (rezept_id 11)
INSERT INTO zutaten (rezept_id, name, number, einheit) VALUES (11, 'Hähnchenbrustfilet', 600, 'g');
INSERT INTO zutaten (rezept_id, name, number, einheit) VALUES (11, 'Kokosmilch', 400, 'ml');
INSERT INTO zutaten (rezept_id, name, number, einheit) VALUES (11, 'Currypaste', 2, 'EL');
INSERT INTO zutaten (rezept_id, name, number, einheit) VALUES (11, 'Zwiebeln', 1, 'Stück');
INSERT INTO zutaten (rezept_id, name, number, einheit) VALUES (11, 'Paprika', 1, 'Stück');
INSERT INTO zutaten (rezept_id, name, number, einheit) VALUES (11, 'Reis', 300, 'g');
INSERT INTO zutaten (rezept_id, name, number, einheit) VALUES (11, 'Ingwer', 1, 'Stück');
INSERT INTO zutaten (rezept_id, name, number, einheit) VALUES (11, 'Koriander', NULL, NULL);

-- Zutaten für Caesar Salad (rezept_id 12)
INSERT INTO zutaten (rezept_id, name, number, einheit) VALUES (12, 'Römersalat', 1, 'Stück');
INSERT INTO zutaten (rezept_id, name, number, einheit) VALUES (12, 'Parmesan', 80, 'g');
INSERT INTO zutaten (rezept_id, name, number, einheit) VALUES (12, 'Croutons', 100, 'g');
INSERT INTO zutaten (rezept_id, name, number, einheit) VALUES (12, 'Hähnchenbrustfilet', 300, 'g');
INSERT INTO zutaten (rezept_id, name, number, einheit) VALUES (12, 'Caesar Dressing', 100, 'ml');
INSERT INTO zutaten (rezept_id, name, number, einheit) VALUES (12, 'Zitrone', 1, 'Stück');

-- Zutaten für Tomatensuppe (rezept_id 13)
INSERT INTO zutaten (rezept_id, name, number, einheit) VALUES (13, 'Tomaten', 1000, 'g');
INSERT INTO zutaten (rezept_id, name, number, einheit) VALUES (13, 'Zwiebeln', 1, 'Stück');
INSERT INTO zutaten (rezept_id, name, number, einheit) VALUES (13, 'Knoblauch', 2, 'Zehen');
INSERT INTO zutaten (rezept_id, name, number, einheit) VALUES (13, 'Gemüsebrühe', 500, 'ml');
INSERT INTO zutaten (rezept_id, name, number, einheit) VALUES (13, 'Sahne', 100, 'ml');
INSERT INTO zutaten (rezept_id, name, number, einheit) VALUES (13, 'Basilikum', NULL, NULL);

-- Zutaten für Pfannkuchen (rezept_id 14)
INSERT INTO zutaten (rezept_id, name, number, einheit) VALUES (14, 'Mehl', 300, 'g');
INSERT INTO zutaten (rezept_id, name, number, einheit) VALUES (14, 'Milch', 400, 'ml');
INSERT INTO zutaten (rezept_id, name, number, einheit) VALUES (14, 'Eier', 3, 'Stück');
INSERT INTO zutaten (rezept_id, name, number, einheit) VALUES (14, 'Zucker', 2, 'EL');
INSERT INTO zutaten (rezept_id, name, number, einheit) VALUES (14, 'Backpulver', 1, 'TL');
INSERT INTO zutaten (rezept_id, name, number, einheit) VALUES (14, 'Butter', 50, 'g');

-- Zutaten für Guacamole (rezept_id 15)
INSERT INTO zutaten (rezept_id, name, number, einheit) VALUES (15, 'Avocado', 3, 'Stück');
INSERT INTO zutaten (rezept_id, name, number, einheit) VALUES (15, 'Tomaten', 2, 'Stück');
INSERT INTO zutaten (rezept_id, name, number, einheit) VALUES (15, 'Zwiebeln', 1, 'Stück');
INSERT INTO zutaten (rezept_id, name, number, einheit) VALUES (15, 'Limette', 1, 'Stück');
INSERT INTO zutaten (rezept_id, name, number, einheit) VALUES (15, 'Koriander', NULL, NULL);
INSERT INTO zutaten (rezept_id, name, number, einheit) VALUES (15, 'Salz', NULL, NULL);

-- Zutaten für Rührei (rezept_id 16)
INSERT INTO zutaten (rezept_id, name, number, einheit) VALUES (16, 'Eier', 4, 'Stück');
INSERT INTO zutaten (rezept_id, name, number, einheit) VALUES (16, 'Milch', 50, 'ml');
INSERT INTO zutaten (rezept_id, name, number, einheit) VALUES (16, 'Butter', 20, 'g');
INSERT INTO zutaten (rezept_id, name, number, einheit) VALUES (16, 'Salz', NULL, NULL);
INSERT INTO zutaten (rezept_id, name, number, einheit) VALUES (16, 'Pfeffer', NULL, NULL);



-- Asiatische Rezepte für User 1 (03.01.2026)
INSERT INTO rezepte (user_id, name, description) VALUES (1, 'Pad Thai', 'Klassische thailändische gebratene Reisnudeln mit Tamarinde und Erdnüssen');
INSERT INTO rezepte (user_id, name, description) VALUES (1, 'Gebratener Reis mit Gemüse', 'Asiatischer Bratreis mit knackigem Gemüse und Sojasauce');
INSERT INTO rezepte (user_id, name, description) VALUES (1, 'Miso-Suppe', 'Traditionelle japanische Suppe mit Tofu und Wakame');
INSERT INTO rezepte (user_id, name, description) VALUES (1, 'Vietnamesische Sommerrollen', 'Frische Reispapierrollen mit Gemüse und Garnelen');
INSERT INTO rezepte (user_id, name, description) VALUES (1, 'Koreanisches Bibimbap', 'Reisschale mit buntem Gemüse, Ei und Gochujang-Sauce');
INSERT INTO rezepte (user_id, name, description) VALUES (1, 'Thai-Curry mit Tofu', 'Rotes Thai-Curry mit Kokosmilch und frischem Gemüse');

-- Zutaten für Pad Thai (rezept_id 17)
INSERT INTO zutaten (rezept_id, name, number, einheit) VALUES (17, 'Reisnudeln', 250, 'g');
INSERT INTO zutaten (rezept_id, name, number, einheit) VALUES (17, 'Garnelen', 200, 'g');
INSERT INTO zutaten (rezept_id, name, number, einheit) VALUES (17, 'Eier', 2, 'Stück');
INSERT INTO zutaten (rezept_id, name, number, einheit) VALUES (17, 'Sojasprossen', 100, 'g');
INSERT INTO zutaten (rezept_id, name, number, einheit) VALUES (17, 'Frühlingszwiebeln', 3, 'Stück');
INSERT INTO zutaten (rezept_id, name, number, einheit) VALUES (17, 'Erdnüsse', 50, 'g');
INSERT INTO zutaten (rezept_id, name, number, einheit) VALUES (17, 'Tamarindenpaste', 2, 'EL');
INSERT INTO zutaten (rezept_id, name, number, einheit) VALUES (17, 'Fischsauce', 2, 'EL');
INSERT INTO zutaten (rezept_id, name, number, einheit) VALUES (17, 'Knoblauch', 2, 'Zehen');
INSERT INTO zutaten (rezept_id, name, number, einheit) VALUES (17, 'Limette', 1, 'Stück');
INSERT INTO zutaten (rezept_id, name, number, einheit) VALUES (17, 'Palmzucker', 1, 'EL');

-- Zutaten für Gebratener Reis mit Gemüse (rezept_id 18)
INSERT INTO zutaten (rezept_id, name, number, einheit) VALUES (18, 'Reis', 300, 'g');
INSERT INTO zutaten (rezept_id, name, number, einheit) VALUES (18, 'Eier', 2, 'Stück');
INSERT INTO zutaten (rezept_id, name, number, einheit) VALUES (18, 'Karotten', 2, 'Stück');
INSERT INTO zutaten (rezept_id, name, number, einheit) VALUES (18, 'Erbsen', 100, 'g');
INSERT INTO zutaten (rezept_id, name, number, einheit) VALUES (18, 'Mais', 100, 'g');
INSERT INTO zutaten (rezept_id, name, number, einheit) VALUES (18, 'Frühlingszwiebeln', 3, 'Stück');
INSERT INTO zutaten (rezept_id, name, number, einheit) VALUES (18, 'Knoblauch', 2, 'Zehen');
INSERT INTO zutaten (rezept_id, name, number, einheit) VALUES (18, 'Sojasauce', 3, 'EL');
INSERT INTO zutaten (rezept_id, name, number, einheit) VALUES (18, 'Sesamöl', 1, 'TL');
INSERT INTO zutaten (rezept_id, name, number, einheit) VALUES (18, 'Ingwer', 1, 'Stück');

-- Zutaten für Miso-Suppe (rezept_id 19)
INSERT INTO zutaten (rezept_id, name, number, einheit) VALUES (19, 'Misopaste', 3, 'EL');
INSERT INTO zutaten (rezept_id, name, number, einheit) VALUES (19, 'Wasser', 1, 'l');
INSERT INTO zutaten (rezept_id, name, number, einheit) VALUES (19, 'Tofu', 200, 'g');
INSERT INTO zutaten (rezept_id, name, number, einheit) VALUES (19, 'Wakame-Algen', 10, 'g');
INSERT INTO zutaten (rezept_id, name, number, einheit) VALUES (19, 'Frühlingszwiebeln', 2, 'Stück');
INSERT INTO zutaten (rezept_id, name, number, einheit) VALUES (19, 'Dashi-Pulver', 1, 'TL');

-- Zutaten für Vietnamesische Sommerrollen (rezept_id 20)
INSERT INTO zutaten (rezept_id, name, number, einheit) VALUES (20, 'Reispapier', 12, 'Blätter');
INSERT INTO zutaten (rezept_id, name, number, einheit) VALUES (20, 'Garnelen', 250, 'g');
INSERT INTO zutaten (rezept_id, name, number, einheit) VALUES (20, 'Reisnudeln', 100, 'g');
INSERT INTO zutaten (rezept_id, name, number, einheit) VALUES (20, 'Salat', 1, 'Kopf');
INSERT INTO zutaten (rezept_id, name, number, einheit) VALUES (20, 'Gurke', 1, 'Stück');
INSERT INTO zutaten (rezept_id, name, number, einheit) VALUES (20, 'Karotten', 2, 'Stück');
INSERT INTO zutaten (rezept_id, name, number, einheit) VALUES (20, 'Minze', 1, 'Bund');
INSERT INTO zutaten (rezept_id, name, number, einheit) VALUES (20, 'Koriander', 1, 'Bund');
INSERT INTO zutaten (rezept_id, name, number, einheit) VALUES (20, 'Erdnusssauce', 100, 'ml');

-- Zutaten für Koreanisches Bibimbap (rezept_id 21)
INSERT INTO zutaten (rezept_id, name, number, einheit) VALUES (21, 'Reis', 400, 'g');
INSERT INTO zutaten (rezept_id, name, number, einheit) VALUES (21, 'Rindfleisch', 200, 'g');
INSERT INTO zutaten (rezept_id, name, number, einheit) VALUES (21, 'Spinat', 200, 'g');
INSERT INTO zutaten (rezept_id, name, number, einheit) VALUES (21, 'Karotten', 2, 'Stück');
INSERT INTO zutaten (rezept_id, name, number, einheit) VALUES (21, 'Zucchini', 1, 'Stück');
INSERT INTO zutaten (rezept_id, name, number, einheit) VALUES (21, 'Sojasprossen', 100, 'g');
INSERT INTO zutaten (rezept_id, name, number, einheit) VALUES (21, 'Eier', 4, 'Stück');
INSERT INTO zutaten (rezept_id, name, number, einheit) VALUES (21, 'Gochujang', 3, 'EL');
INSERT INTO zutaten (rezept_id, name, number, einheit) VALUES (21, 'Sesamöl', 2, 'EL');
INSERT INTO zutaten (rezept_id, name, number, einheit) VALUES (21, 'Knoblauch', 3, 'Zehen');
INSERT INTO zutaten (rezept_id, name, number, einheit) VALUES (21, 'Sojasauce', 2, 'EL');

-- Zutaten für Thai-Curry mit Tofu (rezept_id 22)
INSERT INTO zutaten (rezept_id, name, number, einheit) VALUES (22, 'Tofu', 400, 'g');
INSERT INTO zutaten (rezept_id, name, number, einheit) VALUES (22, 'Kokosmilch', 400, 'ml');
INSERT INTO zutaten (rezept_id, name, number, einheit) VALUES (22, 'Rote Currypaste', 3, 'EL');
INSERT INTO zutaten (rezept_id, name, number, einheit) VALUES (22, 'Paprika', 2, 'Stück');
INSERT INTO zutaten (rezept_id, name, number, einheit) VALUES (22, 'Zucchini', 1, 'Stück');
INSERT INTO zutaten (rezept_id, name, number, einheit) VALUES (22, 'Bambussprossen', 100, 'g');
INSERT INTO zutaten (rezept_id, name, number, einheit) VALUES (22, 'Thai-Basilikum', 1, 'Bund');
INSERT INTO zutaten (rezept_id, name, number, einheit) VALUES (22, 'Fischsauce', 2, 'EL');
INSERT INTO zutaten (rezept_id, name, number, einheit) VALUES (22, 'Limette', 1, 'Stück');
INSERT INTO zutaten (rezept_id, name, number, einheit) VALUES (22, 'Reis', 300, 'g');

-- Rezept Anleitungen --
INSERT INTO rezept_anleitung (rezept_id, step_number, text) VALUES (1, 1, 'Mehl in die Schüssel');
