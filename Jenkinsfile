node() {

def MavenHome = tool name:"mvn3.9.5"

stage('checkoutode') 
{
git branch: 'development', credentialsId: 'githubcred', url: 'https://github.com/adreddys5/maven-web-application.git'
}
stage('build')
{
sh "$MavenHome/bin/mvn clean package"
}
stage('sonar')
{
sh "$MavenHome/bin/mvn sonar:sonar"
}
stage('deploy')
{
sh "$MavenHome/bin/mvn deploy"
}
stage('deploy container')
{
sshagent(['66ee914c-2cc2-42de-830f-ea03a9d1bfdb']) 
{
sh "scp -o StrictHostKeyChecking=no target/maven-web-application.war ec2-user@13.201.69.23:/opt/apache-tomcat-9.0.87/webapps/"
}
}
}
