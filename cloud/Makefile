USER := lorriant
PASSWORD := "1v******@"
HOST := 176.109.105.218
FILE := app

all: connect

connect:
	echo "Your password is $(PASSWORD)"
	ssh $(USER)@$(HOST)
copy:
	scp $(FILE) $(USER)@$(HOST):/home/lorriant/app

clean:
	rm $(FILE)