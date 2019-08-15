# Bastion Instance 생성 모듈

## Inputs

| Name                | Description                                 |  Type  |   Default   | Required |
| ------------------- | ------------------------------------------- | :----: | :---------: | :------: |
| availability_zone   | bastion EC2 instance availability zone      | string |     n/a     |   yes    |
| ingress_cidr_blocks | bastion SSH 접속을 허용할 CIDR block 리스트 |  list  |     n/a     |   yes    |
| instance_type       | bastion EC2 instance type                   | string | `"t2.nano"` |    no    |
| keypair_name        | bastion이 사용할 keypair name               | string |     n/a     |   yes    |
| name                | 모듈에서 정의하는 모든 리소스 이름의 prefix | string |     n/a     |   yes    |
| subnet_id           | bastion EC2 instance Subnet ID              | string |     n/a     |   yes    |
| tags                | 모든 리소스에 추가되는 tag 맵               |  map   |     n/a     |   yes    |
| vpc_id              | VPC ID                                      | string |     n/a     |   yes    |

## Outputs

| Name       | Description |
| ---------- | ----------- |
| bastion_id | BASTION ID  |
