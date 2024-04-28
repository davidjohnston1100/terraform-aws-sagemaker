################################################################################
# Sagemaker Domain 
################################################################################

variable "sagemaker_domain_name" {
  description = "Sagemaker domain name."
  type        = string
  default     = "test-domain"
}

variable "sagemaker_auth_mode" {
  description = "."
  type        = string
  default     = "IAM"
}

variable "sagemaker_vpc_id" {
  description = "."
  type        = string
  default     = ""
}

variable "sagemaker_subnet_ids" {
  description = "."
  type        = list(string)
  default     = []
}

variable "sagemaker_execution_role" {
  description = "."
  type        = string
  default     = ""
}

################################################################################
# Sagemaker app 
################################################################################

variable "sagemaker_domain_id" {
  description = "."
  type        = string
  default     = ""
}

variable "sagemaker_app_name" {
  description = "."
  type        = string
  default     = "test-app"
}

variable "sagemker_app_type" {
  description = "."
  type        = string
  default     = "JupyterServer"
}

################################################################################
# Sagemaker user profile
################################################################################

variable "sagemaker_user_profile_name" {
  description = "."
  type        = string
  default     = "test-user-profile"
}

################################################################################
# Sagemaker notebook instance 
################################################################################

variable "sagemaker_notebook_instance_name" {
  description = "."
  type        = string
  default     = ""
}

variable "sagemaker_notebook_instance_type" {
  description = "."
  type        = string
  default     = ""
}

variable "sagemaker_default_code_repository" {
  description = "."
  type        = string
  default     = ""
}

variable "sagemaker_notebook_instance_count" {
  description = "."
  type        = number
  default     = 0
}

################################################################################
# Sagemaker code repository
################################################################################

variable "sagemaker_code_repository_name" {
  description = "."
  type        = string
  default     = ""
}

variable "sagemaker_code_repository_url" {
  description = "."
  type        = string
  default     = ""
}

variable "sagemaker_code_repository_count" {
  description = "."
  type        = number
  default     = 0
}
