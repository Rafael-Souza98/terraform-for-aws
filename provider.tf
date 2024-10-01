provider "aws" {
  region = "us-east-2"
  default_tags {
    tags = {
      Owner                  = "rafael"
      "Managed by Terraform" = true
    }
  }
}