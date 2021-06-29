.include "macros.inc"

.section .text, "ax"  # 0x800065A0 - 0x8010F860

.global UpdateIconOffsets
UpdateIconOffsets:
/* 800DB41C 000D733C  81 03 00 2C */	lwz r8, 0x2c(r3)
/* 800DB420 000D7340  3C 08 00 01 */	addis r0, r8, 1
/* 800DB424 000D7344  28 00 FF FF */	cmplwi r0, 0xffff
/* 800DB428 000D7348  40 82 00 18 */	bne lbl_800DB440
/* 800DB42C 000D734C  38 00 00 00 */	li r0, 0
/* 800DB430 000D7350  98 04 00 2E */	stb r0, 0x2e(r4)
/* 800DB434 000D7354  39 00 00 00 */	li r8, 0
/* 800DB438 000D7358  B0 04 00 34 */	sth r0, 0x34(r4)
/* 800DB43C 000D735C  B0 04 00 36 */	sth r0, 0x36(r4)
lbl_800DB440:
/* 800DB440 000D7360  88 03 00 07 */	lbz r0, 7(r3)
/* 800DB444 000D7364  39 20 00 00 */	li r9, 0
/* 800DB448 000D7368  54 00 07 BE */	clrlwi r0, r0, 0x1e
/* 800DB44C 000D736C  2C 00 00 02 */	cmpwi r0, 2
/* 800DB450 000D7370  41 82 00 28 */	beq lbl_800DB478
/* 800DB454 000D7374  40 80 00 38 */	bge lbl_800DB48C
/* 800DB458 000D7378  2C 00 00 01 */	cmpwi r0, 1
/* 800DB45C 000D737C  40 80 00 08 */	bge lbl_800DB464
/* 800DB460 000D7380  48 00 00 2C */	b lbl_800DB48C
lbl_800DB464:
/* 800DB464 000D7384  91 04 00 3C */	stw r8, 0x3c(r4)
/* 800DB468 000D7388  38 08 0C 00 */	addi r0, r8, 0xc00
/* 800DB46C 000D738C  39 08 0E 00 */	addi r8, r8, 0xe00
/* 800DB470 000D7390  90 04 00 40 */	stw r0, 0x40(r4)
/* 800DB474 000D7394  48 00 00 24 */	b lbl_800DB498
lbl_800DB478:
/* 800DB478 000D7398  91 04 00 3C */	stw r8, 0x3c(r4)
/* 800DB47C 000D739C  38 00 FF FF */	li r0, -1
/* 800DB480 000D73A0  39 08 18 00 */	addi r8, r8, 0x1800
/* 800DB484 000D73A4  90 04 00 40 */	stw r0, 0x40(r4)
/* 800DB488 000D73A8  48 00 00 10 */	b lbl_800DB498
lbl_800DB48C:
/* 800DB48C 000D73AC  38 00 FF FF */	li r0, -1
/* 800DB490 000D73B0  90 04 00 3C */	stw r0, 0x3c(r4)
/* 800DB494 000D73B4  90 04 00 40 */	stw r0, 0x40(r4)
lbl_800DB498:
/* 800DB498 000D73B8  38 00 00 02 */	li r0, 2
/* 800DB49C 000D73BC  7C 09 03 A6 */	mtctr r0
/* 800DB4A0 000D73C0  38 E4 00 00 */	addi r7, r4, 0
/* 800DB4A4 000D73C4  39 40 00 00 */	li r10, 0
/* 800DB4A8 000D73C8  38 C0 00 00 */	li r6, 0
/* 800DB4AC 000D73CC  38 00 FF FF */	li r0, -1
lbl_800DB4B0:
/* 800DB4B0 000D73D0  A0 A3 00 30 */	lhz r5, 0x30(r3)
/* 800DB4B4 000D73D4  7C A5 36 30 */	sraw r5, r5, r6
/* 800DB4B8 000D73D8  54 A5 07 BE */	clrlwi r5, r5, 0x1e
/* 800DB4BC 000D73DC  2C 05 00 02 */	cmpwi r5, 2
/* 800DB4C0 000D73E0  41 82 00 24 */	beq lbl_800DB4E4
/* 800DB4C4 000D73E4  40 80 00 2C */	bge lbl_800DB4F0
/* 800DB4C8 000D73E8  2C 05 00 01 */	cmpwi r5, 1
/* 800DB4CC 000D73EC  40 80 00 08 */	bge lbl_800DB4D4
/* 800DB4D0 000D73F0  48 00 00 20 */	b lbl_800DB4F0
lbl_800DB4D4:
/* 800DB4D4 000D73F4  91 07 00 44 */	stw r8, 0x44(r7)
/* 800DB4D8 000D73F8  39 20 00 01 */	li r9, 1
/* 800DB4DC 000D73FC  39 08 04 00 */	addi r8, r8, 0x400
/* 800DB4E0 000D7400  48 00 00 14 */	b lbl_800DB4F4
lbl_800DB4E4:
/* 800DB4E4 000D7404  91 07 00 44 */	stw r8, 0x44(r7)
/* 800DB4E8 000D7408  39 08 08 00 */	addi r8, r8, 0x800
/* 800DB4EC 000D740C  48 00 00 08 */	b lbl_800DB4F4
lbl_800DB4F0:
/* 800DB4F0 000D7410  90 07 00 44 */	stw r0, 0x44(r7)
lbl_800DB4F4:
/* 800DB4F4 000D7414  A0 A3 00 30 */	lhz r5, 0x30(r3)
/* 800DB4F8 000D7418  38 C6 00 02 */	addi r6, r6, 2
/* 800DB4FC 000D741C  38 E7 00 04 */	addi r7, r7, 4
/* 800DB500 000D7420  7C A5 36 30 */	sraw r5, r5, r6
/* 800DB504 000D7424  54 A5 07 BE */	clrlwi r5, r5, 0x1e
/* 800DB508 000D7428  2C 05 00 02 */	cmpwi r5, 2
/* 800DB50C 000D742C  41 82 00 24 */	beq lbl_800DB530
/* 800DB510 000D7430  40 80 00 2C */	bge lbl_800DB53C
/* 800DB514 000D7434  2C 05 00 01 */	cmpwi r5, 1
/* 800DB518 000D7438  40 80 00 08 */	bge lbl_800DB520
/* 800DB51C 000D743C  48 00 00 20 */	b lbl_800DB53C
lbl_800DB520:
/* 800DB520 000D7440  91 07 00 44 */	stw r8, 0x44(r7)
/* 800DB524 000D7444  39 20 00 01 */	li r9, 1
/* 800DB528 000D7448  39 08 04 00 */	addi r8, r8, 0x400
/* 800DB52C 000D744C  48 00 00 14 */	b lbl_800DB540
lbl_800DB530:
/* 800DB530 000D7450  91 07 00 44 */	stw r8, 0x44(r7)
/* 800DB534 000D7454  39 08 08 00 */	addi r8, r8, 0x800
/* 800DB538 000D7458  48 00 00 08 */	b lbl_800DB540
lbl_800DB53C:
/* 800DB53C 000D745C  90 07 00 44 */	stw r0, 0x44(r7)
lbl_800DB540:
/* 800DB540 000D7460  A0 A3 00 30 */	lhz r5, 0x30(r3)
/* 800DB544 000D7464  38 C6 00 02 */	addi r6, r6, 2
/* 800DB548 000D7468  39 4A 00 01 */	addi r10, r10, 1
/* 800DB54C 000D746C  7C A5 36 30 */	sraw r5, r5, r6
/* 800DB550 000D7470  54 A5 07 BE */	clrlwi r5, r5, 0x1e
/* 800DB554 000D7474  2C 05 00 02 */	cmpwi r5, 2
/* 800DB558 000D7478  38 E7 00 04 */	addi r7, r7, 4
/* 800DB55C 000D747C  41 82 00 24 */	beq lbl_800DB580
/* 800DB560 000D7480  40 80 00 2C */	bge lbl_800DB58C
/* 800DB564 000D7484  2C 05 00 01 */	cmpwi r5, 1
/* 800DB568 000D7488  40 80 00 08 */	bge lbl_800DB570
/* 800DB56C 000D748C  48 00 00 20 */	b lbl_800DB58C
lbl_800DB570:
/* 800DB570 000D7490  91 07 00 44 */	stw r8, 0x44(r7)
/* 800DB574 000D7494  39 20 00 01 */	li r9, 1
/* 800DB578 000D7498  39 08 04 00 */	addi r8, r8, 0x400
/* 800DB57C 000D749C  48 00 00 14 */	b lbl_800DB590
lbl_800DB580:
/* 800DB580 000D74A0  91 07 00 44 */	stw r8, 0x44(r7)
/* 800DB584 000D74A4  39 08 08 00 */	addi r8, r8, 0x800
/* 800DB588 000D74A8  48 00 00 08 */	b lbl_800DB590
lbl_800DB58C:
/* 800DB58C 000D74AC  90 07 00 44 */	stw r0, 0x44(r7)
lbl_800DB590:
/* 800DB590 000D74B0  A0 A3 00 30 */	lhz r5, 0x30(r3)
/* 800DB594 000D74B4  38 C6 00 02 */	addi r6, r6, 2
/* 800DB598 000D74B8  39 4A 00 01 */	addi r10, r10, 1
/* 800DB59C 000D74BC  7C A5 36 30 */	sraw r5, r5, r6
/* 800DB5A0 000D74C0  54 A5 07 BE */	clrlwi r5, r5, 0x1e
/* 800DB5A4 000D74C4  2C 05 00 02 */	cmpwi r5, 2
/* 800DB5A8 000D74C8  38 E7 00 04 */	addi r7, r7, 4
/* 800DB5AC 000D74CC  41 82 00 24 */	beq lbl_800DB5D0
/* 800DB5B0 000D74D0  40 80 00 2C */	bge lbl_800DB5DC
/* 800DB5B4 000D74D4  2C 05 00 01 */	cmpwi r5, 1
/* 800DB5B8 000D74D8  40 80 00 08 */	bge lbl_800DB5C0
/* 800DB5BC 000D74DC  48 00 00 20 */	b lbl_800DB5DC
lbl_800DB5C0:
/* 800DB5C0 000D74E0  91 07 00 44 */	stw r8, 0x44(r7)
/* 800DB5C4 000D74E4  39 20 00 01 */	li r9, 1
/* 800DB5C8 000D74E8  39 08 04 00 */	addi r8, r8, 0x400
/* 800DB5CC 000D74EC  48 00 00 14 */	b lbl_800DB5E0
lbl_800DB5D0:
/* 800DB5D0 000D74F0  91 07 00 44 */	stw r8, 0x44(r7)
/* 800DB5D4 000D74F4  39 08 08 00 */	addi r8, r8, 0x800
/* 800DB5D8 000D74F8  48 00 00 08 */	b lbl_800DB5E0
lbl_800DB5DC:
/* 800DB5DC 000D74FC  90 07 00 44 */	stw r0, 0x44(r7)
lbl_800DB5E0:
/* 800DB5E0 000D7500  38 C6 00 02 */	addi r6, r6, 2
/* 800DB5E4 000D7504  38 E7 00 04 */	addi r7, r7, 4
/* 800DB5E8 000D7508  39 4A 00 01 */	addi r10, r10, 1
/* 800DB5EC 000D750C  42 00 FE C4 */	bdnz lbl_800DB4B0
/* 800DB5F0 000D7510  2C 09 00 00 */	cmpwi r9, 0
/* 800DB5F4 000D7514  41 82 00 10 */	beq lbl_800DB604
/* 800DB5F8 000D7518  91 04 00 64 */	stw r8, 0x64(r4)
/* 800DB5FC 000D751C  39 08 02 00 */	addi r8, r8, 0x200
/* 800DB600 000D7520  48 00 00 0C */	b lbl_800DB60C
lbl_800DB604:
/* 800DB604 000D7524  38 00 FF FF */	li r0, -1
/* 800DB608 000D7528  90 04 00 64 */	stw r0, 0x64(r4)
lbl_800DB60C:
/* 800DB60C 000D752C  91 04 00 68 */	stw r8, 0x68(r4)
/* 800DB610 000D7530  4E 80 00 20 */	blr 

.global CARDGetStatus
CARDGetStatus:
/* 800DB614 000D7534  7C 08 02 A6 */	mflr r0
/* 800DB618 000D7538  90 01 00 04 */	stw r0, 4(r1)
/* 800DB61C 000D753C  94 21 FF D8 */	stwu r1, -0x28(r1)
/* 800DB620 000D7540  93 E1 00 24 */	stw r31, 0x24(r1)
/* 800DB624 000D7544  3B E5 00 00 */	addi r31, r5, 0
/* 800DB628 000D7548  93 C1 00 20 */	stw r30, 0x20(r1)
/* 800DB62C 000D754C  93 A1 00 1C */	stw r29, 0x1c(r1)
/* 800DB630 000D7550  7C 9D 23 79 */	or. r29, r4, r4
/* 800DB634 000D7554  41 80 00 0C */	blt lbl_800DB640
/* 800DB638 000D7558  2C 1D 00 7F */	cmpwi r29, 0x7f
/* 800DB63C 000D755C  41 80 00 0C */	blt lbl_800DB648
lbl_800DB640:
/* 800DB640 000D7560  38 60 FF 80 */	li r3, -128
/* 800DB644 000D7564  48 00 00 DC */	b lbl_800DB720
lbl_800DB648:
/* 800DB648 000D7568  38 81 00 14 */	addi r4, r1, 0x14
/* 800DB64C 000D756C  4B FF AB 85 */	bl __CARDGetControlBlock
/* 800DB650 000D7570  2C 03 00 00 */	cmpwi r3, 0
/* 800DB654 000D7574  40 80 00 08 */	bge lbl_800DB65C
/* 800DB658 000D7578  48 00 00 C8 */	b lbl_800DB720
lbl_800DB65C:
/* 800DB65C 000D757C  80 61 00 14 */	lwz r3, 0x14(r1)
/* 800DB660 000D7580  4B FF C7 41 */	bl __CARDGetDirBlock
/* 800DB664 000D7584  57 A0 30 32 */	slwi r0, r29, 6
/* 800DB668 000D7588  7F A3 02 14 */	add r29, r3, r0
/* 800DB66C 000D758C  38 7D 00 00 */	addi r3, r29, 0
/* 800DB670 000D7590  4B FF EA 11 */	bl __CARDAccess
/* 800DB674 000D7594  3B C3 00 00 */	addi r30, r3, 0
/* 800DB678 000D7598  2C 1E FF F6 */	cmpwi r30, -10
/* 800DB67C 000D759C  40 82 00 10 */	bne lbl_800DB68C
/* 800DB680 000D75A0  7F A3 EB 78 */	mr r3, r29
/* 800DB684 000D75A4  4B FF EA 89 */	bl __CARDIsPublic
/* 800DB688 000D75A8  7C 7E 1B 78 */	mr r30, r3
lbl_800DB68C:
/* 800DB68C 000D75AC  2C 1E 00 00 */	cmpwi r30, 0
/* 800DB690 000D75B0  41 80 00 84 */	blt lbl_800DB714
/* 800DB694 000D75B4  38 9D 00 00 */	addi r4, r29, 0
/* 800DB698 000D75B8  38 7F 00 28 */	addi r3, r31, 0x28
/* 800DB69C 000D75BC  38 A0 00 04 */	li r5, 4
/* 800DB6A0 000D75C0  4B F2 7D 75 */	bl memcpy
/* 800DB6A4 000D75C4  38 7F 00 2C */	addi r3, r31, 0x2c
/* 800DB6A8 000D75C8  38 9D 00 04 */	addi r4, r29, 4
/* 800DB6AC 000D75CC  38 A0 00 02 */	li r5, 2
/* 800DB6B0 000D75D0  4B F2 7D 65 */	bl memcpy
/* 800DB6B4 000D75D4  80 A1 00 14 */	lwz r5, 0x14(r1)
/* 800DB6B8 000D75D8  7F E3 FB 78 */	mr r3, r31
/* 800DB6BC 000D75DC  A0 DD 00 38 */	lhz r6, 0x38(r29)
/* 800DB6C0 000D75E0  38 9D 00 08 */	addi r4, r29, 8
/* 800DB6C4 000D75E4  80 05 00 0C */	lwz r0, 0xc(r5)
/* 800DB6C8 000D75E8  38 A0 00 20 */	li r5, 0x20
/* 800DB6CC 000D75EC  7C 06 01 D6 */	mullw r0, r6, r0
/* 800DB6D0 000D75F0  90 1F 00 20 */	stw r0, 0x20(r31)
/* 800DB6D4 000D75F4  4B F2 7D 41 */	bl memcpy
/* 800DB6D8 000D75F8  80 1D 00 28 */	lwz r0, 0x28(r29)
/* 800DB6DC 000D75FC  38 7D 00 00 */	addi r3, r29, 0
/* 800DB6E0 000D7600  38 9F 00 00 */	addi r4, r31, 0
/* 800DB6E4 000D7604  90 1F 00 24 */	stw r0, 0x24(r31)
/* 800DB6E8 000D7608  88 1D 00 07 */	lbz r0, 7(r29)
/* 800DB6EC 000D760C  98 1F 00 2E */	stb r0, 0x2e(r31)
/* 800DB6F0 000D7610  80 1D 00 2C */	lwz r0, 0x2c(r29)
/* 800DB6F4 000D7614  90 1F 00 30 */	stw r0, 0x30(r31)
/* 800DB6F8 000D7618  A0 1D 00 30 */	lhz r0, 0x30(r29)
/* 800DB6FC 000D761C  B0 1F 00 34 */	sth r0, 0x34(r31)
/* 800DB700 000D7620  A0 1D 00 32 */	lhz r0, 0x32(r29)
/* 800DB704 000D7624  B0 1F 00 36 */	sth r0, 0x36(r31)
/* 800DB708 000D7628  80 1D 00 3C */	lwz r0, 0x3c(r29)
/* 800DB70C 000D762C  90 1F 00 38 */	stw r0, 0x38(r31)
/* 800DB710 000D7630  4B FF FD 0D */	bl UpdateIconOffsets
lbl_800DB714:
/* 800DB714 000D7634  80 61 00 14 */	lwz r3, 0x14(r1)
/* 800DB718 000D7638  7F C4 F3 78 */	mr r4, r30
/* 800DB71C 000D763C  4B FF AB 65 */	bl __CARDPutControlBlock
lbl_800DB720:
/* 800DB720 000D7640  80 01 00 2C */	lwz r0, 0x2c(r1)
/* 800DB724 000D7644  83 E1 00 24 */	lwz r31, 0x24(r1)
/* 800DB728 000D7648  83 C1 00 20 */	lwz r30, 0x20(r1)
/* 800DB72C 000D764C  7C 08 03 A6 */	mtlr r0
/* 800DB730 000D7650  83 A1 00 1C */	lwz r29, 0x1c(r1)
/* 800DB734 000D7654  38 21 00 28 */	addi r1, r1, 0x28
/* 800DB738 000D7658  4E 80 00 20 */	blr 

.global CARDSetStatusAsync
CARDSetStatusAsync:
/* 800DB73C 000D765C  7C 08 02 A6 */	mflr r0
/* 800DB740 000D7660  90 01 00 04 */	stw r0, 4(r1)
/* 800DB744 000D7664  94 21 FF D0 */	stwu r1, -0x30(r1)
/* 800DB748 000D7668  93 E1 00 2C */	stw r31, 0x2c(r1)
/* 800DB74C 000D766C  7C 9F 23 79 */	or. r31, r4, r4
/* 800DB750 000D7670  93 C1 00 28 */	stw r30, 0x28(r1)
/* 800DB754 000D7674  3B C6 00 00 */	addi r30, r6, 0
/* 800DB758 000D7678  93 A1 00 24 */	stw r29, 0x24(r1)
/* 800DB75C 000D767C  3B A5 00 00 */	addi r29, r5, 0
/* 800DB760 000D7680  93 81 00 20 */	stw r28, 0x20(r1)
/* 800DB764 000D7684  3B 83 00 00 */	addi r28, r3, 0
/* 800DB768 000D7688  41 80 00 40 */	blt lbl_800DB7A8
/* 800DB76C 000D768C  2C 1F 00 7F */	cmpwi r31, 0x7f
/* 800DB770 000D7690  40 80 00 38 */	bge lbl_800DB7A8
/* 800DB774 000D7694  80 7D 00 30 */	lwz r3, 0x30(r29)
/* 800DB778 000D7698  3C 03 00 01 */	addis r0, r3, 1
/* 800DB77C 000D769C  28 00 FF FF */	cmplwi r0, 0xffff
/* 800DB780 000D76A0  41 82 00 0C */	beq lbl_800DB78C
/* 800DB784 000D76A4  28 03 02 00 */	cmplwi r3, 0x200
/* 800DB788 000D76A8  40 80 00 20 */	bge lbl_800DB7A8
lbl_800DB78C:
/* 800DB78C 000D76AC  80 7D 00 38 */	lwz r3, 0x38(r29)
/* 800DB790 000D76B0  3C 03 00 01 */	addis r0, r3, 1
/* 800DB794 000D76B4  28 00 FF FF */	cmplwi r0, 0xffff
/* 800DB798 000D76B8  41 82 00 18 */	beq lbl_800DB7B0
/* 800DB79C 000D76BC  54 60 04 FE */	clrlwi r0, r3, 0x13
/* 800DB7A0 000D76C0  28 00 1F C0 */	cmplwi r0, 0x1fc0
/* 800DB7A4 000D76C4  40 81 00 0C */	ble lbl_800DB7B0
lbl_800DB7A8:
/* 800DB7A8 000D76C8  38 60 FF 80 */	li r3, -128
/* 800DB7AC 000D76CC  48 00 00 E0 */	b lbl_800DB88C
lbl_800DB7B0:
/* 800DB7B0 000D76D0  38 7C 00 00 */	addi r3, r28, 0
/* 800DB7B4 000D76D4  38 81 00 18 */	addi r4, r1, 0x18
/* 800DB7B8 000D76D8  4B FF AA 19 */	bl __CARDGetControlBlock
/* 800DB7BC 000D76DC  2C 03 00 00 */	cmpwi r3, 0
/* 800DB7C0 000D76E0  40 80 00 08 */	bge lbl_800DB7C8
/* 800DB7C4 000D76E4  48 00 00 C8 */	b lbl_800DB88C
lbl_800DB7C8:
/* 800DB7C8 000D76E8  80 61 00 18 */	lwz r3, 0x18(r1)
/* 800DB7CC 000D76EC  4B FF C5 D5 */	bl __CARDGetDirBlock
/* 800DB7D0 000D76F0  57 E0 30 32 */	slwi r0, r31, 6
/* 800DB7D4 000D76F4  7F E3 02 14 */	add r31, r3, r0
/* 800DB7D8 000D76F8  38 7F 00 00 */	addi r3, r31, 0
/* 800DB7DC 000D76FC  4B FF E8 A5 */	bl __CARDAccess
/* 800DB7E0 000D7700  7C 64 1B 79 */	or. r4, r3, r3
/* 800DB7E4 000D7704  40 80 00 10 */	bge lbl_800DB7F4
/* 800DB7E8 000D7708  80 61 00 18 */	lwz r3, 0x18(r1)
/* 800DB7EC 000D770C  4B FF AA 95 */	bl __CARDPutControlBlock
/* 800DB7F0 000D7710  48 00 00 9C */	b lbl_800DB88C
lbl_800DB7F4:
/* 800DB7F4 000D7714  88 1D 00 2E */	lbz r0, 0x2e(r29)
/* 800DB7F8 000D7718  38 7F 00 00 */	addi r3, r31, 0
/* 800DB7FC 000D771C  38 9D 00 00 */	addi r4, r29, 0
/* 800DB800 000D7720  98 1F 00 07 */	stb r0, 7(r31)
/* 800DB804 000D7724  80 1D 00 30 */	lwz r0, 0x30(r29)
/* 800DB808 000D7728  90 1F 00 2C */	stw r0, 0x2c(r31)
/* 800DB80C 000D772C  A0 1D 00 34 */	lhz r0, 0x34(r29)
/* 800DB810 000D7730  B0 1F 00 30 */	sth r0, 0x30(r31)
/* 800DB814 000D7734  A0 1D 00 36 */	lhz r0, 0x36(r29)
/* 800DB818 000D7738  B0 1F 00 32 */	sth r0, 0x32(r31)
/* 800DB81C 000D773C  80 1D 00 38 */	lwz r0, 0x38(r29)
/* 800DB820 000D7740  90 1F 00 3C */	stw r0, 0x3c(r31)
/* 800DB824 000D7744  4B FF FB F9 */	bl UpdateIconOffsets
/* 800DB828 000D7748  80 7F 00 2C */	lwz r3, 0x2c(r31)
/* 800DB82C 000D774C  3C 03 00 01 */	addis r0, r3, 1
/* 800DB830 000D7750  28 00 FF FF */	cmplwi r0, 0xffff
/* 800DB834 000D7754  40 82 00 14 */	bne lbl_800DB848
/* 800DB838 000D7758  A0 1F 00 32 */	lhz r0, 0x32(r31)
/* 800DB83C 000D775C  54 00 00 3A */	rlwinm r0, r0, 0, 0, 0x1d
/* 800DB840 000D7760  60 00 00 01 */	ori r0, r0, 1
/* 800DB844 000D7764  B0 1F 00 32 */	sth r0, 0x32(r31)
lbl_800DB848:
/* 800DB848 000D7768  3C 60 80 00 */	lis r3, 0x800000F8@ha
/* 800DB84C 000D776C  80 03 00 F8 */	lwz r0, 0x800000F8@l(r3)
/* 800DB850 000D7770  54 1D F0 BE */	srwi r29, r0, 2
/* 800DB854 000D7774  4B FE E1 29 */	bl OSGetTime
/* 800DB858 000D7778  38 DD 00 00 */	addi r6, r29, 0
/* 800DB85C 000D777C  38 A0 00 00 */	li r5, 0
/* 800DB860 000D7780  48 02 7E 55 */	bl __div2i
/* 800DB864 000D7784  90 9F 00 28 */	stw r4, 0x28(r31)
/* 800DB868 000D7788  38 7C 00 00 */	addi r3, r28, 0
/* 800DB86C 000D778C  38 9E 00 00 */	addi r4, r30, 0
/* 800DB870 000D7790  4B FF C6 D1 */	bl __CARDUpdateDir
/* 800DB874 000D7794  7C 7C 1B 79 */	or. r28, r3, r3
/* 800DB878 000D7798  40 80 00 10 */	bge lbl_800DB888
/* 800DB87C 000D779C  80 61 00 18 */	lwz r3, 0x18(r1)
/* 800DB880 000D77A0  7F 84 E3 78 */	mr r4, r28
/* 800DB884 000D77A4  4B FF A9 FD */	bl __CARDPutControlBlock
lbl_800DB888:
/* 800DB888 000D77A8  7F 83 E3 78 */	mr r3, r28
lbl_800DB88C:
/* 800DB88C 000D77AC  80 01 00 34 */	lwz r0, 0x34(r1)
/* 800DB890 000D77B0  83 E1 00 2C */	lwz r31, 0x2c(r1)
/* 800DB894 000D77B4  83 C1 00 28 */	lwz r30, 0x28(r1)
/* 800DB898 000D77B8  7C 08 03 A6 */	mtlr r0
/* 800DB89C 000D77BC  83 A1 00 24 */	lwz r29, 0x24(r1)
/* 800DB8A0 000D77C0  83 81 00 20 */	lwz r28, 0x20(r1)
/* 800DB8A4 000D77C4  38 21 00 30 */	addi r1, r1, 0x30
/* 800DB8A8 000D77C8  4E 80 00 20 */	blr 
