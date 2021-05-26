NOTE: AVR Code addresses are word addresses
All other addresses (including ones in FLASH) are byte addresses

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            text   008C   045E =   1118. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       0046  __text_start
       0046  __start
       0068  _exit
       0069  _int_init
       0071  _delay_nms
       0088  _ext_int0_isr
       00FF  _ext_int1_isr
       0178  _ext_int2_isr
       01F4  _ext_int3_isr
       0244  _io_init
       0252  _main
       0264  push_xgsetF000
       0269  pop_xgsetF000
       026E  lsl16
       0275  __text_end

Area                               Start  End    Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                          vector   0000   0014 =     20. bytes (abs,ovr,rom)

Files Linked      [ module(s) ]

C:\iccv7avr\lib\crtatmega.o	[ crtatmega.s ]
break.o	[ break.c ]
<library>	[ gpushy.s, lsl16.s ]

User Global Definitions

ram_end = 0x10ff
hwstk_size = 0x1e

User Base Address Definitions

func_lit = 0x8c
data = 0x100
eeprom:0.4096

