brearey88@yandex.ru
10 USD = 938 RUR

# Install openvpn on Ubuntu server
https://github.com/Nyr/openvpn-install.git
wget https://git.io/vpn -O openvpn-install.sh
https://openvpn.net/community/

cd openvpn-server/
sudo docker compose up -d --build
open URL: http://95.182.116.227:8080 in browser
login = admin, password in mail.yandex.ru
Configurations > OpenVPN client > set external server's IP address
In OpenVPN UI generate certificate

setting up open vpn
port 1194
client name: client
login: root
password: **************4

# Install linux client:

sudo mkdir -p /etc/apt/keyrings
sudo curl -sSfL https://packages.openvpn.net/packages-repo.gpg >/home/lorriant/openvpn.asc

sudo mv openvpn.asc /etc/apt/keyrings/

sudo su
echo "deb [signed-by=/etc/apt/keyrings/openvpn.asc] https://packages.openvpn.net/openvpn3/debian noble main" >>/etc/apt/sources.list.d/openvpn3.list

sudo apt update && sudo apt install openvpn3

openvpn3 config-import --config client.ovpn --name lorriant --persistent
openvpn3 session-start --config lorriant

scp root@95.182.116.227:/root/iphone_aes.ovpn /home/lorriant/iphone_aes.ovpn
