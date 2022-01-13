.include "macros.inc"

.section .text, "ax"  # 0x800065A0 - 0x8010F860

.global TRKLoadContext
TRKLoadContext:
/* 8010DD5C 00109C7C  80 03 00 00 */	lwz r0, 0(r3)
/* 8010DD60 00109C80  80 23 00 04 */	lwz r1, 4(r3)
/* 8010DD64 00109C84  80 43 00 08 */	lwz r2, 8(r3)
/* 8010DD68 00109C88  A0 A3 01 A2 */	lhz r5, 0x1a2(r3)
/* 8010DD6C 00109C8C  54 A6 07 BD */	rlwinm. r6, r5, 0, 0x1e, 0x1e
/* 8010DD70 00109C90  41 82 00 14 */	beq lbl_8010DD84
/* 8010DD74 00109C94  54 A5 07 FA */	rlwinm r5, r5, 0, 0x1f, 0x1d
/* 8010DD78 00109C98  B0 A3 01 A2 */	sth r5, 0x1a2(r3)
/* 8010DD7C 00109C9C  B8 A3 00 14 */	lmw r5, 0x14(r3)
/* 8010DD80 00109CA0  48 00 00 08 */	b lbl_8010DD88
lbl_8010DD84:
/* 8010DD84 00109CA4  B9 A3 00 34 */	lmw r13, 0x34(r3)
lbl_8010DD88:
/* 8010DD88 00109CA8  7C 7F 1B 78 */	mr r31, r3
/* 8010DD8C 00109CAC  7C 83 23 78 */	mr r3, r4
/* 8010DD90 00109CB0  80 9F 00 80 */	lwz r4, 0x80(r31)
/* 8010DD94 00109CB4  7C 8F F1 20 */	mtcrf 0xff, r4
/* 8010DD98 00109CB8  80 9F 00 84 */	lwz r4, 0x84(r31)
/* 8010DD9C 00109CBC  7C 88 03 A6 */	mtlr r4
/* 8010DDA0 00109CC0  80 9F 00 88 */	lwz r4, 0x88(r31)
/* 8010DDA4 00109CC4  7C 89 03 A6 */	mtctr r4
/* 8010DDA8 00109CC8  80 9F 00 8C */	lwz r4, 0x8c(r31)
/* 8010DDAC 00109CCC  7C 81 03 A6 */	mtxer r4
/* 8010DDB0 00109CD0  7C 80 00 A6 */	mfmsr r4
/* 8010DDB4 00109CD4  54 84 04 5E */	rlwinm r4, r4, 0, 0x11, 0xf
/* 8010DDB8 00109CD8  54 84 07 FA */	rlwinm r4, r4, 0, 0x1f, 0x1d
/* 8010DDBC 00109CDC  7C 80 01 24 */	mtmsr r4
/* 8010DDC0 00109CE0  7C 51 43 A6 */	mtspr 0x111, r2
/* 8010DDC4 00109CE4  80 9F 00 0C */	lwz r4, 0xc(r31)
/* 8010DDC8 00109CE8  7C 92 43 A6 */	mtspr 0x112, r4
/* 8010DDCC 00109CEC  80 9F 00 10 */	lwz r4, 0x10(r31)
/* 8010DDD0 00109CF0  7C 93 43 A6 */	mtspr 0x113, r4
/* 8010DDD4 00109CF4  80 5F 01 98 */	lwz r2, 0x198(r31)
/* 8010DDD8 00109CF8  80 9F 01 9C */	lwz r4, 0x19c(r31)
/* 8010DDDC 00109CFC  83 FF 00 7C */	lwz r31, 0x7c(r31)
/* 8010DDE0 00109D00  4B FF ED 8C */	b lbl_8010CB6C

.global TRKEXICallBack
TRKEXICallBack:
/* 8010DDE4 00109D04  7C 08 02 A6 */	mflr r0
/* 8010DDE8 00109D08  90 01 00 04 */	stw r0, 4(r1)
/* 8010DDEC 00109D0C  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 8010DDF0 00109D10  93 E1 00 0C */	stw r31, 0xc(r1)
/* 8010DDF4 00109D14  7C 9F 23 78 */	mr r31, r4
/* 8010DDF8 00109D18  4B FB AF 0D */	bl OSEnableScheduler
/* 8010DDFC 00109D1C  7F E3 FB 78 */	mr r3, r31
/* 8010DE00 00109D20  38 80 05 00 */	li r4, 0x500
/* 8010DE04 00109D24  4B FF FF 59 */	bl TRKLoadContext
/* 8010DE08 00109D28  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 8010DE0C 00109D2C  38 21 00 10 */	addi r1, r1, 0x10
/* 8010DE10 00109D30  80 01 00 04 */	lwz r0, 4(r1)
/* 8010DE14 00109D34  7C 08 03 A6 */	mtlr r0
/* 8010DE18 00109D38  4E 80 00 20 */	blr

.global InitMetroTRKCommTable
InitMetroTRKCommTable:
/* 8010DE1C 00109D3C  7C 08 02 A6 */	mflr r0
/* 8010DE20 00109D40  90 01 00 04 */	stw r0, 4(r1)
/* 8010DE24 00109D44  94 21 FF F8 */	stwu r1, -8(r1)
/* 8010DE28 00109D48  2C 03 00 01 */	cmpwi r3, 1
/* 8010DE2C 00109D4C  40 82 00 68 */	bne lbl_8010DE94
/* 8010DE30 00109D50  48 00 1A 25 */	bl Hu_IsStub
/* 8010DE34 00109D54  3C A0 80 11 */	lis r5, DBInitComm@ha
/* 8010DE38 00109D58  3C 80 80 1F */	lis r4, gDBCommTable@ha
/* 8010DE3C 00109D5C  38 05 F3 F0 */	addi r0, r5, DBInitComm@l
/* 8010DE40 00109D60  38 A4 D8 D8 */	addi r5, r4, gDBCommTable@l
/* 8010DE44 00109D64  3C 80 80 11 */	lis r4, DBInitInterrupts@ha
/* 8010DE48 00109D68  90 05 00 00 */	stw r0, 0(r5)
/* 8010DE4C 00109D6C  38 04 F4 68 */	addi r0, r4, DBInitInterrupts@l
/* 8010DE50 00109D70  3C 80 80 11 */	lis r4, DBQueryData@ha
/* 8010DE54 00109D74  90 05 00 04 */	stw r0, 4(r5)
/* 8010DE58 00109D78  38 04 F4 BC */	addi r0, r4, DBQueryData@l
/* 8010DE5C 00109D7C  3C 80 80 11 */	lis r4, DBRead@ha
/* 8010DE60 00109D80  90 05 00 08 */	stw r0, 8(r5)
/* 8010DE64 00109D84  38 04 F5 58 */	addi r0, r4, DBRead@l
/* 8010DE68 00109D88  3C 80 80 11 */	lis r4, DBWrite@ha
/* 8010DE6C 00109D8C  90 05 00 0C */	stw r0, 0xc(r5)
/* 8010DE70 00109D90  38 04 F5 E4 */	addi r0, r4, DBWrite@l
/* 8010DE74 00109D94  3C 80 80 11 */	lis r4, DBOpen@ha
/* 8010DE78 00109D98  90 05 00 10 */	stw r0, 0x10(r5)
/* 8010DE7C 00109D9C  38 04 F8 44 */	addi r0, r4, DBOpen@l
/* 8010DE80 00109DA0  3C 80 80 11 */	lis r4, DBClose@ha
/* 8010DE84 00109DA4  90 05 00 14 */	stw r0, 0x14(r5)
/* 8010DE88 00109DA8  38 04 F8 48 */	addi r0, r4, DBClose@l
/* 8010DE8C 00109DAC  90 05 00 18 */	stw r0, 0x18(r5)
/* 8010DE90 00109DB0  48 00 00 64 */	b lbl_8010DEF4
lbl_8010DE94:
/* 8010DE94 00109DB4  48 00 19 B9 */	bl AMC_IsStub
/* 8010DE98 00109DB8  3C A0 80 11 */	lis r5, EXI2_Init@ha
/* 8010DE9C 00109DBC  3C 80 80 1F */	lis r4, gDBCommTable@ha
/* 8010DEA0 00109DC0  38 05 E7 68 */	addi r0, r5, EXI2_Init@l
/* 8010DEA4 00109DC4  38 A4 D8 D8 */	addi r5, r4, gDBCommTable@l
/* 8010DEA8 00109DC8  3C 80 80 11 */	lis r4, EXI2_EnableInterrupts@ha
/* 8010DEAC 00109DCC  90 05 00 00 */	stw r0, 0(r5)
/* 8010DEB0 00109DD0  38 04 E8 24 */	addi r0, r4, EXI2_EnableInterrupts@l
/* 8010DEB4 00109DD4  3C 80 80 11 */	lis r4, EXI2_Poll@ha
/* 8010DEB8 00109DD8  90 05 00 04 */	stw r0, 4(r5)
/* 8010DEBC 00109DDC  38 04 E8 50 */	addi r0, r4, EXI2_Poll@l
/* 8010DEC0 00109DE0  3C 80 80 11 */	lis r4, EXI2_ReadN@ha
/* 8010DEC4 00109DE4  90 05 00 08 */	stw r0, 8(r5)
/* 8010DEC8 00109DE8  38 04 E9 58 */	addi r0, r4, EXI2_ReadN@l
/* 8010DECC 00109DEC  3C 80 80 11 */	lis r4, EXI2_WriteN@ha
/* 8010DED0 00109DF0  90 05 00 0C */	stw r0, 0xc(r5)
/* 8010DED4 00109DF4  38 04 EC 14 */	addi r0, r4, EXI2_WriteN@l
/* 8010DED8 00109DF8  3C 80 80 11 */	lis r4, EXI2_Reserve@ha
/* 8010DEDC 00109DFC  90 05 00 10 */	stw r0, 0x10(r5)
/* 8010DEE0 00109E00  38 04 ED C4 */	addi r0, r4, EXI2_Reserve@l
/* 8010DEE4 00109E04  3C 80 80 11 */	lis r4, EXI2_Unreserve@ha
/* 8010DEE8 00109E08  90 05 00 14 */	stw r0, 0x14(r5)
/* 8010DEEC 00109E0C  38 04 ED C8 */	addi r0, r4, EXI2_Unreserve@l
/* 8010DEF0 00109E10  90 05 00 18 */	stw r0, 0x18(r5)
lbl_8010DEF4:
/* 8010DEF4 00109E14  38 21 00 08 */	addi r1, r1, 8
/* 8010DEF8 00109E18  80 01 00 04 */	lwz r0, 4(r1)
/* 8010DEFC 00109E1C  7C 08 03 A6 */	mtlr r0
/* 8010DF00 00109E20  4E 80 00 20 */	blr

.global TRKUARTInterruptHandler
TRKUARTInterruptHandler:
/* 8010DF04 00109E24  4E 80 00 20 */	blr

.global TRKInitializeIntDrivenUART
TRKInitializeIntDrivenUART:
/* 8010DF08 00109E28  7C 08 02 A6 */	mflr r0
/* 8010DF0C 00109E2C  90 01 00 04 */	stw r0, 4(r1)
/* 8010DF10 00109E30  94 21 FF F8 */	stwu r1, -8(r1)
/* 8010DF14 00109E34  3C 60 80 1F */	lis r3, gDBCommTable@ha
/* 8010DF18 00109E38  38 63 D8 D8 */	addi r3, r3, gDBCommTable@l
/* 8010DF1C 00109E3C  3C 80 80 11 */	lis r4, TRKEXICallBack@ha
/* 8010DF20 00109E40  81 83 00 00 */	lwz r12, 0(r3)
/* 8010DF24 00109E44  38 84 DD E4 */	addi r4, r4, TRKEXICallBack@l
/* 8010DF28 00109E48  7C C3 33 78 */	mr r3, r6
/* 8010DF2C 00109E4C  7D 88 03 A6 */	mtlr r12
/* 8010DF30 00109E50  4E 80 00 21 */	blrl
/* 8010DF34 00109E54  38 60 00 00 */	li r3, 0
/* 8010DF38 00109E58  38 21 00 08 */	addi r1, r1, 8
/* 8010DF3C 00109E5C  80 01 00 04 */	lwz r0, 4(r1)
/* 8010DF40 00109E60  7C 08 03 A6 */	mtlr r0
/* 8010DF44 00109E64  4E 80 00 20 */	blr

.global EnableEXI2Interrupts
EnableEXI2Interrupts:
/* 8010DF48 00109E68  7C 08 02 A6 */	mflr r0
/* 8010DF4C 00109E6C  90 01 00 04 */	stw r0, 4(r1)
/* 8010DF50 00109E70  94 21 FF F8 */	stwu r1, -8(r1)
/* 8010DF54 00109E74  3C 60 80 1F */	lis r3, gDBCommTable@ha
/* 8010DF58 00109E78  38 63 D8 D8 */	addi r3, r3, gDBCommTable@l
/* 8010DF5C 00109E7C  81 83 00 04 */	lwz r12, 4(r3)
/* 8010DF60 00109E80  7D 88 03 A6 */	mtlr r12
/* 8010DF64 00109E84  4E 80 00 21 */	blrl
/* 8010DF68 00109E88  38 21 00 08 */	addi r1, r1, 8
/* 8010DF6C 00109E8C  80 01 00 04 */	lwz r0, 4(r1)
/* 8010DF70 00109E90  7C 08 03 A6 */	mtlr r0
/* 8010DF74 00109E94  4E 80 00 20 */	blr

.global TRKPollUART
TRKPollUART:
/* 8010DF78 00109E98  7C 08 02 A6 */	mflr r0
/* 8010DF7C 00109E9C  90 01 00 04 */	stw r0, 4(r1)
/* 8010DF80 00109EA0  94 21 FF F8 */	stwu r1, -8(r1)
/* 8010DF84 00109EA4  3C 60 80 1F */	lis r3, gDBCommTable@ha
/* 8010DF88 00109EA8  38 63 D8 D8 */	addi r3, r3, gDBCommTable@l
/* 8010DF8C 00109EAC  81 83 00 08 */	lwz r12, 8(r3)
/* 8010DF90 00109EB0  7D 88 03 A6 */	mtlr r12
/* 8010DF94 00109EB4  4E 80 00 21 */	blrl
/* 8010DF98 00109EB8  38 21 00 08 */	addi r1, r1, 8
/* 8010DF9C 00109EBC  80 01 00 04 */	lwz r0, 4(r1)
/* 8010DFA0 00109EC0  7C 08 03 A6 */	mtlr r0
/* 8010DFA4 00109EC4  4E 80 00 20 */	blr

.global TRKReadUARTN
TRKReadUARTN:
/* 8010DFA8 00109EC8  7C 08 02 A6 */	mflr r0
/* 8010DFAC 00109ECC  90 01 00 04 */	stw r0, 4(r1)
/* 8010DFB0 00109ED0  94 21 FF F8 */	stwu r1, -8(r1)
/* 8010DFB4 00109ED4  3C A0 80 1F */	lis r5, gDBCommTable@ha
/* 8010DFB8 00109ED8  38 A5 D8 D8 */	addi r5, r5, gDBCommTable@l
/* 8010DFBC 00109EDC  81 85 00 0C */	lwz r12, 0xc(r5)
/* 8010DFC0 00109EE0  7D 88 03 A6 */	mtlr r12
/* 8010DFC4 00109EE4  4E 80 00 21 */	blrl
/* 8010DFC8 00109EE8  2C 03 00 00 */	cmpwi r3, 0
/* 8010DFCC 00109EEC  40 82 00 0C */	bne lbl_8010DFD8
/* 8010DFD0 00109EF0  38 60 00 00 */	li r3, 0
/* 8010DFD4 00109EF4  48 00 00 08 */	b lbl_8010DFDC
lbl_8010DFD8:
/* 8010DFD8 00109EF8  38 60 FF FF */	li r3, -1
lbl_8010DFDC:
/* 8010DFDC 00109EFC  38 21 00 08 */	addi r1, r1, 8
/* 8010DFE0 00109F00  80 01 00 04 */	lwz r0, 4(r1)
/* 8010DFE4 00109F04  7C 08 03 A6 */	mtlr r0
/* 8010DFE8 00109F08  4E 80 00 20 */	blr

.global TRKWriteUARTN
TRKWriteUARTN:
/* 8010DFEC 00109F0C  7C 08 02 A6 */	mflr r0
/* 8010DFF0 00109F10  90 01 00 04 */	stw r0, 4(r1)
/* 8010DFF4 00109F14  94 21 FF F8 */	stwu r1, -8(r1)
/* 8010DFF8 00109F18  3C A0 80 1F */	lis r5, gDBCommTable@ha
/* 8010DFFC 00109F1C  38 A5 D8 D8 */	addi r5, r5, gDBCommTable@l
/* 8010E000 00109F20  81 85 00 10 */	lwz r12, 0x10(r5)
/* 8010E004 00109F24  7D 88 03 A6 */	mtlr r12
/* 8010E008 00109F28  4E 80 00 21 */	blrl
/* 8010E00C 00109F2C  2C 03 00 00 */	cmpwi r3, 0
/* 8010E010 00109F30  40 82 00 0C */	bne lbl_8010E01C
/* 8010E014 00109F34  38 60 00 00 */	li r3, 0
/* 8010E018 00109F38  48 00 00 08 */	b lbl_8010E020
lbl_8010E01C:
/* 8010E01C 00109F3C  38 60 FF FF */	li r3, -1
lbl_8010E020:
/* 8010E020 00109F40  38 21 00 08 */	addi r1, r1, 8
/* 8010E024 00109F44  80 01 00 04 */	lwz r0, 4(r1)
/* 8010E028 00109F48  7C 08 03 A6 */	mtlr r0
/* 8010E02C 00109F4C  4E 80 00 20 */	blr

.global ReserveEXI2Port
ReserveEXI2Port:
/* 8010E030 00109F50  7C 08 02 A6 */	mflr r0
/* 8010E034 00109F54  90 01 00 04 */	stw r0, 4(r1)
/* 8010E038 00109F58  94 21 FF F8 */	stwu r1, -8(r1)
/* 8010E03C 00109F5C  3C 60 80 1F */	lis r3, gDBCommTable@ha
/* 8010E040 00109F60  38 63 D8 D8 */	addi r3, r3, gDBCommTable@l
/* 8010E044 00109F64  81 83 00 14 */	lwz r12, 0x14(r3)
/* 8010E048 00109F68  7D 88 03 A6 */	mtlr r12
/* 8010E04C 00109F6C  4E 80 00 21 */	blrl
/* 8010E050 00109F70  38 21 00 08 */	addi r1, r1, 8
/* 8010E054 00109F74  80 01 00 04 */	lwz r0, 4(r1)
/* 8010E058 00109F78  7C 08 03 A6 */	mtlr r0
/* 8010E05C 00109F7C  4E 80 00 20 */	blr

.global UnreserveEXI2Port
UnreserveEXI2Port:
/* 8010E060 00109F80  7C 08 02 A6 */	mflr r0
/* 8010E064 00109F84  90 01 00 04 */	stw r0, 4(r1)
/* 8010E068 00109F88  94 21 FF F8 */	stwu r1, -8(r1)
/* 8010E06C 00109F8C  3C 60 80 1F */	lis r3, gDBCommTable@ha
/* 8010E070 00109F90  38 63 D8 D8 */	addi r3, r3, gDBCommTable@l
/* 8010E074 00109F94  81 83 00 18 */	lwz r12, 0x18(r3)
/* 8010E078 00109F98  7D 88 03 A6 */	mtlr r12
/* 8010E07C 00109F9C  4E 80 00 21 */	blrl
/* 8010E080 00109FA0  38 21 00 08 */	addi r1, r1, 8
/* 8010E084 00109FA4  80 01 00 04 */	lwz r0, 4(r1)
/* 8010E088 00109FA8  7C 08 03 A6 */	mtlr r0
/* 8010E08C 00109FAC  4E 80 00 20 */	blr

.global TRK_board_display
TRK_board_display:
/* 8010E090 00109FB0  7C 08 02 A6 */	mflr r0
/* 8010E094 00109FB4  90 01 00 04 */	stw r0, 4(r1)
/* 8010E098 00109FB8  94 21 FF F8 */	stwu r1, -8(r1)
/* 8010E09C 00109FBC  4C C6 31 82 */	crclr 6
/* 8010E0A0 00109FC0  4B FB 5B 81 */	bl OSReport
/* 8010E0A4 00109FC4  38 21 00 08 */	addi r1, r1, 8
/* 8010E0A8 00109FC8  80 01 00 04 */	lwz r0, 4(r1)
/* 8010E0AC 00109FCC  7C 08 03 A6 */	mtlr r0
/* 8010E0B0 00109FD0  4E 80 00 20 */	blr

.section .data

.global gDBCommTable
gDBCommTable:
	# ROM: 0x1EA8D8
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
