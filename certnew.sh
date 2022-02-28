#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
clear
echo start
sleep 0.5
source /var/lib/premium-script/ipvps.conf                                       domain=$IP
sudo lsof -t -i tcp:80 -s tcp:listen | sudo xargs kill
cd /root/
wget -O acme.sh https://raw.githubusercontent.com/acmesh-official/acme.sh/maste$bash acme.sh --install
rm acme.sh
cd .acme.sh
echo "starting...., Port 80 Akan di Hentikan Saat Proses install Cert"          bash acme.sh --register-account -m paoandest@gmail.com
bash acme.sh --issue --standalone -d $domain --force
bash acme.sh --installcert -d $domain --fullchainpath
bash acme.sh --installcert -d $domain --fullchainpath /etc/v2ray/v2ray.crt --ke$echo Done
sleep 0.5
clear
neofetch