pipeline {
    agent any

    parameters {
        string(name: 'DEPLOY_ENV', defaultValue: 'staging', description: 'Target environment (staging/prod)')
    }

    environment {
        PROJECT_NAME = 'DevOps Playground'
        DOCKER_HUB_USERNAME = 'mahmoudelghreeb'
        IMAGE_NAME = "${DOCKER_HUB_USERNAME}/devops-playground"
        IMAGE_TAG = "${params.DEPLOY_ENV}-${BUILD_NUMBER}"
    }

    stages {
        stage('Build') {
            steps {
                echo "Building ${env.PROJECT_NAME} for environment: ${params.DEPLOY_ENV}..."
                sh "echo \"Build successful for ${env.PROJECT_NAME} in ${env.DEPLOY_ENV} at \$(date)\""
            }
        }
        stage('Test') {
            steps {
                echo "Testing ${env.PROJECT_NAME}..."
                sh "echo \"All tests passed for ${env.PROJECT_NAME}!\""
            }
        }
        stage('Build Docker Image') {
            steps {
                echo "Building Docker image: ${env.IMAGE_NAME}:${env.IMAGE_TAG}"
                sh "docker build -t ${env.IMAGE_NAME}:${env.IMAGE_TAG} ."
                sh "docker images | grep ${env.IMAGE_NAME}"
            }
        }
        stage('Login to Docker Hub') {
            steps {
                echo "Logging in to Docker Hub..."
                withCredentials([usernamePassword(credentialsId: 'dockerhub-creds', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                    sh 'echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin'
                }
            }
        }
        stage('Push Docker Image') {
            steps {
                echo "Pushing Docker image: ${env.IMAGE_NAME}:${env.IMAGE_TAG} to Docker Hub..."
                sh "docker push ${env.IMAGE_NAME}:${env.IMAGE_TAG}"
            }
        }
        stage('Deploy') {
            when {
                expression { params.DEPLOY_ENV == 'prod' }
            }
            steps {
                echo "🚀 Deploying ${env.PROJECT_NAME} to PRODUCTION..."
                sh "echo \"🔥 PRODUCTION DEPLOYMENT: Image ${env.IMAGE_NAME}:${env.IMAGE_TAG} deployed to production server\""
            }
        }
    }

    post {
        success {
            echo "✅ Pipeline completed successfully!"
            sh "echo \"🎉 SUCCESS: ${env.PROJECT_NAME} deployed to ${env.DEPLOY_ENV}\""
        }
        failure {
            echo "❌ Pipeline failed!"
            sh "echo \"🚨 FAILURE: Something went wrong in ${env.PROJECT_NAME}\""
        }
        always {
            echo "📌 Pipeline finished at ${new Date()}"
        }
    }
}
