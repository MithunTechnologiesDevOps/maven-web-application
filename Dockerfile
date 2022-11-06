FROM maven:3.8.6-openjdk-18 as team
WORKDIR /app
COPY . .
RUN mvn clean package 

FROM tomcat:8.0.20-jre8
ARG branchname=test-team
LABEL branchname=${branchname}
COPY --from=team /app/target/java-web-app*.war /usr/local/tomcat/webapps/java-web-app.war

FROM jenkins:2.60.2-alpine
RUN systemctl enable jenkins
RUN systemctl restart jenkins
