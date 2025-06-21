create database BD_AIR_MAROC;
use BD_AIR_MAROC;

create table pilote(
	num_pil int primary key auto_increment,
    mon_pil varchar(25) not null,
    ville varchar(50) not null,
    salaire varchar(20) not null
);

create table avion(
	num_av int primary key auto_increment,
    nom_av varchar(40) not null,
    capacite double not null,
    ville varchar(50) not null
);

create table vol(
	num_vol int primary key auto_increment,
    num_pil int not null,
    num_av int not null,
    ville_dep varchar(50),
    ville_arr varchar(50),
    h_dep datetime default current_timestamp,
    h_arr datetime default current_timestamp,
    foreign key(num_pil) references pilote(num_pil),
    foreign key(num_av) references avion(num_av)
);

alter table pilote
add column age int not null;

alter table pilote
modify column salaire varchar(50);

insert into pilote (mon_pil, ville, salaire, age)
values("Jean Dupont", "Paris", "5000", 30);

insert into avion (nom_av , capacite, ville) 
values("Boeing 747", 300, "Lyon");

insert into vol(num_pil, num_av, ville_dep, ville_arr)
values(1, 1, "Paris", "Lyon");

select * from pilote;
select * from avion;
select * from vol;

drop database BD_AIR_MAROC;