#!/bin/bash
# Update the Sakai 3 environment

source ./config.sh

# Kill Java
echo "// Kill all the java processes"
killall -9 java

# Remove the sling folder
echo "// Remove the sling folder"
echo "//// Removing: "${SAKAI3_SLING}
rm -rf ${SAKAI3_SLING}

# Update K2
cd $SAKAI3_OPEN_EXPERIMENTS

echo "// Switch to the master branch"
git checkout master

echo "// Fetch ieb"
git fetch ieb

echo "// Merge ieb"
git merge ieb/master

echo "// Push to your master"
git push origin master

echo "// Go To osgikernel"
cd ${SAKAI3_OSGIKERNEL}

echo "// Build K2"
mvn clean install
echo "// Build K2 Finished"

# Start logging
cd ${SAKAI3_SCRIPTS}
source sakailogging.sh