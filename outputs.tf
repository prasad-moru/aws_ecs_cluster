output "vpc_id" {
  value = module.aws_vpc.vpc_id
}

output "ecs_cluster_name" {
  value = module.ecs_cluster.cluster_name
}

output "alb_dns_name" {
  value       = module.aws_alb.alb_dns_name
  description = "The DNS name of the ALB created."
}

output "ecr_repository_url" {
  description = "The URL of the ECR repository created."
  value       = module.ecr_repository.repository_url
}
