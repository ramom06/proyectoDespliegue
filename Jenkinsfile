pipeline {
    agent any
    tools {
        maven 'maven'    }

    stages {
        // git
        stage('Paso 1: Git Checkout') {
            steps {
                checkout scm
            }
        }

        // Compila proyecto
        stage('Paso 2: Compilar') {
            steps {
                sh 'mvn clean compile'
            }
        }

        // Test
        stage('Paso 3: Test') {
            steps {
                sh 'mvn test'
            }
        }

        // WAR
                stage('Paso 4: Desplegar') {
                    steps {
                        // Generamos el archivo .war
                        sh 'mvn package -DskipTests'
                        sh 'cp target/*.war /var/jenkins_home/tomcat-deploy/'
                    }
                }
    }
}