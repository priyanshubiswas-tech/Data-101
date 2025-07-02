# Inheritance:
# When one class(child/derived) derives the properties & methods -
# - of another class(parent/base).

class Car:
    color = "black"
    @staticmethod
    def start():
        print("car started..")

    @staticmethod
    def stop():
        print("car is stopped")

class Toyota(Car):
    def __init__(self, name):
        self.name = name

car1 = Toyota("fortuner")
car2 = Toyota("prius")

print(car1.name)
print(car2.name)

print(car1.start)
print(car1.color)


# This is an example of single inheritance.