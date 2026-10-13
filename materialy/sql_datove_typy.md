# Esenciální datové typy v SQL

Praktický přehled nejpoužívanějších datových typů napříč moderními relačními databázemi (PostgreSQL, MySQL, SQL Server).

Při návrhu databázového schématu je výběr správného datového typu klíčový pro výkon, úsporu místa a datovou integritu. Níže najdete vyfiltrovaný seznam těch absolutně nejdůležitějších typů, se kterými si vystačíte v 95% případů.

## 1 Číselné datové typy (Numerics)

| DATOVÝ TYP | POPIS A VYUŽITÍ | PŘÍKLAD HODNOTY |
| :--- | :--- | :--- |
| **INT / INTEGER** | Standardní celé číslo (typicky 4 byty). Nejčastější volba pro primární klíče (ID), počty, věk nebo roky. | `42`, `-100` |
| **BIGINT** | Velké celé číslo (8 bytů). Používá se pro identifikátory ve velmi velkých tabulkách (např. sociální sítě) nebo generátory unikátních ID. | `9007199254740991` |
| **DECIMAL(p, s)** (nebo NUMERIC) | Čísla s pevnou přesností. Zásadní pro finanční a peněžní operace. $p$ = celkový počet číslic, $s$ = počet číslic za čárkou. | `999.99` |
| **FLOAT** | Čísla s plovoucí desetinnou čárkou (přibližná přesnost). Rychlé na výpočty, vhodné pro vědecká data, GPS souřadnice, ale nevhodné pro peníze. | `3.14159` |

## 2 Textové datové typy (Strings)

| DATOVÝ TYP | POPIS A VYUŽITÍ | PŘÍKLAD HODNOTY |
| :--- | :--- | :--- |
| **VARCHAR(n)** | Text proměnlivé délky (až do délky n). Paměťově efektivní. Zdaleka nejpoužívanější typ pro texty (jména, emaily). | `'Jan Novák!'` |

## 3 Datum a čas (Date & Time)

| DATOVÝ TYP | POPIS A VYUŽITÍ | PŘÍKLAD HODNOTY |
| :--- | :--- | :--- |
| **DATE** | Uchovává pouze datum bez přesného času. Ideální pro data narození, expirace kreditních karet, data vytvoření faktury. | `'2026-09-20'` |
| **TIME** | Uchovává pouze čas. Používá se pro záznamy jako jsou otevírací hodiny nebo plánované události bez konkrétního dne. | `'13:45:00'` |
| **TIMESTAMP** (nebo DATETIME) | Datum i čas dohromady. Typicky se používá pro evidenci změn (`created_at`, `updated_at`). TIMESTAMP navíc často řeší i časové zóny (UTC). | `'2026-09-20 11:37:30'` |

## 4 Binární data a Ostatní

| DATOVÝ TYP | POPIS A VYUŽITÍ | PŘÍKLAD HODNOTY |
| :--- | :--- | :--- |
| **BOOLEAN** (nebo BIT) | Pravdivostní hodnota (pravda/nepravda). Relační databáze ji ukládají jako 1 nebo 0. Slouží jako příznaky (např. `is_active`, `is_deleted`). | `TRUE (1)`, `FALSE (0)` |
| **BLOB / VARBINARY** | Ukládání surových binárních dat přímo do databáze (Binary Large Object). Využívá se pro zašifrovaná hesla, certifikáty nebo malé soubory/obrázky. | `0x89504E47...` |
| **JSON / JSONB** | Moderní typ pro ukládání strukturovaných dat ve formátu JSON. Databáze umožňuje dotazování přímo dovnitř JSON struktury (např. nastavení uživatele). | `'{"theme": "dark"}'` |

## 5 Best Practices a Doporučení

**Zlatá pravidla pro návrh databáze**

*   **Peníze nepatří do FLOAT:** Pro finanční operace vždy používejte `DECIMAL(10,2)` nebo násobky celých čísel (uložení v haléřích jako `INT`). Zabráníte tak chybám v zaokrouhlování.
*   **Soubory do DB nepatří:** Ačkoliv existuje `BLOB`, ukládání velkých obrázků nebo videí do databáze masivně zpomaluje výkon. Uložte soubor do cloud storage (S3, disk) a do DB uložte jen textovou `VARCHAR` cestu k němu.
*   **Nešetřete na IDčkách:** Pokud očekáváte, že vaše aplikace poroste, použijte pro auto-inkrementální ID rovnou `BIGINT`. Migrace přetečeného `INT` na produkční databázi je bolestivá.
*   **UTC čas:** Do sloupců typu `TIMESTAMP` ukládejte čas vždy v UTC. Převod na lokální časovou zónu uživatele řešte až na frontendu aplikace.