output "vpc_id" {
  value = aws_vpc.main.id
}

output "public_subnet_ids" {
  description = "List of IDs of the private subnets used by the ECS cluster."
  value       = [aws_subnet.public_subnet_1.id, aws_subnet.public_subnet_2.id]
  // Ensure these are the correct references to your subnet resources within the ECS module.
}

output "private_subnet_ids" {
  description = "List of IDs of the private subnets used by the ECS cluster."
  value       = [aws_subnet.private_subnet_1.id, aws_subnet.private_subnet_2.id]
  // Ensure these are the correct references to your subnet resources within the ECS module.
}


output "ecs_security_group_id" {
  value = aws_security_group.ecs_sg.id
  description = "The ID of the security group for ECS instances"
}

output "alb_security_group_id" {
  value = aws_security_group.alb_sg.id
  description = "The ID of the ALB security group"
}

output "aws_rds_sg" {
  value = aws_security_group.rds_sg.id
  description = "The ID of the RDS security group"
}

