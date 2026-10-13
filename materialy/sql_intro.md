# Úvod do SQL: První kroky v MariaDB

```
mysql -u root
```

## 1. Založení databáze

**Upozornění:** Nezapomínejte psát na konec každého příkazu středník `;`!

```
-- 1. Vytvoření prázdné databáze
CREATE DATABASE muj_eshop;

-- 2. Přepnutí se do naší nové databáze (Kriticky důležitý krok!)
USE muj_eshop;

```

## 2. Vytvoření první tabulky (CREATE TABLE)

```
CREATE TABLE Produkt (
    ID_Produktu INT PRIMARY KEY AUTO_INCREMENT,
    Nazev VARCHAR(50),
    Cena INT
);

```

## 3. Plnění tabulky daty (INSERT INTO)

```
-- Vložení jednoho produktu
INSERT INTO Produkt (Nazev, Cena) 
VALUES ('Notebook', 15000);

-- Vložení více produktů najednou (oddělujeme čárkou)
INSERT INTO Produkt (Nazev, Cena) 
VALUES 
('Bezdrátová myš', 500),
('Mechanická klávesnice', 1200),
('Herní monitor', 4500);

```

## 4. Dolování dat z databáze (SELECT)

```
-- 1. Vypiš všechno (Znak * znamená VŠECHNY SLOUPCE)
SELECT * FROM Produkt;

-- 2. Vypiš jen názvy produktů (Nechci vidět ID ani cenu)
SELECT Nazev FROM Produkt;

-- 3. Vypiš jen levné produkty (Kde je cena menší než 2000)
SELECT Nazev, Cena 
FROM Produkt 
WHERE Cena < 2000;

```

## 5.

**Krok 1: Vytvořte tabulku `Zakaznik`**
Tabulka bude mít tyto tři sloupce:

* `ID_Zakaznika` (celé číslo, primární klíč, automatické číslování)

* `Jmeno` (text o délce max 50 znaků)

* `Mesto` (text o délce max 50 znaků)

**Krok 2: Naplňte tabulku daty**
Pomocí příkazu `INSERT INTO` přidejte do tabulky alespoň **3 libovolné zákazníky** (např. Jan Novák z Prahy, Eva Malá z Brna...).

**Krok 3: Zkontrolujte svou práci**
Napište dotaz (`SELECT`), který vypíše úplně celý obsah vaší nové tabulky `Zakaznik`,