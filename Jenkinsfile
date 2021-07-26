node {
    def mavenHome = tool name: "maven 3.8.1"
   
    stage('CheckoutCode'){
        git branch: 'development', credentialsId: '7384c577-2cb7-4f86-9d5d-d2277fca8efd', url: 'https://github.com/ravitejabadabagni/maven-web-application.git'
    }
    
    
         stage('Build'){
                    sh "${mavenHome}/bin/mvn clean package"
                     }


    
            stage('ExecuteSonarQubeReport'){
           sh "${mavenHome}/bin/mvn sonar:sonar"
                     }

               stage('UploadArtifactIntoNexus'){
              sh "${mavenHome}/bin/mvn deploy"
                    }

stage('DeployIntoTomcat'){
     sshagent(['8776029d-fd34-4d53-8d3d-223ab8b2c196']) {
    sh "scp -o StrictHostKeyChecking=no target/maven-web-application.war ec2-user@3.210.202.95:/opt/apache-tomcat-9.0.50/webapps/"
    
}
}
stage('EmailNotification'){
    emailext body: 'Scripted Way ', subject: 'Scripted Way', to: 'ravitejab8@gmail.com'
}





}
