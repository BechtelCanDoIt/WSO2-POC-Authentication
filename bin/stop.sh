#./is/wso2is-5.11.0/bin/wso2server.sh stop

#Bring down NPM
cd ./web/wso2-auth-demo
npm stop
cd ../..

# Bring down API-M
cd ./am
docker-compose down
cd ..

# Bring down Identity Server
cd ./is
docker-compose down
cd ..

cd ./db
docker-compose down
cd ..
