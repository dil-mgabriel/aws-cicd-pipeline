#configure the AWS provider
provider "aws" {
  region = "us-east-1"
  version = "v2.70.0"
  access_key = $AWS_ACCESS_KEY_ID
  secret_key = $AWS_SECRET_ACCESS_KEY
  token = $AWS_SESSION_TOKEN

}

terraform {

  backend "s3" {
    bucket = "aws-cicd-pipeline-terraform-state" 
    dynamodb_table = "terraform-lock-file"
    key = "path/terraform.tfstate"
    region = "us-east-1"
    access_key = $AWS_ACCESS_KEY_ID
    secret_key = $AWS_SECRET_ACCESS_KEY
    token = $AWS_SESSION_TOKEN
    }
}