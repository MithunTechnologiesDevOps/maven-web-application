node {
    def mavenHome = tool name:"maven1"

echo "Jenkins url is: ${env.JENKINS_URL}"
echo "Node Name is: ${env.NODE_NAME}"
echo "Job Name is: ${env.JOB_NAME}"

    stage ('checkoutcode')
    {
       git branch: 'development', url: 'https://github.com/hari1244/maven-web-application.git' 
    }
    stage('build')
    {
     sh "${mavenHome}/bin/mvn clean package"
    }
}
