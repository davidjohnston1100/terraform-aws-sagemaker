resource "aws_sagemaker_domain" "this" {
  domain_name = var.sagemaker_domain_name
  auth_mode   = var.sagemaker_auth_mode
  vpc_id      = module.vpc.vpc_id
  subnet_ids  = module.vpc.private_subnets

  default_user_settings {
    execution_role = aws_iam_role.sagemaker_execution_role.arn
  }

  retention_policy {
    home_efs_file_system = "Delete"
  }
}

resource "aws_iam_role" "sagemaker_execution_role" {
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

data "aws_iam_policy_document" "assume_role" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["sagemaker.amazonaws.com"]
    }
  }
}

resource "aws_sagemaker_user_profile" "this" {
  domain_id         = aws_sagemaker_domain.this.id
  user_profile_name = var.sagemaker_user_profile_name
}

/*resource "aws_sagemaker_space" "this" {
  domain_id  = aws_sagemaker_domain.this.id
  space_name = "sagemaker-test-space"
}*/

resource "aws_sagemaker_app" "this" {
  domain_id         = aws_sagemaker_domain.this.id
  user_profile_name = aws_sagemaker_user_profile.this.user_profile_name
  app_name          = var.sagemaker_app_name
  app_type          = var.sagemker_app_type
}

resource "aws_sagemaker_code_repository" "example" {
  code_repository_name = var.sagemaker_code_repository_name

  git_config {
    repository_url = var.sagemaker_code_repository_url
  }
}

resource "aws_sagemaker_notebook_instance" "this" {
  name                    = var.sagemaker_notebook_instance_name
  role_arn                = aws_iam_role.sagemaker_execution_role.arn
  instance_type           = var.sagemaker_notebook_instance_type
  platform_identifier     = var.sagemaker_platform_identifier
  volume_size             = var.sagemaker_notebook_instance_value_size
  subnet_id               = module.vpc.private_subnets[0]
  security_groups         = [aws_security_group.sagemaker.id]
  default_code_repository = aws_sagemaker_code_repository.example.code_repository_name
  root_access             = var.sagemaker_notebook_instance_root_access
  kms_key_id              = aws_kms_key.sagemaker.id
  #lifecycle_config_name   = aws_sagemaker_notebook_instance_lifecycle_configuration.this.name
  direct_internet_access = var.sagemaker_notebook_instance_direct_internet_access

  tags = {
    Name = "test-notebook-instance"
  }
}

/*resource "aws_sagemaker_notebook_instance_lifecycle_configuration" "this" {
  name = "example-lifecycle-config"
  on_create = base64encode(<<-EOT
    #!/bin/bash
    set -e
    sudo yum update -y
    sudo yum install -y python3-pip
    sudo pip3 install virtualenv
    virtualenv /home/ec2-user/SageMaker/myenv
    source /home/ec2-user/SageMaker/myenv/bin/activate
    pip install numpy pandas scikit-learn matplotlib
    deactivate
    echo "Environment setup complete."
  EOT
  )

  on_start = base64encode(<<-EOT
    #!/bin/bash

    set -e

    # Log the start time
    echo "Starting notebook at $(date)" >> /home/ec2-user/SageMaker/start-log.txt

    # Update YUM package manager and install a utility package
    sudo yum update -y
    sudo yum install -y htop

    # Check disk space and write it to a log file
    df -h >> /home/ec2-user/SageMaker/disk-space-log.txt

    echo "OnStart script executed successfully."
    EOT
  )
}*/

// terraform security group
resource "aws_security_group" "sagemaker" {
  vpc_id = module.vpc.vpc_id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [module.vpc.vpc_cidr_block]
  }
}

// terraform kms key
resource "aws_kms_key" "sagemaker" {
  description             = "KMS key for sagemaker"
  deletion_window_in_days = 10
  #policy                  = aws_kms_key_policy.sagemaker.policy
}

resource "aws_kms_key_policy" "sagemaker" {
  key_id = aws_kms_key.sagemaker.id
  policy = jsonencode({
    Id = "example"
    Statement = [
      {
        Action = "kms:*"
        Effect = "Allow"
        Principal = {
          AWS = "*"
        }

        Resource = "*"
        Sid      = "Enable IAM User Permissions"
      },
    ]
    Version = "2012-10-17"
  })
  depends_on = [aws_kms_key.sagemaker]
}
