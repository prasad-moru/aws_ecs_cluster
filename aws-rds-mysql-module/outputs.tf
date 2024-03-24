output "db_instance_endpoint" {
  value = aws_db_instance.mysql.endpoint
}

output "db_instance_username" {
  value = var.db_username
}

output "db_instance_password" {
  value = var.db_password
}
