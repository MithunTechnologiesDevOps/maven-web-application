FROM tomcat:latest
COPY target/maven-web-application*.war /usr/local/tomcat/webapps/maven-web-application.war
