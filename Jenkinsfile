pipeline {
    agent any

    environment {
        ROBOT_REPORT_DIR = "Testcases"
    }

    stages {
        stage('Checkout') {
            steps {
                git credentialsId: 'github-creds', url: 'https://github.com/Resmi86/Robotframework.git', branch: 'main'
            }
        }

        stage('Install Robot Framework') {
            steps {
                sh '''
                python -m pip install --upgrade pip
                pip install robotframework
                '''
            }
        }

        stage('Run Robot Tests') {
            steps {
                dir("${ROBOT_REPORT_DIR}") {
                    sh '''
                    robot --output ../output.xml --log ../log.html --report ../report.html login.robot
                    '''
                }
            }
        }

        stage('Archive Reports') {
            steps {
                archiveArtifacts artifacts: '*.html', fingerprint: true
                robot outputPath: '.', outputFileName: 'output.xml'
            }
        }
    }

    post {
        always {
            junit allowEmptyResults: true, testResults: '**/output.xml'
        }
        success {
            echo '✅ Tests Passed'
        }
        failure {
            echo '❌ Tests Failed'
        }
    }
}
