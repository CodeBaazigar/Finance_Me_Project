pipeline {
    agent any

    stages {
        stage('Git Chekout') {
            steps {
                git branch: 'main', credentialsId: 'Github_CRED', url: 'https://github.com/CodeBaazigar/Finance_Me_Project.git'
            }
        }
        stage('Application Build') {
            steps {
                sh 'mvn clean package'
            }
        }
        stage('Docker Build Image ') {
            steps {
                sh 'docker build -t codebaazigar/financeme .'
            }
        }
        stage('Pushing to Dockerhub ') {
            steps {
                withDockerRegistry(credentialsId: 'Dockerhub_CRED', url: 'https://index.docker.io/v1/') {
                    sh 'docker push codebaazigar/financeme'
                }
            }
        }
        stage(' Terraform Apply ') {
            steps {
				withCredentials([[
                    $class: 'AmazonWebServicesCredentialsBinding',
                    credentialsId: 'AWS_Credentials',
                    accessKeyVariable: 'AWS_ACCESS_KEY_ID',
                    secretKeyVariable: 'AWS_SECRET_ACCESS_KEY'
                ]]) {
                    tool name: 'Terraform', type: 'terraform'
                    sh 'terraform init'
                    sh 'terraform apply -auto-approve'
				}
            }
        }
        stage(' Ansible Configuration  ') {
            steps {
                ansiblePlaybook credentialsId: 'Ansible_Tool', disableHostKeyChecking: true, installation: 'ansible2', playbook: 'ansiblebook2.yml', vaultTmpPath: ''
            }
        }
    }
}


