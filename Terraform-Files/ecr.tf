# ─────────────────────────────────────────
# ECR REPOSITORY — auth-service
# ─────────────────────────────────────────
resource "aws_ecr_repository" "auth_service" {
  name                 = "${var.project_name}/auth-service"
  image_tag_mutability = "MUTABLE"
  force_delete         = true # allows deleting repo even if it has images (useful for development)

  image_scanning_configuration {
    scan_on_push = true
  }

  encryption_configuration {
    encryption_type = "AES256"
  }

  tags = {
    Name        = "${var.project_name}-auth-service"
    Environment = var.environment
  }
}

# ─────────────────────────────────────────
# ECR REPOSITORY — cart-service
# ─────────────────────────────────────────
resource "aws_ecr_repository" "cart_service" {
  name                 = "${var.project_name}/cart-service"
  image_tag_mutability = "MUTABLE"
  force_delete         = true # allows deleting repo even if it has images (useful for development)

  image_scanning_configuration {
    scan_on_push = true
  }

  encryption_configuration {
    encryption_type = "AES256"
  }

  tags = {
    Name        = "${var.project_name}-cart-service"
    Environment = var.environment
  }
}

# ─────────────────────────────────────────
# ECR REPOSITORY — catalog-service
# ─────────────────────────────────────────
resource "aws_ecr_repository" "catalog_service" {
  name                 = "${var.project_name}/catalog-service"
  image_tag_mutability = "MUTABLE"
  force_delete         = true # allows deleting repo even if it has images (useful for development)

  image_scanning_configuration {
    scan_on_push = true
  }

  encryption_configuration {
    encryption_type = "AES256"
  }

  tags = {
    Name        = "${var.project_name}-catalog-service"
    Environment = var.environment
  }
}

# ─────────────────────────────────────────
# ECR REPOSITORY — order-service
# ─────────────────────────────────────────
resource "aws_ecr_repository" "order_service" {
  name                 = "${var.project_name}/order-service"
  image_tag_mutability = "MUTABLE"
  force_delete         = true # allows deleting repo even if it has images (useful for development)

  image_scanning_configuration {
    scan_on_push = true
  }

  encryption_configuration {
    encryption_type = "AES256"
  }

  tags = {
    Name        = "${var.project_name}-order-service"
    Environment = var.environment
  }
}

# ─────────────────────────────────────────
# ECR REPOSITORY — notification-service
# ─────────────────────────────────────────
resource "aws_ecr_repository" "notification_service" {
  name                 = "${var.project_name}/notification-service"
  image_tag_mutability = "MUTABLE"
  force_delete         = true # allows deleting repo even if it has images (useful for development)

  image_scanning_configuration {
    scan_on_push = true
  }

  encryption_configuration {
    encryption_type = "AES256"
  }

  tags = {
    Name        = "${var.project_name}-notification-service"
    Environment = var.environment
  }
}

# ─────────────────────────────────────────
# ECR REPOSITORY — FRONTEND
# ─────────────────────────────────────────
resource "aws_ecr_repository" "frontend" {
  name                 = "${var.project_name}/frontend"
  image_tag_mutability = "MUTABLE"
  force_delete         = true # allows deleting repo even if it has images (useful for development)
  image_scanning_configuration {
    scan_on_push = true
  }

  encryption_configuration {
    encryption_type = "AES256"
  }

  tags = {
    Name        = "${var.project_name}-frontend"
    Environment = var.environment
  }
}


# ─────────────────────────────────────────
# LIFECYCLE POLICY — auth-service
# keeps only the last 10 images to save cost
# ─────────────────────────────────────────
resource "aws_ecr_lifecycle_policy" "auth_service" {
  repository = aws_ecr_repository.auth_service.name

  policy = jsonencode({
    rules = [{
      rulePriority = 1
      description  = "Keep last 10 images"
      selection = {
        tagStatus   = "any"
        countType   = "imageCountMoreThan"
        countNumber = 10
      }
      action = {
        type = "expire"
      }
    }]
  })
}

# ─────────────────────────────────────────
# LIFECYCLE POLICY — cart-service
# keeps only the last 10 images to save cost
# ─────────────────────────────────────────
resource "aws_ecr_lifecycle_policy" "cart_service" {
  repository = aws_ecr_repository.cart_service.name

  policy = jsonencode({
    rules = [{
      rulePriority = 1
      description  = "Keep last 10 images"
      selection = {
        tagStatus   = "any"
        countType   = "imageCountMoreThan"
        countNumber = 10
      }
      action = {
        type = "expire"
      }
    }]
  })
}

# ─────────────────────────────────────────
# LIFECYCLE POLICY — catalog-service
# keeps only the last 10 images to save cost
# ─────────────────────────────────────────
resource "aws_ecr_lifecycle_policy" "catalog_service" {
  repository = aws_ecr_repository.catalog_service.name

  policy = jsonencode({
    rules = [{
      rulePriority = 1
      description  = "Keep last 10 images"
      selection = {
        tagStatus   = "any"
        countType   = "imageCountMoreThan"
        countNumber = 10
      }
      action = {
        type = "expire"
      }
    }]
  })
}

# ─────────────────────────────────────────
# LIFECYCLE POLICY — order-service
# keeps only the last 10 images to save cost
# ─────────────────────────────────────────
resource "aws_ecr_lifecycle_policy" "order_service" {
  repository = aws_ecr_repository.order_service.name

  policy = jsonencode({
    rules = [{
      rulePriority = 1
      description  = "Keep last 10 images"
      selection = {
        tagStatus   = "any"
        countType   = "imageCountMoreThan"
        countNumber = 10
      }
      action = {
        type = "expire"
      }
    }]
  })
}

# ─────────────────────────────────────────
# LIFECYCLE POLICY — notification-service
# keeps only the last 10 images to save cost
# ─────────────────────────────────────────
resource "aws_ecr_lifecycle_policy" "notification_service" {
  repository = aws_ecr_repository.notification_service.name

  policy = jsonencode({
    rules = [{
      rulePriority = 1
      description  = "Keep last 10 images"
      selection = {
        tagStatus   = "any"
        countType   = "imageCountMoreThan"
        countNumber = 10
      }
      action = {
        type = "expire"
      }
    }]
  })
}


# ─────────────────────────────────────────
# LIFECYCLE POLICY — FRONTEND
# keeps only the last 10 images to save cost
# ─────────────────────────────────────────
resource "aws_ecr_lifecycle_policy" "frontend" {
  repository = aws_ecr_repository.frontend.name

  policy = jsonencode({
    rules = [{
      rulePriority = 1
      description  = "Keep last 10 images"
      selection = {
        tagStatus   = "any"
        countType   = "imageCountMoreThan"
        countNumber = 10
      }
      action = {
        type = "expire"
      }
    }]
  })
}
