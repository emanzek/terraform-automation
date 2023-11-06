module "stage" {
  source = "../../modules/ec2"

  environment = "staging"
  project_name = var.project_name
  availability_zone = "ap-southeast-1a"
  instance_type = "t2.micro"

}
