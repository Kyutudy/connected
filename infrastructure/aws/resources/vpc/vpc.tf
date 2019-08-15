module "aws_vpc" {
  source = "../../modules/vpc"

  name = var.name

  # VPC의 CIDR block을 정의한다.
  cidr = var.cidr

  # VPC가 사용할 AZ를 정의한다.
  azs = var.azs

  # VPC의 Public Subnet CIDR block을 정의한다.
  public_subnets = var.public_subnets

  # VPC의 Private Subnet CIDR block을 정의한다.
  private_subnets = var.private_subnets

  # VPC의 Private DB Subnet CIDR block을 정의한다. (RDS를 사용하지 않으면 이 라인은 필요없다.)
  database_subnets = var.database_subnets

  bastion_id = module.aws_bastion.bastion_id

  # VPC module이 생성하는 모든 리소스에 기본으로 입력될 Tag를 정의한다.
  tags = var.tags
}

module "aws_bastion" {
  source = "../../modules/nat_bastion"

  name = var.bastion_name

  vpc_id = module.aws_vpc.vpc_id

  instance_type     = var.instance_type
  availability_zone = var.azs[0]
  subnet_id         = module.aws_vpc.public_subnets_ids[0]

  default_security_group_id = module.aws_vpc.default_security_group_id

  keypair_name = var.keypair_name

  ingress_cidr_blocks = var.ingress_cidr_blocks

  tags = var.bastion_tags
}

