variable "project_name" {
  description = "Name of the project"
  type = string
}
variable "availability_zone" {
  description = "Zone of the instances"
  type = string
}
variable "environment" {
  description = "Name of the environment"
  type = string
}
variable "instance_type" {
  description = "Type of EC2 instance"
  type = string
}