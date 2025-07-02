# Types of inheritance:
# Single inheritance
# Multi-level inheritance
# Multiple inheritance

class Car:
    color = "black"
    @staticmethod
    def start():
        print("car started..")

    @staticmethod
    def stop():
        print("car is stopped")

class Toyota(Car):
    def __init__(self, brand):
        self.brand = brand

class Fortuner(Toyota):
    def __init__(self, type):
        self.type = type

car1 = Fortuner("diesel")
car1.start()

# This is an example of multi-level inheritance.