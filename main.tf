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

  configuration {
    execute_command_configuration {
      logging = "OVERRIDE"

      log_configuration {
        cloud_watch_encryption_enabled = false
        cloud_watch_log_group_name     = "/ecs/my-ecs-cluster"
      }
    }
  }

  service_connect_defaults {
    namespace = "my-ecs-namespace"
  }

  tags = {
    Name        = "my-ecs-cluster"
    Environment = "Dev"
    ManagedBy   = "Terraform"
    Purpose     = "DemoECSCluster"
  }
}
