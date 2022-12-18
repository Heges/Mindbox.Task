using Microsoft.EntityFrameworkCore;
using Mindbox.MVC.Models;
using System.Threading;
using System.Threading.Tasks;

namespace Mindbox.MVC.Data
{
    public interface IMindboxEFDbContext
    {
        DbSet<Product> Products { get; set; }
        DbSet<Category> Category { get; set; }
        DbSet<CategoryProduct> CategoriesProducts { get; set; }

        Task<int> SaveChangesAsync(CancellationToken cancelationToken = default);
    }
}