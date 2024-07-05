data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"] # Owner is Canonical

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-*-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

output "ubuntu_aws_ami_object" {
  value = data.aws_ami.ubuntu.id
}

resource "aws_instance" "ubuntu" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = /* "t2.micro" */ var.ec2_instance_type

  root_block_device {
    delete_on_termination = true
    volume_size           = /* 10 */ var.ec2_volume_config.size
    volume_type           = /* "gp3" */ var.ec2_volume_config.type
  }

  tags = merge(var.additional_tags, {
    ManagedBy = "TerraformResourceCreation"
  })
}
