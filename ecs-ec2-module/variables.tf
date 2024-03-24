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

variable "execution_role_arn" {
  description = "The ARN of the role that ECS tasks execute under."
  type        = string
}

variable "task_role_arn" {
  description = "The ARN of the role that the ECS task assumes."
  type        = string
}

variable "container_image" {
  description = "The image used to start a container. This string is passed directly to the Docker daemon."
  type        = string
}

variable "ecs_cluster_id" {
  description = "The ARN of the ECS cluster where the service will be deployed."
  type        = string
}

variable "desired_count" {
  description = "The number of instances of the task definition to place and keep running."
  type        = number
}

variable "target_group_arn" {
  description = "The ARN of the target group with which to register tasks."
  type        = string
}

variable "subnets" {
  description = "The list of subnet IDs to launch tasks in."
  type        = list(string)
}

variable "security_groups" {
  description = "The list of security group IDs to assign to the ECS service."
  type        = list(string)
}

# Optional: If your service uses load balancing, you might also want variables for configuring the load balancer.
variable "container_name" {
  description = "The name of the container to use with the load balancer."
  type        = string
  default     = "myapp"
}

variable "container_port" {
  description = "The port on the container to associate with the load balancer."
  type        = number
  default     = 80
}
