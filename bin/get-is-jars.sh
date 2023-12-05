# Don't cd .. here because we are using the pwd from calling script

# Build working folder
mkdir ../is-src

# Get needed files
#TODO: Scott you are here: you need to add copy statements and refactor this into functions


# Build project
#TODO: write mvn clean installs

# Check the exit status of the previous command
if [ $? -ne 0 ]; then
    echo "Error occurred in building IS support JAR source. Exiting."
    exit 1
fi


# Grab supporting jars / scripts
# TODO: iron this out...
cd ./identity-oauth2-grant-rest/artifacts
wget https://product-dist.wso2.com/downloads/is-connectors/1.0.0/RESTAuthenticationConnector/artifacts.zip
unzip ./*.zip

# Copy jar files to our project
#TODO: Write this - copy jars to IS dropins

