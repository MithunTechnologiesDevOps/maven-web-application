    node
	{
	def Mavenhome = tool name: "maven 3.8.4"
	
	stage('Get the code from git hub repository')
	{
	git branch: 'development', credentialsId: 'a84f4bb9-d3c8-490e-8d01-cdec00d7e92d', url: 'https://github.com/Indrasekhar365/maven-web-application.git'
	}
	stage('Apache maven - do the unit test cases and build the packages')
	{
	sh "${Mavenhome}/bin/mvn clean package"
	}
	stage('sonarQube Stage')
	{
	sh "${Mavenhome}/bin/mvn clean sonar:sonar"
	}
	stage('nexus stage')
	{
	sh "${Mavenhome}/bin/mvn clean deploy"
	}
	stage('Tomacat server')
	{
	sshagent(['c2911812-243e-4ba1-9588-ea01b41e20ec']) {
     	sh "scp -o StrictHostKeyChecking=no target/maven-web-application.war ec2-user@15.207.116.63:/opt/apache-tomcat-9.0.56/webapps/"
	 
	 // if you not specified StrictHostKeyChecking=no you will get error as "script returned exit code 1" & "Host key verification failed."
	}
	}
	stage('send notifiactions'){
	emailext body: 'buid over ', subject: 'Build over', to: 'devopssmtpcheck@gmail.com'
	}
	}
