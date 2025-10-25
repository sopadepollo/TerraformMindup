output "default_sg_id" {
  value = aws_security_group.default.id
}

output "db_sg_id" {
  value = aws_security_group.db.id
}

output "lambda_exec_role_arn" {
  description = "ARN for lambda execution role"
  value = aws_iam_role.lambda_exec_role.arn
}