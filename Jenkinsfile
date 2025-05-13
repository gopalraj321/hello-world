pipeline {
    agent any

    stages {
        stage('Clone') {
            steps {
                git 'https://github.com/gopalraj321/hello-world.git'
            }
        }

        stage('Build') {
            steps {
                echo 'Preparing site files...'
            }
        }

        stage('Test') {
            steps {
                echo 'Validating index.html and image files...'
                sh '''
                test -f index.html || { echo "index.html missing!"; exit 1; }
                test -d images || echo "Warning: 'images' folder not found."
                '''
            }
        }

        stage('Deploy') {
            steps {
                echo 'Deploying to GitHub Pages...'
                sh '''
                git config --global user.email "ci-bot@example.co"
                git config --global user.name "ci-bot"
                git checkout -b gh-pages
                git add .
                git commit -m "Deploy from Jenkins"
                git push --force https://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@github.com/your-username/your-repo.git gh-pages
                '''
            }
        }
    }
}
