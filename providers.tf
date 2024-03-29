locals {
  repository = "AWS_NetworkSetup_Terraform"
}

provider "aws" {
  region = "eu-west-1"
  default_tags {
    tags = {
      repository = local.repository
    }
  }

  # Make it faster by skipping something
  #  skip_get_ec2_platforms      = true
  #  skip_metadata_api_check     = true
  #  skip_region_validation      = true
  #  skip_credentials_validation = true
  #  skip_requesting_account_id  = true
}
