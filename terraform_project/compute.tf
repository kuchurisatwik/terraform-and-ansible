# terraform/compute.tf (simplified)
resource "aws_launch_template" "app_lt" {
  name_prefix   = "fooddelivery-lt-"
  image_id      = var.ami_id
  instance_type = "t3.micro"
  iam_instance_profile { name = aws_iam_instance_profile.ec2_profile.name }
  user_data = base64encode(file("${path.module}/userdata/install_codedeploy_and_ssm.sh"))
  tag_specifications {
    resource_type = "instance"
    tags = { Name = "fooddelivery-app-${var.env}" }
  }
}
resource "aws_autoscaling_group" "app_asg" {
  name                      = "fooddelivery-asg-${var.env}"
  max_size                  = 2
  min_size                  = 1
  desired_capacity          = 1

  launch_template {
    id      = aws_launch_template.app_lt.id
    version = "$Latest"
  }

  tag {
    key                 = "Name"
    value               = "fooddelivery-app"
    propagate_at_launch = true
  }
}

