output "vpc_id" {
  description = "VPC ID"
  value       = aws_vpc.main.id
}

output "public_subnet_ids" {
  description = "Public subnet IDs (ALB)"
  value       = aws_subnet.public[*].id
}

output "private_subnet_ids" {
  description = "Private subnet IDs (EKS, RDS, Redis)"
  value       = aws_subnet.private[*].id
}

output "ecr_auth-service_url" {
  description = "ECR auth-service repository URL — used to push and pull images"
  value       = aws_ecr_repository.auth_service.repository_url
}

output "ecr_cart-service_url" {
  description = "ECR cart-service repository URL — used to push and pull images"
  value       = aws_ecr_repository.cart_service.repository_url
}

output "ecr_catalog-service_url" {
  description = "ECR catalog-service repository URL — used to push and pull images"
  value       = aws_ecr_repository.catalog_service.repository_url
}

output "ecr_order-service_url" {
  description = "ECR order-service repository URL — used to push and pull images"
  value       = aws_ecr_repository.order_service.repository_url
}

output "ecr_notification-service_url" {
  description = "ECR notification-service repository URL — used to push and pull images"
  value       = aws_ecr_repository.notification_service.repository_url
}

output "ecr_frontend_url" {
  description = "ECR frontend repository URL — used to push and pull images"
  value       = aws_ecr_repository.frontend.repository_url
}

output "jenkins_public_ip" {
  description = "Jenkins server public IP"
  value       = aws_eip.jenkins.public_ip
}

output "sonarqube_url" {
  description = "SonarQube URL"
  value       = "http://${aws_eip.jenkins.public_ip}:9000"
}

output "jenkins_ssh" {
  description = "SSH command"
  value       = "ssh -i <your-key>.pem ubuntu@${aws_eip.jenkins.public_ip}"
}

# output "eks_cluster_name" {
#   description = "EKS cluster name"
#   value       = aws_eks_cluster.main.name
# }

# output "eks_cluster_endpoint" {
#   description = "EKS cluster API endpoint"
#   value       = aws_eks_cluster.main.endpoint
# }