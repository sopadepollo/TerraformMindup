variable "aws_region" {
  description = "AWS Region to deploy."
  type        = string
  default     = "us-east-2"
}
variable "db_password" {
  description = "Password for RDS db"
  type = string
  sensitive = true
}