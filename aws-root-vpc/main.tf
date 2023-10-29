resource "aws_eip" "nat" {
  domain = "vpc"
}


module "vpc-data-development" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.1.2"
  name    = "vpc-data-development"
  cidr    = "10.2.0.0/16"

  azs = ["${local.region}a", "${local.region}b", "${local.region}c"]

  public_subnets = [
    "10.2.1.0/24"
  ]

  private_subnets = [
    "10.2.2.0/24"
  ]

  enable_nat_gateway  = true
  single_nat_gateway  = true # allocate 1 IP
  reuse_nat_ips       = true # skip creation of EIP for the NAT G/W
  external_nat_ip_ids = aws_eip.nat.*.id

  tags = {
    Name        = "vpc-data-development"
    Environment = "dev"
    created_by  = "terraform"
  }
}

data "aws_ami" "amzn_linux" {
    most_recent = true
    owners = ["amazon"]
    filter {
      name = "name"
      values = ["al2023-ami-2023.*-x86_64"]
    }
}

resource "aws_instance" "public-ec2" {
    ami = data.aws_ami.amzn_linux.id
    instance_type = t2.micro
}

resource "aws_instance" "private-ec2" {
    ami = data.aws_ami.amzn_linux.id
    instance_type = t2.micro
}