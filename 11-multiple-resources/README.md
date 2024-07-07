# Using 'count' and 'for_each' Expressions to create Multiple Resources in Terraform

### From commit: "deploy multiple ec2 from list variable":
I've learned how to deploy multiple EC2 instance using the 'count' argument & 'count.index' expression in Terraform. In this commit, I deployed multiple EC2 instances from a List configuration. The list config was variable type list, which contains objects with specific keys. The keys include `instance_type` and `ami`, both of type string.

