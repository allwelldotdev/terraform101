resource "aws_vpc" "this" {
  cidr_block = var.vpc_config.cidr_block

  tags = {
    Name = var.vpc_config.name
  }
}

data "aws_availability_zones" "this" {
  state = "available"
}

resource "aws_subnet" "this" {
  for_each          = var.subnet_config
  vpc_id            = aws_vpc.this.id
  cidr_block        = each.value.cidr_block
  availability_zone = each.value.az

  tags = {
    Name = "${each.key}-${var.vpc_config.name}"
  }

  lifecycle {
    precondition {
      condition     = contains(data.aws_availability_zones.this.names, each.value.az)
      error_message = <<-EOF
      The AZ "${each.value.az}" provided for the subnet "${each.key}" is invalid.

      The applied AWS region "${data.aws_availability_zones.this.id}" supports the following AZs:
      [${join(", ", data.aws_availability_zones.this.names)}]
      EOF
    }
  }
}
