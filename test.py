
import requests
import json

params = "2"
url = "http://172.26.5.201:8000/api/booking/"+params
request = requests.get(url)
loginJsonData = request.json()
print('test : ',loginJsonData)

liste = [
]
i = 0
for item in loginJsonData:
    liste.append(loginJsonData[i]["id"])
    liste.append(loginJsonData[i]["vehicle_id"])
    i += 1

print(liste)