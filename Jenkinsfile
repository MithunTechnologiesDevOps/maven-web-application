pipeline{
agent any
tools{
    maven'maven'
}
stages{
  stage('git checkout'){
    steps{
         git 'https://github.com/Sudheer445/maven-web-application.git'
    }
    }
    stage('sonar'){
    steps{
         sh 'mvn sonar:sonar'
    }
    }
       stage('build war'){
    steps{
         sh 'mvn clean package'
    }
    }
    stage('publish war'){
    steps{
         sh 'mvn deploy'
    }
    }
    stage('deploy to tomcat'){
    steps{
        sshagent(['tomcat-jen']) {
            
             sh 'scp -o StrictHostKeyChecking=no target/*.war ec2-user@18.212.166.49:/opt/apache-tomcat-9.0.56/webapps/'
             

}
    }
    }
}
}
