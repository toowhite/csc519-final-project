pkill -f "node main.js"
pkill -f "/usr/bin/java -classpath /usr/share/maven/boot/plexus-classworlds-2.x.jar"

cd /bakerx/cm/detect-useful-tests
npm install 
npm install --save -y filehound
node main.js $1