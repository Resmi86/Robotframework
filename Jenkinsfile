pipeline {
    agent any

    environment {
        PYTHON_HOME = 'C:\\Users\\Deepesh\\.virtualenvs\\Robot1\\Scripts'
        PATH = "${env.PATH};${PYTHON_HOME}"
    }

    stages {
        stage('Install Robot Framework & SeleniumLibrary') {
            steps {
                bat "${env.PYTHON_HOME}\\python.exe -m pip install --upgrade pip"
                bat "${env.PYTHON_HOME}\\pip.exe install robotframework"
                bat "${env.PYTHON_HOME}\\pip.exe install robotframework-seleniumlibrary"
            }
        }

        stage('Run Robot Tests') {
            steps {
                bat '''
                    cd Testcases
                    ${PYTHON_HOME}\\robot.exe --output ../output.xml --log ../log.html --report ../report.html login.robot
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
