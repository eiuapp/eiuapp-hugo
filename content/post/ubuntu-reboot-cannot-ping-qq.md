
虚拟机网络在vmware中配置正确，但是，重新启动后，又连接不上外网了。
这个时候，查一下

```
➜  ~ cat /etc/network/interfaces
# interfaces(5) file used by ifup(8) and ifdown(8)
auto lo
iface lo inet loopback

auto ens33
iface ens33 inet static
address 192.168.0.103
netmask 255.255.255.0
gateway 192.168.0.1

auto ens38
iface ens38 inet dhcp
#iface ens38 inet static
#address 192.168.100.50
#netmask 255.255.255.0
#up ip link set dev $IFACE up
#down ip link set dev $IFACE down

#auto ens39
#iface ens39 inet dhcp
➜  ~ cat /etc/resolv.conf 
# Dynamic resolv.conf(5) file for glibc resolver(3) generated by resolvconf(8)
#     DO NOT EDIT THIS FILE BY HAND -- YOUR CHANGES WILL BE OVERWRITTEN
nameserver 192.168.0.1
search localdomain
➜  ~
```

再试

```
➜  ~ traceroute qq.com
traceroute to qq.com (58.60.9.21), 30 hops max, 60 byte packets
 1  192.168.0.1 (192.168.0.1)  36.834 ms  69.393 ms  36.537 ms
 2  100.64.0.1 (100.64.0.1)  94.342 ms  94.228 ms  94.120 ms
 3  202.105.154.97 (202.105.154.97)  68.876 ms 202.105.159.25 (202.105.159.25)  69.634 ms 113.106.40.81 (113.106.40.81)  93.921 ms
 4  119.147.223.178 (119.147.223.178)  93.872 ms 119.147.223.250 (119.147.223.250)  93.807 ms 119.147.223.166 (119.147.223.166)  93.761 ms^C
➜  ~
```
