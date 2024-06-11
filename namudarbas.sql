CREATE TABLE Vartotojai (
    VartotojoID INT PRIMARY KEY,
    VartotojoVardas VARCHAR(100),
    VartotojoElPastas VARCHAR(100),
    VartotojoSlaptazodis VARCHAR(100),
    PrisijungimoData DATE
);

CREATE TABLE Produktai (
    ProduktoID INT PRIMARY KEY,
    ProduktoPavadinimas VARCHAR(100),
    ProduktoKategorija VARCHAR(100),
    ProduktoKaina DECIMAL(10, 2),
    ProduktoLikutis INT
);

CREATE TABLE Uzsakymai (
    UzsakymoID INT PRIMARY KEY,
    VartotojoID INT,
    UzsakymoData DATE,
    BendraSuma DECIMAL(10, 2),
    FOREIGN KEY (VartotojoID) REFERENCES Vartotojai(VartotojoID)
);

CREATE TABLE UzsakymoDetalės (
    DetalesID INT PRIMARY KEY,
    UzsakymoID INT,
    ProduktoID INT,
    Kiekis INT,
    Kaina DECIMAL(10, 2),
    FOREIGN KEY (UzsakymoID) REFERENCES Uzsakymai(UzsakymoID),
    FOREIGN KEY (ProduktoID) REFERENCES Produktai(ProduktoID)
);

INSERT INTO Vartotojai (VartotojoID, VartotojoVardas, VartotojoElPastas, VartotojoSlaptazodis, PrisijungimoData) VALUES
(1, 'Jonas Jonaitis', 'jonas@example.com', 'slaptazodis123', '2023-01-01'),
(2, 'Jana Jankauskaitė', 'jana@example.com', 'slaptazodis456', '2023-02-01'),
(3, 'Alytė Alauskaitė', 'alyte@example.com', 'slaptazodis789', '2023-03-01'),
(4, 'Benas Benaitis', 'benas@example.com', 'slaptazodis101', '2023-04-01'),
(5, 'Karolis Karalauskas', 'karolis@example.com', 'slaptazodis102', '2023-05-01'),
(6, 'Deividas Deividaitis', 'deividas@example.com', 'slaptazodis103', '2023-06-01'),
(7, 'Eglė Eglaitė', 'egle@example.com', 'slaptazodis104', '2023-07-01'),
(8, 'Frankas Frankaitis', 'frankas@example.com', 'slaptazodis105', '2023-08-01'),
(9, 'Giedrė Giedraitė', 'giedre@example.com', 'slaptazodis106', '2023-09-01'),
(10, 'Henrikas Henraitis', 'henrikas@example.com', 'slaptazodis107', '2023-10-01');

INSERT INTO Produktai (ProduktoID, ProduktoPavadinimas, ProduktoKategorija, ProduktoKaina, ProduktoLikutis) VALUES
(1, 'Produktas A', 'Kategorija 1', 19.99, 100),
(2, 'Produktas B', 'Kategorija 1', 29.99, 200),
(3, 'Produktas C', 'Kategorija 2', 39.99, 150),
(4, 'Produktas D', 'Kategorija 2', 49.99, 120),
(5, 'Produktas E', 'Kategorija 3', 59.99, 80),
(6, 'Produktas F', 'Kategorija 3', 69.99, 60),
(7, 'Produktas G', 'Kategorija 4', 79.99, 40),
(8, 'Produktas H', 'Kategorija 4', 89.99, 30),
(9, 'Produktas I', 'Kategorija 5', 99.99, 20),
(10, 'Produktas J', 'Kategorija 5', 109.99, 10);

INSERT INTO Uzsakymai (UzsakymoID, VartotojoID, UzsakymoData, BendraSuma) VALUES
(1, 1, '2023-05-10', 199.90),
(2, 2, '2023-06-15', 299.85),
(3, 3, '2023-07-20', 399.80),
(4, 4, '2023-08-25', 499.75),
(5, 5, '2023-09-30', 599.70),
(6, 6, '2023-10-05', 699.65),
(7, 7, '2023-11-10', 799.60),
(8, 8, '2023-12-15', 899.55),
(9, 9, '2024-01-20', 999.50),
(10, 10, '2024-02-25', 1099.45);

INSERT INTO UzsakymoDetalės (DetalesID, UzsakymoID, ProduktoID, Kiekis, Kaina) VALUES
(1, 1, 1, 2, 19.99),
(2, 1, 2, 3, 29.99),
(3, 2, 3, 4, 39.99),
(4, 2, 4, 5, 49.99),
(5, 3, 5, 6, 59.99),
(6, 3, 6, 7, 69.99),
(7, 4, 7, 8, 79.99),
(8, 4, 8, 9, 89.99),
(9, 5, 9, 10, 99.99),
(10, 5, 10, 11, 109.99);

SELECT VartotojoVardas, YEAR(PrisijungimoData) AS PrisijungimoMetai FROM Vartotojai;


SELECT ProduktoKategorija, SUM(ProduktoKaina) AS BendraKaina FROM Produktai GROUP BY ProduktoKategorija;


SELECT COUNT(DISTINCT VartotojoID) AS UnikalūsVartotojai FROM Uzsakymai;


SELECT VartotojoVardas, AVG(BendraSuma) AS VidutinėUzsakymoSuma FROM Uzsakymai JOIN Vartotojai ON Uzsakymai.VartotojoID = Vartotojai.VartotojoID GROUP BY VartotojoVardas;


SELECT ProduktoPavadinimas, ProduktoKaina FROM Produktai ORDER BY ProduktoKaina DESC;


SELECT VartotojoVardas, COUNT(UzsakymoID) AS UzsakymuKiekis FROM Uzsakymai JOIN Vartotojai ON Uzsakymai.VartotojoID = Vartotojai.VartotojoID GROUP BY VartotojoVardas;


SELECT VartotojoVardas, MAX(BendraSuma) AS DidžiausiaUzsakymoSuma FROM Uzsakymai JOIN Vartotojai ON Uzsakymai.VartotojoID = Vartotojai.VartotojoID GROUP BY VartotojoVardas;


SELECT ProduktoKategorija, MIN(ProduktoKaina) AS MažiausiaKaina FROM Produktai GROUP BY ProduktoKategorija;


SELECT UzsakymoData, SUM(BendraSuma) AS DienosBendraSuma FROM Uzsakymai GROUP BY UzsakymoData ORDER BY DienosBendraSuma DESC;


SELECT ProduktoPavadinimas, COUNT(UzsakymoDetalės.ProduktoID) AS UžsakytasKiekis FROM UzsakymoDetalės JOIN Produktai ON UzsakymoDetalės.ProduktoID = Produktai.ProduktoID GROUP BY ProduktoPavadinimas;

SELECT * FROM Vartotojai WHERE VartotojoVardas LIKE 'J%';


SELECT * FROM Produktai WHERE ProduktoKaina BETWEEN 20 AND 50;


SELECT * FROM Uzsakymai WHERE UzsakymoData IS NOT NULL;


SELECT * FROM Uzsakymai WHERE BendraSuma > 500;


SELECT * FROM Vartotojai WHERE VartotojoID IN (SELECT VartotojoID FROM Uzsakymai);


SELECT ProduktoKategorija, COUNT(*) AS ProduktuKiekis FROM Produktai GROUP BY ProduktoKategorija;


SELECT ProduktoKategorija, AVG(ProduktoKaina) AS VidutineKaina FROM Produktai GROUP BY ProduktoKategorija HAVING AVG(ProduktoKaina) > 50;


SELECT * FROM Vartotojai WHERE VartotojoElPastas LIKE '%@example.com';


SELECT VartotojoVardas, SUM(BendraSuma) AS BendraIsleistaSuma FROM Uzsakymai JOIN Vartotojai ON Uzsakymai.VartotojoID = Vartotojai.VartotojoID GROUP BY VartotojoVardas HAVING SUM(BendraIsleistaSuma) > 1000;


SELECT * FROM Produktai WHERE ProduktoLikutis < 50 AND ProduktoKategorija = 'Kategorija 5';

UPDATE Vartotojai SET VartotojoElPastas = 'jonas_jonaitis@example.com' WHERE VartotojoID = 1;
UPDATE Vartotojai SET VartotojoElPastas = 'jana_jankauskaite@example.com' WHERE VartotojoID = 2;
UPDATE Vartotojai SET VartotojoElPastas = 'alyte_alauskaite@example.com' WHERE VartotojoID = 3;
UPDATE Vartotojai SET VartotojoElPastas = 'benas_benaitis@example.com' WHERE VartotojoID = 4;
UPDATE Vartotojai SET VartotojoElPastas = 'karolis_karalauskas@example.com' WHERE VartotojoID = 5;
UPDATE Vartotojai SET VartotojoElPastas = 'deividas_deividaitis@example.com' WHERE VartotojoID = 6;
UPDATE Vartotojai SET VartotojoElPastas = 'egle_eglaite@example.com' WHERE VartotojoID = 7;
UPDATE Vartotojai SET VartotojoElPastas = 'frankas_frankaitis@example.com' WHERE VartotojoID = 8;
UPDATE Vartotojai SET VartotojoElPastas = 'giedre_giedraite@example.com' WHERE VartotojoID = 9;
UPDATE Vartotojai SET VartotojoElPastas = 'henrikas_henraitis@example.com' WHERE VartotojoID = 10;


DELETE FROM UzsakymoDetalės WHERE DetalesID = 1;
DELETE FROM UzsakymoDetalės WHERE DetalesID = 2;
DELETE FROM UzsakymoDetalės WHERE DetalesID = 3;
DELETE FROM UzsakymoDetalės WHERE DetalesID = 4;
DELETE FROM UzsakymoDetalės WHERE DetalesID = 5;
DELETE FROM UzsakymoDetalės WHERE DetalesID = 6;
DELETE FROM UzsakymoDetalės WHERE DetalesID = 7;
DELETE FROM UzsakymoDetalės WHERE DetalesID = 8;
DELETE FROM UzsakymoDetalės WHERE DetalesID = 9;
DELETE FROM UzsakymoDetalės WHERE DetalesID = 10;


CREATE VIEW VartotojuUzsakymai AS
SELECT Vartotojai.VartotojoID, Vartotojai.VartotojoVardas, Uzsakymai.UzsakymoID, Uzsakymai.UzsakymoData, Uzsakymai.BendraSuma
FROM Vartotojai
JOIN Uzsakymai ON Vartotojai.VartotojoID = Uzsakymai.VartotojoID;

CREATE VIEW ProduktuPardavimai AS
SELECT Produktai.ProduktoID, Produktai.ProduktoPavadinimas, SUM(UzsakymoDetalės.Kiekis) AS ParduotųKiekis
FROM Produktai
JOIN UzsakymoDetalės ON Produktai.ProduktoID = UzsakymoDetalės.ProduktoID
GROUP BY Produktai.ProduktoID, Produktai.ProduktoPavadinimas;

SELECT Vartotojai.VartotojoVardas, Uzsakymai.UzsakymoData
FROM Vartotojai
JOIN Uzsakymai ON Vartotojai.VartotojoID = Uzsakymai.VartotojoID;


SELECT Vartotojai.VartotojoVardas, Produktai.ProduktoPavadinimas, UzsakymoDetalės.Kiekis
FROM Vartotojai
JOIN Uzsakymai ON Vartotojai.VartotojoID = Uzsakymai.VartotojoID
JOIN UzsakymoDetalės ON Uzsakymai.UzsakymoID = UzsakymoDetalės.UzsakymoID
JOIN Produktai ON UzsakymoDetalės.ProduktoID = Produktai.ProduktoID;


SELECT Vartotojai.VartotojoVardas, Produktai.ProduktoPavadinimas, UzsakymoDetalės.Kiekis, Uzsakymai.UzsakymoData
FROM Vartotojai
JOIN Uzsakymai ON Vartotojai.VartotojoID = Uzsakymai.VartotojoID
JOIN UzsakymoDetalės ON Uzsakymai.UzsakymoID = UzsakymoDetalės.UzsakymoID
JOIN Produktai ON UzsakymoDetalės.ProduktoID = Produktai.ProduktoID;


SELECT Vartotojai.VartotojoVardas, Produktai.ProduktoPavadinimas, UzsakymoDetalės.Kiekis, Uzsakymai.UzsakymoData, Uzsakymai.BendraSuma
FROM Vartotojai
JOIN Uzsakymai ON Vartotojai.VartotojoID = Uzsakymai.VartotojoID
JOIN UzsakymoDetalės ON Uzsakymai.UzsakymoID = UzsakymoDetalės.UzsakymoID
JOIN Produktai ON UzsakymoDetalės.ProduktoID = Produktai.ProduktoID;
SELECT VartotojoVardas, BendraSuma,
CASE
    WHEN BendraSuma > 1000 THEN 'Didelė suma'
    WHEN BendraSuma BETWEEN 500 AND 1000 THEN 'Vidutinė suma'
    ELSE 'Maža suma'
END AS SumaKategorija
FROM Uzsakymai
JOIN Vartotojai ON Uzsakymai.VartotojoID = Vartotojai.VartotojoID;
ProduktoKategorija