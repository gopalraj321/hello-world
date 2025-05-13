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

        stage('Deploy to Nginx') {
            steps {
                script {
                    // Ensure Jenkins has sudo rights for these commands without password
                    sh 'sudo cp -f index.html /var/www/html/'
                    sh 'sudo cp -r images /var/www/html/'
                    sh 'sudo systemctl restart nginx'
                }
            }
        }
    }

    post {
        success {
            echo '✅ Website successfully deployed to Nginx!'
        }
        failure {
            echo '❌ Build or deployment failed. Check logs.'
        }
    }
}
