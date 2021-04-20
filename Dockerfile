FROM payara/server-full
COPY ./build/libs/java-training-1.0.war $DEPLOY_DIR
COPY --chown=payara:payara mysql-connector-java-8.0.23.jar /opt/payara/appserver/glassfish/domains/domain1/lib/mysql-connector-java-8.0.23.jar
USER payara
