/* 800A4628 000A0548  7C 08 02 A6 */	mflr r0
/* 800A462C 000A054C  3C 60 80 2C */	lis r3, cardStat@ha
/* 800A4630 000A0550  90 01 00 04 */	stw r0, 4(r1)
/* 800A4634 000A0554  94 21 FF B0 */	stwu r1, -0x50(r1)
/* 800A4638 000A0558  93 E1 00 4C */	stw r31, 0x4c(r1)
/* 800A463C 000A055C  93 C1 00 48 */	stw r30, 0x48(r1)
/* 800A4640 000A0560  93 A1 00 44 */	stw r29, 0x44(r1)
/* 800A4644 000A0564  93 81 00 40 */	stw r28, 0x40(r1)
/* 800A4648 000A0568  3B 83 A2 A0 */	addi r28, r3, cardStat@l
/* 800A464C 000A056C  4B FC D4 41 */	bl func_80071A8C
/* 800A4650 000A0570  38 60 00 B3 */	li r3, 0xb3
/* 800A4654 000A0574  4B FC D4 81 */	bl func_80071AD4
/* 800A4658 000A0578  C0 22 B3 30 */	lfs f1, lbl_802F5B30-_SDA2_BASE_(r2)
/* 800A465C 000A057C  4B FC D4 C1 */	bl func_80071B1C
/* 800A4660 000A0580  80 7C 00 78 */	lwz r3, 0x78(r28)
/* 800A4664 000A0584  3B FC 00 78 */	addi r31, r28, 0x78
/* 800A4668 000A0588  54 60 05 AD */	rlwinm. r0, r3, 0, 0x16, 0x16
/* 800A466C 000A058C  41 82 01 28 */	beq lbl_800A4794
/* 800A4670 000A0590  80 7C 00 7C */	lwz r3, 0x7c(r28)
/* 800A4674 000A0594  28 03 00 00 */	cmplwi r3, 0
/* 800A4678 000A0598  41 82 00 10 */	beq lbl_800A4688
/* 800A467C 000A059C  C0 22 B3 20 */	lfs f1, lbl_802F5B20-_SDA2_BASE_(r2)
/* 800A4680 000A05A0  C0 42 B3 24 */	lfs f2, lbl_802F5B24-_SDA2_BASE_(r2)
/* 800A4684 000A05A4  4B FF FD 5D */	bl draw_memcard_msg
lbl_800A4688:
/* 800A4688 000A05A8  A0 1C 00 B2 */	lhz r0, 0xb2(r28)
/* 800A468C 000A05AC  28 00 00 00 */	cmplwi r0, 0
/* 800A4690 000A05B0  41 82 00 10 */	beq lbl_800A46A0
/* 800A4694 000A05B4  80 1F 00 00 */	lwz r0, 0(r31)
/* 800A4698 000A05B8  54 00 03 19 */	rlwinm. r0, r0, 0, 0xc, 0xc
/* 800A469C 000A05BC  41 82 00 3C */	beq lbl_800A46D8
lbl_800A46A0:
/* 800A46A0 000A05C0  80 7F 00 00 */	lwz r3, 0(r31)
/* 800A46A4 000A05C4  54 60 06 F7 */	rlwinm. r0, r3, 0, 0x1b, 0x1b
/* 800A46A8 000A05C8  41 82 00 20 */	beq lbl_800A46C8
/* 800A46AC 000A05CC  54 60 02 53 */	rlwinm. r0, r3, 0, 9, 9
/* 800A46B0 000A05D0  40 82 00 18 */	bne lbl_800A46C8
/* 800A46B4 000A05D4  C0 22 B3 20 */	lfs f1, lbl_802F5B20-_SDA2_BASE_(r2)
/* 800A46B8 000A05D8  38 6D 94 04 */	la r3, msgPressBButtonNoSave(r13)
/* 800A46BC 000A05DC  C0 42 B3 34 */	lfs f2, lbl_802F5B34-_SDA2_BASE_(r2)
/* 800A46C0 000A05E0  4B FF FD 21 */	bl draw_memcard_msg
/* 800A46C4 000A05E4  48 00 00 14 */	b lbl_800A46D8
lbl_800A46C8:
/* 800A46C8 000A05E8  C0 22 B3 20 */	lfs f1, lbl_802F5B20-_SDA2_BASE_(r2)
/* 800A46CC 000A05EC  38 6D 93 FC */	la r3, msgPressBButton(r13)
/* 800A46D0 000A05F0  C0 42 B3 34 */	lfs f2, lbl_802F5B34-_SDA2_BASE_(r2)
/* 800A46D4 000A05F4  4B FF FD 0D */	bl draw_memcard_msg
lbl_800A46D8:
/* 800A46D8 000A05F8  80 1F 00 00 */	lwz r0, 0(r31)
/* 800A46DC 000A05FC  54 00 02 D7 */	rlwinm. r0, r0, 0, 0xb, 0xb
/* 800A46E0 000A0600  41 82 00 AC */	beq lbl_800A478C
/* 800A46E4 000A0604  8C BC 00 BD */	lbzu r5, 0xbd(r28)
/* 800A46E8 000A0608  28 05 00 00 */	cmplwi r5, 0
/* 800A46EC 000A060C  40 82 00 18 */	bne lbl_800A4704
/* 800A46F0 000A0610  C0 22 B3 20 */	lfs f1, lbl_802F5B20-_SDA2_BASE_(r2)
/* 800A46F4 000A0614  38 6D 94 1C */	la r3, msgMemCardNoFreeBlocks(r13)
/* 800A46F8 000A0618  C0 42 B3 38 */	lfs f2, lbl_802F5B38-_SDA2_BASE_(r2)
/* 800A46FC 000A061C  4B FF FC E5 */	bl draw_memcard_msg
/* 800A4700 000A0620  48 00 00 8C */	b lbl_800A478C
lbl_800A4704:
/* 800A4704 000A0624  80 62 B3 28 */	lwz r3, lbl_802F5B28-_SDA2_BASE_(r2)
/* 800A4708 000A0628  28 05 00 01 */	cmplwi r5, 1
/* 800A470C 000A062C  80 02 B3 2C */	lwz r0, lbl_802F5B28+4(r2)
/* 800A4710 000A0630  90 61 00 08 */	stw r3, 8(r1)
/* 800A4714 000A0634  90 01 00 0C */	stw r0, 0xc(r1)
/* 800A4718 000A0638  40 82 00 0C */	bne lbl_800A4724
/* 800A471C 000A063C  3B AD 94 14 */	la r29, msgMemCardNumFreeBlock(r13)
/* 800A4720 000A0640  48 00 00 08 */	b lbl_800A4728
lbl_800A4724:
/* 800A4724 000A0644  3B AD 94 0C */	la r29, msgMemCardNumFreeBlocks(r13)
lbl_800A4728:
/* 800A4728 000A0648  80 61 00 08 */	lwz r3, 8(r1)
/* 800A472C 000A064C  4C C6 31 82 */	crclr 6
/* 800A4730 000A0650  80 9D 00 00 */	lwz r4, 0(r29)
/* 800A4734 000A0654  80 63 00 00 */	lwz r3, 0(r3)
/* 800A4738 000A0658  80 84 00 00 */	lwz r4, 0(r4)
/* 800A473C 000A065C  48 06 04 E9 */	bl sprintf
/* 800A4740 000A0660  88 1C 00 00 */	lbz r0, 0(r28)
/* 800A4744 000A0664  28 00 00 09 */	cmplwi r0, 9
/* 800A4748 000A0668  40 81 00 1C */	ble lbl_800A4764
/* 800A474C 000A066C  80 9D 00 00 */	lwz r4, 0(r29)
/* 800A4750 000A0670  80 61 00 08 */	lwz r3, 8(r1)
/* 800A4754 000A0674  80 84 00 04 */	lwz r4, 4(r4)
/* 800A4758 000A0678  38 04 00 01 */	addi r0, r4, 1
/* 800A475C 000A067C  90 03 00 04 */	stw r0, 4(r3)
/* 800A4760 000A0680  48 00 00 14 */	b lbl_800A4774
lbl_800A4764:
/* 800A4764 000A0684  80 9D 00 00 */	lwz r4, 0(r29)
/* 800A4768 000A0688  80 61 00 08 */	lwz r3, 8(r1)
/* 800A476C 000A068C  80 04 00 04 */	lwz r0, 4(r4)
/* 800A4770 000A0690  90 03 00 04 */	stw r0, 4(r3)
lbl_800A4774:
/* 800A4774 000A0694  80 1D 00 04 */	lwz r0, 4(r29)
/* 800A4778 000A0698  38 61 00 08 */	addi r3, r1, 8
/* 800A477C 000A069C  C0 22 B3 20 */	lfs f1, lbl_802F5B20-_SDA2_BASE_(r2)
/* 800A4780 000A06A0  90 01 00 0C */	stw r0, 0xc(r1)
/* 800A4784 000A06A4  C0 42 B3 38 */	lfs f2, lbl_802F5B38-_SDA2_BASE_(r2)
/* 800A4788 000A06A8  4B FF FC 59 */	bl draw_memcard_msg
lbl_800A478C:
/* 800A478C 000A06AC  4B FC D3 01 */	bl func_80071A8C
/* 800A4790 000A06B0  48 00 05 3C */	b lbl_800A4CCC
lbl_800A4794:
/* 800A4794 000A06B4  54 60 07 7B */	rlwinm. r0, r3, 0, 0x1d, 0x1d
/* 800A4798 000A06B8  41 82 00 18 */	beq lbl_800A47B0
/* 800A479C 000A06BC  C0 22 B3 20 */	lfs f1, lbl_802F5B20-_SDA2_BASE_(r2)
/* 800A47A0 000A06C0  38 6D 94 24 */	la r3, msgAccessMemCard(r13)
/* 800A47A4 000A06C4  C0 42 B3 24 */	lfs f2, lbl_802F5B24-_SDA2_BASE_(r2)
/* 800A47A8 000A06C8  4B FF FC 39 */	bl draw_memcard_msg
/* 800A47AC 000A06CC  48 00 05 20 */	b lbl_800A4CCC
lbl_800A47B0:
/* 800A47B0 000A06D0  54 60 06 73 */	rlwinm. r0, r3, 0, 0x19, 0x19
/* 800A47B4 000A06D4  41 82 00 30 */	beq lbl_800A47E4
/* 800A47B8 000A06D8  54 60 04 21 */	rlwinm. r0, r3, 0, 0x10, 0x10
/* 800A47BC 000A06DC  41 82 00 20 */	beq lbl_800A47DC
/* 800A47C0 000A06E0  C0 22 B3 38 */	lfs f1, lbl_802F5B38-_SDA2_BASE_(r2)
/* 800A47C4 000A06E4  C0 42 B3 3C */	lfs f2, lbl_802F5B3C-_SDA2_BASE_(r2)
/* 800A47C8 000A06E8  4B FC D3 99 */	bl func_80071B60
/* 800A47CC 000A06EC  C0 22 B3 20 */	lfs f1, lbl_802F5B20-_SDA2_BASE_(r2)
/* 800A47D0 000A06F0  38 6D 94 34 */	la r3, msgSavingGame(r13)
/* 800A47D4 000A06F4  C0 42 B3 24 */	lfs f2, lbl_802F5B24-_SDA2_BASE_(r2)
/* 800A47D8 000A06F8  4B FF FC 09 */	bl draw_memcard_msg
lbl_800A47DC:
/* 800A47DC 000A06FC  4B FC D2 B1 */	bl func_80071A8C
/* 800A47E0 000A0700  48 00 04 EC */	b lbl_800A4CCC
lbl_800A47E4:
/* 800A47E4 000A0704  54 60 05 6B */	rlwinm. r0, r3, 0, 0x15, 0x15
/* 800A47E8 000A0708  41 82 00 14 */	beq lbl_800A47FC
/* 800A47EC 000A070C  C0 22 B3 20 */	lfs f1, lbl_802F5B20-_SDA2_BASE_(r2)
/* 800A47F0 000A0710  38 6D 94 44 */	la r3, msgMakeSelection(r13)
/* 800A47F4 000A0714  C0 42 B3 34 */	lfs f2, lbl_802F5B34-_SDA2_BASE_(r2)
/* 800A47F8 000A0718  4B FF FB E9 */	bl draw_memcard_msg
lbl_800A47FC:
/* 800A47FC 000A071C  3B DC 00 BC */	addi r30, r28, 0xbc
/* 800A4800 000A0720  88 1C 00 BC */	lbz r0, 0xbc(r28)
/* 800A4804 000A0724  28 00 00 01 */	cmplwi r0, 1
/* 800A4808 000A0728  40 82 00 14 */	bne lbl_800A481C
/* 800A480C 000A072C  C0 22 B3 20 */	lfs f1, lbl_802F5B20-_SDA2_BASE_(r2)
/* 800A4810 000A0730  38 6D 94 4C */	la r3, msgInsertMemcardSlotAPressA(r13)
/* 800A4814 000A0734  C0 42 B3 24 */	lfs f2, lbl_802F5B24-_SDA2_BASE_(r2)
/* 800A4818 000A0738  4B FF FB C9 */	bl draw_memcard_msg
lbl_800A481C:
/* 800A481C 000A073C  88 1E 00 00 */	lbz r0, 0(r30)
/* 800A4820 000A0740  28 00 00 09 */	cmplwi r0, 9
/* 800A4824 000A0744  40 82 02 10 */	bne lbl_800A4A34
/* 800A4828 000A0748  C0 22 B3 20 */	lfs f1, lbl_802F5B20-_SDA2_BASE_(r2)
/* 800A482C 000A074C  38 6D 94 54 */	la r3, msgFormatPrompt(r13)
/* 800A4830 000A0750  C0 42 B3 24 */	lfs f2, lbl_802F5B24-_SDA2_BASE_(r2)
/* 800A4834 000A0754  4B FF FB AD */	bl draw_memcard_msg
/* 800A4838 000A0758  3C 60 88 89 */	lis r3, 0x88888889@ha
/* 800A483C 000A075C  80 8D 99 54 */	lwz r4, lbl_802F1B34
/* 800A4840 000A0760  38 03 88 89 */	addi r0, r3, 0x88888889@l
/* 800A4844 000A0764  C8 62 B3 58 */	lfd f3, lbl_802F5B58-_SDA2_BASE_(r2)  // double conv?
/* 800A4848 000A0768  7C 00 20 16 */	mulhwu r0, r0, r4
/* 800A484C 000A076C  C8 42 B3 18 */	lfd f2, 4503601774854144.0  //-_SDA2_BASE_(r2)  // double conv
/* 800A4850 000A0770  C8 22 B3 48 */	lfd f1, lbl_802F5B48-_SDA2_BASE_(r2)  // 30.0
/* 800A4854 000A0774  C8 82 B3 40 */	lfd f4, lbl_802F5B40-_SDA2_BASE_(r2)  // 255.0
/* 800A4858 000A0778  54 00 D9 7E */	srwi r0, r0, 5
/* 800A485C 000A077C  1C 00 00 3C */	mulli r0, r0, 0x3c
/* 800A4860 000A0780  7C 00 20 50 */	subf r0, r0, r4  // lbl_802F1B34 % 0x3C;
/* 800A4864 000A0784  90 01 00 3C */	stw r0, 0x3c(r1)
/* 800A4868 000A0788  3F 80 43 30 */	lis r28, 0x4330
/* 800A486C 000A078C  93 81 00 38 */	stw r28, 0x38(r1)  // double conv
/* 800A4870 000A0790  C8 01 00 38 */	lfd f0, 0x38(r1)
/* 800A4874 000A0794  EC 00 18 28 */	fsubs f0, f0, f3  // (double)(lbl_802F1B34 % 0x3C)
/* 800A4878 000A0798  FC 00 00 1E */	fctiwz f0, f0  // back to integer? what?
/* 800A487C 000A079C  D8 01 00 30 */	stfd f0, 0x30(r1)
/* 800A4880 000A07A0  80 01 00 34 */	lwz r0, 0x34(r1)
/* 800A4884 000A07A4  6C 00 80 00 */	xoris r0, r0, 0x8000
/* 800A4888 000A07A8  90 01 00 2C */	stw r0, 0x2c(r1)
/* 800A488C 000A07AC  93 81 00 28 */	stw r28, 0x28(r1)
/* 800A4890 000A07B0  C8 01 00 28 */	lfd f0, 0x28(r1)
/* 800A4894 000A07B4  FC 00 10 28 */	fsub f0, f0, f2  //(double)(int)(double)(lbl_802F1B34 % 0x3C)
/* 800A4898 000A07B8  FC 00 08 28 */	fsub f0, f0, f1
/* 800A489C 000A07BC  FC 00 00 1E */	fctiwz f0, f0
/* 800A48A0 000A07C0  D8 01 00 20 */	stfd f0, 0x20(r1)
/* 800A48A4 000A07C4  80 01 00 24 */	lwz r0, 0x24(r1)    //(int)((double)(int)(double)(lbl_802F1B34 % 0x3C) - 30.0)
/* 800A48A8 000A07C8  7C 03 FE 70 */	srawi r3, r0, 0x1f
/* 800A48AC 000A07CC  7C 60 02 78 */	xor r0, r3, r0
/* 800A48B0 000A07D0  7C 03 00 50 */	subf r0, r3, r0
/* 800A48B4 000A07D4  6C 00 80 00 */	xoris r0, r0, 0x8000
/* 800A48B8 000A07D8  90 01 00 1C */	stw r0, 0x1c(r1)
/* 800A48BC 000A07DC  93 81 00 18 */	stw r28, 0x18(r1)
/* 800A48C0 000A07E0  C8 01 00 18 */	lfd f0, 0x18(r1)
/* 800A48C4 000A07E4  EC 00 10 28 */	fsubs f0, f0, f2  // (float)(abs(xxx))
/* 800A48C8 000A07E8  FC 00 08 24 */	fdiv f0, f0, f1
/* 800A48CC 000A07EC  FC 24 00 32 */	fmul f1, f4, f0
/* 800A48D0 000A07F0  48 05 EC 9D */	bl __cvt_fp2unsigned
/* 800A48D4 000A07F4  C0 22 B3 50 */	lfs f1, lbl_802F5B50-_SDA2_BASE_(r2)
/* 800A48D8 000A07F8  54 64 80 1E */	slwi r4, r3, 0x10
/* 800A48DC 000A07FC  54 60 40 2E */	slwi r0, r3, 8
/* 800A48E0 000A0800  FC 40 08 90 */	fmr f2, f1
/* 800A48E4 000A0804  7C 80 03 78 */	or r0, r4, r0
/* 800A48E8 000A0808  7C 7D 03 78 */	or r29, r3, r0
/* 800A48EC 000A080C  4B FC D2 41 */	bl func_80071B2C
/* 800A48F0 000A0810  80 6D 9C D0 */	lwz r3, lbl_802F1EB0
/* 800A48F4 000A0814  C8 42 B3 18 */	lfd f2, 4503601774854144.0  //-_SDA2_BASE_(r2)
/* 800A48F8 000A0818  38 03 01 01 */	addi r0, r3, 0x101
/* 800A48FC 000A081C  C0 22 B3 54 */	lfs f1, lbl_802F5B54-_SDA2_BASE_(r2)
/* 800A4900 000A0820  6C 00 80 00 */	xoris r0, r0, 0x8000
/* 800A4904 000A0824  90 01 00 14 */	stw r0, 0x14(r1)
/* 800A4908 000A0828  93 81 00 10 */	stw r28, 0x10(r1)
/* 800A490C 000A082C  C8 01 00 10 */	lfd f0, 0x10(r1)
/* 800A4910 000A0830  EC 40 10 28 */	fsubs f2, f0, f2
/* 800A4914 000A0834  4B FC D2 4D */	bl func_80071B60
/* 800A4918 000A0838  88 0D 9F D1 */	lbz r0, lbl_802F21B1
/* 800A491C 000A083C  28 00 00 00 */	cmplwi r0, 0
/* 800A4920 000A0840  40 82 00 18 */	bne lbl_800A4938
/* 800A4924 000A0844  38 60 00 00 */	li r3, 0
/* 800A4928 000A0848  4B FC D1 BD */	bl func_80071AE4
/* 800A492C 000A084C  38 60 00 00 */	li r3, 0
/* 800A4930 000A0850  4B FC D1 C9 */	bl func_80071AF8
/* 800A4934 000A0854  48 00 00 14 */	b lbl_800A4948
lbl_800A4938:
/* 800A4938 000A0858  38 60 00 00 */	li r3, 0
/* 800A493C 000A085C  4B FC D1 A9 */	bl func_80071AE4
/* 800A4940 000A0860  7F A3 EB 78 */	mr r3, r29
/* 800A4944 000A0864  4B FC D1 B5 */	bl func_80071AF8
lbl_800A4948:
/* 800A4948 000A0868  38 6D 94 C0 */	la r3, lbl_802F16A0(r13)
/* 800A494C 000A086C  4B FC D5 0D */	bl func_80071E58
/* 800A4950 000A0870  88 0D 9F D1 */	lbz r0, lbl_802F21B1
/* 800A4954 000A0874  28 00 00 00 */	cmplwi r0, 0
/* 800A4958 000A0878  40 82 00 18 */	bne lbl_800A4970
/* 800A495C 000A087C  38 60 00 00 */	li r3, 0
/* 800A4960 000A0880  4B FC D1 85 */	bl func_80071AE4
/* 800A4964 000A0884  7F A3 EB 78 */	mr r3, r29
/* 800A4968 000A0888  4B FC D1 91 */	bl func_80071AF8
/* 800A496C 000A088C  48 00 00 14 */	b lbl_800A4980
lbl_800A4970:
/* 800A4970 000A0890  38 60 00 00 */	li r3, 0
/* 800A4974 000A0894  4B FC D1 71 */	bl func_80071AE4
/* 800A4978 000A0898  38 60 00 00 */	li r3, 0
/* 800A497C 000A089C  4B FC D1 7D */	bl func_80071AF8
lbl_800A4980:
/* 800A4980 000A08A0  38 6D 94 C8 */	la r3, lbl_802F16A8(r13)
/* 800A4984 000A08A4  4B FC D4 D5 */	bl func_80071E58
/* 800A4988 000A08A8  80 6D 9C D0 */	lwz r3, lbl_802F1EB0
/* 800A498C 000A08AC  3C 00 43 30 */	lis r0, 0x4330
/* 800A4990 000A08B0  C8 42 B3 18 */	lfd f2, 4503601774854144.0  //-_SDA2_BASE_(r2)
/* 800A4994 000A08B4  38 63 00 FF */	addi r3, r3, 0xff
/* 800A4998 000A08B8  C0 22 B3 24 */	lfs f1, lbl_802F5B24-_SDA2_BASE_(r2)
/* 800A499C 000A08BC  6C 63 80 00 */	xoris r3, r3, 0x8000
/* 800A49A0 000A08C0  90 61 00 14 */	stw r3, 0x14(r1)
/* 800A49A4 000A08C4  90 01 00 10 */	stw r0, 0x10(r1)
/* 800A49A8 000A08C8  C8 01 00 10 */	lfd f0, 0x10(r1)
/* 800A49AC 000A08CC  EC 40 10 28 */	fsubs f2, f0, f2
/* 800A49B0 000A08D0  4B FC D1 B1 */	bl func_80071B60
/* 800A49B4 000A08D4  88 0D 9F D1 */	lbz r0, lbl_802F21B1
/* 800A49B8 000A08D8  28 00 00 00 */	cmplwi r0, 0
/* 800A49BC 000A08DC  40 82 00 1C */	bne lbl_800A49D8
/* 800A49C0 000A08E0  3C 60 00 7F */	lis r3, 0x007F7F7F@ha
/* 800A49C4 000A08E4  38 63 7F 7F */	addi r3, r3, 0x007F7F7F@l
/* 800A49C8 000A08E8  4B FC D1 1D */	bl func_80071AE4
/* 800A49CC 000A08EC  38 60 00 00 */	li r3, 0
/* 800A49D0 000A08F0  4B FC D1 29 */	bl func_80071AF8
/* 800A49D4 000A08F4  48 00 00 18 */	b lbl_800A49EC
lbl_800A49D8:
/* 800A49D8 000A08F8  3C 60 01 00 */	lis r3, 0x00FFFFFF@ha
/* 800A49DC 000A08FC  38 63 FF FF */	addi r3, r3, 0x00FFFFFF@l
/* 800A49E0 000A0900  4B FC D1 05 */	bl func_80071AE4
/* 800A49E4 000A0904  7F A3 EB 78 */	mr r3, r29
/* 800A49E8 000A0908  4B FC D1 11 */	bl func_80071AF8
lbl_800A49EC:
/* 800A49EC 000A090C  38 6D 94 C0 */	la r3, lbl_802F16A0(r13)
/* 800A49F0 000A0910  4B FC D4 69 */	bl func_80071E58
/* 800A49F4 000A0914  88 0D 9F D1 */	lbz r0, lbl_802F21B1
/* 800A49F8 000A0918  28 00 00 00 */	cmplwi r0, 0
/* 800A49FC 000A091C  40 82 00 1C */	bne lbl_800A4A18
/* 800A4A00 000A0920  3C 60 01 00 */	lis r3, 0x00FFFFFF@ha
/* 800A4A04 000A0924  38 63 FF FF */	addi r3, r3, 0x00FFFFFF@l
/* 800A4A08 000A0928  4B FC D0 DD */	bl func_80071AE4
/* 800A4A0C 000A092C  7F A3 EB 78 */	mr r3, r29
/* 800A4A10 000A0930  4B FC D0 E9 */	bl func_80071AF8
/* 800A4A14 000A0934  48 00 00 18 */	b lbl_800A4A2C
lbl_800A4A18:
/* 800A4A18 000A0938  3C 60 00 7F */	lis r3, 0x007F7F7F@ha
/* 800A4A1C 000A093C  38 63 7F 7F */	addi r3, r3, 0x007F7F7F@l
/* 800A4A20 000A0940  4B FC D0 C5 */	bl func_80071AE4
/* 800A4A24 000A0944  38 60 00 00 */	li r3, 0
/* 800A4A28 000A0948  4B FC D0 D1 */	bl func_80071AF8
lbl_800A4A2C:
/* 800A4A2C 000A094C  38 6D 94 C8 */	la r3, lbl_802F16A8(r13)
/* 800A4A30 000A0950  4B FC D4 29 */	bl func_80071E58
lbl_800A4A34:
/* 800A4A34 000A0954  88 1E 00 00 */	lbz r0, 0(r30)
/* 800A4A38 000A0958  28 00 00 0A */	cmplwi r0, 0xa
/* 800A4A3C 000A095C  40 82 00 14 */	bne lbl_800A4A50
/* 800A4A40 000A0960  C0 22 B3 20 */	lfs f1, lbl_802F5B20-_SDA2_BASE_(r2)
/* 800A4A44 000A0964  38 6D 94 5C */	la r3, msgFormatProgress(r13)
/* 800A4A48 000A0968  C0 42 B3 24 */	lfs f2, lbl_802F5B24-_SDA2_BASE_(r2)
/* 800A4A4C 000A096C  4B FF F9 95 */	bl draw_memcard_msg
lbl_800A4A50:
/* 800A4A50 000A0970  88 1E 00 00 */	lbz r0, 0(r30)
/* 800A4A54 000A0974  28 00 00 0D */	cmplwi r0, 0xd
/* 800A4A58 000A0978  40 82 02 1C */	bne lbl_800A4C74
/* 800A4A5C 000A097C  80 1F 00 00 */	lwz r0, 0(r31)
/* 800A4A60 000A0980  54 00 05 6B */	rlwinm. r0, r0, 0, 0x15, 0x15
/* 800A4A64 000A0984  41 82 02 10 */	beq lbl_800A4C74
/* 800A4A68 000A0988  C0 22 B3 20 */	lfs f1, lbl_802F5B20-_SDA2_BASE_(r2)
/* 800A4A6C 000A098C  38 6D 94 64 */	la r3, msgOverwritePrompt(r13)
/* 800A4A70 000A0990  C0 42 B3 24 */	lfs f2, lbl_802F5B24-_SDA2_BASE_(r2)
/* 800A4A74 000A0994  4B FF F9 6D */	bl draw_memcard_msg
/* 800A4A78 000A0998  3C 60 88 89 */	lis r3, 0x88888889@ha
/* 800A4A7C 000A099C  80 8D 99 54 */	lwz r4, lbl_802F1B34
/* 800A4A80 000A09A0  38 03 88 89 */	addi r0, r3, 0x88888889@l
/* 800A4A84 000A09A4  C8 62 B3 58 */	lfd f3, lbl_802F5B58-_SDA2_BASE_(r2)  // double conv
/* 800A4A88 000A09A8  7C 00 20 16 */	mulhwu r0, r0, r4
/* 800A4A8C 000A09AC  C8 42 B3 18 */	lfd f2, 4503601774854144.0  //-_SDA2_BASE_(r2)  // double conv
/* 800A4A90 000A09B0  C8 22 B3 48 */	lfd f1, lbl_802F5B48-_SDA2_BASE_(r2)  // 30.0
/* 800A4A94 000A09B4  C8 82 B3 40 */	lfd f4, lbl_802F5B40-_SDA2_BASE_(r2)  // 255.0
/* 800A4A98 000A09B8  54 00 D9 7E */	srwi r0, r0, 5
/* 800A4A9C 000A09BC  1C 00 00 3C */	mulli r0, r0, 0x3c
/* 800A4AA0 000A09C0  7C 00 20 50 */	subf r0, r0, r4
/* 800A4AA4 000A09C4  90 01 00 14 */	stw r0, 0x14(r1)
/* 800A4AA8 000A09C8  3F A0 43 30 */	lis r29, 0x4330
/* 800A4AAC 000A09CC  93 A1 00 10 */	stw r29, 0x10(r1)
/* 800A4AB0 000A09D0  C8 01 00 10 */	lfd f0, 0x10(r1)
/* 800A4AB4 000A09D4  EC 00 18 28 */	fsubs f0, f0, f3
/* 800A4AB8 000A09D8  FC 00 00 1E */	fctiwz f0, f0
/* 800A4ABC 000A09DC  D8 01 00 18 */	stfd f0, 0x18(r1)
/* 800A4AC0 000A09E0  80 01 00 1C */	lwz r0, 0x1c(r1)
/* 800A4AC4 000A09E4  6C 00 80 00 */	xoris r0, r0, 0x8000
/* 800A4AC8 000A09E8  90 01 00 24 */	stw r0, 0x24(r1)
/* 800A4ACC 000A09EC  93 A1 00 20 */	stw r29, 0x20(r1)
/* 800A4AD0 000A09F0  C8 01 00 20 */	lfd f0, 0x20(r1)
/* 800A4AD4 000A09F4  FC 00 10 28 */	fsub f0, f0, f2
/* 800A4AD8 000A09F8  FC 00 08 28 */	fsub f0, f0, f1
/* 800A4ADC 000A09FC  FC 00 00 1E */	fctiwz f0, f0
/* 800A4AE0 000A0A00  D8 01 00 28 */	stfd f0, 0x28(r1)
/* 800A4AE4 000A0A04  80 01 00 2C */	lwz r0, 0x2c(r1)
/* 800A4AE8 000A0A08  7C 03 FE 70 */	srawi r3, r0, 0x1f
/* 800A4AEC 000A0A0C  7C 60 02 78 */	xor r0, r3, r0
/* 800A4AF0 000A0A10  7C 03 00 50 */	subf r0, r3, r0
/* 800A4AF4 000A0A14  6C 00 80 00 */	xoris r0, r0, 0x8000
/* 800A4AF8 000A0A18  90 01 00 34 */	stw r0, 0x34(r1)
/* 800A4AFC 000A0A1C  93 A1 00 30 */	stw r29, 0x30(r1)
/* 800A4B00 000A0A20  C8 01 00 30 */	lfd f0, 0x30(r1)
/* 800A4B04 000A0A24  EC 00 10 28 */	fsubs f0, f0, f2
/* 800A4B08 000A0A28  FC 00 08 24 */	fdiv f0, f0, f1
/* 800A4B0C 000A0A2C  FC 24 00 32 */	fmul f1, f4, f0
/* 800A4B10 000A0A30  48 05 EA 5D */	bl __cvt_fp2unsigned
/* 800A4B14 000A0A34  C0 22 B3 50 */	lfs f1, lbl_802F5B50-_SDA2_BASE_(r2)
/* 800A4B18 000A0A38  54 64 80 1E */	slwi r4, r3, 0x10
/* 800A4B1C 000A0A3C  54 60 40 2E */	slwi r0, r3, 8
/* 800A4B20 000A0A40  FC 40 08 90 */	fmr f2, f1
/* 800A4B24 000A0A44  7C 80 03 78 */	or r0, r4, r0
/* 800A4B28 000A0A48  7C 7C 03 78 */	or r28, r3, r0
/* 800A4B2C 000A0A4C  4B FC D0 01 */	bl func_80071B2C
/* 800A4B30 000A0A50  80 6D 9C D0 */	lwz r3, lbl_802F1EB0
/* 800A4B34 000A0A54  C8 42 B3 18 */	lfd f2, 4503601774854144.0  //-_SDA2_BASE_(r2)
/* 800A4B38 000A0A58  38 03 01 01 */	addi r0, r3, 0x101
/* 800A4B3C 000A0A5C  C0 22 B3 54 */	lfs f1, lbl_802F5B54-_SDA2_BASE_(r2)
/* 800A4B40 000A0A60  6C 00 80 00 */	xoris r0, r0, 0x8000
/* 800A4B44 000A0A64  90 01 00 3C */	stw r0, 0x3c(r1)
/* 800A4B48 000A0A68  93 A1 00 38 */	stw r29, 0x38(r1)
/* 800A4B4C 000A0A6C  C8 01 00 38 */	lfd f0, 0x38(r1)
/* 800A4B50 000A0A70  EC 40 10 28 */	fsubs f2, f0, f2
/* 800A4B54 000A0A74  4B FC D0 0D */	bl func_80071B60
/* 800A4B58 000A0A78  88 0D 9F D1 */	lbz r0, lbl_802F21B1
/* 800A4B5C 000A0A7C  28 00 00 00 */	cmplwi r0, 0
/* 800A4B60 000A0A80  40 82 00 18 */	bne lbl_800A4B78
/* 800A4B64 000A0A84  38 60 00 00 */	li r3, 0
/* 800A4B68 000A0A88  4B FC CF 7D */	bl func_80071AE4
/* 800A4B6C 000A0A8C  38 60 00 00 */	li r3, 0
/* 800A4B70 000A0A90  4B FC CF 89 */	bl func_80071AF8
/* 800A4B74 000A0A94  48 00 00 14 */	b lbl_800A4B88
lbl_800A4B78:
/* 800A4B78 000A0A98  38 60 00 00 */	li r3, 0
/* 800A4B7C 000A0A9C  4B FC CF 69 */	bl func_80071AE4
/* 800A4B80 000A0AA0  7F 83 E3 78 */	mr r3, r28
/* 800A4B84 000A0AA4  4B FC CF 75 */	bl func_80071AF8
lbl_800A4B88:
/* 800A4B88 000A0AA8  38 6D 94 C0 */	la r3, lbl_802F16A0(r13)
/* 800A4B8C 000A0AAC  4B FC D2 CD */	bl func_80071E58
/* 800A4B90 000A0AB0  88 0D 9F D1 */	lbz r0, lbl_802F21B1
/* 800A4B94 000A0AB4  28 00 00 00 */	cmplwi r0, 0
/* 800A4B98 000A0AB8  40 82 00 18 */	bne lbl_800A4BB0
/* 800A4B9C 000A0ABC  38 60 00 00 */	li r3, 0
/* 800A4BA0 000A0AC0  4B FC CF 45 */	bl func_80071AE4
/* 800A4BA4 000A0AC4  7F 83 E3 78 */	mr r3, r28
/* 800A4BA8 000A0AC8  4B FC CF 51 */	bl func_80071AF8
/* 800A4BAC 000A0ACC  48 00 00 14 */	b lbl_800A4BC0
lbl_800A4BB0:
/* 800A4BB0 000A0AD0  38 60 00 00 */	li r3, 0
/* 800A4BB4 000A0AD4  4B FC CF 31 */	bl func_80071AE4
/* 800A4BB8 000A0AD8  38 60 00 00 */	li r3, 0
/* 800A4BBC 000A0ADC  4B FC CF 3D */	bl func_80071AF8
lbl_800A4BC0:
/* 800A4BC0 000A0AE0  38 6D 94 C8 */	la r3, lbl_802F16A8(r13)
/* 800A4BC4 000A0AE4  4B FC D2 95 */	bl func_80071E58
/* 800A4BC8 000A0AE8  80 6D 9C D0 */	lwz r3, lbl_802F1EB0
/* 800A4BCC 000A0AEC  3C 00 43 30 */	lis r0, 0x4330
/* 800A4BD0 000A0AF0  C8 42 B3 18 */	lfd f2, 4503601774854144.0  //-_SDA2_BASE_(r2)
/* 800A4BD4 000A0AF4  38 63 00 FF */	addi r3, r3, 0xff
/* 800A4BD8 000A0AF8  C0 22 B3 24 */	lfs f1, lbl_802F5B24-_SDA2_BASE_(r2)
/* 800A4BDC 000A0AFC  6C 63 80 00 */	xoris r3, r3, 0x8000
/* 800A4BE0 000A0B00  90 61 00 14 */	stw r3, 0x14(r1)
/* 800A4BE4 000A0B04  90 01 00 10 */	stw r0, 0x10(r1)
/* 800A4BE8 000A0B08  C8 01 00 10 */	lfd f0, 0x10(r1)
/* 800A4BEC 000A0B0C  EC 40 10 28 */	fsubs f2, f0, f2
/* 800A4BF0 000A0B10  4B FC CF 71 */	bl func_80071B60
/* 800A4BF4 000A0B14  88 0D 9F D1 */	lbz r0, lbl_802F21B1
/* 800A4BF8 000A0B18  28 00 00 00 */	cmplwi r0, 0
/* 800A4BFC 000A0B1C  40 82 00 1C */	bne lbl_800A4C18
/* 800A4C00 000A0B20  3C 60 00 7F */	lis r3, 0x007F7F7F@ha
/* 800A4C04 000A0B24  38 63 7F 7F */	addi r3, r3, 0x007F7F7F@l
/* 800A4C08 000A0B28  4B FC CE DD */	bl func_80071AE4
/* 800A4C0C 000A0B2C  38 60 00 00 */	li r3, 0
/* 800A4C10 000A0B30  4B FC CE E9 */	bl func_80071AF8
/* 800A4C14 000A0B34  48 00 00 18 */	b lbl_800A4C2C
lbl_800A4C18:
/* 800A4C18 000A0B38  3C 60 01 00 */	lis r3, 0x00FFFFFF@ha
/* 800A4C1C 000A0B3C  38 63 FF FF */	addi r3, r3, 0x00FFFFFF@l
/* 800A4C20 000A0B40  4B FC CE C5 */	bl func_80071AE4
/* 800A4C24 000A0B44  7F 83 E3 78 */	mr r3, r28
/* 800A4C28 000A0B48  4B FC CE D1 */	bl func_80071AF8
lbl_800A4C2C:
/* 800A4C2C 000A0B4C  38 6D 94 C0 */	la r3, lbl_802F16A0(r13)
/* 800A4C30 000A0B50  4B FC D2 29 */	bl func_80071E58
/* 800A4C34 000A0B54  88 0D 9F D1 */	lbz r0, lbl_802F21B1
/* 800A4C38 000A0B58  28 00 00 00 */	cmplwi r0, 0
/* 800A4C3C 000A0B5C  40 82 00 1C */	bne lbl_800A4C58
/* 800A4C40 000A0B60  3C 60 01 00 */	lis r3, 0x00FFFFFF@ha
/* 800A4C44 000A0B64  38 63 FF FF */	addi r3, r3, 0x00FFFFFF@l
/* 800A4C48 000A0B68  4B FC CE 9D */	bl func_80071AE4
/* 800A4C4C 000A0B6C  7F 83 E3 78 */	mr r3, r28
/* 800A4C50 000A0B70  4B FC CE A9 */	bl func_80071AF8
/* 800A4C54 000A0B74  48 00 00 18 */	b lbl_800A4C6C
lbl_800A4C58:
/* 800A4C58 000A0B78  3C 60 00 7F */	lis r3, 0x007F7F7F@ha
/* 800A4C5C 000A0B7C  38 63 7F 7F */	addi r3, r3, 0x007F7F7F@l
/* 800A4C60 000A0B80  4B FC CE 85 */	bl func_80071AE4
/* 800A4C64 000A0B84  38 60 00 00 */	li r3, 0
/* 800A4C68 000A0B88  4B FC CE 91 */	bl func_80071AF8
lbl_800A4C6C:
/* 800A4C6C 000A0B8C  38 6D 94 C8 */	la r3, lbl_802F16A8(r13)
/* 800A4C70 000A0B90  4B FC D1 E9 */	bl func_80071E58
lbl_800A4C74:
/* 800A4C74 000A0B94  80 7F 00 00 */	lwz r3, 0(r31)
/* 800A4C78 000A0B98  54 60 04 21 */	rlwinm. r0, r3, 0, 0x10, 0x10
/* 800A4C7C 000A0B9C  41 82 00 30 */	beq lbl_800A4CAC
/* 800A4C80 000A0BA0  54 60 04 E7 */	rlwinm. r0, r3, 0, 0x13, 0x13
/* 800A4C84 000A0BA4  41 82 00 18 */	beq lbl_800A4C9C
/* 800A4C88 000A0BA8  C0 22 B3 20 */	lfs f1, lbl_802F5B20-_SDA2_BASE_(r2)
/* 800A4C8C 000A0BAC  38 6D 94 2C */	la r3, msgSavingReplay(r13)
/* 800A4C90 000A0BB0  C0 42 B3 24 */	lfs f2, lbl_802F5B24-_SDA2_BASE_(r2)
/* 800A4C94 000A0BB4  4B FF F7 4D */	bl draw_memcard_msg
/* 800A4C98 000A0BB8  48 00 00 14 */	b lbl_800A4CAC
lbl_800A4C9C:
/* 800A4C9C 000A0BBC  C0 22 B3 20 */	lfs f1, lbl_802F5B20-_SDA2_BASE_(r2)
/* 800A4CA0 000A0BC0  38 6D 94 34 */	la r3, msgSavingGame(r13)
/* 800A4CA4 000A0BC4  C0 42 B3 24 */	lfs f2, lbl_802F5B24-_SDA2_BASE_(r2)
/* 800A4CA8 000A0BC8  4B FF F7 39 */	bl draw_memcard_msg
lbl_800A4CAC:
/* 800A4CAC 000A0BCC  80 1F 00 00 */	lwz r0, 0(r31)
/* 800A4CB0 000A0BD0  54 00 03 9D */	rlwinm. r0, r0, 0, 0xe, 0xe
/* 800A4CB4 000A0BD4  41 82 00 14 */	beq lbl_800A4CC8
/* 800A4CB8 000A0BD8  C0 22 B3 20 */	lfs f1, lbl_802F5B20-_SDA2_BASE_(r2)
/* 800A4CBC 000A0BDC  38 6D 94 3C */	la r3, msgLoadingGame(r13)
/* 800A4CC0 000A0BE0  C0 42 B3 24 */	lfs f2, lbl_802F5B24-_SDA2_BASE_(r2)
/* 800A4CC4 000A0BE4  4B FF F7 1D */	bl draw_memcard_msg
lbl_800A4CC8:
/* 800A4CC8 000A0BE8  4B FC CD C5 */	bl func_80071A8C
lbl_800A4CCC:
/* 800A4CCC 000A0BEC  80 01 00 54 */	lwz r0, 0x54(r1)
/* 800A4CD0 000A0BF0  83 E1 00 4C */	lwz r31, 0x4c(r1)
/* 800A4CD4 000A0BF4  83 C1 00 48 */	lwz r30, 0x48(r1)
/* 800A4CD8 000A0BF8  7C 08 03 A6 */	mtlr r0
/* 800A4CDC 000A0BFC  83 A1 00 44 */	lwz r29, 0x44(r1)
/* 800A4CE0 000A0C00  83 81 00 40 */	lwz r28, 0x40(r1)
/* 800A4CE4 000A0C04  38 21 00 50 */	addi r1, r1, 0x50
/* 800A4CE8 000A0C08  4E 80 00 20 */	blr
