pipeline {
    agent any

    environment {
        CMD_PATH = "C:\\Windows\\System32"
        PYTHON_HOME = "C:\\Users\\Deepesh\\.virtualenvs\\Robot1\\Scripts"
        PATH = "${env.PATH};${CMD_PATH};${PYTHON_HOME}"
    }

    stages {
        stage('Install Robot Framework & SeleniumLibrary') {
            steps {
                bat """
                    ${PYTHON_HOME}\\python.exe -m pip install --upgrade pip
                    ${PYTHON_HOME}\\pip.exe install robotframework
                    ${PYTHON_HOME}\\pip.exe install robotframework-seleniumlibrary
                """
            }
        }

        stage('Run Robot Tests') {
            steps {
                bat """
                    cd Testcases
                    ${PYTHON_HOME}\\robot.exe --output ../output.xml --log ../log.html --report ../report.html login.robot
                """
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
