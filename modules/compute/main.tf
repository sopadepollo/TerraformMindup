resource "aws_launch_template" "main" {
  name_prefix   = "v2.24.0-beta-"
  image_id      = "ami-04431ee2778eb9e4e"
  instance_type = "t3.medium"
}

resource "aws_autoscaling_group" "main" {
  name                      = "MindupOfcAS"
  min_size                  = 1 
  max_size                  = 2 
  desired_capacity          = 1 
  health_check_type         = "ELB"
  health_check_grace_period = 300 
  vpc_zone_identifier       = var.subnet_ids
  target_group_arns         = [var.target_group_arn]

  launch_template {
    id      = aws_launch_template.main.id
    version = "$Latest"
  }
}

resource "aws_lambda_function" "main" {
  function_name = "Escalado_Mindup" 
  role          = "arn:aws:iam::634188077694:role/service-role/Escalado_Mindup-role-cn2nv4fu" 
  handler       = "lambda_function.lambda_handler" 
  runtime       = "python3.13" 
  filename      = "lambda_function.zip"
  architectures = ["x86_64"]
}