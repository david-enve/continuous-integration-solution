provider "aws" {
  region = "${var.region}"
}

# terraform bucket state definition 
terraform {
  backend "s3" {
    bucket = "devops-lab-tf-state"
    key = "devopslab/devops-dev-tf-state"
    region = "us-east-1"
  }
}
