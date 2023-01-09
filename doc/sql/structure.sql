create database banka;
use banka;

SET @@SQL_SAFE_UPDATES = 0;
select @@AUTOCOMMIT;
set AUTOCOMMIT=0;

begin;
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
commit;

begin;
alter table ucet add column zustatek int;
commit;

begin;
alter table pujcka add column delka_pujcky int;
commit;

select * from pujcka;

begin;
alter table pujcka add column pocet_splatek int;
commit;

select * from pujcka;

select * from pujcka;

begin;
CREATE VIEW nesplacene_uvery AS
SELECT zakaznik.jmeno, zakaznik.prijmeni, kontakt.email, kontakt.tel_cislo, pujcka.castka
FROM zakaznik
INNER JOIN kontakt ON zakaznik.kontakt_id = kontakt.id
INNER JOIN pujcka ON zakaznik.id = pujcka.zakaznik_id;
commit;

select * from nesplacene_uvery;

begin;
CREATE VIEW ucty_s_vysokym_zustatkem AS
SELECT zakaznik.jmeno, zakaznik.prijmeni, kontakt.email, kontakt.tel_cislo, ucet.zustatek
FROM zakaznik
INNER JOIN ucet ON zakaznik.id = ucet.zakaznik_id
INNER JOIN kontakt ON zakaznik.kontakt_id = kontakt.id
WHERE ucet.zustatek > 10000;
commit;

select * from ucty_s_vysokym_zustatkem;

begin;
CREATE VIEW uzivatel_s_aktivni_pucjkou AS
SELECT zakaznik.jmeno, zakaznik.prijmeni, kontakt.email, kontakt.tel_cislo,pujcka.castka
FROM zakaznik
INNER JOIN kontakt ON zakaznik.kontakt_id = kontakt.id
INNER JOIN pujcka ON zakaznik.id = pujcka.zakaznik_id
WHERE NOT EXISTS (
    SELECT * FROM splatka WHERE splatka.pujcka_id = pujcka.id
);
commit;

select * from uzivatel_s_aktivni_pucjkou;


-- Tento pohled vytvoří virtuální tabulku s názvem aktivni_ucty, která bude obsahovat čísla účtů, jména a příjmení zákazníků a zůstatky 
-- na účtech. Pohled bude vybrat data z tabulky ucet a zakaznik a zobrazí pouze účty, které jsou označeny jako "plus účty" a mají zůstatek vyšší než 0.
begin;
CREATE VIEW aktivni_ucty AS
SELECT ucet.cislo_uctu, zakaznik.jmeno, zakaznik.prijmeni, ucet.zustatek
FROM ucet
JOIN zakaznik ON ucet.zakaznik_id = zakaznik.id
WHERE ucet.plus_ucet = TRUE AND ucet.zustatek > 0;
commit;

select * from aktivni_ucty;


-- Tato procedura se nazývá vytvor_zakaznika a přijímá čtyři parametry: jmeno, prijmeni, email, a tel_cislo. 
-- Tato procedura vytvoří nového zákazníka s danými údaji a vytvoří pro něj také nový záznam v tabulce kontakt.
begin;
delimiter //
CREATE PROCEDURE vytvor_zakaznika(IN jmeno VARCHAR(20), IN prijmeni VARCHAR(20), IN email VARCHAR(50), IN tel_cislo INT)
BEGIN
  DECLARE kontakt_id INT DEFAULT 0;

  INSERT INTO kontakt (email, tel_cislo) VALUES (email, tel_cislo);
  SET kontakt_id = LAST_INSERT_ID();
  INSERT INTO zakaznik (jmeno, prijmeni, kontakt_id) VALUES (jmeno, prijmeni, kontakt_id);
END;
commit;

CALL vytvor_zakaznika('Jan', 'Novák', 'jan.novak@email.cz', 777777777);

select * from kontakt;
select * from zakaznik;

begin;
delimiter //
CREATE PROCEDURE ziskani_pujcky(IN zakaznik_id INT, OUT pujcka_id INT, OUT castka_pujcky INT, OUT urok_z_pujcky INT)
BEGIN
  -- Get the loan information for the customer with the given ID
  SELECT pujcka.id, pujcka.castka, pujcka.urok INTO pujcka_id, castka_pujcky, urok_z_pujcky
  FROM zakaznik
  INNER JOIN pujcka ON zakaznik.id = pujcka.zakaznik_id
  WHERE zakaznik.id = zakaznik_id;
END;
commit;

-- Vypíše informace o půjčce
CALL ziskani_pujcky(5, @pujcka_id, @castka_pujcky, @urok_z_pujcky);
SELECT @pujcka_id, @castka_pujcky, @urok_z_pujcky;  

begin;
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
commit;


select * from zakaznik;
select * from kontakt;
CALL zmena_udaju_zakaznika(1, 'John', 'Doe', 'john.doe@example.com', 555123456);

begin;
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
commit;

begin;
delimiter //
CREATE TRIGGER zabraneni_vice_sporicim_uctum
BEFORE INSERT ON ucet
FOR EACH ROW
BEGIN
  IF NEW.sporici_ucet = 1 THEN
    IF (SELECT COUNT(*) FROM ucet WHERE zakaznik_id = NEW.zakaznik_id AND sporici_ucet = 1) > 0 THEN
      SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Zákazník může mít pouze jeden spořicí účet';
    END IF;
  END IF;
END;
commit;


begin;
create index pobocka_index on pobocka(nazev);
create index zakaznik_index on zakaznik(jmeno,prijmeni);
create index zamestnanec_index on zamestnanec(jmeno,prijmeni);
commit;

begin;
create user "uzivatel"@"%" identified by "uzivatel123";
GRANT SELECT on banka.* to "uzivatel"@"%";
commit;
begin;
create user "administrator"@"%" identified by "administrator123";
GRANT all privileges on banka.* to "administrator"@"%";
commit;
begin;
create user "zamestnanec"@"%" identified by "zamestnanec123";
GRANT SELECT,INSERT,UPDATE on banka.* to "zamestnanec"@"%";
commit;



