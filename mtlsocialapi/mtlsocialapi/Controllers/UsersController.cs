using Microsoft.AspNetCore.Components;
using Microsoft.AspNetCore.Mvc;
using mtlsocialapi.Models;
using mtlsocialapi.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace mtlsocialapi.Controllers
{
    [Microsoft.AspNetCore.Mvc.Route("/[controller]")]
    [ApiController]
    public class UsersController : ControllerBase
    {
        private readonly UsersService _userService;
        public UsersController(UsersService userService)
        {
            _userService = userService;
        }
        [HttpGet]
        public ActionResult<List<Users>> Get() =>
            _userService.Get();

        [HttpGet("{id:length(24)}", Name = "GetTodo")]
        public ActionResult<Users> Get(string id)
        {
            var todo = _userService.Get(id);

            if (todo == null)
            {
                return NotFound();
            }

            return todo;
        }

        [HttpPost]
        public ActionResult<Users> Create(Users todo)
        {
            _userService.Create(todo);

            return CreatedAtRoute("GetTodo", new { id = todo.Id.ToString() }, todo);
        }

        [HttpPut("{id:length(24)}")]
        public IActionResult Update(string id, Users todoIn)
        {
            var todo = _userService.Get(id);

            if (todo == null)
            {
                return NotFound();
            }

            _userService.Update(id, todoIn);

            return NoContent();
        }

        [HttpDelete("{id:length(24)}")]
        public IActionResult Delete(string id)
        {
            var todo = _userService.Get(id);

            if (todo == null)
            {
                return NotFound();
            }

            _userService.Remove(todo.Id);

            return NoContent();
        }
    }
}
