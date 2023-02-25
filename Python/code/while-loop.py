n = 0

while n < 10:
    print("while loop spin", n)
    n += 1

print("---------------")

n = 0
while n < 10:
    if n == 5:
        break
    print("while loop spin", n)
    n += 1

n = 1
while n < 5:
    if n == 3:
        break
    print(n, "while loop spin")
    n += 1