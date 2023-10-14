#---------------------------------------------------
# AWS Sagemaker domain
#---------------------------------------------------

output "sagemaker_domain_id" {
  description = "."
  value       = aws_sagemaker_domain.this.id
}

output "sagemaker_domain_arn" {
  description = "."
  value       = aws_sagemaker_domain.this.arn
}

output "sagemaker_domain_url" {
  description = "."
  value       = aws_sagemaker_domain.this.url
}

#---------------------------------------------------
# AWS Sagemaker app
#---------------------------------------------------

output "sagemaker_app_id" {
  description = "."
  value       = aws_sagemaker_app.this.id
}

output "sagemaker_app_arn" {
  description = "."
  value       = aws_sagemaker_app.this.arn
}

#---------------------------------------------------
# AWS Sagemaker user profile
#---------------------------------------------------

output "sagemaker_user_profile_id" {
  description = "."
  value       = aws_sagemaker_user_profile.this.id
}

output "sagemaker_user_profile_arn" {
  description = "."
  value       = aws_sagemaker_user_profile.this.arn
}

#---------------------------------------------------
# AWS Sagemaker notebook instance
#---------------------------------------------------

/*output "sagemaker_notebook_instance_id" {
  description = "."
  value       = aws_sagemaker_notebook_instance.this.id
}

output "sagemaker_notebook_instance_arn" {
  description = "."
  value       = aws_sagemaker_notebook_instance.this.arn
}

output "sagemaker_notebook_instance_url" {
  description = "."
  value       = aws_sagemaker_notebook_instance.this.url
}

#---------------------------------------------------
# AWS Sagemaker code repository
#---------------------------------------------------

output "sagemaker_code_repository_id" {
  description = "."
  value       = aws_sagemaker_code_repository.this.id
}

output "sagemaker_code_repository_arn" {
  description = "."
  value       = aws_sagemaker_code_repository.this.arn
}*/
