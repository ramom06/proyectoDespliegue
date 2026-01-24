pipeline {
    agent any // Se ejecuta en cualquier nodo disponible

    stages {
        stage('Checkout') {
            steps {
                echo 'Descargando código del repositorio...'
                // Aquí Jenkins suele bajar el código automáticamente si lo vinculas a GitHub
            }
        }

        stage('Build') {
            steps {
                echo 'Compilando el proyecto...'
                // Ejemplo para Node.js: sh 'npm install'
                // Ejemplo para Python: sh 'pip install -r requirements.txt'
            }
        }

        stage('Test') {
            steps {
                echo 'Ejecutando pruebas unitarias...'
                // Ejemplo: sh 'npm test'
            }
        }

        stage('Deploy') {
            steps {
                echo 'Desplegando aplicación...'
                // Aquí irían tus comandos de Docker para subir la imagen o reiniciar el contenedor
            }
        }
    }
}