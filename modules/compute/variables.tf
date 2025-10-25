variable "subnet_ids" {
  type = list(string)
}

variable "sg_id" {
  type = string
}

variable "target_group_arn" {
  type = string
}

variable "lambda_role_arn" {
  description = "IAM Role ARN fot Lambda function"
  type = string
}