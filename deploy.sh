#!/bin/bash

cd ${HOME}/git/java-training

./gradlew war

cp build/libs/java-training*.war ${HOME}/Documents/payara5/glassfish/domains/domain1/autodeploy

#asadmin restart-domain

sleep 2

start http://localhost:8080/java-training-1.0/login.jsp