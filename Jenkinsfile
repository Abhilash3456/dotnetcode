pipeline {
    agent any

    stages {
        stage ('Clean workspace') {
            steps {
                cleanWs()
            }
        }
        stage ('Git Checkout') {
            steps {
                git branch: 'master', url: 'https://github.com/Abhilash3456/dotnetcode.git'
            }
        }
        stage ('msbuild') {
            steps {
                sh 'dotnet restore dotnetcode/ConsoleApp/ConsoleApp.sln'
            }
        }
    }
}
