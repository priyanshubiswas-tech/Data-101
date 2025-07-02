# STATIC METHODS
# Methods that don't use the self parameter (work at class level)

class Student:
    def __init__(self, name, marks):
        self.name = name
        self.marks = marks

    @staticmethod                           #decorator
    def hello():
        print("hello")

    def get_avg(self):
        sum = 0
        for val in self.marks:
            sum += val
        print("hi", self.name, "your ag score is:", sum/3)

s1 = Student("tony stark", [99,98,97])
s1.get_avg()
s1.hello()


#decorator allow us to wrap another function in orer to extend the behaviour -
# - of the wrapped function,without permanently modifying it.