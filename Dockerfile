
FROM centos:7
WORKDIR /opt/maven
RUN yum install zip unzip -y && yum install git java-1.8.0-openjdk -y
RUN yum install maven -y
COPY ./ ./
