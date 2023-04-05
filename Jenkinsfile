/* Requires the Docker Pipeline plugin */
pipeline {
    agent any
    stages {
        stage('build') {
            steps {
                echo "building changes on permament branches"
            }
        }
        stage('build') {
            when {
              branch = "feature1"
            }
            steps {
                echo "build changes in feature1 brnach"
            }
        }
    }
}
