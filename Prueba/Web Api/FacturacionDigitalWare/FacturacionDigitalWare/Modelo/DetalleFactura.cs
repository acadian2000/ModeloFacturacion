using System;
using System.Collections.Generic;

namespace FacturacionDigitalWare.Modelo
{
    public partial class DetalleFactura
    {
        public int IdFacturaDetalle { get; set; }
        public int IdFacturaEncabezado { get; set; }
        public int? IdProducto { get; set; }
        public int? Cantidad { get; set; }
        public decimal? Precio { get; set; }
    }
}
