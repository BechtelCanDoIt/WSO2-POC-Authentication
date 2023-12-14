#!/bin/bash
HOME_DIR="/home/wso2carbon"
PRODUCT="wso2is-5.11.0"
POC_DIR="$HOME_DIR/$PRODUCT/poc"
REPOS_DIR="$HOME_DIR/$PRODUCT/repository"
CONF_DIR="$REPOS_DIR/conf"

# Move original deployment.toml, if it exists
if [ -f "$CONF_DIR/deployment.toml" ]; then
    mv "$CONF_DIR/deployment.toml" "$CONF_DIR/deployment.toml.orig"
fi

### Copy items from poc folder to where they need to live in the server
cp "$POC_DIR/deployment.toml" "$CONF_DIR"
cp "$POC_DIR/rest-auth.properties" "$CONF_DIR"

cp "$POC_DIR/org.wso2.carbon.extension.identity.emailotp.common-4.0.6.jar" "$REPOS_DIR/components/dropins"
cp "$POC_DIR/org.wso2.carbon.extension.identity.smsotp.common-3.0.15.jar" "$REPOS_DIR/components/dropins"
cp "$POC_DIR/org.wso2.carbon.identity.oauth2.grant.rest.core-1.0.0.jar" "$REPOS_DIR/components/dropins"
cp "$POC_DIR/identity.oauth2.grant.auth.rest.handler-1.0.0.jar" "$REPOS_DIR/components/lib"
cp "$POC_DIR/api#identity#authn#v1.war" "$REPOS_DIR/deployment/server/webapps"
cp "$POC_DIR/SMSPublisher.xml" "$REPOS_DIR/deployment/server/eventpublishers"

rm "$REPOS_DIR/components/dropins/mysql-connector*.jar"
cp "$POC_DIR/mysql-connector-j-8.2.0.jar" "$REPOS_DIR/components/lib"

### Add notification configs to IS
# Add notification configs to IS, check if the directory exists
if [ -d "$CONF_DIR/sms" ]; then
    echo "<configuration type=\"sendOTP\" display=\"sendOTP\" locale=\"en_US\">" >> "$CONF_DIR/sms/sms-templates-admin-config.xml"
    echo "    <body>Your One Time Password is : {{confirmation-code}}</body>" >> "$CONF_DIR/sms/sms-templates-admin-config.xml"
    echo "</configuration>" >> "$CONF_DIR/sms/sms-templates-admin-config.xml"
else 
    echo "No $CONF_DIR/sms directory"
    exit 1
fi

### Now startup WSO2 server
"$HOME_DIR/docker-entrypoint.sh"
