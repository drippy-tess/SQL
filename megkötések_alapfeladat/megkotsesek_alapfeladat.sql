CREATE DATABASE iskola11b DEFAULT CHARACTER SET utf8 COLLATE utf8_hungarian_ci;

CREATE TABLE diak (
    diakAZ int PRIMARY KEY,
    nev varchar(100) NOT null,
    email varchar(100) NOT null UNIQUE,
    szuldatum date NOT null,
    testverszam tinyint,
    INDEX(nev),
    INDEX(szuldatum)
);

drop index szuldatum on diak;

CREATE UNIQUE INDEX email_idx on diak(email);

ALTER TABLE diak DROP INDEX email;

ALTER TABLE diak drop diakAZ;

alter table diak add diakAZ int AUTO_INCREMENT PRIMARY KEY FIRST;

ALTER table diak add osztaly varchar(6);

CREATE table osztalyok
(
	osztaly varchar(6) PRIMARY KEY,
    osztalyfonok varchar(40) not null,
    osztalyterem tinyint UNIQUE
);

INSERT INTO `osztalyok`(`osztaly`, `osztalyfonok`, `osztalyterem`) VALUES 
("9.a","Vass Mária",30),
("9.b", "Tóth Márton", 14),
("9.c", "Kovácsné Kertész Etelka", 32);