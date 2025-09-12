pipeline {
    agent any

    environment {
        AWS_ACCESS_KEY_ID     = 'AKIAW2766TYSU2ESFN67'
        AWS_SECRET_ACCESS_KEY = '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'
        AWS_DEFAULT_REGION    = 'eu-north-1'
    }

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
                tool name: 'Terraform', type: 'terraform'
                sh 'terraform init'
                sh 'terraform apply -auto-approve'
            }
        }
        stage(' Ansible Configuration  ') {
            steps {
                ansiblePlaybook credentialsId: 'Ansible_Tool', disableHostKeyChecking: true, installation: 'ansible2', playbook: 'ansiblebook2.yml', vaultTmpPath: ''
            }
        }
    }
}

