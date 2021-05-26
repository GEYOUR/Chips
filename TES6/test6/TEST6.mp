NOTE: AVR Code addresses are word addresses
All other addresses (including ones in FLASH) are byte addresses

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                        func_lit   008C   0002 =      2. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       008C  __func_lit_start
       008E  __func_lit_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                             lit   008E   0175 =    373. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       008E  __lit_start
       008E  __ctype
       0203  __lit_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                           idata   0203   000E =     14. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       0203  __idata_start
       0211  __idata_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            text   0212   09C4 =   2500. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       0109  __text_start
       0109  __start
       012B  _exit
       012C  _s_ms
       0135  _busy
       0160  _writecom
       017C  _LcdInit
       01AC  _writedata
       01C8  _readdata
       01EE  _WriteCGRAM
       0207  _WriteMenu
       0238  _WriteNum
       025C  _WriteChar
       028E  _io_init
       0297  _delay_ms
       02A8  _disp
       02DF  _main
       0317  _strcat
       0324  _strcpy
       032D  _strlen
       0339  push_arg4
       033B  push_arg2
       033E  mod16u
       0340  div16u
       0341  xdiv16u
       035A  pop_xgsetF0FC
       0365  push_xgsetF0FC
       0367  push_xgset30FC
       0369  push_xgset00FC
       036B  push_xgset003C
       0370  push_xgsetF000
       0375  pop_xgsetF000
       037A  push_xgsetF00C
       0381  pop_xgsetF00C
       0388  push_xgsetF03C
       0391  pop_xgsetF03C
       039A  xicallx
       03A3  _itoa
       040E  _utoa
       044E  _islower
       0458  _toupper
       046B  __print
       05B8  __sdepi
       05C2  _sprintf
       05EB  __text_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            data   0100   000E =     14. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       0100  _title
       0100  __data_start
       010E  __data_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                             bss   010E   002D =     45. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       010E  __bss_start
       010E  _all
       011E  _count
       013B  __bss_end

Area                               Start  End    Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                          vector   0000   0004 =      4. bytes (abs,ovr,rom)

Files Linked      [ module(s) ]

C:\iccv7avr\lib\crtatmega.o	[ crtatmega.s ]
1602.o	[ _1602.c ]
<library>	[ strcat.s, strcpy.s, strlen.s, asave.s, div16u.s, gpop5.s, gpush.s, gpushy.s, gpushz.s, gpushb.s, icallx.s ]
[ itoa.s, utoa.s, islower.s, ctype.s, toupper.s, _printf.s, sprintf.s ]

User Global Definitions

ram_end = 0x10ff
hwstk_size = 0x1e

User Base Address Definitions

func_lit = 0x8c
data = 0x100
eeprom:0.4096

