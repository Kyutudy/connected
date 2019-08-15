source = "../../modules/vpc"

name = "connected-vpc-kyunam"

cidr = ""

azs = ["ap-northeast-2a", "ap-northeast-2c"]

public_subnets = []

private_subnets = []

database_subnets = []

tags = {
  "TerraformManaged" = "true"
  "Creator"          = "KYUNAM"
}

keypair_name = "tram-aws-key"

ingress_cidr_blocks = []

bastion_name = "connected-bastion-kyunam"

bastion_tags = {
  "TerraformManaged" = "true"
  "Creator"          = "KYUNAM"
}
