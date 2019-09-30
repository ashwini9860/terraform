node {
    def tfHome = tool name: 'terraform'
    env.PATH = "${tfHome}:${env.PATH}"
    env.AWS_ACCESS_KEY_ID = "${AWS_ACCESS_KEY}"
    env.AWS_SECRET_ACCESS_KEY = "${AWS_SECRET_KEY}"
   
    stage 'Checkout Git'
    cleanWs()
    checkout([$class: 'GitSCM',
    branches: [[name: '*/master']],
    doGenerateSubmoduleConfigurations: false,
    extensions: [],
    submoduleCfg: [],
    userRemoteConfigs: [[credentialsId: 'GITLAB_ID', url: 'https://github.com/ashwini9860/terraform.git']]])
    
    stage 'terraform version'
    sh '''
    terraform -version
    '''
    stage 'print env'
    echo "key is ${AWS_ACCESS_KEY_ID}"
    echo "key is ${AWS_SECRET_ACCESS_KEY}"
   
    stage 'terraform init'
    sh '''
    terraform init
    ''' 
}
