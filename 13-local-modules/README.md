# Creating Own Terraform VPC Modules - Starting with a Networking/VPC Module

In this exercise, I'll be creating...

A networking module that should:
1. [DONE] Create a VPC with a given CIDR block
2. [DONE] Allow the user to provide the configuration for multiple subnets:
   1. [DONE] The user should be able to provide CIDR blocks
   2. [DONE] The user should be able to provide AWS AZ
   3. [DONE] The user should be able to mark a subnet as public or private
      1. [DONE] If at least one subnet is public, we need to deploy an IGW
      2. [DONE] We need to associate the public subnets with a public RTB
3. [DONE] Define the module's outputs. Expose some module information using the module's `outputs.tf` file.