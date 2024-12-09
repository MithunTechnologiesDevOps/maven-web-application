node {
echo "The Job name is :${env.JOB_NAME}"
echo "The Node name is:${env.NODE_NAME}"
echo "The build number is:${env.BUILD_NUMBER}"
 


def mavenHome = tool name:'maven3.9.7'
stage('CheckOutCode'){
git branch: 'development', credentialsId: 'githubcred', url: 'https://github.com/Sandhya-byte-prog/maven-web-application.git'
}

stage('Build'){
    sh "${mavenHome}/bin/mvn clean package"
}
stage('ExecuteSonarqubeReport'){
    sh "${mavenHome}/bin/mvn clean sonar:sonar"
stage ('UploadArtifactsIntoNexus'){
    sh "${mavenHome}/bin/mvn clean deploy"
    
}
stage('DeployAppIntoTomcatServer'){
    sshagent(['fb80df6a-a134-40d1-8358-db46f7a744f4']) {
sh "scp -o StrictHostKeyChecking=no target/maven-web-application.war ec2-user@172.31.0.126:/opt/tomcat9/webapps"

    
}


}
}
}


