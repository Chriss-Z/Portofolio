pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git url: 'https://github.com/Chriss-Z/Portofolio.git', branch: 'main', credentialsId: 'github-https'
            }
        }

        stage('Clean Old Containers & Images') {
            steps {
                // Stop & remove container + volumes
                sh 'docker-compose down -v || true'

                // Remove old image if exists
                sh '''
                    IMAGE_NAME=$(docker images -q portfolio-app)
                    if [ ! -z "$IMAGE_NAME" ]; then
                        docker rmi -f $IMAGE_NAME || true
                    fi
                '''
            }
        }

        stage('Rebuild & Deploy') {
            steps {
                // Build ulang tanpa cache
                sh 'docker-compose build --no-cache'

                // Jalankan container baru
                sh 'docker-compose up -d'
            }
        }
    }

    post {
        success {
            echo '🚀 Build dan deploy berhasil (Full Clean Build)!'
        }
        failure {
            echo '❌ Build atau deploy gagal. Cek logs di Jenkins.'
        }
    }
}
