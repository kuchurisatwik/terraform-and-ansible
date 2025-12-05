# terraform/storage_and_iam.tf
resource "aws_s3_bucket" "artifact_bucket" {
  bucket = "food-delivery-artifacts-${var.env}-${data.aws_caller_identity.current.account_id}"
  acl  = "private"

  versioning { enabled = true }
  tags = { Name = "food-delivery-artifacts" }
}

data "aws_caller_identity" "current" {}
