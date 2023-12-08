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
    mkdir -p ../am/repository/deployment/server/executionplans
    mkdir -p ../am/repository/conf

    # Setup for IS
    mkdir -p ../is/repository/deployment/server
    mkdir -p ../is/repository/deployment/server/executionplans
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
    cp ../wso2-config/db/initial_script.sql ../db/scripts

    #TODO: Add project db mod scriptinto initial_script.sql

    docker network create wso2-network
}

# Function to get JAR files
get_jars() {
    echo "Getting JAR files..."
    ./get-is-jars.sh
}

# Function to start WSO2 servers
start_servers() {
    echo "Starting servers..."
    start_db_server
    start_am_server
    start_is_server
    start_node_server
}

# Function to start DB
start_db_server(){
    echo "Start DB Server"
    bin_dir=$(pwd)  # Capture the current directory

    # Change to the db directory and start the server
    cd ../db
    docker-compose up -d
    if [ $? -ne 0 ]; then
        echo "DB didn't start correctly. Exiting."
        exit 1
    fi

    # Return to the original directory
    cd "$bin_dir"
}


# Function to start API-M
start_am_server(){
    echo "Start AM Server"
    bin_dir=$(pwd)  # Capture the current directory

    cd ../am
    docker-compose up -d
    if [ $? -ne 0 ]; then
        echo "API-M didn't start correctly. Exiting."
        exit 1
    fi

    cd "$bin_dir"  # Return to the original directory
}

# Function to start Identity Server
start_is_server(){
    echo "Start IS Server"
    bin_dir=$(pwd)  # Capture the current directory

    cd ../is
    docker-compose up -d
    if [ $? -ne 0 ]; then
        echo "Identity Server didn't start correctly. Exiting."
        exit 1
    fi

    cd "$bin_dir"  # Return to the original directory
}

# Function to start Node server
start_node_server() {
    echo "Start Node Server"
    bin_dir=$(pwd)  # Capture the current directory

    cd ../web/wso2-auth-demo
    npm start &
    if [ $? -ne 0 ]; then
        echo "NPM didn't start correctly. Exiting."
        exit 1
    fi

    cd "$bin_dir"  # Return to the original directory
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
