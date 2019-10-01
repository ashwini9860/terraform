node {
    def tfHome = tool name: 'terraform'
    env.PATH = "${tfHome}:${env.PATH}"
    
    def secrets = [
        [path: 'secret/aws', engineVersion: 1, secretValues: [
            [envVar: 'aws_access', vaultKey: 'access_key'],
            [envVar: 'aws_secret', vaultKey: 'secret_key']]]
    ]

    def configuration = [vaultUrl: 'http://13.232.202.231:8200',
                         vaultCredentialId: 'vault',
                         engineVersion: 1]
                         
    withVault([configuration: configuration, vaultSecrets: secrets]) {
        env.AWS_ACCESS_KEY_ID = "$aws_access"
        env.AWS_SECRET_ACCESS_KEY = "$aws_secret"
       
    }
    
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
    stage 'terraform plan'
    sh '''
    terraform plan -out=plan
    '''
    stage 'terraform apply'
    sh '''
    terraform apply plan
    '''
     
}
