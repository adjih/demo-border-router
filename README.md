# Experiments in compiling/running RIOT as a border router

----

## Using default Ubuntu Xenial tools:

* Starting from fresh alpha Ubuntu Xenial (xenial-desktop-amd64.iso / 16-Feb-2016 08:07  / 1.4G ) - [get Ubuntu image here](http://cdimage.ubuntu.com/daily-live/current/)


```
sudo apt-get -y install binutils-arm-none-eabi gcc-arm-none-eabi openocd
```

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

* Flashing fails as:
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

----

## Using information from RIOT

[RIOT SAMR21 Wiki](https://github.com/RIOT-OS/RIOT/wiki/Board:-Samr21-xpro)



----


