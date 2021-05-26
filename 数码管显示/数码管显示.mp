NOTE: AVR Code addresses are word addresses
All other addresses (including ones in FLASH) are byte addresses

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                             lit   008C   001C =     28. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       008C  __lit_start
       00A8  __lit_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                           idata   00A8   0019 =     25. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       00A8  __idata_start
       00C1  __idata_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            text   00C2   0A6A =   2666. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       0061  __start
       0061  __text_start
       0083  _exit
       0084  _delay_1us
       0086  _delay_nus
       0094  _delay_1ms
       009E  _delay_nms
       00AC  _HC_595_init
       00BE  _HC_595_OUT
       00C7  _Seg7_Led_Update
       0142  _Seg7_Led_display
       01D2  _Seg7_Led_float
       02BC  _timer1_init
       02D8  _timer1_ovf_isr
       0319  _int0
       032B  _init_devices
       033C  _disptime
       0376  _main
       039C  _spi_init
       03A2  _SPI_MasterTransmit
       03A6  push_arg4
       03A8  push_arg2
       03AB  mod16u
       03AD  div16u
       03AE  xdiv16u
       03C7  elpm32
       03DB  push_xgset300C
       03E0  pop_xgset300C
       03E5  neg32
       03EE  fpsub
       03F0  fpadd
       03F1  fpadd_alt
       0458  fpadd2
       0463  fpint
       0495  unpacks
       049D  tstR16_R19
       04A5  unpacku
       04BE  normalize_and_pack
       04F3  pack
       0503  saveFPRegs
       0512  restoreFPRegs
       0521  fpmule
       0574  fpmule1
       057E  fpcmp
       058B  fpcmp1
       0596  __text_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            data   0100   0019 =     25. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       0100  __data_start
       0100  _Seg7_Data
       0111  _point
       0112  _point_pos
       0113  _min
       0115  _sec
       0117  _state
       0119  __data_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                             bss   0119   0004 =      4. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       0119  __bss_start
       0119  _Seg7_Led_Buf
       011D  __bss_end

Area                               Start  End    Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                          vector   0000   003C =     60. bytes (abs,ovr,rom)

Files Linked      [ module(s) ]

C:\iccv7avr\lib\crtatmega.o	[ crtatmega.s ]
delay.o	[ delay.c ]
hc595.o	[ hc595.c ]
main.o	[ main.c ]
spi.o	[ spi.c ]
<library>	[ asave.s, div16u.s, elpm32.s, gpushx.s, lneg.s, fpadd.s, fpadd2.s, fpint.s, fputil.s, fpmule.s, fpmule1.s ]
[ fpcmp.s, fpcmp1.s ]

User Global Definitions

ram_end = 0x10ff
hwstk_size = 0x10

User Base Address Definitions

func_lit = 0x8c
data = 0x100
eeprom:0.4096

