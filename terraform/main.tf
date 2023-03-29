# DO NOT put the access keys in the code. Always use a secrets file or other method
# Creating the provider and providing access to the credentials 
provider "aws" {
  region                   = "us-east-1"
  shared_credentials_files = ["/home/chris/.aws/credentials"]
}

# The steps:
#1. Create VPC
resource "aws_vpc" "main" {
  cidr_block       = "10.0.0.0/24"
  instance_tenancy = "default"

  tags = {
    Name = "main"
  }
}

# This section is all about the Network

# 2. Create Internet Gateway
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "main"
  }
}
# 3. Create Custom route table
resource "aws_route_table" "prod_route_table" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  route {
    ipv6_cidr_block = "::/0"
    gateway_id      = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "main"
  }
}
# 4. Create subnet
resource "aws_subnet" "subnet_1" {
  vpc_id           = aws_vpc.main.id
  cidr_block       = "10.0.0.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "prod_subnet"
  }
}
# 5. Associate subnet with route table
resource "aws_route_table_association" "prod_route" {
  subnet_id      = aws_subnet.subnet_1.id
  route_table_id = aws_route_table.prod_route_table.id
}
# 6. Create Security Group to allow ports 22,80 and 443
resource "aws_security_group" "allow_web" {
  name        = "allow_web_traffice"
  description = "Allow TLS inbound web traffic"
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }


  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_web"
  }
}
# 7. Create a network interface with an ip in the subnet that was created in step 4
resource "aws_network_interface" "main_network_interface" {
  subnet_id       = aws_subnet.subnet_1.id
  private_ips     = ["10.0.0.40"]
  security_groups = [aws_security_group.allow_web.id]

  # attachment {
  #   instance     = aws_instance.test.id
  #   device_index = 1
  # }
}
# 8. Assign an elastic IP to the network interface created in step
resource "aws_eip" "one" {
  vpc                       = true
  network_interface         = aws_network_interface.main_network_interface.id
  associate_with_private_ip = "10.0.0.40"
  depends_on                = [aws_internet_gateway.gw]
}
# 9. Create Ubuntu server and install/enable ngnix
resource "aws_instance" "web_server_instance" {
  ami               = "ami-0557a15b87f6559cf"
  instance_type     = "t2.micro"
  availability_zone = "us-east-1a"
  key_name          = "devops_demo_key"

  network_interface {
    device_index         = 0
    network_interface_id = aws_network_interface.main_network_interface.id
  }

  user_data = <<-EOF
                #!/bin/bash
                sudo apt update -y
                sudo apt install apache2 -y
                sudo systemctl start apache2
                sudo bash -c 'echo your very first web server > /var/www/html/index.html'
                EOF
  tags = {
    Name = "web-server"
  }
}
