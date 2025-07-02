# Define a Employee class with attributes role, department & salary.
# This class also has a showdetails() method.
# Create an engineer class that inherits properties from employee & has-
# -additional attributes: name & age

class Employee:
    def __init__(self, role, department, salary):
        self.role = role
        self.department = department
        self.salary = salary

    def showDetails(self):
        print("role =", self.role)
        print("department =", self.department)
        print("salary =", self.salary)

class Engineer(Employee):
    def __init__(self, name, age):
        self.name = name
        self.age = age
        super().__init__("Engineer", "IT", "75000")

e1 = Employee("SDE", "IT", "14000")
e1.showDetails()

engg1 = Engineer("Elon Musk", 40)
engg1.showDetails()