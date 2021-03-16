# 1)Повторить самостоятельно демо, которое показывал на уроке(создать launch template, асг, балансировщик, security groups и развернуть приложение)
***
##### 1.1) Создаем Launch Template

***
```
 aws ec2 create-launch-template \
   --launch-template-name Devops-lt \
   --version-description Devops-lt-test \
   --launch-template-data '{"NetworkInterfaces":[{"AssociatePublicIpAddress":true,"DeviceIndex":0,"Groups":["sg-0a95397248301a00a"],"SubnetId":"subnet-cd4ed6ec"}],"ImageId":"ami-042e8287309f5df03","InstanceType":"t2.micro","TagSpecifications":[{"ResourceType":"instance","Tags":[{"Key":"Devops","Value":"DevOps1"}]}]}'
```
###### Вывод команды:
```
LaunchTemplate:
  CreateTime: '2021-03-15T11:52:55+00:00'
  CreatedBy: arn:aws:iam::643591580781:root
  DefaultVersionNumber: 1
  LatestVersionNumber: 1
  LaunchTemplateId: lt-096babfe9857882dd
  LaunchTemplateName: Devops-lt
```
##### 1.2) ACR
```
aws autoscaling create-auto-scaling-group --auto-scaling-group-name Devops-asg --launch-template "LaunchTemplateName=Devops-lt,Version=1" --min-size 1 --max-size 3 --vpc-zone-identifier "subnet-cd4ed6ec"
```
##### 1.3) Load Balancer
```
aws elbv2 create-load-balancer --name Devops-alb --subnets subnet-cd4ed6ec subnet-cd3b6cc3
```
###### Вывод команды
```
LoadBalancers:
 - AvailabilityZones:
  - LoadBalancerAddresses: []
    SubnetId: subnet-cd3b6cc3
    ZoneName: us-east-1f
  - LoadBalancerAddresses: []
    SubnetId: subnet-cd4ed6ec
    ZoneName: us-east-1d
  CanonicalHostedZoneId: Z35SXDOTRQ7X7K
  CreatedTime: '2021-03-15T12:17:10.230000+00:00'
  DNSName: Devops-alb-1205858429.us-east-1.elb.amazonaws.com
  IpAddressType: ipv4
  LoadBalancerArn: arn:aws:elasticloadbalancing:us-east-1:643591580781:loadbalancer/app/Devops-alb/2ca85a811ff47c6e
  LoadBalancerName: Devops-alb
  Scheme: internet-facing
  SecurityGroups:
  - sg-c30cf6ce
  State:
   Code: provisioning
  Type: application
  VpcId: vpc-1038966d
  ```
  ##### 1.4) Security group
  ```
  aws ec2 create-security-group --group-name my-sg --description "devops-cli-sg" --profile jennysiq
  aws ec2 authorize-security-group-ingress --group-id sg-0a95397248301a00a --protocol tcp --port 22 --cidr 87.252.254.202/24
```
```
Вывод:
- Description: devops-cli-sg
  GroupId: sg-0a95397248301a00a
  GroupName: my-sg
  IpPermissions:
  - FromPort: 22
    IpProtocol: tcp
    IpRanges:
    - CidrIp: 87.252.254.0/24
    Ipv6Ranges: []
    PrefixListIds: []
    ToPort: 22
    UserIdGroupPairs: []
  IpPermissionsEgress:
  - IpProtocol: '-1'
    IpRanges:
    - CidrIp: 0.0.0.0/0
    Ipv6Ranges: []
    PrefixListIds: []
    UserIdGroupPairs: []
  OwnerId: '643591580781'
  VpcId: vpc-1038966d
  ```
  # 2)Настроить ASG на скейлинг в зависимости от нагрузки и сделать оповещения на почту
     Done!
  # 3)Сделать нагрузочное тестирование и посмотреть: как увеличиваются и уменьшаются инстансы
     using Jmeter the number of instances increased from 1 to 3
  # 4) Обернуть 1 пункт в баш скрипт
     Check AWS.sh 