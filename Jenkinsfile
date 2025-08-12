pipeline {
    agent any

    environment {
        DOCKER_COMPOSE_FILE = 'docker-compose.yml'
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/Chriss-Z/Portofolio.git', credentialsId: 'github-https'
            }
        }

        stage('Deploy with Docker Compose') {
            steps {
                script {
                    // Stop container lama kalau ada
                    sh 'docker-compose down || true'
                    
                    // Build ulang image tanpa cache
                    sh 'docker-compose build --no-cache'
                    
                    // Jalankan container
                    sh 'docker-compose up -d'
                }
            }
        }
    }

    post {
        success {
            echo 'Deploy berhasil 🚀'
        }
        failure {
            echo 'Build atau deploy gagal. Cek logs di Jenkins.'
        }
    }
}

