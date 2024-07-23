terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.11.0"
    }
  }
}

provider "aws" {
  # Configuration options
  region = "ap-south-1"
}
terraform {
  backend "s3" {
    bucket         = "mystalefile"      # Replace with your S3 bucket name
    key            = "mystalefile/terraform.tfstate"  # The path within the bucket where the state file will be stored
    region         = "ap-south-1"               # The region where your S3 bucket is located
    dynamodb_table = "terraformlock"          # Optional: For state locking using DynamoDB
    encrypt        = true                      # Encrypt the state file at rest
  }
}
