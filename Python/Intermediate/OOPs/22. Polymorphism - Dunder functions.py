# Polymorphism : Operator Overloading
# how to print complex numbers

class Complex:
    def __init__(self, real, img):
        self.real = real
        self.img = img

    def showNumber(self):
        print(self.real, "i +", self.img, "j")

    def __add__(self, num2):   #dunder for addition
        newReal = self.real + num2.real
        newimg = self.img + num2.img
        return Complex(newReal, newimg)

    def __sub__(self, num2):   #dunder for Subtraction
        newReal = self.real - num2.real
        newimg = self.img - num2.img
        return Complex(newReal, newimg)


num1 = Complex(1, 3)
num1.showNumber()

num2 = Complex(4, 6)
num2.showNumber()

##num3 = num1.add(num2)
##num3.showNumber()

num3 = num1 + num2 #since, we are using dunder (__add__)
num3.showNumber()

num3 = num1 - num2
num3.showNumber()
#to make a logic for addition of complex numbers, we use Dunder functions.
# Dunder functions(__)