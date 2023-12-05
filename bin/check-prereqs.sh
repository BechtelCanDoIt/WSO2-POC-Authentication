#!/bin/bash

# SECTION: identity-oauth2-grant-rest
# Define the directory path
dir_path="../wso2-config/is-src/identity-oauth2-grant-rest"

# Check for org.wso2.carbon.identity.oauth2.grant.rest.core-1.0.0.jar
if [ -f "$dir_path/org.wso2.carbon.identity.oauth2.grant.rest.core-1.0.0.jar" ]; then
    :  # Do nothing, file exists
else
    echo "$dir_path/org.wso2.carbon.identity.oauth2.grant.rest.core-1.0.0.jar does not exist. Please see README.md"
    exit 1
fi

# Check for artifacts.zip
if [ -f "$dir_path/artifacts.zip" ]; then
    :  # Do nothing, file exists
else
    echo "$dir_path/artifacts.zip does not exist. Please see README.md"
    exit 1
fi

