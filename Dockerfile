FROM tomcat:latest 
WORKDIR /usr/local/tomcat
COPY target/warfile /usr/local/tomcat/webapps/warfile 
EXPOSE 8080

