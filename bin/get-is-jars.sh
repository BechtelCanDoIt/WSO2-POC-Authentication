#!/bin/bash

# Function to create a working folder
create_working_folder() {
    mkdir -p ../is-src/identity-oauth2-grant-rest
}

# Function to copy and expand needed files
copy_and_expand() {
    local current_pwd=$(pwd)
    cp ../wso2-config/is-src/identity-oauth2-grant-rest/artifacts.zip ../is-src/identity-oauth2-grant-rest
    cd ../is-src/identity-oauth2-grant-rest
    unzip artifacts.zip
    cd "$current_pwd"
    cp ../wso2-config/is-src/identity-oauth2-grant-rest/org.wso2.carbon.identity.oauth2.grant.rest.core-1.0.0.jar ../is-src/identity-oauth2-grant-rest
}

# Function to check the exit status of the previous command
check_exit_status() {
    if [ $? -ne 0 ]; then
        echo "Error occurred in unzipping IS support JARs. Exiting."
        exit 1
    fi
}

# Function to copy jar files to the project
copy_jars_to_project() {
    cp ../is-src/identity-oauth2-grant-rest/artifacts/org.wso2.carbon.extension.identity.emailotp.common-4.0.6.jar ../is/repository/components/dropins
    cp ../is-src/identity-oauth2-grant-rest/artifacts/org.wso2.carbon.extension.identity.smsotp.common-3.0.15.jar ../is/repository/components/dropins
    cp ../is-src/identity-oauth2-grant-rest/artifacts/identity.oauth2.grant.auth.rest.handler-1.0.0.jar ../is/repository/components/dropins
    cp ../is-src/identity-oauth2-grant-rest/org.wso2.carbon.identity.oauth2.grant.rest.core-1.0.0.jar ../is/repository/components/dropins
}

# Main script execution
create_working_folder
copy_and_expand
check_exit_status
copy_jars_to_project
