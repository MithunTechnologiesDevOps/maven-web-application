

node {
    
    echo "Job name is  ${env.JOB_NAME}"
    echo "Build number is   ${env.BUILD_NUMBER}"
    echo "Node Name is   ${env.NODE_NAME}"

  echo "Jenkins Home  is   ${env.JENKINS_HOME}"
def mavenHome  =  tool  name:'maven3.9.8'
stage('checkout'){
    git branch: 'development', credentialsId: '4b74e873-3c70-4791-a3aa-5c6f091a11c7', url: 'https://github.com/happylucki/maven-web-application.git'
}
stage('Build'){
     sh "${mavenHome}/bin/mvn clean package"
}

stage('tomcatupload'){
  sshagent(['b5a4b5ac-abbd-4766-afdc-d257e1ecd6db']) {
    // some block
     sh "scp -o StrictHostKeyChecking=no target/maven-web-application.war ec2-user@172.31.0.243:/opt/apache-tomcat-9.0.98/webapps/"
}  

    
} // end stage deploy

}
