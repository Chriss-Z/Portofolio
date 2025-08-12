pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git url: 'https://github.com/Chriss-Z/Portofolio.git', branch: 'main', credentialsId: 'github-https'
            }
        }

        stage('Deploy with Docker Compose') {
            steps {
                // Stop & remove container sebelumnya
                sh 'docker-compose down || true'

                // Build ulang image & jalankan container
                sh 'docker-compose up -d --build --no-cache'
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
