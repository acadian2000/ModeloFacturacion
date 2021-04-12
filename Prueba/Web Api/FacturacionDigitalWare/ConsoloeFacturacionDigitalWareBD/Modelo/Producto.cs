using System;
using System.Collections.Generic;

namespace ConsoloeFacturacionDigitalWareBD.Modelo
{
    public partial class Producto
    {
        public int IdProducto { get; set; }
        public string NombreProducto { get; set; }
        public decimal? PrecioProducto { get; set; }
        public int? Stock { get; set; }
        public int? IdCategoria { get; set; }
    }
}
