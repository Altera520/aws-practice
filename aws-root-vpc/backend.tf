terraform {
  backend "s3" {
    bucket = "altera-infra-states"
    key    = "vpc/terraform.tfstate"
    region = "ap-northeast-2"
  }
}   