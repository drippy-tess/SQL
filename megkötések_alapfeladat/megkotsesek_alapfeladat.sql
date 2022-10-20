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