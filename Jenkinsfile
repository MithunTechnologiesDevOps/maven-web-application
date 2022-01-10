node 
{
def mavenHome = tool name: "maven3.8.4" 
    
stage('checkoutcode')
{
git branch: 'development', credentialsId: '8fb9f2d6-99da-43b8-ac88-973f6c5d2df1', url: 'https://github.com/gayu-ess-app/maven-web-application.git'
}
stage('Build'){
sh "${mavenHome}/bin/mvn clean package" 
}
stage("Excecutesonarcubereport")
{
sh "${mavenHome}/bin/mvn clean sonar:sonar"
}
stage("uploadartifactsintonexusreport")
{
sh "${mavenHome}/bin/mvn clean deploy"
}
stage("deploytomcatapp")
sshagent(['40bf914b-0332-4b57-980f-828a6e3ac99c']) {
    sh "scp -o StrictHostKeyChecking=no target/maven-web-application.war ec2-user@15.206.94.147:/opt/apache-tomcat-9.0.56/webapps/"
}
}

