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
  access_key = "xxx"
  secret_key = "xxx"
}

resource "aws_instance" "devops-demo" {
  ami = "ami-00eeedc4036573771"
  instance_type = "t2.micro"
  tags = {
    Name = "Ubuntu"
  }
}