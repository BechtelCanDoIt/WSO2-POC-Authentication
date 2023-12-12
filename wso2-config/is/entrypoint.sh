#!/bin/bash
# docker dev
#    volumes:
#      - ./poc:/home/wso2is-5.11.0/poc
#    entrypoint: /home/wso2is-5.11.0/poc/entrypoint.sh

mv ../repository/conf/deployment.toml ../repository/conf/deployment.toml.orig
cp ./deployment.toml ../repository/conf

cp ./poc/org.wso2.carbon.extension.identity.emailotp.common-4.0.6.jar ../repository/components/dropins
cp ./poc/org.wso2.carbon.extension.identity.smsotp.common-3.0.15.jar ../repository/components/dropins
cp ./poc/org.wso2.carbon.identity.oauth2.grant.rest.core-1.0.0.jar ../repository/components/dropins
cp ./poc/identity.oauth2.grant.auth.rest.handler-1.0.0.jar ../repository/components/libs

