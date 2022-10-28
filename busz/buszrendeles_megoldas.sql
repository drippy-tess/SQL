CREATE DATABASE busrendeles11b DEFAULT CHARACTER SET utf8 COLLATE utf8_hungarian_ci;

CREATE TABLE busz
(
    sorszam int AUTO_INCREMENT PRIMARY key,
    ferohely tinyint,
    tipus varchar(60) not null UNIQUE,
    komfort varchar(40),
    kmdij SMALLINT not null,
    oradij SMALLINT not null,
    INDEX(kmdij)
);

CREATE table rendeles
(
    busz_szam int,
    rendelesdatum date not null,
    megrendelo varchar(50) not null,
    nap tinyint not null,
    km_e binary,
    INDEX(rendelesdatum),
    FOREIGN key(busz_szam) REFERENCES busz(sorszam)
);

INSERT INTO `busz`(`ferohely`, `tipus`, `komfort`, `kmdij`, `oradij`) VALUES 
(74, "NEOPLAN, SETRA-228 (emeletes)",	"légkondícionált, hűtő, wc	345	8200", 345, 8200),
(9, "VW, FORD, MERCEDES VITO",	"légkondícionált", 145, 3300),
(21, "MERCEDES VARIAO, IVECO",	"légkondícionált", 185, 4200),
(53, "NEOPLAN, BOVA, MERCEDES",	"légkondícionált, hűtő, wc", 265, 5700);

INSERT INTO `rendeles`(`busz_szam`, `rendelesdatum`, `megrendelo`, `nap`, `km_e`) VALUES 
(1, "2020-10-05", "Balogh Endre", 6, 1),
(2, "2020-06-01", "Jókai Gimnázium", 5, 1),
(1, "2020-06-16", "Kossuth L. Ált. Isk.", 3, 0),
(4, "2020-09-25", "Guriga Kft.", 10, 0),
(3, "2020-10-18", "Zöldike Bt.", 7, 1);

drop index kmdij on busz;

create index komfort_idx on busz(komfort);

alter table rendeles MODIFY megrendelo varchar(100);

UPDATE `busz` SET kmdij=kmdij*1.2,`oradij`=oradij*1.12 WHERE tipus like "NEOPLAN%";

INSERT INTO `busz`(`ferohely`, `tipus`, `komfort`, `kmdij`, `oradij`) VALUES 
(28, "MITSUBISHI", "légkondícionált", 209, 4700);

alter table rendeles add fizetendo float;

UPDATE `rendeles` SET `fizetendo`=7 *2600 * nap * 1.27 WHERE km_e = 0;

alter table rendeles add primary key(busz_szam, rendelesdatum);

delete from rendeles WHERE rendelesdatum BETWEEN "2020-09-01" and "2020-11-30" and km_e = 1;

alter table busz drop komfort;
