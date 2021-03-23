#!/bin/bash

cp bin/* /usr/local/bin

rm -R /usr/local/lib/oc-deploy
mkdir -p /usr/local/lib/oc-deploy
cp -R lib/* /usr/local/lib/oc-deploy

chmod 755 /usr/local/bin/oc-deploy
chmod 755 /usr/local/bin/oc-mk-deploy-conf