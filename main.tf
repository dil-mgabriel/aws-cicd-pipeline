resource "aws_s3_bucket" "my-test-s3-buck" {
  bucket = "my-test-s3-buck-11-17-2021"
  acl    = "public-read"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}