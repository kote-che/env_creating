pipeline {
  agent {
    label 'master'
  }

  stages {
    stage('Terraform init without backend') {
        steps {
            sh 'docker run -v "$(pwd)/terraform":"/terraform" --workdir="/terraform" hashicorp/terraform init'
        }
    }
    stage ("Terraform validate") {
        steps {
            sh 'docker run -v "$(pwd)/terraform":"/terraform" --workdir="/terraform" hashicorp/terraform validate -json'
        }
    }
  }
}

