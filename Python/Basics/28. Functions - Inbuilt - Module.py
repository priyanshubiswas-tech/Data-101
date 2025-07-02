# FUNCTIONS
# 1. In-Built Functions
# 2. Module Functions
# 3. User-Defined Functions



# 1. In-Built Functions:

#    int()
#    str()
#    bool()

# 2. Module Functions
#   Def: Related functions and related variables are stored in one file.
#   Ex: math

import math
print(dir(math)) #print al the functions

#To import a specific function from the module.
from math import sqrt
print(sqrt(16))


# to select all the functions, use *

from math import *
print(sqrt(16))



