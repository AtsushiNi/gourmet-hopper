#!/bin/bash

cd /projects/java-training
gradle war
cp build/libs/java-training*.war /opt/payara5/glassfish/domains/domain1/autodeploy