# terraform/provider.tf
provider "aws" {
  region = var.aws_region
}
variable "aws_region" { default = "us-east-1" }
variable "env" { default = "dev" }
