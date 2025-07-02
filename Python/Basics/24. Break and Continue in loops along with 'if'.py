# BREAK and CONTINUE


students = ["ram", "shyam", "kishan", "radha", "radhika"]



# BREAK:
# Break used to break the loop.

#for student in students:
#    if student == "radha":
#        break;                 #semicolon is optional in python
#    print(student)



# CONTINUE:
# It will complete the loop not including the written element.

for student in students:
    if student == "radha":
        continue;                 #semicolon is optional in python
    print(student)