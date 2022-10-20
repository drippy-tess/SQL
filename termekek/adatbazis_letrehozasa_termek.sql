-- Adatbázis létrehozása
CREATE DATABASE termek11b CHARACTER SET=utf8 COLLATE utf8_hungarian_ci;

CREATE TABLE zoldseg
(
    sorszam int PRIMARY KEY,
    nev varchar(25),
    ar SMALLINT,
    besz_datum date,
    engedmenyes BINARY
);

INSERT INTO `zoldseg`
(`sorszam`, `nev`, `ar`, `besz_datum`, `engedmenyes`)
VALUES 
(1, 'kelkáposzta', 310, '2022-09-14', 0),
(2, 'burgonya', 240, '2022-08-30', 0),
(3, 'kukorica', 150, '2022-09-19', 1),
(4, 'vöröshagyma', 180, '2022-09-30', 1);

INSERT INTO `zoldseg`(`sorszam`, `nev`, `ar`, `besz_datum`, `engedmenyes`)
VALUES
(5,'karalábé',320,'2022-09-18',1);

RENAME TABLE zoldseg to zoldsegek;

ALTER TABLE zoldseg MODIFY nev varchar(30);

ALTER TABLE zoldseg MODIFY nev varchar(10);

ALTER TABLE zoldseg MODIFY ar int;

ALTER TABLE zoldseg MODIFY ar tinyint;

ALTER TABLE zoldseg ADD megjegyzes text;

ALTER TABLE zoldseg DROP megjegyzes;

ALTER TABLE zoldseg DROP PRIMARY KEY;

ALTER TABLE zoldseg ADD PRIMARY KEY(sorszam);

ALTER TABLE zoldseg DROP sorszam;

ALTER TABLE zoldseg ADD sorszam int AUTO_INCREMENT PRIMARY KEY first;

INSERT INTO `zoldseg`(`sorszam`, `nev`, `ar`, `besz_datum`, `engedmenyes`) VALUES (NULL,'sárgarépa',100,'2022-09-07',1);

INSERT INTO `zoldseg`(`nev`, `ar`, `besz_datum`, `engedmenyes`) VALUES ('tök',70,'2022-09-05',1);

TRUNCATE zoldseg;

DROP TABLE zoldseg;

DROP DATABASE termek11b2;

UPDATE zoldseg SET ar = ar * 1.18 WHERE engedmenyes = 0;

UPDATE zoldseg SET nev = "krumpli" WHERE nev = "burgonya";

-- A 2022 Szeptember második felében beszerzett termékek árát csökkentsük 10%-al, és ne legyenek engedményesek.
UPDATE zoldseg SET ar = ar * 0.9, engedmenyes = 0 WHERE besz_datum BETWEEN '2022-09-16' AND '2022-09-30';

DELETE FROM zoldseg WHERE ar > 250;

ALTER TABLE zoldseg ADD bruttoar float; 

UPDATE zoldseg SET bruttoar = ar * 1.27;