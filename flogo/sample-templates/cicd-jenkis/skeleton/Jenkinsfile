def findFlogoFile(String filename) {
    echo ' looking for file : filename'
    def files = findFiles(glob: "**/${filename}")
    if(files.length == 0) {
        error "${filename} not found. Please ensure the file exists in your repository."
    } else if (files.length > 1) {
        error "Multiple ${filename} files found. Please ensure there is only one ${filename} file in your repository or specify the correct path."
    }
    echo "Found ${filename} at: ${files[0].path}"
    return files[0].path
}
                
pipeline {
    agent any
        environment { 
            buildId = ""
            funName = ""
            awsRoleARN = "arn:aws:iam::xxxx:role/EMEA_Lambda"
            awsRegion = "eu-central-1"
            zipLocation =""
            
        }
    stages {
        stage('Checkout Code') {
            steps {
                agent {label 'mac'}
                echo "Checkout code from Git repository"
                git branch: 'main',
                credentialsId: 'mpandav-git-id',
                url: 'https://github.com/mpandav/flogo-cicd-demo.git'
            }
        }
       
        stage('Build: Upload App') {
            steps {
                script {
                    
                    echo "Starting Build Binary stage"
                    echo "calling findflogoapp()..."
                    
                    def appJsonPath = findFlogoFile("*.flogo")
                    
                    echo "appJsonPath : $appJsonPath"
                                        
                    // Build Flogo app binary using TIBCO Cloud Pltform API
        
                    echo "calling build api from TCI"
                    
                    //retrieve TCI auth token for api call
                    
                    def response = httpRequest(
                        httpMode: 'POST',
                        quiet: 'true',
                        acceptType: 'APPLICATION_JSON',
                        //contentType: 'APPLICATION_FORM_DATA',
                        formData: 
                        [
                            [contentType: 'APPLICATION_FORM_DATA', name: 'flogo.json', fileName: 'ecolabel-service-lambda.flogo', uploadFile: appJsonPath]
                        ],
                        url: 'https://eu.api.cloud.tibco.com/tci/v1/subscriptions/0/app/build/flogo?os=linux&arch=amd64',
                        customHeaders: [[name: 'Authorization', value: 'Bearer CIC~636dEAsLIjgYjFsuYu79kSEf']],
                        validResponseCodes: '202,400,404,401,500'
                    )
                    
                    echo "Response status: ${response.status}"
                    echo "Response body: ${response.content}"
                    //find buildId
                    def responseJson = new groovy.json.JsonSlurper().parseText(response.content)
                    buildId = responseJson.find { it.status == 'success' }?.buildId

                    // Use the buildId in the next subsequent call
                    
                }
            }
        }
        
        stage('Build: Download Build') {
            steps {
                script {
                    echo "Build ID: ${buildId}"
                    echo "Download the binary using Build ID: ${buildId}"
                    
                    def response = httpRequest(
                    httpMode: 'GET',
                    acceptType: 'APPLICATION_OCTETSTREAM',
                    url: "https://eu.api.cloud.tibco.com/tci/v1/subscriptions/0/app/build/flogo/${buildId}?compress=false",
                    customHeaders: [[name: 'Authorization', value: 'Bearer CIC~636dEAsLIjgYjFsuYu79kSEf']],
                    validResponseCodes: '200:299',
                    outputFile: 'bin/flogoapp' // Consider a more specific filename like 'flogo-app.zip'
                    )
                }
            }
        }

        stage('Unit Tests') {
            steps {
                script {
                    echo "Execute unit tests"

                    def appJsonPath = findFlogoFile("*.flogo")
                    echo "appJsonPath : $appJsonPath"
                    
                    def appBinaryPath = findFlogoFile("flogoapp")
                    echo "appBinaryPath : $appBinaryPath"
                     
                    def appFlogoTestFile = findFlogoFile("*.flogotest")
                    echo "appFlogoTestFile : $appFlogoTestFile"
                    sh "chmod 777 $appBinaryPath"
                    
                    // mac does not support linux binaries
                    sh "./$appBinaryPath -test --test-file $appFlogoTestFile --result-filename testResult"
                }
            }
        }

        stage('Code Scanning') {
            steps {
                
                echo "Perform code scanning using SonarQube"
               // withSonarQubeEnv('your-sonarqube-server') { // Replace with your SonarQube server ID
                //    sh 'mvn sonar:sonar'
                }
            }
            
        stage('Package Lambda Function') {
            steps {
                script {
                    echo "Package the Flogo binary for Lambda deployment"
                    //sh 'zip -r flogo-lambda.zip flogo-binary' // Adjust the filename if needed
                    
                    def flogoAppPath = findFlogoFile('*.flogo')
                    echo "flogoAppPath : $flogoAppPath"
                    
                    echo "Extract filename without extension"
                    
                    //def flogoAppName = flogoAppPath.substring(0, flogoAppPath.lastIndexOf('.'))
                    def flogoAppName = flogoAppPath.substring(flogoAppPath.lastIndexOf('/') + 1, flogoAppPath.lastIndexOf('.'))
                    echo "flogoAppName : $flogoAppName"
                    
                    def flogoBinaryPath = findFlogoFile('flogoapp')
                    echo "flogoBinaryPath : $flogoBinaryPath"
                    
                    echo "Rename the flogoapp file to 'bootstrap' (no extension)"
                    sh "mv ${flogoBinaryPath} bootstrap"
                    
                    echo "Compress the renamed file into 'my-flogo-app.zip'"
                    sh "zip ${flogoAppName}-lambda-fun.zip bootstrap"
                    
                    funName="${flogoAppName}-lambda-fun.zip"
                    
                    echo "moving deployable asset to /app "
                    // Create the /app directory in the workspace
                    sh "mkdir -p app"
                    
                    // Move the 'bootstrap' file to the /app directory
                    sh "mv bootstrap app/"
                    
                    // Move the ZIP file to the /app directory
                    sh "mv *.zip app/"
                    zipLocation="app/$funName"
                }
            }
        }

        stage('Deploy to AWS Lambda') {
            steps {
                script {
                    echo "Lambda Function Name: $funName"
                    
                    appName=funName
                    echo "appName: $appName"
                    
                    echo "Deploy the packaged function to AWS Lambda"
                    // awsLambda deploy function: 'your-lambda-function-name', 
                    //    region: 'your-aws-region', 
                    //    zipFile: 'flogo-lambda.zip', 
                    //    credentialsId: 'your-aws-credentials'

                    funName = funName.substring(0, funName.lastIndexOf('.zip'))
                    
                    echo "Deploy Lambda Function Name: $funName"
                    sh "aws lambda create-function  --function-name $funName --runtime provided.al2023 --handler bootstrap --architectures x86_6 --role $awsRoleARN --region $awsRegion --zip-file fileb://$zipLocation"
                }

            }
        }
    }
}

