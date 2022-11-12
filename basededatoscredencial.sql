create database escuela;
use escuela;
drop database escuela;
create table usuarios(
ncontrolusuario varchar (9) not null,
contrasena varchar (15) not null,
primary key (ncontrolusuario) 
);
create table alumno(
ncontrolusuario varchar (9) not null,
ncontrol varchar (9) not null,
idhorario integer,
idimagen integer,
curp varchar (18) not null,
fechanacimineto date not null,
estadocivil varchar (10) ,
correoelectronico varchar (30) not null,
nombre varchar (30) not null,
ap_paterno varchar (20) not null,
ap_materno varchar (20) not null,
sexo varchar (10) ,
telefono integer not null,
primary key (ncontrol),
CONSTRAINT foreign key (ncontrolusuario) references usuarios (ncontrolusuario),
CONSTRAINT foreign key (idhorario) references horario (idhorario),
CONSTRAINT foreign key (idimagen) references imagenes (idimagen)
);
create table informacioncontacto(
idinfocontacto integer auto_increment,
ncontrol varchar (9) not null,
estado varchar (20)not null,
direccion varchar (30) not null,
municipio varchar(30) not null,
codigopostal integer not null,
primary key (idinfocontacto),
foreign key (ncontrol) references alumno (ncontrol)
);
create table informacionescolar(
idinfoescolar integer auto_increment,
ncontrol varchar (9) not null,
estatus varchar (10) not null,
semestre integer not null,
carrera varchar (20) not null,
especialidad varchar (20),
plandeestudio varchar (20) ,
primary key (idinfoescolar),
foreign key (ncontrol) references alumno (ncontrol)
);

create table alu_materia(
ncontrol varchar (9) ,
clvmateria integer ,
foreign key (ncontrol) references alumno (ncontrol),
foreign key (clvmateria) references materia (clvmateria)
);
create table materia (
clvmateria integer auto_increment,
idadministrador integer,
nombre varchar (20) not null,
creditos integer not null,
area varchar (20) not null,
primary key (clvmateria),
foreign key (idadministrador) references administrador (idadministrador)
);
create table alu_asistencias(
ncontrol varchar (9) ,
idasistencia integer,
CONSTRAINT foreign key (ncontrol) references alumno (ncontrol),
CONSTRAINT foreign key (idasistencia) references asistencia (idasistencia)
);
create table asistencia (
idasistencia integer auto_increment,
materia varchar (15) not null,
fecha datetime not null,
porcentaje float not null,
primary key (idasistencia)
);

create table administrador(
idadministrador integer auto_increment,
ncontrolusuario varchar (9) not null,
nombre varchar (20) not null,
primary key (idadministrador),
foreign key (ncontrolusuario) references usuarios (ncontrolusuario)
);
create table maestro(
ncontrol varchar (9) not null,
curp varchar (18) not null,
idimagen integer,
ncontrolusuario varchar (9) not null,
fechanacimineto date not null,
estadocivil varchar (10) ,
correoelectronico varchar (30) not null,
nombre varchar (30) not null,
ap_paterno varchar (20) not null,
ap_materno varchar (20) not null,
sexo varchar (10) ,
telefono integer not null,
primary key (ncontrol),
foreign key (ncontrolusuario) references usuarios (ncontrolusuario),
foreign key (idimagen) references imagenes (idimagen)
);
create table informacioncontactomaes(
idinfocontacto integer auto_increment,
estado varchar (20)not null,
ncontrol varchar (9) not null,
direccion varchar (30) not null,
municipio varchar(30) not null,
codigopostal integer not null,
primary key (idinfocontacto),
foreign key (ncontrol) references maestro (ncontrol)
);
create table informacionescolarmaes(
idinfoescolar integer auto_increment,
ncontrol varchar (9) not null,
estatus varchar (10) not null,
semestre integer not null,
area varchar (20) not null,
primary key (idinfoescolar),
foreign key (ncontrol) references maestro (ncontrol)
);

create table maes_materia(
ncontrol varchar (9) not null,
clvmateria integer,
foreign key (ncontrol) references maestro (ncontrol),
foreign key (clvmateria) references materia (clvmateria)
);
create table hor_materia(
idhorario integer,
clvmateria integer,
foreign key (idhorario) references horario (idhorario),
foreign key (clvmateria) references materia (clvmateria)
);
create table maes_admin(
ncontrol varchar(9),
idadministrador integer,
CONSTRAINT foreign key (ncontrol) references maestro (ncontrol),
CONSTRAINT foreign key (idadministrador) references administrador (idadministrador)
);
create table alum_admin(
ncontrol varchar(9),
idadministrador integer,
CONSTRAINT foreign key (ncontrol) references alumno (ncontrol),
CONSTRAINT foreign key (idadministrador) references administrador (idadministrador)
);
create table maes_alum(
ncontrol varchar(9),
foreign key (ncontrol) references maestro (ncontrol),
foreign key (ncontrol) references alumno (ncontrol)
);
create table horario(
idhorario integer auto_increment,
nombremateria varchar (20) not null,
dia datetime not null,
aula varchar(10),
maestro varchar (40) not null,
primary key (idhorario)
);
create table imagenes(
idimagen integer auto_increment,
nombre varchar (20) not null,
primary key (idimagen)
);