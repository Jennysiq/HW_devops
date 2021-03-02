# 1)Создать iam юзера с пермишнами - создание инстансов, security groups и s3 бакетов (создать свою полиси и приаттачить ее к юзеру)
***
Create user and policy 
* IAM
* Users
* Add user
* Policies
* Create policy
* Add permission EC2, CloudWatch, S3 bucket

* ![created_user](https://user-images.githubusercontent.com/61979170/109503673-9a339480-7aab-11eb-99a7-607cf019d1c1.jpg)

* ![image](https://user-images.githubusercontent.com/61979170/109504124-3bbae600-7aac-11eb-9f0b-096b2004a130.png)

# 2) Развернуть инстанс открыв 22 и 80,443 порты наружу
***
* EC2
* Instances
* Launch instance
* Free tier only and select Ubuntu server 20.04
* t2.micro
* select Availability Zone
* default storage
* add tags
* configure Security Group
* add HTTP(80) HTTPS(443) SSH(22)

# 3) Используя ансибл установить nginx и проверить доступность со своего компьютера
* Configure file host in /etc/ansible/hosts
* add test_servers_group and IP address
### Check playbook.yml

# 4)Создать s3 бакет, разместить в него веб-сайт, проверить доступность со своего компьютера
 ***
 LINK : https://aws.amazon.com/ru/getting-started/projects/build-serverless-web-app-lambda-apigateway-s3-dynamodb-cognito/module-1/
 ***
 ![image](https://user-images.githubusercontent.com/61979170/109613855-cd753280-7b42-11eb-9184-9d06877579cd.png)

# 5) Установить AWS SDK и через aws-cli повторить пункт 2 и 4, используя креды юзера, которого создали
***
### Create EC2 with AWS CLI
aws ec2 run-instances --image-id ami-0928f4202481dfdf6 --count 1 --instance-type t2.micro --security-group-ids sg-00fd386e3aceeaa7b
### Create s3 bucket with a website in it
* aws s3api create-bucket --bucket test-jennysiq --region us-east-1 --acl public-read 
* aws s3 cp ~/site/jobboard2/ s3://test-jennysiq --recursive 
* aws s3 website s3://test-jennysiq/ --index-document index.html
* aws s3api put-bucket-policy --bucket test-jennysiq --policy file://bp.json

# 6) Написать баш скрипт, который будет делать пункт 2 и 4
### Check script "aws_bucket.sh" 

