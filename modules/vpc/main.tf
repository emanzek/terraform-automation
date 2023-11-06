resource "aws_vpc" "main" {
  cidr_block = "172.16.0.0/16"

  tags = {
    Name = format("%s-%s",var.project_name,"vpc")
  }
}

resource "aws_subnet" "single_subnet" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "172.16.10.0/24"
  availability_zone = var.availability_zones
  map_public_ip_on_launch = true

  tags = {
    Name = format("%s-%s",var.project_name,"subnet")    
  }
}

resource "aws_security_group" "test_expo" {
  name        = "testing expose"
  description = "attempting exposing server"
  vpc_id      = aws_vpc.main.id

  ingress {
    description      = "HTTP from Public"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  ingress {
    description      = "SSH from Public"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  } 

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_http"
  }
}
