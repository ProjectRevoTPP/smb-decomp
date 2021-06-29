.include "macros.inc"

.section .text, "ax"  # 0x800065A0 - 0x8010F860

.global CreateCallbackFat
CreateCallbackFat:
/* 800DA5C8 000D64E8  7C 08 02 A6 */	mflr r0
/* 800DA5CC 000D64EC  90 01 00 04 */	stw r0, 4(r1)
/* 800DA5D0 000D64F0  94 21 FF D8 */	stwu r1, -0x28(r1)
/* 800DA5D4 000D64F4  BF 61 00 14 */	stmw r27, 0x14(r1)
/* 800DA5D8 000D64F8  3B 83 00 00 */	addi r28, r3, 0
/* 800DA5DC 000D64FC  3C 60 80 2C */	lis r3, __CARDBlock@ha
/* 800DA5E0 000D6500  1C BC 01 08 */	mulli r5, r28, 0x108
/* 800DA5E4 000D6504  38 03 7C 60 */	addi r0, r3, __CARDBlock@l
/* 800DA5E8 000D6508  7F E0 2A 14 */	add r31, r0, r5
/* 800DA5EC 000D650C  83 BF 00 D0 */	lwz r29, 0xd0(r31)
/* 800DA5F0 000D6510  3B 60 00 00 */	li r27, 0
/* 800DA5F4 000D6514  7C 9E 23 79 */	or. r30, r4, r4
/* 800DA5F8 000D6518  93 7F 00 D0 */	stw r27, 0xd0(r31)
/* 800DA5FC 000D651C  41 80 00 C0 */	blt lbl_800DA6BC
/* 800DA600 000D6520  7F E3 FB 78 */	mr r3, r31
/* 800DA604 000D6524  4B FF D7 9D */	bl __CARDGetDirBlock
/* 800DA608 000D6528  A0 1F 00 BC */	lhz r0, 0xbc(r31)
/* 800DA60C 000D652C  38 A0 00 04 */	li r5, 4
/* 800DA610 000D6530  80 8D A3 58 */	lwz r4, __CARDDiskID-_SDA_BASE_(r13)
/* 800DA614 000D6534  54 00 30 32 */	slwi r0, r0, 6
/* 800DA618 000D6538  7F C3 02 14 */	add r30, r3, r0
/* 800DA61C 000D653C  38 7E 00 00 */	addi r3, r30, 0
/* 800DA620 000D6540  4B F2 8D F5 */	bl memcpy
/* 800DA624 000D6544  80 8D A3 58 */	lwz r4, __CARDDiskID-_SDA_BASE_(r13)
/* 800DA628 000D6548  38 7E 00 04 */	addi r3, r30, 4
/* 800DA62C 000D654C  38 A0 00 02 */	li r5, 2
/* 800DA630 000D6550  38 84 00 04 */	addi r4, r4, 4
/* 800DA634 000D6554  4B F2 8D E1 */	bl memcpy
/* 800DA638 000D6558  38 00 00 04 */	li r0, 4
/* 800DA63C 000D655C  98 1E 00 34 */	stb r0, 0x34(r30)
/* 800DA640 000D6560  38 00 FF FF */	li r0, -1
/* 800DA644 000D6564  3C 60 80 00 */	lis r3, 0x800000F8@ha
/* 800DA648 000D6568  9B 7E 00 35 */	stb r27, 0x35(r30)
/* 800DA64C 000D656C  A0 9F 00 BE */	lhz r4, 0xbe(r31)
/* 800DA650 000D6570  B0 9E 00 36 */	sth r4, 0x36(r30)
/* 800DA654 000D6574  9B 7E 00 07 */	stb r27, 7(r30)
/* 800DA658 000D6578  90 1E 00 2C */	stw r0, 0x2c(r30)
/* 800DA65C 000D657C  B3 7E 00 30 */	sth r27, 0x30(r30)
/* 800DA660 000D6580  B3 7E 00 32 */	sth r27, 0x32(r30)
/* 800DA664 000D6584  90 1E 00 3C */	stw r0, 0x3c(r30)
/* 800DA668 000D6588  A0 1E 00 32 */	lhz r0, 0x32(r30)
/* 800DA66C 000D658C  54 00 00 3A */	rlwinm r0, r0, 0, 0, 0x1d
/* 800DA670 000D6590  60 00 00 01 */	ori r0, r0, 1
/* 800DA674 000D6594  B0 1E 00 32 */	sth r0, 0x32(r30)
/* 800DA678 000D6598  80 9F 00 C0 */	lwz r4, 0xc0(r31)
/* 800DA67C 000D659C  93 64 00 08 */	stw r27, 8(r4)
/* 800DA680 000D65A0  A0 1E 00 36 */	lhz r0, 0x36(r30)
/* 800DA684 000D65A4  80 9F 00 C0 */	lwz r4, 0xc0(r31)
/* 800DA688 000D65A8  B0 04 00 10 */	sth r0, 0x10(r4)
/* 800DA68C 000D65AC  80 03 00 F8 */	lwz r0, 0x800000F8@l(r3)
/* 800DA690 000D65B0  54 1B F0 BE */	srwi r27, r0, 2
/* 800DA694 000D65B4  4B FE F2 E9 */	bl OSGetTime
/* 800DA698 000D65B8  38 DB 00 00 */	addi r6, r27, 0
/* 800DA69C 000D65BC  38 A0 00 00 */	li r5, 0
/* 800DA6A0 000D65C0  48 02 90 15 */	bl __div2i
/* 800DA6A4 000D65C4  90 9E 00 28 */	stw r4, 0x28(r30)
/* 800DA6A8 000D65C8  38 7C 00 00 */	addi r3, r28, 0
/* 800DA6AC 000D65CC  38 9D 00 00 */	addi r4, r29, 0
/* 800DA6B0 000D65D0  4B FF D8 91 */	bl __CARDUpdateDir
/* 800DA6B4 000D65D4  7C 7E 1B 79 */	or. r30, r3, r3
/* 800DA6B8 000D65D8  40 80 00 2C */	bge lbl_800DA6E4
lbl_800DA6BC:
/* 800DA6BC 000D65DC  38 7F 00 00 */	addi r3, r31, 0
/* 800DA6C0 000D65E0  38 9E 00 00 */	addi r4, r30, 0
/* 800DA6C4 000D65E4  4B FF BB BD */	bl __CARDPutControlBlock
/* 800DA6C8 000D65E8  28 1D 00 00 */	cmplwi r29, 0
/* 800DA6CC 000D65EC  41 82 00 18 */	beq lbl_800DA6E4
/* 800DA6D0 000D65F0  39 9D 00 00 */	addi r12, r29, 0
/* 800DA6D4 000D65F4  7D 88 03 A6 */	mtlr r12
/* 800DA6D8 000D65F8  38 7C 00 00 */	addi r3, r28, 0
/* 800DA6DC 000D65FC  38 9E 00 00 */	addi r4, r30, 0
/* 800DA6E0 000D6600  4E 80 00 21 */	blrl 
lbl_800DA6E4:
/* 800DA6E4 000D6604  BB 61 00 14 */	lmw r27, 0x14(r1)
/* 800DA6E8 000D6608  80 01 00 2C */	lwz r0, 0x2c(r1)
/* 800DA6EC 000D660C  38 21 00 28 */	addi r1, r1, 0x28
/* 800DA6F0 000D6610  7C 08 03 A6 */	mtlr r0
/* 800DA6F4 000D6614  4E 80 00 20 */	blr 

.global CARDCreateAsync
CARDCreateAsync:
/* 800DA6F8 000D6618  7C 08 02 A6 */	mflr r0
/* 800DA6FC 000D661C  90 01 00 04 */	stw r0, 4(r1)
/* 800DA700 000D6620  94 21 FF B8 */	stwu r1, -0x48(r1)
/* 800DA704 000D6624  BE E1 00 24 */	stmw r23, 0x24(r1)
/* 800DA708 000D6628  3B 44 00 00 */	addi r26, r4, 0
/* 800DA70C 000D662C  3B 23 00 00 */	addi r25, r3, 0
/* 800DA710 000D6630  3B 65 00 00 */	addi r27, r5, 0
/* 800DA714 000D6634  3B 86 00 00 */	addi r28, r6, 0
/* 800DA718 000D6638  3B A7 00 00 */	addi r29, r7, 0
/* 800DA71C 000D663C  38 7A 00 00 */	addi r3, r26, 0
/* 800DA720 000D6640  48 02 C4 41 */	bl strlen
/* 800DA724 000D6644  28 03 00 20 */	cmplwi r3, 0x20
/* 800DA728 000D6648  40 81 00 0C */	ble lbl_800DA734
/* 800DA72C 000D664C  38 60 FF F4 */	li r3, -12
/* 800DA730 000D6650  48 00 01 CC */	b lbl_800DA8FC
lbl_800DA734:
/* 800DA734 000D6654  38 79 00 00 */	addi r3, r25, 0
/* 800DA738 000D6658  38 81 00 1C */	addi r4, r1, 0x1c
/* 800DA73C 000D665C  4B FF BA 95 */	bl __CARDGetControlBlock
/* 800DA740 000D6660  2C 03 00 00 */	cmpwi r3, 0
/* 800DA744 000D6664  40 80 00 08 */	bge lbl_800DA74C
/* 800DA748 000D6668  48 00 01 B4 */	b lbl_800DA8FC
lbl_800DA74C:
/* 800DA74C 000D666C  28 1B 00 00 */	cmplwi r27, 0
/* 800DA750 000D6670  41 82 00 1C */	beq lbl_800DA76C
/* 800DA754 000D6674  80 61 00 1C */	lwz r3, 0x1c(r1)
/* 800DA758 000D6678  80 83 00 0C */	lwz r4, 0xc(r3)
/* 800DA75C 000D667C  7C 1B 23 96 */	divwu r0, r27, r4
/* 800DA760 000D6680  7C 00 21 D6 */	mullw r0, r0, r4
/* 800DA764 000D6684  7C 00 D8 51 */	subf. r0, r0, r27
/* 800DA768 000D6688  41 82 00 0C */	beq lbl_800DA774
lbl_800DA76C:
/* 800DA76C 000D668C  38 60 FF 80 */	li r3, -128
/* 800DA770 000D6690  48 00 01 8C */	b lbl_800DA8FC
lbl_800DA774:
/* 800DA774 000D6694  3C 80 00 01 */	lis r4, 0x0000FFFF@ha
/* 800DA778 000D6698  3B C4 FF FF */	addi r30, r4, 0x0000FFFF@l
/* 800DA77C 000D669C  4B FF D6 25 */	bl __CARDGetDirBlock
/* 800DA780 000D66A0  3B E3 00 00 */	addi r31, r3, 0
/* 800DA784 000D66A4  3B 1F 00 00 */	addi r24, r31, 0
/* 800DA788 000D66A8  3A E0 00 00 */	li r23, 0
/* 800DA78C 000D66AC  48 00 00 84 */	b lbl_800DA810
lbl_800DA790:
/* 800DA790 000D66B0  88 18 00 00 */	lbz r0, 0(r24)
/* 800DA794 000D66B4  28 00 00 FF */	cmplwi r0, 0xff
/* 800DA798 000D66B8  40 82 00 18 */	bne lbl_800DA7B0
/* 800DA79C 000D66BC  57 C0 04 3E */	clrlwi r0, r30, 0x10
/* 800DA7A0 000D66C0  28 00 FF FF */	cmplwi r0, 0xffff
/* 800DA7A4 000D66C4  40 82 00 64 */	bne lbl_800DA808
/* 800DA7A8 000D66C8  7E FE BB 78 */	mr r30, r23
/* 800DA7AC 000D66CC  48 00 00 5C */	b lbl_800DA808
lbl_800DA7B0:
/* 800DA7B0 000D66D0  80 8D A3 58 */	lwz r4, __CARDDiskID-_SDA_BASE_(r13)
/* 800DA7B4 000D66D4  38 78 00 00 */	addi r3, r24, 0
/* 800DA7B8 000D66D8  38 A0 00 04 */	li r5, 4
/* 800DA7BC 000D66DC  48 02 A0 3D */	bl memcmp
/* 800DA7C0 000D66E0  2C 03 00 00 */	cmpwi r3, 0
/* 800DA7C4 000D66E4  40 82 00 44 */	bne lbl_800DA808
/* 800DA7C8 000D66E8  80 8D A3 58 */	lwz r4, __CARDDiskID-_SDA_BASE_(r13)
/* 800DA7CC 000D66EC  38 78 00 04 */	addi r3, r24, 4
/* 800DA7D0 000D66F0  38 A0 00 02 */	li r5, 2
/* 800DA7D4 000D66F4  38 84 00 04 */	addi r4, r4, 4
/* 800DA7D8 000D66F8  48 02 A0 21 */	bl memcmp
/* 800DA7DC 000D66FC  2C 03 00 00 */	cmpwi r3, 0
/* 800DA7E0 000D6700  40 82 00 28 */	bne lbl_800DA808
/* 800DA7E4 000D6704  38 78 00 00 */	addi r3, r24, 0
/* 800DA7E8 000D6708  38 9A 00 00 */	addi r4, r26, 0
/* 800DA7EC 000D670C  4B FF F8 2D */	bl __CARDCompareFileName
/* 800DA7F0 000D6710  2C 03 00 00 */	cmpwi r3, 0
/* 800DA7F4 000D6714  41 82 00 14 */	beq lbl_800DA808
/* 800DA7F8 000D6718  80 61 00 1C */	lwz r3, 0x1c(r1)
/* 800DA7FC 000D671C  38 80 FF F9 */	li r4, -7
/* 800DA800 000D6720  4B FF BA 81 */	bl __CARDPutControlBlock
/* 800DA804 000D6724  48 00 00 F8 */	b lbl_800DA8FC
lbl_800DA808:
/* 800DA808 000D6728  3B 18 00 40 */	addi r24, r24, 0x40
/* 800DA80C 000D672C  3A F7 00 01 */	addi r23, r23, 1
lbl_800DA810:
/* 800DA810 000D6730  56 E0 04 3E */	clrlwi r0, r23, 0x10
/* 800DA814 000D6734  28 00 00 7F */	cmplwi r0, 0x7f
/* 800DA818 000D6738  41 80 FF 78 */	blt lbl_800DA790
/* 800DA81C 000D673C  57 C0 04 3E */	clrlwi r0, r30, 0x10
/* 800DA820 000D6740  28 00 FF FF */	cmplwi r0, 0xffff
/* 800DA824 000D6744  40 82 00 14 */	bne lbl_800DA838
/* 800DA828 000D6748  80 61 00 1C */	lwz r3, 0x1c(r1)
/* 800DA82C 000D674C  38 80 FF F8 */	li r4, -8
/* 800DA830 000D6750  4B FF BA 51 */	bl __CARDPutControlBlock
/* 800DA834 000D6754  48 00 00 C8 */	b lbl_800DA8FC
lbl_800DA838:
/* 800DA838 000D6758  80 61 00 1C */	lwz r3, 0x1c(r1)
/* 800DA83C 000D675C  4B FF D1 61 */	bl __CARDGetFatBlock
/* 800DA840 000D6760  80 81 00 1C */	lwz r4, 0x1c(r1)
/* 800DA844 000D6764  A0 03 00 06 */	lhz r0, 6(r3)
/* 800DA848 000D6768  80 64 00 0C */	lwz r3, 0xc(r4)
/* 800DA84C 000D676C  7C 03 01 D6 */	mullw r0, r3, r0
/* 800DA850 000D6770  7C 00 D8 40 */	cmplw r0, r27
/* 800DA854 000D6774  40 80 00 14 */	bge lbl_800DA868
/* 800DA858 000D6778  38 64 00 00 */	addi r3, r4, 0
/* 800DA85C 000D677C  38 80 FF F7 */	li r4, -9
/* 800DA860 000D6780  4B FF BA 21 */	bl __CARDPutControlBlock
/* 800DA864 000D6784  48 00 00 98 */	b lbl_800DA8FC
lbl_800DA868:
/* 800DA868 000D6788  28 1D 00 00 */	cmplwi r29, 0
/* 800DA86C 000D678C  41 82 00 0C */	beq lbl_800DA878
/* 800DA870 000D6790  7F A0 EB 78 */	mr r0, r29
/* 800DA874 000D6794  48 00 00 0C */	b lbl_800DA880
lbl_800DA878:
/* 800DA878 000D6798  3C 60 80 0D */	lis r3, __CARDDefaultApiCallback@ha
/* 800DA87C 000D679C  38 03 51 C0 */	addi r0, r3, __CARDDefaultApiCallback@l
lbl_800DA880:
/* 800DA880 000D67A0  90 04 00 D0 */	stw r0, 0xd0(r4)
/* 800DA884 000D67A4  57 C0 32 B2 */	rlwinm r0, r30, 6, 0xa, 0x19
/* 800DA888 000D67A8  7C FF 02 14 */	add r7, r31, r0
/* 800DA88C 000D67AC  80 61 00 1C */	lwz r3, 0x1c(r1)
/* 800DA890 000D67B0  57 DD 04 3E */	clrlwi r29, r30, 0x10
/* 800DA894 000D67B4  38 9A 00 00 */	addi r4, r26, 0
/* 800DA898 000D67B8  B3 C3 00 BC */	sth r30, 0xbc(r3)
/* 800DA89C 000D67BC  38 67 00 08 */	addi r3, r7, 8
/* 800DA8A0 000D67C0  38 A0 00 20 */	li r5, 0x20
/* 800DA8A4 000D67C4  80 C1 00 1C */	lwz r6, 0x1c(r1)
/* 800DA8A8 000D67C8  80 06 00 0C */	lwz r0, 0xc(r6)
/* 800DA8AC 000D67CC  7C 1B 03 96 */	divwu r0, r27, r0
/* 800DA8B0 000D67D0  B0 07 00 38 */	sth r0, 0x38(r7)
/* 800DA8B4 000D67D4  48 02 C1 B5 */	bl strncpy
/* 800DA8B8 000D67D8  80 81 00 1C */	lwz r4, 0x1c(r1)
/* 800DA8BC 000D67DC  3C 60 80 0E */	lis r3, CreateCallbackFat@ha
/* 800DA8C0 000D67E0  38 A3 A5 C8 */	addi r5, r3, CreateCallbackFat@l
/* 800DA8C4 000D67E4  93 84 00 C0 */	stw r28, 0xc0(r4)
/* 800DA8C8 000D67E8  7F 23 CB 78 */	mr r3, r25
/* 800DA8CC 000D67EC  93 3C 00 00 */	stw r25, 0(r28)
/* 800DA8D0 000D67F0  93 BC 00 04 */	stw r29, 4(r28)
/* 800DA8D4 000D67F4  80 81 00 1C */	lwz r4, 0x1c(r1)
/* 800DA8D8 000D67F8  80 04 00 0C */	lwz r0, 0xc(r4)
/* 800DA8DC 000D67FC  7C 9B 03 96 */	divwu r4, r27, r0
/* 800DA8E0 000D6800  4B FF D2 61 */	bl __CARDAllocBlock
/* 800DA8E4 000D6804  7C 64 1B 79 */	or. r4, r3, r3
/* 800DA8E8 000D6808  40 80 00 10 */	bge lbl_800DA8F8
/* 800DA8EC 000D680C  80 61 00 1C */	lwz r3, 0x1c(r1)
/* 800DA8F0 000D6810  4B FF B9 91 */	bl __CARDPutControlBlock
/* 800DA8F4 000D6814  48 00 00 08 */	b lbl_800DA8FC
lbl_800DA8F8:
/* 800DA8F8 000D6818  7C 83 23 78 */	mr r3, r4
lbl_800DA8FC:
/* 800DA8FC 000D681C  BA E1 00 24 */	lmw r23, 0x24(r1)
/* 800DA900 000D6820  80 01 00 4C */	lwz r0, 0x4c(r1)
/* 800DA904 000D6824  38 21 00 48 */	addi r1, r1, 0x48
/* 800DA908 000D6828  7C 08 03 A6 */	mtlr r0
/* 800DA90C 000D682C  4E 80 00 20 */	blr 
