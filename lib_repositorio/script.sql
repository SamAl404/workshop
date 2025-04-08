CREATE DATABASE db_workshop
GO
USE db_workshop;
GO 

CREATE TABLE [Brands](
	[Id] INT IDENTITY(1,1) PRIMARY KEY,
	[BrandName] NVARCHAR(100) UNIQUE NOT NULL,
	[OriginCountry] NVARCHAR(100) NOT NULL
);

CREATE TABLE [Customers](
	[Id] INT IDENTITY(1,1) PRIMARY KEY,
	[CustomerName] NVARCHAR(100) NOT NULL,
	[Identification] NVARCHAR(100) UNIQUE NOT NULL,
	[PhoneNumber] NVARCHAR(50) UNIQUE,
	[Email] NVARCHAR(100) UNIQUE
);

CREATE TABLE [Vehicles](
	[Id] INT IDENTITY(1,1) PRIMARY KEY,
	[Plate] NVARCHAR(20) UNIQUE NOT NULL,
	[Chassis] NVARCHAR(50) UNIQUE NOT NULL,
	[Color] NVARCHAR(50) NOT NULL,
	[Engine] NVARCHAR(50) NOT NULL,
	[BrandId] INT REFERENCES [Brands](Id),
	[CustomerId] INT REFERENCES [Customers](Id)
);

CREATE TABLE [Employees](
	[Id] INT IDENTITY(1,1) PRIMARY KEY,
	[Identification] NVARCHAR(100) UNIQUE NOT NULL,
	[EmployeeName] NVARCHAR(100) NOT NULL,
	[Active] BIT NOT NULL
);

CREATE TABLE [Orders](
	[Id] INT IDENTITY(1,1) PRIMARY KEY,
	[OrderRef] NVARCHAR(100) UNIQUE NOT NULL,
	[CustomerRemark] NVARCHAR(300) ,
	[ServiceCenterRemark] NVARCHAR(300),
	[VehicleId] INT REFERENCES [Vehicles](Id),
	[EmployeeId] INT REFERENCES [Employees](Id)
);

CREATE TABLE [PaymentMethods](
	[Id] INT IDENTITY(1,1) PRIMARY KEY,
	[PaymentMethod] NVARCHAR(50) NOT NULL,
	[Active] BIT NOT NULL
);

CREATE TABLE [Sales](
	[Id] INT IDENTITY(1,1) PRIMARY KEY,
	[SaleRef] NVARCHAR(100) UNIQUE NOT NULL,
	[Total] DECIMAL(20,2) NOT NULL,
	[PaymentMethodId] INT REFERENCES [PaymentMethods](Id),
	[OrderId] INT REFERENCES [Orders](Id)
);

CREATE TABLE [Services](
	[Id] INT IDENTITY(1,1) PRIMARY KEY,
	[ServiceName] NVARCHAR(100) NOT NULL,
	[Reference] NVARCHAR(100) NOT NULL,
	[Price] DECIMAL(20,2) NOT NULL,
	[StimatedTime] NVARCHAR(50) NOT NULL
);

CREATE TABLE [OrderServices](
	[Id] INT IDENTITY(1,1) PRIMARY KEY,
	[OrderId] INT REFERENCES [Orders](Id),
	[ServiceId] INT REFERENCES [Services](Id)
);

CREATE TABLE [Categories](
	[Id] INT IDENTITY(1,1) PRIMARY KEY,
	[CategoryName] NVARCHAR(100) UNIQUE NOT NULL,
	[Active] BIT NOT NULL
);


CREATE TABLE [Products](
	[Id] INT IDENTITY(1,1) PRIMARY KEY,
	[ProductName] NVARCHAR(100) NOT NULL,
	[Reference] NVARCHAR(100) NOT NULL,
	[PurchasePrice] DECIMAL(20,2) NOT NULL,
	[SalePrice] DECIMAL(20,2) NOT NULL,
	[CategoryId] INT REFERENCES [Categories](Id)
);

CREATE TABLE [ServicesProducts](
	[Id] INT IDENTITY(1,1) PRIMARY KEY,
	[ServiceId] INT REFERENCES [Services](Id),
	[ProductId] INT REFERENCES [Products](Id)
);


INSERT INTO [Brands] (BrandName,OriginCountry)
VALUES ('BMW','Alemania'),
('Toyota','Japon'),
('Renault','Francia');

INSERT INTO [Brands] (BrandName,OriginCountry)
VALUES('Chevrolet','Estados Unidos')

INSERT INTO [Brands] (BrandName,OriginCountry)
VALUES('Koenigsegg','Suecia'),
('Honda','Japon')


INSERT INTO [Customers] (CustomerName,Identification,PhoneNumber,Email)
VALUES ('Daniel Cardona','102358664','3034256987','danielcarne@mail.com'),
('Juan Pablo Bedoya','7210236','3054789651','juanpalo@outlook.com'),
('Tomas Cordoba','123478956','3014781234','tomatemax@gmail.com');

INSERT INTO [Customers] (CustomerName,Identification,PhoneNumber,Email)
VALUES ('Felipe Jara','84133522','3096142361','justjara@gmail.com')

INSERT INTO [Customers] (CustomerName,Identification,PhoneNumber,Email)
VALUES ('Andres Javier','45321356','3150213654','andresitoh@gmail.com'),
('Bruce Wayne','5447896','3180562147','batman@mail.com')


INSERT INTO [Vehicles] (Plate,Chassis,Color,Engine,BrandId,CustomerId)
VALUES ('XFV478','BW32-04789','Azul','Gasolina V8',1,1),
('ABC789','TY98-2341','Blanco','Gasolina V4',2,2),
('TYU351','RN78-112360','Gris','Electrico',3,3)

INSERT INTO [Vehicles] (Plate,Chassis,Color,Engine,BrandId,CustomerId)
VALUES('BAT666','KG1-1','Gris','Gasolina V12',5,6);

INSERT INTO [Employees] (EmployeeName,Identification,Active)
VALUES('David Padilla','4125896',1),
('Rafael Monrroy','478956322',0)

INSERT INTO [Orders] (OrderRef,CustomerRemark,ServiceCenterRemark,EmployeeId,VehicleId)
VALUES ('A001','Tener cuidado con la pintura',NULL,1,1),
('B002',NULL,'Espejo derecho roto',1,2),
('C003',NULL,NULL,1,3);

INSERT INTO [PaymentMethods] (PaymentMethod,Active)
VALUES ('Efectivo',1),
('Tarjeta Debito',1),
('Codigo QR',0);

INSERT INTO [Sales] (SaleRef,Total,PaymentMethodId,OrderId)
VALUES ('0123',220.22,2,2),
('456',100,1,3)

INSERT INTO [Services] (ServiceName,Reference,Price,StimatedTime)
VALUES ('Cambio de aceite','S12',40.8,'2 horas'),
('Reparacíon del chasis','S34',120.4,'12 horas');

INSERT INTO [Services] (ServiceName,Reference,Price,StimatedTime)
VALUES('Cambio de tablero','S32',100.5,'14 horas');

INSERT INTO[OrderServices] (OrderId,ServiceId)
VALUES (2,1),
(3,2);

INSERT INTO [Categories] (CategoryName,Active)
VALUES ('Aceite',1),
('Carroceria',1);

INSERT INTO [Products] (ProductName,Reference,PurchasePrice,SalePrice,CategoryId)
VALUES ('Aceite de motor','P43',18.2,20,1),
('Cofre de motor','P12',85.3,94.2,2)

INSERT INTO [ServicesProducts] (ProductId,ServiceId)
VALUES (1,1),
(2,2);

SELECT * FROM Brands
SELECT * FROM Customers
SELECT * FROM Vehicles
SELECT * FROM Employees
SELECT * FROM PaymentMethods
SELECT * FROM Orders
SELECT * FROM [Services]
SELECT * FROM Sales
SELECT * FROM Categories
SELECT * FROM Products
SELECT * FROM ServicesProducts
SELECT * FROM OrderServices








