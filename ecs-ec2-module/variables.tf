variable "cluster_name" {
  description = "The name of the ECS cluster"
  type        = string
}

variable "ecs_instance_ami" {
  description = "The AMI ID for the ECS instances"
  type        = string
}

variable "instance_type" {
  description = "The instance type for the ECS instances"
  type        = string
  default     = "t2.micro"
}

variable "min_size" {
  description = "Minimum number of instances in the Auto Scaling Group"
  type        = number
}

variable "max_size" {
  description = "Maximum number of instances in the Auto Scaling Group"
  type        = number
}

variable "desired_capacity" {
  description = "Desired number of instances in the Auto Scaling Group"
  type        = number
}

variable "private_subnet_ids" {
  description = "A list of private subnet IDs where ECS instances will be launched"
  type        = list(string)
}

variable "ecs_security_group_id" {
  description = "The ID of the security group for the ECS instances"
  type        = string
}


