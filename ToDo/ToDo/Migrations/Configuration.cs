using ToDo.Models;

namespace ToDo.Migrations
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Migrations;
    using System.Linq;

    internal sealed class Configuration : DbMigrationsConfiguration<ToDo.Models.ApplicationDbContext>
    {
        public Configuration()
        {
            AutomaticMigrationsEnabled = false;
            ContextKey = "ToDo.Models.ApplicationDbContext";
        }

        protected override void Seed(ToDo.Models.ApplicationDbContext context)
        {
            context.Todos.AddOrUpdate(x => x.Id,
                new Todo { Id = 1, Description = "Do dishes.", IsComplete = false },
                new Todo { Id = 2, Description = "Do laundry.", IsComplete = false },
                new Todo { Id = 3, Description = "Do pushups.", IsComplete = false });
        }
    }
}
