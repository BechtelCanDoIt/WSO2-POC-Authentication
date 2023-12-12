#!/bin/bash
POC_DIR="/home/wso2is-5.11.0/poc"
REPOS_DIR="/home/wso2is-5.11.0/repository"
CONF_DIR="$REPOS_DIR/conf"

# Move original deployment.toml, if it exists
if [ -f "$CONF_DIR/deployment.toml" ]; then
    mv "$CONF_DIR/deployment.toml" "$CONF_DIR/deployment.toml.orig"
fi
mv "$CONF_DIR/deployment.toml" mv "$CONF_DIR/deployment.toml.orig"

### Copy items from poc folder to where they need to live in the server
cp "$POC_DIR/deployment.toml" "$CONF_DIR/"
cp "$POC_DIR/rest-auth.properties" "$CONF_DIR/"

cp "$POC_DIR/org.wso2.carbon.extension.identity.emailotp.common-4.0.6.jar" "$REPOS_DIR/components/dropins"
cp "$POC_DIR/org.wso2.carbon.extension.identity.smsotp.common-3.0.15.jar" "$REPOS_DIR/components/dropins"
cp "$POC_DIR/org.wso2.carbon.identity.oauth2.grant.rest.core-1.0.0.jar" "$REPOS_DIR/components/dropins"
cp "$POC_DIR/identity.oauth2.grant.auth.rest.handler-1.0.0.jar" "$REPOS_DIR/components/libs"

cp "$POC_DIR/api#identity#authn#v1.war" "$REPOS_DIR/deployment/server/webapps"

cp "$POC_DIR/SMSPublisher.xml" "$REPOS_DIR/deployment/server/eventpublishers"

### Add notification configs to IS
# Add notification configs to IS, check if the directory exists
if [ -d "$CONF_DIR/sms" ]; then
    echo "<configuration type=\"sendOTP\" display=\"sendOTP\" locale=\"en_US\">" >> "$CONF_DIR/sms/sms-templates-admin-config.xml"
    echo "    <body>Your One Time Password is : {{confirmation-code}}</body>" >> "$CONF_DIR/sms/sms-templates-admin-config.xml"
    echo "</configuration>" >> "$CONF_DIR/sms/sms-templates-admin-config.xml"
fi

### Per Directions: Restart server - to pick up configuration changes 
/home/wso2is-5.11.0/bin/wso2server.sh restart
