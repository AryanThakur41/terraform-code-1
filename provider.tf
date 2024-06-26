terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.6"
    }
  }
  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "us-west-2"
   access_key = "ACCESS_KEY_ID"
   secret_key = "SECRET_ACCESS_KEY_ID"
}