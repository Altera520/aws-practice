terraform {
  backend "s3" {
    bucket = "altera-infra-states"
    key = "s3-buckets/terraform.tfstate"
    region = "ap-northeast-2"
  }
}   