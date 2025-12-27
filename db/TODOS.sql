CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(250) NOT NULL UNIQUE,
    password VARCHAR(250) NOT NULL
);

CREATE TABLE rezepte (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    name VARCHAR(250) NOT NULL,
    description VARCHAR(250) NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE zutaten (
    id INT AUTO_INCREMENT PRIMARY KEY,
    rezept_id INT NOT NULL,
    name VARCHAR(250) NOT NULL,
    number INT,
    einheit VARCHAR(50),
    FOREIGN KEY (rezept_id) REFERENCES rezepte(id)
);

-- Beschreibungen von jedem Rezept (kann man noch ändern)
INSERT INTO rezepte (user_id, name, description) VALUES (1, 'Pizza', 'Klassischer Pizzateig mit Tomatensauce und Käse');
INSERT INTO rezepte (user_id, name, description) VALUES (1, 'Spaghetti', 'Spaghetti mit Butter - Kindheistklassiker');
INSERT INTO rezepte (user_id, name, description) VALUES (1, 'Tomatensauce', 'Frische Tomatensauce von scratch');
INSERT INTO rezepte (user_id, name, description) VALUES (1, 'toms Erdbeermarmeladenbrot mit Honig', 'Kindheitsklassiker');
INSERT INTO rezepte (user_id, name, description) VALUES (1, 'Cinque Pi', 'Cremige Pasta mit Rahm-Tomatensauce');
INSERT INTO rezepte (user_id, name, description) VALUES (1, 'Armer Ritter', 'Einfaches süsses Frühstück');
INSERT INTO rezepte (user_id, name, description) VALUES (1, 'Bruschetta', 'Klassische italienische Häpchenkost');
INSERT INTO rezepte (user_id, name, description) VALUES (1, 'tortilla de patatas', 'Traditioneller spanischer Klassiker');
INSERT INTO rezepte (user_id, name, description) VALUES (1, 'Bratkartoffeln', 'Knusprige Kartoffelwürfel, perfekt als Beilage');

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