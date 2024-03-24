variable "region" {
  description = "The AWS region to deploy the VPC."
  type        = string
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC."
  type        = string
}

variable "public_subnet_cidr" {
  description = "The CIDR block for the public subnet."
  type        = string
}

variable "private_subnet_cidr" {
  description = "The CIDR block for the private subnet."
  type        = string
}

variable "availability_zone" {
  description = "The availability zone to deploy the subnets in."
  type        = string
}

variable "vpc_id" {}
variable "rds_allowed_cidr_blocks" {
  type        = list(string)
  description = "List of CIDR blocks allowed to access the RDS instance"
}
