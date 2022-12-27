print("Hello world!")

message = "This is a variable"

multi_line_message = """Hi Everyone,
this is a multi line variable.
Thank you!
"""
print(message)

print(multi_line_message)

#Length of the variables
print(len("Hello world!"))

print(len(message))

#Print index of a variable
print(message[0])

# It prints the same
print(message[0:4])

print(message[:4])

# Print variable using range
print(message[5:])

# We can lower the UPPER CASE strings
message="Hi EveryOne"
print(message.lower())
#UPPER
print(message.upper())

#Letter/word count
print(message.count('e'))

#Find
print(message.find('e'))
print(message.find('Hi'))
# It returns negative value, as the string is not indexed
print(message.find('try'))

# Replace a word
message = "Hello World"

new_message = message.replace('World', 'Everyone')
print(new_message)

# Adding multiple messages, Sting concatination
greeting = 'Hello'
name = 'Mike'

message = greeting + name
message_2 = greeting + ' ' + name
message_3 = greeting + ' ' + name + ', How are you!'
print(message)
print(message_2)
print(message_3)

message_4 = '{} {}, How are you today!'.format(greeting, name)
print(message_4)

# F strings
message_5 = f'{greeting} {name}. it is F string concat!'
print(message_5)
# F string concat with lowe function
message_6 = f'{greeting} {name.lower()}. it is F string concat!'
print(message_6)

print(message.swapcase)