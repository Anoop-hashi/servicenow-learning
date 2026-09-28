provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "example" {
  bucket = "servicenow-learning-tf-20260910"

  tags = {
    Name        = "DemoBucket1234"
    Environment = "Dev"
    Project     = "ServiceNow-Learning"
    Owner       = "Anoop"
    ManagedBy   = "Terraform"
  }
}

resource "aws_dynamodb_table" "example" {
  name         = "servicenow-learning-dynamodb"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "id"

  attribute {
    name = "id"
    type = "S"
  }

  tags = {
    Name = "DemoDynamoDB"
  }
}
