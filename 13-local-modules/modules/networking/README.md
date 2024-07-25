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
| <a name="vpc_config"></a> [vpc_config](#vpc_config) | An object that contains and sets the VPC configuration | `object()` | <pre>{<br>  cidr_block = null<br>  name       = null<br>}</pre> | yes |
| <a name="vpc_config-cidr_block"></a> [cidr_block](#vpc_config-cidr_block) | An attribute in [vpc_config](#vpc_config) used to set CIDR block | `string` | `null` | yes |
| <a name="vpc_config-name"></a> [name](#vpc_config-name) | An attribute in [vpc_config](#vpc_config) used to set VPC name | `string` | `null` | no |
| <a name="subnet_config"></a> [subnet_config](#subnet_config) | An object that contains and sets VPC Subnet configuration | `map(object())` | <pre>{<br>  subnet_1 = {<br>      cidr_block = null<br>      az         = null<br>      public     = false<br>    }<br>}</pre> | no |
| <a name="subnet_config-cidr_block"></a> [cidr_block](#subnet_config-cidr_block) | An attribute in [subnet_config](#subnet_config) used to set VPC subnet CIDR block | `string` | `null` | no |
| <a name="subnet_config-az"></a> [az](#subnet_config-az) | An attribute in [subnet_config](#subnet_config) used to set VPC subnet availability zone  | `string` | `null` | no |
| <a name="subnet_config-public"></a> [public](#subnet_config-public) | An attribute in [subnet_config](#subnet_config) used to set if VPC subnet is public or private  | `bool` | `false` | no |

## Outputs

| Name | Description |
| ---- | ----------- |
| <a name="vpc_id"></a> [vpc_id](#vpc_id) | The ID of the VPC |
| <a name="public_subnets"></a> [public_subnets](#public_subnets) | A map of objects containing each public VPC subnet's ID and availability zone |
| <a name="private_subnets"></a> [private_subnets](#private_subnets) | A map of objects containing each VPC subnet's ID and availability zone of private subnets |

