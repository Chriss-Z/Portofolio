pipeline {
  agent any

  stages {
    stage('Clone from GitHub') {
      steps {
        git url: 'git@github.com:Chriss-Z/Portofolio.git', branch: 'main'
      }
    }

    stage('Build Docker Image') {
      steps {
        sh 'docker build -t portofolio-image .'
      }
    }

    stage('Run Docker Container') {
      steps {
        sh '''
          docker stop portfolio-app || true
          docker rm portfolio-app || true
          docker run -d --name portfolio-app -p 8081:80 portofolio-image
        '''
      }
    }
  }
}

