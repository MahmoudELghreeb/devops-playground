pipeline {
    agent any

    parameters {
        string(name: 'DEPLOY_ENV', defaultValue: 'staging', description: 'Target environment (staging/prod)')
    }

    environment {
        PROJECT_NAME = 'DevOps Playground'
        DOCKER_IMAGE_NAME = 'mahmoudelghreeb/devops-playground'
        DOCKER_IMAGE_TAG = 'latest'
    }

    stages {
        stage('Build') {
            steps {
                echo "Building ${env.PROJECT_NAME} for environment: ${params.DEPLOY_ENV}..."
                sh 'echo "Build successful for ${PROJECT_NAME} in ${env.DEPLOY_ENV} at $(date)"'
            }
        }
        stage('Test') {
            steps {
                echo "Testing ${env.PROJECT_NAME}..."
                sh 'echo "All tests passed for ${PROJECT_NAME}!"'
            }
        }
        stage('Build Docker Image') {
            steps {
                echo "Building Docker image: ${env.DOCKER_IMAGE_NAME}:${env.DOCKER_IMAGE_TAG}"
                sh 'docker build -t ${DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_TAG} .'
                sh 'docker images | grep ${DOCKER_IMAGE_NAME}'
            }
        }
        stage('Deploy') {
            when {
                expression { params.DEPLOY_ENV == 'prod' }
            }
            steps {
                echo "🚀 Deploying ${env.PROJECT_NAME} to PRODUCTION..."
                sh 'echo "🔥 PRODUCTION DEPLOYMENT: Image ${DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_TAG} ready for deployment"'
            }
        }
    }

    post {
        success {
            echo "✅ Pipeline completed successfully!"
            sh 'echo "🎉 SUCCESS: ${PROJECT_NAME} deployed to ${env.DEPLOY_ENV}"'
        }
        failure {
            echo "❌ Pipeline failed!"
            sh 'echo "🚨 FAILURE: Something went wrong in ${PROJECT_NAME}"'
        }
        always {
            echo "📌 Pipeline finished at ${new Date()}"
        }
    }
}
