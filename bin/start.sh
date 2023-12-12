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
    ./stop.sh
    rm -Rf ../am
    rm -Rf ../is
    rm -Rf ../db
    rm -Rf ../is-src
}

# Function to setup folders
setup_folders() {
    echo "Setting up folders..."
    # Setup for API-M
    mkdir -p ../am/poc

    # Setup for IS
    mkdir -p ../is/poc

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

    # Setup network so that wso2 can talk to the database
    docker network create wso2-network

    # AM
    cp ../wso2-config/am/docker-compose.yml ../am/
    cp ../wso2-config/am/entrypoint.sh ../am/poc
    chmod a+x ../am/poc/entrypoint.sh
    cp ../wso2-config/am/deployment.toml ../am/poc

    # IS
    cp ../wso2-config/is/docker-compose.yml ../is/
    cp ../wso2-config/is/entrypoint.sh ../is/poc
    chmod a+x ../is/poc/entrypoint.sh
    cp ../wso2-config/is/deployment.toml ../is/poc
    cp ../is-src/identity-oauth2-grant-rest/artifacts/api#identity#authn#v1.war ../is/poc
    cp ../is-src/identity-oauth2-grant-rest/artifacts/rest-auth.properties ../is/poc
    cp ../wso2-config/is/SMSPublisher.xml ../is/poc
    
    # DB
    cp ../wso2-config/db/docker-compose.yml ../db/
    cp ../wso2-config/db/initial_script.sql ../db/scripts
    chmod a+r ../am/poc/entrypoint.sh
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
    #start_node_server
}

# Function to start DB
start_db_server(){
    echo "Start DB Server"
    bin_dir=$(pwd)  # Capture the current directory
    echo "Current directory: $(pwd)"

    # Provides default WSO2 tables and POC users for POC
    if [ ! -f "../wso2-config/db/initial_script.sql" ]; then
        echo "DB: initial_script.sql not found!"
        exit 1
    fi
    cp ../wso2-config/db/initial_script.sql ../db/scripts
    
    # Bring in identity-oauth2-grant-rest dependencies 
    echo "" >> ../db/scripts/initial_script.sql
    # Add project db mod scriptinto initial_script.sql
    cat ../is-src/identity-oauth2-grant-rest/artifacts/dbscripts/mysql.sql >> ../db/scripts/initial_script.sql
    echo "commit;" >> ../db/scripts/initial_script.sql

    # Change to the db directory and start the server
    cd ../db
    docker-compose pull
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
    # Get latest security fixes
    docker-compose pull
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
    # Get latest security fixes
    docker-compose pull
    docker-compose up -d
    if [ $? -ne 0 ]; then
        echo "Identity Server didn't start correctly. Exiting."
        exit 1
    fi
    # pickup entrypoint configs - directions say IS needs to be restarted due to config changes
    docker-compose restart wso2is

    cd "$bin_dir"  # Return to the original directory
}

# Function to start Node server
start_node_server() {
    echo "Start Node Server"
    bin_dir=$(pwd)  # Capture the current directory

    cd ../web/wso2-auth-demo

     # Ensure dependencies are installed
    if [ ! -d "node_modules" ]; then
        echo "Installing Node.js dependencies..."
        npm install
        if [ $? -ne 0 ]; then
            echo "Error installing Node.js dependencies. Exiting."
            exit 1
        fi
    fi

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
