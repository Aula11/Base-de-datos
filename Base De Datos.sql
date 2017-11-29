
--Creando la Base de datos 

CREATE DATABASE AULA111










----------------------------------Tabla CLIENTE-----------------------------------
CREATE SEQUENCE S_CLIENTE
AS int
START WITH 1000
INCREMENT BY 1;
GO

--ALTER SEQUENCE S_CLIENTE
--RESTART WITH 1000;
--go

--DROP SEQUENCE S_CLIENTE
--go


create table CLIENTE(
ID_CLIENTE varchar(10) not null constraint pk_idcliente primary key DEFAULT (NEXT VALUE FOR S_CLIENTE),
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

CREATE SEQUENCE S_VENDEDOR
AS int
START WITH 1000
INCREMENT BY 1;
GO

--ALTER SEQUENCE S_VENDEDOR
--RESTART WITH 1000;
--go

--DROP SEQUENCE S_VENDEDOR
--go



create table VENDEDOR(
ID_VEN varchar(10) not null constraint pk_vendedorID primary key,
VEN_NOM varchar(30),
VEN_TELEFONO varchar(8),
VEN_DIRECCION varchar(30),
FECHA datetime,
--USUARIO varchar(30),
PASS varchar(30)
)
go


----------------------------------Tabla Pedido-----------------------------------

CREATE SEQUENCE S_PEDIDO
AS int
START WITH 1000
INCREMENT BY 1;
GO


create table PEDIDO(
ID_PEDIDO varchar(10) not null constraint pk_pedidoID primary key DEFAULT (NEXT VALUE FOR S_PEDIDO),
ID_CLIENTE varchar(10) REFERENCES CLIENTE,
--ID_SERVICIO varchar(10) REFERENCES SERVICIO,
--ID_VEN varchar(10) REFERENCES VENDEDOR,
ESTADO_PEDIDO varchar(10) DEFAULT 'Pendiente'
)
go




----------------------------------Tabla Ploteo-----------------------------------

CREATE SEQUENCE S_PLOTEO
AS int
START WITH 1000
INCREMENT BY 1;
GO



create table PLOTEO(
ID_PLOTEO VARCHAR(10) not null constraint pk_ploteoID primary key DEFAULT (NEXT VALUE FOR S_PLOTEO),
ID_PEDIDO varchar(10) REFERENCES PEDIDO,
TAMAÑO_HOJA VARCHAR(3),
ESCALA VARCHAR(5),
NOMBRE_ARCHIVO VARCHAR(150),
PLOTEO_ARCHIVO VARBINARY(MAX),
TIPO_ARCHIVO VARCHAR(50),
DESCRIPCION VARCHAR(150),
FECHA smalldatetime DEFAULT GETDATE()
)
go


----------------------------------Tabla Copias-----------------------------------

CREATE SEQUENCE S_COPIAS
AS int
START WITH 1000
INCREMENT BY 1;
GO



create table COPIAS(
ID_COPIAS VARCHAR(10) not null constraint pk_copiasID primary key  DEFAULT (NEXT VALUE FOR S_COPIAS),
ID_PEDIDO varchar(10) REFERENCES PEDIDO,
TAMAÑO_HOJA VARCHAR(10),
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
CREATE SEQUENCE S_IMPRESION
AS int
START WITH 1000
INCREMENT BY 1;
GO


create table IMPRESION(
ID_IMPRESION VARCHAR(10) not null constraint pk_impresionID primary key DEFAULT (NEXT VALUE FOR S_IMPRESION),
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