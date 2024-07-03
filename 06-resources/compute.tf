resource "aws_instance" "web" {
  # ubuntu AMI : ami-04a81a99f5ec58529
  # NGINX AMI : 
  ami                         = "ami-04a81a99f5ec58529"
  associate_public_ip_address = true
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.public.id
  root_block_device {
    delete_on_termination = true
    volume_size           = 8
    volume_type           = "gp3"
  }

  tags = merge(local.common_tags, {
    Name = "06-resources-ec2"
  })
}
