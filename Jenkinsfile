pipeline {
    agent any
    tools {
        maven 'maven'
    }
    stages {
        stage('Paso 1: Git Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Paso 2: Pruebas Unitarias') {
            steps {
                dir('CalculadoraWeb') {
                    echo 'Ejecutando pruebas con Maven...'
                    // Al NO usar -DskipTests, Maven buscará y ejecutará los tests
                    sh 'mvn test'
                }
            }
        }

        stage('Paso 3: Generar WAR') {
            steps {
                dir('CalculadoraWeb') {
                    echo 'Generando archivo WAR...'
                    // Aquí usamos -DskipTests para no repetir las pruebas que ya pasaron
                    sh 'mvn package -DskipTests'
                }
            }
        }

        stage('Paso 4: Archivar y Desplegar') {
            steps {
                dir('CalculadoraWeb') {
                    archiveArtifacts artifacts: 'target/*.war', fingerprint: true
                    
                    // Solo llegará aquí si el Paso 2 (Tests) fue EXITOSO
                    sh 'cp target/*.war /var/jenkins_home/tomcat-deploy/CalculadoraWeb.war'
                    echo '¡Proyecto desplegado con éxito tras pasar las pruebas!'
                }
            }
        }
    }
}