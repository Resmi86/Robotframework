pipeline {
    agent any

    environment {
        PYTHON_ENV = 'C:\\Users\\Deepesh\\.virtualenvs\\Robot1\\Scripts'
        CHROMEDRIVER_PATH = 'C:\\Users\\Deepesh\\.virtualenvs\\Robot1\\Scripts'
        PATH = "${env.PATH};${PYTHON_ENV};${CHROMEDRIVER_PATH}"
    }

    stages {
        stage('Install Robot Framework & SeleniumLibrary') {
            steps {
                bat '"%PYTHON_ENV%\\python.exe" -m pip install --upgrade pip'
                bat '"%PYTHON_ENV%\\pip.exe" install robotframework'
                bat '"%PYTHON_ENV%\\pip.exe" install robotframework-seleniumlibrary'
            }
        }

        stage('Run Robot Tests') {
            steps {
                bat '''
                    cd Testcases
                    "%PYTHON_ENV%\\robot.exe" --output ../output.xml --log ../log.html --report ../report.html login.robot
                '''
            }
        }

        stage('Archive Reports') {
            when {
                expression { currentBuild.result == null || currentBuild.result == 'SUCCESS' }
            }
            steps {
                junit '**/output.xml'
                archiveArtifacts artifacts: '**/*.html', allowEmptyArchive: true
            }
        }
    }

    post {
        always {
            echo "❌ Tests Failed"
        }
    }
}
