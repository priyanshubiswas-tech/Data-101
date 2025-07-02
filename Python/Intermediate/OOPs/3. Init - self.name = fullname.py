

# The self parameter is a reference to the current instance of the class, and is used to access
# -variables that belongs to the class.


# attributes --> data ; variables



class Student:

    def __init__(self, name, marks, year):
        self.name = name
        self.marks = marks
        self.year = year
        print("adding new student in database")


s1 = Student("Priyanshu", 97, 2002)
print(s1.name, s1.marks, s1.year)

s2 = Student("Arjun", 88, 2001)
print(s2.name, s2.marks, s2.year)