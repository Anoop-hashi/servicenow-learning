
provider "aws" {
  region = "ap-south-1"
}

resource "aws_s3_bucket" "example" {
  bucket = "my-demo-tf-bucket-12345"

  tags = {
    Name        = "DemoBucket"
    Environment = "Dev"
  }
}