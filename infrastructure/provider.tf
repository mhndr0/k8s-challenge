terraform {
    required_version = ">=0.12"
    required_providers {
        aws        = ">= 3.50.0"
        local      = ">= 1.4"
        random     = ">= 2.1"
        kubernetes = "~> 1.11"
    }
    backend "s3" {
        key             = "dev/eks-stack.tfstate"
        region          = "eu-central-1"
        bucket          = "k8s-terraform-state-challenge"
        #dynamodb_table = "" # Uncommect to specify state lock table
        encrypt         = true
    }
}

provider "aws" {
    region              = var.region
}

provider "aws" {
    region              = "us-east-1"
    alias               = "acl"
}