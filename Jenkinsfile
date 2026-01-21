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
            // 1. Empaquetamos el proyecto
            sh 'mvn package -DskipTests'
            
            // 2. Copiamos el archivo (usando un comodín * por si cambia la versión)
            sh 'cp target/*.war /var/jenkins_home/tomcat-deploy/CalculadoraWeb.war'
            
            // 3. ¡IMPORTANTE! Listamos el destino para ver en el log de Jenkins si está ahí
            sh 'ls -lh /var/jenkins_home/tomcat-deploy/'
        }
    }
}
    }
}