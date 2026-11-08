# Úvod do HeidiSQL: Grafické rozhraní pro databáze

Příkazový řádek (CMD) je skvělý pro automatizaci a rychlé spouštění hotových skriptů. V praxi ale administrátoři a vývojáři používají pro běžnou správu dat a analýzu grafické programy (GUI - Graphical User Interface). Jedním z nejoblíbenějších a nejrychlejších nástrojů pro MariaDB/MySQL je **HeidiSQL**.

## 1. Tahák: Rozhraní a orientace v HeidiSQL

### Připojení k databázi (Relace)
Při prvním spuštění programu musíte vytvořit tzv. **Relaci** (Session) – tedy říct programu, kam a pod jakým účtem se má připojit.
* **Síťový typ:** MariaDB nebo MySQL (TCP/IP)
* **Název hostitele / IP:** `127.0.0.1` (nebo `localhost`) – znamená "tento počítač"
* **Uživatel:** `root`
* **Heslo:** (Zůstává prázdné, pokud jste v instalaci nenastavili vlastní)

### 3 hlavní záložky pro práci s tabulkou
Když v levém panelu rozbalíte svou databázi a kliknete na konkrétní tabulku, v pravé části uvidíte tři hlavní záložky:
1. **Struktura (Structure):** Ukazuje, jak je tabulka postavená (názvy sloupců, datové typy, klíče). Můžete zde rovnou přidávat nové sloupce bez psaní kódu.
2. **Data (Data):** Funguje podobně jako tabulka v Excelu. Vidíte zde samotné záznamy, můžete je přímo přepisovat, mazat nebo přidávat nové (`+` nebo klávesou `Insert`). Změny se do databáze uloží automaticky při překliknutí na jiný řádek.
3. **Dotaz (Query):** Zde píšete vlastní SQL příkazy (např. složité `SELECT` dotazy přes více tabulek).

### Rychlé filtry a řazení
* **Řazení:** V záložce *Data* stačí kliknout na hlavičku jakéhokoliv sloupce a záznamy se podle něj okamžitě seřadí.
* **Filtrování:** Těsně nad daty je textové pole **Filtr**. Stačí do něj napsat např. `Cena > 1000` a stisknout Enter. Program data vyfiltruje za vás.

### Nejdůležitější klávesová zkratka
*   **`F9` (Spustit dotaz):** Pokud jste v záložce *Dotaz* a napíšete SQL příkaz, klávesou `F9` jej okamžitě vykonáte a ve spodní části obrazovky se vypíše výsledek.

---

## 2. Samostatná práce: Průzkum a správa databáze v HeidiSQL

V této práci využijeme databázi `muj_eshop`, kterou jste vytvořili v předchozích hodinách pomocí terminálu.

**Zadání:**

1. **Vytvoření připojení:** Spusťte HeidiSQL, klikněte vlevo dole na "Nová", pojmenujte relaci `Skolni Databaze`, zkontrolujte uživatele `root` a klikněte na "Otevřít".
2. **Průzkum struktury:** V levém panelu najděte vaši databázi `muj_eshop` a rozbalte ji. Klikněte na tabulku `Produkt`. Prohlédněte si záložku *Struktura*.
3. **Tvorba tabulky bez kódu (GUI):**
   * Klikněte v levém panelu pravým tlačítkem na databázi `muj_eshop`.
   * Vyberte **Vytvořit novou -> Tabulku**.
   * Tabulku pojmenujte `Kategorie`.
   * Pomocí tlačítka "Přidat" vytvořte dva sloupce: `ID_Kategorie` (typ INT) a `Nazev` (typ VARCHAR, délka 50).
   * Klikněte pravým tlačítkem na `ID_Kategorie` a zvolte "Vytvořit nový index -> PRIMARY".
   * Dole klikněte na "Uložit". Tabulka je hotová bez jediného řádku napsaného SQL kódu!
4. **Manuální editace (Záložka Data):**
   * Překlikněte se zpět na tabulku `Produkt` a přepněte se do záložky *Data*. 
   * Najděte produkt s názvem "Bezdrátová myš" a ručně mu přepište cenu na `600`.
   * Klikněte na ikonu `+` (Přidat řádek) nahoře v liště a vytvořte nový produkt: `ID` nechte prázdné (vygeneruje se samo), Název bude `Grafická karta`, Cena `12000`.
5. **Rychlý filtr:**
   * Zůstaňte v záložce *Data*. Do pole Filtr nad tabulkou napište `Cena < 2000` a stiskněte Enter. Ověřte si, že zobrazení funguje. Následně filtr křížkem zrušte.
6. **Vlastní SQL (Záložka Dotaz):**
   * Přepněte se do záložky *Dotaz*.
   * Napište SQL příkaz, který vypíše všechny produkty seřazené od nejdražšího po nejlevnější (`ORDER BY Cena DESC`).
   * Spusťte dotaz pomocí klávesy **F9**.
7. **Záloha celé databáze (Export do SQL):**
   * Tohle dělá každý administrátor před zásahem do systému. Klikněte v levém panelu **pravým tlačítkem** na samotnou databázi `muj_eshop` (nikoliv na tabulku).
   * Vyberte **Exportovat databázi jako SQL...**
   * V okně nechte vše zaškrtnuté (Tabulky, Data) a dole v sekci "Výstup" zvolte, kam se má soubor uložit (např. na Plochu jako `zaloha_eshop.sql`).
   * Klikněte na Exportovat. Pokud byste si nyní omylem smazali databázi, pomocí tohoto souboru ji dokážete obnovit do původního stavu.