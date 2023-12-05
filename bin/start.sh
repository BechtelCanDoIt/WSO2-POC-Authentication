#!/bin/bash
CURRENT_PWD=`pwd`
echo "Start PWD: $CURRENT_PWD"

# SECTION: cleanup
# Delete old runs if present
# Bring servers down if up and clean up
#../bin/stop.sh - TODO: turn me back on!
rm -Rf ../am
rm -Rf ../is
rm -Rf ../db
rm -Rf ../is-src

# SECTION: setup
# Setup needed folders for API-M
mkdir -p ./am/repository/deployment/server
mkdir -p ./am/repository/conf

# Setup needed folders for IS
mkdir -p ./is/repository/deployment/server
mkdir -p ./is/repository/conf
mkdir -p ./is/repository/components/dropins

# Setup needed folders for the database
mkdir -p ./db/scripts
mkdir -p ./db/mysql_data

# Set up WSO2 servers 
docker login docker.wso2.com

# Check the exit status of the previous command
if [ $? -ne 0 ]; then
    echo "Error logging into docker.wso2.com. Exiting."
    exit 1
fi

cp ../wso2-config/am/docker-compose.yml ./am/
#cp ../wso2-config/am/deployment.toml ./am/repository/conf

cp ../wso2-config/is/docker-compose.yml ./is/
#cp ../wso2-config/is/deployment.toml ./is/repository/conf

cp ../wso2-config/db/docker-compose.yml ./db/
#cp ../wso2-config/db/initial_script.sql ./db/scripts

# Get required JAR files for this demo
./get-is-jars.sh
cd $CURRENT_PWD
pwd
exit 1
##### end debugging

# Start WSO2 serves
cd ../am
docker-compose up -d
if [ $? -ne 0 ]; then
    echo "API-M didn't start correctly. Exiting."
    exit 1
fi
cd ..

#cd ../is
#docker-compose up -d
#if [ $? -ne 0 ]; then
#    echo "Identity Server didn't start correctly. Exiting."
#    exit 1
#fi
#cd ..


exit 1

# Start Node Server
cd ../web/wso2-auth-demo
npm start &


