-- Zubereitungsschritte für die Rezepte

-- Pizza (id=1)
INSERT INTO rezept_anleitung (rezept_id, step_number, text) VALUES 
(1, 1, 'Mehl in eine Schüssel geben und in der Mitte eine Mulde formen. Hefe hineinbröckeln und mit etwas lauwarmem Wasser auflösen.'),
(1, 2, 'Salz, Olivenöl und restliches Wasser hinzufügen. Alles zu einem glatten Teig verkneten.'),
(1, 3, 'Teig zugedeckt an einem warmen Ort 60 Minuten gehen lassen, bis er sich verdoppelt hat.'),
(1, 4, 'Backofen auf 250°C Ober-/Unterhitze vorheizen.'),
(1, 5, 'Teig auf einer bemehlten Fläche ausrollen, mit Tomatensauce bestreichen und nach Belieben belegen.'),
(1, 6, 'Pizza 12-15 Minuten backen, bis der Rand goldbraun ist.');

-- Spaghetti (id=2)
INSERT INTO rezept_anleitung (rezept_id, step_number, text) VALUES 
(2, 1, 'Einen großen Topf mit Wasser zum Kochen bringen und großzügig salzen.'),
(2, 2, 'Spaghetti ins kochende Wasser geben und nach Packungsanleitung al dente kochen.'),
(2, 3, 'Pasta abgießen und dabei eine Tasse Nudelwasser aufbewahren.'),
(2, 4, 'Butter in die heiße Pasta geben und gut durchmischen. Bei Bedarf etwas Nudelwasser hinzufügen.');

-- Tomatensauce (id=3)
INSERT INTO rezept_anleitung (rezept_id, step_number, text) VALUES 
(3, 1, 'Tomaten waschen und grob würfeln. Zwiebel und Knoblauch fein hacken.'),
(3, 2, 'Olivenöl in einem Topf erhitzen und Zwiebel glasig dünsten.'),
(3, 3, 'Knoblauch kurz mitdünsten, dann Tomatenwürfel hinzufügen.'),
(3, 4, 'Mit Salz, Pfeffer und Kräutern würzen. Bei mittlerer Hitze 20-30 Minuten köcheln lassen.'),
(3, 5, 'Nach Belieben pürieren oder als stückige Sauce servieren.');

-- Cinque Pi (id=5)
INSERT INTO rezept_anleitung (rezept_id, step_number, text) VALUES 
(5, 1, 'Pasta in reichlich Salzwasser nach Packungsanleitung al dente kochen.'),
(5, 2, 'In der Zwischenzeit Halbrahm in einer Pfanne erhitzen und Tomatenpüree einrühren.'),
(5, 3, 'Parmesan und Peterli unterrühren. Mit Muskatnuss, Salz und Pfeffer abschmecken.'),
(5, 4, 'Pasta abgießen und direkt in die Sauce geben. Gut durchmischen und servieren.');

-- Armer Ritter (id=6)
INSERT INTO rezept_anleitung (rezept_id, step_number, text) VALUES 
(6, 1, 'Ei und Milch in einem tiefen Teller verquirlen.'),
(6, 2, 'Brotscheiben in der Ei-Milch-Mischung wenden und gut einweichen lassen.'),
(6, 3, 'Butter in einer Pfanne erhitzen.'),
(6, 4, 'Brotscheiben von beiden Seiten goldbraun braten.'),
(6, 5, 'Mit Zucker und Zimt bestreuen und warm servieren.');

-- Bruschetta (id=7)
INSERT INTO rezept_anleitung (rezept_id, step_number, text) VALUES 
(7, 1, 'Tomaten waschen, entkernen und in kleine Würfel schneiden.'),
(7, 2, 'Knoblauchzehe schälen und fein hacken. Mit Olivenöl, Salz und Pfeffer zu den Tomaten geben.'),
(7, 3, 'Basilikum waschen, hacken und untermischen. Mindestens 15 Minuten ziehen lassen.'),
(7, 4, 'Brotscheiben toasten oder grillen, bis sie knusprig sind.'),
(7, 5, 'Tomatenmischung auf die gerösteten Brotscheiben geben und sofort servieren.');

-- Tortilla de Patatas (id=8)
INSERT INTO rezept_anleitung (rezept_id, step_number, text) VALUES 
(8, 1, 'Kartoffeln schälen und in dünne Scheiben schneiden. Zwiebel fein würfeln.'),
(8, 2, 'Reichlich Olivenöl in einer Pfanne erhitzen und Kartoffeln mit Zwiebeln darin langsam garen, bis sie weich sind.'),
(8, 3, 'Eier in einer Schüssel verquirlen und mit Salz und Pfeffer würzen.'),
(8, 4, 'Kartoffeln und Zwiebeln abgießen und zu den Eiern geben. Gut vermengen.'),
(8, 5, 'Etwas Öl in der Pfanne erhitzen und die Ei-Kartoffel-Masse hineingeben. Bei mittlerer Hitze stocken lassen.'),
(8, 6, 'Tortilla mit einem Teller wenden und von der anderen Seite goldbraun braten.');

-- Spaghetti Bolognese (id=10)
INSERT INTO rezept_anleitung (rezept_id, step_number, text) VALUES 
(10, 1, 'Zwiebeln und Knoblauch fein hacken.'),
(10, 2, 'Olivenöl in einem großen Topf erhitzen und Hackfleisch krümelig anbraten.'),
(10, 3, 'Zwiebeln und Knoblauch hinzufügen und glasig dünsten.'),
(10, 4, 'Tomaten (gewürfelt oder passiert) hinzufügen. Mit Salz und Pfeffer würzen.'),
(10, 5, 'Sauce bei niedriger Hitze mindestens 30 Minuten köcheln lassen.'),
(10, 6, 'Spaghetti in Salzwasser al dente kochen, abgießen und mit der Sauce servieren.');

-- Hähnchen-Curry (id=11)
INSERT INTO rezept_anleitung (rezept_id, step_number, text) VALUES 
(11, 1, 'Hähnchenbrustfilet in mundgerechte Stücke schneiden. Zwiebel, Paprika und Ingwer klein schneiden.'),
(11, 2, 'Reis nach Packungsanleitung kochen.'),
(11, 3, 'Öl in einer Pfanne erhitzen und Hähnchen von allen Seiten anbraten. Herausnehmen.'),
(11, 4, 'Zwiebeln, Paprika und Ingwer im selben Topf anbraten. Currypaste hinzufügen und kurz mitbraten.'),
(11, 5, 'Kokosmilch hinzufügen und aufkochen lassen. Hähnchen wieder hinzugeben.'),
(11, 6, 'Bei mittlerer Hitze 15-20 Minuten köcheln lassen. Mit Reis servieren und mit Koriander garnieren.');

-- Pad Thai (id=17)
INSERT INTO rezept_anleitung (rezept_id, step_number, text) VALUES 
(17, 1, 'Reisnudeln nach Packungsanleitung in warmem Wasser einweichen.'),
(17, 2, 'Tamarindenpaste, Fischsauce und Palmzucker zu einer Sauce mischen.'),
(17, 3, 'Öl in einem Wok erhitzen. Knoblauch kurz anbraten, dann Garnelen hinzufügen und garen.'),
(17, 4, 'Eier aufschlagen und im Wok rühren, bis sie stocken.'),
(17, 5, 'Abgetropfte Nudeln und die Sauce hinzufügen. Alles gut durchschwenken.'),
(17, 6, 'Frühlingszwiebeln und Sojasprossen unterrühren. Mit Erdnüssen und Limette servieren.');

-- Gebratener Reis mit Gemüse (id=18)
INSERT INTO rezept_anleitung (rezept_id, step_number, text) VALUES 
(18, 1, 'Reis am Vortag kochen und im Kühlschrank aufbewahren (kalter Reis funktioniert am besten).'),
(18, 2, 'Karotten schälen und würfeln. Knoblauch und Ingwer fein hacken. Frühlingszwiebeln in Ringe schneiden.'),
(18, 3, 'Öl im Wok erhitzen. Eier aufschlagen und zu Rührei verarbeiten. Herausnehmen.'),
(18, 4, 'Mehr Öl hinzufügen. Knoblauch und Ingwer kurz anbraten.'),
(18, 5, 'Karotten, Erbsen und Mais hinzufügen und unter Rühren braten.'),
(18, 6, 'Kalten Reis hinzufügen und alles gut durchbraten. Sojasauce und Sesamöl unterrühren.'),
(18, 7, 'Rührei und Frühlingszwiebeln untermischen. Sofort servieren.');

-- Miso-Suppe (id=19)
INSERT INTO rezept_anleitung (rezept_id, step_number, text) VALUES 
(19, 1, 'Wasser in einem Topf zum Kochen bringen und Dashi-Pulver einrühren.'),
(19, 2, 'Tofu in kleine Würfel schneiden. Wakame-Algen in warmem Wasser einweichen.'),
(19, 3, 'Frühlingszwiebeln in feine Ringe schneiden.'),
(19, 4, 'Misopaste in etwas Brühe auflösen (nicht kochen, sonst verliert sie Aroma).'),
(19, 5, 'Aufgelöste Misopaste in die Brühe rühren. Tofu, abgetropfte Wakame und Frühlingszwiebeln hinzufügen.'),
(19, 6, 'Kurz ziehen lassen und sofort servieren.');

-- Vietnamesische Sommerrollen (id=20)
INSERT INTO rezept_anleitung (rezept_id, step_number, text) VALUES 
(20, 1, 'Reisnudeln nach Packungsanleitung kochen, abgießen und abkühlen lassen.'),
(20, 2, 'Garnelen kochen, schälen und halbieren. Gemüse in feine Streifen schneiden.'),
(20, 3, 'Salat, Minze und Koriander waschen und trocken tupfen.'),
(20, 4, 'Reispapier einzeln kurz in warmes Wasser tauchen, bis es weich ist.'),
(20, 5, 'Auf das Reispapier nacheinander Salat, Nudeln, Gemüse, Kräuter und Garnelen legen.'),
(20, 6, 'Reispapier fest einrollen und mit Erdnusssauce servieren.');

-- Thai-Curry mit Tofu (id=22)
INSERT INTO rezept_anleitung (rezept_id, step_number, text) VALUES 
(22, 1, 'Tofu in Würfel schneiden und mit Küchenpapier trocken tupfen.'),
(22, 2, 'Paprika und Zucchini in mundgerechte Stücke schneiden.'),
(22, 3, 'Reis nach Packungsanleitung kochen.'),
(22, 4, 'Etwas Öl in einem Wok oder Topf erhitzen. Currypaste kurz anbraten, bis sie duftet.'),
(22, 5, 'Kokosmilch hinzufügen und aufkochen lassen. Tofu und Gemüse hinzufügen.'),
(22, 6, '10-15 Minuten köcheln lassen. Bambussprossen und Thai-Basilikum unterrühren.'),
(22, 7, 'Mit Fischsauce und Limettensaft abschmecken. Mit Reis servieren.');

-- Pfannkuchen (id=14)
INSERT INTO rezept_anleitung (rezept_id, step_number, text) VALUES 
(14, 1, 'Mehl, Backpulver und Zucker in einer Schüssel vermischen.'),
(14, 2, 'Milch und Eier in einer separaten Schüssel verquirlen.'),
(14, 3, 'Flüssige Zutaten zu den trockenen geben und zu einem glatten Teig verrühren.'),
(14, 4, 'Geschmolzene Butter unterrühren.'),
(14, 5, 'Butter in einer Pfanne erhitzen. Kleine Portionen Teig hineingeben.'),
(14, 6, 'Pfannkuchen von beiden Seiten goldbraun backen. Mit Ahornsirup oder Früchten servieren.');

-- Rührei (id=16)
INSERT INTO rezept_anleitung (rezept_id, step_number, text) VALUES 
(16, 1, 'Eier in eine Schüssel aufschlagen und mit Milch, Salz und Pfeffer verquirlen.'),
(16, 2, 'Butter in einer beschichteten Pfanne bei mittlerer Hitze schmelzen lassen.'),
(16, 3, 'Eiermischung in die Pfanne geben.'),
(16, 4, 'Mit einem Holzlöffel langsam rühren, bis das Ei cremig gestockt ist.'),
(16, 5, 'Sofort vom Herd nehmen und warm servieren.');

-- Guacamole (id=15)
INSERT INTO rezept_anleitung (rezept_id, step_number, text) VALUES 
(15, 1, 'Avocados halbieren, entkernen und das Fruchtfleisch mit einem Löffel herausnehmen.'),
(15, 2, 'Tomaten und Zwiebeln fein würfeln.'),
(15, 3, 'Avocado mit einer Gabel grob zerdrücken.'),
(15, 4, 'Tomaten und Zwiebeln unterrühren. Limettensaft hinzufügen.'),
(15, 5, 'Mit Salz abschmecken und gehackten Koriander unterrühren. Sofort servieren.');

-- Tomatensuppe (id=13)
INSERT INTO rezept_anleitung (rezept_id, step_number, text) VALUES 
(13, 1, 'Tomaten waschen und grob würfeln. Zwiebeln und Knoblauch fein hacken.'),
(13, 2, 'Etwas Öl in einem Topf erhitzen. Zwiebeln und Knoblauch glasig dünsten.'),
(13, 3, 'Tomatenwürfel hinzufügen und kurz mitdünsten.'),
(13, 4, 'Gemüsebrühe hinzufügen und 20 Minuten köcheln lassen.'),
(13, 5, 'Suppe mit einem Stabmixer pürieren. Sahne einrühren.'),
(13, 6, 'Mit Salz und Pfeffer abschmecken. Mit Basilikum garnieren und servieren.');
