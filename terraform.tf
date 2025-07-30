terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }

#   backend "s3" {
#     bucket = "${var.bucket_name}-infra-app-remote-backend"
#     key    = "path/to/my/key"
#     region = "us-east-1"
#   }

}


