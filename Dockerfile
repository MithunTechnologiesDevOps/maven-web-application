FROM tomcat:9.0-jdk11
MAINTAINER MithunTechnologies
COPY target/maven-web-application.war /usr/local/tomcat/webapps/maven-web-application
EXPOSE 8080
