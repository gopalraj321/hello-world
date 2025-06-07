pipeline {
    agent any

    stages {
        stage('Clone Repo') {
            steps {
                git branch: 'main', url: 'https://github.com/gopalraj321/hello-world.git'
            }
        }

        stage('Verify Files') {
            steps {
                script {
                    if (!fileExists('index.html')) {
                        error 'index.html is missing!'
                    }
                    if (!fileExists('images')) {
                        error 'images folder is missing!'
                    }
                }
            }
        }

        stage('Deploy to Nginx (Windows)') {
            steps {
                bat '''
                copy /Y index.html C:\\nginx\\html\\
                xcopy /E /I /Y images C:\\nginx\\html\\images\\
                '''
            }
        }
    }

    post {
        success {
            echo '✅ Website successfully deployed to Nginx on Windows!'
        }
        failure {
            echo '❌ Build or deployment failed. Check logs.'
        }
    }
}
