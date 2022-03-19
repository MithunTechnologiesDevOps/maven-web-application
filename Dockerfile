FROM tomcat:latest 
WORKDIR /usr/local/tomcat
COPY target/maven-web-application.war /usr/local/tomcat/webapps/maven-web-application.war
EXPOSE 8080

