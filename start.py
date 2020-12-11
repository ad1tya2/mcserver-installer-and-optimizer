import requests
import json
import urllib.request
from clint.textui import progress

response = requests.get("https://papermc.io/api/v2/projects/paper/")
ll = response.text
xy = json.loads(ll)
for x in (xy['version_groups']):
    print(x)
xyz = input("Which version group do you want?")
ty = requests.get("https://papermc.io/api/v2/projects/paper/version_group/"+xyz)
kk = ty.text
tt = json.loads(kk)
for e in (tt['versions']):
    print(e)
abc = input("Which sub-version do you want?")
lop = requests.get("https://papermc.io/api/v2/projects/paper/versions/"+abc)

xxl = json.loads(lop.text)

for pl in xxl['builds']:
    sad = str(pl)

po = requests.get("https://papermc.io/api/v2/projects/paper/versions/"+abc+"/builds/"+sad)
ask = json.loads(po.text)
akkk = json.loads(json.dumps(ask['downloads']))
akak = json.loads(json.dumps(akkk['application']))
ssd = akak['name']
print(ssd)
asd = input("Should the program start downloading?\n(y/n)")

if asd == 'y' or asd == 'Y':
    print("Beginning to download....")

    url = ("https://papermc.io/api/v2/projects/paper/versions/"+abc+"/builds/"+sad+"/downloads/"+ssd)
    path = "./workdir/paper.jar"

    r = requests.get(url, stream=True)    
    with open(path, 'wb') as f:
        total_length = int(r.headers.get('content-length'))
        for chunk in progress.bar(r.iter_content(chunk_size=1024), expected_size=(total_length/1024) + 1): 
            if chunk:
                f.write(chunk)
                f.flush()
    print("done!")

else :
    exit()