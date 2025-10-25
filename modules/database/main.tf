resource "aws_db_instance" "main" {
  identifier              = "mindup-prod" 
  instance_class          = "db.t3.micro" 
  engine                  = "mysql" 
  engine_version          = "8.0.43" 
  allocated_storage       = 20 
  db_name                 = "mindup" 
  username                = "root"
  password                = var.db_password
   
  vpc_security_group_ids  = [var.sg_id]
  db_subnet_group_name    = aws_db_subnet_group.main.name
  backup_retention_period = 7 
  skip_final_snapshot     = true
  publicly_accessible     = false
  storage_encrypted       = true 
}

resource "aws_db_subnet_group" "main" {
  name       = "default-vpc-06a41b5bdb557b7ee" 
  subnet_ids = var.subnet_ids
}