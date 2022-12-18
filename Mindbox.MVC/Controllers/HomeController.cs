using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;
using Mindbox.MVC.Data;
using Mindbox.MVC.Models;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;

namespace Mindbox.MVC.Controllers
{
    public class HomeController : Controller
    {
        private readonly MindboxEFDbContext _context;

        public HomeController(MindboxEFDbContext context)
        {
            _context = context;
        }

        public IActionResult Index()
        {
            /// <summary>
            /// или вот так на SQL
            ///SELECT
            ///p.Name,
            ///cp.Name
            ///FROM
            ///Products p
            ///LEFT OUTER JOIN CategoriesProducts cpt ON p.ProductId = cpt.ProductId
            ///LEFT OUTER JOIN Category cp ON cpt.CategoryId = cp.CategoryId
            /// </summary>
            var query = _context.Products
                .Include(p => p.CategoryProducts)
                .ThenInclude(x => x.Category);

            var listProducts = query.ToList();

            Dictionary<string, string> dict = new Dictionary<string, string>();

            foreach (var item in listProducts)
            {
                if (item.CategoryProducts != null && item.CategoryProducts.Count > 0)
                {
                    foreach (var category in item.CategoryProducts)
                    {
                        dict.Add(item.Name, category.Category.Name);
                    }
                }
                else
                {
                    dict.Add(item.Name, "");
                }
            }

            return View(dict);
        }

        public IActionResult Privacy()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
