FROM tomcat:9.0-jdk11
COPY /home/ubuntu/docker_node/workspace/dockerwithJenkins/target/maven-web-application.war /usr/local/tomcat/webapps/maven-web-application.war

## COPY target/maven-web-application.war /usr/local/tomcat/webapps/maven-web-application.war
