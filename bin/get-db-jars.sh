#!/bin/bash

# Function to create a working folder
create_working_folder() {
    mkdir ../db-src
}

# Function to copy and expand needed files
copy_and_expand() {
    local current_pwd=$(pwd)
    cp ../wso2-config/db/mysql-connector-j-8.2.0.zip ../db-src
    cd ../db-src
    
    # Extract the jar file we need
    unzip mysql-connector-j-8.2.0.zip
    check_exit_status
    cd "$current_pwd"
    cp ../db-src/mysql-connector-j-8.2.0/mysql-connector-j-8.2.0.jar ../db
    
    # Be a good neighbor and clean up
    rm -fR ../db-src
}

# Function to check the exit status of the previous command
check_exit_status() {
    if [ $? -ne 0 ]; then
        echo "Error occurred in unzipping DB support JARs. Exiting."
        exit 1
    fi
}


# Main script execution
create_working_folder
copy_and_expand

