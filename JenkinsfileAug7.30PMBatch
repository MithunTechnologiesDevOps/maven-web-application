node{

def mavenHome = tool name: "maven3.9.4"

properties([buildDiscarder(logRotator(artifactDaysToKeepStr: '', artifactNumToKeepStr: '5', daysToKeepStr: '', numToKeepStr: '5')), [$class: 'JobLocalConfiguration', changeReasonComment: ''], pipelineTriggers([pollSCM('* * * * * ')])])


    
stage('CheckOutCode'){
git branch: 'development', credentialsId: '2d5109d1-9d45-4ef3-a140-95970e07934a', url: 'https://github.com/MithunTechnologiesDevOps/maven-web-application.git'
}

stage('Build'){

sh "${mavenHome}/bin/mvn clean package"
}

/*
stage('ExecuteSonarQubeReport'){
sh "${mavenHome}/bin/mvn clean  sonar:sonar"
}

stage('UploadArtifcatsIntoNexus'){
sh "${mavenHome}/bin/mvn clean deploy"
}

stage('DeployAppIntoTomcatServer'){
sshagent(['81b2df6e-2466-495a-9a7c-7e26ebcae8c5']) {
    sh "scp -o StrictHostKeyChecking=no target/maven-web-application.war ec2-user@172.31.2.249:/opt/apache-tomcat-9.0.80/webapps/"
}
}
*/

}//node closing
