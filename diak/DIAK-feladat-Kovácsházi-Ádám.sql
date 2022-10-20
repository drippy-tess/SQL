CREATE DATABASE diak DEFAULT CHARACTER SET utf8 COLLATE utf8_hungarian_ci;
CREATE TABLE tanulok (
    tanuloAZ int PRIMARY KEY AUTO_INCREMENT,
    nev varchar(25),
    nem BINARY,
    szuldatum date,
    szulhely varchar(20),
    osztaly varchar(4),
    nyelvismeret varchar(15)
    );
INSERT INTO `tanulok`(`nev`, `nem`, `szuldatum`, `szulhely`, `osztaly`, `nyelvismeret`) VALUES 
("Bálint Ágnes", 1,"1998.10.17", "Szeged", "10.a", "angol"),
("Vass Barbara", 1,"1999.04.17", "Pécs", "10.b", "angol"),
("Joó Barnabás", 0,"1997.11.09", "Szeged", "11.b", NULL),
("Kedves János", 0,"1996.03.26", "Szeged", "12.a", "német"),
("Mészáros Mária", 1,"1998.01.15", "Budapest", "11.b", "olasz");
UPDATE `tanulok` SET `szulhely`= "Makó" WHERE tanuloAZ = "Kedves János";
ALTER TABLE tanulok ADD magassag SMALLINT;
UPDATE `tanulok` SET `magassag`= 168 WHERE nem = 1;
UPDATE `tanulok` SET `magassag`= 175 WHERE nem = 0;
ALTER TABLE tanulok MODIFY szulhely varchar(25);
UPDATE `tanulok` SET `nev`="Mészáros Mária Erzsébet",`szuldatum`="1998.01.17" WHERE nev = "Mészáros Mária";
DELETE FROM `tanulok` WHERE tanuloAZ = 2;
ALTER TABLE `tanulok` DROP `nyelvismeret`;
CREATE TABLE hianyzasok (
    tanuloAz int,
    hianyzasdatum date,
    igazoltora SMALLINT,
    ingazolatlanora SMALLINT,
    PRIMARY KEY(tanuloAZ, hianyzasdatum)
    );
ALTER table hianyzasok ADD hianyzasOka long;
UPDATE `hianyzasok` SET `hianyzasOka`= "iskolaérdekben történő hiányzás" WHERE tanuloAZ = 1;
UPDATE `hianyzasok` SET `hianyzasOka`= "orvosi igazolás" WHERE tanuloAZ = 1;