
ID=$1
USERNAME=$2
PASSWORD=$3
DESCRIPTION=$4

CRUMB=$(curl http://192.168.33.20:9000/crumbIssuer/api/xml?xpath=concat\(//crumbRequestField,%22:%22,//crumb\) \
-c cookies.txt \
--user 'admin:admin')

TOKENVALUE=$(curl -H "$CRUMB" 'http://192.168.33.20:9000/user/admin/descriptorByName/jenkins.security.ApiTokenProperty/generateNewToken' \
--data 'newTokenName=token' \
--user 'admin:admin' \
-b cookies.txt | jq -r '.data.tokenValue')

curl -X POST -u admin:"$TOKENVALUE" "http://@192.168.33.20:9000/credentials/store/system/domain/_/createCredentials" \
--data-urlencode 'json={
  "": "0",
  "credentials": {
    "scope": "GLOBAL",
    "id": "'"$ID"'",
    "username": "'"$USERNAME"'",
    "password": "'"$PASSWORD"'",
    "description": "'"$DESCRIPTION"'",
    "$class": "com.cloudbees.plugins.credentials.impl.UsernamePasswordCredentialsImpl"
  }
}'
