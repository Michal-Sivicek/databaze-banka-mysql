
begin;
INSERT INTO kontakt (email, tel_cislo) VALUES ('jan.novak@example.com', 12345678);
INSERT INTO kontakt (email, tel_cislo) VALUES ('petr.svoboda@example.com', 23456789);
INSERT INTO kontakt (email, tel_cislo) VALUES ('lucie.dvorakova@example.com', 34567890);
INSERT INTO kontakt (email, tel_cislo) VALUES ('petr.mlady@example.com', 456789102);
INSERT INTO kontakt (email, tel_cislo) VALUES ('jakub.bily@example.com', 567890123);
commit;

begin;
INSERT INTO pobocka (nazev) VALUES ('Pobočka 1');
INSERT INTO pobocka (nazev) VALUES ('Pobočka 2');
INSERT INTO pobocka (nazev) VALUES ('Pobočka 3');
INSERT INTO pobocka (nazev) VALUES ('Pobočka 4');
INSERT INTO pobocka (nazev) VALUES ('Pobočka 5');
commit;

begin;
INSERT INTO zakaznik (jmeno, prijmeni, kontakt_id) VALUES ('Jan', 'Novák', 1);
INSERT INTO zakaznik (jmeno, prijmeni, kontakt_id) VALUES ('Petr', 'Svoboda', 1);
INSERT INTO zakaznik (jmeno, prijmeni, kontakt_id) VALUES ('Lucie', 'Dvořáková', 1);
INSERT INTO zakaznik (jmeno, prijmeni, kontakt_id) VALUES ('Petr', 'Mladý', 1);
INSERT INTO zakaznik (jmeno, prijmeni, kontakt_id) VALUES ('Jakub', 'Bílý', 1);
commit;

begin;
INSERT INTO ucet (cislo_uctu, IBAN, SWIFT, mena, plus_ucet, standartni_ucet, sporici_ucet, zakaznik_id) VALUES (123456, 'CZ123456', 'CZBACZPP', 'CZK', 0, 1, 0, 1);
INSERT INTO ucet (cislo_uctu, IBAN, SWIFT, mena, plus_ucet, standartni_ucet, sporici_ucet, zakaznik_id) VALUES (123457, 'CZ123457', 'CZBACZPP', 'CZK', 1, 0, 0, 2);
INSERT INTO ucet (cislo_uctu, IBAN, SWIFT, mena, plus_ucet, standartni_ucet, sporici_ucet, zakaznik_id) VALUES (123458, 'CZ123458', 'CZBACZPP', 'CZK', 0, 0, 1, 3);
INSERT INTO ucet (cislo_uctu, IBAN, SWIFT, mena, plus_ucet, standartni_ucet, sporici_ucet, zakaznik_id) VALUES (123458, 'CZ123459', 'CZBACZPP', 'CZK', 0, 1, 1, 3);
INSERT INTO ucet (cislo_uctu, IBAN, SWIFT, mena, plus_ucet, standartni_ucet, sporici_ucet, zakaznik_id) VALUES (123458, 'CZ123450', 'CZBACZPP', 'CZK', 0, 1, 1, 3);
commit;

begin;
INSERT INTO lokace (ulice, mesto, stat, cislo_domu, PSC, pobocka_id) VALUES ('Ulica 1', 'Město 1', 'Stát 1', 1, 11111, 1);
INSERT INTO lokace (ulice, mesto, stat, cislo_domu, PSC, pobocka_id) VALUES ('Ulica 2', 'Město 2', 'Stát 2', 2, 22222, 2);
INSERT INTO lokace (ulice, mesto, stat, cislo_domu, PSC, pobocka_id) VALUES ('Ulica 3', 'Město 3', 'Stát 3', 3, 33333, 3);
INSERT INTO lokace (ulice, mesto, stat, cislo_domu, PSC, pobocka_id) VALUES ('Ulica 4', 'Město 4', 'Stát 4', 4, 44444, 4);
INSERT INTO lokace (ulice, mesto, stat, cislo_domu, PSC, pobocka_id) VALUES ('Ulica 5', 'Město 5', 'Stát 5', 5, 55555, 5);
commit;

begin;
INSERT INTO zamestnanec (jmeno, prijmeni, pobocka_id, kontakt_id) VALUES ('Jana', 'Nováková', 1, 4);
INSERT INTO zamestnanec (jmeno, prijmeni, pobocka_id, kontakt_id) VALUES ('Petra', 'Svobodová', 2, 5);
INSERT INTO zamestnanec (jmeno, prijmeni, pobocka_id, kontakt_id) VALUES ('Lucie', 'Dvořákové', 2, 5);
INSERT INTO zamestnanec (jmeno, prijmeni, pobocka_id, kontakt_id) VALUES ('Petr', 'Mladý', 2, 5);
INSERT INTO zamestnanec (jmeno, prijmeni, pobocka_id, kontakt_id) VALUES ('Jakub', 'Bílý', 2, 5);
commit;

begin;
INSERT INTO pujcka (datum_zalozeni, castka, urok, zakaznik_id) VALUES ('2022-01-01', 10000, 5, 1);
INSERT INTO pujcka (datum_zalozeni, castka, urok, zakaznik_id) VALUES ('2022-01-01', 20000, 10, 2);
INSERT INTO pujcka (datum_zalozeni, castka, urok, zakaznik_id) VALUES ('2022-01-01', 30000, 15, 3);
INSERT INTO pujcka (datum_zalozeni, castka, urok, zakaznik_id) VALUES ('2022-01-01', 40000, 20, 4);
INSERT INTO pujcka (datum_zalozeni, castka, urok, zakaznik_id) VALUES ('2022-01-01', 50000, 25, 5);
commit;

begin;
INSERT INTO splatka (datum_splatky, castka, pujcka_id) VALUES ('2022-01-01', 1000, 2);
INSERT INTO splatka (datum_splatky, castka, pujcka_id) VALUES ('2022-02-01', 1000, 2);
INSERT INTO splatka (datum_splatky, castka, pujcka_id) VALUES ('2022-03-01', 1000, 2);
INSERT INTO splatka (datum_splatky, castka, pujcka_id) VALUES ('2022-04-01', 1000, 2);
INSERT INTO splatka (datum_splatky, castka, pujcka_id) VALUES ('2022-05-01', 1000, 2);
commit;

begin;  
INSERT INTO karta (cislo_karty, datum_vyprseni, CVC_kod, jmeno_uzivatele, debetni_karta, kreditni_karta, bezkontaktni, online_karta, zakaznik_id, ucet_id) VALUES (123456, '2022-12-01', 123, 'Jan Novak', 1, 0, 1, 0, 1, 1);
INSERT INTO karta (cislo_karty, datum_vyprseni, CVC_kod, jmeno_uzivatele, debetni_karta, kreditni_karta, bezkontaktni, online_karta, zakaznik_id, ucet_id) VALUES (123457, '2023-01-01', 123, 'Petr Novak', 0, 1, 0, 1, 2, 2);
INSERT INTO karta (cislo_karty, datum_vyprseni, CVC_kod, jmeno_uzivatele, debetni_karta, kreditni_karta, bezkontaktni, online_karta, zakaznik_id, ucet_id) VALUES (123458, '2023-02-01', 123, 'Jana Novakova', 0, 1, 1, 0, 3, 3);
INSERT INTO karta (cislo_karty, datum_vyprseni, CVC_kod, jmeno_uzivatele, debetni_karta, kreditni_karta, bezkontaktni, online_karta, zakaznik_id, ucet_id) VALUES (123459, '2023-03-01', 123, 'Jiri Novak', 0, 0, 0, 1, 4, 4);
INSERT INTO karta (cislo_karty, datum_vyprseni, CVC_kod, jmeno_uzivatele, debetni_karta, kreditni_karta, bezkontaktni, online_karta, zakaznik_id, ucet_id) VALUES (123460, '2023-04-01', 123, 'Lenka Novakova', 1, 1, 1, 1, 5, 5);
commit;


begin;
update pujcka set pocet_splatek = 40;
update pujcka set delka_pujcky = 20;
update ucet set zustatek = 321483842;
commit;