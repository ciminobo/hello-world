pipeline {
    agent {
        node any
    }

    stages {
        stage('Build') {
            steps {
                script {
                    sh 'docker build -f Dockerfile -t mine/hello-world .'
                    sh 'docker build -f Dockerfile.test -t mine/hello-world.test .'
                }
            }
        }

        stage('Test') {
            steps {
                script {
                    sh 'docker run mine/hello-world.test .'
                }
            }
        }

        stage('Push Image') {
            steps {
                script {
                    sh 'docker push -f Dockerfile.test -t mine/hello-world.test .'
                }
            }
        }

        stage('Deploy') {
            steps {
                script {
                    sh 'ansible-playbook .'
                }
            }
        }
    }
}
