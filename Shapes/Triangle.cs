using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Shapes
{
    public class Triangle : ShapeBehaviour
    {
        protected double a;
        protected double b;
        protected double c;
        private double _aPowed;
        private double _bPowed;
        private double _cPowed;

        /// <summary>
        ///простите за это
        ///я уверен что это считается как-то иначе, но для треугольника это будет работать
        /// </summary>
        /// <returns></returns>
        public bool CheckRightTriangle => _aPowed + _bPowed == _cPowed ? true
            : _aPowed + _cPowed == _bPowed ? true
            : _cPowed + _bPowed == _aPowed ? true
            : false;

        public Triangle(double a, double b, double c)
        {
            this.a = a;
            this.b = b;
            this.c = c;
            _aPowed = a * a;
            _bPowed = b * b;
            _cPowed = c * c;
        }

        public override double Area()
        {
            double p = (a + b + c) / 2;
            return Math.Sqrt(p * (p - a) * (p - b) * (p - c));
        }
    }
}
