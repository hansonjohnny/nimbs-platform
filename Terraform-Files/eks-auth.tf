# ─────────────────────────────────────────
# EKS ACCESS ENTRY — worker nodes
# ─────────────────────────────────────────
resource "aws_eks_access_entry" "nodes" {
  cluster_name  = aws_eks_cluster.main.name
  principal_arn = aws_iam_role.eks_nodes.arn
  type          = "EC2_LINUX"

  depends_on = [aws_eks_cluster.main]
}

# ─────────────────────────────────────────
# EKS ACCESS ENTRY — your IAM user
# for kubectl access from your machine
# ─────────────────────────────────────────
resource "aws_eks_access_entry" "admin" {
  cluster_name  = aws_eks_cluster.main.name
  principal_arn = "arn:aws:iam::${var.aws_account_id}:user/${var.iam_admin_user}"
  type          = "STANDARD"

  depends_on = [aws_eks_cluster.main]
}

resource "aws_eks_access_policy_association" "admin" {
  cluster_name  = aws_eks_cluster.main.name
  principal_arn = "arn:aws:iam::${var.aws_account_id}:user/${var.iam_admin_user}"
  policy_arn    = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"

  access_scope {
    type = "cluster"
  }

  depends_on = [aws_eks_access_entry.admin]
}