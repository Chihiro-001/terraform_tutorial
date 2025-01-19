provider "aws" {
  region                      = "ap-northeast-1"
  access_key                  = "test" # For Localstack dummy key
  secret_key                  = "test" # For Localstack dummy key
  s3_use_path_style           = true
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true
  endpoints {
    s3  = "http://localhost:4566"
    ec2 = "http://localhost:4566"
  }
}

terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      # version = "~> 5.0"
    }
  }
  # backend "s3" {
  #   bucket = "localstack-terraform-state"
  #   key    = "terraform.tfstate"
  #   region = "ap-northeast-1"
  #   endpoints = {
  #     s3 = "http://localhost:4566"
  #   }
  #   encrypt      = false
  #   use_lockfile = true
  #   skip_credentials_validation = true
  # }
}