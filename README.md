# Experiments in compiling/running RIOT as a border router

----

## Quick-start

After installation of Ubuntu Xenial,

```
sudo apt-get install git
git clone https://github.com/adjih/demo-border-router.git
cd demo-border-router/tools
./update-xenial.sh # ./update-xenial.sh adjih  # <- for MATE desktop
cd ..
make flash-hello
make term
```

----

## Using default Ubuntu Xenial tools:

* Starting from fresh alpha Ubuntu Xenial (xenial-desktop-amd64.iso / 16-Feb-2016 08:07  / 1.4G ) - [get Ubuntu image here](http://cdimage.ubuntu.com/daily-live/current/)


```
sudo apt-get -y install binutils-arm-none-eabi gcc-arm-none-eabi openocd
```

(see also `cat tools/update-xenial.sh` and possibly run it)

* Compilation gets warnings as:
```
user@ubuntu:~/demo-border-router/RIOT/examples/hello-world$ make BOARD=samr21-xpro
Building application "hello-world" for "samr21-xpro" with MCU "samd21".

"make" -C /home/user/demo-border-router/RIOT/boards/samr21-xpro
"make" -C /home/user/demo-border-router/RIOT/core
"make" -C /home/user/demo-border-router/RIOT/cpu/samd21
"make" -C /home/user/demo-border-router/RIOT/cpu/cortexm_common
"make" -C /home/user/demo-border-router/RIOT/cpu/sam21_common
"make" -C /home/user/demo-border-router/RIOT/cpu/sam21_common/periph
"make" -C /home/user/demo-border-router/RIOT/cpu/samd21/periph
"make" -C /home/user/demo-border-router/RIOT/drivers
"make" -C /home/user/demo-border-router/RIOT/drivers/periph_common
"make" -C /home/user/demo-border-router/RIOT/sys
"make" -C /home/user/demo-border-router/RIOT/sys/auto_init
"make" -C /home/user/demo-border-router/RIOT/sys/newlib
"make" -C /home/user/demo-border-router/RIOT/sys/tsrb
"make" -C /home/user/demo-border-router/RIOT/sys/uart_stdio
/usr/lib/gcc/arm-none-eabi/4.9.3/../../../arm-none-eabi/bin/ld: warning: /usr/lib/gcc/arm-none-eabi/4.9.3/../../../arm-none-eabi/lib/armv6-m/libc_nano.a(lib_a-errno.o) uses 2-byte wchar_t yet the output is to use 4-byte wchar_t; use of wchar_t values across objects may fail
/usr/lib/gcc/arm-none-eabi/4.9.3/../../../arm-none-eabi/bin/ld: warning: /usr/lib/gcc/arm-none-eabi/4.9.3/../../../arm-none-eabi/lib/armv6-m/libc_nano.a(lib_a-impure.o) uses 2-byte wchar_t yet the output is to use 4-byte wchar_t; use of wchar_t values across objects may fail
[...]
usr/lib/gcc/arm-none-eabi/4.9.3/../../../arm-none-eabi/bin/ld: warning: /usr/lib/gcc/arm-none-eabi/4.9.3/../../../arm-none-eabi/lib/armv6-m/libc_nano.a(lib_a-nano-msizer.o) uses 2-byte wchar_t yet the output is to use 4-byte wchar_t; use of wchar_t values across objects may fail
   text	   data	    bss	    dec	    hex	filename
   8320	    128	   2752	  11200	   2bc0	/home/user/demo-border-router/RIOT/examples/hello-world/bin/samr21-xpro/hello-world.elf
```

* Flashing failed initially as:
```
user@ubuntu:~/demo-border-router/RIOT/examples/hello-world$ make BOARD=samr21-xpro flash
Building application "hello-world" for "samr21-xpro" with MCU "samd21".

"make" -C /home/user/demo-border-router/RIOT/boards/samr21-xpro
"make" -C /home/user/demo-border-router/RIOT/core
"make" -C /home/user/demo-border-router/RIOT/cpu/samd21
"make" -C /home/user/demo-border-router/RIOT/cpu/cortexm_common
"make" -C /home/user/demo-border-router/RIOT/cpu/sam21_common
"make" -C /home/user/demo-border-router/RIOT/cpu/sam21_common/periph
"make" -C /home/user/demo-border-router/RIOT/cpu/samd21/periph
"make" -C /home/user/demo-border-router/RIOT/drivers
"make" -C /home/user/demo-border-router/RIOT/drivers/periph_common
"make" -C /home/user/demo-border-router/RIOT/sys
"make" -C /home/user/demo-border-router/RIOT/sys/auto_init
"make" -C /home/user/demo-border-router/RIOT/sys/newlib
"make" -C /home/user/demo-border-router/RIOT/sys/tsrb
"make" -C /home/user/demo-border-router/RIOT/sys/uart_stdio
/usr/lib/gcc/arm-none-eabi/4.9.3/../../../arm-none-eabi/bin/ld: warning: /usr/lib/gcc/arm-none-eabi/4.9.3/../../../arm-none-eabi/lib/armv6-m/libc_nano.a(lib_a-errno.o) uses 2-byte wchar_t yet the output is to use 4-byte wchar_t; use of wchar_t values across objects may fail
[...]
/usr/lib/gcc/arm-none-eabi/4.9.3/../../../arm-none-eabi/bin/ld: warning: /usr/lib/gcc/arm-none-eabi/4.9.3/../../../arm-none-eabi/lib/armv6-m/libc_nano.a(lib_a-nano-msizer.o) uses 2-byte wchar_t yet the output is to use 4-byte wchar_t; use of wchar_t values across objects may fail
   text	   data	    bss	    dec	    hex	filename
   8320	    128	   2752	  11200	   2bc0	/home/user/demo-border-router/RIOT/examples/hello-world/bin/samr21-xpro/hello-world.elf
/home/user/demo-border-router/RIOT/dist/tools/openocd/openocd.sh flash
### Flashing Target ###
Open On-Chip Debugger 0.9.0 (2015-09-02-10:42)
Licensed under GNU GPL v2
For bug reports, read
	http://openocd.org/doc/doxygen/bugs.html
Info : only one transport option; autoselect 'swd'
adapter speed: 500 kHz
adapter_nsrst_delay: 100
cortex_m reset_config sysresetreq
Error: unable to open CMSIS-DAP device 0x3eb:0x2111

Done flashing
```

* After openocd recompilation adventure, and later simple re-installation of the Ubuntu Xenial, it works fine:

```
/usr/lib/gcc/arm-none-eabi/4.9.3/../../../arm-none-eabi/bin/ld: warning: /usr/lib/gcc/arm-none-eabi/4.9.3/../../../arm-none-eabi/lib/armv6-m/libc_nano.a(lib_a-nano-msizer.o) uses 2-byte wchar_t yet the output is to use 4-byte wchar_t; use of wchar_t values across objects may fail
   text	   data	    bss	    dec	    hex	filename
   8320	    128	   2752	  11200	   2bc0	/home/user/demo-border-router/RIOT/examples/hello-world/bin/samr21-xpro/hello-world.elf
/home/user/demo-border-router/RIOT/dist/tools/openocd/openocd.sh flash
### Flashing Target ###
Open On-Chip Debugger 0.9.0 (2015-09-02-10:42)
Licensed under GNU GPL v2
For bug reports, read
	http://openocd.org/doc/doxygen/bugs.html
Info : only one transport option; autoselect 'swd'
adapter speed: 500 kHz
adapter_nsrst_delay: 100
cortex_m reset_config sysresetreq
Info : CMSIS-DAP: SWD  Supported
Info : CMSIS-DAP: Interface Initialised (SWD)
Info : CMSIS-DAP: FW Version = 01.1A.00FB
Info : SWCLK/TCK = 1 SWDIO/TMS = 1 TDI = 1 TDO = 1 nTRST = 0 nRESET = 1
Info : CMSIS-DAP: Interface ready
Info : clock speed 500 kHz
Info : SWD IDCODE 0x0bc11477
Info : at91samr21g18.cpu: hardware has 4 breakpoints, 2 watchpoints
    TargetName         Type       Endian TapName            State       
--  ------------------ ---------- ------ ------------------ ------------
 0* at91samr21g18.cpu  cortex_m   little at91samr21g18.cpu  running
target state: halted
target halted due to debug-request, current mode: Thread 
xPSR: 0x41000000 pc: 0x000003dc msp: 0x20000b40
auto erase enabled
Info : SAMD MCU: SAMR21G18A (256KB Flash, 32KB RAM)
wrote 16384 bytes from file /home/user/demo-border-router/RIOT/examples/hello-world/bin/samr21-xpro/hello-world.hex in 4.380611s (3.652 KiB/s)
target state: halted
target halted due to debug-request, current mode: Thread 
xPSR: 0x41000000 pc: 0x000003dc msp: 0x20000b40
verified 8448 bytes in 0.761720s (10.831 KiB/s)
shutdown command invoked
Done flashing
make[1]: Leaving directory '/home/user/demo-border-router/RIOT/examples/hello-world'
user@ubuntu:~/demo-border-router$
```

* Running:
 after `make term` and hitting reset button, everything is fine:

```
user@ubuntu:~/demo-border-router$ make term
sudo miniterm.py /dev/ttyACM0 115200
--- Miniterm on /dev/ttyACM0  115200,8,N,1 ---
--- Quit: Ctrl+] | Menu: Ctrl+T | Help: Ctrl+T followed by Ctrl+H ---
main(): This is RIOT! (Version: 2016.03-devel-539-g0a65d-ubuntu)
Hello World!
You are running RIOT on a(n) samr21-xpro board.
This board features a(n) samd21 MCU.
```

----
