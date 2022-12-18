using Microsoft.EntityFrameworkCore;
using Mindbox.MVC.Data.Configuration;
using Mindbox.MVC.Models;

namespace Mindbox.MVC.Data
{
    public class MindboxEFDbContext : DbContext, IMindboxEFDbContext
    {
        public DbSet<Product> Products { get; set; }
        public DbSet<Category> Category { get; set ; }
        public DbSet<CategoryProduct> CategoriesProducts { get; set ; }

        public MindboxEFDbContext(DbContextOptions<MindboxEFDbContext> options) : base(options)
        {
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.ApplyConfiguration(new CategoryProductConfiguration());
            modelBuilder.ApplyConfiguration(new CategoryConfiguration());
            modelBuilder.ApplyConfiguration(new ProductConfiguration());

            base.OnModelCreating(modelBuilder);
        }
    }
}