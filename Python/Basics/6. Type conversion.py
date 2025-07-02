#TYPE CONVERSION

#int()
#float()
#str()
#bool()

#we use this because of "TypeError", we can concatinate str with str only.
#To sum the age, we must perform type conversion by converting old_age into int.
#int(old_age)


old_age = input("enter your age : ")
new_age = int(old_age) + 2
print("you will be " + str(new_age) + " years old in 2026.")



#line 15. print("you will be " + str(new_age) + " years old in 2026.")
# here, we have used str() to concatinate our converted new_age with str.