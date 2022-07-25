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
                bit 'dotnet restore src/NopCommerce.sln'
                bit 'dotnet build --configuration Release src/NopCommerce.sln'
                bit 'dotnet publish src/NopCommerce.sln'
            }
        }
    }
}
