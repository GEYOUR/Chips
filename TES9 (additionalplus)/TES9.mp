NOTE: AVR Code addresses are word addresses
All other addresses (including ones in FLASH) are byte addresses

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                           idata   0054   000B =     11. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       0054  __idata_start
       005F  __idata_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            text   0060   0248 =    584. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       0030  __start
       0030  __text_start
       0052  _exit
       0053  _ioit
       005C  _int_init
       0066  _delay
       007C  _display
       00B2  _Int0
       00D1  _Int1
       00F0  _main
       0128  mod8u
       012A  div8u
       012B  xdiv8u
       0140  push_xgsetF00C
       0147  pop_xgsetF00C
       014E  lsl8
       0154  __text_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            data   0060   000B =     11. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       0060  __data_start
       0060  _num
       006A  _state
       006B  __data_end

Area                               Start  End    Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                          vector   0000   000C =     12. bytes (abs,ovr,rom)

Files Linked      [ module(s) ]

C:\iccv7avr\lib\crtatmega.o	[ crtatmega.s ]
LED_BREAK.o	[ LED_BREAK.c ]
<library>	[ div8u.s, gpushz.s, lsl8.s ]

User Global Definitions

ram_end = 0x45f
hwstk_size = 0x1e

User Base Address Definitions

func_lit = 0x54
data = 0x60
eeprom:0.512

