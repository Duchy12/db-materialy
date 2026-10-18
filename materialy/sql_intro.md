# Úvod do SQL: První kroky v MariaDB

```powershell
mysql -u root
```
## 0. Jak psát a spouštět "kód" (Příkaz SOURCE)

Psát každý příkaz ručně do konzole je zdlouhavé a při překlepu se musí psát vše znovu. Proto budeme kód psát do textového editoru (např. VS Code, Poznámkový blok), uložíme si ho např. na plochu jako skript.sql a databázi řekneme, ať ho celý přečte najednou.



V konzoli pro spuštění skriptu slouží příkaz SOURCE a cestu k souboru:

```sql
-- Cestu si upravte
SOURCE C:/Users/Student/Desktop/skript.sql;
```


## 1. Založení databáze

**Upozornění:** Nezapomínejte psát na konec každého příkazu středník `;`!

```sql
-- 1. Vytvoření prázdné databáze
CREATE DATABASE muj_eshop;

-- 2. Přepnutí se do naší nové databáze (Kriticky důležitý krok!)
USE muj_eshop;

```

## 2. Vytvoření první tabulky (CREATE TABLE)

```sql
CREATE TABLE Produkt (
    ID_Produktu INT PRIMARY KEY AUTO_INCREMENT,
    Nazev VARCHAR(50),
    Cena INT
);

```

## 3. Plnění tabulky daty (INSERT INTO)

```sql
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

## 4. Dotazování dat z databáze (SELECT)

```sql
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


## 6. Hromadný import dat (CSV)

Při vyplňování nove tabulky, popř. migraci je nesmysl zadávat ručně. Místo toho jdou importovat nejen z CSV (Comma separated values) souborů.

```
Nazev,Cena
Herní sluchátka,1500
Podložka pod myš,300
Webkamera,800
```

```sql
LOAD DATA INFILE 'C:/Users/Student/Desktop/produkty.csv'
INTO TABLE Produkt
FIELDS TERMINATED BY ',' -- Čím jsou sloupce v souboru odděleny
LINES TERMINATED BY '\n' -- Čím končí nový řádek (newline)
IGNORE 1 ROWS            -- Přeskočí první řádek (hlavičku s názvy sloupců)
(Nazev, Cena);           -- Říkáme, do jakých sloupců se mají data nalít
```
Notes: [Co je to newline?](https://en.wikipedia.org/wiki/Newline), [CSV Soubory](https://github.com/Duchy12/db-materialy/blob/main/materialy/csv.md)


## 7. Export do CSV (Dump)

Import známe. Co export?
K tomu slouží klauzule `INTO OUTFILE`
Tímto příkazem vyexportujeme všechny naše produkty do nového souboru:

```sql
SELECT * FROM Produkt
INTO OUTFILE 'C:/Users/Student/Desktop/export_produktu.csv'
FIELDS TERMINATED BY ','
ENCLOSED BY '"'          -- Obalí texty do uvozovek (kdyby byl v názvu omylem znak čárky)
LINES TERMINATED BY '\n';
```

## 8. Spojovací tabulky

V DB již máme jak **zákazníky** tak **produkty**, ty potřebujeme propojit do objednávek.

Označíme je jako **FK** pro zajištění integrity dat.

```sql
-- 1. Vytvoření propojovací tabulky s cizími klíči
DROP TABLE IF EXISTS Objednavka;
CREATE TABLE Objednavka (
    ID_Objednavky INT PRIMARY KEY AUTO_INCREMENT,
    ID_Zakaznika INT,    
    ID_Produktu INT,     
    Kusu INT,             
    
    -- Nastavení cizích klíčů (hlídačů referenční integrity)
    FOREIGN KEY (ID_Zakaznika) REFERENCES Zakaznik(ID_Zakaznika),
    FOREIGN KEY (ID_Produktu) REFERENCES Produkt(ID_Produktu)
);

-- 2. Vložení objednávky: Zákazník číslo 1 si koupil Produkt číslo 3 (2 kusy)
INSERT INTO Objednavka (ID_Zakaznika, ID_Produktu, Kusu)
VALUES (1, 3, 2);

-- 3. Zkontrolujte, jak objednávka vypadá
SELECT * FROM Objednavka;
```