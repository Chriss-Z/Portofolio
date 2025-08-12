pipeline {
  agent any

  stages {
    stage('Checkout') {
      steps {
        git url: 'https://github.com/Chriss-Z/Portofolio.git', branch: 'main', credentialsId: 'github-https'
      }
    }

    stage('Build Docker Image') {
      steps {
        sh 'docker build -t portofolio-myapp-web .'
      }
    }

    stage('Deploy with Docker Compose') {
      steps {
        sh 'docker-compose down || true'
        sh 'docker-compose up -d --build'
      }
    }
  }

  post {
    success {
      echo 'Build dan deploy berhasil!'
    }
    failure {
      echo 'Build atau deploy gagal. Cek logs di Jenkins.'
    }
  }
}

