nohup ./is/wso2is-5.11.0/bin/wso2server.sh start  &
sleep 30
cd ./web/wso2-auth-demo
npm start
cd ../..

