# VPC Networking Module on AWS

This module manages the creation of VPCs and Subnets, allowing for the creation of both public and private subnets.

Example usage:
```hcl
module "vpc" {
  source = "./modules/networking"

  vpc_config = {
    cidr_block = "10.0.0.0/16"
    name       = "your_vpc"
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
    },
    subnet_3 = {
      cidr_block = "10.0.2.0/24"
      az         = "us-east-1c"
      public     = true
    },
    subnet_4 = {
      cidr_block = "10.0.3.0/24"
      az         = "us-east-1d"
    }
  }
}

```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| [vpc_config](#vpc_config) | An object that contains and sets the VPC configuration | `object()` | <pre>vpc_config = {<br>  cidr_block = null<br>  name       = null<br>}</pre> | yes |
| cidr_block | An attribute in [vpc_config](#vpc_config) used to set CIDR blocks | `string` | `null` | yes |
 

