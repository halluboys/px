#!/bin/bash                                                                             
red="\e[1;31m"                                                                          
green="\e[0;32m"                                                                        
NC="\e[0m"       

systemctl restart stunnel4.service         
systemctl restart dropbear.service
systemctl restart v2ray@vless.service
systemctl restart v2ray@vless.none
systemctl restart v2ray.service
systemctl restart v2ray@none.service
systemctl restart v2ray@vnone.service
systemctl restart trojan
systemctl restart squid.service
systemctl restart openvpn.service
systemctl restart wg-quick@wg0
systemctl restart accel-ppp.service
systemctl restart ssrmu
systemctl restart shadowsocks-libev.service
systemctl restart xl2tpd.service
systemctl restart pptpd.service
systemctl restart trojan-go.service