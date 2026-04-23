pipeline{
    agent{ label "twotier"}
    stages{
        stage("Code Clone"){
            steps{
                echo "This is cloning the code"
                git url:"https://github.com/Gurleenkaur-16/two-tier-flaskapp.git" ,branch : "main"
                echo "code cloned successfully"
            }
        }
        stage("Code Build"){
            steps{
                echo "This is building the code"
                sh "docker build -t flaskapp ."
                echo "Code build successfully"
            }
        }
        stage("Code Push to DockerHub"){
            steps{
                echo "This is pushing code to Docker Hub"
                withCredentials([usernamePassword(credentialsId:"dockerhubcred",passwordVariable:"dockerHubPass",usernameVariable:"dockerHubUser")]){
                    sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPass} "
                    sh "docker tag flaskapp:latest ${env.dockerHubUser}/flaskapp:latest"
                    sh "docker push ${env.dockerHubUser}/flaskapp:latest"
                }
            }
        }
        stage("Code Deploy"){
            steps{
                echo "This is deploying the code"
                sh " docker compose down && docker compose up -d "
            }
        }
            
        }
    }
