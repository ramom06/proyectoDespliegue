pipeline {
    agent any

    tools {
        // Asegúrate de que el nombre 'maven' coincida con el que configuraste
        // en Jenkins -> Manage Jenkins -> Global Tool Configuration
        maven 'maven' 
    }

    stages {
        stage('Paso 1: Git Checkout') {
            steps {
                // Descarga el código (Jenkins lo suele hacer solo, pero esto asegura la ruta)
                checkout scm
            }
        }

        stage('Paso 2: Limpiar y Empaquetar (WAR)') {
            steps {
                // Entramos en la carpeta donde está el archivo pom.xml
                    echo 'Generando archivo WAR...'
                    // 'mvn clean package' limpia la carpeta target y crea el WAR
                    sh 'mvn clean package -DskipTests'
            }
        }

        stage('Paso 3: Ejecutar Tests') {
            steps {
                    echo 'Ejecutando pruebas unitarias...'
                    sh 'mvn test'
            }
        }

        stage('Paso 4: Archivar WAR') {
            steps {
                    // Esto guarda el WAR dentro de Jenkins para que puedas descargarlo 
                    // desde la interfaz web después de que termine el build
                    archiveArtifacts artifacts: 'target/*.war', fingerprint: true
                    echo 'El archivo WAR ha sido archivado correctamente.'
                }
            }
        }
    }