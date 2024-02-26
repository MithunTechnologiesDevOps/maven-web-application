node{


echo "Jenkins Home dir is: ${env.JENKINS_HOME}"
echo "Job name is: ${env.JOB_NAME}"
echo "Build number is: ${env.BUILD_NUMBER}"

//properties([buildDiscarder(logRotator(artifactDaysToKeepStr: '', artifactNumToKeepStr: '5', daysToKeepStr: '', numToKeepStr: '5')), [$class: 'RebuildSettings', autoRebuild: false, rebuildDisabled: false], [$class: 'JobLocalConfiguration', changeReasonComment: ''], pipelineTriggers([pollSCM('* * * * *')])])

    def mavenHome = tool name: "Maven3.9.6"
    
    stage('checkoutcode') {
        git branch: 'development', credentialsId: 'cb270671-197d-4b42-b94f-b539d8da7bf4', url: 'https://github.com/Shivareddy443/maven-web-application.git'
    }
    
    stage('build') {
        sh "${mavenHome}/bin/mvn clean package"
    }
    
    stage('executesonarqubereport') {
        sh "${mavenHome}/bin/mvn sonar:sonar"
    }

    stage('uploadartifactIntoNexus') {
        sh "${mavenHome}/bin/mvn deploy"
    }

    stage('DeployAppIntoTomcat') {
        sshagent(['4b91ac8e-d928-4fd4-a77d-3d387b68012c']) {
            sh "scp -o StrictHostKeyChecking=no target/maven-web-application.war ec2-user@35.182.244.44://opt/apache-tomcat-9.0.85/webapps"
        }
    }
    
}

