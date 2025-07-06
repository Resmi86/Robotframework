pipeline {
    agent any

    environment {
        // Append virtualenv Scripts to PATH for robot/chromedriver/etc.
        PATH = "${env.PATH};C:\\Users\\Deepesh\\.virtualenvs\\Robot1\\Scripts;C:\\Windows\\System32"
    }

    stages {
        stage('Install Robot Framework') {
            steps {
                bat '''
                    C:\\Users\\Deepesh\\.virtualenvs\\Robot1\\Scripts\\python.exe -m pip install --upgrade pip
                    C:\\Users\\Deepesh\\.virtualenvs\\Robot1\\Scripts\\pip.exe install robotframework
                    C:\\Users\\Deepesh\\.virtualenvs\\Robot1\\Scripts\\pip.exe install robotframework-seleniumlibrary
                '''
            }
        }

        stage('Run Robot Tests') {
            steps {
                bat '''
                    cd Testcases
                    C:\\Users\\Deepesh\\.virtualenvs\\Robot1\\Scripts\\robot.exe --output ../output.xml --log ../log.html --report ../report.html login.robot
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
