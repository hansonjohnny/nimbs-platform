# ─────────────────────────────────────────
# AWS SECRETS MANAGER — AUTH SERVICE
# ─────────────────────────────────────────
resource "aws_secretsmanager_secret" "auth_service" {
  name        = "${var.project_name}/auth-service"
  description = "Secrets for auth-service"

  tags = {
    Name        = "${var.project_name}-auth-service-secrets"
    Environment = var.environment
  }
}

resource "aws_secretsmanager_secret_version" "auth_service" {
  secret_id = aws_secretsmanager_secret.auth_service.id
  secret_string = jsonencode({
    db-host      = aws_db_instance.main.address
    db-password  = var.rds_password
    jwt-secret   = var.jwt_secret
  })
}

# ─────────────────────────────────────────
# AWS SECRETS MANAGER — CART SERVICE
# ─────────────────────────────────────────
resource "aws_secretsmanager_secret" "cart_service" {
  name        = "${var.project_name}/cart-service"
  description = "Secrets for cart-service"

  tags = {
    Name        = "${var.project_name}-cart-service-secrets"
    Environment = var.environment
  }
}

resource "aws_secretsmanager_secret_version" "cart_service" {
  secret_id = aws_secretsmanager_secret.cart_service.id
  secret_string = jsonencode({
    db-host      = aws_db_instance.main.address
    db-password  = var.rds_password
    redis-host   = aws_elasticache_replication_group.main.primary_endpoint_address
  })
}

# ─────────────────────────────────────────
# AWS SECRETS MANAGER — CATALOG SERVICE
# ─────────────────────────────────────────
resource "aws_secretsmanager_secret" "catalog_service" {
  name        = "${var.project_name}/catalog-service"
  description = "Secrets for catalog-service"

  tags = {
    Name        = "${var.project_name}-catalog-service-secrets"
    Environment = var.environment
  }
}

resource "aws_secretsmanager_secret_version" "catalog_service" {
  secret_id = aws_secretsmanager_secret.catalog_service.id
  secret_string = jsonencode({
    db-host     = aws_db_instance.main.address
    db-password = var.rds_password
  })
}

# ─────────────────────────────────────────
# AWS SECRETS MANAGER — ORDER SERVICE
# ─────────────────────────────────────────
resource "aws_secretsmanager_secret" "order_service" {
  name        = "${var.project_name}/order-service"
  description = "Secrets for order-service"

  tags = {
    Name        = "${var.project_name}-order-service-secrets"
    Environment = var.environment
  }
}

resource "aws_secretsmanager_secret_version" "order_service" {
  secret_id = aws_secretsmanager_secret.order_service.id
  secret_string = jsonencode({
    db-host      = aws_db_instance.main.address
    db-password  = var.rds_password
    kafka-broker = var.kafka_broker
  })
}

# ─────────────────────────────────────────
# AWS SECRETS MANAGER — NOTIFICATION SERVICE
# ─────────────────────────────────────────
resource "aws_secretsmanager_secret" "notification_service" {
  name        = "${var.project_name}/notification-service"
  description = "Secrets for notification-service"

  tags = {
    Name        = "${var.project_name}-notification-service-secrets"
    Environment = var.environment
  }
}

resource "aws_secretsmanager_secret_version" "notification_service" {
  secret_id = aws_secretsmanager_secret.notification_service.id
  secret_string = jsonencode({
    kafka-broker = var.kafka_broker
  })
}