module "vpc" {
  source  = "allwelldotdev/vpc-own-module/aws"
  version = "0.1.3"

  vpc_config = {
    cidr_block = "10.0.0.0/16"
    name       = "own-module-vpc"
  }

  subnet_config = {
    subnet_1 = {
      cidr_block = "10.0.0.0/24"
      az         = "us-east-1a"
    },
    subnet_2 = {
      cidr_block = "10.0.1.0/24"
      az         = "us-east-1b"
      public     = true
    }
  }
}
