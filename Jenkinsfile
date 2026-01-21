pipeline {
    agent any
    tools {
        maven 'Maven'
    }

    stages {
        stage('Paso 1: Git Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Paso 2: Compilar') {
            steps {
                // Entramos en la carpeta donde está el pom.xml
                dir('CalculadoraWeb/CalculadoraWeb') {
                    sh 'mvn clean compile'
                }
            }
        }

        stage('Paso 3: Test') {
            steps {
                // También necesitamos entrar aquí para los tests
                dir('CalculadoraWeb/CalculadoraWeb') {
                    sh 'mvn test'
                }
            }
        }

        stage('Paso 4: Desplegar') {
            steps {
                dir('CalculadoraWeb/CalculadoraWeb') {
                    // Generamos el archivo .war
                    sh 'mvn package -DskipTests'
                    // Copiamos el archivo generado a la carpeta de Tomcat
                    sh 'cp target/*.war /var/jenkins_home/tomcat-deploy/'
                }
            }
        }
    }
}