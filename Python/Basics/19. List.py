
#LIST - datatype
# Collection of items. Complex data type

#marks = [95, 98, 97]
#print(marks)

#marks = [95, 98, 97]   # print 1 index = 98
#print(marks[1])

#marks = [95, 98, 97]   # print 0 index = 98
#print(marks[0])

#marks = [95, 98, 97]   # print 0 index = 95
#print(marks[0])

# Index can be negative as well!
# In python, '-' means counting will start from behind.

#marks = [95, 98, 97]   # print 0 index = 97
#print(marks[-1])

#marks = [95, 98, 97]   # print 0 index = 98
#print(marks[-2])

#marks = [95, 98, 97]   # 'list index out of range' as there is no item at -4 index
#print(marks[-4])

#marks = [95, 98, 97]   # print first two index not including third index
#print(marks[0:2])

#marks = [95, 98, 97]   # print all the items
#print(marks[0:3])

#marks = [95, 98, 97]   # print [98, 97]
#print(marks[1:3])

marks = [95, 98, 97]   # print [97]
print(marks[2:3])