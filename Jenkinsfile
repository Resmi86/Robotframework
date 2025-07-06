



pipeline {
    agent any

    environment {
        PYTHON_HOME = "C:\\Users\\Deepesh\\.virtualenvs\\Robot1\\Scripts"
        PATH = "${env.PATH};${PYTHON_HOME}"
    }

    stages {
        stage('Install Robot Framework & SeleniumLibrary') {
            steps {
                bat """
                    ${env.PYTHON_HOME}\\python.exe -m pip install --upgrade pip
                    ${env.PYTHON_HOME}\\pip.exe install robotframework robotframework-seleniumlibrary
                """
            }
        }

        stage('Run Robot Tests') {
            steps {
                bat """
                    cd Testcases
                    ${env.PYTHON_HOME}\\robot.exe --output ../output.xml --log ../log.html --report ../report.html login.robot
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
