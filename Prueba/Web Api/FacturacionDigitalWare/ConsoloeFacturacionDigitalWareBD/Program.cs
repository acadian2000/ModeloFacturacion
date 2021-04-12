using System;
using System.Linq;
using System.Collections.Generic;

namespace ConsoloeFacturacionDigitalWareBD
{
    class Program
    {
        static void Main(string[] args)
        {
            using (Modelo.FacturacionDigitalWareContext db = new Modelo.FacturacionDigitalWareContext())
            {
                List<Modelo.Cliente> Clientes = (from d in db.Cliente
                                                 select d).ToList();

                foreach (Modelo.Cliente client in Clientes)
                {
                    Console.WriteLine(client.Nombre);
                }
            }

            Console.ReadKey();
        }
    }
}
