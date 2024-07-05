ec2_instance_type = "t2.micro"

ec2_volume_config = {
  size = 10
  type = "gp3"
}

additional_tags = {
  "Name" = "08-ec2-resource"
  "Env"  = "Dev"
}

my_sensitive_value = "sensitive" # this is a value I used to test the 'sensitive' attribute in Terraform for outputs and variables.
