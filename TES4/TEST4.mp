NOTE: AVR Code addresses are word addresses
All other addresses (including ones in FLASH) are byte addresses

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                             lit   008C   003B =     59. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       008C  __lit_start
       008C  _Seg7_Data
       00C7  __lit_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                           idata   00C7   0004 =      4. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       00C7  __idata_start
       00CB  __idata_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            text   00CC   0CBE =   3262. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       0066  __start
       0066  __text_start
       0086  _exit
       0087  _delay_1us
       0089  _delay_nus
       0098  _delay_1ms
       00A2  _delay_nms
       00B1  _HC_595_init
       00C3  _HC_595_OUT
       00CE  _Seg7_Led_Update
       0149  _Seg7_Led_display
       01D9  _Seg7_Led_float
       03A9  _timer1_init
       03C5  _timer1_ovf_isr
       03EE  _init_devices
       03F4  _io_init
       03F9  _main
       0498  _spi_init
       049E  _SPI_MasterTransmit
       04A2  push_arg4
       04A4  push_arg2
       04A7  mod16u
       04A9  div16u
       04AA  xdiv16u
       04C3  elpm32
       04D7  empy16s
       04E7  pop_gset2
       04EA  push_gset5
       04EC  push_gset4
       04EE  push_gset3
       04F0  push_gset2
       04F2  push_gset1
       04F5  pop_gset1
       04F6  pop
       0509  neg32
       0512  lpm32
       0526  fp2int
       052F  nojump1
       0534  fp2long
       053B  nojump2
       053D  FTOI
       053F  FTOL
       056E  save_floatregs
       0579  restore_floatregs
       0584  stk2arg1
       0589  stk2arg0
       058E  float_epilog
       0595  float_prolog
       0598  add32fs
       059B  add32f
       05A0  sub32fs
       05A3  sub32f
       05A8  fret2
       05AF  FSUB
       05B0  FADD
       05F5  usub24
       05F9  cmp32f
       05FE  FLTCP
       062A  empy32fs
       062D  empy32f
       0636  eFMUL
       064E  eumul24
       0677  savfacc1
       067A  restorefacc1
       067D  unpackfacc1
       0686  negmant
       068C  maxres
       0693  minres
       0699  ac1toac2
       069F  swapacc
       06AB  unpack
       06BD  repack
       06C5  __text_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            data   0100   0004 =      4. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       0100  _point
       0100  __data_start
       0101  _point_pos
       0102  _countnum
       0104  __data_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                             bss   0104   0004 =      4. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       0104  __bss_start
       0104  _Seg7_Led_Buf
       0108  __bss_end

Area                               Start  End    Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                          vector   0000   003C =     60. bytes (abs,ovr,rom)

Files Linked      [ module(s) ]

C:\icc\lib\crtatmega.o	[ crtatmega.s ]
delay.o	[ delay.c ]
hc595.o	[ hc595.c ]
main.o	[ main.c ]
spi.o	[ spi.c ]
<library>	[ asave.s, div16u.s, elpm32.s, emul16s.s, gpop2.s, gpush.s, lneg.s, lpm32.s, fp2int.s, fputil.s, fpadd.s ]
[ fpcmp.s, fpemul.s, fputil2.s, fputil3.s ]

User Global Definitions

ram_end = 0x105f
hwstk_size = 0x1e

User Base Address Definitions

func_lit = 0x8c
data = 0x100
eeprom:1.4096

