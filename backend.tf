terraform {
  backend "s3" {
    bucket         = "s3-eg-bucket-09"
    key            = "dev/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-remote-table"
    encrypt        = true
  }
}