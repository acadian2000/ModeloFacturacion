using System;
using System.Collections.Generic;

namespace ConsoloeFacturacionDigitalWareBD.Modelo
{
    public partial class Cliente
    {
        public int IdCliente { get; set; }
        public string Nombre { get; set; }
        public string Apellido { get; set; }
        public string Direccion { get; set; }
        public string FechaNacimiento { get; set; }
        public string Telefono { get; set; }
        public string Email { get; set; }
        public int? Edad { get; set; }
    }
}
