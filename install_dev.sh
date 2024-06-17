echo "q4_0_4p"

# پاک کردن صفحه ترمینال
clear

apt update && apt upgrade -y
apt install net-tools

# دانلود و استخراج فایل Xray
apt install wget unzip -y
mkdir -p /var/lib/marzban/xray-core
wget -O /var/lib/marzban/xray-core/Xray-linux-64.zip https://github.com/XTLS/Xray-core/releases/download/v1.8.4/Xray-linux-64.zip
unzip /var/lib/marzban/xray-core/Xray-linux-64.zip -d /var/lib/marzban/xray-core

#نصب مرزبان نود
echo -e "\e[1;31m -Install Marzban node + Docker\e[0m"
curl -fsSL https://get.docker.com | sh
git clone https://github.com/Gozargah/Marzban-node
(cd ~/Marzban-node && docker compose up -d)
rm Marzban-node/docker-compose.yml ;
wget -O Marzban-node/docker-compose.yml https://bot.amironet.work/node/docker-compose.yml
(cd ~/Marzban-node && docker compose down && docker compose up --remove-orphans -d)
wget -O /var/lib/marzban-node/ssl_client_cert.pem https://bot.amironet.work/node/ssl_client_cert.pem

apt install haproxy -y
wget -O /etc/haproxy/haproxy.cfg https://bot.amironet.work/node/haproxy.cfg
systemctl restart haproxy.service

# تموم
echo -e "\e[94mFinish (⁠✯⁠ᴗ⁠✯⁠)\e[0m"
