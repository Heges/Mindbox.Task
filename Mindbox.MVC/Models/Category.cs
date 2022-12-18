using System.Collections.Generic;

namespace Mindbox.MVC.Models
{
    public class Category
    {
        public int CategoryId { get; set; }
        public string Name { get; set; }
        public IList<CategoryProduct> Products { get; set; }
    }
}