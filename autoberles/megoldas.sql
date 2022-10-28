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