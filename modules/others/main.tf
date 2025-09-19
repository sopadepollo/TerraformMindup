resource "aws_lb" "main" {
  name               = "MindupOfcLB"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.sg_id]
  subnets            = [for s in var.subnets : s.id]
}

resource "aws_lb_target_group" "main" {
  name     = "TargetMindup"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id
}

resource "aws_lb_listener" "main" {
  load_balancer_arn = aws_lb.main.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.main.arn
  }
}

resource "aws_sns_topic" "main" {
  name = "Mindup-Overloaded"
}

resource "aws_cloudwatch_log_group" "main" {
  count = length(var.log_groups)
  name  = var.log_groups[count.index]
}

resource "aws_acm_certificate" "main" {
  count = length(var.domains)
  domain_name       = var.domains[count.index]
  validation_method = "DNS"
}