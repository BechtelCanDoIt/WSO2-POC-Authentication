#!/bin/bash
mv ../repository/conf/deployment.toml ../repository/conf/deployment.toml.orig

### Copy items from poc folder to where they need to live in the server
cp ./deployment.toml ../repository/conf
cp ./rest-auth.properties ../repository/conf

cp ./org.wso2.carbon.extension.identity.emailotp.common-4.0.6.jar ../repository/components/dropins
cp ./org.wso2.carbon.extension.identity.smsotp.common-3.0.15.jar ../repository/components/dropins
cp ./org.wso2.carbon.identity.oauth2.grant.rest.core-1.0.0.jar ../repository/components/dropins
cp ./identity.oauth2.grant.auth.rest.handler-1.0.0.jar ../repository/components/libs

cp ./api#identity#authn#v1.war ../repository/deployment/server/webapps

cp ./SMSPublisher.xml ../repository/deployment/server/eventpublishers

### Add notification configs to IS
echo "" >> ../repository/conf/sms/sms-templates-admin-config.xml
echo "<configuration type="sendOTP" display="sendOTP" locale="en_US">" >> ../repository/conf/sms/sms-templates-admin-config.xml
echo "    <body>Your One Time Password is : {{confirmation-code}}</body>" >> ../repository/conf/sms/sms-templates-admin-config.xml
echo "</configuration>" >> ../repository/conf/sms/sms-templates-admin-config.xml

### Per Directions: Restart server - to pick up configuration changes 
../bin/wso2server.sh restart
