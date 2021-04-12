--BASE DE DATOS DIGITALWARE:


USE [FacturacionDigitalWare]
GO

INSERT INTO [dbo].[ModoPago]
           ([NombreModoPago]
           ,[OtrosDetalles])
     VALUES
           ('Efectivo'
           ,'n/a'),

		   ('Tarjeta de Debito'
           ,'n/a'),

		   ('Tarjeta de Credito'
           ,'n/a'),

		   ('Puntos Colombia'
           ,'n/a'),

		   ('PSE'
           ,'n/a'),

		   ('Pago con QR'
           ,'n/a')
GO

********************************************************************


USE [FacturacionDigitalWare]
GO

INSERT INTO [dbo].[Cliente]
           ([Nombre]
           ,[Apellido]
		   ,[Edad]
           ,[Direccion]
           ,[FechaNacimiento]
           ,[Telefono]
           ,[email])
     VALUES
           ('Angel'
           ,'Restrepo'
		   ,45
           ,'Calle 20 #5, Robledo, Medellin'
           ,'19880318'
           ,'300 1234578'
           ,'arestrepo@outlook.com'),

		   ('Gloria'
           ,'Gomez'
		   ,55
           ,'Calle 11 #12c, Parque Principal, Bello'
           ,'19800727'
           ,'310 5553211'
           ,'ggomezo@outlook.com'),

		   ('Angela'
           ,'vargas'
		   ,15
           ,'Calle 6 #28b, La Sebastiana, Envigado'
           ,'19880525'
           ,'300 4005032'
           ,'avargaso@outlook.com')
GO

******************************************************************


USE [FacturacionDigitalWare]
GO

INSERT INTO [dbo].[Categoria]
           ([NombreCategoria]
           ,[DescripcionCategoria])
     VALUES
           ('Calzado Nacional'
           ,'Fabricantes locales nacionales'),

		   ('Calzado Internacional'
           ,'Fabricantes Internacionales'),

		   ('Pantalones Nacionales'
           ,'Fabricantes locales nacionales'),

		   ('Pantalones Internacionale'
           ,'Fabricantes Internacionales'),

		   ('Camisa Nacionales'
           ,'Fabricantes locales nacionales'),

		   ('Camisa Internacionales'
           ,'Fabricantes Internacionales')
GO


************************************************************************

USE [FacturacionDigitalWare]
GO

INSERT INTO [dbo].[Producto]
           ([NombreProducto]
           ,[PrecioProducto]
           ,[stock]
           ,[IdCategoria])
     VALUES
           ('polo rojo'
           ,12500
           ,30
           ,5),

		   ('zapatos nike '
           ,150000
           ,50
           ,2),

		   ('pantalones amerikanino'
           ,180000
           ,50
           ,4),

		   ('polo lacoste'
           ,85500
           ,65
           ,6),

		   ('Zapatos monserrat'
           ,95500
           ,30
           ,1)
GO

******************************************************************

USE [FacturacionDigitalWare]
GO

INSERT INTO [dbo].[EncabezadoFactura]
           ([IdCliente]
           ,[fecha]
           ,[IdModoPago])
     VALUES
           (1
           ,'2000-04-09'
           ,1),

		   (2
           ,'2000-04-10'
           ,2),

		   (3
           ,'2003-04-11'
           ,6)
GO


********************************************************************

USE [FacturacionDigitalWare]
GO

INSERT INTO [dbo].[DetalleFactura]
           ([IdFacturaEncabezado]
           ,[IdProducto]
           ,[Cantidad]
           ,[Precio])
     VALUES
           (1
           ,3
           ,1
           ,180000),

		   (2
           ,2
           ,1
           ,150000),

		   (3
           ,5
           ,1
           ,95500)
GO


