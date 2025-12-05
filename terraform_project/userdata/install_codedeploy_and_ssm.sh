#!/bin/bash
set -e
# update
apt-get update -y

# install SSM agent (for Ubuntu)
snap install amazon-ssm-agent --classic || apt-get install -y amazon-ssm-agent || true
systemctl enable amazon-ssm-agent
systemctl start amazon-ssm-agent

# install CodeDeploy agent (example for Ubuntu)
cd /tmp
wget https://aws-codedeploy-${AWS_REGION}.s3.${AWS_REGION}.amazonaws.com/latest/install -O install_codedeploy
chmod +x ./install_codedeploy
./install_codedeploy auto
systemctl enable codedeploy-agent || true
systemctl start codedeploy-agent || true
