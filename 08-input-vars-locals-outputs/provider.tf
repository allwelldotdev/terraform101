terraform {
  required_version = "~>1.7"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>5.0"
    }

    random = {
      source  = "hashicorp/random"
      version = "~>3.0"
    }
  }
}

# AWS AMI - eu-west-1: ami-0932dacac40965a65
# AWS AMI - us-east-1: ami-0a0e5d9c7acc336f1
# AWS AMI - us-west-1: ami-0ecaad63ed3668fca

provider "aws" {
  region = "us-east-1"
}
