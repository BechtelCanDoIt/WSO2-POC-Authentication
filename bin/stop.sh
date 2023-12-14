CURRENT_PWD=`pwd`
echo "Stop PWD: $CURRENT_PWD"

#../is/wso2is-5.11.0/bin/wso2server.sh stop

#Bring down NPM
cd ../web/wso2-auth-demo
npm stop
cd ../../

# Bring down API-M
cd ./am
docker-compose down -v  --remove-orphans
#docker volume rm $(docker volume ls -q)
cd ..

# Bring down Identity Server
cd ./is
docker-compose down -v  --remove-orphans
#docker volume rm $(docker volume ls -q)
cd ..

cd ./db
docker-compose down -v --remove-orphans
#docker volume rm $(docker volume ls -q)
cd ..
