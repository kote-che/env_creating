pipeline {
  environment {
    BITBUCKET_CREDS='bitbucket_git'
    GIT_COMMITTER_NAME="jenkins"
    GIT_COMMITTER_EMAIL="jenkins@getblend.com"
  }
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
            sh 'docker run -v "$(pwd)/terraform":"/terraform" --workdir="/terraform" hashicorp/terraform validate'
        }
    }
  }
}

