# Using 'count' and 'for_each' Expressions to create Multiple Resources in Terraform

### From commit: "deploy multiple ec2 from list variable":
I've learned how to deploy multiple EC2 instance using the 'count' argument & 'count.index' expression in Terraform. In this commit, I deployed multiple EC2 instances from a List configuration. The list config was variable type list, which contains objects with specific keys. The keys include `instance_type` and `ami`, both of type string.

### From commit: "allow multiple AMIs"
I extended the Amazon Machine Images (AMIs) to include NGINX, a popular open-source web server. This involved defining a data source for the NGINX Bitnami AMI, extending the `ami_ids` local to include an entry for NGINX, and adding an object for an NGINX instance to the `ec2_instance_config_list` variable. I extend the configuration without having to touch the `aws_instance.from_list` resource. Meaning, this is a well-designed code!

