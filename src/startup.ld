MEMORY
{
  flash_mem : ORIGIN = 0x08000000, LENGTH = 0x4000
}

SECTIONS
{
  .text : { *(.text*) } > flash_mem
}
