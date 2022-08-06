terraform {
  cloud {
    organization = "Branden"
    hostname     = "app.terraform.io"

    workspaces {
      tags = ["dev"]
    }
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.24.0"
    }
  }
}

provider "aws" {
  region     = var.aws_region
  access_key = var.aws_access_key_id
  secret_key = var.aws_secret_access_key
  default_tags {
    tags = {
      env     = var.env
      project = var.project_name
    }
  }
}