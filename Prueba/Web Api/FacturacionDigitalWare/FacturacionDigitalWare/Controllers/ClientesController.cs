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
    public class ClientesController : Controller
    {
        private readonly FacturacionDigitalWareContext context;

        public ClientesController(FacturacionDigitalWareContext context)
        {
            this.context = context;
        }


        // GET: api/<controller>
        [HttpGet]
        public ActionResult Get()
        {
            try
            {
                return Ok(context.Cliente.ToList());
            }
            catch (Exception ex)
            {

                return BadRequest(ex.Message);
            }
        }

        // GET api/<controller>/5
        [HttpGet("{id}", Name = "GetClientes")]
        public ActionResult Get(int id)
        {

            try
            {
                var Clientes = context.Cliente.FirstOrDefault(f => f.IdCliente == id);
                return Ok(Clientes);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        // POST api/<controller>
        [HttpPost]
        public ActionResult Post([FromBody]Cliente Client)
        {
            try
            {
                context.Cliente.Add(Client);
                context.SaveChanges();
                return CreatedAtRoute("GetClientes", new {id = Client.IdCliente },Client);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        // PUT api/<controller>/5
        [HttpPut("{id}")]
        public ActionResult Put(int id, [FromBody]Cliente Client)
        {
            try
            {
                if (Client.IdCliente == id)
                {
                    context.Entry(Client).State = Microsoft.EntityFrameworkCore.EntityState.Modified;
                    context.SaveChanges();
                    return CreatedAtRoute("GetClientes", new {id = Client.IdCliente}, Client);
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
                var Cliente = context.Cliente.FirstOrDefault(f => f.IdCliente == id);
                if (Cliente != null)
                {
                    context.Cliente.Remove(Cliente);
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
