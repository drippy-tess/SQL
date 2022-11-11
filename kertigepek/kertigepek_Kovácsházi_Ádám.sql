create database kertigepek default character set utf8 collate utf8_hungarian_ci;

create table kategoria(
kategoriaID int AUTO_INCREMENT primary key,
kategorianev varchar(60)
);

create table gepek(
cikkszam int primary key,
gepnev varchar(40) not null unique,
ar int not null,
raktarkeszlet tinyint,
suly float,
index(suly),
engedmenyes binary,
kategoriaID int,
foreign key(kategoriaID) references kategoria(kategoriaID)
);

INSERT INTO `kategoria`("kategorianev") VALUES 
("akkumulátoros bozótvágó"),
("benzinmotoros fûrész"),
("elektromos lombszívó"),
("permetezõ");

INSERT INTO `gepek`(`cikkszam`, `gepnev`, `ar`, `raktarkeszlet`, `suly`, `engedmenyes`, `kategoriaID`) VALUES 
(15630, "RURIS DAC 401S", 39990, 11, 5.5, 0, 2),
(89142, "STIGA SGT 48AE", 33900, 7, 3.8, 1, 1),
(36255, "RIWALL RPCS 6250", 69990, 3, 5.4, 1, 1),
(78025, "Wolf-Garten LBV 2600 E", 18990, 18, 1.6, 0, 3);

create index kategorianev_idx on kategoria(kategorianev);

drop index suly on gepek;

UPDATE gepek SET raktarkeszlet = 15 WHERE cikkszam = 89142;

update gepek set ar = ar * 0.9 where engedmenyes = 1;

alter table gepek add nettoar float;

update gepek set nettoar = ar / 1.27;

alter table gepek modify raktarkeszlet smallint;

delete from gepek where engedmenyes = 1 and suly > 5;

alter table gepek drop engedmenyes;
