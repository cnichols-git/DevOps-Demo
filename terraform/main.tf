terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.59.0"
    }
  }
}

provider "aws" {
  region = "us-east-2"
  access_key = "AKIAW3D33ZGX4MTGOUPZ"
  secret_key = "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"
}
