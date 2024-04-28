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

/*output "sagemaker_app_id" {
  description = "."
  value       = aws_sagemaker_app.this.id
}

output "sagemaker_app_arn" {
  description = "."
  value       = aws_sagemaker_app.this.arn
}*/

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

#---------------------------------------------------
# Sagemaker VPC Outputs
#---------------------------------------------------

output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.vpc.vpc_id
}

output "vpc_arn" {
  description = "The ARN of the VPC"
  value       = module.vpc.vpc_arn
}

output "vpc_cidr_block" {
  description = "The CIDR block of the VPC"
  value       = module.vpc.vpc_cidr_block
}

output "private_subnets" {
  description = "List of IDs of private subnets"
  value       = module.vpc.private_subnets
}

output "private_subnet_arns" {
  description = "List of ARNs of private subnets"
  value       = module.vpc.private_subnet_arns
}

output "private_subnets_cidr_blocks" {
  description = "List of cidr_blocks of private subnets"
  value       = module.vpc.private_subnets_cidr_blocks
}

output "public_subnets" {
  description = "List of IDs of public subnets"
  value       = module.vpc.public_subnets
}

output "public_subnet_arns" {
  description = "List of ARNs of public subnets"
  value       = module.vpc.public_subnet_arns
}

output "public_subnets_cidr_blocks" {
  description = "List of cidr_blocks of public subnets"
  value       = module.vpc.public_subnets_cidr_blocks
}
