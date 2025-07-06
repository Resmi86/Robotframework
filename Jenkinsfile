pipeline {
    agent any

    environment {
        PATH = "${env.PATH};C:\\Windows\\System32;C:\\Users\\Deepesh\\AppData\\Local\\Programs\\Python\\Python39\\Scripts"
    }

    stages {
        stage('Install Robot Framework') {
            steps {
                bat '''
                    python -m pip install --upgrade pip
                    C:\\Users\\Deepesh\\AppData\\Local\\Programs\\Python\\Python39\\Scripts\\pip.exe install robotframework
                '''
            }
        }

        stage('Run Robot Tests') {
            steps {
                bat '''
                    cd Testcases
                    C:\\Users\\Deepesh\\AppData\\Local\\Programs\\Python\\Python39\\Scripts\\robot.exe --output ../output.xml --log ../log.html --report ../report.html login.robot
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
