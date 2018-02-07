# Building

1. Add toolchain bin folder to path (`source add-toolchain-path.bash`).
2. Run make from folder containing application of choice.

# Flashing

## Install openocd.

Version 0.10.0 has been working for me.

## Configure permissions.
Copy
https://sourceforge.net/p/openocd/code/ci/master/tree/contrib/60-openocd.rules
to `/etc/udev/rules.d/60-openocd.rules`.

# Running

## Configure permissions.

Add yourself to the dialout group on ubuntu, uucp on arch linux.

# Debugging

1. Start openocd in repository root (`openocd`).
2. Add toolchain bin folder to path (`source add-toolchain-path.bash`).
3. Start gdb from repository root (`arm-none-eabi-gdb`).

```gdb
file <path to some built elf>
target extended-remote localhost:3333
load
break <some function>
continue
```

# Mistakes were made

## Failed to flash
JTAG-DP STICKY ERROR
https://sourceforge.net/p/openocd/mailman/message/33250161/

tried to flash nothing but interrupt handler table and break on reset but failed to flash.
https://armengineer.com/stm32-p405-startup-code-exploring-the-arm-cortex-m/

Turns out I was trying to write to the wrong location, missed a 0 in the declaration of the flash memory region.

## LTO removes `_exit` `_abort` and `_getpid`

Have to add `__attribute__((used))` to `cpp_wrappers` in ChibiOS.
http://www.chibios.com/forum/viewtopic.php?t=2842

