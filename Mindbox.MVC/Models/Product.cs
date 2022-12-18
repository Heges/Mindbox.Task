using System.Collections.Generic;

namespace Mindbox.MVC.Models
{
    public class Product
    {
        public int ProductId { get; set; }
        public string Name { get; set; }
        public IList<CategoryProduct> CategoryProducts { get; set; }
    }
}