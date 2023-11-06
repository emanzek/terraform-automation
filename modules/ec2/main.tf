module "vpc" {
  source = "../vpc"
  project_name = var.project_name
  availability_zones = var.availability_zone
}

locals {
  ami_id = "ami-078c1149d8ad719a7"
  key_pair = "deployer-key"
  http_port = 80
}


resource "aws_instance" "frontend" {
  ami           = local.ami_id
  instance_type = var.instance_type
  subnet_id = module.vpc.subnet_id
  key_name = local.key_pair
  security_groups = [module.vpc.security_group_id]

  user_data = templatefile("${path.module}/user-data.sh",{
    server_port = local.http_port
    server_type = "frontend"
  })

  tags = {
    Name = format("%s-%s",var.project_name,"frontend"),
    Project = var.project_name,
    Environment = var.environment
  }
}

resource "aws_instance" "backend" {
  ami           = local.ami_id
  instance_type = var.instance_type
  subnet_id = module.vpc.subnet_id
  key_name = local.key_pair
  security_groups = [module.vpc.security_group_id]

  user_data = templatefile("${path.module}/user-data.sh",{
    server_port = local.http_port
    server_type = "backend"
  })

  tags = {
    Name = format("%s-%s",var.project_name,"backend"),
    Project = var.project_name,
    Environment = var.environment
  }
}

resource "aws_instance" "bastion" {
  ami           = local.ami_id
  instance_type = var.instance_type
  subnet_id = module.vpc.subnet_id
  key_name = local.key_pair
  security_groups = [module.vpc.security_group_id]

  user_data = templatefile("${path.module}/user-data.sh",{
    server_port = local.http_port
    server_type = "bastion"
  })

  tags = {
    Name = format("%s-%s",var.project_name,"bastion"),
    Project = var.project_name,
    Environment = var.environment
  }
}