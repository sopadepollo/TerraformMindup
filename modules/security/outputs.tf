output "default_sg_id" {
  value = aws_security_group.default.id
}

output "db_sg_id" {
  value = aws_security_group.db.id
}