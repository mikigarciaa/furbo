drop database if exists bd_futbol; 
create database bd_futbol;
use bd_futbol;

create table liga (
id_liga int not null auto_increment,
tipo_liga varchar(40),
primary key(id_liga)
);

create table equipo (
id_equipo int not null auto_increment,
id_liga int not null,
nombre varchar (40),
ciudad varchar(40),
entrenador varchar(40),
primary key (id_equipo)
);	
 create table partidos (
 id_partido int not null auto_increment,
equipos varchar (60),
 lugar varchar(40),
 fecha date,
 primary key(id_partido)
 );
 
 create table jugadores (
 id_jugadores int not null auto_increment,
 id_equipo int not null,
 nombre varchar (40),
 nacionalidad varchar (40),
 posicion varchar (40),
 primary key (id_jugadores)
 );
 
 create table lesiones(
 id_lesiones int not null auto_increment,
 id_jugadores int not null,
 tipo varchar (60),
 duracion varchar (30),
 grabedad varchar (40),
 primary key (id_lesiones) 
 );
 
 create table estadisticas_partido (
id_estadisticas_part int not null auto_increment,
tiros_puerta int,
faltas int,
tiros_fuera int,
primary key (id_estadisticas_part)
);

create table premios (
id_premios int not null auto_increment,
mejor_jugador varchar (40),
maximo_goleador varchar(40),
mejor_portero varchar (40),
primary key (id_premios)
);

 create table estadisticas_jugadores (
 id_estadisticas_jug int not null auto_increment,
 goles int,
 faltas int,
 asistencias int,
 tarjetas int,
 primary key (id_estadisticas_jug)
 );
 
 create table equipo_partidos (
 id_equipo int not null,
 id_partido int not null,			
 primary key (id_equipo, id_partido)
);

create table equipo_estadisticas_jugadores(
id_equipo int not null,
id_estadisticas_jug int not null,
primary key (id_equipo, id_estadisticas_jug)
);

create table equipo_estad_partidos(
id_equipo int not null,
id_estadisticas_part int not null,
primary key(id_equipo, id_estadisticas_part) 
);

create table equipo_premios(
id_equipo int not null,
id_premios int not null,
primary key(id_equipo, id_premios)
);
 
 alter table equipo
add constraint f1 foreign key (id_liga) references liga (id_liga);
 
alter table jugadores
add constraint f2 foreign key (id_equipo) references equipo (id_equipo);
 
alter table lesiones
add constraint f3 foreign key (id_jugadores) references jugadores (id_jugadores);
 
alter table equipo_partidos
add constraint f4 foreign key (id_equipo) references equipo (id_equipo),
add constraint f5 foreign key (id_partido) references partidos (id_partido);
 
alter table equipo_estadisticas_jugadores
add constraint f6 foreign key (id_equipo) references equipo (id_equipo),
add constraint f7 foreign key (id_estadisticas_jug) references estadisticas_jugadores (id_estadisticas_jug);
 
alter table equipo_estad_partidos 
add constraint f8 foreign key (id_equipo) references equipo (id_equipo),
add constraint f9 foreign key (id_estadisticas_part) references estadisticas_partido (id_estadisticas_part);

alter table equipo_premios 
add constraint f10 foreign key (id_equipo) references equipo (id_equipo),
add constraint f11 foreign key (id_premios) references premios  (id_premios);


insert into liga values (1, 'Laliga');
insert into liga values (2, 'Bundes Liga ');
insert into liga values (3, 'Premier league ');
insert into liga values (4, 'Ligue 1');
insert into liga values (5, 'Serie A');	

insert into equipo values (1, 1, 'FC Barcelona', 'Barcelona', 'Xavi Hernandez' );
insert into equipo values (2, 2, 'Bayer de Munich', 'Munich', 'Thomas Tuchel	' );
insert into equipo values (3, 3, 'Chelsea ', 'Londres ', 'Mauricio Pochettino' );
insert into equipo values (4, 4, 'PSG', 'Paris ', 'Christophe Galtier' );
insert into equipo values (5, 5, 'Inter', 'Milan', 'Simone Inzaghi' );

insert into jugadores values (1, 1, 'Pablo Martín Páez Gavira', 'Español', 'Centro campista'); 
insert into jugadores values (2, 2, 'João Cancelo J. Cancelo ', 'Portuges', 'Lateral derecho'); 
insert into jugadores values (3, 3, 'Golo Kanté N. Kanté ', 'Frances', 'Pivote'); 
insert into jugadores values (4, 4, ' Lionel Messi ', 'Argentino', 'Delantero'); 
insert into jugadores values (5, 5, 'Milan Škriniar', 'Eslaco', 'Defensa');

insert into lesiones values(1, 1, 'Pablo Martín Páez Gavira', '1 mes', 'Leve');
insert into lesiones values(2, 2, 'João Cancelo J. Cancelo', '4 meses', 'Leve');
insert into lesiones values(3, 3, 'Golo Kanté N. Kanté', '6 meses', 'Media');
insert into lesiones values(4, 4, 'Lionel Messi', '2 años', 'Grave');
insert into lesiones values(5, 5, 'Milan Škriniar', '2 meses ', 'Leve');

insert into partidos values(1, 'Bayer vs Chelsea', 'Allianz Arena', '2023-03-16');
insert into partidos values(2, 'Barcelona vs Inter', 'Estadio de San Siro	', '2023-05-25');
insert into partidos values(3, 'Inter vs Chelsea', 'Stamford Bridge', '2023-01-05');
insert into partidos values(4, 'PSG vs Bayer', 'Parque de los Príncipes', '2023-02-14');
insert into partidos values(5, 'Barcelona vs PSG', 'Spotify Camp Nou ', '2023-03-25');

insert into estadisticas_partido values(1, 6, 10, 2);
insert into estadisticas_partido values(2, 20, 3, 5);
insert into estadisticas_partido values(3, 4, 8, 10);
insert into estadisticas_partido values(4, 30, 15, 6);
insert into estadisticas_partido values(5, 8, 5, 7);

insert into estadisticas_jugadores values(1, 2, 3, 1, 1);
insert into estadisticas_jugadores values(2, 2, 2, 2, 0);
insert into estadisticas_jugadores values(3, 5, 5, 2, 2);
insert into estadisticas_jugadores values(4, 1, 3, 4, 3);
insert into estadisticas_jugadores values(5, 2, 3, 3, 0);

insert into premios values(1, 'Robert Lewandowski', 'Robert Lewandowski', 'Marc-André ter Stegen');
insert into premios values(2, 'Jude Bellingham', 'Jude Bellingham', 'Koen Casteels');
insert into premios values(3, 'Erling Haaland', 'Erling Haaland', 'José Sá');
insert into premios values(4, 'kylian mbappé', 'kylian mbappé', 'Gianluigi Donnarumma');
insert into premios values(5, 'Rafael Leão', 'Rafael Leão', ' Ivan Provedel');

insert into  equipo_estadisticas_jugadores values(1, 1);
insert into  equipo_estadisticas_jugadores values(2, 2);
insert into  equipo_estadisticas_jugadores values(3, 3);
insert into  equipo_estadisticas_jugadores values(4, 4);
insert into  equipo_estadisticas_jugadores values(5, 5);

insert into  equipo_estad_partidos values(1, 1);
insert into  equipo_estad_partidos values(2, 2);
insert into  equipo_estad_partidos values(3, 3);
insert into  equipo_estad_partidos values(4, 4);
insert into  equipo_estad_partidos values(5, 5);

insert into  equipo_partidos values(1, 1);
insert into  equipo_partidos values(2, 2);
insert into  equipo_partidos values(3, 3);
insert into  equipo_partidos values(4, 4);
insert into  equipo_partidos values(5, 5);

insert into  equipo_premios values(1, 1);
insert into  equipo_premios values(2, 2);
insert into  equipo_premios values(3, 3);
insert into  equipo_premios values(4, 4);
insert into  equipo_premios values(5, 5);