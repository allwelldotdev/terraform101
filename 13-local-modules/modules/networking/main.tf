locals {
  public_subnets = {
    for k, v in var.subnet_config : k => v if v.public
  }
}

data "aws_availability_zones" "this" {
  state = "available"
}

resource "aws_vpc" "this" {
  cidr_block = var.vpc_config.cidr_block

  tags = {
    Name = var.vpc_config.name
  }
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

resource "aws_internet_gateway" "this" {
  count  = length(local.public_subnets) > 0 ? 1 : 0
  vpc_id = aws_vpc.this.id
}

resource "aws_route_table" "public_rtb" {
  count  = length(local.public_subnets) > 0 ? 1 : 0
  vpc_id = aws_vpc.this.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.this[count.index].id
  }
}

resource "aws_route_table_association" "public" {
  for_each = local.public_subnets

  subnet_id      = aws_subnet.this[each.key].id
  route_table_id = aws_route_table.public_rtb[0].id
}