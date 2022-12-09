terraform {
  required_version = "1.3.5"
}

provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile
  access_key = ""
  secret_key = ""

  default_tags {
    tags = {
      Project   = "Proyecto IaC con Terraform para Cloud Computing"
      CreatedAt = "2022-12-08"
      ManagedBy = "Terraform"
      Owner     = "Hector Ivan Palacio Rivas"
      Env       = var.env
    }
  }
}
