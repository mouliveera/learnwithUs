names = ['mouli', 'deepu', 'manasa']
print(names)
print(names[0])
print(names[1])
print(names[2])

# Print last item in the list
print(names[-1])
print(names[-2])

# Print from start and end
print(names[0:2])

print(names[1:])

# Length of values in the list
print(len(names))

# Adding value to the list, it adds the item at the end
names.append('arjun')

# insert to add an item at specific place.
names.insert(1,'unknown')

# extend, if we have new list of items to be added to existing list.
# new list
names_2 = ['ram', 'seetha']

#names.insert(0, names_2)

#print(names)
#print(names[0])

names.extend(names_2)
print(names)

# To sort items in the list
# Reverse a list
names.reverse()
print(names)

#sort
names.sort()
print(names)

# We have another method to sort
# sorted(names) wont print the sorted values, you need to assign it to a variable then print
sorted_names = sorted(names)
print(sorted_names)

# Sorting numbers
num = [1,3,5,10,2,4]
num.sort()
print(num)

# Apply maths to lists
print(max(num))
print(min(num))
print(sum(num))

# We can use min and max with strings not sum
#print(sum(names))

# Get the index of the item in the list
print(names.index('mouli'))

print('deepu' in names)


# Loop to print the items in the list
#for item in names:
#    print(item)

# Join
names_str = ' - '.join(names)
# split
names_spt = names_str.split(' - ')
print(names_str)
# We will be back to the list
print(names_spt)

## Tuple
# We are not modify/update
tuple_names = ('raja', 'rani', 'mantri')
print(tuple_names)

sorted_tuple_names = sorted(tuple_names)
print(sorted_tuple_names)

# Errors: TypeError: 'tuple' object does not support item assignment
# This means we can add an item to tuples
# tuple_names[0] = 'senani'
# print(tuple_names)

## Sets
set_names = {'arjun', 'deepu', 'manasa', 'mouli'}
print(set_names)

# Sets eliminates the duplicates.
set_names_dup = {'arjun', 'deepu', 'manasa', 'mouli', 'arjun', 'raaja'}
print(set_names_dup)

print ('mouli' in set_names)

print(set_names.intersection(set_names_dup))
print(set_names_dup.difference(set_names))

# Empty lists, tuples and sets
empty_lists = []
print(empty_lists)
empty_lists = list()
print(empty_lists)

empty_tuples = ()
empty_tuples = tuple()
print(empty_tuples)

empty_sets = {} # This is not correct
print(empty_sets)
empty_sets = set()
print(empty_sets)