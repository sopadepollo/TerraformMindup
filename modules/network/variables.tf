variable "subnets" {
  description = "A list of subnets to create."
  type        = list(object({
    cidr = string
    az   = string
  }))
  default     = [
    {
      cidr = "172.31.0.0/20" 
      az   = "us-east-2a"
    },
    {
      cidr = "172.31.32.0/20"
      az   = "us-east-2c"
    },
    {
      cidr = "172.31.16.0/20"
      az   = "us-east-2b"
    }
  ]
}