# Class method:



class Person:
    name = "Anonymous"

##    def changeName(self, name):
##        self.name = name

    @classmethod                   #decorator
    def changeName(cls, name):
        cls.name = name



p1 = Person()
p1.changeName("Tony Stark")
print(p1.name)
print(Person.name)



# static methods
# class methods (cls)
# instance methods(sef)