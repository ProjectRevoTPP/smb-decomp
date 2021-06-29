.include "macros.inc"

.section .text, "ax"  # 0x800065A0 - 0x8010F860

.global adsrConvertTimeCents
adsrConvertTimeCents:
/* 800F77E8 000F3708  7C 08 02 A6 */	mflr r0
/* 800F77EC 000F370C  90 01 00 04 */	stw r0, 4(r1)
/* 800F77F0 000F3710  6C 60 80 00 */	xoris r0, r3, 0x8000
/* 800F77F4 000F3714  94 21 FF E8 */	stwu r1, -0x18(r1)
/* 800F77F8 000F3718  90 01 00 14 */	stw r0, 0x14(r1)
/* 800F77FC 000F371C  3C 00 43 30 */	lis r0, 0x4330
/* 800F7800 000F3720  C8 42 C1 80 */	lfd f2, lbl_802F6980-_SDA2_BASE_(r2)
/* 800F7804 000F3724  90 01 00 10 */	stw r0, 0x10(r1)
/* 800F7808 000F3728  C0 62 C1 78 */	lfs f3, lbl_802F6978-_SDA2_BASE_(r2)
/* 800F780C 000F372C  C8 01 00 10 */	lfd f0, 0x10(r1)
/* 800F7810 000F3730  C0 22 C1 74 */	lfs f1, lbl_802F6974-_SDA2_BASE_(r2)
/* 800F7814 000F3734  EC 00 10 28 */	fsubs f0, f0, f2
/* 800F7818 000F3738  EC 43 00 32 */	fmuls f2, f3, f0
/* 800F781C 000F373C  48 01 18 FD */	bl powf
/* 800F7820 000F3740  C0 02 C1 70 */	lfs f0, lbl_802F6970-_SDA2_BASE_(r2)
/* 800F7824 000F3744  EC 20 00 72 */	fmuls f1, f0, f1
/* 800F7828 000F3748  48 00 BD 45 */	bl __cvt_fp2unsigned
/* 800F782C 000F374C  80 01 00 1C */	lwz r0, 0x1c(r1)
/* 800F7830 000F3750  38 21 00 18 */	addi r1, r1, 0x18
/* 800F7834 000F3754  7C 08 03 A6 */	mtlr r0
/* 800F7838 000F3758  4E 80 00 20 */	blr 

.global salChangeADSRState
salChangeADSRState:
/* 800F783C 000F375C  88 83 00 00 */	lbz r4, 0(r3)
/* 800F7840 000F3760  38 00 00 00 */	li r0, 0
/* 800F7844 000F3764  2C 04 00 01 */	cmpwi r4, 1
/* 800F7848 000F3768  41 82 00 F0 */	beq lbl_800F7938
/* 800F784C 000F376C  40 80 02 54 */	bge lbl_800F7AA0
/* 800F7850 000F3770  2C 04 00 00 */	cmpwi r4, 0
/* 800F7854 000F3774  40 80 00 08 */	bge lbl_800F785C
/* 800F7858 000F3778  48 00 02 48 */	b lbl_800F7AA0
lbl_800F785C:
/* 800F785C 000F377C  88 83 00 01 */	lbz r4, 1(r3)
/* 800F7860 000F3780  2C 04 00 02 */	cmpwi r4, 2
/* 800F7864 000F3784  41 82 00 98 */	beq lbl_800F78FC
/* 800F7868 000F3788  40 80 00 14 */	bge lbl_800F787C
/* 800F786C 000F378C  2C 04 00 00 */	cmpwi r4, 0
/* 800F7870 000F3790  41 82 00 18 */	beq lbl_800F7888
/* 800F7874 000F3794  40 80 00 48 */	bge lbl_800F78BC
/* 800F7878 000F3798  48 00 02 28 */	b lbl_800F7AA0
lbl_800F787C:
/* 800F787C 000F379C  2C 04 00 04 */	cmpwi r4, 4
/* 800F7880 000F37A0  41 82 00 A8 */	beq lbl_800F7928
/* 800F7884 000F37A4  48 00 02 1C */	b lbl_800F7AA0
lbl_800F7888:
/* 800F7888 000F37A8  80 83 00 14 */	lwz r4, 0x14(r3)
/* 800F788C 000F37AC  28 04 00 00 */	cmplwi r4, 0
/* 800F7890 000F37B0  90 83 00 04 */	stw r4, 4(r3)
/* 800F7894 000F37B4  41 82 00 28 */	beq lbl_800F78BC
/* 800F7898 000F37B8  38 80 00 01 */	li r4, 1
/* 800F789C 000F37BC  98 83 00 01 */	stb r4, 1(r3)
/* 800F78A0 000F37C0  38 80 00 00 */	li r4, 0
/* 800F78A4 000F37C4  3C A0 7F FF */	lis r5, 0x7fff
/* 800F78A8 000F37C8  90 83 00 08 */	stw r4, 8(r3)
/* 800F78AC 000F37CC  80 83 00 14 */	lwz r4, 0x14(r3)
/* 800F78B0 000F37D0  7C 85 23 96 */	divwu r4, r5, r4
/* 800F78B4 000F37D4  90 83 00 10 */	stw r4, 0x10(r3)
/* 800F78B8 000F37D8  48 00 01 E8 */	b lbl_800F7AA0
lbl_800F78BC:
/* 800F78BC 000F37DC  80 83 00 18 */	lwz r4, 0x18(r3)
/* 800F78C0 000F37E0  28 04 00 00 */	cmplwi r4, 0
/* 800F78C4 000F37E4  90 83 00 04 */	stw r4, 4(r3)
/* 800F78C8 000F37E8  41 82 00 34 */	beq lbl_800F78FC
/* 800F78CC 000F37EC  38 80 00 02 */	li r4, 2
/* 800F78D0 000F37F0  98 83 00 01 */	stb r4, 1(r3)
/* 800F78D4 000F37F4  3C C0 7F FF */	lis r6, 0x7fff
/* 800F78D8 000F37F8  90 C3 00 08 */	stw r6, 8(r3)
/* 800F78DC 000F37FC  A0 A3 00 1C */	lhz r5, 0x1c(r3)
/* 800F78E0 000F3800  80 83 00 18 */	lwz r4, 0x18(r3)
/* 800F78E4 000F3804  54 A5 80 1E */	slwi r5, r5, 0x10
/* 800F78E8 000F3808  7C A5 30 50 */	subf r5, r5, r6
/* 800F78EC 000F380C  7C 85 23 96 */	divwu r4, r5, r4
/* 800F78F0 000F3810  7C 84 00 D0 */	neg r4, r4
/* 800F78F4 000F3814  90 83 00 10 */	stw r4, 0x10(r3)
/* 800F78F8 000F3818  48 00 01 A8 */	b lbl_800F7AA0
lbl_800F78FC:
/* 800F78FC 000F381C  A0 83 00 1C */	lhz r4, 0x1c(r3)
/* 800F7900 000F3820  28 04 00 00 */	cmplwi r4, 0
/* 800F7904 000F3824  41 82 00 24 */	beq lbl_800F7928
/* 800F7908 000F3828  38 80 00 03 */	li r4, 3
/* 800F790C 000F382C  98 83 00 01 */	stb r4, 1(r3)
/* 800F7910 000F3830  38 80 00 00 */	li r4, 0
/* 800F7914 000F3834  A0 A3 00 1C */	lhz r5, 0x1c(r3)
/* 800F7918 000F3838  54 A5 80 1E */	slwi r5, r5, 0x10
/* 800F791C 000F383C  90 A3 00 08 */	stw r5, 8(r3)
/* 800F7920 000F3840  90 83 00 10 */	stw r4, 0x10(r3)
/* 800F7924 000F3844  48 00 01 7C */	b lbl_800F7AA0
lbl_800F7928:
/* 800F7928 000F3848  38 00 00 00 */	li r0, 0
/* 800F792C 000F384C  90 03 00 08 */	stw r0, 8(r3)
/* 800F7930 000F3850  38 00 00 01 */	li r0, 1
/* 800F7934 000F3854  48 00 01 6C */	b lbl_800F7AA0
lbl_800F7938:
/* 800F7938 000F3858  88 83 00 01 */	lbz r4, 1(r3)
/* 800F793C 000F385C  2C 04 00 02 */	cmpwi r4, 2
/* 800F7940 000F3860  41 82 00 F4 */	beq lbl_800F7A34
/* 800F7944 000F3864  40 80 00 14 */	bge lbl_800F7958
/* 800F7948 000F3868  2C 04 00 00 */	cmpwi r4, 0
/* 800F794C 000F386C  41 82 00 18 */	beq lbl_800F7964
/* 800F7950 000F3870  40 80 00 74 */	bge lbl_800F79C4
/* 800F7954 000F3874  48 00 01 4C */	b lbl_800F7AA0
lbl_800F7958:
/* 800F7958 000F3878  2C 04 00 04 */	cmpwi r4, 4
/* 800F795C 000F387C  41 82 01 38 */	beq lbl_800F7A94
/* 800F7960 000F3880  48 00 01 40 */	b lbl_800F7AA0
lbl_800F7964:
/* 800F7964 000F3884  80 83 00 14 */	lwz r4, 0x14(r3)
/* 800F7968 000F3888  28 04 00 00 */	cmplwi r4, 0
/* 800F796C 000F388C  90 83 00 04 */	stw r4, 4(r3)
/* 800F7970 000F3890  41 82 00 54 */	beq lbl_800F79C4
/* 800F7974 000F3894  38 80 00 01 */	li r4, 1
/* 800F7978 000F3898  98 83 00 01 */	stb r4, 1(r3)
/* 800F797C 000F389C  88 83 00 26 */	lbz r4, 0x26(r3)
/* 800F7980 000F38A0  28 04 00 00 */	cmplwi r4, 0
/* 800F7984 000F38A4  40 82 00 20 */	bne lbl_800F79A4
/* 800F7988 000F38A8  38 80 00 00 */	li r4, 0
/* 800F798C 000F38AC  90 83 00 08 */	stw r4, 8(r3)
/* 800F7990 000F38B0  3C A0 7F FF */	lis r5, 0x7fff
/* 800F7994 000F38B4  80 83 00 04 */	lwz r4, 4(r3)
/* 800F7998 000F38B8  7C 85 23 96 */	divwu r4, r5, r4
/* 800F799C 000F38BC  90 83 00 10 */	stw r4, 0x10(r3)
/* 800F79A0 000F38C0  48 00 01 00 */	b lbl_800F7AA0
lbl_800F79A4:
/* 800F79A4 000F38C4  38 80 00 00 */	li r4, 0
/* 800F79A8 000F38C8  90 83 00 0C */	stw r4, 0xc(r3)
/* 800F79AC 000F38CC  3C A0 00 C1 */	lis r5, 0xc1
/* 800F79B0 000F38D0  90 83 00 08 */	stw r4, 8(r3)
/* 800F79B4 000F38D4  80 83 00 04 */	lwz r4, 4(r3)
/* 800F79B8 000F38D8  7C 85 23 96 */	divwu r4, r5, r4
/* 800F79BC 000F38DC  90 83 00 10 */	stw r4, 0x10(r3)
/* 800F79C0 000F38E0  48 00 00 E0 */	b lbl_800F7AA0
lbl_800F79C4:
/* 800F79C4 000F38E4  A0 A3 00 1C */	lhz r5, 0x1c(r3)
/* 800F79C8 000F38E8  3C 80 15 39 */	lis r4, 0x15390949@ha
/* 800F79CC 000F38EC  38 C4 09 49 */	addi r6, r4, 0x15390949@l
/* 800F79D0 000F38F0  80 E3 00 18 */	lwz r7, 0x18(r3)
/* 800F79D4 000F38F4  20 85 00 C1 */	subfic r4, r5, 0xc1
/* 800F79D8 000F38F8  54 84 80 1E */	slwi r4, r4, 0x10
/* 800F79DC 000F38FC  7C 86 20 16 */	mulhwu r4, r6, r4
/* 800F79E0 000F3900  54 84 E1 3E */	srwi r4, r4, 4
/* 800F79E4 000F3904  7C 87 21 D6 */	mullw r4, r7, r4
/* 800F79E8 000F3908  54 84 84 3E */	srwi r4, r4, 0x10
/* 800F79EC 000F390C  90 83 00 04 */	stw r4, 4(r3)
/* 800F79F0 000F3910  80 83 00 04 */	lwz r4, 4(r3)
/* 800F79F4 000F3914  28 04 00 00 */	cmplwi r4, 0
/* 800F79F8 000F3918  41 82 00 3C */	beq lbl_800F7A34
/* 800F79FC 000F391C  38 80 00 02 */	li r4, 2
/* 800F7A00 000F3920  98 83 00 01 */	stb r4, 1(r3)
/* 800F7A04 000F3924  3C A0 7F FF */	lis r5, 0x7fff
/* 800F7A08 000F3928  3C 80 00 C1 */	lis r4, 0xc1
/* 800F7A0C 000F392C  90 A3 00 08 */	stw r5, 8(r3)
/* 800F7A10 000F3930  90 83 00 0C */	stw r4, 0xc(r3)
/* 800F7A14 000F3934  A0 A3 00 1C */	lhz r5, 0x1c(r3)
/* 800F7A18 000F3938  80 83 00 04 */	lwz r4, 4(r3)
/* 800F7A1C 000F393C  20 A5 00 C1 */	subfic r5, r5, 0xc1
/* 800F7A20 000F3940  54 A5 80 1E */	slwi r5, r5, 0x10
/* 800F7A24 000F3944  7C 85 23 96 */	divwu r4, r5, r4
/* 800F7A28 000F3948  7C 84 00 D0 */	neg r4, r4
/* 800F7A2C 000F394C  90 83 00 10 */	stw r4, 0x10(r3)
/* 800F7A30 000F3950  48 00 00 70 */	b lbl_800F7AA0
lbl_800F7A34:
/* 800F7A34 000F3954  A0 83 00 1C */	lhz r4, 0x1c(r3)
/* 800F7A38 000F3958  28 04 00 00 */	cmplwi r4, 0
/* 800F7A3C 000F395C  41 82 00 58 */	beq lbl_800F7A94
/* 800F7A40 000F3960  38 80 00 03 */	li r4, 3
/* 800F7A44 000F3964  98 83 00 01 */	stb r4, 1(r3)
/* 800F7A48 000F3968  A0 83 00 1C */	lhz r4, 0x1c(r3)
/* 800F7A4C 000F396C  54 84 80 1E */	slwi r4, r4, 0x10
/* 800F7A50 000F3970  90 83 00 0C */	stw r4, 0xc(r3)
/* 800F7A54 000F3974  80 83 00 0C */	lwz r4, 0xc(r3)
/* 800F7A58 000F3978  3C 84 00 01 */	addis r4, r4, 1
/* 800F7A5C 000F397C  38 84 80 00 */	addi r4, r4, -32768
/* 800F7A60 000F3980  7C 84 86 70 */	srawi r4, r4, 0x10
/* 800F7A64 000F3984  20 A4 00 C1 */	subfic r5, r4, 0xc1
/* 800F7A68 000F3988  2C 05 00 00 */	cmpwi r5, 0
/* 800F7A6C 000F398C  40 80 00 08 */	bge lbl_800F7A74
/* 800F7A70 000F3990  38 A0 00 00 */	li r5, 0
lbl_800F7A74:
/* 800F7A74 000F3994  3C 80 80 1F */	lis r4, lbl_801E9BD0@ha
/* 800F7A78 000F3998  54 A5 08 3C */	slwi r5, r5, 1
/* 800F7A7C 000F399C  38 84 9B D0 */	addi r4, r4, lbl_801E9BD0@l
/* 800F7A80 000F39A0  7C 84 2A 14 */	add r4, r4, r5
/* 800F7A84 000F39A4  A0 84 00 00 */	lhz r4, 0(r4)
/* 800F7A88 000F39A8  54 84 80 1E */	slwi r4, r4, 0x10
/* 800F7A8C 000F39AC  90 83 00 08 */	stw r4, 8(r3)
/* 800F7A90 000F39B0  48 00 00 10 */	b lbl_800F7AA0
lbl_800F7A94:
/* 800F7A94 000F39B4  38 00 00 00 */	li r0, 0
/* 800F7A98 000F39B8  90 03 00 08 */	stw r0, 8(r3)
/* 800F7A9C 000F39BC  38 00 00 01 */	li r0, 1
lbl_800F7AA0:
/* 800F7AA0 000F39C0  7C 03 03 78 */	mr r3, r0
/* 800F7AA4 000F39C4  4E 80 00 20 */	blr 

.global adsrSetup
adsrSetup:
/* 800F7AA8 000F39C8  7C 08 02 A6 */	mflr r0
/* 800F7AAC 000F39CC  90 01 00 04 */	stw r0, 4(r1)
/* 800F7AB0 000F39D0  38 00 00 00 */	li r0, 0
/* 800F7AB4 000F39D4  94 21 FF F8 */	stwu r1, -8(r1)
/* 800F7AB8 000F39D8  98 03 00 01 */	stb r0, 1(r3)
/* 800F7ABC 000F39DC  4B FF FD 81 */	bl salChangeADSRState
/* 800F7AC0 000F39E0  80 01 00 0C */	lwz r0, 0xc(r1)
/* 800F7AC4 000F39E4  38 21 00 08 */	addi r1, r1, 8
/* 800F7AC8 000F39E8  7C 08 03 A6 */	mtlr r0
/* 800F7ACC 000F39EC  4E 80 00 20 */	blr 

.global adsrStartRelease
adsrStartRelease:
/* 800F7AD0 000F39F0  7C 08 02 A6 */	mflr r0
/* 800F7AD4 000F39F4  90 01 00 04 */	stw r0, 4(r1)
/* 800F7AD8 000F39F8  94 21 FF D8 */	stwu r1, -0x28(r1)
/* 800F7ADC 000F39FC  93 E1 00 24 */	stw r31, 0x24(r1)
/* 800F7AE0 000F3A00  7C 7F 1B 78 */	mr r31, r3
/* 800F7AE4 000F3A04  88 03 00 00 */	lbz r0, 0(r3)
/* 800F7AE8 000F3A08  2C 00 00 01 */	cmpwi r0, 1
/* 800F7AEC 000F3A0C  41 82 00 54 */	beq lbl_800F7B40
/* 800F7AF0 000F3A10  40 80 01 1C */	bge lbl_800F7C0C
/* 800F7AF4 000F3A14  2C 00 00 00 */	cmpwi r0, 0
/* 800F7AF8 000F3A18  40 80 00 08 */	bge lbl_800F7B00
/* 800F7AFC 000F3A1C  48 00 01 10 */	b lbl_800F7C0C
lbl_800F7B00:
/* 800F7B00 000F3A20  38 00 00 04 */	li r0, 4
/* 800F7B04 000F3A24  98 1F 00 01 */	stb r0, 1(r31)
/* 800F7B08 000F3A28  28 04 00 00 */	cmplwi r4, 0
/* 800F7B0C 000F3A2C  90 9F 00 04 */	stw r4, 4(r31)
/* 800F7B10 000F3A30  40 82 00 1C */	bne lbl_800F7B2C
/* 800F7B14 000F3A34  38 00 00 01 */	li r0, 1
/* 800F7B18 000F3A38  90 1F 00 04 */	stw r0, 4(r31)
/* 800F7B1C 000F3A3C  38 00 00 00 */	li r0, 0
/* 800F7B20 000F3A40  38 60 00 01 */	li r3, 1
/* 800F7B24 000F3A44  90 1F 00 10 */	stw r0, 0x10(r31)
/* 800F7B28 000F3A48  48 00 00 E8 */	b lbl_800F7C10
lbl_800F7B2C:
/* 800F7B2C 000F3A4C  80 1F 00 08 */	lwz r0, 8(r31)
/* 800F7B30 000F3A50  7C 00 23 96 */	divwu r0, r0, r4
/* 800F7B34 000F3A54  7C 00 00 D0 */	neg r0, r0
/* 800F7B38 000F3A58  90 1F 00 10 */	stw r0, 0x10(r31)
/* 800F7B3C 000F3A5C  48 00 00 D0 */	b lbl_800F7C0C
lbl_800F7B40:
/* 800F7B40 000F3A60  88 1F 00 26 */	lbz r0, 0x26(r31)
/* 800F7B44 000F3A64  28 00 00 00 */	cmplwi r0, 0
/* 800F7B48 000F3A68  40 82 00 34 */	bne lbl_800F7B7C
/* 800F7B4C 000F3A6C  88 1F 00 01 */	lbz r0, 1(r31)
/* 800F7B50 000F3A70  28 00 00 01 */	cmplwi r0, 1
/* 800F7B54 000F3A74  40 82 00 28 */	bne lbl_800F7B7C
/* 800F7B58 000F3A78  80 BF 00 08 */	lwz r5, 8(r31)
/* 800F7B5C 000F3A7C  3C 60 80 1F */	lis r3, lbl_801E9D54@ha
/* 800F7B60 000F3A80  38 03 9D 54 */	addi r0, r3, lbl_801E9D54@l
/* 800F7B64 000F3A84  7C A3 AE 70 */	srawi r3, r5, 0x15
/* 800F7B68 000F3A88  7C 60 1A 14 */	add r3, r0, r3
/* 800F7B6C 000F3A8C  88 03 00 00 */	lbz r0, 0(r3)
/* 800F7B70 000F3A90  20 00 00 C1 */	subfic r0, r0, 0xc1
/* 800F7B74 000F3A94  54 00 80 1E */	slwi r0, r0, 0x10
/* 800F7B78 000F3A98  90 1F 00 0C */	stw r0, 0xc(r31)
lbl_800F7B7C:
/* 800F7B7C 000F3A9C  80 7F 00 0C */	lwz r3, 0xc(r31)
/* 800F7B80 000F3AA0  3C 00 43 30 */	lis r0, 0x4330
/* 800F7B84 000F3AA4  90 81 00 14 */	stw r4, 0x14(r1)
/* 800F7B88 000F3AA8  6C 63 80 00 */	xoris r3, r3, 0x8000
/* 800F7B8C 000F3AAC  C8 42 C1 80 */	lfd f2, lbl_802F6980-_SDA2_BASE_(r2)
/* 800F7B90 000F3AB0  90 61 00 1C */	stw r3, 0x1c(r1)
/* 800F7B94 000F3AB4  C0 62 C1 88 */	lfs f3, lbl_802F6988-_SDA2_BASE_(r2)
/* 800F7B98 000F3AB8  90 01 00 18 */	stw r0, 0x18(r1)
/* 800F7B9C 000F3ABC  C8 22 C1 90 */	lfd f1, lbl_802F6990-_SDA2_BASE_(r2)
/* 800F7BA0 000F3AC0  C8 01 00 18 */	lfd f0, 0x18(r1)
/* 800F7BA4 000F3AC4  90 01 00 10 */	stw r0, 0x10(r1)
/* 800F7BA8 000F3AC8  EC 40 10 28 */	fsubs f2, f0, f2
/* 800F7BAC 000F3ACC  C8 01 00 10 */	lfd f0, 0x10(r1)
/* 800F7BB0 000F3AD0  EC 43 00 B2 */	fmuls f2, f3, f2
/* 800F7BB4 000F3AD4  EC 00 08 28 */	fsubs f0, f0, f1
/* 800F7BB8 000F3AD8  EC 22 00 32 */	fmuls f1, f2, f0
/* 800F7BBC 000F3ADC  48 00 B9 B1 */	bl __cvt_fp2unsigned
/* 800F7BC0 000F3AE0  54 60 A3 3E */	srwi r0, r3, 0xc
/* 800F7BC4 000F3AE4  90 1F 00 04 */	stw r0, 4(r31)
/* 800F7BC8 000F3AE8  38 00 00 04 */	li r0, 4
/* 800F7BCC 000F3AEC  98 1F 00 01 */	stb r0, 1(r31)
/* 800F7BD0 000F3AF0  80 7F 00 04 */	lwz r3, 4(r31)
/* 800F7BD4 000F3AF4  28 03 00 00 */	cmplwi r3, 0
/* 800F7BD8 000F3AF8  40 82 00 24 */	bne lbl_800F7BFC
/* 800F7BDC 000F3AFC  38 00 00 01 */	li r0, 1
/* 800F7BE0 000F3B00  90 1F 00 04 */	stw r0, 4(r31)
/* 800F7BE4 000F3B04  38 00 00 00 */	li r0, 0
/* 800F7BE8 000F3B08  38 60 00 01 */	li r3, 1
/* 800F7BEC 000F3B0C  90 1F 00 08 */	stw r0, 8(r31)
/* 800F7BF0 000F3B10  90 1F 00 0C */	stw r0, 0xc(r31)
/* 800F7BF4 000F3B14  90 1F 00 10 */	stw r0, 0x10(r31)
/* 800F7BF8 000F3B18  48 00 00 18 */	b lbl_800F7C10
lbl_800F7BFC:
/* 800F7BFC 000F3B1C  80 1F 00 0C */	lwz r0, 0xc(r31)
/* 800F7C00 000F3B20  7C 00 1B 96 */	divwu r0, r0, r3
/* 800F7C04 000F3B24  7C 00 00 D0 */	neg r0, r0
/* 800F7C08 000F3B28  90 1F 00 10 */	stw r0, 0x10(r31)
lbl_800F7C0C:
/* 800F7C0C 000F3B2C  38 60 00 00 */	li r3, 0
lbl_800F7C10:
/* 800F7C10 000F3B30  80 01 00 2C */	lwz r0, 0x2c(r1)
/* 800F7C14 000F3B34  83 E1 00 24 */	lwz r31, 0x24(r1)
/* 800F7C18 000F3B38  38 21 00 28 */	addi r1, r1, 0x28
/* 800F7C1C 000F3B3C  7C 08 03 A6 */	mtlr r0
/* 800F7C20 000F3B40  4E 80 00 20 */	blr 

.global adsrRelease
adsrRelease:
/* 800F7C24 000F3B44  7C 08 02 A6 */	mflr r0
/* 800F7C28 000F3B48  90 01 00 04 */	stw r0, 4(r1)
/* 800F7C2C 000F3B4C  94 21 FF F8 */	stwu r1, -8(r1)
/* 800F7C30 000F3B50  88 03 00 00 */	lbz r0, 0(r3)
/* 800F7C34 000F3B54  2C 00 00 02 */	cmpwi r0, 2
/* 800F7C38 000F3B58  40 80 00 1C */	bge lbl_800F7C54
/* 800F7C3C 000F3B5C  2C 00 00 00 */	cmpwi r0, 0
/* 800F7C40 000F3B60  40 80 00 08 */	bge lbl_800F7C48
/* 800F7C44 000F3B64  48 00 00 10 */	b lbl_800F7C54
lbl_800F7C48:
/* 800F7C48 000F3B68  80 83 00 20 */	lwz r4, 0x20(r3)
/* 800F7C4C 000F3B6C  4B FF FE 85 */	bl adsrStartRelease
/* 800F7C50 000F3B70  48 00 00 08 */	b lbl_800F7C58
lbl_800F7C54:
/* 800F7C54 000F3B74  38 60 00 00 */	li r3, 0
lbl_800F7C58:
/* 800F7C58 000F3B78  80 01 00 0C */	lwz r0, 0xc(r1)
/* 800F7C5C 000F3B7C  38 21 00 08 */	addi r1, r1, 8
/* 800F7C60 000F3B80  7C 08 03 A6 */	mtlr r0
/* 800F7C64 000F3B84  4E 80 00 20 */	blr 

.global adsrHandle
adsrHandle:
/* 800F7C68 000F3B88  7C 08 02 A6 */	mflr r0
/* 800F7C6C 000F3B8C  90 01 00 04 */	stw r0, 4(r1)
/* 800F7C70 000F3B90  38 00 00 00 */	li r0, 0
/* 800F7C74 000F3B94  94 21 FF F8 */	stwu r1, -8(r1)
/* 800F7C78 000F3B98  88 C3 00 00 */	lbz r6, 0(r3)
/* 800F7C7C 000F3B9C  2C 06 00 01 */	cmpwi r6, 1
/* 800F7C80 000F3BA0  41 82 00 94 */	beq lbl_800F7D14
/* 800F7C84 000F3BA4  40 80 01 70 */	bge lbl_800F7DF4
/* 800F7C88 000F3BA8  2C 06 00 00 */	cmpwi r6, 0
/* 800F7C8C 000F3BAC  40 80 00 08 */	bge lbl_800F7C94
/* 800F7C90 000F3BB0  48 00 01 64 */	b lbl_800F7DF4
lbl_800F7C94:
/* 800F7C94 000F3BB4  88 C3 00 01 */	lbz r6, 1(r3)
/* 800F7C98 000F3BB8  28 06 00 03 */	cmplwi r6, 3
/* 800F7C9C 000F3BBC  41 82 00 60 */	beq lbl_800F7CFC
/* 800F7CA0 000F3BC0  81 03 00 08 */	lwz r8, 8(r3)
/* 800F7CA4 000F3BC4  80 E3 00 10 */	lwz r7, 0x10(r3)
/* 800F7CA8 000F3BC8  7D 06 86 70 */	srawi r6, r8, 0x10
/* 800F7CAC 000F3BCC  7C E8 3A 14 */	add r7, r8, r7
/* 800F7CB0 000F3BD0  90 E3 00 08 */	stw r7, 8(r3)
/* 800F7CB4 000F3BD4  B0 C4 00 00 */	sth r6, 0(r4)
/* 800F7CB8 000F3BD8  80 83 00 10 */	lwz r4, 0x10(r3)
/* 800F7CBC 000F3BDC  2C 04 00 00 */	cmpwi r4, 0
/* 800F7CC0 000F3BE0  41 80 00 10 */	blt lbl_800F7CD0
/* 800F7CC4 000F3BE4  7C 84 AE 70 */	srawi r4, r4, 0x15
/* 800F7CC8 000F3BE8  B0 85 00 00 */	sth r4, 0(r5)
/* 800F7CCC 000F3BEC  48 00 00 14 */	b lbl_800F7CE0
lbl_800F7CD0:
/* 800F7CD0 000F3BF0  7C 84 00 D0 */	neg r4, r4
/* 800F7CD4 000F3BF4  7C 84 AE 70 */	srawi r4, r4, 0x15
/* 800F7CD8 000F3BF8  7C 84 00 D0 */	neg r4, r4
/* 800F7CDC 000F3BFC  B0 85 00 00 */	sth r4, 0(r5)
lbl_800F7CE0:
/* 800F7CE0 000F3C00  80 83 00 04 */	lwz r4, 4(r3)
/* 800F7CE4 000F3C04  34 84 FF FF */	addic. r4, r4, -1
/* 800F7CE8 000F3C08  90 83 00 04 */	stw r4, 4(r3)
/* 800F7CEC 000F3C0C  40 82 01 08 */	bne lbl_800F7DF4
/* 800F7CF0 000F3C10  4B FF FB 4D */	bl salChangeADSRState
/* 800F7CF4 000F3C14  7C 60 1B 78 */	mr r0, r3
/* 800F7CF8 000F3C18  48 00 00 FC */	b lbl_800F7DF4
lbl_800F7CFC:
/* 800F7CFC 000F3C1C  80 C3 00 08 */	lwz r6, 8(r3)
/* 800F7D00 000F3C20  38 60 00 00 */	li r3, 0
/* 800F7D04 000F3C24  7C C6 86 70 */	srawi r6, r6, 0x10
/* 800F7D08 000F3C28  B0 C4 00 00 */	sth r6, 0(r4)
/* 800F7D0C 000F3C2C  B0 65 00 00 */	sth r3, 0(r5)
/* 800F7D10 000F3C30  48 00 00 E4 */	b lbl_800F7DF4
lbl_800F7D14:
/* 800F7D14 000F3C34  88 E3 00 01 */	lbz r7, 1(r3)
/* 800F7D18 000F3C38  28 07 00 03 */	cmplwi r7, 3
/* 800F7D1C 000F3C3C  41 82 00 C4 */	beq lbl_800F7DE0
/* 800F7D20 000F3C40  88 C3 00 26 */	lbz r6, 0x26(r3)
/* 800F7D24 000F3C44  81 03 00 08 */	lwz r8, 8(r3)
/* 800F7D28 000F3C48  28 06 00 00 */	cmplwi r6, 0
/* 800F7D2C 000F3C4C  40 82 00 1C */	bne lbl_800F7D48
/* 800F7D30 000F3C50  28 07 00 01 */	cmplwi r7, 1
/* 800F7D34 000F3C54  40 82 00 14 */	bne lbl_800F7D48
/* 800F7D38 000F3C58  80 C3 00 10 */	lwz r6, 0x10(r3)
/* 800F7D3C 000F3C5C  7C C8 32 14 */	add r6, r8, r6
/* 800F7D40 000F3C60  90 C3 00 08 */	stw r6, 8(r3)
/* 800F7D44 000F3C64  48 00 00 50 */	b lbl_800F7D94
lbl_800F7D48:
/* 800F7D48 000F3C68  80 E3 00 0C */	lwz r7, 0xc(r3)
/* 800F7D4C 000F3C6C  80 C3 00 10 */	lwz r6, 0x10(r3)
/* 800F7D50 000F3C70  7C C7 32 14 */	add r6, r7, r6
/* 800F7D54 000F3C74  90 C3 00 0C */	stw r6, 0xc(r3)
/* 800F7D58 000F3C78  80 C3 00 0C */	lwz r6, 0xc(r3)
/* 800F7D5C 000F3C7C  3C C6 00 01 */	addis r6, r6, 1
/* 800F7D60 000F3C80  38 C6 80 00 */	addi r6, r6, -32768
/* 800F7D64 000F3C84  7C C6 86 70 */	srawi r6, r6, 0x10
/* 800F7D68 000F3C88  20 E6 00 C1 */	subfic r7, r6, 0xc1
/* 800F7D6C 000F3C8C  2C 07 00 00 */	cmpwi r7, 0
/* 800F7D70 000F3C90  40 80 00 08 */	bge lbl_800F7D78
/* 800F7D74 000F3C94  38 E0 00 00 */	li r7, 0
lbl_800F7D78:
/* 800F7D78 000F3C98  3C C0 80 1F */	lis r6, lbl_801E9BD0@ha
/* 800F7D7C 000F3C9C  54 E7 08 3C */	slwi r7, r7, 1
/* 800F7D80 000F3CA0  38 C6 9B D0 */	addi r6, r6, lbl_801E9BD0@l
/* 800F7D84 000F3CA4  7C C6 3A 14 */	add r6, r6, r7
/* 800F7D88 000F3CA8  A0 C6 00 00 */	lhz r6, 0(r6)
/* 800F7D8C 000F3CAC  54 C6 80 1E */	slwi r6, r6, 0x10
/* 800F7D90 000F3CB0  90 C3 00 08 */	stw r6, 8(r3)
lbl_800F7D94:
/* 800F7D94 000F3CB4  7D 06 86 70 */	srawi r6, r8, 0x10
/* 800F7D98 000F3CB8  B0 C4 00 00 */	sth r6, 0(r4)
/* 800F7D9C 000F3CBC  80 83 00 08 */	lwz r4, 8(r3)
/* 800F7DA0 000F3CC0  7C 88 20 51 */	subf. r4, r8, r4
/* 800F7DA4 000F3CC4  41 80 00 10 */	blt lbl_800F7DB4
/* 800F7DA8 000F3CC8  7C 84 AE 70 */	srawi r4, r4, 0x15
/* 800F7DAC 000F3CCC  B0 85 00 00 */	sth r4, 0(r5)
/* 800F7DB0 000F3CD0  48 00 00 14 */	b lbl_800F7DC4
lbl_800F7DB4:
/* 800F7DB4 000F3CD4  7C 84 00 D0 */	neg r4, r4
/* 800F7DB8 000F3CD8  7C 84 AE 70 */	srawi r4, r4, 0x15
/* 800F7DBC 000F3CDC  7C 84 00 D0 */	neg r4, r4
/* 800F7DC0 000F3CE0  B0 85 00 00 */	sth r4, 0(r5)
lbl_800F7DC4:
/* 800F7DC4 000F3CE4  80 83 00 04 */	lwz r4, 4(r3)
/* 800F7DC8 000F3CE8  34 84 FF FF */	addic. r4, r4, -1
/* 800F7DCC 000F3CEC  90 83 00 04 */	stw r4, 4(r3)
/* 800F7DD0 000F3CF0  40 82 00 24 */	bne lbl_800F7DF4
/* 800F7DD4 000F3CF4  4B FF FA 69 */	bl salChangeADSRState
/* 800F7DD8 000F3CF8  7C 60 1B 78 */	mr r0, r3
/* 800F7DDC 000F3CFC  48 00 00 18 */	b lbl_800F7DF4
lbl_800F7DE0:
/* 800F7DE0 000F3D00  80 C3 00 08 */	lwz r6, 8(r3)
/* 800F7DE4 000F3D04  38 60 00 00 */	li r3, 0
/* 800F7DE8 000F3D08  7C C6 86 70 */	srawi r6, r6, 0x10
/* 800F7DEC 000F3D0C  B0 C4 00 00 */	sth r6, 0(r4)
/* 800F7DF0 000F3D10  B0 65 00 00 */	sth r3, 0(r5)
lbl_800F7DF4:
/* 800F7DF4 000F3D14  7C 03 03 78 */	mr r3, r0
/* 800F7DF8 000F3D18  80 01 00 0C */	lwz r0, 0xc(r1)
/* 800F7DFC 000F3D1C  38 21 00 08 */	addi r1, r1, 8
/* 800F7E00 000F3D20  7C 08 03 A6 */	mtlr r0
/* 800F7E04 000F3D24  4E 80 00 20 */	blr 

.global adsrHandleLowPrecision
adsrHandleLowPrecision:
/* 800F7E08 000F3D28  7C 08 02 A6 */	mflr r0
/* 800F7E0C 000F3D2C  90 01 00 04 */	stw r0, 4(r1)
/* 800F7E10 000F3D30  94 21 FF D8 */	stwu r1, -0x28(r1)
/* 800F7E14 000F3D34  93 E1 00 24 */	stw r31, 0x24(r1)
/* 800F7E18 000F3D38  3B E0 00 00 */	li r31, 0
/* 800F7E1C 000F3D3C  93 C1 00 20 */	stw r30, 0x20(r1)
/* 800F7E20 000F3D40  3B C5 00 00 */	addi r30, r5, 0
/* 800F7E24 000F3D44  93 A1 00 1C */	stw r29, 0x1c(r1)
/* 800F7E28 000F3D48  3B A4 00 00 */	addi r29, r4, 0
/* 800F7E2C 000F3D4C  93 81 00 18 */	stw r28, 0x18(r1)
/* 800F7E30 000F3D50  3B 83 00 00 */	addi r28, r3, 0
/* 800F7E34 000F3D54  48 00 00 28 */	b lbl_800F7E5C
lbl_800F7E38:
/* 800F7E38 000F3D58  38 7C 00 00 */	addi r3, r28, 0
/* 800F7E3C 000F3D5C  38 9D 00 00 */	addi r4, r29, 0
/* 800F7E40 000F3D60  38 BE 00 00 */	addi r5, r30, 0
/* 800F7E44 000F3D64  4B FF FE 25 */	bl adsrHandle
/* 800F7E48 000F3D68  28 03 00 00 */	cmplwi r3, 0
/* 800F7E4C 000F3D6C  41 82 00 0C */	beq lbl_800F7E58
/* 800F7E50 000F3D70  38 60 00 01 */	li r3, 1
/* 800F7E54 000F3D74  48 00 00 18 */	b lbl_800F7E6C
lbl_800F7E58:
/* 800F7E58 000F3D78  3B FF 00 01 */	addi r31, r31, 1
lbl_800F7E5C:
/* 800F7E5C 000F3D7C  57 E0 06 3E */	clrlwi r0, r31, 0x18
/* 800F7E60 000F3D80  28 00 00 0F */	cmplwi r0, 0xf
/* 800F7E64 000F3D84  41 80 FF D4 */	blt lbl_800F7E38
/* 800F7E68 000F3D88  38 60 00 00 */	li r3, 0
lbl_800F7E6C:
/* 800F7E6C 000F3D8C  80 01 00 2C */	lwz r0, 0x2c(r1)
/* 800F7E70 000F3D90  83 E1 00 24 */	lwz r31, 0x24(r1)
/* 800F7E74 000F3D94  83 C1 00 20 */	lwz r30, 0x20(r1)
/* 800F7E78 000F3D98  7C 08 03 A6 */	mtlr r0
/* 800F7E7C 000F3D9C  83 A1 00 1C */	lwz r29, 0x1c(r1)
/* 800F7E80 000F3DA0  83 81 00 18 */	lwz r28, 0x18(r1)
/* 800F7E84 000F3DA4  38 21 00 28 */	addi r1, r1, 0x28
/* 800F7E88 000F3DA8  4E 80 00 20 */	blr 
