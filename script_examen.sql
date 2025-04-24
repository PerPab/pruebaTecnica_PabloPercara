-- DROP TABLE  Marcas
CREATE TABLE Marcas(
  id		INT,
  nombre	VARCHAR(30)
  )

INSERT INTO Marcas (id, nombre) VALUES (1, 'PEUGEOT')
INSERT INTO Marcas (id, nombre) VALUES (2, 'CITROEN')
INSERT INTO Marcas (id, nombre) VALUES (3, 'DS')


-- DROP TABLE Autos
CREATE TABLE Autos(
  modeloCod		VARCHAR(10),
  marcaCod		INT,
  descripcion		VARCHAR(100),
  precio		MONEY
  )

INSERT INTO Autos (marcaCod, modeloCod, descripcion, precio) VALUES (1, '2021GXFAAA', '208 Allure', 705210.10)
INSERT INTO Autos (marcaCod, modeloCod, descripcion, precio) VALUES (1, '2022RFIBBB', '208 Allure', 750500.50)
INSERT INTO Autos (marcaCod, modeloCod, descripcion, precio) VALUES (1, '2022DCOCCC', '208 Feline', 720357.00)
INSERT INTO Autos (marcaCod, modeloCod, descripcion, precio) VALUES (1, '2022RHUDDD', '2008 Feline Tiptronic', 800560.00)
INSERT INTO Autos (marcaCod, modeloCod, descripcion, precio) VALUES (2, '2021LNTEEE', 'C4 Hatch Picasso', 660501.00)
INSERT INTO Autos (marcaCod, modeloCod, descripcion, precio) VALUES (2, '2022KNHFFF', 'C4 Hatch Picasso', 700100.60)
INSERT INTO Autos (marcaCod, modeloCod, descripcion, precio) VALUES (2, '2022ERDGGG', 'Celise 4p Pack 3', 720965.00)
INSERT INTO Autos (marcaCod, modeloCod, descripcion, precio) VALUES (3, '2021UYGHHH', 'DS6', 950060.00)
INSERT INTO Autos (marcaCod, modeloCod, descripcion, precio) VALUES (3, '2022KPOIII', 'DS6', 1100225.00)


-- DROP TABLE Campanias
CREATE TABLE Campanias(
  Id			INT,
  nombre		VARCHAR(30),
  fechaDesde		DATETIME,
  fechaHasta		DATETIME,
  porcDescuento	MONEY
  )

INSERT INTO Campanias (id, nombre, fechaDesde, fechaHasta, porcDescuento) 
	VALUES (1, 'PSA 2021 10% DTO', convert(DATETIME, '20210101'), convert(DATETIME, '20211231'), 0.1)
INSERT INTO Campanias (id, nombre, fechaDesde, fechaHasta, porcDescuento) 
	VALUES (2, 'PEUGEOT 2022 15% DTO', convert(DATETIME, '20220101'), convert(DATETIME, '20221231'), 0.15)
INSERT INTO Campanias (id, nombre, fechaDesde, fechaHasta, porcDescuento) 
	VALUES (3, 'PSA ENERO-JUNIO 2022 20% DTO', convert(DATETIME, '20220101'), convert(DATETIME, '20220630'), 0.2)	
INSERT INTO Campanias (id, nombre, fechaDesde, fechaHasta, porcDescuento) 
	VALUES (4, 'PEUGEOT 208 ALLURE 2021/2022', convert(DATETIME, '20210101'), convert(DATETIME, '20221231'), 0)	
	
	
-- DROP TABLE CampaniasAutos
CREATE TABLE CampaniasAutos(
  campaniaId	INT,
  modeloCod	VARCHAR(30)
  )

INSERT INTO CampaniasAutos (campaniaId, modeloCod) VALUES (1, '2021GXFAAA')
INSERT INTO CampaniasAutos (campaniaId, modeloCod) VALUES (1, '2021LNTEEE')
INSERT INTO CampaniasAutos (campaniaId, modeloCod) VALUES (1, '2021UYGHHH')
INSERT INTO CampaniasAutos (campaniaId, modeloCod) VALUES (2, '2022RFIBBB')
INSERT INTO CampaniasAutos (campaniaId, modeloCod) VALUES (2, '2022DCOCCC')
INSERT INTO CampaniasAutos (campaniaId, modeloCod) VALUES (2, '2022RHUDDD')
INSERT INTO CampaniasAutos (campaniaId, modeloCod) VALUES (3, '2022RFIBBB')
INSERT INTO CampaniasAutos (campaniaId, modeloCod) VALUES (3, '2022DCOCCC')
INSERT INTO CampaniasAutos (campaniaId, modeloCod) VALUES (3, '2022RHUDDD')
INSERT INTO CampaniasAutos (campaniaId, modeloCod) VALUES (3, '2022KNHFFF')
INSERT INTO CampaniasAutos (campaniaId, modeloCod) VALUES (3, '2022ERDGGG')
INSERT INTO CampaniasAutos (campaniaId, modeloCod) VALUES (3, '2022KPOIII')
INSERT INTO CampaniasAutos (campaniaId, modeloCod) VALUES (4, '2021GXFAAA')
INSERT INTO CampaniasAutos (campaniaId, modeloCod) VALUES (4, '2022RFIBBB')


-- DROP TABLE ImpuestoSolidario
CREATE TABLE ImpuestoSolidario(
  linea	VARCHAR(14)
  )

INSERT INTO ImpuestoSolidario (linea) VALUES ('2022RHUDDD2000')
INSERT INTO ImpuestoSolidario (linea) VALUES ('2021UYGHHH3500')
INSERT INTO ImpuestoSolidario (linea) VALUES ('2022KPOIII3550')
INSERT INTO ImpuestoSolidario (linea) VALUES ('2021PXCFGT3050')


-- DROP TABLE Prestamos
CREATE TABLE Prestamos(
  nroPrestamo		INT,
  nroCliente		INT,
  fechaAlta		DATETIME,
  fechaVencimiento	DATETIME,
  fechaCancelacion	DATETIME,
  capital		MONEY,
  tasa			MONEY,
  modeloCod		VARCHAR(10),
  VIN			VARCHAR(17)
  )

INSERT INTO Prestamos (nroPrestamo, nroCliente, fechaAlta, fechaVencimiento, fechaCancelacion, capital, tasa, modeloCod, VIN) VALUES (23587, 1536, '20210301', '20210901', NULL, 705210.10, 30.00, '2021GXFAAA', '2021GXFAAA15486')
INSERT INTO Prestamos (nroPrestamo, nroCliente, fechaAlta, fechaVencimiento, fechaCancelacion, capital, tasa, modeloCod, VIN) VALUES (23593, 1025, '20210307', '20210907', NULL, 660501.00, 37.00, '2021LNTEEE', '2021LNTEEE14598')
INSERT INTO Prestamos (nroPrestamo, nroCliente, fechaAlta, fechaVencimiento, fechaCancelacion, capital, tasa, modeloCod, VIN) VALUES (24002, 1220, '20210315', '20210915', '20210601', 950060.00, 35.00, '2021UYGHHH', '2021UYGHHH12487')
INSERT INTO Prestamos (nroPrestamo, nroCliente, fechaAlta, fechaVencimiento, fechaCancelacion, capital, tasa, modeloCod, VIN) VALUES (24015, 965, '20210320', '20210920', NULL, 950060.00, 35.00, '2021UYGHHH', '2021UYGHHH34695')
INSERT INTO Prestamos (nroPrestamo, nroCliente, fechaAlta, fechaVencimiento, fechaCancelacion, capital, tasa, modeloCod, VIN) VALUES (24022, 1333, '20210402', '20211002', '20210529', 705210.10, 30.00, '2021GXFAAA', '2021GXFAAA24516')
INSERT INTO Prestamos (nroPrestamo, nroCliente, fechaAlta, fechaVencimiento, fechaCancelacion, capital, tasa, modeloCod, VIN) VALUES (24030, 1745, '20210408', '20211008', NULL, 950060.00, 35.00, '2021UYGHHH', '2021UYGHHH37896')
INSERT INTO Prestamos (nroPrestamo, nroCliente, fechaAlta, fechaVencimiento, fechaCancelacion, capital, tasa, modeloCod, VIN) VALUES (24052, 1468, '20210409', '20211009', NULL, 660501.00, 37.00, '2021LNTEEE', '2021LNTEEE24568')
INSERT INTO Prestamos (nroPrestamo, nroCliente, fechaAlta, fechaVencimiento, fechaCancelacion, capital, tasa, modeloCod, VIN) VALUES (24059, 965, '20210419', '20211019', NULL, 705210.10, 30.00, '2021GXFAAA', '2021GXFAAA34568')
INSERT INTO Prestamos (nroPrestamo, nroCliente, fechaAlta, fechaVencimiento, fechaCancelacion, capital, tasa, modeloCod, VIN) VALUES (24061, 1235, '20210510', '20211110', NULL, 660501.00, 37.00, '2021LNTEEE', '2021LNTEEE58546')
INSERT INTO Prestamos (nroPrestamo, nroCliente, fechaAlta, fechaVencimiento, fechaCancelacion, capital, tasa, modeloCod, VIN) VALUES (24062, 1567, '20210522', '20211122', NULL, 660501.00, 37.00, '2021LNTEEE', '2021LNTEEE64568')
INSERT INTO Prestamos (nroPrestamo, nroCliente, fechaAlta, fechaVencimiento, fechaCancelacion, capital, tasa, modeloCod, VIN) VALUES (24075, 1885, '20210530', '20211130', NULL, 950060.00, 35.00, '2021UYGHHH', '2021UYGHHH47852')
INSERT INTO Prestamos (nroPrestamo, nroCliente, fechaAlta, fechaVencimiento, fechaCancelacion, capital, tasa, modeloCod, VIN) VALUES (24081, 1358, '20210601', '20211201', NULL, 950060.00, 35.00, '2021UYGHHH', '2021UYGHHH48587')
INSERT INTO Prestamos (nroPrestamo, nroCliente, fechaAlta, fechaVencimiento, fechaCancelacion, capital, tasa, modeloCod, VIN) VALUES (24099, 1536, '20210603', '20211203', NULL, 950060.00, 35.00, '2021UYGHHH', '2021UYGHHH49568')
INSERT INTO Prestamos (nroPrestamo, nroCliente, fechaAlta, fechaVencimiento, fechaCancelacion, capital, tasa, modeloCod, VIN) VALUES (25101, 1345, '20210715', '20220115', NULL, 720965.00, 31.00, '2022ERDGGG', '2022ERDGGG12345')


-- DROP TABLE ParametrosGenerales
CREATE TABLE ParametrosGenerales(
  Nombre	VARCHAR(20),
  Valor		MONEY
  )

INSERT INTO ParametrosGenerales (nombre, valor) VALUES ('IVA', 21.00)
