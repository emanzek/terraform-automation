resource "aws_s3_bucket" "bucket" {
  bucket = "emanzek-demo-terraform"

  tags = {
    Name        = "emanzek-demo-terraform"
  }
}
