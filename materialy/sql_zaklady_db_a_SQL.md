# TAHÁK: ZÁKLADY DATABÁZÍ A SQL

## 1. Základní pojmy

| Pojem | Vysvětlení | Příklad z praxe | 
| ----- | ----- | ----- | 
| **Databáze** | Organizovaná sbírka dat, ve které můžeme efektivně a rychle vyhledávat. | Školní informační systém (Bakaláři). | 
| **Tabulka (Table)** | Základní stavební kámen. Ukládá data o jednom typu věcí nebo osob. | Tabulka `Studenti` nebo `Predmety`. | 
| **Sloupec (Column)** | Vlastnost (atribut), kterou o dané věci evidujeme. | `Jmeno`, `Prijmeni`, `Vek`. | 
| **Záznam (Row)** | Jeden konkrétní prvek (řádek) v tabulce. | Konkrétní student: Jan Novák, 2.A. | 
| **Primární klíč (PK)** | Sloupec, který jednoznačně identifikuje každý řádek. Nesmí se opakovat. | `ID_studenta` (např. 105). | 
| **Cizí klíč (FK)** | Sloupec odkazující na primární klíč v jiné tabulce. Slouží k propojení. | Sloupec `ID_tridy` v tabulce studentů. | 

## 2. Hlavní SQL příkazy (CRUD)

### Čtení dat (SELECT)

Zobrazí úplně všechno (všechny sloupce) z tabulky:

```sql
SELECT * FROM Studenti;
```

Zobrazí jen vybrané konkrétní sloupce:

```sql
SELECT Jmeno, Prijmeni FROM Studenti;
```

### Vkládání nových dat (INSERT INTO)

Přidá nového studenta. Pořadí hodnot musí odpovídat sloupcům!

```sql
INSERT INTO Studenti (Jmeno, Prijmeni, Trida) VALUES ('Petr', 'Svoboda', '3.B');
```

### Úprava existujících dat (UPDATE)

POZOR: Vždy používej podmínku WHERE, jinak si přepíšeš data v celé tabulce!
Změní třídu konkrétnímu studentovi s ID 5:

```sql
UPDATE Studenti SET Trida = '4.B' WHERE ID_studenta = 5;
```

### Mazání dat (DELETE)

Smaže studenta s ID 10:

```sql
DELETE FROM Studenti WHERE ID_studenta = 10;
```

## 3. Zpřesňování výběru (Podmínky a řazení)

| Klauzule | Co přesně dělá | Příklad použití v kódu | 
| ----- | ----- | ----- | 
| **WHERE** | Filtruje výsledky podle zadané podmínky. | `WHERE Vek > 15` | 
| **AND / OR** | Spojuje více podmínek (A zároveň / Nebo). | `WHERE Trida = '1.A' AND Vek = 16` | 
| **ORDER BY** | Seřadí výsledky podle určeného sloupce (ASC = od A do Z, DESC = opačně). | `ORDER BY Prijmeni ASC` | 
| **LIMIT** | Omezí maximální počet vypsaných řádků. | `LIMIT 5` (vypíše jen 5) | 
| **LIKE** | Vyhledávání textu podle vzoru. Znak `%` nahrazuje libovolný text. | `WHERE Prijmeni LIKE 'Nov%'` | 

## 4. Agregační funkce (Počítání a statistika)

Používají se v příkazu `SELECT`, když chceme zjistit hromadnou statistiku, ne konkrétní lidi.

* `COUNT()` - Spočítá celkový počet řádků. (Např. `SELECT COUNT(*) FROM Studenti;` zjistí celkový počet studentů).
* `SUM()` - Sečte všechny číselné hodnoty v daném sloupci.
* `AVG()` - Vypočítá matematický průměr hodnot ve sloupci.
* `MIN()` / `MAX()` - Najde nejmenší (nebo největší) hodnotu.

## 5. Vytváření a úprava struktury tabulek (DDL)

### Vytvoření nové tabulky (CREATE TABLE)

Slouží k založení úplně nové tabulky. Při vytváření musíš nadefinovat jména sloupců, jejich datové typy a případná omezení.

```sql
CREATE TABLE Studenti (
    ID_studenta INT PRIMARY KEY,
    Jmeno VARCHAR(50) NOT NULL,
    Prijmeni VARCHAR(50) NOT NULL,
    Trida VARCHAR(10)
);
```

**Základní datové typy a omezení:**

* `INT` - Celé číslo.
* `VARCHAR(50)` - Textový řetězec (písmena, čísla, znaky) o maximální délce 50 znaků.
* `PRIMARY KEY` - Určuje, že tento sloupec je primárním klíčem tabulky (unikátní identifikátor).
* `NOT NULL` - Znamená, že toto pole je povinné a nesmí zůstat prázdné.

### Úprava existující tabulky (ALTER TABLE)

Používá se v momentě, kdy už tabulka existuje, ale potřebuješ změnit její strukturu - například přidat nový sloupec pro další evidenci nebo nepotřebný sloupec smazat.

Přidání nového sloupce (například pro e-mail):

```sql
ALTER TABLE Studenti ADD Email VARCHAR(100);
```

Smazání existujícího sloupce:

```sql
ALTER TABLE Studenti DROP COLUMN Trida;
```

### Smazání celé tabulky (DROP TABLE)

POZOR: Tento příkaz nevratně smaže celou tabulku i se všemi daty uvnitř! Neplést s příkazem `DELETE`, který maže pouze konkrétní řádky.

```sql
DROP TABLE Studenti;
```