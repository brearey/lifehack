CONFIG_NAME := lorriant
CONFIG_FILE := linux.ovpn

# в корне должен быть файл с конфигом client.ovpn
create:
	@sudo openvpn3 config-import --config ~/$(CONFIG_FILE) --name $(CONFIG_NAME) --persistent

start:
	@sudo openvpn3 session-start --config $(CONFIG_NAME)

stop:
	@sudo openvpn3 session-manage --config $(CONFIG_NAME) --disconnect

status:
	@sudo openvpn3 sessions-list
remove:
	@sudo openvpn3 config-remove --config $(CONFIG_NAME)

ls:
	@sudo openvpn3 configs-list --verbose

hostvds:
	echo "Your password c************4"
	ssh root@95.182.116.227

# символ @ нужен чтобы лишний раз не выводил команду которую выполняет
