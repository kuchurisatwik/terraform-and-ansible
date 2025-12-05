# terraform/codedeploy.tf
resource "aws_codedeploy_app" "backend_app" {
  name = "fooddelivery-backend-app-${var.env}"
  compute_platform = "Server"
}

resource "aws_codedeploy_deployment_group" "dg" {
  app_name               = aws_codedeploy_app.backend_app.name
  deployment_group_name  = "fooddelivery-dg-${var.env}"
  service_role_arn       = aws_iam_role.codedeploy_service_role.arn
  autoscaling_groups     = [aws_autoscaling_group.app_asg.id]
  deployment_config_name = "CodeDeployDefault.OneAtATime"
}
