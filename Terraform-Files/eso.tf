# ─────────────────────────────────────────
# EXTERNAL SECRETS OPERATOR
# syncs AWS Secrets Manager → K8s secrets
# ─────────────────────────────────────────
resource "helm_release" "external_secrets" {
  name       = "external-secrets"
  repository = "https://charts.external-secrets.io"
  chart      = "external-secrets"
  namespace  = "external-secrets"
  version    = "0.9.11"

  create_namespace = true

  set {
    name  = "serviceAccount.annotations.eks\\.amazonaws\\.com/role-arn"
    value = aws_iam_role.external_secrets.arn
  }

  depends_on = [
    aws_eks_node_group.main,
    aws_iam_role.external_secrets
  ]
}