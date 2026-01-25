
sudo vim /etc/wsl.conf 
contents:
    [network]
    generateResolvConf = false

sudo vim /etc/squid/squid.conf
    http_port 127.0.0.1:3128
 
sudo squid -k reconfigure

sudo vim /etc/network/if-up.d/static-ip.sh  
    #!/bin/bash
    # Set a static IP address for your WSL network interface
    sudo ip addr add 172.19.128.100/24 dev eth0
    sudo ip route add default via 172.19.128.1

sudo chmod +x /etc/network/if-up.d/static-ip.sh
