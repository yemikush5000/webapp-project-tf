/* Requires the Docker Pipeline plugin */
pipeline {
    agent any
    stages {
        stage('build-general') {
            steps {
                echo "building changes on permament branches"
            }
        }
        stage('build-on-feature1') {
            when {
              branch  "feature1"
            }
            steps {
                echo "build changes in feature1 brnach"
            }
        }
    }
}
