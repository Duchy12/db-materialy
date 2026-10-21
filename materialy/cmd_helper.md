# CMD

Tento materiál slouží jako rychlá reference pro základní orientaci v textovém terminálu (windows).

## 1. Klávesy pro urychlení práce
| Klávesa | Funkce | Příklad použití |
| :--- | :--- | :--- |
| **TAB** (Tabulátor) | Automatické doplnění textu. | Napíšete `cd Dok` a stisknete TAB. Systém automaticky doplní na `cd Dokumenty`. |
| **Šipka NAHORU / DOLŮ** | Listování v historii příkazů. | Pokud uděláte překlep v `mysql -u root`, stačí stisknout šipku nahoru, překlep opravit a znovu potvrdit. |

## 2. Klíčové navigační příkazy
| Příkaz | Popis | Příklad |
| :--- | :--- | :--- |
| `dir` | Vypíše obsah aktuální složky (seznam souborů a podsložek). Odpovídá otevření složky v grafickém Průzkumníku. | `dir` |
| `cd <název>` | Přesun do konkrétní podsložky (Change Directory). | `cd Desktop` |
| `cd ..` | Návrat o jednu úroveň výše (skok ze složky ven). | `cd ..` |
| `cd \` | Návrat úplně na začátek disku (do tzv. kořenového adresáře, např. přímo na disk C:\). | `cd \` |

## 3. Práce se složkami a soubory
| Příkaz | Popis | Příklad |
| :--- | :--- | :--- |
| `mkdir <název>` | Vytvoření nové prázdné složky (Make Directory). | `mkdir SQL_Lekce` |
| `rmdir <název>` | Smazání existující prázdné složky (Remove Directory). | `rmdir SQL_Lekce` |
| `echo <text> > <soubor>` | Vytvoří textový soubor a rovnou do něj zapíše vámi zadaný text. | `echo tajne heslo > info.txt` |
| `type <soubor>` | Přečte obsah textového souboru a vypíše ho přímo do terminálu. | `type info.txt` |
| `del <název>` | Smazání konkrétního souboru (Delete). Pozor, maže se trvale, bez koše! | `del info.txt` |
| `copy <zdroj> <cil>` | Vytvoří kopii souboru. | `copy info.txt info_zaloha.txt` |
| `ren <puvodni> <novy>` | Přejmenuje soubor. | `ren info.txt info_novy.txt` |

## 4. Čištění terminálu
| Příkaz | Popis | Příklad |
| :--- | :--- | :--- |
| `cls` | Vyčistí obrazovku terminálu (Clear Screen). Hodí se, když je na monitoru už příliš mnoho textu a ztrácíte přehled. Vaše aktuální pozice (složka) zůstane zachována. | `cls` |