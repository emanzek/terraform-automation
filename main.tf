terraform {
  required_version = ">= 1.0.0, < 2.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }

  backend "s3" {
    bucket = "terraform-pulsifi"
    key = "data/terraform.tfstate"
    region = "ap-southeast-1"
  }
}

provider "aws" {
  region = "ap-southeast-1"
}

###
## Uncomment this part to deploy s3
###

module "s3" {
  source = "./modules/s3/"
}

###
## Uncomment this part to deploy staging environment
###

module "staging" {
  source = "./environment/stage/"
  project_name = var.project_name
}

###
## Uncomment this part to deploy production environment
###

# module "production" {
#   source = "./environment/prod/"
#   project_name = var.project_name
# }