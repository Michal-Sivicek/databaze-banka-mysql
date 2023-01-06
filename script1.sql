create database banka;
use banka;

SET @@SQL_SAFE_UPDATES = 0;


create table kontakt(
id int primary key auto_increment not null,
email varchar(50) not null,
tel_cislo int not null
);

create table pobocka(
id int primary key auto_increment not null,
nazev varchar(20)
);

create table zakaznik(
id int primary key auto_increment not null,
jmeno varchar(20) not null,
prijmeni varchar(20) not null,
kontakt_id int,
constraint kontakt_constraint2 foreign key (kontakt_id) references kontakt(id)
);

create table lokace(
id int primary key auto_increment not null,
ulice varchar(20) not null,
mesto varchar(20) not null,
stat varchar(40) not null,
cislo_domu int not null,
PSC int not null,
pobocka_id int,
constraint pobocka_constraint2 foreign key (pobocka_id) references pobocka(id)
);


create table zamestnanec(
id int primary key auto_increment not null,
jmeno varchar(20) not null,
prijmeni varchar(20) not null,
pobocka_id int,
constraint pobocka_constraint foreign key (pobocka_id) references pobocka(id),
kontakt_id int,
constraint kontakt_constraint foreign key (kontakt_id) references kontakt(id)
);

create table pujcka(
id int primary key auto_increment not null,
datum_zalozeni date not null,
castka int not null,
urok int not null,
zakaznik_id int,
constraint zakaznik_constraint3 foreign key (zakaznik_id) references zakaznik(id)
);

create table splatka(
id int primary key auto_increment not null,
datum_splatky date not null,
castka int not null,
pujcka_id int,
constraint pujcka_constraint foreign key (pujcka_id) references pujcka(id)
);

create table ucet(
id int primary key auto_increment not null,
cislo_uctu int not null,
IBAN varchar(40) not null,
SWIFT varchar(40) not null,
mena varchar(20) not null,
plus_ucet boolean not null,
standartni_ucet boolean not null,
sporici_ucet boolean not null,
zakaznik_id int,
constraint zakaznik_constraint foreign key (zakaznik_id) references zakaznik(id)
);

create table karta(
id int primary key auto_increment not null,
cislo_karty int not null,
datum_vyprseni date not null,
CVC_kod int not null,
jmeno_uzivatele varchar(20) not null,
debetni_karta boolean not null,
kreditni_karta boolean not null,
bezkontaktni boolean not null,
online_karta boolean not  null,
zakaznik_id int,
constraint zakaznik_constraint2 foreign key (zakaznik_id) references zakaznik(id),
ucet_id int,
constraint ucet_constraint foreign key (ucet_id) references ucet(id)
);

INSERT INTO kontakt (email, tel_cislo) VALUES ('jan.novak@example.com', 12345678);
INSERT INTO kontakt (email, tel_cislo) VALUES ('petr.svoboda@example.com', 23456789);
INSERT INTO kontakt (email, tel_cislo) VALUES ('lucie.dvorakova@example.com', 34567890);
INSERT INTO kontakt (email, tel_cislo) VALUES ('petr.mlady@example.com', 456789102);
INSERT INTO kontakt (email, tel_cislo) VALUES ('jakub.bily@example.com', 567890123);

INSERT INTO pobocka (nazev) VALUES ('Pobočka 1');
INSERT INTO pobocka (nazev) VALUES ('Pobočka 1');
INSERT INTO pobocka (nazev) VALUES ('Pobočka 3');
INSERT INTO pobocka (nazev) VALUES ('Pobočka 4');
INSERT INTO pobocka (nazev) VALUES ('Pobočka 5');

INSERT INTO zakaznik (jmeno, prijmeni, kontakt_id) VALUES ('Jan', 'Novák', 1);
INSERT INTO zakaznik (jmeno, prijmeni, kontakt_id) VALUES ('Petr', 'Svoboda', 1);
INSERT INTO zakaznik (jmeno, prijmeni, kontakt_id) VALUES ('Lucie', 'Dvořáková', 1);
INSERT INTO zakaznik (jmeno, prijmeni, kontakt_id) VALUES ('Petr', 'Mladý', 1);
INSERT INTO zakaznik (jmeno, prijmeni, kontakt_id) VALUES ('Jakub', 'Bílý', 1);

INSERT INTO ucet (cislo_uctu, IBAN, SWIFT, mena, plus_ucet, standartni_ucet, sporici_ucet, zakaznik_id) VALUES (123456, 'CZ123456', 'CZBACZPP', 'CZK', 0, 1, 0, 1);
INSERT INTO ucet (cislo_uctu, IBAN, SWIFT, mena, plus_ucet, standartni_ucet, sporici_ucet, zakaznik_id) VALUES (123457, 'CZ123457', 'CZBACZPP', 'CZK', 1, 0, 0, 2);
INSERT INTO ucet (cislo_uctu, IBAN, SWIFT, mena, plus_ucet, standartni_ucet, sporici_ucet, zakaznik_id) VALUES (123458, 'CZ123458', 'CZBACZPP', 'CZK', 0, 0, 1, 3);
INSERT INTO ucet (cislo_uctu, IBAN, SWIFT, mena, plus_ucet, standartni_ucet, sporici_ucet, zakaznik_id) VALUES (123458, 'CZ123459', 'CZBACZPP', 'CZK', 0, 2, 1, 3);
INSERT INTO ucet (cislo_uctu, IBAN, SWIFT, mena, plus_ucet, standartni_ucet, sporici_ucet, zakaznik_id) VALUES (123458, 'CZ123450', 'CZBACZPP', 'CZK', 0, 4, 2, 3);

INSERT INTO lokace (ulice, mesto, stat, cislo_domu, PSC, pobocka_id) VALUES ('Ulica 1', 'Město 1', 'Stát 1', 1, 11111, 1);
INSERT INTO lokace (ulice, mesto, stat, cislo_domu, PSC, pobocka_id) VALUES ('Ulica 2', 'Město 2', 'Stát 2', 2, 22222, 2);
INSERT INTO lokace (ulice, mesto, stat, cislo_domu, PSC, pobocka_id) VALUES ('Ulica 3', 'Město 3', 'Stát 3', 3, 33333, 3);
INSERT INTO lokace (ulice, mesto, stat, cislo_domu, PSC, pobocka_id) VALUES ('Ulica 4', 'Město 4', 'Stát 4', 4, 44444, 4);
INSERT INTO lokace (ulice, mesto, stat, cislo_domu, PSC, pobocka_id) VALUES ('Ulica 5', 'Město 5', 'Stát 5', 5, 55555, 5);

INSERT INTO zamestnanec (jmeno, prijmeni, pobocka_id, kontakt_id) VALUES ('Jana', 'Nováková', 1, 4);
INSERT INTO zamestnanec (jmeno, prijmeni, pobocka_id, kontakt_id) VALUES ('Petra', 'Svobodová', 2, 5);
INSERT INTO zamestnanec (jmeno, prijmeni, pobocka_id, kontakt_id) VALUES ('Lucie', 'Dvořákové', 2, 5);
INSERT INTO zamestnanec (jmeno, prijmeni, pobocka_id, kontakt_id) VALUES ('Petr', 'Mladý', 2, 5);
INSERT INTO zamestnanec (jmeno, prijmeni, pobocka_id, kontakt_id) VALUES ('Jakub', 'Bílý', 2, 5);

INSERT INTO pujcka (datum_zalozeni, castka, urok, zakaznik_id) VALUES ('2022-01-01', 10000, 5, 1);
INSERT INTO pujcka (datum_zalozeni, castka, urok, zakaznik_id) VALUES ('2022-01-01', 20000, 10, 2);
INSERT INTO pujcka (datum_zalozeni, castka, urok, zakaznik_id) VALUES ('2022-01-01', 30000, 15, 3);
INSERT INTO pujcka (datum_zalozeni, castka, urok, zakaznik_id) VALUES ('2022-01-01', 40000, 20, 4);
INSERT INTO pujcka (datum_zalozeni, castka, urok, zakaznik_id) VALUES ('2022-01-01', 50000, 25, 5);

INSERT INTO splatka (datum_splatky, castka, pujcka_id) VALUES ('2022-01-01', 1000, 2);
INSERT INTO splatka (datum_splatky, castka, pujcka_id) VALUES ('2022-02-01', 1000, 2);
INSERT INTO splatka (datum_splatky, castka, pujcka_id) VALUES ('2022-03-01', 1000, 2);
INSERT INTO splatka (datum_splatky, castka, pujcka_id) VALUES ('2022-04-01', 1000, 2);
INSERT INTO splatka (datum_splatky, castka, pujcka_id) VALUES ('2022-05-01', 1000, 2);
  
INSERT INTO karta (cislo_karty, datum_vyprseni, CVC_kod, jmeno_uzivatele, debetni_karta, kreditni_karta, bezkontaktni, online_karta, zakaznik_id, ucet_id) VALUES (123456, '2022-12-01', 123, 'Jan Novak', 1, 0, 1, 0, 1, 1);
INSERT INTO karta (cislo_karty, datum_vyprseni, CVC_kod, jmeno_uzivatele, debetni_karta, kreditni_karta, bezkontaktni, online_karta, zakaznik_id, ucet_id) VALUES (123457, '2023-01-01', 123, 'Petr Novak', 0, 1, 0, 1, 2, 2);
INSERT INTO karta (cislo_karty, datum_vyprseni, CVC_kod, jmeno_uzivatele, debetni_karta, kreditni_karta, bezkontaktni, online_karta, zakaznik_id, ucet_id) VALUES (123458, '2023-02-01', 123, 'Jana Novakova', 0, 1, 1, 0, 3, 3);
INSERT INTO karta (cislo_karty, datum_vyprseni, CVC_kod, jmeno_uzivatele, debetni_karta, kreditni_karta, bezkontaktni, online_karta, zakaznik_id, ucet_id) VALUES (123459, '2023-03-01', 123, 'Jiri Novak', 0, 0, 0, 1, 4, 4);
INSERT INTO karta (cislo_karty, datum_vyprseni, CVC_kod, jmeno_uzivatele, debetni_karta, kreditni_karta, bezkontaktni, online_karta, zakaznik_id, ucet_id) VALUES (123460, '2023-04-01', 123, 'Lenka Novakova', 1, 1, 1, 1, 5, 5);


alter table ucet add column zustatek int;
update ucet set zustatek = 321483842;


alter table pujcka add column delka_pujcky int;
update pujcka set delka_pujcky = 20;
select * from pujcka;

CREATE VIEW nesplacene_uvery AS
SELECT zakaznik.jmeno, zakaznik.prijmeni, kontakt.email, kontakt.tel_cislo, pujcka.castka
FROM zakaznik
INNER JOIN kontakt ON zakaznik.kontakt_id = kontakt.id
INNER JOIN pujcka ON zakaznik.id = pujcka.zakaznik_id;


select * from nesplacene_uvery;


CREATE VIEW ucty_s_vysokym_zustatkem AS
SELECT zakaznik.jmeno, zakaznik.prijmeni, kontakt.email, kontakt.tel_cislo, ucet.zustatek
FROM zakaznik
INNER JOIN ucet ON zakaznik.id = ucet.zakaznik_id
INNER JOIN kontakt ON zakaznik.kontakt_id = kontakt.id
WHERE ucet.zustatek > 10000;

select * from ucty_s_vysokym_zustatkem;

CREATE VIEW uzivatel_s_aktivni_pucjkou AS
SELECT zakaznik.jmeno, zakaznik.prijmeni, kontakt.email, kontakt.tel_cislo,pujcka.castka
FROM zakaznik
INNER JOIN kontakt ON zakaznik.kontakt_id = kontakt.id
INNER JOIN pujcka ON zakaznik.id = pujcka.zakaznik_id
WHERE NOT EXISTS (
    SELECT * FROM splatka WHERE splatka.pujcka_id = pujcka.id
);

select * from uzivatel_s_aktivni_pucjkou;

CREATE VIEW standartni_ucty_v_meste4 AS
SELECT zakaznik.jmeno, zakaznik.prijmeni, ucet.cislo_uctu, ucet.saldo
FROM zakaznik
INNER JOIN ucet ON zakaznik.id = ucet.zakaznik_id
INNER JOIN lokace ON zakaznik.id = lokace.zakaznik_id
WHERE ucet.standartni_ucet = 1 AND lokace.mesto = 'Město 4';

select * from standartni_ucty_v_meste4;



-- Tento pohled vytvoří virtuální tabulku s názvem aktivni_ucty, která bude obsahovat čísla účtů, jména a příjmení zákazníků a zůstatky 
-- na účtech. Pohled bude vybrat data z tabulky ucet a zakaznik a zobrazí pouze účty, které jsou označeny jako "plus účty" a mají zůstatek vyšší než 0.

CREATE VIEW aktivni_ucty AS
SELECT ucet.cislo_uctu, zakaznik.jmeno, zakaznik.prijmeni, ucet.zustatek
FROM ucet
JOIN zakaznik ON ucet.zakaznik_id = zakaznik.id
WHERE ucet.plus_ucet = TRUE AND ucet.zustatek > 0;

select * from aktivni_ucty;


-- Tato procedura se nazývá vytvor_zakaznika a přijímá čtyři parametry: jmeno, prijmeni, email, a tel_cislo. 
-- Tato procedura vytvoří nového zákazníka s danými údaji a vytvoří pro něj také nový záznam v tabulce kontakt.

delimiter //
CREATE PROCEDURE vytvor_zakaznika(IN jmeno VARCHAR(20), IN prijmeni VARCHAR(20), IN email VARCHAR(50), IN tel_cislo INT)
BEGIN
  DECLARE kontakt_id INT DEFAULT 0;

  INSERT INTO kontakt (email, tel_cislo) VALUES (email, tel_cislo);
  SET kontakt_id = LAST_INSERT_ID();
  INSERT INTO zakaznik (jmeno, prijmeni, kontakt_id) VALUES (jmeno, prijmeni, kontakt_id);
END;

CALL vytvor_zakaznika('Jan', 'Novák', 'jan.novak@email.cz', 777777777);

select * from kontakt;
select * from zakaznik;


delimiter //
CREATE PROCEDURE ziskani_pujcky(IN zakaznik_id INT, OUT pujcka_id INT, OUT castka_pujcky INT, OUT urok_z_pujcky INT)
BEGIN
  -- Get the loan information for the customer with the given ID
  SELECT pujcka.id, pujcka.castka, pujcka.urok INTO pujcka_id, castka_pujcky, urok_z_pujcky
  FROM zakaznik
  INNER JOIN pujcka ON zakaznik.id = pujcka.zakaznik_id
  WHERE zakaznik.id = zakaznik_id;
END;

-- Vypíše informace o půjčce
CALL ziskani_pujcky(5, @pujcka_id, @castka_pujcky, @urok_z_pujcky);
SELECT @pujcka_id, @castka_pujcky, @urok_z_pujcky;  


delimiter //
CREATE PROCEDURE zmena_udaju_zakaznika(IN zakaznik_id INT, IN jmeno VARCHAR(20), IN prijmeni VARCHAR(20), IN email VARCHAR(50), IN cislo INT)
BEGIN
  -- Update the customer's information
  UPDATE zakaznik
  SET jmeno = jmeno,
      prijmeni = prijmeni
  WHERE id = zakaznik_id;

  -- Update the customer's contact information
  UPDATE kontakt
  SET email = email,
      tel_cislo = cislo
  WHERE id = (SELECT kontakt_id FROM zakaznik WHERE id = zakaznik_id);
END;

select * from zakaznik;
select * from kontakt;
CALL zmena_udaju_zakaznika(1, 'John', 'Doe', 'john.doe@example.com', 5551234567);


delimiter //
CREATE TRIGGER aktulizace_zustatku_na_uctu
AFTER INSERT ON splatka
FOR EACH ROW
BEGIN
  -- Update the balance of the associated account
  UPDATE ucet
  SET zustatek = zustatek - NEW.castka
  WHERE id = (SELECT ucet_id FROM zakaznik WHERE id = (SELECT zakaznik_id FROM pujcka WHERE id = NEW.pujcka_id));
END;



