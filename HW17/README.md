# 1) Установить для диска с домашними папками квоту для пользователя системы в 100 Мб мягкую.
### RESULT
***
* sudo apt install quota
* quota --version
* find /lib/modules/`uname -r` -type f -name '*quota_v*.ko*'
* sudo vi /etc/fstab
* sudo mount -o remount /home
* sudo mount | grep quota
* /dev/sda9 on /home type ext4 (rw,relatime,quota,usrquota,grpquota)

* sudo quotacheck -favugm
* sudo quotaon -avug
* /dev/sda9 [/home]: group quotas turned on
* /dev/sda9 [/home]: user quotas turned on
* sudo edquota -u jennysiq
* Disk quotas for user jennysiq (uid 1000):
*   Filesystem                   blocks       soft       hard     inodes     soft     hard
*   /dev/sda9                  14664840        100          0      85635        0        0
# 2) Установить для диска с домашними папками квоту для группы пользователей системы, в которую входит ваш пользователй, в 100 объектов жесткую.
### RESULT
***
* groups
* jennysiq adm cdrom sudo dip plugdev lpadmin lxd sambashare
* sudo edquota -g kvm
*   GNU nano 4.8                            /tmp//EdP.ajfe9Uw                                      
* Disk quotas for group kvm (gid 108):
*   Filesystem                   blocks       soft       hard     inodes     soft     hard
*   /dev/sda9                   2719748          0          0          1        0      100
