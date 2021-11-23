FROM tomcat:8.0.20-jre8

RUN mkdir -p /opt/app
ENV PROJECT_HOME /opt/app


# Dummy text to test 
COPY target/maven-web-java-application.war /usr/local/tomcat/webapps/target/maven-web-java-application.war

WORKDIR $PROJECT_HOME

CMD ["java" ,"-jar","./maven-web-java-application.war"]
