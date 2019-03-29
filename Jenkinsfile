pipeline {
    //agent by default
    //agent any

    //use a docker image instead of the jenkins host
    agent {
        docker { 
            image 'cpruvost/infraascode:latest'
            args '-u root:root'
        }
    }
    
    stages {
        stage('Init Atp Variables') {
            steps {
                sh "./showtoolsversion.sh"
            }
        }
    }    
}
