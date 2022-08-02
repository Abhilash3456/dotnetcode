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
                bat 'dotnet tool install --global dotnet-sonarscanner'
                bat 'dotnet sonarscanner begin /k:"scanofdotnet" /d:sonar.host.url="http://35.90.138.131:9000"  /d:sonar.login="sqp_0e70ff613172f0d2ac73dacd6bcebec5f61b4894"'
                bat 'dotnet build'
                bat 'dotnet sonarscanner end /d:sonar.login="sqp_0e70ff613172f0d2ac73dacd6bcebec5f61b4894"'
            }
        }
        stage ('scan') {
            steps {
                withSonarQubeEnv(credentialsId: 'sonarinjenks', installationName: 'sonarqube-9.5') {
                    bat 'mvn org.sonarsource.scanner.maven:sonar-maven-plugin:3.9.1.2184:sonar'
                }
            }
        }    
    }
}
