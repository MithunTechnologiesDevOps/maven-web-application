FROM tomcat:8.0.20-jre8
COPY target/maven-web-application*.war /usr/local/tomcat/webapps/maven-web-application.war

RUN echo "suman"



RUN echo "march7"
