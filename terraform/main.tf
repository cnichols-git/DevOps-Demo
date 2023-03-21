terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.59.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
  shared_credentials_files = ["/home/chris/.aws/credentials"]
}

resource "aws_instance" "devops-demo" {
  ami = "ami-0557a15b87f6559cf"
  instance_type = "t2.micro"
  tags = {
    Name = "Ubuntu"
  }
}