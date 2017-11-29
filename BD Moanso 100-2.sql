
--Creando la Base de datos 

CREATE DATABASE AULA11










----------------------------------Tabla CLIENTE-----------------------------------


create table CLIENTE(
ID_CLIENTE int identity not null constraint pk_idcliente primary key ,
NOMBRES varchar(50),
APE_PATER_CLIENTE VARCHAR (50) NOT NULL,
APE_MATER_CLIENTE VARCHAR (50) NOT NULL,
CORREO_E VARCHAR (50)  NULL,
--DIRECCION_CLIENTE VARCHAR (50)  NULL,
--DNI VARCHAR(8),
TELEFONO_CLI CHAR (50) NULL,
--ID_DIST CHAR (3) NOT NULL REFERENCES DISTRITO,
USERNAME VARCHAR(50) NOT NULL,
PASS VARCHAR(50) NOT NULL,
ESTADO int default 1
)
go







----------------------------------Tabla VENDEDOR-----------------------------------




create table VENDEDOR(
ID_VEN int identity not null constraint pk_vendedorID primary key,
VEN_NOM varchar(30),
VEN_TELEFONO varchar(8),
VEN_DIRECCION varchar(30),
FECHA datetime,
--USUARIO varchar(30),
PASS varchar(30)
)
go


----------------------------------Tabla Pedido-----------------------------------



create table PEDIDO(
ID_PEDIDO int identity not null constraint pk_pedidoID primary key,
ID_CLIENTE varchar(10) REFERENCES CLIENTE,
--ID_SERVICIO varchar(10) REFERENCES SERVICIO,
--ID_VEN varchar(10) REFERENCES VENDEDOR,
ESTADO_PEDIDO varchar(10) DEFAULT 'Pendiente'
)
go




----------------------------------Tabla Ploteo-----------------------------------




create table PLOTEO(
ID_PLOTEO int identity not null constraint pk_ploteoID primary key DEFAULT,
ID_PEDIDO varchar(10) REFERENCES PEDIDO,
TAMA�O_HOJA VARCHAR(3),
ESCALA VARCHAR(5),
NOMBRE_ARCHIVO VARCHAR(150),
PLOTEO_ARCHIVO VARBINARY(MAX),
TIPO_ARCHIVO VARCHAR(50),
DESCRIPCION VARCHAR(150),
FECHA smalldatetime DEFAULT GETDATE()
)
go


----------------------------------Tabla Copias-----------------------------------




create table COPIAS(
ID_COPIAS int identity not null constraint pk_copiasID primary key ,
ID_PEDIDO varchar(10) REFERENCES PEDIDO,
TAMA�O_HOJA VARCHAR(10),
NRO_COPIAS VARCHAR(5),
TIPO_COPIA VARCHAR(20),
NOMBRE_ARCHIVO VARCHAR(150),
COPIA_ARCHIVO VARBINARY(MAX),
TIPO_ARCHIVO VARCHAR(50),
DESCRIPCION VARCHAR(150),
FECHA smalldatetime DEFAULT GETDATE()
)
go



----------------------------------Tabla Impresion-----------------------------------


create table IMPRESION(
ID_IMPRESION int identity not null constraint pk_impresionID primary key DEFAULT ,
ID_PEDIDO varchar(10) REFERENCES PEDIDO,
TIPO_IMPRESION VARCHAR(10),
NUMHOJAS VARCHAR(10),
NOMBRE_ARCHIVO VARCHAR(150),
IMPRESION_ARCHIVO VARBINARY(MAX),
TIPO_ARCHIVO VARCHAR(50),
DESCRIPCION VARCHAR(150),
FECHA smalldatetime DEFAULT GETDATE()
)
go








-------------------Insertar Datos---------------


INSERT INTO CLIENTE (NOMBRES,APE_PATER_CLIENTE,APE_MATER_CLIENTE,CORREO_E,TELEFONO_CLI,USERNAME,PASS) VALUES ('Administrador','Administrador','Administrador','Aula11once@gmail.com','1234567','admin','adminaula11');
INSERT INTO CLIENTE (NOMBRES,APE_PATER_CLIENTE,APE_MATER_CLIENTE,CORREO_E,TELEFONO_CLI,USERNAME,PASS) VALUES ('Kenny','Caruajulca','Quispe','kineandersoncq@gmail.com','1234567','kenny','kenny');
INSERT INTO CLIENTE (NOMBRES,APE_PATER_CLIENTE,APE_MATER_CLIENTE,CORREO_E,TELEFONO_CLI,USERNAME,PASS) VALUES ('Wilson','Peralta','Pichen','wilson@gmail.com','1234567','wilson','wilson');


-------------------------Procedimientos--------------------



create procedure username_repetido
@USERNAME VARCHAR(50)
as
set nocount on;
if (exists(Select * from CLIENTE where USERNAME=@USERNAME)) 
select 1
else
select 0
go

create procedure verifica_usuario
@USERNAME VARCHAR(50),
@PASS VARCHAR(9)
as
Select count(USERNAME)  from CLIENTE WHERE USERNAME=@USERNAME and PASS=@PASS;
go



create procedure registro_cliente

@NOMBRES varchar(50),
@APE_PATER_CLIENTE VARCHAR (50),
@APE_MATER_CLIENTE VARCHAR (50) ,
@CORREO_E VARCHAR (50)  NULL,
@TELEFONO_CLI CHAR (9) NULL,
@USERNAME VARCHAR(50) ,
@PASS VARCHAR(9)
as
INSERT INTO CLIENTE (NOMBRES,APE_PATER_CLIENTE,APE_MATER_CLIENTE,CORREO_E,TELEFONO_CLI,USERNAME,PASS) VALUES (@NOMBRES,@APE_PATER_CLIENTE,@APE_MATER_CLIENTE,@CORREO_E,@TELEFONO_CLI,@USERNAME,@PASS);
go




--Alter authorization on database::AULA11 to sa;