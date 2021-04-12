
USE [FacturacionDigitalWare]
GO

CREATE PROCEDURE procFacturaSelect

 @NroFactura INT,
 @Nombre varchar(50),
 @Apellido varchar(50),
 @fecha datetime,
 @NombreProducto varchar(50)

AS

SELECT                   EncabezadoFactura.IdFacturaEncabezado AS NroFactura,Cliente.Nombre, Cliente.Apellido, Cliente.Direccion, EncabezadoFactura.fecha, 
                         Cliente.Telefono, Cliente.email, Producto.NombreProducto, 
                         DetalleFactura.Cantidad, DetalleFactura.Precio , ModoPago.NombreModoPago,  ModoPago.OtrosDetalles
FROM                     EncabezadoFactura INNER JOIN
                         Cliente ON EncabezadoFactura.IdCliente = Cliente.IdCliente INNER JOIN
                         ModoPago ON EncabezadoFactura.IdModoPago = ModoPago.IdModoPago INNER JOIN
                         DetalleFactura ON EncabezadoFactura.IdFacturaEncabezado = DetalleFactura.IdFacturaEncabezado INNER JOIN
                         Producto INNER JOIN
                         Categoria ON Producto.IdCategoria = Categoria.IdCategoria ON DetalleFactura.IdProducto = Producto.IdProducto
WHERE                    EncabezadoFactura.IdFacturaEncabezado = @NroFactura OR
						 Cliente.Nombre =  @Nombre OR
						 Cliente.Apellido = @Apellido OR
						 EncabezadoFactura.fecha = @fecha OR
						 Producto.NombreProducto = @NombreProducto


***************************************************************************************************************************************

USE [FacturacionDigitalWare]
GO

CREATE PROCEDURE procDetalleFacturaInsert
(
 @IdFacturaEncabezado INT,
 @IdProducto INT,
 @Cantidad INT,
 @Precio decimal
)

AS
BEGIN 
INSERT INTO [dbo].[DetalleFactura]
           ([IdFacturaEncabezado]
           ,[IdProducto]
           ,[Cantidad]
           ,[Precio])
     VALUES
           (@IdFacturaEncabezado
           ,@IdProducto
           ,@Cantidad
           ,@Precio)

DECLARE @cantidadStock int
DECLARE @cantidadStockActual int

SELECT @cantidadStock = stock FROM Producto WHERE IdProducto = @IdProducto

SET @cantidadStockActual = @cantidadStockActual - @Cantidad

UPDATE [dbo].[Producto]
   SET [stock] = @cantidadStockActual
 WHERE IdProducto = @IdProducto

END


******************************************************************************************************************************************

USE [FacturacionDigitalWare]
GO

CREATE PROCEDURE procEncabezadoFacturaInsert
(
 @IdCliente INT,
 @fecha datetime,
 @IdModoPago INT
)

AS
BEGIN 

INSERT INTO [dbo].[EncabezadoFactura]
           ([IdCliente]
           ,[fecha]
           ,[IdModoPago])
     VALUES
           (@IdCliente
           ,@fecha
           ,@IdModoPago)

END


********************************************************************************************************************************************

USE [FacturacionDigitalWare]
GO

CREATE PROCEDURE procModoPagoInsert
(
 @NombreModoPago varchar(50),
 @OtrosDetalles varchar(50)
)

AS
BEGIN 

INSERT INTO [dbo].[ModoPago]
           ([NombreModoPago]
           ,[OtrosDetalles])
     VALUES
           (@NombreModoPago
           ,@OtrosDetalles)

END

*********************************************************************************************************************************************

USE [FacturacionDigitalWare]
GO

CREATE PROCEDURE procProductoInsert
(
 @NombreProducto varchar(50),
 @PrecioProducto decimal,
 @stock int,
 @IdCategoria int 
)

AS
BEGIN 

INSERT INTO [dbo].[Producto]
           ([NombreProducto]
           ,[PrecioProducto]
           ,[stock]
           ,[IdCategoria])
     VALUES
           (@NombreProducto
           ,@PrecioProducto
           ,@stock
           ,@IdCategoria)

END


*************************************************************************************************************************************************

USE [FacturacionDigitalWare]
GO

CREATE PROCEDURE procClienteInsert
(
 @NombreCliente varchar(50),
 @ApellidoCliente varchar(50),
 @Direccion varchar(50),
 @FechaNacimiento varchar(50),
 @Telefono varchar(50),
 @Email varchar(50)
)

AS
BEGIN 

INSERT INTO [dbo].[Cliente]
           ([Nombre]
           ,[Apellido]
           ,[Direccion]
           ,[FechaNacimiento]
           ,[Telefono]
           ,[email])
     VALUES
           (@NombreCliente
           ,@ApellidoCliente
           ,@Direccion
           ,@FechaNacimiento
           ,@Telefono
           ,@Email)

END


**************************************************************************************************************************************************

USE [FacturacionDigitalWare]
GO

CREATE PROCEDURE procCategoriaInsert
(
 @NombreCategoria varchar(50),
 @DescripcionCategoria varchar(50)
)

AS
BEGIN 

INSERT INTO [dbo].[Categoria]
           ([NombreCategoria]
           ,[DescripcionCategoria])
     VALUES
           (@NombreCategoria
           ,@DescripcionCategoria)

END

****************************************************************************************************************************************************

USE [FacturacionDigitalWare]
GO

CREATE PROCEDURE procModoPagoSelect
(
 @NombreModoPago varchar(50),
 @OtrosDetalles varchar(50)
)

AS
BEGIN 


SELECT [NombreModoPago]
      ,[OtrosDetalles]
FROM  [dbo].[ModoPago]
WHERE  NombreModoPago = @NombreModoPago OR OtrosDetalles = @OtrosDetalles


END


*****************************************************************************************************************************************************

USE [FacturacionDigitalWare]
GO

CREATE PROCEDURE procProductoSelect
(
 @NombreProducto varchar(50),
 @PrecioProducto decimal,
 @stock int
)

AS
BEGIN 

SELECT [NombreProducto]
      ,[PrecioProducto]
      ,[stock]
FROM [dbo].[Producto]
WHERE NombreProducto = @NombreProducto OR PrecioProducto = @PrecioProducto OR stock = @stock

END


******************************************************************************************************************************************************

USE [FacturacionDigitalWare]
GO

CREATE PROCEDURE procClienteSelect
(
 @Nombre varchar(50),
 @Apellido varchar(50),
 @Direccion varchar(50),
 @FechaNacimiento varchar(50),
 @Telefono varchar(50),
 @email varchar(50)
)

AS
BEGIN 

SELECT [Nombre]
      ,[Apellido]
      ,[Direccion]
      ,[FechaNacimiento]
      ,[Telefono]
      ,[email]
FROM  [dbo].[Cliente]
WHERE Nombre = @Nombre OR Apellido = @Apellido OR Direccion = @Direccion OR FechaNacimiento = @FechaNacimiento OR 
	  Telefono = @Telefono OR email = @email

END


******************************************************************************************************************************************************

USE [FacturacionDigitalWare]
GO

CREATE PROCEDURE procCategoriaSelect
(
 @NombreCategoria varchar(50),
 @DescripcionCategoria varchar(50)
)

AS
BEGIN 

SELECT [NombreCategoria]
      ,[DescripcionCategoria]
FROM [dbo].[Categoria]
WHERE NombreCategoria = @NombreCategoria OR DescripcionCategoria = @DescripcionCategoria

END


**********************************************************************************************************************************************************

USE [FacturacionDigitalWare]
GO

CREATE PROCEDURE procProductoUpdate
(
 @idProducto int,
 @NombreProducto varchar(50),
 @PrecioProducto varchar(50),
 @stock int,
 @IdCategoria int
)

AS
BEGIN 

UPDATE [dbo].[Producto]
   SET [NombreProducto] = @NombreProducto
      ,[PrecioProducto] = @PrecioProducto
      ,[stock] = @stock
      ,[IdCategoria] = @IdCategoria
 WHERE IdProducto = @idProducto


END


**********************************************************************************************************************************************************

USE [FacturacionDigitalWare]
GO

CREATE PROCEDURE procModoPagoUpdate
(
 @idModoPago int,
 @NombreModoPago varchar(50),
 @OtroDetalles varchar(50)
)

AS
BEGIN 

UPDATE [dbo].[ModoPago]
   SET [NombreModoPago] = @NombreModoPago
      ,[OtrosDetalles] = @OtroDetalles
 WHERE [IdModoPago]= @idModoPago

END

**********************************************************************************************************************************************************

USE [FacturacionDigitalWare]
GO

CREATE PROCEDURE procEncabezadoFacturaUpdate
(
 @IdFacturaEncabezado int,
 @IdCliente varchar(50),
 @fecha  datetime,
 @IdModoPagos varchar(50)
)

AS
BEGIN 

UPDATE [dbo].[EncabezadoFactura]
   SET [IdCliente] = @IdCliente
      ,[fecha] = @fecha
      ,[IdModoPago] = @IdModoPagos
 WHERE [IdFacturaEncabezado] = @IdFacturaEncabezado

END


**********************************************************************************************************************************************************

USE [FacturacionDigitalWare]
GO

CREATE PROCEDURE procDetalleFacturaUpdate
(
 @IdFacturaDetalle int,
 @IdProducto int,
 @Cantidad  int,
 @Precio decimal
)

AS
BEGIN 


UPDATE [dbo].[DetalleFactura]
   SET [IdProducto] = @IdProducto
      ,[Cantidad] = @Cantidad
      ,[Precio] = @Precio
 WHERE [IdFacturaDetalle] = @IdFacturaDetalle 

END

**********************************************************************************************************************************************************

USE [FacturacionDigitalWare]
GO

CREATE PROCEDURE procClienteUpdate
(
 @IdCliente int,
 @NombreCliente varchar(50),
 @ApellidoCliente varchar(50),
 @Direccion varchar(50),
 @FechaNacimiento varchar(50),
 @Telefono varchar(50),
 @Email varchar(50)
)

AS
BEGIN 

UPDATE [dbo].[Cliente]
   SET [Nombre] = @NombreCliente
      ,[Apellido] = @ApellidoCliente
      ,[Direccion] = @Direccion
      ,[FechaNacimiento] = @FechaNacimiento
      ,[Telefono] = @Telefono
      ,[email] = @Email
 WHERE [IdCliente] = @IdCliente

END

**********************************************************************************************************************************************************

USE [FacturacionDigitalWare]
GO

CREATE PROCEDURE procCategoriaUpdate
(
 @IdCategoria int,
 @NombreCategoria varchar(50),
 @DescripcionCategoria varchar(50)

)

AS
BEGIN 

UPDATE [dbo].[Categoria]
   SET [NombreCategoria] = @NombreCategoria
      ,[DescripcionCategoria] =  @DescripcionCategoria 
 WHERE [IdCategoria] = @IdCategoria
  
END

**********************************************************************************************************************************************************

USE [FacturacionDigitalWare]
GO

CREATE PROCEDURE procProductoDelete
(
 @idProducto int
)

AS
BEGIN 


DELETE FROM [dbo].[Producto]
      WHERE [IdProducto] = @idProducto

END

**********************************************************************************************************************************************************

USE [FacturacionDigitalWare]
GO

CREATE PROCEDURE procModopagoDelete
(
 @idModoPago int
)

AS
BEGIN 

DELETE FROM [dbo].[ModoPago]
      WHERE [IdModoPago] = @idModoPago


END

**********************************************************************************************************************************************************


USE [FacturacionDigitalWare]
GO

CREATE PROCEDURE procFacturaDelete
(
 @IdFacturaEncabezado int
)

AS
BEGIN 

DECLARE @idFacturaDetalle INT

IF(@IdFacturaEncabezado IS NOT NULL)BEGIN

SELECT @idFacturaDetalle = IdFacturaDetalle FROM [dbo].[DetalleFactura] WHERE IdFacturaEncabezado = @idFacturaEncabezado

DELETE FROM [dbo].[EncabezadoFactura]
      WHERE [IdFacturaEncabezado] = @IdFacturaEncabezado



DELETE FROM [dbo].[DetalleFactura]
      WHERE IdFacturaDetalle = @idFacturaDetalle

END;
END

**********************************************************************************************************************************************************


USE [FacturacionDigitalWare]
GO

CREATE PROCEDURE procClienteDelete
(
 @IdCliente int
)

AS
BEGIN 

DECLARE @idFacturaDetalle INT

IF(@IdCliente IS NOT NULL)BEGIN
IF NOT EXISTS(SELECT 1 FROM [dbo].[EncabezadoFactura] WHERE IdCliente = @IdCliente)BEGIN

DELETE FROM [dbo].[Cliente]
      WHERE IdCliente = @IdCliente
END ELSE BEGIN
DECLARE @IdFacturaEncabezado int
SELECT @IdFacturaEncabezado = IdFacturaEncabezado FROM [dbo].[EncabezadoFactura] WHERE IdCliente = @IdCliente

EXEC procFacturaDelete procFacturaDelete
 
END;
END;
END

**********************************************************************************************************************************************************








