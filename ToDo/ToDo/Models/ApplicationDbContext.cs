using System.Data.Entity;
using System.Data.Entity.ModelConfiguration.Conventions;
using Microsoft.AspNet.Identity.EntityFramework;

namespace ToDo.Models
{
    public class ApplicationDbContext : IdentityDbContext<ApplicationUser>
    {
        // Marked virtual for moq unit testing
        public virtual DbSet<Todo> Todos { get; set; }

        public ApplicationDbContext()
            : base("ToDo", throwIfV1Schema: false)
        {
        }

        public static ApplicationDbContext Create()
        {
            return new ApplicationDbContext();
        }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);

            modelBuilder.Conventions.Remove<PluralizingTableNameConvention>();
        }
    }
}