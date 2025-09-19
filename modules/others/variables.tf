variable "vpc_id" {
  type = string
}

variable "sg_id" {
  type = string
}

variable "subnets" {
  type = any
}

variable "log_groups" {
  type    = list(string)
  default = ["/aws/rds/instance/database-1/error", "/aws/rds/instance/mindup-prod/error", "RDSOSMetrics"]
}

variable "domains" {
  type    = list(string)
  default = ["test.mindup.mx", "app.mindup.mx"]
}