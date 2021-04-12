using System;
using System.Collections.Generic;

namespace FacturacionDigitalWare.Modelo
{
    public partial class EncabezadoFactura
    {
        public int IdFacturaEncabezado { get; set; }
        public int? IdCliente { get; set; }
        public DateTime? Fecha { get; set; }
        public int? IdModoPago { get; set; }
    }
}
