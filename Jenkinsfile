node {
def mavenHome = tool name: "Maven 3.8.5"
properties([buildDiscarder(logRotator(artifactDaysToKeepStr: '', artifactNumToKeepStr: '5', daysToKeepStr: '', numToKeepStr: '5')), [$class: 'JobLocalConfiguration', changeReasonComment: ''], pipelineTriggers([cron('* * * * *')])])
    echo "Branch name is: ${env.BUILD_NUMBER}"
    echo "Branch name is: ${env.BUILD_DISPLAY_NAME}"
    echo "Branch name is: ${env.JOB_NAME}"
    stage ('CheckoutCode') {
        git branch: 'development', credentialsId: 'd43640b0-f4a2-4e1b-a011-4e90de1f9e73', url: 'https://github.com/Github-practice-june/maven-web-application.git'
    }
    stage ('Build') {
        sh "${mavenHome}/bin/mvn clean package"
    }
    stage ('SonarQubeReport') {
        sh "${mavenHome}/bin/mvn sonar:sonar"
    }
    stage ('nexusRepository') {
        sh "${mavenHome}/bin/mvn deploy"
    }
    stage ('deployToTomcat') {
      sshagent(['d89efccd-008e-4084-843b-7ff4f80f5dc5']) {
      sh "scp -o StrictHostKeyChecking=no target/maven-web-application.war ec2-user@172.31.10.34:/opt/apache-tomcat-9.0.64/webapps"
    }
    }
    
}
