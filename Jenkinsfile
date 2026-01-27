pipeline {
    agent any
	//Aquí indicamos que vamos a usar Maven, importante usar el mismo nombre que le dimos en la conf de Jenkins
    tools {
        maven 'Maven'
    }
    stages {
	//Descarga el código del repositorio configurado
        stage('Paso 1: Git Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Paso 2: Pruebas Unitarias') {
            steps {
		//Le decimos la carpeta en la que esta el proyecto
                dir('CalculadoraWeb') {
			//Maven busca en la carpeta java una clase test.java y ejecuta todos los @Test
                    sh 'mvn test'
                }
            }
        }

        stage('Paso 3: Generar WAR') {
            steps {
                dir('CalculadoraWeb') {
                    echo 'Generando archivo WAR...'
                    // Lo comprime todo a war y como ya hemos hecho los test en el paso anterior los saltamos
                    sh 'mvn package -DskipTests'
                }
            }
        }

        stage('Paso 4: Archivar y Desplegar') {
            steps {
                dir('CalculadoraWeb') {
			//Jenkins guarda una copia del war en su servidor
                    archiveArtifacts artifacts: 'target/*.war', fingerprint: true
                    
                    // Copia el war a la carpeta compartida
                    sh 'cp target/*.war /var/jenkins_home/tomcat-deploy/CalculadoraWeb.war'
                }
            }
        }
    }
}