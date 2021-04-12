using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace FacturacionDigitalWare.Modelo_Factura
{
    public class Factura
    {
        public int IdFacturaEncabezado { get; set; }
        public DateTime? Fecha { get; set; }
        public string Nombre { get; set; }
        public string Apellido { get; set; }
        public string Direccion { get; set; }
        public string Telefono { get; set; }
        public string Email { get; set; }
        public string NombreProducto { get; set; }
        public int? Cantidad { get; set; }
        public decimal? Precio { get; set; }
        public string NombreModoPago { get; set; }
        public string OtrosDetalles { get; set; }

    }
}
