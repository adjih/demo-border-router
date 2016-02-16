#---------------------------------------------------------------------------
# CA - Inria - 2016
#---------------------------------------------------------------------------


REPO_RIOT=https://github.com/RIOT-OS/RIOT

info:
	@echo "Type one of:"
	@echo "  make compile-hello ; make flash-hello ; make term-hello"

all: ensure-riot

ensure-riot: RIOT

RIOT:
	git clone ${REPO_RIOT}


compile-hello: ensure-riot
	cd RIOT/examples/hello-world && make BOARD=samr21-xpro


flash-hello: ensure-riot
	cd RIOT/examples/hello-world && make BOARD=samr21-xpro flash

term: #ensure-riot
	@#cd RIOT/examples/hello-world && make BOARD=samr21-xpro term
	sudo miniterm.py /dev/ttyACM0 115200

#---------------------------------------------------------------------------
