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
                    ${env.PYTHON_HOME}\\pip.exe install robotframework robotframework-selenium_
