# Praktická maturitní zkouška

**Střední průmyslová škola elektrotechnická, Praha 2, Ječná 30**
**Školní rok 2022/2023**
---
Jméno a příjimeni: Michal Siviček
Třída: C4c
---

## Úvod

Tato databáze se zabývá fungováním banky a obsahuje informace o kontaktech, pobočkách, zákaznících, lokacích, zaměstnancích, půjčkách, splátkách, účtech a kartách. Databáze byla vytvořena pomocí MySQL a je možné ji spustit pomocí příkazů v souboru database.sql

## E-R model

konceptuální model databáze se nachází v /img/table.png
zde vložit i screenshot.png

## Entitní integrita

Každá entita obsahuje uměle vytvořený primární klíč, označený jako id, 
který se s každým dalším záznamem inkrementuje.

## Doménová integrita

** kontakt
- E-mail: libovolné znaky, maximálně však 50 znaků, not null
- Tel. číslo: celé číslo, not null, délka 9 až 12 znaků

** pobocka
- Název: libovolné znaky, maximálně však 20 znaků

** zakaznik
- Jméno: libovolné znaky, maximálně však 20 znaků, not null
- Příjmení: libovolné znaky, maximálně však 20 znaků, not null
- Kontakt ID: celé číslo, odkazující na existující záznam v tabulce kontakt, not null

** lokace
- Ulice: libovolné znaky, maximálně však 20 znaků, not null
- Město: libovolné znaky, maximálně však 20 znaků, not null
- Stát: libovolné znaky, maximálně však 40 znaků, not null
- Č. domu: celé číslo, not null
- PSČ: celé číslo, not null
- Pobočka ID: celé číslo, odkazující na existující záznam v tabulce pobocka, not null

** zamestnanec
- Jméno: libovolné znaky, maximálně však 20 znaků, not null
- Příjmení: libovolné znaky, maximálně však 20 znaků, not null
- Pobočka ID: celé číslo, odkazující na existující záznam v tabulce pobocka, not null
- Kontakt ID: celé číslo, odkazující na existující záznam v tabulce kontakt, not null

** pujcka
- Datum založení: datový typ date, formát 'yyyy-mm-dd', not null
- Částka: celé číslo, not null
- Úrok: celé číslo, not null
- Zákazník ID: celé číslo, odkazující na existující záznam v tabulce zakaznik, not null
- Délka pujčky: celé číslo, not null
- Počet splátek: celé číslo, not nulll
** splatka
- Datum splátky: datový typ date, formát 'yyyy-mm-dd', not null
- Částka: celé číslo, not null
- Půjčka ID: celé číslo, odkazující na existující záznam v tabulce pujcka, not null

** ucet 
- Číslo účtu: celé číslo, not null
- IBAN: libovolné znaky, maximálně však 40 znaků, not null
- SWIFT: libovolné znaky, maximálně však 40 znaků, not null
- Měna: libovolné znaky, maximálně však 20 znaků, not null
- Plus účet: datový typ boolean, not null
- Standardní účet: datový typ boolean, not null
- Spořící účet: datový typ boolean, not null
- Zákazník ID: celé číslo, odkazující na existující záznam v tabulce zakaznik, not null
- Zůstatek: celé číslo, not null

** karta 
- Číslo karty: celé číslo, not null
- Datum vypršení: datový typ date, formát 'yyyy-mm-dd', not null
- CVC kód: celé číslo, not null
- Jméno uživatele: libovolné znaky, maximálně však 20 znaků, not null
- Debitní karta: datový typ boolean, not null
- Kreditní karta: datový typ boolean, not null
- Bezkontaktní: datový typ boolean, not null
- Online karta: datový typ boolean, not null
- Zákazník ID: celé číslo, odkazující na existující záznam v tabulce zakaznik, not null
- Účet ID: celé číslo, odkazující na existující záznam v tabulce ucet, not null
...

## Referenční integrita

** zakaznik
- Kontakt ID: celé číslo, odkazující na existující záznam v tabulce kontakt, not null

** lokace
- Pobočka ID: celé číslo, odkazující na existující záznam v tabulce pobocka, not null

** zamestnanec
- Pobočka ID: celé číslo, odkazující na existující záznam v tabulce pobocka, not null
- Kontakt ID: celé číslo, odkazující na existující záznam v tabulce kontakt, not null

** pujcka
- Zákazník ID: celé číslo, odkazující na existující záznam v tabulce zakaznik, not null

** splatka
- Půjčka ID: celé číslo, odkazující na existující záznam v tabulce pujcka, not null

** ucet
- Zákazník ID: celé číslo, odkazující na existující záznam v tabulce zakaznik, not null

** karta
- Zákazník ID: celé číslo, odkazující na existující záznam v tabulce zakaznik, not null
- Účet ID: celé číslo, odkazující na existující záznam v tabulce ucet, not null
...

## Indexy 
- Databáze má pro každou entitu pouze indexy vytvořené pro primární klíče, 
další indexy 
- index pobocka_index - pro tabulku pobocka jsou tyto parametry: nazev
- index zakaznik_index - pro tabuklku zakaznik jsou tyto parametry: jmeno, prijmeni
- index zamestnanec_index - pro tabulku zamestnanec jsou tyto parametry: jmeno, prijmeni

## Pohledy
- Databáze obsahuje pohledy pro zobrazení souhrnných informací o zákaznících, půjčkách a splátkách
- Návrh obsahuje pohledy 
- aktivni_ucty: zobrazuje číslo účtu, jméno, příjmení a zůstatek aktivních účtů (tj. s pozitivním zůstatkem a označených jako "plus účet")
- ucty_s_vysokym_zustatkem: zobrazuje jméno, příjmení, email a telefonní číslo zákazníka a zůstatek jeho účtů s vysokým zůstatkem (nad 10000)
- nesplacene_uvery: zobrazuje jméno, příjmení, email a telefonní číslo zákazníka a výši jeho nesplacených úvěrů
- uzivatel_s_aktivni_pucjkou: zobrazuje jméno, příjmení, email a telefonní číslo zákazníka a výši jeho aktivních půjček (tj. těch, které nemají splacené všechny splátky)

## Triggery
- Databáze obsahuje triggery: 
- Trigger aktualizace_zustatku_na_uctu se spouští po vložení nového záznamu do tabulky splatka a aktualizuje zůstatek na účtu přidruženému k půjčce, ke které byla splátka vložena.

- Trigger zabraneni_vice_sporicim_uctum se spouští před vložením nového záznamu do tabulky ucet a zabraňuje vytvoření více než jednoho spořicího účtu pro jednoho zákazníka. Pokud se pokusí vložit více než jeden spořicí účet pro jednoho zákazníka, trigger vyvolá chybu.

- 
## Uložené procedury a funkce
- Databáze obsahuje procedury a funkce 

- Procedura vytvor_zakaznika slouží k vytvoření nového zákazníka v databázi. Procedura přijímá 4 parametry(jmeno,prijmeni,email,tel_cislo), procedura vytvoří nový záznam v tabulce kontakt s uvedenými emailem a telefonním číslem a uloží ID nově vytvořeného kontaktu do proměnné kontakt_id. Následně vytvoří nový záznam v tabulce zakaznik s uvedeným jménem, příjmením a ID kontaktu z tabulky kontakt.

- Procedura ziskani_pujcky je určena pro výběr informací o půjčce z databáze. Je definována s jedním vstupním parametrem "zakaznik_id", který představuje ID zákazníka, pro kterého se mají informace o půjčce vybrat. Procedura má také tři výstupní parametry - "pujcka_id", "castka_pujcky" a "urok_z_pujcky", které představují ID půjčky, výši půjčky a úrok z půjčky.
Ve těle procedury se provede SELECT dotaz, který vybere ID půjčky, výši půjčky a úrok z půjčky z tabulky "pujcka" pro zákazníka s daným ID. Výsledek dotazu je pak uložen do výstupních parametrů procedury.

- Procedura zmena_udaju_zakaznika slouží k aktualizaci údajů o zákazníkovi v databázi. Přijímá následující parametry(zakaznik_id,jmeno,prijmeni,email,cislo), Procedura najde zákazníka v tabulce zakaznik pomocí ID a aktualizuje jeho jméno a příjmení. Poté najde v tabulce kontakt záznam s ID, které je uložené v tabulce zakaznik u daného zákazníka a aktualizuje email a telefonní číslo.

## Přístupové údaje do databáze

- Přístupové údaje jsou volně konfigurovatelné v souboru /config/pristupove_udaje.txt
pro vývoj byly použity tyto:
host		: localhost
uživatel	: root
heslo		: student, nebo žádné
databáze	: banka

## Import struktury databáze a dat od zadavatele

Nejprve je nutno si vytvořit novou databázi, bez jakýchkoliv dat.
Potom do této databáze nahrát soubor, který se nachází v /sql/structure.sql
Pokud si přejete načíst do databáze testovací data, je nutno nahrát ještě soubor /sql/insert.sql

## Klientská aplikace
- Databáze neobsahuje klientskou aplikaci.

## Požadavky na spuštění
- MySQL Workbench, rok vydání 2022
- XAMPP Control Panel, rok vydání 2021 - 2022
- připojení k internetu alespoň 2Mb/s 
...

## Návod na instalaci a ovládání aplikace

- Abyste mohli vytvořit databázi a nahrát do ní strukturu, postupujte podle kroku "Import struktury databáze a dat od zadavatele".
Poté se můžete přihlásit předdefinovaným uživatelem, nebo vytvořit vlastní pomocí SQL příkazů 
- poté naimportujete script.sql


## Závěr

- Závěrem bych chtěl říct, že projekt mi přinesl monoho zkušeností s větší prácí v SQL. 
- Snažil jsem se splnit všechny kritéria zadání 
- U dat je očekáváno, že server nebo backend bude kontrolovat také vstupy
- Dále se počítá, že klient by proškolen o použití databáze.

