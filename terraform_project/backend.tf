# terraform/backend.tf
terraform {
  backend "s3" {
    bucket         = "tf-state-food-delivery-<your-suffix>"
    key            = "food-delivery/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "tf-lock-food-delivery"
  }
}
