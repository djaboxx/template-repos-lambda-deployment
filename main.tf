terraform {
  required_version = ">= 1.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

module "template_automation" {
  source = "../terraform-aws-template-automation"

  name_prefix = "${var.namespace}-${var.environment}-${var.stage}"
  
  github_api_url = "https://api.github.com"
  github_org_name = "HappyPathway"
  template_repo_name = "template-automation-lambda"
  template_config_file = "config.json"
  github_commit_author_name = "Template Automation"
  github_commit_author_email = "automation@happypathway.com"
  
  # GitHub token configuration from AWS Secrets Manager
  github_token = {
    secret_name = "github/token"
  }

  # Lambda configuration using container image
  lambda_config = {
    memory_size = 512
    timeout     = 300
    environment_variables = {
      LOG_LEVEL = "INFO"
    }
    image_uri = "123456789012.dkr.ecr.us-west-2.amazonaws.com/template-automation-lambda:latest"
  }

  tags = var.tags
}
