# 
if True:
    print("Condition was true")

# Statement wont print
if False:
    print("Condition was False")

# Static variable
#name = "Deepu"

# Dynamic variables
faa = input("Enter father name: ")
maa = input("Enter mother name: ")

if faa == "Mouli":
    print("Name is Mouli")
elif maa == "Deepu":
    print("Name is Deepu")
else:
    print("No match with", name)

if faa == "Mouli" and maa == "Deepu":
    print("They are couple")
else:
    print("No records found!")

faa="Mouli"
mom="Deepu"
print("Parents are", faa , mom)
