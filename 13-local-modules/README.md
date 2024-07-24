# Creating Own Terraform VPC Modules - Starting with a Networking/VPC Module

In this exercise, I'll be creating...

A networking module that should:
1. [DONE] Create a VPC with a given CIDR block
2. Allow the user to provide the configuration for multiple subnets:
   1. [DONE] The user should be able to provide CIDR blocks
   2. [DONE] The user should be able to provide AWS AZ
   3. The user should be able to mark a subnet as public or private 