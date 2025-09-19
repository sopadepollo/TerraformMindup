variable "vpc_id" {
  type = string
}

variable "subnets" {
  type = any
}

variable "users" {
  type    = list(string)
  default = ["Alex", "alfredo"]
}

variable "roles" {
  type    = list(object({
    name    = string
    service = string
  }))
  default = [
    {
      name    = "AWSServiceRoleForAutoScaling"
      service = "autoscaling.amazonaws.com" 
    },
    {
      name    = "AWSServiceRoleForElasticLoadBalancing"
      service = "elasticloadbalancing.amazonaws.com" 
    },
    {
      name    = "AWSServiceRoleForRDS"
      service = "rds.amazonaws.com" 
    }
  ]
}