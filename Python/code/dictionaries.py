student = {'name': 'Manasa', 'age': '6', 'cources': ['Telugu', 'English']}
print(student)

print(student['name'])
print(student['cources'])

#It give an error, if a key is not exists in the dictionary.
# To avoid the issues, use get method
print(student.get('name'))
print(student.get('phone')) # It prints None, as the key is not in dic
# Customise the result
print(student.get('phone', 'Key is not available'))

# Add a new key and values

student['phone'] = '123-456'
print(student.get('phone', 'Key is not available'))

# Delete
del student['age']
print(student)

print(len(student))
print(student.keys())

# Loops
for key in student:
    print(key)

for key, value in student.items():
    print(key, value)
