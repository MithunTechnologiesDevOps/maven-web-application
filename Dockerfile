FROM tomcat:8.0.20-jre8
COPY target/maven-we-application*.war /usr/local/tomcat/webapps/maven-web-application.war