pipeline {
    agent any

    environment {
        // Add System32 explicitly to ensure cmd.exe is found
        PATH = "${env.PATH};C:\\Windows\\System32"
    }

    stages {
        stage('Fix CMD') {
            steps {
                bat 'cmd /c echo ✅ CMD now works!'
            }
        }

        stage('Install Robot Framework & SeleniumLibrary') {
            steps {
                bat 'C:\\Users\\Deepesh\\.virtualenvs\\Robot1\\Scripts\\python.exe -m pip install --upgrade pip'
                bat 'C:\\Users\\Deepesh\\.virtualenvs\\Robot1\\Scripts\\pip.exe install robotframework'
                bat 'C:\\Users\\Deepesh\\.virtualenvs\\Robot1\\Scripts\\pip.exe install robotframework-seleniumlibrary'
            }
        }

        stage('Run Robot Tests') {
            steps {
                bat '''
                    cd Testcases
                    C:\\Users\\Deepesh\\.virtualenvs\\Robot1\\Scripts\\robot.exe ^
                    --output ../output.xml --log ../log.html --report ../report.html login.robot
                '''
            }
        }

        stage('Archive Reports') {
            steps {
                junit 'output.xml'
            }
        }
    }

    post {
        always {
            echo '✅ Pipeline completed.'
        }
        failure {
            echo '❌ Tests Failed'
        }
    }
}
