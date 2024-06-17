echo "q4_0_4p"

# پاک کردن صفحه ترمینال
clear


# ایجاد دایرکتوری مربوطه
mkdir -p /var/lib/marzban/xray-core

# دانلود و استخراج فایل Xray
wget -O /var/lib/marzban/xray-core/Xray-linux-64.zip https://github.com/XTLS/Xray-core/releases/download/v1.8.1/Xray-linux-64.zip
unzip /var/lib/marzban/xray-core/Xray-linux-64.zip -d /var/lib/marzban/xray-core

# حذف فایل فشرده دانلود شده
rm /var/lib/marzban/xray-core/Xray-linux-64.zip

#نصب مرزبان نود
echo -e "\e[1;31m -Install Marzban node + Docker\e[0m"
curl -fsSL https://get.docker.com | sh
git clone https://github.com/Gozargah/Marzban-node
(cd ~/Marzban-node && docker compose up -d)
rm Marzban-node/docker-compose.yml ;
wget -O Marzban-node/docker-compose.yml https://host-upload-data-boy.site/node/docker-compose.yml 
(cd ~/Marzban-node && docker compose down && docker compose up --remove-orphans -d)
wget -O /var/lib/marzban-node/ssl_client_cert.pem https://host-upload-data-boy.site/node/ssl_client_cert.pem

# تموم
echo -e "\e[94mFinish (⁠✯⁠ᴗ⁠✯⁠)\e[0m"
