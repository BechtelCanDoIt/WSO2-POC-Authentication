#!/bin/bash
HOME_DIR="/home/wso2carbon"
PRODUCT="wso2am-4.0.0"
POC_DIR="$HOME_DIR/$PRODUCT/poc"
REPOS_DIR="$HOME_DIR/$PRODUCT/repository"

mv "$REPOS_DIR/conf/deployment.toml" "$REPOS_DIR/conf/deployment.toml.orig"
cp "$POC_DIR/deployment.toml" "$REPOS_DIR/conf"

### Now startup WSO2 server
"$HOME_DIR/docker-entrypoint.sh"