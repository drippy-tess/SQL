-- 1. 
CREATE DATABASE ruhazat11b DEFAULT CHARACTER SET utf8 COLLATE utf8_hungarian_ci;

-- 2.
CREATE TABLE termekek
(
  cikkszam int AUTO_INCREMENT PRIMARY KEY,
  menev varchar(15),
  nettoar int,
  afakulcs float,
  keszlet SMALLINT,
  akcio BINARY
);

INSERT INTO `termekek`(`menev`, `nettoar`, `afakulcs`, `keszlet`, `akcio`) VALUES
("Pulóver",5000,0.25,10,1),
("Széldzseki",12000,0.25,10,0),
("Póló",1500,0,15,0),
("Nyakkendő",890,0.25,10,0),
("Ing",4500,0.12,8,1),
("Öltöny",18000,0.25,9,1),
("Farmer",8000,0.25,11,0);

-- 3.
UPDATE termekek SET menev= "Férfi öltöny" WHERE menev = "Öltöny";

-- 4.
UPDATE termekek SET nettoar = 11500, akcio = 1 WHERE menev = "Széldzseki";

-- 5.
ALTER TABLE termekek ADD bruttoar float;

-- 6.
UPDATE termekek SET bruttoar = nettoar * (1 + afakulcs);

-- 7.
UPDATE `termekek` SET `nettoar`= nettoar * 0.75 WHERE akcio = 1;
UPDATE termekek SET bruttoar = nettoar * (1 + afakulcs);

-- 8.
ALTER TABLE termekek MODIFY keszlet tinyint;

-- 9.
DELETE FROM termekek WHERE akcio = 0 AND nettoar< 2000;

-- 10.
CREATE TABLE szallitok 
(
szallitokod int AUTO_INCREMENT PRIMARY KEY,
cegnev varchar(20),
szekhely varchar(20),
cim varchar(40)
);

-- 11.
INSERT INTO `szallitok`(`szallitokod`, `cegnev`, `szekhely`, `cim`) VALUES
(NULL,"Kinizsi Kft.","Szeged","Tisza L. Sgt. 3."),
(NULL,"Zsuzsi Butik","Makó","Szegedi u. 14."),
(NULL,"Elegance","Szentes","Kossuth út 18.");

-- 12.
UPDATE szallitok SET szekhely = "Hódmezővásárhely" WHERE cegnev = "Elegance";

-- 13.
ALTER TABLE szallitok ADD irsz varchar(4);

-- 14.
UPDATE szallitok SET irsz = "6900" WHERE szekhely = "Makó";
UPDATE szallitok SET irsz = "6800" WHERE szekhely = "Hódmezővásárhely";

-- 15.
INSERT INTO `szallitok`(`szallitokod`, `cegnev`, `szekhely`, `cim`, `irsz`) VALUES
(NULL, "Blöki kutyakozmetika", "Szegedi", "Budai Nagy Antal u. 2.", "6753");

-- 16.
CREATE TABLE vasarlas
(
	cikkszam int,
    vasarlas_datuma date,
    mennyiseg SMALLINT,
    szallitokod int,
    PRIMARY KEY (cikkszam, vasarlas_datuma)
);

-- 17.
INSERT INTO `vasarlas`(`cikkszam`, `vasarlas_datuma`, `mennyiseg`, `szallitokod`) VALUES 
(1,"2022-01-25",2,1),
(8,"2021-11-14",3,2),
(4,"2022-06-25",4,3),
(5,"2022-10-01",2,3),
(6,"2022-07-26",3,3),
(8,"2022-08-09",5,2),
(6,"2022-04-11",3,3),
(3,"2022-06-14",5,1),
(1,"2022-06-14",2,1),
(4,"2021-10-29",6,3),
(7,"2022-21-20",2,2),
(3,"2021-12-25",2,1);

-- 18.
DELETE FROM vasarlas WHERE vasarlas_datuma BETWEEN "2022-06-01" AND "2022-07-31";

-- 19.
UPDATE vasarlas SET mennyiseg= mennyiseg * 2 WHERE cikkszam = 5; 