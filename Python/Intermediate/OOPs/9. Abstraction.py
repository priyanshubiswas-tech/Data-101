# OOP:
# 1.Abstaction 2.Encapsulation 3.Inheritance 4.Polymorphism



# Abstaction: Hiding the implementation details of a class and only showing -
# the essential features to the user.

class Car:
    def __init__(self):
        self.acc = False
        self.brk = False
        self.clutch = False

    def start(self):
        self.clutch = True
        self.acc = True
        print("car started")


car1 = Car()
car1.start()

