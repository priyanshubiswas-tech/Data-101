# Property decorator
#Example: Calculating percentage of student marks using OOPS:

class Student:
    def __init__(self, phy, chem, maths):
        self.phy = phy
        self.chem = chem
        self.maths = maths
##        self.percentage = str(self.phy + self.chem = self.maths) / 3) + "%"

##    def calculatePercentage(self):
##        self.percentage = str(self.phy + self.chem = self.maths) / 3) + "%"


    @property
    def percentage(self):
        return str((self.phy + self.chem + self.maths) / 3) + "%"


stu1 = Student(98, 97, 99)
print(stu1.percentage)

# here, we want to change the score of phy to 86.
stu1.phy = 86
print(stu1.phy)
#stu1.calculatePercentage() #this is used to change the percentage according to the new score.
print(stu1.percentage) #using property decorator

