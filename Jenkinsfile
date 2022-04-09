pipeline{
    agent any
    tools {
     maven 'MAVEN'
    }

     stages{
         
         stage('CHECKOUT SCM CODE'){
             steps{
                git 'https://github.com/SOFTWARESOLUTONS-PVT-LIMITED/maven-web-application.git' 
             }
         }
    
    
    stage('BUILD PACKAGE'){
        steps{
            sh "mvn clean package"
        }
    }
    
    stage('DOCKER BUILD'){
        steps{
            sh "docker build -t newjen-image ."
        }
    }
    
    stage('DOCKER LOGIN AND PUSH'){
        steps{
            withCredentials([string(credentialsId: 'DOCKER', variable: 'DOCKER')]) {
            sh " docker login -u ashokganidocker -p ${DOCKER} "
         }
          sh "docker tag newjen-image  ashokganidocker/newjen-image:latest "
          sh "docker push ashokganidocker/newjen-image:latest"
        }
    }
    
    stage('SEND EMAIL NOTIFICATION'){
        steps{
            mail bcc: 'sappoguashokrock6629@gmail.com,sappoguashok462@gmail.com', body: '''REGARDS,
            NAME- MR.S.ASHOKKUMAR,
            PROJECT-MAVEN PROJECT,
            ROLE-DEVOPSENGINEER,
          ''', cc: 'rhopnbbkeccgwihz', from: '', replyTo: '', subject: 'THIS CI-CD PIPELINE IS OVER', to: 'sappoguashok462@gmail.com'
        }
    }
    
    stage('SEND EMAIL TEXT'){
        steps{
            emailext body: 'THIS MAVEN BASED PROJECT IS OVER', recipientProviders: [requestor()], subject: 'BUILD IS OVER', to: 'sappoguashok462@gmail.com'
        }
    }
    
    
     
  
         
     }//stagesclosed   

    
}//pipelineclosed
