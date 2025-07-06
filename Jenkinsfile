pipeline {
    agent any

    environment {
        // Add Python venv Scripts (includes robot, pip, chromedriver) and System32
        PATH = "${env.PATH};C:\\Users\\Deepesh\\.virtualenvs\\Robot1\\Scripts;C:\\Windows\\System32"
    }

    stages {
        stage('Install Robot Framework') {
            steps {
                bat '''
                    python -m pip install --upgrade pip
                    pip install robotframework
                    pip install robotframework-seleniumlibrary
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
                archiveArtifacts artifacts: 'log.html,report.html', fingerprint: true
                robot outputPath: '.', outputFileName: 'output.xml'
            }
        }
    }

    post {
        always {
            junit allowEmptyResults: true, testResults: 'output.xml'
        }
        success {
            echo '✅ Tests Passed'
        }
        failure {
            echo '❌ Tests Failed'
        }
    }
}
