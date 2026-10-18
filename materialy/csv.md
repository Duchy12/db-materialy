# Co je to CSV soubor?
Zkratka **[CSV](https://en.wikipedia.org/wiki/Comma-separated_values)** znamená **Comma-Separated Values**

Je to ten nejjednodušší způsob, jak do obyčejného txt soboru uložit tabulku. Neobsahuje žádné formátování ani jiné podobné věci.

## Formát CSV
Vnitřek CSV souboru vypadá takto:

```
Jmeno,Prijmeni,Vek,Mesto
Jan,Novak,25,Praha
Eva,Mala,30,Brno
Petr,Rychly,18,Ostrava
```

1. Každý řádek v textu představuje jeden řádek v tabulce.
2. Hodnoty ve sloupcích jsou od sebe odděleny čárkou `,`

## Využití
Hlavní výhody CSV:
- Univerzálnost
- Rychlost a velikost (limitem je parser v softwaru, popř.: hw)