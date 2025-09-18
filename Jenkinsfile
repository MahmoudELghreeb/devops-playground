pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                echo 'Building the project...'
                sh 'echo "Build successful at $(date)"'
            }
        }
        stage('Test') {
            steps {
                echo 'Testing the project...'
                sh 'echo "All tests passed!"'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying the project...'
                sh 'echo "Deployed to server at $(date)"'
            }
        }
    }
}
