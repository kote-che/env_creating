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
            sh 'docker ps'
        }
        // post {
        //     always {
        //         junit testResults: 'reports/unittest/TEST-*.xml'
        //         publishCoverage adapters: [coberturaAdapter(path: 'reports/coverage/coverage.xml')]
        //     }
        // }
    }
  }
//   post {
//     always {
//       sh 'rm -rf dist/*'
//     }
//   }
}
