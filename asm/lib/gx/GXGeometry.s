.include "macros.inc"

.section .text, "ax"  # 0x800065A0 - 0x8010F860

.global __GXSetDirtyState
__GXSetDirtyState:
/* 800DF66C 000DB58C  7C 08 02 A6 */	mflr r0
/* 800DF670 000DB590  90 01 00 04 */	stw r0, 4(r1)
/* 800DF674 000DB594  94 21 FF F8 */	stwu r1, -8(r1)
/* 800DF678 000DB598  80 6D 97 C8 */	lwz r3, gx-_SDA_BASE_(r13)
/* 800DF67C 000DB59C  80 03 04 F0 */	lwz r0, 0x4f0(r3)
/* 800DF680 000DB5A0  54 00 07 FF */	clrlwi. r0, r0, 0x1f
/* 800DF684 000DB5A4  41 82 00 08 */	beq lbl_800DF68C
/* 800DF688 000DB5A8  48 00 23 B5 */	bl __GXSetSUTexSize
lbl_800DF68C:
/* 800DF68C 000DB5AC  80 6D 97 C8 */	lwz r3, gx-_SDA_BASE_(r13)
/* 800DF690 000DB5B0  80 03 04 F0 */	lwz r0, 0x4f0(r3)
/* 800DF694 000DB5B4  54 00 07 BD */	rlwinm. r0, r0, 0, 0x1e, 0x1e
/* 800DF698 000DB5B8  41 82 00 08 */	beq lbl_800DF6A0
/* 800DF69C 000DB5BC  48 00 2A 89 */	bl __GXUpdateBPMask
lbl_800DF6A0:
/* 800DF6A0 000DB5C0  80 6D 97 C8 */	lwz r3, gx-_SDA_BASE_(r13)
/* 800DF6A4 000DB5C4  80 03 04 F0 */	lwz r0, 0x4f0(r3)
/* 800DF6A8 000DB5C8  54 00 07 7B */	rlwinm. r0, r0, 0, 0x1d, 0x1d
/* 800DF6AC 000DB5CC  41 82 00 08 */	beq lbl_800DF6B4
/* 800DF6B0 000DB5D0  48 00 03 51 */	bl __GXSetGenMode
lbl_800DF6B4:
/* 800DF6B4 000DB5D4  80 6D 97 C8 */	lwz r3, gx-_SDA_BASE_(r13)
/* 800DF6B8 000DB5D8  80 03 04 F0 */	lwz r0, 0x4f0(r3)
/* 800DF6BC 000DB5DC  54 00 07 39 */	rlwinm. r0, r0, 0, 0x1c, 0x1c
/* 800DF6C0 000DB5E0  41 82 00 08 */	beq lbl_800DF6C8
/* 800DF6C4 000DB5E4  4B FF E8 B9 */	bl __GXSetVCD
lbl_800DF6C8:
/* 800DF6C8 000DB5E8  80 6D 97 C8 */	lwz r3, gx-_SDA_BASE_(r13)
/* 800DF6CC 000DB5EC  80 03 04 F0 */	lwz r0, 0x4f0(r3)
/* 800DF6D0 000DB5F0  54 00 06 F7 */	rlwinm. r0, r0, 0, 0x1b, 0x1b
/* 800DF6D4 000DB5F4  41 82 00 08 */	beq lbl_800DF6DC
/* 800DF6D8 000DB5F8  4B FF F3 55 */	bl __GXSetVAT
lbl_800DF6DC:
/* 800DF6DC 000DB5FC  80 6D 97 C8 */	lwz r3, gx-_SDA_BASE_(r13)
/* 800DF6E0 000DB600  38 00 00 00 */	li r0, 0
/* 800DF6E4 000DB604  90 03 04 F0 */	stw r0, 0x4f0(r3)
/* 800DF6E8 000DB608  80 01 00 0C */	lwz r0, 0xc(r1)
/* 800DF6EC 000DB60C  38 21 00 08 */	addi r1, r1, 8
/* 800DF6F0 000DB610  7C 08 03 A6 */	mtlr r0
/* 800DF6F4 000DB614  4E 80 00 20 */	blr 

.global GXBegin
GXBegin:
/* 800DF6F8 000DB618  7C 08 02 A6 */	mflr r0
/* 800DF6FC 000DB61C  90 01 00 04 */	stw r0, 4(r1)
/* 800DF700 000DB620  94 21 FF D8 */	stwu r1, -0x28(r1)
/* 800DF704 000DB624  93 E1 00 24 */	stw r31, 0x24(r1)
/* 800DF708 000DB628  3B E5 00 00 */	addi r31, r5, 0
/* 800DF70C 000DB62C  93 C1 00 20 */	stw r30, 0x20(r1)
/* 800DF710 000DB630  3B C4 00 00 */	addi r30, r4, 0
/* 800DF714 000DB634  93 A1 00 1C */	stw r29, 0x1c(r1)
/* 800DF718 000DB638  3B A3 00 00 */	addi r29, r3, 0
/* 800DF71C 000DB63C  80 CD 97 C8 */	lwz r6, gx-_SDA_BASE_(r13)
/* 800DF720 000DB640  80 06 04 F0 */	lwz r0, 0x4f0(r6)
/* 800DF724 000DB644  28 00 00 00 */	cmplwi r0, 0
/* 800DF728 000DB648  41 82 00 6C */	beq lbl_800DF794
/* 800DF72C 000DB64C  54 00 07 FF */	clrlwi. r0, r0, 0x1f
/* 800DF730 000DB650  41 82 00 08 */	beq lbl_800DF738
/* 800DF734 000DB654  48 00 23 09 */	bl __GXSetSUTexSize
lbl_800DF738:
/* 800DF738 000DB658  80 6D 97 C8 */	lwz r3, gx-_SDA_BASE_(r13)
/* 800DF73C 000DB65C  80 03 04 F0 */	lwz r0, 0x4f0(r3)
/* 800DF740 000DB660  54 00 07 BD */	rlwinm. r0, r0, 0, 0x1e, 0x1e
/* 800DF744 000DB664  41 82 00 08 */	beq lbl_800DF74C
/* 800DF748 000DB668  48 00 29 DD */	bl __GXUpdateBPMask
lbl_800DF74C:
/* 800DF74C 000DB66C  80 6D 97 C8 */	lwz r3, gx-_SDA_BASE_(r13)
/* 800DF750 000DB670  80 03 04 F0 */	lwz r0, 0x4f0(r3)
/* 800DF754 000DB674  54 00 07 7B */	rlwinm. r0, r0, 0, 0x1d, 0x1d
/* 800DF758 000DB678  41 82 00 08 */	beq lbl_800DF760
/* 800DF75C 000DB67C  48 00 02 A5 */	bl __GXSetGenMode
lbl_800DF760:
/* 800DF760 000DB680  80 6D 97 C8 */	lwz r3, gx-_SDA_BASE_(r13)
/* 800DF764 000DB684  80 03 04 F0 */	lwz r0, 0x4f0(r3)
/* 800DF768 000DB688  54 00 07 39 */	rlwinm. r0, r0, 0, 0x1c, 0x1c
/* 800DF76C 000DB68C  41 82 00 08 */	beq lbl_800DF774
/* 800DF770 000DB690  4B FF E8 0D */	bl __GXSetVCD
lbl_800DF774:
/* 800DF774 000DB694  80 6D 97 C8 */	lwz r3, gx-_SDA_BASE_(r13)
/* 800DF778 000DB698  80 03 04 F0 */	lwz r0, 0x4f0(r3)
/* 800DF77C 000DB69C  54 00 06 F7 */	rlwinm. r0, r0, 0, 0x1b, 0x1b
/* 800DF780 000DB6A0  41 82 00 08 */	beq lbl_800DF788
/* 800DF784 000DB6A4  4B FF F2 A9 */	bl __GXSetVAT
lbl_800DF788:
/* 800DF788 000DB6A8  80 6D 97 C8 */	lwz r3, gx-_SDA_BASE_(r13)
/* 800DF78C 000DB6AC  38 00 00 00 */	li r0, 0
/* 800DF790 000DB6B0  90 03 04 F0 */	stw r0, 0x4f0(r3)
lbl_800DF794:
/* 800DF794 000DB6B4  80 6D 97 C8 */	lwz r3, gx-_SDA_BASE_(r13)
/* 800DF798 000DB6B8  80 03 00 00 */	lwz r0, 0(r3)
/* 800DF79C 000DB6BC  28 00 00 00 */	cmplwi r0, 0
/* 800DF7A0 000DB6C0  41 82 00 08 */	beq lbl_800DF7A8
/* 800DF7A4 000DB6C4  48 00 00 31 */	bl __GXSendFlushPrim
lbl_800DF7A8:
/* 800DF7A8 000DB6C8  7F C0 EB 78 */	or r0, r30, r29
/* 800DF7AC 000DB6CC  3C 60 CC 01 */	lis r3, 0xCC008000@ha
/* 800DF7B0 000DB6D0  98 03 80 00 */	stb r0, 0xCC008000@l(r3)
/* 800DF7B4 000DB6D4  B3 E3 80 00 */	sth r31, -0x8000(r3)
/* 800DF7B8 000DB6D8  80 01 00 2C */	lwz r0, 0x2c(r1)
/* 800DF7BC 000DB6DC  83 E1 00 24 */	lwz r31, 0x24(r1)
/* 800DF7C0 000DB6E0  83 C1 00 20 */	lwz r30, 0x20(r1)
/* 800DF7C4 000DB6E4  83 A1 00 1C */	lwz r29, 0x1c(r1)
/* 800DF7C8 000DB6E8  38 21 00 28 */	addi r1, r1, 0x28
/* 800DF7CC 000DB6EC  7C 08 03 A6 */	mtlr r0
/* 800DF7D0 000DB6F0  4E 80 00 20 */	blr 

.global __GXSendFlushPrim
__GXSendFlushPrim:
/* 800DF7D4 000DB6F4  80 6D 97 C8 */	lwz r3, gx-_SDA_BASE_(r13)
/* 800DF7D8 000DB6F8  38 00 00 98 */	li r0, 0x98
/* 800DF7DC 000DB6FC  3C A0 CC 01 */	lis r5, 0xCC008000@ha
/* 800DF7E0 000DB700  A0 C3 00 00 */	lhz r6, 0(r3)
/* 800DF7E4 000DB704  38 80 00 00 */	li r4, 0
/* 800DF7E8 000DB708  80 63 00 04 */	lwz r3, 4(r3)
/* 800DF7EC 000DB70C  7C E6 19 D6 */	mullw r7, r6, r3
/* 800DF7F0 000DB710  98 05 80 00 */	stb r0, 0xCC008000@l(r5)
/* 800DF7F4 000DB714  B0 C5 80 00 */	sth r6, -0x8000(r5)
/* 800DF7F8 000DB718  38 67 00 03 */	addi r3, r7, 3
/* 800DF7FC 000DB71C  28 07 00 00 */	cmplwi r7, 0
/* 800DF800 000DB720  54 63 F0 BE */	srwi r3, r3, 2
/* 800DF804 000DB724  40 81 00 48 */	ble lbl_800DF84C
/* 800DF808 000DB728  54 60 E8 FF */	rlwinm. r0, r3, 0x1d, 3, 0x1f
/* 800DF80C 000DB72C  7C 09 03 A6 */	mtctr r0
/* 800DF810 000DB730  41 82 00 30 */	beq lbl_800DF840
lbl_800DF814:
/* 800DF814 000DB734  90 85 80 00 */	stw r4, -0x8000(r5)
/* 800DF818 000DB738  90 85 80 00 */	stw r4, -0x8000(r5)
/* 800DF81C 000DB73C  90 85 80 00 */	stw r4, -0x8000(r5)
/* 800DF820 000DB740  90 85 80 00 */	stw r4, -0x8000(r5)
/* 800DF824 000DB744  90 85 80 00 */	stw r4, -0x8000(r5)
/* 800DF828 000DB748  90 85 80 00 */	stw r4, -0x8000(r5)
/* 800DF82C 000DB74C  90 85 80 00 */	stw r4, -0x8000(r5)
/* 800DF830 000DB750  90 85 80 00 */	stw r4, -0x8000(r5)
/* 800DF834 000DB754  42 00 FF E0 */	bdnz lbl_800DF814
/* 800DF838 000DB758  70 63 00 07 */	andi. r3, r3, 7
/* 800DF83C 000DB75C  41 82 00 10 */	beq lbl_800DF84C
lbl_800DF840:
/* 800DF840 000DB760  7C 69 03 A6 */	mtctr r3
lbl_800DF844:
/* 800DF844 000DB764  90 85 80 00 */	stw r4, -0x8000(r5)
/* 800DF848 000DB768  42 00 FF FC */	bdnz lbl_800DF844
lbl_800DF84C:
/* 800DF84C 000DB76C  80 6D 97 C8 */	lwz r3, gx-_SDA_BASE_(r13)
/* 800DF850 000DB770  38 00 00 00 */	li r0, 0
/* 800DF854 000DB774  B0 03 00 02 */	sth r0, 2(r3)
/* 800DF858 000DB778  4E 80 00 20 */	blr 

.global GXSetLineWidth
GXSetLineWidth:
/* 800DF85C 000DB77C  80 AD 97 C8 */	lwz r5, gx-_SDA_BASE_(r13)
/* 800DF860 000DB780  54 86 80 1E */	slwi r6, r4, 0x10
/* 800DF864 000DB784  38 80 00 61 */	li r4, 0x61
/* 800DF868 000DB788  80 05 00 7C */	lwz r0, 0x7c(r5)
/* 800DF86C 000DB78C  38 E5 00 7C */	addi r7, r5, 0x7c
/* 800DF870 000DB790  3C A0 CC 01 */	lis r5, 0xCC008000@ha
/* 800DF874 000DB794  54 00 00 2E */	rlwinm r0, r0, 0, 0, 0x17
/* 800DF878 000DB798  50 60 06 3E */	rlwimi r0, r3, 0, 0x18, 0x1f
/* 800DF87C 000DB79C  90 07 00 00 */	stw r0, 0(r7)
/* 800DF880 000DB7A0  38 00 00 01 */	li r0, 1
/* 800DF884 000DB7A4  80 6D 97 C8 */	lwz r3, gx-_SDA_BASE_(r13)
/* 800DF888 000DB7A8  38 E3 00 7C */	addi r7, r3, 0x7c
/* 800DF88C 000DB7AC  80 63 00 7C */	lwz r3, 0x7c(r3)
/* 800DF890 000DB7B0  54 63 04 18 */	rlwinm r3, r3, 0, 0x10, 0xc
/* 800DF894 000DB7B4  7C 63 33 78 */	or r3, r3, r6
/* 800DF898 000DB7B8  90 67 00 00 */	stw r3, 0(r7)
/* 800DF89C 000DB7BC  98 85 80 00 */	stb r4, 0xCC008000@l(r5)
/* 800DF8A0 000DB7C0  80 8D 97 C8 */	lwz r4, gx-_SDA_BASE_(r13)
/* 800DF8A4 000DB7C4  80 64 00 7C */	lwz r3, 0x7c(r4)
/* 800DF8A8 000DB7C8  90 65 80 00 */	stw r3, -0x8000(r5)
/* 800DF8AC 000DB7CC  B0 04 00 02 */	sth r0, 2(r4)
/* 800DF8B0 000DB7D0  4E 80 00 20 */	blr 

.global GXSetPointSize
GXSetPointSize:
/* 800DF8B4 000DB7D4  80 AD 97 C8 */	lwz r5, gx-_SDA_BASE_(r13)
/* 800DF8B8 000DB7D8  54 86 98 18 */	slwi r6, r4, 0x13
/* 800DF8BC 000DB7DC  84 05 00 7C */	lwzu r0, 0x7c(r5)
/* 800DF8C0 000DB7E0  38 80 00 61 */	li r4, 0x61
/* 800DF8C4 000DB7E4  54 00 06 1E */	rlwinm r0, r0, 0, 0x18, 0xf
/* 800DF8C8 000DB7E8  50 60 44 2E */	rlwimi r0, r3, 8, 0x10, 0x17
/* 800DF8CC 000DB7EC  90 05 00 00 */	stw r0, 0(r5)
/* 800DF8D0 000DB7F0  3C A0 CC 01 */	lis r5, 0xCC008000@ha
/* 800DF8D4 000DB7F4  38 00 00 01 */	li r0, 1
/* 800DF8D8 000DB7F8  80 6D 97 C8 */	lwz r3, gx-_SDA_BASE_(r13)
/* 800DF8DC 000DB7FC  38 E3 00 7C */	addi r7, r3, 0x7c
/* 800DF8E0 000DB800  80 63 00 7C */	lwz r3, 0x7c(r3)
/* 800DF8E4 000DB804  54 63 03 52 */	rlwinm r3, r3, 0, 0xd, 9
/* 800DF8E8 000DB808  7C 63 33 78 */	or r3, r3, r6
/* 800DF8EC 000DB80C  90 67 00 00 */	stw r3, 0(r7)
/* 800DF8F0 000DB810  98 85 80 00 */	stb r4, 0xCC008000@l(r5)
/* 800DF8F4 000DB814  80 8D 97 C8 */	lwz r4, gx-_SDA_BASE_(r13)
/* 800DF8F8 000DB818  80 64 00 7C */	lwz r3, 0x7c(r4)
/* 800DF8FC 000DB81C  90 65 80 00 */	stw r3, -0x8000(r5)
/* 800DF900 000DB820  B0 04 00 02 */	sth r0, 2(r4)
/* 800DF904 000DB824  4E 80 00 20 */	blr 

.global GXEnableTexOffsets
GXEnableTexOffsets:
/* 800DF908 000DB828  80 0D 97 C8 */	lwz r0, gx-_SDA_BASE_(r13)
/* 800DF90C 000DB82C  54 67 10 3A */	slwi r7, r3, 2
/* 800DF910 000DB830  7C C0 3A 14 */	add r6, r0, r7
/* 800DF914 000DB834  80 66 00 B8 */	lwz r3, 0xb8(r6)
/* 800DF918 000DB838  54 80 91 9A */	rlwinm r0, r4, 0x12, 6, 0xd
/* 800DF91C 000DB83C  54 A4 99 58 */	rlwinm r4, r5, 0x13, 5, 0xc
/* 800DF920 000DB840  54 63 03 98 */	rlwinm r3, r3, 0, 0xe, 0xc
/* 800DF924 000DB844  7C 60 03 78 */	or r0, r3, r0
/* 800DF928 000DB848  90 06 00 B8 */	stw r0, 0xb8(r6)
/* 800DF92C 000DB84C  38 60 00 61 */	li r3, 0x61
/* 800DF930 000DB850  3C A0 CC 01 */	lis r5, 0xCC008000@ha
/* 800DF934 000DB854  80 CD 97 C8 */	lwz r6, gx-_SDA_BASE_(r13)
/* 800DF938 000DB858  38 00 00 01 */	li r0, 1
/* 800DF93C 000DB85C  7D 06 3A 14 */	add r8, r6, r7
/* 800DF940 000DB860  80 C8 00 B8 */	lwz r6, 0xb8(r8)
/* 800DF944 000DB864  54 C6 03 56 */	rlwinm r6, r6, 0, 0xd, 0xb
/* 800DF948 000DB868  7C C4 23 78 */	or r4, r6, r4
/* 800DF94C 000DB86C  90 88 00 B8 */	stw r4, 0xb8(r8)
/* 800DF950 000DB870  80 8D 97 C8 */	lwz r4, gx-_SDA_BASE_(r13)
/* 800DF954 000DB874  98 65 80 00 */	stb r3, 0xCC008000@l(r5)
/* 800DF958 000DB878  7C 64 3A 14 */	add r3, r4, r7
/* 800DF95C 000DB87C  80 63 00 B8 */	lwz r3, 0xb8(r3)
/* 800DF960 000DB880  90 65 80 00 */	stw r3, -0x8000(r5)
/* 800DF964 000DB884  B0 04 00 02 */	sth r0, 2(r4)
/* 800DF968 000DB888  4E 80 00 20 */	blr 

.global GXSetCullMode
GXSetCullMode:
/* 800DF96C 000DB88C  2C 03 00 02 */	cmpwi r3, 2
/* 800DF970 000DB890  41 82 00 1C */	beq lbl_800DF98C
/* 800DF974 000DB894  40 80 00 1C */	bge lbl_800DF990
/* 800DF978 000DB898  2C 03 00 01 */	cmpwi r3, 1
/* 800DF97C 000DB89C  40 80 00 08 */	bge lbl_800DF984
/* 800DF980 000DB8A0  48 00 00 10 */	b lbl_800DF990
lbl_800DF984:
/* 800DF984 000DB8A4  38 60 00 02 */	li r3, 2
/* 800DF988 000DB8A8  48 00 00 08 */	b lbl_800DF990
lbl_800DF98C:
/* 800DF98C 000DB8AC  38 60 00 01 */	li r3, 1
lbl_800DF990:
/* 800DF990 000DB8B0  80 8D 97 C8 */	lwz r4, gx-_SDA_BASE_(r13)
/* 800DF994 000DB8B4  54 60 70 22 */	slwi r0, r3, 0xe
/* 800DF998 000DB8B8  84 64 02 04 */	lwzu r3, 0x204(r4)
/* 800DF99C 000DB8BC  54 63 04 9E */	rlwinm r3, r3, 0, 0x12, 0xf
/* 800DF9A0 000DB8C0  7C 60 03 78 */	or r0, r3, r0
/* 800DF9A4 000DB8C4  90 04 00 00 */	stw r0, 0(r4)
/* 800DF9A8 000DB8C8  80 6D 97 C8 */	lwz r3, gx-_SDA_BASE_(r13)
/* 800DF9AC 000DB8CC  80 03 04 F0 */	lwz r0, 0x4f0(r3)
/* 800DF9B0 000DB8D0  60 00 00 04 */	ori r0, r0, 4
/* 800DF9B4 000DB8D4  90 03 04 F0 */	stw r0, 0x4f0(r3)
/* 800DF9B8 000DB8D8  4E 80 00 20 */	blr 

.global GXSetCoPlanar
GXSetCoPlanar:
/* 800DF9BC 000DB8DC  80 8D 97 C8 */	lwz r4, gx-_SDA_BASE_(r13)
/* 800DF9C0 000DB8E0  54 60 99 58 */	rlwinm r0, r3, 0x13, 5, 0xc
/* 800DF9C4 000DB8E4  38 A0 00 61 */	li r5, 0x61
/* 800DF9C8 000DB8E8  80 64 02 04 */	lwz r3, 0x204(r4)
/* 800DF9CC 000DB8EC  38 C4 02 04 */	addi r6, r4, 0x204
/* 800DF9D0 000DB8F0  3C 80 CC 01 */	lis r4, 0xCC008000@ha
/* 800DF9D4 000DB8F4  54 63 03 56 */	rlwinm r3, r3, 0, 0xd, 0xb
/* 800DF9D8 000DB8F8  7C 60 03 78 */	or r0, r3, r0
/* 800DF9DC 000DB8FC  90 06 00 00 */	stw r0, 0(r6)
/* 800DF9E0 000DB900  3C 00 FE 08 */	lis r0, 0xfe08
/* 800DF9E4 000DB904  98 A4 80 00 */	stb r5, 0xCC008000@l(r4)
/* 800DF9E8 000DB908  80 6D 97 C8 */	lwz r3, gx-_SDA_BASE_(r13)
/* 800DF9EC 000DB90C  90 04 80 00 */	stw r0, -0x8000(r4)
/* 800DF9F0 000DB910  98 A4 80 00 */	stb r5, -0x8000(r4)
/* 800DF9F4 000DB914  80 03 02 04 */	lwz r0, 0x204(r3)
/* 800DF9F8 000DB918  90 04 80 00 */	stw r0, -0x8000(r4)
/* 800DF9FC 000DB91C  4E 80 00 20 */	blr 

.global __GXSetGenMode
__GXSetGenMode:
/* 800DFA00 000DB920  38 00 00 61 */	li r0, 0x61
/* 800DFA04 000DB924  80 8D 97 C8 */	lwz r4, gx-_SDA_BASE_(r13)
/* 800DFA08 000DB928  3C A0 CC 01 */	lis r5, 0xCC008000@ha
/* 800DFA0C 000DB92C  98 05 80 00 */	stb r0, 0xCC008000@l(r5)
/* 800DFA10 000DB930  38 00 00 01 */	li r0, 1
/* 800DFA14 000DB934  80 64 02 04 */	lwz r3, 0x204(r4)
/* 800DFA18 000DB938  90 65 80 00 */	stw r3, -0x8000(r5)
/* 800DFA1C 000DB93C  B0 04 00 02 */	sth r0, 2(r4)
/* 800DFA20 000DB940  4E 80 00 20 */	blr 
