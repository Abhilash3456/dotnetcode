pipeline {
    agent any
    environment {
        PATH = "$PATH:C:/Program Files/Maven/apache-maven-3.8.6/apache-maven-3.8.6/bin"
    }

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
                bat 'echo %PATH%'
                bat 'dotnet restore C:/Users/Administrator/AppData/Local/Jenkins/.jenkins/workspace/pipelinemsbuild/ConsoleApp/ConsoleApp.sln'
                bat 'dotnet build --configuration Release C:/Users/Administrator/AppData/Local/Jenkins/.jenkins/workspace/pipelinemsbuild/ConsoleApp/ConsoleApp.sln'
                bat 'dotnet publish C:/Users/Administrator/AppData/Local/Jenkins/.jenkins/workspace/pipelinemsbuild/ConsoleApp/ConsoleApp.sln'
            }
        }
        stage ('check version') {
            steps {
                bat 'java -version'
                bat 'mvn -version'
            }
        }
        stage ('scan') {
            steps {
                withSonarQubeEnv(installationName: 'sonarqube-9.5') {
                    bat 'mvn clean org.sonarsource.scanner.maven:sonar-maven-plugin:3.9.1.2184:sonar'
                }
            }
        }    
    }
}
