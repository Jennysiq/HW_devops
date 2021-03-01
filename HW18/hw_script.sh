!/bin/bash
echo "type OS:  $OSTYPE"
echo "Name OS: $HOSTNAME "
uname -a | awk ' {print $3} '
ip r l | grep wlp3s0
echo "Load Average for 15min"
cat /proc/loadavg | awk ' {print $3} '
echo "time work systems: "
uptime | awk ' {print $2, $3, $4, $5} '
echo "Memory info: "
cat /proc/meminfo | grep Mem
echo " Login users:"
w -s