pipeline {
  agent { label 'workstation' }

   options {
     ansiColor('xterm')
   }

  stages {

    stage('Release') {
      when {
        expression { env.TAG_NAME ==~ ".*" }
      }
      steps{
        sh 'docker build -t 492681564023.dkr.ecr.us-east-1.amazonaws.com/expense_parameter_init_container:${TAG_NAME} .'
        sh 'aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 492681564023.dkr.ecr.us-east-1.amazonaws.com'
        sh 'docker push 492681564023.dkr.ecr.us-east-1.amazonaws.com/expense_parameter_init_container:${TAG_NAME}'
      }
    }

  }
}
