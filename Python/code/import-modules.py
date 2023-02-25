import math, sys, requests
print(dir(math))

print(math.sqrt(16))
print(math.pi)

print(sys.path)

#import requests

#url = 'https://mouliveera.com'
url = 'https://www.google.com/'
response = requests.get(url)
status_code = response.status_code

print(status_code)