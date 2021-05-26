NOTE: AVR Code addresses are word addresses
All other addresses (including ones in FLASH) are byte addresses

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                           idata   008C   0011 =     17. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       008C  __idata_start
       009D  __idata_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            text   009E   0692 =   1682. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       004F  __text_start
       004F  __start
       0071  _exit
       0072  _s_ms
       007B  _busy
       00A6  _writecom
       00C2  _LcdInit
       00F2  _writedata
       010E  _readdata
       0134  _WriteCGRAM
       014D  _WriteMenu
       017E  _WriteNum
       01A2  _WriteChar
       01D4  _delay_nms
       01EB  _Beep
       01FF  _timer1_init
       021B  _timer1_ovf_isr
       024A  _Int0
       0269  _Int1
       0288  _io_init
       029B  _disp
       0303  _init_devices
       0316  _main
       0346  mod8u
       0348  div8u
       0349  xdiv8u
       035E  pop_xgset003C
       0363  push_xgsetF0FC
       0365  push_xgset30FC
       0367  push_xgset00FC
       0369  push_xgset003C
       036E  push_xgsetF000
       0373  pop_xgsetF000
       0378  push_xgsetF00C
       037F  pop_xgsetF00C
       0386  push_xgsetF03C
       038F  pop_xgsetF03C
       0398  __text_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            data   0100   0011 =     17. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       0100  _title
       0100  __data_start
       010A  _min
       010B  _sec
       010C  _state
       0111  __data_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                             bss   0111   0005 =      5. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       0111  __bss_start
       0111  _second
       0113  _minute
       0115  _countnum
       0116  __bss_end

Area                               Start  End    Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                          vector   0000   003C =     60. bytes (abs,ovr,rom)

Files Linked      [ module(s) ]

C:\iccv7avr\lib\crtatmega.o	[ crtatmega.s ]
test10.o	[ test10.c ]
<library>	[ div8u.s, gpop2.s, gpush.s, gpushy.s, gpushz.s, gpushb.s ]

User Global Definitions

ram_end = 0x10ff
hwstk_size = 0x1e

User Base Address Definitions

func_lit = 0x8c
data = 0x100
eeprom:0.4096

