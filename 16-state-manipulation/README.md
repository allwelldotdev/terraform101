# State Manipulation Techniques in Terraform

In this exercise, I learned how to manipulate the state of Terraform resources to recreate, import, refactor, and untrack infrastructure within a Terraform configuration.

### Refactoring Terraform Resources

I learned the two methods to refactor Terraform resources - methods that prevent you from creating, destroying, or changing a Terraform configuration when refactoring Terraform code.

These two methods are;

- Using the Terraform CLI with `terraform state mv ARGS...` command.
- Using the Terraform `moved {...}` block.

For better history and tracking of Terraform configurations, the moved block is a better method of refactoring Terraform resources within Terraform' state.

I created an `aws_instance` resource, then refactored it into a module without causing any create-or-destroy changes to the deployed resources within Terraform state.