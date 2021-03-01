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