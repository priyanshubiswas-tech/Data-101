#  Class & Instance Attributes
# Class.attr --> attribute that is common for all
# Obj.attr --> attribute unique


class Student:
    College_name = "Tula's institute, Dehradun"  #class attribute
    def __init__(self, name, year, marks):
        self.name = name                         #object attribute
        self.year = year
        self.marks = marks
        print("adding a new student in Database")

s1 = Student("Priyanshu", 2001, 100)
print(s1.name, s1.year, s1.marks)
print(s1.College_name)