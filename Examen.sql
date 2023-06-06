drop database if exists Futbol;
create database Futbol;
use Futbol;

create table Equipo(
	idEquipo int primary key,
    nombre varchar(50),
    presupuesto float
);

create table Futbolista(
	idFutbolista int primary key,
    nombre varchar(50),
    posicion varchar(50),
    salario float,
    idEquipo int,
    foreign key (idEquipo) references Equipo(idEquipo)
);

insert into Equipo values (1,'Equipo Rojo',124274224.62);
insert into Equipo values (2,'Equipo Azul',25257526.71);

insert into Futbolista values (71,'Pepe','Delantero',724724.85,1);
insert into Futbolista values (82,'Paco','Portero',1561515.66,1);
insert into Futbolista values (65,'Antonio','Defensa',414662.55,1);

insert into Futbolista values (32,'Laura','Delantero',15151515.26,2);
insert into Futbolista values (25,'Carmen','Portero',52525252.75,2);
insert into Futbolista values (44,'Antonia','Defensa',9257258.71,2);

select equipo.nombre as nombreEquipo,futbolista.nombre,posicion,salario 
from Futbolista inner join Equipo on equipo.idEquipo = futbolista.idEquipo;

update futbolista set idEquipo=2 where idFutbolista = 71;
select * from futbolista;

alter table Equipo add copasRey varchar(100);
select * from Equipo;

update Equipo set copasRey='2016,2018,2021' where idEquipo=1;
select * from Equipo;

delete from Equipo where idEquipo=1;