/* 800885EC 0008450C  3C 60 80 2B */	lis r3, lbl_802B37F0@ha
/* 800885F0 00084510  38 C3 37 F0 */	addi r6, r3, lbl_802B37F0@l
/* 800885F4 00084514  38 A0 00 00 */	li r5, 0
/* 800885F8 00084518  90 A6 00 00 */	stw r5, 0(r6)
/* 800885FC 0008451C  3C 60 80 1C */	lis r3, s_rankingBallBmpIds@ha
/* 80088600 00084520  38 83 79 B8 */	addi r4, r3, s_rankingBallBmpIds@l
/* 80088604 00084524  90 A6 00 04 */	stw r5, 4(r6)
/* 80088608 00084528  3C 60 80 1C */	lis r3, lbl_801C79C8@ha
/* 8008860C 0008452C  38 63 79 C8 */	addi r3, r3, lbl_801C79C8@l
/* 80088610 00084530  90 A6 00 1C */	stw r5, 0x1c(r6)
/* 80088614 00084534  38 E4 00 02 */	addi r7, r4, 2
/* 80088618 00084538  39 06 00 20 */	addi r8, r6, 0x20
/* 8008861C 0008453C  A8 04 00 00 */	lha r0, 0(r4)
/* 80088620 00084540  38 83 00 0C */	addi r4, r3, 0xc
/* 80088624 00084544  B0 06 00 20 */	sth r0, 0x20(r6)
/* 80088628 00084548  C0 03 00 00 */	lfs f0, 0(r3)
/* 8008862C 0008454C  D0 06 00 28 */	stfs f0, 0x28(r6)
/* 80088630 00084550  C0 03 00 04 */	lfs f0, 4(r3)
/* 80088634 00084554  D0 06 00 30 */	stfs f0, 0x30(r6)
/* 80088638 00084558  A8 07 00 00 */	lha r0, 0(r7)
/* 8008863C 0008455C  B4 08 00 18 */	sthu r0, 0x18(r8)
/* 80088640 00084560  C0 03 00 0C */	lfs f0, 0xc(r3)
/* 80088644 00084564  D0 08 00 08 */	stfs f0, 8(r8)
/* 80088648 00084568  C0 03 00 10 */	lfs f0, 0x10(r3)
/* 8008864C 0008456C  D0 08 00 10 */	stfs f0, 0x10(r8)
/* 80088650 00084570  A8 07 00 02 */	lha r0, 2(r7)
/* 80088654 00084574  B4 08 00 18 */	sthu r0, 0x18(r8)
/* 80088658 00084578  C4 04 00 0C */	lfsu f0, 0xc(r4)
/* 8008865C 0008457C  D0 08 00 08 */	stfs f0, 8(r8)
/* 80088660 00084580  C0 04 00 04 */	lfs f0, 4(r4)
/* 80088664 00084584  D0 08 00 10 */	stfs f0, 0x10(r8)
/* 80088668 00084588  A8 07 00 04 */	lha r0, 4(r7)
/* 8008866C 0008458C  B4 08 00 18 */	sthu r0, 0x18(r8)
/* 80088670 00084590  C4 04 00 0C */	lfsu f0, 0xc(r4)
/* 80088674 00084594  D0 08 00 08 */	stfs f0, 8(r8)
/* 80088678 00084598  C0 04 00 04 */	lfs f0, 4(r4)
/* 8008867C 0008459C  D0 08 00 10 */	stfs f0, 0x10(r8)
/* 80088680 000845A0  A8 07 00 06 */	lha r0, 6(r7)
/* 80088684 000845A4  B4 08 00 18 */	sthu r0, 0x18(r8)
/* 80088688 000845A8  C4 04 00 0C */	lfsu f0, 0xc(r4)
/* 8008868C 000845AC  D0 08 00 08 */	stfs f0, 8(r8)
/* 80088690 000845B0  C0 04 00 04 */	lfs f0, 4(r4)
/* 80088694 000845B4  D0 08 00 10 */	stfs f0, 0x10(r8)
/* 80088698 000845B8  A8 07 00 08 */	lha r0, 8(r7)
/* 8008869C 000845BC  B4 08 00 18 */	sthu r0, 0x18(r8)
/* 800886A0 000845C0  C4 04 00 0C */	lfsu f0, 0xc(r4)
/* 800886A4 000845C4  D0 08 00 08 */	stfs f0, 8(r8)
/* 800886A8 000845C8  C0 04 00 04 */	lfs f0, 4(r4)
/* 800886AC 000845CC  D0 08 00 10 */	stfs f0, 0x10(r8)
/* 800886B0 000845D0  A8 07 00 0A */	lha r0, 0xa(r7)
/* 800886B4 000845D4  B4 08 00 18 */	sthu r0, 0x18(r8)
/* 800886B8 000845D8  C4 04 00 0C */	lfsu f0, 0xc(r4)
/* 800886BC 000845DC  D0 08 00 08 */	stfs f0, 8(r8)
/* 800886C0 000845E0  C0 04 00 04 */	lfs f0, 4(r4)
/* 800886C4 000845E4  D0 08 00 10 */	stfs f0, 0x10(r8)
/* 800886C8 000845E8  C0 02 AC F0 */	lfs f0, 0.0f
/* 800886CC 000845EC  D0 06 00 0C */	stfs f0, 0xc(r6)
/* 800886D0 000845F0  D0 06 00 10 */	stfs f0, 0x10(r6)
/* 800886D4 000845F4  90 A6 01 2C */	stw r5, 0x12c(r6)
/* 800886D8 000845F8  90 A6 01 30 */	stw r5, 0x130(r6)
/* 800886DC 000845FC  4E 80 00 20 */	blr
