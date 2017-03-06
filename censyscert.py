import sys
import json
import requests

from config import API_URL, UID, SECRET

res = requests.get("https://www.censys.io/api/v1/view/websites/google.com", auth=(UID, SECRET))

if res.status_code != 200:
    print "error occurred: %s" % res.json()["error"]
    sys.exit(1)
res = res.json()
res =  res['443']['https']

print json.dumps(res, indent=1)