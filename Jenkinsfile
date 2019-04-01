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
	
	//Parameters of the pipeline. You can define more parameters in this pipeline in order to have less hard code variables.
	parameters {
        password(defaultValue: "xxxxxx", description: 'What is the vault token ?', name: 'VAULT_TOKEN')
		string(defaultValue: "130.61.125.123", description: 'What is the vault server IP Address ?', name: 'VAULT_SERVER_IP')
		string(defaultValue: "demoatp", description: 'What is the vault secret name ?', name: 'VAULT_SECRET_NAME')  
		string(defaultValue: "atpdb2", description: 'What is the database name ?', name: 'DATABASE_NAME') 
		password(defaultValue: "AlphA_2014_!", description: 'What is the database password ?', name: 'DATABASE_PASSWORD')  		
		string(defaultValue: "https://objectstorage.eu-frankfurt-1.oraclecloud.com/p/r2849V7j7r4WNhWkT24TOk8BRX7GUe4WfQUfPCPxh3E/n/oraseemeafrtech1/b/AtpDemo2/o/terraform.tfstate", description: 'Where is stored the terraform state ?', name: 'TERRAFORM_STATE_URL')  
		choice(name: 'CHOICE', choices: ['Create', 'Remove'], description: 'Choose between Create or Remove Infrastructure')
    }
	
	//Load the parameters as environment variables
	environment {
		//Vault Env mandatory variables
		VAULT_TOKEN = "${params.VAULT_TOKEN}"
		VAULT_SERVER_IP = "${params.VAULT_SERVER_IP}"
		VAULT_ADDR = "http://${params.VAULT_SERVER_IP}:8200"
		VAULT_SECRET_NAME = "${params.VAULT_SECRET_NAME}"
		
		//Database variables
		TF_VAR_autonomous_database_db_name = "${params.DATABASE_NAME}"
		TF_VAR_database_password = "${params.DATABASE_PASSWORD}"
		
		//Terraform variables
		TF_CLI_ARGS = "-no-color"
		TF_VAR_terraform_state_url = "${params.TERRAFORM_STATE_URL}"
		
		//Sqlcl env variables for sqlcl oci option.
		TNS_ADMIN = "./"

	}
    
    stages {
        stage('Check Infra As Code Tools') {
            steps {
				sh 'whoami'
				sh 'pwd'
				sh 'ls'
			    sh 'chmod +x ./showtoolsversion.sh'
                sh './showtoolsversion.sh'
            }
        }
		
		stage('Init Cloud Env Variables') {
            steps {
				script {
					//Get all cloud information.
					//env.DATA =  sh returnStdout: true, script: 'curl --header "X-Vault-Token: ${VAULT_TOKEN}" --request GET http://${VAULT_SERVER_IP}:8200/v1/secret/data/${VAULT_SECRET_NAME} | jq .data.data'
					
					//env.TF_VAR_tenancy_ocid = sh returnStdout: true, script: 'echo ${DATA}  | jq -r .tenancy_ocid'
					env.TF_VAR_tenancy_ocid = sh returnStdout: true, script: 'vault kv get -field=tenancy_ocid secret/demoatp'
					
					//env.TF_VAR_user_ocid = sh returnStdout: true, script: 'echo ${DATA}  | jq -r .user_ocid'
					env.TF_VAR_user_ocid = sh returnStdout: true, script: 'vault kv get -field=user_ocid secret/demoatp'
					
					//env.TF_VAR_fingerprint = sh returnStdout: true, script: 'echo ${DATA}  | jq -r .fingerprint'
					env.TF_VAR_fingerprint = sh returnStdout: true, script: 'vault kv get -field=fingerprint secret/demoatp'
					
					//env.api_private_key = sh returnStdout: true, script: 'echo ${DATA}  | jq -r .api_private_key'
					
					//env.TF_VAR_compartment_ocid = sh returnStdout: true, script: 'echo ${DATA}  | jq -r .compartment_ocid'
					env.TF_VAR_compartment_ocid = sh returnStdout: true, script: 'vault kv get -field=compartment_ocid secret/demoatp'
					
					//env.TF_VAR_ssh_public_key = sh returnStdout: true, script: 'echo ${DATA}  | jq -r .ssh_public_key'
					//env.TF_VAR_ssh_private_key = sh returnStdout: true, script: 'echo ${DATA}  | jq -r .ssh_private_key'
					
					//env.TF_VAR_region = sh returnStdout: true, script: 'echo ${DATA}  | jq -r .region'
					env.TF_VAR_region = sh returnStdout: true, script: 'vault kv get -field=region secret/demoatp'
					
					//env.DOCKERHUB_USERNAME = sh returnStdout: true, script: 'echo ${DATA}  | jq -r .dockerhub_username'
					env.DOCKERHUB_USERNAME = sh returnStdout: true, script: 'vault kv get -field=dockerhub_username secret/demoatp'
					
					//env.DOCKERHUB_PASSWORD = sh returnStdout: true, script: 'echo ${DATA}  | jq -r .dockerhub_password'
					env.DOCKERHUB_PASSWORD = sh returnStdout: true, script: 'vault kv get -field=dockerhub_password secret/demoatp'
					
					env.KUBECONFIG = './kubeconfig'
					
					//Terraform debugg option if problem
					//env.TF_LOG="DEBUG"
					//env.OCI_GO_SDK_DEBUG="v"
				}
				
				//Check all cloud information.
				echo "TF_VAR_tenancy_ocid=${TF_VAR_tenancy_ocid}"
				echo "TF_VAR_user_ocid=${TF_VAR_user_ocid}"
				echo "TF_VAR_fingerprint=${TF_VAR_fingerprint}"
				//echo "api_private_key=${api_private_key}"
				echo "TF_VAR_compartment_ocid=${TF_VAR_compartment_ocid}"
				//echo "TF_VAR_ssh_public_key=${TF_VAR_ssh_public_key}"
				//echo "TF_VAR_ssh_private_key=${TF_VAR_ssh_private_key}"
				echo "TF_VAR_region=${TF_VAR_region}"
				echo "TF_VAR_terraform_state_url=${TF_VAR_terraform_state_url}"
				echo "DOCKERHUB_USERNAME=${DOCKERHUB_USERNAME}"
				echo "DOCKERHUB_PASSWORD=${DOCKERHUB_PASSWORD}"
				echo "KUBECONFIG=${KUBECONFIG}"
				
				dir ('./tf/modules/atp') {
					script {
						//Get the API and SSH key Files with vault client because curl breaks the end line of the key file
						sh 'vault kv get -field=api_private_key secret/demoatp | tr -d "\n" | base64 --decode > bmcs_api_key.pem'
						sh 'vault kv get -field=ssh_private_key secret/demoatp | tr -d "\n" | base64 --decode > id_rsa'
						sh 'vault kv get -field=ssh_public_key secret/demoatp | tr -d "\n" | base64 --decode > id_rsa.pub'
						sh 'ls'
						sh 'cat ./bmcs_api_key.pem'
						sh 'cat ./id_rsa'
						sh 'cat ./id_rsa.pub'
						
						env.TF_VAR_private_key_path = './bmcs_api_key.pem'
						echo "TF_VAR_private_key_path=${TF_VAR_private_key_path}"
						env.TF_VAR_ssh_private_key = sh returnStdout: true, script: 'cat ./id_rsa'
						echo "TF_VAR_ssh_private_key=${TF_VAR_ssh_private_key}"
						env.TF_VAR_ssh_public_key = sh returnStdout: true, script: 'cat ./id_rsa.pub'
						echo "TF_VAR_ssh_public_key=${TF_VAR_ssh_public_key}"
					}
				}
            }
        }
		
		stage('TF Plan Atp ') { 
            steps {
				dir ('./tf/modules/atp') {
					sh 'ls'
					
					//Terraform initialization in order to get oci plugin provider	
					sh 'terraform init -input=false -backend-config="address=${TF_VAR_terraform_state_url}"'
					
					//Terraform plan
					sh 'terraform plan -out myplan'
				}
			}
		}
		
		stage('TF Apply Atp ') { 
            steps {
				dir ('./tf/modules/atp') {
					sh 'ls'
					
					script {				
						//Ask Question in order to apply terraform plan or not
						def deploy_validation = input(
							id: 'Deploy',
							message: 'Let\'s continue the deploy plan',
							type: "boolean")
							
						sh 'terraform apply -input=false -auto-approve myplan'
					}		
				}
			}
		}
    }    
}
