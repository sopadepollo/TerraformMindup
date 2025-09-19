output "load_balancer_dns" {
  description = "The DNS name of the load balancer."
  value       = module.others.load_balancer_dns
}

output "db_instance_address" {
  description = "The address of the RDS instance."
  value       = module.database.db_instance_address
}