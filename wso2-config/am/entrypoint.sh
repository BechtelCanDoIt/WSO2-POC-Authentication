#!/bin/bash
BASE_DIR="/home/wso2am-4.0.0/"
POC_DIR="$BASE_DIR/poc"
mv "$BASE_DIR/repository/conf/deployment.toml" "$BASE_DIR/repository/conf/deployment.toml.orig"
cp "$POC_DIR/deployment.toml" "$BASE_DIR/repository/conf"