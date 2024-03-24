variable "alb_name" {}
variable "internal" {}
variable "security_groups" {}
variable "subnet_ids" {}
variable "enable_deletion_protection" {}
variable "tags" {
  type = map(string)
}

variable "target_group_name" {}
variable "target_group_port" {}
variable "target_group_protocol" {}
variable "vpc_id" {}

variable "health_check_healthy_threshold" {}
variable "health_check_unhealthy_threshold" {}
variable "health_check_timeout" {}
variable "health_check_path" {}
variable "health_check_protocol" {}
variable "health_check_interval" {}
variable "health_check_matcher" {}

variable "listener_port" {}
variable "listener_protocol" {}
