node
{
    def Maven_Home=tool name: "Maven 3.8.4"

    stage('GitcodePulling')
    {

        git branch: 'development', credentialsId: 'b6ad39ae-c41d-41f8-823e-2149f1eb123d', url: 'https://github.com/Gurron-Technologies/maven-web-application.git'

    }
    
    stage('build')
    {
        sh "${Maven_Home}/bin/mvn clean package"
    }
    
    stage('Execute SonarQube Report')
    {
        sh "${Maven_Home}/bin/mvn sonar:sonar"
    }

    stage('nexus artifacts')
    {
        sh "${Maven_Home}/bin/mvn deploy"
    }
    
    stage('Deploy into Tomact')
    {
        sshagent(['a207f31f-38e0-4f16-80e8-d2440a5558a2']) 
        {
    
          sh "scp -o StrictHostKeyChecking=no target/maven-web-application.war ec2-user@3.88.133.114:/opt/tomcat9/webapps" 
        }
    }
    stage('Send Mail')
    {
        emailext body: '''You can check your build status.

    Thanks & Regards
    Satish.''', subject: 'Bulid Status', to: 'cybersatish12@gmail.com'
    }


}
