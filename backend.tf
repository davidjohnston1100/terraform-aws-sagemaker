terraform {
  backend "s3" {
    bucket         = "terraform-pipeline-deployement-backend-state-bucket-us-east-2"
    key            = "terraform-state-key"
    region         = "us-east-2"
    dynamodb_table = "terraform-state-lock"
    encrypt        = true
  }
}
