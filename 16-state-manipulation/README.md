# State Manipulation Techniques in Terraform

In this exercise, I learned how to manipulate the state of Terraform resources to recreate, import, refactor, and untrack infrastructure within a Terraform configuration.

### Refactoring Terraform Resources

I learned the two methods to refactor Terraform resources - methods that prevent you from creating, destroying, or changing a Terraform configuration when refactoring Terraform code.

These two methods are;

- Using the Terraform CLI with `terraform state mv ARGS...` command.
- Using the Terraform `moved {...}` block.

For better history and tracking of Terraform configurations, the moved block is a better method of refactoring Terraform resources within Terraform' state.

I created an `aws_instance` resource, then refactored it into a module without causing any create-or-destroy changes to the deployed resources within Terraform state.

### Importing Terraform Resources

In this exercise, I learned how to import Terraform resources from the cloud infrastructure into a Terraform config file. Just like the refactor method, there are two main methods to import tf resources.

- Using the Terraform CLI with `terraform import ['tf resource to import to'] ['cloud resource id to import from']` command.
- Using the Terraform `import {...}` block.

I imported an `aws_s3_bucket` resource into my tf config and tweaked it using IAC code from my tf config. To ensure the resource is not mistakenly deleted when I `terraform destroy`, I set `lifecycle.prevent_destroy` to true.

### Removing Terraform Resources

In this exercise, I learned how to remove Terraform resources from tf state file without destroying the resource in the cloud infra, as well as how to remove Terraform resources from tf state file and destroy the resource in the cloud infra.

Why would we remove the resources from tf state file and destroy the resource in the cloud infra (at the same time), since we're already simply deleting the resource from the cloud infra? Because of documentation purposes. We may want to keep or document the resources we are removing from our tf config. This is where the remove block is handy.

Two methods of removing tf resources:
- Remove using Terraform CLI with `terraform state rm ['resource to remove from tf state']`
- Remove using the Terraform `remove {...}` block.

I created a new `aws_s3_bucket` resource and removed it from my tf state file to unlink it from my Terraform IAC configuration.