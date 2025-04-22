#FROM tomcat:8.0.20-jre8

# Dummy text to test 
#COPY target/maven-web-java-application.war /usr/local/tomcat/webapps/target/maven-web-java-application.war

FROM ubuntu

RUN apt-get update
CMD [“echo”,”Image created”]

