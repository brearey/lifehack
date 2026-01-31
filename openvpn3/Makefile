CONFIG_NAME := lorriant
CONFIG_FILE := computers.ovpn

# в корне должен быть файл с конфигом client.ovpn
create:
	@openvpn3 config-import --config ~/$(CONFIG_FILE) --name $(CONFIG_NAME) --persistent

start:
	@openvpn3 session-start --config $(CONFIG_NAME)

stop:
	@openvpn3 session-manage --config $(CONFIG_NAME) --disconnect

status:
	@openvpn3 sessions-list
ls:
	@openvpn3 configs-list

hostvds:
	echo "Your password c************4"
	ssh root@95.182.116.227

# символ @ нужен чтобы лишний раз не выводил команду которую выполняет
