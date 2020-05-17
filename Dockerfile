FROM tomcat:jdk14-openjdk-oracle
# deploy the war file to deployment server
COPY target/*.war /usr/local/tomcat/mywebapp.war
