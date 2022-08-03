pipeline {
    agent any
    environment {
        MSBUILD_SQ_SCANNER_HOME = tool name: 'scanmsbuild5.7', type: 'hudson.plugins.sonar.MsBuildSQRunnerInstallation'
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
                withSonarQubeEnv(credentialsId: 'sonarinjenks', installationName: 'sonarqube-9.5') {
                    bat 'dotnet sonarscanner begin /k:"firstscan" /d:sonar.host.url="http://35.90.138.131:9000"  /d:sonar.login="sqp_d8e2e5b82e4bb4e99e67b17b19d835b35fbb59ea"'
                }
            }
        }    
    }
}
