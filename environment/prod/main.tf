module "stage" {
  source = "../../modules/ec2"

  environment = "production"
  project_name = var.project_name
  availability_zone = "ap-southeast-1b"
  instance_type = "t3.micro"

}
