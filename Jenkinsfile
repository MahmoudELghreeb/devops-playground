pipeline {
    agent any

    parameters {
        string(name: 'DEPLOY_ENV', defaultValue: 'staging', description: 'Target environment (staging/prod)')
    }

    environment {
        PROJECT_NAME = 'DevOps Playground'
        DEPLOY_SERVER = 'server-01'
    }

    stages {
        stage('Build') {
            steps {
                echo "Building ${env.PROJECT_NAME} for environment: ${params.DEPLOY_ENV}..."
                sh 'echo "Build successful for ${PROJECT_NAME} in ${DEPLOY_ENV} at $(date)"'
            }
        }
        stage('Test') {
            steps {
                echo "Testing ${env.PROJECT_NAME}..."
                sh 'echo "All tests passed for ${PROJECT_NAME}!"'
            }
        }
        stage('Deploy') {
            when {
                expression { params.DEPLOY_ENV == 'prod' }
            }
            steps {
                echo "🚀 Deploying ${env.PROJECT_NAME} to PRODUCTION on ${env.DEPLOY_SERVER}..."
                sh 'echo "🔥 PRODUCTION DEPLOYMENT: Deployed to ${DEPLOY_SERVER} at $(date)"'
            }
        }
    }

    post {
        success {
            echo "✅ Pipeline completed successfully!"
            sh 'echo "🎉 SUCCESS: ${PROJECT_NAME} deployed to ${DEPLOY_ENV}"'
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
