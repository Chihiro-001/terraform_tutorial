provider "aws" {
  region  = "ap-northeast-1"
  profile = "default"
  default_tags {
    tags = {
      "Environment" = "stg"
      "Name"        = "si_terraform_handson"
    }
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