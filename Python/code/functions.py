# function with no argument
def fun_def():
    pass
fun_def()

print(fun_def())

def name():
    print("Name Function")

name()

def greet():
    print('Hello World!')

# call the function
greet()

print('Outside function')

# function with two arguments
def add_numbers(num1, num2):
    sum = num1 + num2
    print('Sum: ',sum)

add_numbers(2,3)

def add_numbers():
    pass

# Math function

def square_root(num):
    #return num * num
    sr = num * num
    return sr
sqr = square_root(2)
print('Square', sqr)



num = int(input('Enter num:'))
def square_root(num):
    #return num * num
    sr = num * num
    return sr
result = square_root(num)
print('Square root of',num, 'is', result)


#Math function with return
def square_root(num):
    return num * num
#    print(sr)

#square_root(4)

for i in [1,2,3]:
    result = square_root(i)
    print('Square of',i, '=',result)

