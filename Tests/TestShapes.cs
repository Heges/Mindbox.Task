using System.Collections.Generic;
using System.Threading.Tasks;
using Shapes;
using Xunit;

namespace Tests
{
    public class TestShapes
    {
        [Fact]
        public void CheckRightTriangle_TrueRightTriangle()
        {
            Triangle triangle = new Triangle(3, 4, 5);

            Assert.True(triangle.CheckRightTriangle);
        }

        [Fact]
        public void CheckRightTriangle_FalseRightTriangle()
        {
            Triangle triangle = new Triangle(4, 4, 5);

            Assert.False(triangle.CheckRightTriangle);
        }

        [Fact]
        public void CallculateAreaSequenceShapes_Success()
        {
            List<ShapeBehaviour> shapes = new List<ShapeBehaviour>()
            {
                new Triangle(3, 4, 5),
                new Circle(2)
            };

            foreach (var item in shapes)
            {
                Assert.True(item.Area() > 0);
            }
        }
    }
}
