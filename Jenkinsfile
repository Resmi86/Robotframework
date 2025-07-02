pipeline {
    agent any

    stages {
        stage('Install Robot Framework') {
            steps {
                bat '''
                python -m pip install --upgrade pip
                pip install robotframework
                '''
            }
        }

        stage('Run Robot Tests') {
            steps {
                bat '''
                cd Testcases
                robot --output ../output.xml --log ../log.html --report ../report.html login.robot
                '''
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
