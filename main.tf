resource "aws_sagemaker_domain" "this" {
  domain_name = var.sagemaker_domain_name
  auth_mode   = var.sagemaker_auth_mode
  vpc_id      = var.sagemaker_vpc_id
  subnet_ids  = var.sagemaker_subnet_ids

  default_user_settings {
    execution_role = ""
  }
}

resource "aws_sagemaker_app" "this" {
  domain_id         = aws_sagemaker_domain.this.id
  user_profile_name = aws_sagemaker_user_profile.this.user_profile_name
  app_name          = var.sagemaker_app_name
  app_type          = var.sagemker_app_type
}

resource "aws_sagemaker_user_profile" "this" {
  domain_id         = aws_sagemaker_domain.this.id
  user_profile_name = var.sagemaker_user_profile_name
}

/*resource "aws_sagemaker_code_repository" "this" {
  count = var.sagemaker_code_repository_count

  code_repository_name = var.sagemaker_code_repository_name #"my-notebook-instance-code-repo"

  git_config {
    repository_url = var.sagemaker_code_repository_url  #"https://github.com/hashicorp/terraform-provider-aws.git"
  }
}

resource "aws_sagemaker_notebook_instance" "this" {
  count = var.sagemaker_notebook_instance_count

  name                    = var.sagemaker_notebook_instance_name #"my-notebook-instance"
  role_arn                = var.sagemaker_role_arn #aws_iam_role.role.arn
  instance_type           = var.sagemaker_notebook_instance_type #"ml.t2.medium"
  default_code_repository = var.sagemaker_default_code_repository #aws_sagemaker_code_repository.this.code_repository_name
}*/
