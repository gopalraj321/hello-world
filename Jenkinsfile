pipeline {
    agent any

    stages {
        stage('Clone') {
            steps {
                git branch: 'main', url: 'https://github.com/gopalraj321/hello-world.git'
            }
        }

        stage('Verify File') {
            steps {
                script {
                    if (fileExists('index.html')) {
                        echo 'index.html found!'
                    } else {
                        error 'index.html is missing!'
                    }
                }
            }
        }

        stage('Build') {
            steps {
                echo 'Build stage skipped for static HTML.'
            }
        }

        stage('Archive Artifact') {
            steps {
                archiveArtifacts artifacts: 'index.html', onlyIfSuccessful: true
                echo 'index.html archived for later use.'
            }
        }

        stage('Deploy') {
            steps {
                echo 'You can add deployment logic here.'
                // Example: sh 'cp index.html /var/www/html/'
            }
        }
    }
}
