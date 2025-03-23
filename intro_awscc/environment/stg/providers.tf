provider "awscc" {
  region  = "ap-northeast-1"
  profile = "default"
}

provider "aws" {
  region = "ap-northeast-1"
  profile = "default"
}


terraform {
  required_providers {
    awscc = {
      source = "hashicorp/awscc"
    } 
   aws = {
     source = "hashicorp/aws"
   }   
    }
  }