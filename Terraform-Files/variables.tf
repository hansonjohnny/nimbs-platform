variable "project_name" {
  description = "Name of the project, used as prefix for all resources"
  type        = string
  default     = "nimbus-retail"
}

variable "environment" {
  description = "Deployment environment"
  type        = string
  default     = "dev"
}

variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-east-2"
}

variable "eks_version" {
  description = "Kubernetes version for the EKS cluster"
  type        = string
  default     = "1.32"
}

variable "node_instance_type" {
  description = "EC2 instance type for EKS worker nodes"
  type        = string
  default     = "t3.small"
}

variable "jenkins_instance_type" {
  description = "EC2 instance type for Jenkins server"
  type        = string
  default     = "m7i-flex.large"
}

variable "jenkins_ssh_cidr" {
  description = "CIDR block allowed to SSH into Jenkins — restrict to your IP e.g. 105.x.x.x/32"
  type        = string
  default     = "0.0.0.0/0"
}

variable "aws_account_id" {
  description = "AWS account ID"
  type        = string
}

variable "iam_admin_user" {
  description = "IAM username for kubectl access"
  type        = string
}

variable "rds_instance_class" {
  description = "RDS instance class"
  type        = string
  default     = "db.t3.micro"
}

variable "rds_allocated_storage" {
  description = "Allocated storage for RDS in GB"
  type        = number
  default     = 20
}

variable "rds_username" {
  description = "RDS master username"
  type        = string
  default     = "postgres"
}

variable "rds_password" {
  description = "RDS master password — set in terraform.tfvars, never commit"
  type        = string
  sensitive   = true
}

variable "redis_node_type" {
  description = "ElastiCache node type"
  type        = string
  default     = "cache.t3.micro"
}

variable "jwt_secret" {
  description = "JWT signing secret for auth-service"
  type        = string
  sensitive   = true
}

variable "kafka_broker" {
  description = "Kafka broker endpoint — update after Strimzi is installed"
  type        = string
  default     = "kafka-cluster-kafka-bootstrap.nimb.svc.cluster.local:9092"
}