node
{

def mavenHome = tool name: "Maven3.6.3"

stage('CheckoutCode')
{
git branch: 'development', credentialsId: '96736e78-a520-4c31-bcc3-f076a0bfa070', url: 'https://github.com/vamsi0410/maven-web-application.git'
}

stage('Build')
{
sh "${mavenHome}/bin/mvn clean package"
}

stage('ExecuteSonarQubeReport')
{
sh "${mavenHome}/bin/mvn sonar:sonar"
}

stage('UploadArtifactIntoNexus')
{
sh "${mavenHome}/bin/mvn deploy"
}

stage('DeployAppIntoTomcatServer')
{
sshagent(['b3ab8da5-e1f4-4e13-948a-4ec948bf43a5'])
{
    sh "scp -o StrictHostKeyChecking=no target/maven-web-application.war ec2-user@54.254.45.207:/opt/apache-tomcat-9.0.39/webapps/"
}
}

}
