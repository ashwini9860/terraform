node {
    def tfHome = tool name: 'terraform'
    env.PATH = "${tfHome}:${env.PATH}"
    env.AWS_ACCESS_KEY_ID = "${AWS_ACCESS_KEY}"
    env.AWS_SECRET_ACCESS_KEY = "${AWS_SECRET_KEY}"
    
    stage 'terraform version'
    sh '''
    terraform -version
    '''
    stage 'print env'
    echo "key is ${AWS_ACCESS_KEY_ID}"
    echo "key is ${AWS_SECRET_ACCESS_KEY}"
    
    stage ''
}
