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
        stage('Paso 3: Archivar el resultado') {
            steps {
                dir('CalculadoraWeb') {
                    // Esto hará que el WAR aparezca en la interfaz de Jenkins para descargar
                    archiveArtifacts artifacts: 'target/*.war', fingerprint: true
                }
            }
        }
    }
}