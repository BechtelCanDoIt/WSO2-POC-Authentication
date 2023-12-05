# Build working folder
mkdir ./is-src
cd ./is-src


# Get project for REST Authnetication Connector
git clone git@github.com:wso2-extensions/identity-oauth2-grant-rest.git

# Build project
#TODO

# Grab supporting jars / scripts
mkdir -p ./identity-oauth2-grant-rest/artifacts
cd ./identity-oauth2-grant-rest/artifacts
wget https://product-dist.wso2.com/downloads/is-connectors/1.0.0/RESTAuthenticationConnector/artifacts.zip
unzip ./*.zip

# Copy jar files to our project


