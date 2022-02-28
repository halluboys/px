#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m' 
apt install jq curl -y
DOMAIN=xzvnct.my.id
sub=$(</dev/urandom tr -dc a-z0-9 | head -c4)
SUB_DOMAIN=${sub}.xzvnct.my.id
CF_ID=hammysayang@gmail.com
CF_KEY=c8cb595f43fcd359488dc3c72826544fe4638
set -euo pipefail
IP=$(wget -qO- ifconfig.me/ip);
echo "Updating DNS for ${SUB_DOMAIN}..."
ZONE=$(curl -sLX GET "https://api.cloudflare.com/client/v4/zones?name=${DOMAIN}&status=active" \
     -H "X-Auth-Email: ${CF_ID}" \
     -H "X-Auth-Key: ${CF_KEY}" \
     -H "Content-Type: application/json" | jq -r .result[0].id)

RECORD=$(curl -sLX GET "https://api.cloudflare.com/client/v4/zones/${ZONE}/dns_records?name=${SUB_DOMAIN}" \
     -H "X-Auth-Email: ${CF_ID}" \
     -H "X-Auth-Key: ${CF_KEY}" \
     -H "Content-Type: application/json" | jq -r .result[0].id)

if [[ "${#RECORD}" -le 10 ]]; then
     RECORD=$(curl -sLX POST "https://api.cloudflare.com/client/v4/zones/${ZONE}/dns_records" \
     -H "X-Auth-Email: ${CF_ID}" \
     -H "X-Auth-Key: ${CF_KEY}" \
     -H "Content-Type: application/json" \
     --data '{"type":"A","name":"'${SUB_DOMAIN}'","content":"'${IP}'","ttl":120,"proxied":false}' | jq -r .result.id)
fi

RESULT=$(curl -sLX PUT "https://api.cloudflare.com/client/v4/zones/${ZONE}/dns_records/${RECORD}" \
     -H "X-Auth-Email: ${CF_ID}" \
     -H "X-Auth-Key: ${CF_KEY}" \
     -H "Content-Type: application/json" \
     --data '{"type":"A","name":"'${SUB_DOMAIN}'","content":"'${IP}'","ttl":120,"proxied":false}')
echo "Host : $SUB_DOMAIN"
echo $SUB_DOMAIN > /root/domain
systemctl stop v2ray
systemctl stop v2ray@none
#add certificate
mkdir /root/.acme.sh
wget -O acme.sh https://raw.githubusercontent.com/acmesh-official/acme.sh/maste$bash acme.sh --install
chmod +x /root/.acme.sh/acme.sh 
rm acme.sh
cd .acme.sh
echo "starting...., Port 80 Akan di Hentikan Saat Proses install Cert"          bash acme.sh --register-account -m hammysayang@gmail.com
bash acme.sh --issue --standalone -d $SUB_DOMAIN  --force
bash acme.sh --installcert -d $SUB_DOMAIN --fullchainpath
bash acme.sh --installcert -d $SUB_DOMAIN --fullchainpath /etc/v2ray/v2ray.crt --ke$echo Done
service squid start
systemctl start v2ray
systemctl start v2ray@none
echo Done
sleep 0.5 
neofetch
echo "IP=$SUB_DOMAIN" >> /var/lib/premium-script/ipvps.conf
rsync -a /root/domain /etc/v2ray