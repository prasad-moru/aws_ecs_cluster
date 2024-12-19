# ECS Cluster Setup with Terraform

This repository contains Terraform configurations to set up an ECS (Elastic Container Service) cluster on AWS. The infrastructure includes a VPC, ALB (Application Load Balancer), RDS (MySQL), ECR (Elastic Container Registry), and an ECS cluster using EC2 instances. Each component is modularized for reusability and better management.

## Repository Structure

```
├── aws-alb-module
│   ├── main.tf             # Configuration for Application Load Balancer
│   ├── outputs.tf          # Outputs for ALB module
│   └── variables.tf        # Input variables for ALB module
├── aws-rds-mysql-module
│   ├── main.tf             # Configuration for RDS MySQL instance
│   ├── outputs.tf          # Outputs for RDS module
│   └── variables.tf        # Input variables for RDS module
├── aws-vpc-module
│   ├── main.tf             # Configuration for VPC setup
│   ├── outputs.tf          # Outputs for VPC module
│   └── variables.tf        # Input variables for VPC module
├── ecr-module
│   ├── main.tf             # Configuration for Elastic Container Registry
│   ├── outputs.tf          # Outputs for ECR module
│   └── variables.tf        # Input variables for ECR module
├── ecs-ec2-module
│   ├── main.tf             # Configuration for ECS Cluster with EC2 instances
│   ├── outputs.tf          # Outputs for ECS EC2 module
│   └── variables.tf        # Input variables for ECS EC2 module
├── ecs-variables.tf         # Global ECS-specific variables
├── main.tf                  # Root Terraform configuration file
└── outputs.tf               # Root-level outputs
```

## Modules

1. **aws-vpc-module**
   - Creates a Virtual Private Cloud (VPC) with public and private subnets.
   - Configures Internet Gateway and NAT Gateway.

2. **aws-alb-module**
   - Sets up an Application Load Balancer with target groups and listeners.

3. **aws-rds-mysql-module**
   - Provisions an RDS MySQL database instance in the private subnet.

4. **ecr-module**
   - Configures an Elastic Container Registry to store Docker images.

5. **ecs-ec2-module**
   - Sets up an ECS cluster with EC2 instances.
   - Configures ECS tasks, services, and IAM roles.

## Prerequisites

- Terraform v1.x
- AWS CLI configured with appropriate credentials
- An existing AWS account

### Configuring AWS Access Keys

To enable Terraform to interact with AWS, you need to set up your AWS access keys and secret keys.

1. **Create AWS Access Keys:**
   - Log in to your AWS Management Console.
   - Go to **IAM > Users**, select your user, and click on the **Security credentials** tab.
   - Click **Create access key** to generate a new access key and secret key.

2. **Set Up Environment Variables:**
   Export your AWS access and secret keys as environment variables:
   ```bash
   export AWS_ACCESS_KEY_ID="your-access-key-id"
   export AWS_SECRET_ACCESS_KEY="your-secret-access-key"
   ```

3. **Use an AWS Profile (Optional):**
   Configure an AWS CLI profile:
   ```bash
   aws configure --profile your-profile-name
   ```
   Provide the access key, secret key, default region, and output format when prompted.

4. **Verify Configuration:**
   Test your setup by running:
   ```bash
   aws sts get-caller-identity
   ```

## Usage

1. **Clone the repository:**
   ```bash
   git clone <repository-url>
   cd <repository-directory>
   ```

2. **Initialize Terraform:**
   ```bash
   terraform init
   ```

3. **Plan the infrastructure:**
   ```bash
   terraform plan
   ```

4. **Apply the configuration:**
   ```bash
   terraform apply
   ```

5. **Destroy the infrastructure:**
   ```bash
   terraform destroy
   ```

## Outputs

The outputs of each module provide essential details such as:
- ALB DNS Name
- RDS Endpoint
- ECS Cluster Name
- ECR Repository URLs

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Contribution

Contributions are welcome! Please fork this repository and submit a pull request for any enhancements or bug fixes.

---

