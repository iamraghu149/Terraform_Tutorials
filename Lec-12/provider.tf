terraform {
  backend "s3" {
    bucket = "terraform-docss"
    dynamodb_table = "state-lock"
    key = "global/mystatefile/terraform.tfstate"
    region = "ap-south-1"
    encrypt = true
  }

  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.46.0"
    }
  }
}

provider "aws" {
  # Configuration options
  region = "ap-south-1"
}
