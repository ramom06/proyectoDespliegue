pipeline {
    agent any
    tools {
        maven 'maven' // Asegúrate de que este nombre coincida con tu configuración global
    }
    stages {
        stage('Paso 1: Git Checkout') {
            steps {
                checkout scm
            }
        }
        stage('Paso 2: Generar WAR') {
            steps {
                // ESTA ES LA PARTE CLAVE:
                dir('CalculadoraWeb') { 
                    echo 'Entrando en la carpeta del proyecto y generando WAR...'
                    sh 'mvn clean package -DskipTests'
                }
            }
        }
        stage('Paso 3: Archivar y Desplegar') {
            steps {
                dir('CalculadoraWeb') {
                    // 1. Lo archivamos en Jenkins (opcional)
                    archiveArtifacts artifacts: 'target/*.war', fingerprint: true
                    
                    // 2. LO COPIAMOS AL VOLUMEN COMPARTIDO
                    // Ajusta la ruta /var/jenkins_home/... a la que usaste en tu Docker
                    sh 'cp target/*.war /var/jenkins_home/tomcat-deploy/CalculadoraWeb.war'
                    
                    echo '¡Archivo copiado al volumen compartido!'
                }
            }
        }
    }
}