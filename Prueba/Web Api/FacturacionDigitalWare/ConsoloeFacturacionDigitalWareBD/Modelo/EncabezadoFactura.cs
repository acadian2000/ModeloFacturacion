using System;
using System.Collections.Generic;

namespace ConsoloeFacturacionDigitalWareBD.Modelo
{
    public partial class EncabezadoFactura
    {
        public int IdFacturaEncabezado { get; set; }
        public int? IdCliente { get; set; }
        public DateTime? Fecha { get; set; }
        public int? IdModoPago { get; set; }
    }
}
