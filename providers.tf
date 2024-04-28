provider "aws" {
  default_tags {
    tags = {
      Environment = "Test"
      Project     = "Test_Infrastructure"
    }
  }
}
