# DIGNO R 202K

202Kには電源断からリカバリーモードに入る手段がないので、bootパーティションから起動できなくなると復旧させることはできません。
従って、bootパーティションには必ず起動できるCWMリカバリー等を焼いておくのが安心です。

bootパーティションに焼いたイメージを更新する際にも、必ずrecoveryパーティションに焼いて起動確認後にbootパーティションに焼くようにしましょう。

## Partition

    mmcblk0p1  modem
    mmcblk0p2  sbl1
    mmcblk0p3  sbl2
    mmcblk0p4  sbl3
    mmcblk0p5  rpm
    mmcblk0p6  tz
    mmcblk0p7  aboot
    mmcblk0p8  fota
    mmcblk0p9  sbl2bk
    mmcblk0p10 sbl3bk
    mmcblk0p11 rpmbk
    mmcblk0p12 tzbk
    mmcblk0p13 abootbk
    mmcblk0p14 fotabk
    mmcblk0p15 boot
    mmcblk0p16 recovery
    mmcblk0p17 system
    mmcblk0p18 userdata
    mmcblk0p19 persist
    mmcblk0p20 cache
    mmcblk0p21 misc
    mmcblk0p22 fsg
    mmcblk0p23 ssd
    mmcblk0p24 log
    mmcblk0p25 delta
    mmcblk0p26 fotamng
    mmcblk0p27 bootwork
    mmcblk0p28 chkcode
    mmcblk0p29 sdcard
    mmcblk0p30 temp
    mmcblk0p31 reserve1
    mmcblk0p32 dnand
    mmcblk0p33 systemproperty
    mmcblk0p34 modemst1
    mmcblk0p35 modemst2
    mmcblk0p36 bfss1
    mmcblk0p37 bfss2
    mmcblk0p38 reserve2
