# Python

- Text Source: https://automatetheboringstuff.com
- YouTube: https://www.youtube.com/watch?v=YYXdXT2l-Gg&list=PL-osiE80TeTskrapNbzXhwoFUiLCjGgY7

# Basics
## Print:
```
print("Hello world")
```

## Additions: 
```
In Python, 2 + 2 is called an expression, which is the most basic kind of programming instruction in the language. Expressions consist of values (such as 2) and operators (such as +), and they can always evaluate (that is, reduce) down to a single value.
```

## Strings
- We can use print to print the resulsts
- We can define a variable and use print them in the code.
- len function to print length of our string
- We have lower and upper methos to change the strings.
- Count method helps to count how many time a letter/word repeated[It is case sensitive].
- Find method helps to find the index of the word. If t doesnt find any word in the variable, it returns negative values[-1]
- replace method helps to replace.
```
message = "Hello World"
message.replace('source','replacement')
```
- String concatination can be done using +.
- We can use the formater for String concatination.
- F strings: String formating got easier.

## Numeric data - Integers and Floats
- BuiltIn function called "type", helps you find the data type of variable.
```
num = 4
print(type(num))

result:
<class 'int'>
```
- We can perform arthematic operations.
- abs [absolute number] function remove the -ve values.
- round function to round to nearest value.
- We can do the comparisons.
```
num_1 = 2
num_2 = 4
print(num_1 == num_2)
```
- use "int" function to change the string variable to integer.

## Lists, Tuples and Sets
- Lists are muteable
- Lists are used to store multiple items in a single variable.
- Python used to store collections of data, the other 3 are Tuple, Set, and Dictionary
- We can use follow methods to adjust the list of items in a LIST.
- We can add values to list using "append"
- insert to add an item at specific place.
- extend, if we have new list of items to be added to existing list.
- Lists are defined with []
---
- Tuples are not mutable, we can not modify them like lists.
- Tuples are defines with ()
- Sort wont work
---
- Sets are defined with {}
- Sets doesnt care about the item order that it prints.
- Sets prints the items in random order, unlike lists and tuples.
- Sets eliminates the duplicates.
- We can check if the item is in the set or no
- We can use intersection method to view the common items.

## Dictionaries
- Dictionaries are key, value pairs.

## If conditions
- we use the if statement to run a block code only when a certain condition is met.

## Loops - for and while
- Loop is designed to repeatedly execute a code block
- Python offers 3 choices for running the loops. The basic functionality of all the techniques is the same, although the syntax and the amount of time required for checking the condition differ.
- while, for and nested
- Syntax of the for Loop
```
for value in sequence:
    { code block }
```

## Functions
- Functions are defined with "def" keyword.
- We can use "pass" to skip the function empty.
```
def function_name():
    pass
function_name() #To call function
```
- Function all helpful to use them repeated way in different places in the code.

## Import modules
- In Python, the import statement is used to import modules, which are pre-written code files that contain functions, classes, and variables that can be used in your Python programs.

To import a module, you use the import keyword followed by the name of the module.
- To list the available submodules in a module, you can use the dir() function in Python. Here's an example:

```
import math

print(dir(math))
```
Note that not all modules have submodules, so you may get an empty list if you call dir() on a module that doesn't have any submodules or objects defined.