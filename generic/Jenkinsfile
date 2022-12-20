pipeline {
    agent any

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
                    sh 'docker run mine/hello-world.test'
                }
            }
        }

        stage('Push Image') {
            steps {
                script {
                    withCredentials(
                        [usernamePassword(
                            credentialsId: 'ciminobo-docker.com',
                            usernameVariable: 'DOCKER_USERNAME',
                            passwordVariable: 'DOCKER_PASSWORD')]
                    ) {
                        sh "docker login -u ${DOCKER_USERNAME} -p ${DOCKER_PASSWORD}"
                        sh 'docker image tag mine/hello-world h108077/hello-world:latest'
                        sh 'docker push  h108077/hello-world:latest'
                    }
                }
            }
        }

        stage('Deploy') {
            steps {
                script {
                    sh 'ansible-playbook deploy.yaml'
                }
            }
        }
    }
}
