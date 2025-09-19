resource "aws_vpc" "main" {
  cidr_block           = "172.31.0.0/16"
  instance_tenancy     = "default"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "MindUp" 
  }
}

resource "aws_subnet" "main" {
  count             = length(var.subnets)
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.subnets[count.index].cidr
  availability_zone = var.subnets[count.index].az

  tags = {
    Name = "MindUp_${count.index + 1}"
  }
}

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id
}

resource "aws_route_table" "main" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }

  tags = {
    Name = "MindUp_RT"
  }
}

resource "aws_route_table_association" "main" {
  count          = length(var.subnets)
  subnet_id      = aws_subnet.main[count.index].id
  route_table_id = aws_route_table.main.id
}

resource "aws_network_acl" "main" {
  vpc_id     = aws_vpc.main.id 
  subnet_ids = [for s in aws_subnet.main : s.id]

  ingress {
    protocol   = "-1" 
    rule_no    = 100 
    action     = "allow" 
    cidr_block = "0.0.0.0/0" 
    from_port  = 0
    to_port    = 0
  }

  egress {
    protocol   = "-1" 
    rule_no    = 100
    action     = "allow" 
    cidr_block = "0.0.0.0/0" 
    from_port  = 0
    to_port    = 0
  }
}