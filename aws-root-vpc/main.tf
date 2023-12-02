


module "module-vpc" {
  source = "./module-vpc"
  region = "ap-northeast-1"
  tags = local.tags
}
