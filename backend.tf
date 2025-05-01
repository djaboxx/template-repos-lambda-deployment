terraform {
  backend "s3" {
    key = "template-repos-lambda-deployment/terraform.tfstate"
  }
}
