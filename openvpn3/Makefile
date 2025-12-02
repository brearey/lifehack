CONFIG_NAME := lorriant
CONFIG_FILE := client.ovpn

# в корне должен быть файл с конфигом client.ovpn
create:
	openvpn3 config-import --config ~/$(CONFIG_FILE) --name $(CONFIG_NAME) --persistent

start:
	openvpn3 session-start --config $(CONFIG_NAME)

stop:
	openvpn3 session-manage --config $(CONFIG_NAME) --disconnect