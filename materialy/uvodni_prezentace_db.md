---
marp: true
theme: default
class: invert
---

# Úvod do databází

<!-- 
Poznámka pro přednášejícího: 
Přivítání posluchačů. Krátké představení tématu - vysvětlení, že databáze jsou neviditelným motorem celého dnešního digitálního světa. Od bankovnictví až po sociální sítě.
-->

---

## Stručná historie ukládání dat

* **Papírové kartotéky:** Fyzické šanony a lístky. Pomalé hledání, hrozba ztráty nebo požáru, nulová možnost rychlého sdílení dat.
* **Ploché soubory:** Éra prvních počítačů. Vše v jedné obří tabulce. Rychle vzniká chaos, duplicita informací a pomalost.
* **Relační DB (SQL):** Revoluce 70. let (IBM). Data se dělí a propojují chytrými vztahy. Standard a pilíř dnešního IT světa.
* **Cloud & NoSQL:** Moderní éra. Data fyzicky rozesetá po celém světě, obrovská propustnost, Big Data a sociální sítě.

<!-- 
Poznámka pro přednášejícího: 
Zdůraznit postupný vývoj od fyzického chaosu k digitální struktuře a nakonec k distribuovaným databázím v cloudu. Relační (SQL) model ze 70. let se s námi drží dodnes jako absolutní základ IT.
-->

---

## Co je to databáze?

* **Strukturovaná data:** Uspořádaná sbírka, obvykle bezpečně uložená v počítačovém systému.
* **Souběžný přístup:** Umožňuje přístup tisícům uživatelů najednou bez poškození dat (např. Instagram).
* **Rychlé hledání:** Poskytuje extrémně rychlé vyhledávání informací pomocí takzvaných indexů.
* **Záloha & Ochrana:** Zajišťuje snadné zálohování, konzistenci dat a přísnou ochranu pomocí hesel.

<!-- 
Poznámka pro přednášejícího: 
Vysvětlit rozdíl mezi obyčejným uložením dat na disk v textovém souboru a databází. Nejdůležitějšími vlastnostmi jsou souběžný přístup a bezpečnost - to obyčejné soubory neumí.
-->

---

## Excel vs Relační databáze (RDB)

| Tabulkový procesor (Excel) | Relační Databáze |
| :--- | :--- |
| Skvělý pro rychlou analýzu a tvorbu grafů. | Navržená přímo k bezpečnému ukládání. |
| Limit: Cca 1 milion řádků (při 100 tisících už se nepříjemně zasekává). | Limit: Téměř neomezená kapacita (miliardy řádků v řádu milisekund). |
| Problém: Kdyby se do něj snažilo naráz zapsat 100 lidí, soubor se pravděpodobně poškodí. | Výhoda: Zvládne 10 000+ uživatelů zapisujících zcela současně. |
| Pravidla pro data lze obejít nebo text omylem smazat. | Striktní pravidla (pokud definujeme, že se zadává věk, nedovolí vložit text "Pepa"). |

<!-- 
Poznámka pro přednášejícího: 
Toto je klíčový slide pro laiky. Lidé se často ptají: "Proč na to nepoužít prostě Excel?" Hlavní argument je striktnost (neuložíte text do čísla) a obrovský výkon pro stovky současně pracujících uživatelů.
-->

---

## DBMS (SŘDB) - Systém řízení báze dat

* **Co to znamená?**: Speciální software, který funguje jako prostředník mezi uživatelem a samotnými daty na disku. Stará se o to, abyste data mohli bezpečně číst a zapisovat.
* **Příklady z praxe**:
    * **MySQL / MariaDB**: Velmi oblíbené pro weby (běží na nich např. WordPress).
    * **PostgreSQL**: Pokročilý systém pro komplexní aplikace.
    * **SQLite**: Malé lokální databáze přímo ve vašem mobilu.
    * **Oracle / MS SQL**: Robustní (a velmi drahá) řešení pro obří korporace a banky.

<!-- 
Poznámka pro přednášejícího: 
Zdůraznit, že databáze není jen samotný soubor s daty, ale je to chytrý "stroj" (prostředník). Zmínit SQLite – i když uživatel neví o SQL, pravděpodobně mu v kapse na mobilu běží stovky SQLite databází (aplikace, kontakty, SMS).
-->

---

# Část 1: Architektura
**Jak navrhnout databázi**

<!-- 
Poznámka pro přednášejícího: 
Předělový slide. Nyní se přesouváme od teorie "co to je" k tomu "jak se to vlastně uvnitř staví".
-->

---

## Tři základní pojmy

1. **Tabulka (Entita)**: Zastupuje jeden druh objektů z reálného světa, o kterých chceme evidovat data. Příkladem může být celá tabulka "Studenti" nebo "Knihy".
2. **Záznam (Řádek)**: Jeden konkrétní exemplář dané entity. V tabulce studentů tvoří jeden řádek kompletní informace o jednom žákovi (např. celý profil žáka Jan Novák).
3. **Pole (Atribut)**: Jednotlivý sloupec tabulky. Definuje konkrétní vlastnost, kterou u každého záznamu sledujeme (např. pouze vlastnost "Jméno", "Věk" či "Email").

<!-- 
Poznámka pro přednášejícího: 
Pro snazší pochopení vizualizovat jako klasickou tabulku: List = tabulka, Řádek = záznam (jeden člověk), Sloupec = pole (konkrétní vlastnost).
-->

---

## Základní datové typy

* **INT (Celá čísla)**: Typicky pro identifikátory, počet kusů na skladě, věk nebo počet lajků u fotky.
* **VARCHAR (Text)**: Slouží pro jména, hesla, emaily nebo adresy. Označujeme maximální délku (např. VARCHAR(50) = max 50 znaků).
* **DATE / DATETIME**: Uchovává přesné kalendářní datum a čas. Databáze pak umí spočítat např. "kdo se registroval za poslední měsíc".
* **BOOLEAN (Pravda/Nepravda)**: Jednoduché přepínače 1/0. Ideální pro sloupce jako `Odebira_Newsletter`.

<!-- 
Poznámka pro přednášejícího: 
Zde je potřeba vysvětlit, proč datové typy existují: jednak šetří paměť (číslo zabere méně místa než text) a zadruhé udržují integritu (systém na nás vyhodí chybu, pokud se pokusíme do sloupce INT s věkem napsat "Dvacet").
-->

---

## Relační model

* **Nejpoužívanější typ databází**: Dnes jde o absolutně nejpoužívanější typ databází. Data se úmyslně neukládají do jedné obří a nepřehledné tabulky (to by vedlo k duplicitám a chybám), ale do mnoha menších, smysluplných částí.
* **Efektivní relace a vztahy**: Tyto tabulky se následně propojují – tvoří relace (vztahy). Změní-li se jméno učitele, změní se jen na jednom místě v databázi, ale projeví se to u všech jeho tříd automaticky.

<!-- 
Poznámka pro přednášejícího: 
Rozebrat pojem "duplicita". Kdybychom měli jednu obří tabulku a učitel by si změnil příjmení (např. po svatbě), museli bychom to měnit u tisíců řádků. Takhle to změníme v tabulce Učitelé jen jednou.
-->

---

## Typy vztahů (Relací)

* **1:1 (Jedna ku jedné)**: Vzácný typ vztahu. Jeden záznam odpovídá právě jednomu jinému. Příklad: Jeden občan = jeden platný občanský průkaz.
* **1:N (Jedna ku mnoha)**: Nejčastější typ vazby! Jedna věc se odkazuje na mnoho věcí. Příklad: Jeden učitel vyučuje mnoho předmětů.
* **M:N (Mnoho ku mnoha)**: Složitější vazba. Řeší se vytvořením třetí propojovací tabulky. Příklad: Student chodí na víc kroužků a na jeden kroužek chodí víc studentů.

<!-- 
Poznámka pro přednášejícího: 
Příklady ze školního prostředí fungují nejlépe k pochopení (třída má víc studentů (1:N), student si může vybrat více seminářů a seminář má více studentů (M:N)).
-->

---

## Klíče (Keys)

* **Primární klíč (PK)**: Jedinečný identifikátor každého řádku (např. `ID_Studenta` = 1). Nikdy se nesmí u dvou řádků opakovat! Funguje jako rodné číslo záznamu.
* **Cizí klíč (FK)**: Je to odkaz na primární klíč umístěný v úplně jiné tabulce. Tímto způsobem vznikají vazby (relace) mezi daty.

| ID_Student (PK) | Jméno | Příjmení | Ročník |
| :--- | :--- | :--- | :--- |
| 1 | Jan | Novák | 2 |
| 2 | Eva | Svobodová | 2 |
| 3 | Tomáš | Dvořák | 2 |

<!-- 
Poznámka pro přednášejícího: 
PK jako rodné číslo, podle kterého studenta bezpečně poznáme i když se jmenují oba Jan Novák. Cizí klíč je pak vlastně ukazatel: "můj ročník najdeš v jiné tabulce pod ID 2".
-->

---

## Návrh databáze: ERD

1. **Návrh předem**: Předtím, než začneme databázi realizovat, musíme ji navrhnout. Omyl ve struktuře se později opravuje neuvěřitelně těžko.
2. **ER Diagram**: K vizualizaci databázové struktury a jejích relací standardně používáme přehledný ER Diagram (Entity-Relationship Diagram).
3. **Jako plánek**: Funguje to naprosto stejně jako architektonický plánek pro stavbaře. Zajišťuje, že všichni vývojáři chápou strukturu stejně.

<!-- 
Poznámka pro přednášejícího: 
Bez plánku nejde stavět dům, bez ERD nejde programovat rozsáhlou databázi. 
-->

---

# Část 2: Jazyk SQL a NoSQL
**Když už máme architekturu navrženou, jak z databáze vytáhnout informace?**

<!-- 
Poznámka pro přednášejícího: 
Předěl. Teď se budeme bavit o tom, jak se s tou postavenou databází programátoři dorozumívají.
-->

---

## Úvod do jazyka SQL

* **Co je to SQL?**: SQL (Structured Query Language) – neboli strukturovaný dotazovací jazyk. Je to celosvětově standardizovaný jazyk pro komunikaci s relační databází.
* **Magická čtyřka CRUD**: Veškerá práce s daty se točí kolem 4 operací:
    * **C**reate = Vložit nová data (`INSERT`)
    * **R**ead = Číst a vyhledávat (`SELECT`)
    * **U**pdate = Upravit data (`UPDATE`)
    * **D**elete = Smazat data (`DELETE`)

<!-- 
Poznámka pro přednášejícího: 
Vysvětlit CRUD (čte se krud). Prakticky jakákoliv aplikace (Facebook, e-shop) dělá jenom tyto 4 úkony pořád dokola (přidat fotku, zobrazit feed, upravit status, smazat fotku).
-->

---

## Píšeme první SQL dotazy (Čtení)

* **Základní výběr (SELECT)**: Určujeme, z jaké tabulky chceme data a jaké sloupce.
  ```sql
  SELECT Jmeno, Prijmeni FROM Studenti;
  ```
* **Filtrování (WHERE)**: Když hledáme něco konkrétního, použijeme podmínku. Hvězdička (*) znamená "všechny sloupce".
  ```sql
  SELECT * FROM Studenti WHERE Rocnik = 2;
  ```

<!-- 
Poznámka pro přednášejícího: 
Ukázat, že SQL je navrženo tak, aby připomínalo přirozený jazyk (angličtinu). Jde to číst jako normální větu: "Vyber vše ze studentů, kde ročník je 2".
-->

---

## Vkládání a úprava dat

* **Změna stavu databáze**: Pomocí INSERT, UPDATE a DELETE obsah aktivně modifikujeme.

* **Přidání nového studenta (Create)**:
  ```sql
  INSERT INTO Studenti (Jmeno, Rocnik) VALUES ('Petr', 1);
  ```

* **Úprava existujícího (Update)**:
  ```sql
  UPDATE Studenti SET Rocnik = 2 WHERE Jmeno = 'Petr';
  ```

<!-- 
Poznámka pro přednášejícího: 
Upozornit na jedno z největších rizik v IT! Kdybychom napsali příkaz "UPDATE Studenti SET Rocnik = 2;" a zapomněli na "WHERE", tak se posunou do druhého ročníku ÚPLNĚ VŠICHNI studenti v databázi. 
-->

---

## Pokročilé dotazy a agregace

* **Analýza a statistiky**: Databáze zvládne data analyzovat bleskově na straně serveru. Můžeme sčítat, počítat průměry a sdružovat data.
* **Spočítání studentů v ročnících**:
  ```sql
  SELECT Rocnik, COUNT(ID_Student) AS Pocet 
  FROM Studenti 
  GROUP BY Rocnik;
  ```

<!-- 
Poznámka pro přednášejícího: 
Proč nenačíst všechna data do aplikace a nespočítat to tam? Protože by aplikace musela stáhnout třeba 50 GB dat přes síť. Databáze to udělá přímo na discích a pošle zpět jen výsledek – pár čísel.
-->

---

## Propojování dat (JOIN)

* **Slepování tabulek k sobě**: Jelikož jsme data na začátku chytře rozdělili, potřebujeme je při zobrazení zase "slepit" dohromady. K tomu nám slouží silný SQL příkaz `JOIN`. Databáze najde shodu mezi PK a FK.
* **Ukázka**: Jméno studenta a textový název jeho třídy.
  ```sql
  SELECT S.Jmeno, T.Nazev_Tridy 
  FROM Studenti S 
  JOIN Tridy T ON S.ID_Trida = T.ID_Trida;
  ```

<!-- 
Poznámka pro přednášejícího: 
Tohle je pomyslné "srdce" relačních databází. Zde se využívá ten klíč, o kterém jsme mluvili dříve, abychom z dvou oddělených tabulek udělali jeden pěkný výsledek pro uživatele.
-->

---

## NoSQL databáze (Not Only SQL)

* **Jde to i bez tabulek?**: NoSQL jsou moderní databáze, které opustily klasické tabulky. Jsou postavené na mnohem volnější struktuře.
* **Flexibilní dokumenty**: Umožňují, aby měl každý záznam naprosto odlišné vlastnosti, aniž by to systém mátlo.
* **Kdy a kde vládnou?**: 
    * **IoT**: Ukládání milionů stavů z teplotních senzorů.
    * Zpracování nestrukturovaných Big Data.
    * **Nejznámější**: MongoDB, Redis, Cassandra.

<!-- 
Poznámka pro přednášejícího: 
Zatímco relační databáze je jako excelovská mřížka, NoSQL dokumentovka si představte spíše jako šuplík, kam házíte předpřipravené "obálky" - každý papír v obálce může mít trochu jinou formu.
-->

---

## Anatomie NoSQL dokumentu

* **Flexibilní formát (JSON)**: Každý dokument může obsahovat pole (arrays) nebo další vnořené objekty. Přidat nové pole "zajmy" jen u jednoho uživatele vůbec nerozbije zbytek databáze.

```json
{
  "_id": "507f191e810c19729de860ea",
  "jmeno": "Jan Novák",
  "rocnik": 2,
  "zajmy": ["IT", "Sport", "Hudba"],
  "kontakt": {
    "email": "jan@skola.cz"
  }
}
```

<!-- 
Poznámka pro přednášejícího: 
Ukázat na flexibilitu: v SQL bychom na "zájmy" (protože jich může být víc) museli vytvářet složitou novou tabulku (vztah M:N). Tady prostě přidáme pole (hranaté závorky) přímo dovnitř záznamu Jana Nováka.
-->

---

## SQL vs. NoSQL: Kdy zvolit co?

| Vlastnost | Relační (SQL) | NoSQL |
| :--- | :--- | :--- |
| **Struktura dat** | Pevné tabulky, sloupce a relace | Flexibilní dokumenty (JSON), grafy |
| **Změna schématu** | Náročná (vyžaduje migraci dat) | Velmi snadná, flexibilní |
| **Konzistence** | Absolutní spolehlivost (transakce) | Volnější (výhoda: extrémní rychlost) |
| **Ideální využití** | Účetnictví, banky, e-shopy, ERP | Sociální sítě, IoT statistiky, logování |

<!-- 
Poznámka pro přednášejícího: 
Závěrečné shrnutí: Nic jako "nejlepší databáze" neexistuje. Pokud přesunuji peníze mezi bankovními účty, chci maximální spolehlivost a použiju SQL. Pokud sbírám data z milionu aut pro výpočet provozu, chci obrovskou propustnost a zvolím NoSQL. Děkuji za pozornost!
-->