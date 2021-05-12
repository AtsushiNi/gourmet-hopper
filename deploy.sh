#!/bin/bash

cd /c/Users/Kensyuu/git/java-training

./gradlew war

cp build/libs/java-training*.war /c/Users/Kensyuu/Documents/payara5/glassfish/domains/domain1/autodeploy

asadmin restart-domain

echo http://localhost:8080/java-training-1.0/login.jsp
