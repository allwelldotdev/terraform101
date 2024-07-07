# Using 'count' and 'for_each' Expressions to create Multiple Resources in Terraform

### From commit: "deploy multiple ec2 from list variable":
I've learned how to deploy multiple EC2 instance using the 'count' argument & 'count.index' expression in Terraform. In this commit, I deployed multiple EC2 instances from a List configuration. The list config was variable type list, which contains objects with specific keys. The keys include `instance_type` and `ami`, both of type string.

### From commit: "allow multiple AMIs"
I extended the Amazon Machine Images (AMIs) to include NGINX, a popular open-source web server. This involved defining a data source for the NGINX Bitnami AMI, extending the `ami_ids` local to include an entry for NGINX, and adding an object for an NGINX instance to the `ec2_instance_config_list` variable. I extend the configuration without having to touch the `aws_instance.from_list` resource. Meaning, this is a well-designed code!

### From commit: "add validation to list variable" 
I learned how to add validation for an EC2 instance configuration list in Terraform. From the defined variable `ec2_instance_config_list`, I added validation checks to ensure that only `t2.micro` instances and `ubuntu` or `nginx` images are used. A valuable skill that will help me ensure the correctness and reliability of my Terraform configurations.

### From commit: "deploy multiple ec2 from map variable"
Deployed EC2 instances from a map variable configuration.
I created a map variable to hold the configuration for each EC2 instance, and then used a `for_each` loop to iterate over each item in the map and create an EC2 instance with the provided configuration.
Here,  I learned how to manage multiple EC2 instances with unique configurations using a map object in Terraform. A crucial skill for managing complex Terraform projects and ensuring that my infrastructure is flexible and easily configurable.

### From commit: "add validation to map variable"
Having learned how to add validations to list variables in the former commit, here, I used a similar method to add validation to the map variable configuration that I used to deploy EC2 instances.
What I do differently here? I used the `values()` function in Terraform that iterates through a map of objects with key-value pairs and returns the values.