# VPC 리소스 생성 코드

AWS Provider 기준 코드

## Installation

사전에 VPC, EC2, RDS 관련 권한이 필요합니다.

필요한 권한

- `VPCFullAccess`
- `RDSFullACcess`
- `AmazonEC2FullAccess`

Instance Profile을 활용해 생성도 가능하고
Access Key를 발급해 사용이 가능합니다.

직접 키 값을 넣어 사용하는 경우

```
provider "aws" {
  region     = "ap-northeast-2"
  access_key = "anaccesskey"
  secret_key = "asecretkey"
}
```

환경 변수를 이용한 설정

```
export AWS_ACCESS_KEY_ID="anaccesskey"
export AWS_SECRET_ACCESS_KEY="asecretkey"
export AWS_DEFAULT_REGION="ap-northeast-2"
```

## Usage

아래 명령어를 순차적으로 실행 해 Vpc, Subnet, Bastion(NAT)의 리소스들을 생성합니다.

```bash
$ terraform init
$ terraform plan -var-file=vpc.tfvars
$ terraform apply -var-file=vpc.tfvars
```

## Inputs

| Name                | Description                                 |  Type  |   Default   | Required |
| ------------------- | ------------------------------------------- | :----: | :---------: | :------: |
| azs                 | 사용할 availability zones 리스트            |  list  |     n/a     |   yes    |
| bastion_name        | 모듈에서 정의하는 모든 리소스 이름의 prefix | string |     n/a     |   yes    |
| bastion_tags        | 모든 리소스에 추가되는 tag 맵               |  map   |     n/a     |   yes    |
| cidr                | VPC에 할당한 CIDR block                     | string |     n/a     |   yes    |
| database_subnets    | Database Subnet IP 리스트                   |  list  |     n/a     |   yes    |
| ingress_cidr_blocks | bastion SSH 접속을 허용할 CIDR block 리스트 |  list  |     n/a     |   yes    |
| instance_type       | bastion EC2 instance type                   | string | `"t2.nano"` |    no    |
| keypair_name        | bastion이 사용할 keypair name               | string |     n/a     |   yes    |
| name                | 모듈에서 정의하는 모든 리소스 이름의 prefix | string |     n/a     |   yes    |
| private_subnets     | Private Subnet IP 리스트                    |  list  |     n/a     |   yes    |
| public_subnets      | Public Subnet IP 리스트                     |  list  |     n/a     |   yes    |
| tags                | 모든 리소스에 추가되는 tag 맵               |  map   |     n/a     |   yes    |


### 참고자료

Vpc 모듈과 Bastion을 생성하는 terraform code는 ausbubam님의 블로그를 참고하였습니다.

[ausbubam blog](https://blog.2dal.com/2017/10/28/aws-vpc-with-terraform-modules/)
