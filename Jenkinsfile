@NonCPS
def getGitbranchEnv(){
  def stage = ""
  switch (env.GIT_BRANCH) {
    case 'master':
      stage = 'p'
      break
    case 'ITG':
      stage = 'i'
      break
    default:
      stage = 'd'
      break
  }
  return stage
}

pipeline {
  agent any
  stages {
    stage('Cleaning and set up') {
      steps {
        echo 'cleaning up'
      }
    }
    stage('Non Functional Testing') {
      parallel {
        stage('Unit Test') {
          steps {
            echo 'Running Unit Test'
          }
        }
      }
    }
    stage('Build') {
      environment {
        DPLYMNT_HOST=''
        DPLYMNT_PORT=''
        //STAGE=getStage()
        BRANCH_ENV=getGitbranchEnv()
      }  
      steps {
        echo 'Packaging application. Ignoring tests since they have already been executed...'
        echo 'Local Archiving...'
        print "Git Branch Enviornment  = ${BRANCH_ENV}"
        //archiveArtifacts(artifacts: '**/target/*.*ar', fingerprint: true)
      }
    }
    stage('Functional Tests') {
      steps {
        echo 'Executing post deploy functional tests'
      }
    }
  }
}
