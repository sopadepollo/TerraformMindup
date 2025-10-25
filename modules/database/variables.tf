variable "vpc_id" {
  type = string
}

variable "subnet_ids" {
  type = list(string)
}

variable "sg_id" {
  type = string
}

variable "db_password" {
  description = "Password for RDS db"
  type = string 
  sensitive = true
}