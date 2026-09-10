provider "aws" {
  region = "ap-south-1"
}

resource "aws_s3_bucket" "example" {
  bucket = "servicenow-learning-tf-20260910"

  tags = {
    Name        = "DemoBucket"
    Environment = "Dev"
  }
}

resource "aws_ecs_cluster" "example" {
  name = "my-ecs-cluster"

  setting {
    name  = "containerInsights"
    value = "enabled"
  }

  tags = {
    Name        = "my-ecs-cluster"
    Environment = "Dev"
  }
}
