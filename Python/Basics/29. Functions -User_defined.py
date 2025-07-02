# FUNCTIONS
# 1. In-Built Functions
# 2. Module Functions
# 3. User-Defined Functions



# 3. User-Defined Functions:

# SYNTAX:

# def function_name(paramters):
#     //do something


# EXAMPLE:
    # here, I've made a function to print sum.
#def print_sum(first, second):
#    print(first + second)

#print_sum(1, 2)


# EXAMPLE:
    # here, I've modified the previous function.
    # I've assigned 'second' the value '4', It will have this value by default now.

def print_sum(first, second=4):
    print(first + second)

print_sum(1) # Output: 5

# this is done to show outputs when only one number is entered.

