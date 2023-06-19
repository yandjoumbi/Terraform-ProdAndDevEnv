provider "aws" {
  region = "us-west-1"
}

terraform {
  backend "s3" {
    bucket  = "terraform-state-ydjoumbi"
    key     = "Deployments/global/global.tfstate"
    region  = "us-west-1"
    encrypt = true
  }
}

module "s3" {
  source = "../../Modules/s3"
  bucket_name = "ydjoumbi-us-west-1-elb-access-logs"
  environment = "prod"
  enable_encryption = true
  enable_versioning = false
  account_id = "597647611698"
}