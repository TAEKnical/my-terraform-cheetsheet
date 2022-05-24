provider "aws" {
    region = "ap-northeast-2"
    version = "~>3.63"
    profile = "jtlee"
}


terraform {
    required_version = ">= 1.1.0"
    backend "s3" {
        bucket = "terraform-state-jt"
        key    = "path/to/my/key/terraform.tfstate"
        region = "ap-northeast-2"
        dynamodb_table = "TerraformStateLock"
    }
}