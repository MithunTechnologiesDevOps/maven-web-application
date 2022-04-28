node{

echo "Job Name is:  ${env.JOB_NAME}"
echo "Node name is:  ${env.NODE_NAME}"


def mavenHome = tool name: 'maven3.8.5'

//Get the code from GithUb Repo
stage('CheckoutCode'){
git branch: 'development', credentialsId: '2a72fc75-0e3b-4f0f-a5e9-66f563ac58ec', url: 'https://github.com/MithunTechnologiesDevOps/maven-web-application.git'
}
//Do the build by using Maven Build tool
stage('Build'){
sh "${mavenHome}/bin/mvn clean package"
}
/*
//Execute the SonarQube Report
stage('ExecuteSonarQubeReport'){
sh "${mavenHome}/bin/mvn sonar:sonar"
}

//Upload Artifacts into Artifactory Repo
stage('UploadArtifactsintoNexus'){
sh "${mavenHome}/bin/mvn deploy"
}

//Deploy Application into Tomcat Server
stage('DeployApplicationIntoTomcatServer'){
sshagent(['38c6d484-28b7-47fd-9099-ec2ecc2311b7']) {
   sh "scp -o StrictHostKeyChecking=no target/maven-web-application.war ec2-user@13.235.74.33:/opt/apache-tomcat-9.0.62/webapps/"
}

}
*/
   
}
