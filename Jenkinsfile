pipeline {
    agent any

    environment {
        PYTHON_ENV = 'C:\\Users\\Deepesh\\.virtualenvs\\Robot1\\Scripts'
        PATH = "${env.PATH};${PYTHON_ENV};C:\\Windows\\System32"
    }

    stages {
        stage('Fix CMD') {
            steps {
                bat 'cmd /c echo ✅ CMD now works!'
            }
        }

        stage('Install Robot Framework & SeleniumLibrary') {
            steps {
                bat "${env.PYTHON_ENV}\\python.exe -m pip install --upgrade pip"
                bat "${env.PYTHON_ENV}\\pip.exe install robotframework"
                bat "${env.PYTHON_ENV}\\pip.exe install robotframework-seleniumlibrary"
            }
        }

        stage('Run Robot Tests') {
            steps {
                dir('Testcases') {
                    bat """
                    ${env.PYTHON_ENV}\\robot.exe ^
                    --output ../output.xml ^
                    --log ../log.html ^
                    --report ../report.html ^
                    login.robot
                    """
                }
            }
        }

        stage('Archive Reports') {
            when {
                expression { currentBuild.result == null || currentBuild.result == 'SUCCESS' }
            }
            steps {
                archiveArtifacts artifacts: '*.html', allowEmptyArchive: true
            }
        }
    }

    post {
        success {
            echo '✅ Pipeline completed successfully.'
        }
        failure {
            echo '❌ Tests Failed'
        }
    }
}
