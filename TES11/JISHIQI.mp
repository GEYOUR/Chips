NOTE: AVR Code addresses are word addresses
All other addresses (including ones in FLASH) are byte addresses

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                           idata   0054   000E =     14. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       0054  __idata_start
       0062  __idata_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            text   0062   023C =    572. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       0031  __start
       0031  __text_start
       0053  _exit
       0054  _ioit
       005B  _int_init
       006F  _Int_TCCR1
       00AC  _delay
       00C2  _display
       00F8  _main
       0123  mod8u
       0125  div8u
       0126  xdiv8u
       013B  push_xgsetF00C
       0142  pop_xgsetF00C
       0149  lsl8
       014F  __text_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            data   0060   000E =     14. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       0060  __data_start
       0060  _num
       006A  _jishu
       006C  _min
       006D  _sec
       006E  __data_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                             bss   006E   0004 =      4. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       006E  _disp
       006E  __bss_start
       0072  __bss_end

Area                               Start  End    Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                          vector   0000   001C =     28. bytes (abs,ovr,rom)

Files Linked      [ module(s) ]

D:\App_Gallery\IC\lib\crtatmega.o	[ crtatmega.s ]
dingshijishuQi.o	[ dingshijishuQi.c ]
<library>	[ div8u.s, gpushz.s, lsl8.s ]

User Global Definitions

ram_end = 0x45f
hwstk_size = 0x1e

User Base Address Definitions

func_lit = 0x54
data = 0x60
eeprom:0.512

