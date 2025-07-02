# Practice question:

# Define a Circle class to create a circle with radius r using the constructor.
# Define the Area() method of the class which caculates the area of the circle.
# define a perimeter() method of the class which allows you to calculate the -
# - perimeter of the circle.

class Circle:
    def __init__(self, radius):
        self.radius = radius
    def Area(self):
        return 3.14 * self.radius ** 2

    def Perimeter(self):
        return 2 * 3.14 * self.radius

c1 = Circle(21)
print(c1.Area())
print(c1.radius)
print(c1.Perimeter())