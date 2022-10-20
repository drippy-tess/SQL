CREATE DATABASE bank11b DEFAULT CHARACTER SET utf8 COLLATE utf8_hungarian_ci;
CREATE TABLE bankszamla
(
    szlaszam int PRIMARY KEY,
    tulajdonos varchar(30),
    szlanyitas date,
    valtanem varchar(10),
    egyenleg int,
    kiemelt BINARY
);
INSERT INTO `bankszamla`(`szlaszam`, `tulajdonos`, `szlanyitas`, `valtanem`, `egyenleg`, `kiemelt`) VALUES
(4589236,"Balogh Zoltán","2017-05-06","HUF",3150410,1),
(1200158,"Kelemen Rozália","2000-06-14","EUR",26900,0),
(2360500,"Vass Mária","1998-11-04","USD",8750,0),
(7825047,"Kertész István","2015-12-18","HUF",1540080,1),
(9602511,"Molnár Réka","2001-03-30","EUR",97000,0),
(3652011,"Verebes Krisztina","2016-05-28","HUF",473200,0),
(5699872,"Tari Vilmos","2004-10-17","USD",5800,1);
UPDATE `bankszamla` SET `tulajdonos`= "Molnár Réka Adrienn" WHERE `tulajdonos` = "Molnár Réka";
ALTER TABLE bankszamla MODIFY valtanem varchar(3);
ALTER TABLE bankszamla ADD bankado SMALLINT;
DELETE FROM bankszamla WHERE szlaszam;
DELETE FROM bankszamla WHERE valtanem = "USD";