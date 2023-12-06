#!/bin/bash

# Function to print current directory
print_start_pwd() {
    local current_pwd=$(pwd)
    echo "Start Folder: $current_pwd"
}

# Function for check_prereqs
check_prereqs(){
    echo "Checking pre-prereqs..."
    ./check-prereqs.sh
    if [ $? -ne 0 ]; then
        echo "Error with Pre-Reqs: Exiting."
        exit 1
    fi
}

# Function for cleanup
cleanup() {
    echo "Starting cleanup..."
    # ../bin/stop.sh - TODO: Uncomment when needed
    rm -Rf ../am
    rm -Rf ../is
    rm -Rf ../db
    rm -Rf ../is-src
}

# Function to setup folders
setup_folders() {
    echo "Setting up folders..."
    # Setup for API-M
    mkdir -p ../am/repository/deployment/server
    mkdir -p ../am/repository/conf

    # Setup for IS
    mkdir -p ../is/repository/deployment/server
    mkdir -p ../is/repository/conf
    mkdir -p ../is/repository/components/dropins

    # Setup for the database
    mkdir -p ../db/scripts
    mkdir -p ../db/mysql_data
}

# Function to handle Docker processes
docker_setup() {
    echo "Setting up Docker..."
    docker login docker.wso2.com
    if [ $? -ne 0 ]; then
        echo "Error logging into docker.wso2.com. Exiting."
        exit 1
    fi

    cp ../wso2-config/am/docker-compose.yml ../am/
    # cp ../wso2-config/am/deployment.toml ../am/repository/conf
    cp ../wso2-config/is/docker-compose.yml ../is/
    # cp ../wso2-config/is/deployment.toml ../is/repository/conf
    cp ../wso2-config/db/docker-compose.yml ../db/
    # cp ../wso2-config/db/initial_script.sql ../db/scripts
}

# Function to get JAR files
get_jars() {
    echo "Getting JAR files..."
    ./get-is-jars.sh
}

# Function to start WSO2 servers
start_servers() {
    echo "Starting servers..."
    start_am_server
    start_is_server
    # TODO: Uncomment the following line when the script is debugged completely
    # start_node_server
}

# Function to start API-M
start_am_server(){
    cd ../am
    docker-compose up -d
    if [ $? -ne 0 ]; then
        echo "API-M didn't start correctly. Exiting."
        exit 1
    fi
    cd ..
}

# Function to start Identity Server
start_is_server(){
    echo "DEBUG: IS server is commented out..."
    # TODO: uncomment below when needed
    # cd ../is
    # docker-compose up -d
    # if [ $? -ne 0 ]; then
    #     echo "Identity Server didn't start correctly. Exiting."
    #     exit 1
    # fi
    # cd ..
}

# Function to start Node server
start_node_server() {
    echo "Starting Node server..."
    cd ../web/wso2-auth-demo
    npm start &
}

# Main script execution
print_start_pwd
check_prereqs
cleanup
setup_folders
get_jars
docker_setup
start_servers


echo "Script execution completed."
exit 1
