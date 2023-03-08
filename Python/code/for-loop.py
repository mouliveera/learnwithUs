n = [1, 2, 3, 4 , 5]

for i in n:
    print("number ", i)

for i in n:
    
    if i == 3:
        print("Found!")
        break
    print(i)

for i in n:
    if i == 2:
        print("Found the num")
        continue
    print(i)
print("------------")
for i in range(5):
    print(i)

print("------------")
for i in range(1, 5):
    print(i)
    