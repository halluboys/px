#!/bin/bash
yl='\e[031;1m'
bl='\e[36;1m'
gl='\e[32;1m'

clear 
cat /usr/bin/bannerku | lolcat
ISP=$(curl -s ipinfo.io/org | cut -d " " -f 2-10 )
CITY=$(curl -s ipinfo.io/city )
IPVPS=$(curl -s ipinfo.io/ip )
	echo -e "   \e[032;1mIsp Name:\e[0m $ISP" | lolcat
	echo -e "   \e[032;1mCity:\e[0m $CITY" | lolcat
	echo -e "   \e[033;1mIPVPS:\e[0m $IPVPS" | lolcat
echo -e  ""
echo -e "=============================-VMESS-===========================" | lolcat
echo -e "* add-ws       : Create V2RAY Vmess Websocket Account"
echo -e "* del-ws       : Deleting V2RAY Vmess Websocket Account"
echo -e "* renew-ws     : Extending Vmess Account Active Life"
echo -e "* cek-ws       : Check User Login V2RAY"
echo -e "* certv2ray    : Renew Certificate V2RAY Account"
echo -e ""
