SCRIPTS ADICIONALES
****************************************************
USE [FacturacionDigitalWare]
GO

CREATE PROCEDURE procObtenerListaPreciosTodosProductos
--(

--)

AS
BEGIN 

SELECT NombreProducto,PrecioProducto FROM Producto

END

**********************************************************************************************************************************************************


USE [FacturacionDigitalWare]
GO

CREATE PROCEDURE procObtenerListaProductosminimoInventario
--(

--)

AS
BEGIN 

DECLARE @stockMinimo int
SET @stockMinimo = 5

SELECT NombreProducto FROM Producto WHERE stock <= @stockMinimo

END

**********************************************************************************************************************************************************

USE [FacturacionDigitalWare]
GO

CREATE PROCEDURE procObtenerListaClienteNoMayoresEntreunRangoFecha
(
	 @fechainicio Datetime,
     @fechafinal  Datetime
)

AS
BEGIN 


DECLARE @edadNoMayor int
SET @edadNoMayor = 35

SELECT        Cliente.Nombre, Cliente.Apellido, Cliente.Direccion, Cliente.FechaNacimiento, Cliente.Edad, Cliente.Telefono, Cliente.email, EncabezadoFactura.fecha, ModoPago.NombreModoPago, Producto.NombreProducto, DetalleFactura.Cantidad
FROM            Cliente INNER JOIN
                         EncabezadoFactura ON Cliente.IdCliente = EncabezadoFactura.IdCliente INNER JOIN
                         DetalleFactura ON EncabezadoFactura.IdFacturaEncabezado = DetalleFactura.IdFacturaEncabezado INNER JOIN
                         Producto ON DetalleFactura.IdProducto = Producto.IdProducto INNER JOIN
                         ModoPago ON EncabezadoFactura.IdModoPago = ModoPago.IdModoPago
WHERE Cliente.edad < @edadNoMayor 
	  AND fecha BETWEEN @fechafinal AND @fechafinal


END

**********************************************************************************************************************************************************

USE [FacturacionDigitalWare]
GO

CREATE PROCEDURE procObtenerTotalVendidoporAno
(
	 @fechaBusqueda Datetime
)

AS
BEGIN 



SELECT         Producto.NombreProducto,DATEPART(YEAR,EncabezadoFactura.fecha) AS Año, ISNULL(SUM(DetalleFactura.Cantidad),0) AS TotalAño
FROM            DetalleFactura INNER JOIN
                         EncabezadoFactura ON DetalleFactura.IdFacturaEncabezado = EncabezadoFactura.IdFacturaEncabezado INNER JOIN
                         Producto ON DetalleFactura.IdProducto = Producto.IdProducto
WHERE YEAR(EncabezadoFactura.fecha) = @fechaBusqueda
GROUP BY  DATEPART(YEAR,EncabezadoFactura.fecha), Producto.NombreProducto
ORDER BY  DATEPART(YEAR,EncabezadoFactura.fecha) ASC



END



