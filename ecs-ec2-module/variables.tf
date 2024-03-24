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


variable "task_family" {
  description = "Name of the ECS task definition family"
}

variable "container_name" {
  description = "Name of the container"
}

variable "container_image" {
  description = "URL of the Docker image to use for the container"
}

variable "container_cpu" {
  description = "cpu resource for container"
}

variable "container_memory" {
  description = "memory resource for container"
}

variable "port_mappings" {
  description = "add port like 8080:8080"
}


variable "service_name" {
  description = "provide env vars"
}

variable "desired_count" {
  description = "provide env vars"
}

variable "alb_target_group_arn" {
  description = "provide env vars"
}

variable "container_port" {
  description = "provide env vars"
}