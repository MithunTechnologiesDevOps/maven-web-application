node{
    properties([buildDiscarder(logRotator(artifactDaysToKeepStr: '', artifactNumToKeepStr: '5', daysToKeepStr: '', numToKeepStr: '5')), [$class: 'JobLocalConfiguration', changeReasonComment: ''], pipelineTriggers([pollSCM('* * * * *')])])
    def mavenHome = tool name: "Maven3.6.2"
    
    stage('checkOutCode'){
        git branch: 'development', credentialsId: '27f800d6-0dce-460f-8a74-7226e787be5e', url: 'https://github.com/vignesh130597/maven-web-application.git'
    }
    
    stage('buildPackage'){
        sh "${mavenHome}/bin/mvn clean package"
    }
    
 /*   stage('executeSonarQube'){
        sh "${mavenHome}/bin/mvn clean sonar:sonar"
    }
    
    stage('storePackagestoNexus'){
        sh "${mavenHome}/bin/mvn deploy"
    }*/
    
    stage('deploytoTomcat'){
        sshagent(['d3e4fc7d-83b9-4f4b-bb73-6fad24f4c4ba']) {
            sh "scp -o StrictHostKeyChecking=no /var/lib/jenkins/workspace/maven-pipeline/target/maven-web-application.war ec2-user@65.0.45.71:/opt/apache-tomcat-9.0.53/webapps"
            
}
    }
    
}
