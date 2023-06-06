drop database if exists HitoGrupalAndalucia;
create database HitoGrupalAndalucia;
use HitoGrupalAndalucia;

create table Provincias (
	idProvincia int primary key auto_increment,
    nombre varchar(50)
);
create table Ciudades (
	idCiudad int primary key auto_increment,
    nombre varchar(50),
    puntos_interes varchar(50),
    barrios varchar(50),
    idProvincia int,
    foreign key(idProvincia) references Provincias(idProvincia)
);
create table Carreteras (
	idCarretera int primary key auto_increment,
    nombre varchar(50),
    tipo varchar(50),
    presupuesto float
);
create table Ayuntamientos (
	idAyuntamiento int primary key auto_increment,
    nombre varchar(50),
    alcalde varchar(50),
    presupuesto float,
    calle varchar(50)
);
create table Ciudadanos (
	idCiudadanos int primary key auto_increment,
    nombre varchar(50),
    ciudad varchar(50)
    
);
create table Carreteras_Ciudades (
	idCarreterasCiudades int primary key auto_increment,
    idCiudad int,
    idCarretera int,
    foreign key (idCiudad) references Ciudades (idCiudad),
    foreign key (idCarretera) references Carreteras (idCarretera)
);

insert into Provincias values (1, 'Almería');
insert into Provincias values (2, 'Cádiz');
insert into Provincias values (3, 'Córdoba');
insert into Provincias values (4, 'Granada');
insert into Provincias values (5, 'Huelva');
insert into Provincias values (6, 'Jaén');
insert into Provincias values (7, 'Málaga');
insert into Provincias values (8, 'Sevilla');

insert into Ciudades values (null, 'Antequera', 'Alcazaba','El Carmen',7 );
insert into Ciudades values (null, 'Algeciras', 'Plaza Alta','El Cobre',2 );
insert into Ciudades values (null, 'Ronda', 'Centro de Interpretación de Puente Nuevo','Figares',7);
insert into Ciudades values (null, 'Úbeda', 'Sinagoga del Agua','Santo Domingo',6);
insert into Ciudades values (null, 'Baeza', 'Plaza del Pópulo','Barrio de Baeza',5);
insert into Ciudades values (null, 'Sanlúcar de barrameda', 'Castillo de Santiago','La Jara',4);
insert into Ciudades values (null, 'Málaga', 'La Rosaleda','El Muelle', 7);
insert into Ciudades values (null, 'Jerez de la Frontera', 'Catedral de Jerez','Santiago',6);

insert into Carreteras values (null, 'C1','Autopista',157600.52);
insert into Carreteras values (null, 'C2','Autopista',4424600.71);
insert into Carreteras values (null, 'C3','Autovía',15762400.92);
insert into Carreteras values (null, 'C4','Autovía',2576100.25);
insert into Carreteras values (null, 'C5','Carretera nacional',85766300.95);

insert into Ayuntamientos values (null, 'Ayuntamiento de Antequera','Manuel Jesús Barón',120205,'Calle de los Molinos');
insert into Ayuntamientos values (null, 'Ayuntamiento de Algeciras','José Ignacio Landaluce',90205,'Calle Serranillos del Valle');
insert into Ayuntamientos values (null, 'Ayuntamiento de Ronda','María de la Paz Fernández',52525.25,'Calle Cristiano Ronaldo');
insert into Ayuntamientos values (null, 'Ayuntamiento de Úbeda','Antonia Olivares Martínez',97525.14,'Calle Ferrocarril');
insert into Ayuntamientos values (null, 'Ayuntamiento de Baeza','María Dolores Marín Torres',19155.25,'Calle de los Olivos');
insert into Ayuntamientos values (null, 'Ayuntamiento de Salúcar','Victor Mora',982542.85,'Calle Panamá');
insert into Ayuntamientos values (null, 'Ayuntamiento de Málaga','Francisco de la Torre Prados',104819.65,'Calle de Florentino');
insert into Ayuntamientos values (null, 'Ayuntamiento de Jerez','Mamen Sánchez Díaz',25265,'Calle Pistón');

insert into Ciudadanos values (null, 'José Antonio Pérez','Sevilla');
insert into Ciudadanos values (null, 'Mauro Maeso','Cádiz');
insert into Ciudadanos values (null, 'Paula del Pilar','Málaga');
insert into Ciudadanos values (null, 'Paco fernández','Jerez de la Frontera');
insert into Ciudadanos values (null, 'Toñi Felis','Úbeda');
insert into Ciudadanos values (null, 'Carmelo Escribano','Ronda');
insert into Ciudadanos values (null, 'Pepe Manoli','Huelva');
insert into Ciudadanos values (null, 'Tracy Young','Sevilla');
insert into Ciudadanos values (null, 'Óscar García','Sevilla');
insert into Ciudadanos values (null, 'Laura Gamonal','Málaga');

insert into Carreteras_Ciudades values (null, 1,1);
insert into Carreteras_Ciudades values (null, 2,2);
insert into Carreteras_Ciudades values (null, 3,3);
insert into Carreteras_Ciudades values (null, 4,4);
insert into Carreteras_Ciudades values (null, 5,5);

select nombre,ciudad from Ciudadanos where ciudad='Sevilla';
select * from INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'hitogrupalandalucia';
select avg(presupuesto) as MediaPresupuestos from carreteras;
select provincias.nombre,ciudades.nombre from provincias inner join ciudades on ciudades.idprovincia = provincias.idprovincia;
select * from carreteras where presupuesto > 10000000;
select * from carreteras where nombre!='C3';
select count(idProvincia) from provincias;
select Carreteras.idCarretera,Carreteras.nombre,tipo,presupuesto,Ciudades.nombre from Carreteras inner join Carreteras_Ciudades on carreteras.idCarretera = Carreteras_Ciudades.idcarretera
inner join Ciudades on Carreteras_Ciudades.idCiudad = Ciudades.idCiudad;
select alcalde, nombre, presupuesto from Ayuntamientos where presupuesto < 100000 order by presupuesto desc;
select nombre from Ciudadanos where nombre like 'p%';

select * from ciudadanos;
update Ciudadanos set nombre = 'Paco Curro' where idCiudadanos = 1;
select * from ciudadanos;
delete from ciudades where nombre like 's%'; -- Para conseguir borrar las ciudades que empiecen por 'S' hemos tenido que desactivar el modo seguro. Para ello nos vamos a edit >  Preferences > SQL Editor > 
-- y hacemos click en la opción "safe updates" (tiene que estar desactivado)
select * from ciudades;
update ayuntamientos set presupuesto=725627 where alcalde = 'Victor Mora';
select * from ayuntamientos;
delete from carreteras_ciudades where idCarretera > 2 ;
select * from carreteras_ciudades;
