using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using FacturacionDigitalWare.Modelo;
using Microsoft.AspNetCore.Mvc;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace FacturacionDigitalWare.Controllers
{
    [Route("api/[controller]")]
    public class ProductoController : Controller
    {
        private readonly FacturacionDigitalWareContext context;

        public ProductoController(FacturacionDigitalWareContext context)
        {
            this.context = context;
        }

        // GET: api/<controller>
        [HttpGet]
        public ActionResult Get()
        {
            try
            {
                return Ok(context.Producto.ToList());
            }
            catch (Exception ex)
            {

                return BadRequest(ex.Message);
            }
        }

        // GET api/<controller>/5
        [HttpGet("{id}",Name ="GetProductos")]
        public ActionResult Get(int id)
        {
            try
            {
                var Productos = context.Producto.FirstOrDefault(f => f.IdProducto == id);
                return Ok(Productos);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        // POST api/<controller>
        [HttpPost]
        public ActionResult Post([FromBody]Producto Product)
        {
            try
            {
                context.Producto.Add(Product);
                context.SaveChanges();
                return CreatedAtRoute("GetProductos", new { id = Product.IdProducto }, Product);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        // PUT api/<controller>/5
        [HttpPut("{id}")]
        public ActionResult Put(int id, [FromBody]Producto Product)
        {
            try
            {
                if (Product.IdProducto == id)
                {
                    context.Entry(Product).State = Microsoft.EntityFrameworkCore.EntityState.Modified;
                    context.SaveChanges();
                    return CreatedAtRoute("GetClientes", new { id = Product.IdProducto }, Product);
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
                var Productos = context.Producto.FirstOrDefault(f => f.IdProducto == id);
                if (Productos != null)
                {
                    context.Producto.Remove(Productos);
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
