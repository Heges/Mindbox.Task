using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Shapes
{
    public sealed class Circle : ShapeBehaviour
    {
        private double _r;

        public Circle(double r)
        {
            this._r = r;
        }

        public override double Area() => Math.PI * Math.Pow(_r, 2);
    }
}
