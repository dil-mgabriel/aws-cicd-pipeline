#configure the AWS provider
provider "aws" {
  region = "us_east_1"
  version = "v2.70.0"
  access_key = {{ssm:Access_Key_Id}}
  secret_key = {{ssm:Secret_access_key}}
  session_token = {{ssm:session_token}}

}

terraform {

    backend "s3" {
        bucket = "aws-cicd-pipeline-terraform-state" 
        dynamodb_table = "terraform-lock-file"
        key = "path/terraform.tfstate"
        region = "us_east_1"
        access_key = {{ssm:Access_Key_Id}}
        secret_key = {{ssm:Secret_access_key}}
        session_token = {{ssm:session_token}}
    }
}