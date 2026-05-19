# ─────────────────────────────────────────
# ELASTICACHE SUBNET GROUP
# ─────────────────────────────────────────
resource "aws_elasticache_subnet_group" "main" {
  name       = "${var.project_name}-redis-subnet-group"
  subnet_ids = aws_subnet.private[*].id

  tags = {
    Name        = "${var.project_name}-redis-subnet-group"
    Environment = var.environment
  }
}

# ─────────────────────────────────────────
# ELASTICACHE — REDIS
# ─────────────────────────────────────────
resource "aws_elasticache_replication_group" "main" {
  replication_group_id = "${var.project_name}-redis"
  description          = "Redis cluster for NimbusRetail"

  node_type            = var.redis_node_type
  num_cache_clusters   = 2
  port                 = 6379

  subnet_group_name  = aws_elasticache_subnet_group.main.name
  security_group_ids = [aws_security_group.redis.id]

  at_rest_encryption_enabled = true
  transit_encryption_enabled = false  # set true in prod with TLS

  automatic_failover_enabled = true

  tags = {
    Name        = "${var.project_name}-redis"
    Environment = var.environment
  }
}