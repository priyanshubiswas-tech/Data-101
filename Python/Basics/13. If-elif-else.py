# IF-ELIF-ELSE



age = input("what is your age? ")

if float(age) >= 18:
    print("you are an adult")
    print("you can vote")
elif float(age) < 18 and float(age) > 3:
    print("you are in school")
else:
    print("you are a child")


print("thank you")
