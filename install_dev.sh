echo "q4_0_4p"

# پاک کردن صفحه ترمینال
clear

# دانلود و استخراج فایل Xray
apt install wget unzip
mkdir -p /var/lib/marzban/xray-core && cd /var/lib/marzban/xray-core
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



# تموم
echo -e "\e[94mFinish (⁠✯⁠ᴗ⁠✯⁠)\e[0m"
