ec2_instance_count = 0

# subnet_count = 2

ec2_instance_config_list = [
  {
    instance_type = "t2.micro"
    ami           = "ubuntu"
  },
  {
    instance_type = "t2.micro"
    ami           = "nginx"
  }
]