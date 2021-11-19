#configure the AWS provider
provider "aws" {
  region = "us-east-1"
  access_key = "${data.aws_ssm_parameter.access_key_db123.value}"
  secret_key = "${data.aws_ssm_parameter.secret_key_db123.value}"
  # session_token = data.aws_ssm_parameter.session_token.value

}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }

  backend "s3" {
    bucket = "aws-cicd-pipeline-terraform-state" 
    dynamodb_table = "terraform-lock-file"
    key = "path/terraform.tfstate"
    region = "us-east-1"
    role_arn      = "arn:aws:iam::117005682321:role/pipeline_role"
    # access_key = data.aws_ssm_parameter.access_key.value
    # secret_key = data.aws_ssm_parameter.secret_key.value
    # session_token = "${data.aws_ssm_parameter.session_token.value}"
    }
}

data "aws_ssm_parameter" "access_key_db123" {
  name = "/root/AWS_Access_Key_Id"
}

data "aws_ssm_parameter" "secret_key_db123" {
  name = "/root/AWS_Secret_access_key"
}

data "aws_ssm_parameter" "session_token" {
  name = "/root/AWS_session_token"
}