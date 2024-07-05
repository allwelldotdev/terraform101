# Learning Terraform Variables

In this project, I learned to use variables in Terraform and how to type and validate variables. I also learned to use variable types: string, numbers, object, boolean, and map. As well as combining them together like so: object(strings) and map(object).

I learned the precedence in which variables take order. Here is the Terraform variable precedence order (from least precendence at the top to most precedence at the bottom):

1. ENV variable - TF_VAR instance type
2. terraform.tfvars file (if number of files with ext ".tfvars" is more than one, Terraform will choose the ".tfvars" file with a filename prefix first letter that is closer to 'Z' in alphabetical order.)
3. prod.auto.tfvars file
4. -var and -var-file cli arguments, latest with highest precedence = "t3.xlarge"