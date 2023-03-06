terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "adamordal-test"

    workspaces {
      name = "tf-jenkins"
    }
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.74.0"
    }
  }
}

provider "aws" {
  region = "us-east-2"
  assume_role {
    role_arn = "arn:aws:iam::527458448792:role/ao-jenkins-admin"  
  }
  
}

resource "aws_vpc" "main" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "main"
  }
}