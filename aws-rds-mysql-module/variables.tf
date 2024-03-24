variable "allocated_storage" {}
variable "storage_type" {}
variable "engine_version" {}
variable "instance_class" {}
variable "db_name" {}
variable "db_username" {}
variable "db_password" {}
variable "parameter_group_name" {}
variable "vpc_security_group_id" {}
variable "subnet_ids" {}

variable "vpc_id" {
  description = "The ID of the VPC where the RDS instance and its security group will be created."
  type        = string
}

variable "allowed_cidr_blocks" {
  description = "List of CIDR blocks allowed to access the RDS instance"
  type        = list(string)
}
