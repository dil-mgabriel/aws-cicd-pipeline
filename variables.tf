

variable "aws_region" {
    type = "string"
    default = "us-east-1" 
}


data "aws_ssm_parameter" "access_key" {
  name = "Access_Key_Id"
}

data "aws_ssm_parameter" "secret_key" {
  name = "Secret_access_key"
}

data "aws_ssm_parameter" "session_token" {
  name = "session_token"
}