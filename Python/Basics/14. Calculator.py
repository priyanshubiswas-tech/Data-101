# *****CALCULATOR*****
# *****CALCULATOR*****
# *****CALCULATOR*****
# *****CALCULATOR*****
# *****CALCULATOR*****



first = input("enter first number : ") #input will be recieved in str form.
operator = input("enter operator (+, -, *, /, %) : ")
second = input("enter second number : ") #input will be recieved in str form.

# first and second, both are in str form. Therefore, operator wouldn't know what to add or multiply.
# To continue operation, we must perform type conversion of str to int/float.

first = float(first)
second = float(second)

if operator == "+":
    print(first + second)


elif operator == "-":
    print(first - second)
elif operator == "*":
    print(first * second)
elif operator == "/":
    print(first / second)
elif operator == "%":
    print(first % second)

else:
    print("Invalid operation")




# *****CALCULATOR*****
# *****CALCULATOR*****
# *****CALCULATOR*****
# *****CALCULATOR*****
# *****CALCULATOR*****