provider "aws" {
  region = ""
  access_key = ""
  secret_key = ""
}

#tag will add metadate to id the resource instance#
#tags = {
#  Name = "Ubuntu"
#}

#tags can also be in the resource#
resource "aws_instance" "devops-demo" {
  ami = ""
  instance_type = ""
  tags = {
    Name = "Ubuntu"
  }
}