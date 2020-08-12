
terraform {
  required_version = ">= 0.12.29"
  required_providers {
    aws = ">= 3.0"
  }
}

data aws_caller_identity current {}

data aws_region current {}