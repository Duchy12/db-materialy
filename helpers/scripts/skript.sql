-- 1. Příprava čisté databáze
DROP DATABASE IF EXISTS muj_eshop;
CREATE DATABASE muj_eshop;
USE muj_eshop;

-- 2. Vytvoření tabulky s pojistkou
DROP TABLE IF EXISTS Produkt;
CREATE TABLE Produkt (
    ID_Produktu INT PRIMARY KEY AUTO_INCREMENT,
    Nazev VARCHAR(50),
    Cena INT
);