NOTE: AVR Code addresses are word addresses
All other addresses (including ones in FLASH) are byte addresses

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                           idata   0054   000A =     10. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       0054  __idata_start
       005E  __idata_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            text   005E   0320 =    800. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       002F  __text_start
       002F  __start
       0051  _exit
       0052  _io_init
       005B  _delay
       0071  _display
       0096  _main
       0171  mod16s
       0175  div16s
       018F  mod16u
       0191  div16u
       0192  xdiv16u
       01AB  push_xgsetF00C
       01B2  pop_xgsetF00C
       01B9  lsl8
       01BF  __text_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            data   0060   000A =     10. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       0060  __data_start
       0060  _num
       006A  __data_end

Area                               Start  End    Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                          vector   0000   0004 =      4. bytes (abs,ovr,rom)

Files Linked      [ module(s) ]

C:\iccv7avr\lib\crtatmega.o	[ crtatmega.s ]
led4.o	[ led4.c ]
<library>	[ div16s.s, div16u.s, gpushz.s, lsl8.s ]

User Global Definitions

ram_end = 0x45f
hwstk_size = 0x1e

User Base Address Definitions

func_lit = 0x54
data = 0x60
eeprom:0.512

