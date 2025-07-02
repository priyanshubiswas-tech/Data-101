# Private(like) attributes & methods
# Privte attributes are written with __ahead.
# These can be accessed only in object level not class level.


class Account:
    def __init__(self, acc_pswrd, acc_num):
        self.acc_pswrd = acc_pswrd  # Public attribute
        self.__acc_num = acc_num  # Private attribute

    def reset_pass(self):
        print(self.__acc_num)  # This will be printed.

acc1 = Account("010101", "110011")
print(acc1.acc_pswrd)  # ✅ This will work, as it is public

# print(acc1.acc_num)  ❌ This will give an AttributeError
# Correct way to access a private attribute:

print(acc1._Account__acc_num)  # ✅ This works (Name Mangling)

print(acc1.reset_pass())  # ✅ This will print the acc_num
