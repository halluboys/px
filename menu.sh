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
echo -e  "   -------------------------MENU OPTIONS------------------------" | lolcat
echo -e   "   1\e[1;33m)\e[m Panel V2Ray" | lolcat
echo -e   "   2\e[1;33m)\e[m Create Certificate" | lolcat
echo -e   "  \e[1;32m------------------------------------------------------------\e[m" | lolcat
echo -e   "   x)   Exit" | lolcat
echo -e   "  \e[1;32m------------------------------------------------------------\e[m" | lolcat
echo -e   ""
read -p "     Select From Options [1-2 or x] :  " menu | lolcat
echo -e   ""
case $menu in
1)
v2raay
;;
2)
certv2ray
;;
x)
exit
;;
*)
echo  "Please enter an correct number"
;;
esac
