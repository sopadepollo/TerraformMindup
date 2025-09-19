resource "aws_security_group" "default" {
  name        = "default" 
  description = "default VPC security group"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 80 
    to_port     = 80 
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] 
  }

  ingress {
    from_port   = 443
    to_port     = 443 
    protocol    = "tcp" 
    cidr_blocks = ["0.0.0.0/0"] 
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "db" {
  name        = "Security_Group_MindupDB" 
  description = "launch-wizard-1 created 2025-05-14T15:23:06.494Z"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 3306 
    to_port     = 3306 
    protocol    = "tcp" 
    cidr_blocks = ["0.0.0.0/0"] 
  }
}

resource "aws_iam_user" "main" {
  count = length(var.users)
  name  = var.users[count.index]
}

resource "aws_iam_role" "service_role" {
  count = length(var.roles)
  name  = var.roles[count.index].name
  assume_role_policy = jsonencode({
    Version   = "2012-10-17"
    Statement = [
      {
        Action    = "sts:AssumeRole"
        Effect    = "Allow"
        Principal = {
          Service = var.roles[count.index].service
        }
      }
    ]
  })
}