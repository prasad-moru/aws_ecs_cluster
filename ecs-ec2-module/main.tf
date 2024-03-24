resource "aws_ecs_cluster" "cluster" {
  name = var.cluster_name
}

resource "aws_iam_role" "ecs_instance_role" {
  name = "ecsInstanceRole"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })
}

resource "aws_iam_role" "ecs_task_execution_role" {
  name = "ecsTaskExecutionRole"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "ecs-tasks.amazonaws.com"
        },
      },
    ],
  })
}

resource "aws_iam_role" "ecs_task_role" {
  name = "ecsTaskRole"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "ecs-tasks.amazonaws.com"
        },
      },
    ],
  })
}



resource "aws_iam_role_policy_attachment" "ecs_instance_role_attachment" {
  role       = aws_iam_role.ecs_instance_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceforEC2Role"
}

resource "aws_iam_role_policy_attachment" "ecs_task_execution_role_policy" {
  role       = aws_iam_role.ecs_task_execution_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}

resource "aws_iam_role_policy_attachment" "ecs_task_role_cloudwatch" {
  role       = aws_iam_role.ecs_task_role.name
  policy_arn = "arn:aws:iam::aws:policy/CloudWatchLogsFullAccess"
}


resource "aws_iam_instance_profile" "ecs_instance_profile" {
  name = "ecsInstanceProfile"
  role = aws_iam_role.ecs_instance_role.name
}

resource "aws_launch_configuration" "ecs_instances" {
  name          = "ecsInstances"
  image_id      = var.ecs_instance_ami
  instance_type = var.instance_type
  iam_instance_profile = aws_iam_instance_profile.ecs_instance_profile.name

  user_data = <<-EOF
              #!/bin/bash
              echo ECS_CLUSTER=${aws_ecs_cluster.cluster.name} >> /etc/ecs/ecs.config
              EOF

  security_groups = [var.ecs_security_group_id]
}

resource "aws_autoscaling_group" "ecs_instances_group" {
  launch_configuration = aws_launch_configuration.ecs_instances.id
  min_size             = var.min_size
  max_size             = var.max_size
  desired_capacity     = var.desired_capacity

  vpc_zone_identifier = var.private_subnet_ids

  tag {
    key                 = "Name"
    value               = "ECS Instance - ${var.cluster_name}"
    propagate_at_launch = true
  }
}


resource "aws_ecs_task_definition" "ecs_task_definition" {
  family                   = var.task_family
  container_definitions    = jsonencode([
    {
      name          = var.container_name
      image         = var.container_image
      cpu           = var.container_cpu
      memory        = var.container_memory
      portMappings  = var.port_mappings
    }
  ])
}

resource "aws_ecs_service" "ecs_service" {
  name            = var.service_name
  cluster         = aws_ecs_cluster.cluster.arn
  task_definition = aws_ecs_task_definition.ecs_task_definition.arn
  desired_count   = var.desired_count

  # Register ECS service tasks with ALB target group
  load_balancer {
    target_group_arn = var.alb_target_group_arn
    container_name   = var.container_name
    container_port   = var.container_port
  }
}