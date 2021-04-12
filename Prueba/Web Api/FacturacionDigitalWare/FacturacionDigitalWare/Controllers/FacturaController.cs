using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using FacturacionDigitalWare.Modelo;
using FacturacionDigitalWare.Modelo_Factura;
using Microsoft.AspNetCore.Mvc;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace FacturacionDigitalWare.Controllers
{
    [Route("api/[controller]")]
    public class FacturaController : Controller
    {
        private readonly FacturacionDigitalWareContext context;

        public FacturaController(FacturacionDigitalWareContext context)
        {
            this.context = context;
        }

        // GET: api/<controller>
        [HttpGet]
        public ActionResult Get()
        {
            try
            {               
                return Ok(context.EncabezadoFactura.ToList());
            }
            catch (Exception ex)
            {

                return BadRequest(ex.Message);
            }
        }

        // GET api/<controller>/5
        [HttpGet("{id}", Name ="GetFacturas")]
        public ActionResult Get(int id)
        {
            try
            {
                var DetalleEncabezado = from a in context.EncabezadoFactura
                                        join s in context.DetalleFactura on a.IdFacturaEncabezado equals s.IdFacturaEncabezado
                                        join b in context.Cliente on a.IdCliente equals b.IdCliente
                                        join d in context.Producto on s.IdProducto equals d.IdProducto
                                        join e in context.ModoPago on a.IdModoPago equals e.IdModoPago
                                        select new Factura
                                        {
                                            IdFacturaEncabezado = a.IdFacturaEncabezado,
                                            Fecha = a.Fecha,
                                            Nombre = b.Nombre,
                                            Apellido = b.Nombre,
                                            Direccion = b.Direccion,
                                            Telefono = b.Telefono,
                                            Email = b.Email,
                                            NombreProducto = d.NombreProducto,
                                            Cantidad = s.Cantidad,
                                            Precio = s.Precio,
                                            NombreModoPago = e.NombreModoPago,
                                            OtrosDetalles = e.OtrosDetalles
                                        };
                var facturas = context.DetalleFactura.FirstOrDefault(f => f.IdFacturaEncabezado == id);
                return Ok(facturas);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        // POST api/<controller>
        [HttpPost]
        public ActionResult Post([FromBody]EncabezadoFactura cabezaFactura)
        {
            try
            {
                context.EncabezadoFactura.Add(cabezaFactura);
                context.SaveChanges();
                return CreatedAtRoute("GetFacturas", new { id = cabezaFactura.IdFacturaEncabezado }, cabezaFactura);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        // PUT api/<controller>/5
        [HttpPut("{id}")]
        public ActionResult Put(int id, [FromBody]EncabezadoFactura cabezaFactura)
        {
            try
            {
                if (cabezaFactura.IdFacturaEncabezado == id)
                {
                    context.Entry(cabezaFactura).State = Microsoft.EntityFrameworkCore.EntityState.Modified;
                    context.SaveChanges();
                    return CreatedAtRoute("GetClientes", new { id = cabezaFactura.IdFacturaEncabezado }, cabezaFactura);
                }
                else
                {
                    return BadRequest();
                }
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        // DELETE api/<controller>/5
        [HttpDelete("{id}")]
        public ActionResult Delete(int id)
        {
            try
            {
                var encabezaFactura = context.EncabezadoFactura.FirstOrDefault(f => f.IdFacturaEncabezado == id);
                if (encabezaFactura != null)
                {
                    context.EncabezadoFactura.Remove(encabezaFactura);
                    context.SaveChanges();
                    return Ok(id);
                }
                else
                {
                    return BadRequest();
                }
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }
    }
}
