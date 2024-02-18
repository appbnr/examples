#!/bin/bash

# Parameters

PRJ_MODULE_NAME="hello-world"
PKG_NAME="hello-world@appbnr"
PKG_VERSION="0.0.1"
REL_PATH="hello-world"


# Script common for all packages.

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
cd $DIR/../

ng build --base-href /$REL_PATH/

rm -rf ./tmp/build
mkdir -p ./tmp/build

cp -r ./dist/$PRJ_MODULE_NAME/browser ./tmp/build/app
cp $DIR/package.yml ./tmp/build/.
cp ./src/assets/logo-blue.png ./tmp/build/icon-for-light.png
cp ./src/assets/logo-blue.png ./tmp/build/icon-for-dark.png

cd ./tmp/build
zip -rq $PKG_NAME-$PKG_VERSION.zip .