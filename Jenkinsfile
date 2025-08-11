pipeline {
  agent any

  stages {
    stage('Clone from GitHub') {
      steps {
        git branch: 'main',
            url: 'https://github.com/Chriss-Z/Portofolio.git',
            credentialsId: 'github-https' // ini ID credential yg kamu buat di Jenkins
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

