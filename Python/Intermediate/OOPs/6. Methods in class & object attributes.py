# Methods

class Student:
    College_name = "Tula's institute, Dehradun"  #class attribute
    def __init__(self, name, year, marks):
        self.name = name                         #object attribute
        self.year = year
        self.marks = marks

    def welcome(self):                           #method
        print("welcome student", self.name)

    def get_marks(self):                         #method
        return self.marks

s1 = Student("Priyanshu", 2001, 100)
print(s1.name, s1.year, s1.marks)

print(s1.College_name)

s1.welcome()

print(s1.get_marks())
