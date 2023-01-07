#!/system/bin/sh
ifconfig eth0 down
usleep 500
ifconfig eth0 up
