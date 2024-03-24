resource "aws_db_instance" "mysql" {
  allocated_storage    = var.allocated_storage
  storage_type         = var.storage_type
  engine               = "mysql"
  engine_version       = var.engine_version
  instance_class       = var.instance_class
  #name                 = var.db_name
  username             = var.db_username
  password             = var.db_password
  parameter_group_name = var.parameter_group_name
  db_subnet_group_name = aws_db_subnet_group.main.name
  vpc_security_group_ids = [var.vpc_security_group_id]
  skip_final_snapshot  = true
}

resource "aws_db_subnet_group" "main" {
  name       = "${var.db_name}-subnet-group"
  subnet_ids = var.subnet_ids

  tags = {
    Name = "My DB Subnet Group"
  }
}


resource "aws_security_group" "rds_sg" {
  name        = "${var.db_name}-rds-sg"
  description = "Security group for RDS MySQL instance"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = var.allowed_cidr_blocks
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "rds-sg-${var.db_name}"
  }
}


