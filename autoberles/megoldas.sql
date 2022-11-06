create DATABASE autoberles DEFAULT CHARACTER set utf8 COLLATE utf8_hungarian_ci;

create table berles 
(
	id int AUTO_INCREMENT primary key,
    nev varchar(100) not null,
    jogositvany varchar(15) not null,
    telefonszam varchar(20)    
);

create table autok
(
	id int AUTO_INCREMENT primary key,
    rendszam varchar(6) not null UNIQUE,
    tipus varchar(100) not null,
    evjarat int,
    szin varchar(30)
);

create table kolcsonzes 
(
	id int AUTO_INCREMENT PRIMARY key,
    berleskezdete date not null,
    napokszama int,
    napidij float not null,
    berloid int,
    autoid int,
    FOREIGN KEY(berloid) REFERENCES berles(id),
    FOREIGN key(autoid) REFERENCES autok(id)
    
);

INSERT INTO `autok`(`rendszam`, `tipus`, `evjarat`, `szin`) VALUES 
("ABC456", "Ford KA", 2003, "Pink"),
("ABC123", "Volkswagen Golf", 2011, "Fehér"),
("ABC157", "Ford Mondeo", 2015, "Fekete"),
("ABC448", "Volkswagen Golf", 2012, "Kék");

insert into "berlok" ("nev", "jogositvany", "telefonszam") values
("Kandur Karoly", "LR337157", "06-41-334112"),
("Gipsz Jakab", "VE445112", "06-41-555223");

insert into "kolcsonzes" ("berleskezdete", "napokszama", "napidij", "berloid", "autoid") values
("2017-04-23", 6, 12500, 1, 3),
("2017-04-25", NULL, 9999, 2, 2);

create index jogositvany_idx on berles(jogositvany);

alter table autok add unique(rendszam);

drop index rendszam on autok;

alter table autok modify evjarat int;

alter table autok add veteliar bigint;

update "autok" set "veteliar" = 5000000 where "tipus" = "Ford";
update "autok" set "veteliar" = 4300000 where "tipus" = "Volkswagen";

alter table autok add afa bigint;

update "autok" set "afa" = vetelar * 1.27;

delete from autok where "szin" = "Fehér";