# Section: identity-oauth2-grant-rest
# Build working folder
mkdir -p ../is-src/identity-oauth2-grant-rest

# Get needed files
local current_pwd=$(pwd)
cp ../wso2-config/is-src/identity-oauth2-grant-rest/artifacts.zip ../is-src/identity-oauth2-grant-rest
cd ../is-src/identity-oauth2-grant-rest
unzip ../is-src/identity-oauth2-grant-rest/artifacts.zip
cd $current_pwd
cp ../wso2-config/is-src/identity-oauth2-grant-rest/org.wso2.carbon.identity.oauth2.grant.rest.core-1.0.0.jar ../is-src/identity-oauth2-grant-rest

# Check the exit status of the previous command
if [ $? -ne 0 ]; then
    echo "Error occurred in unzipping IS support JARs. Exiting."
    exit 1
fi

# Copy jar files to our project
cp ../is-src/identity-oauth2-grant-rest/artifcts/org.wso2.carbon.extension.identity.emailotp.common-4.0.6.jar ../is/repository/components/dropins
cp ../is-src/identity-oauth2-grant-rest/artifcts/org.wso2.carbon.extension.identity.smsotp.common-3.0.15.jar ../is/repository/components/dropins
cp ../is-src/identity-oauth2-grant-rest/artifcts/identity.oauth2.grant.auth.rest.handler-1.0.0.jar ../is/repository/components/dropins
cp ../is-src/identity-oauth2-grant-rest/org.wso2.carbon.identity.oauth2.grant.rest.core-1.0.0.jar ../is/repository/components/dropins
