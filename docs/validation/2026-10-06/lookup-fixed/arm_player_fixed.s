	.syntax	unified
	.eabi_attribute	67, "2.09"	@ Tag_conformance
	.cpu	cortex-m0
	.eabi_attribute	6, 12	@ Tag_CPU_arch
	.eabi_attribute	7, 77	@ Tag_CPU_arch_profile
	.eabi_attribute	8, 0	@ Tag_ARM_ISA_use
	.eabi_attribute	9, 1	@ Tag_THUMB_ISA_use
	.eabi_attribute	34, 0	@ Tag_CPU_unaligned_access
	.eabi_attribute	17, 1	@ Tag_ABI_PCS_GOT_use
	.eabi_attribute	20, 1	@ Tag_ABI_FP_denormal
	.eabi_attribute	21, 0	@ Tag_ABI_FP_exceptions
	.eabi_attribute	23, 3	@ Tag_ABI_FP_number_model
	.eabi_attribute	24, 1	@ Tag_ABI_align_needed
	.eabi_attribute	25, 1	@ Tag_ABI_align_preserved
	.eabi_attribute	38, 1	@ Tag_ABI_FP_16bit_format
	.eabi_attribute	18, 4	@ Tag_ABI_PCS_wchar_t
	.eabi_attribute	26, 2	@ Tag_ABI_enum_size
	.eabi_attribute	14, 0	@ Tag_ABI_PCS_R9_use
	.file	"player_fixed.c"
	.text
	.globl	fixed_beat_deadline             @ -- Begin function fixed_beat_deadline
	.p2align	2
	.type	fixed_beat_deadline,%function
	.code	16
	.thumb_func
fixed_beat_deadline:                    @ @fixed_beat_deadline
	.fnstart
@ %bb.0:
	.save	{r4, r5, r6, r7, lr}
	push	{r4, r5, r6, r7, lr}
	.pad	#4
	sub	sp, #4
	asrs	r1, r0, #31
	ldr	r2, .LCPI0_0
	movs	r4, #0
	mov	r3, r4
	bl	__aeabi_lmul
	mov	r6, r1
	ldr	r1, .LCPI0_1
	adds	r7, r0, r1
	adcs	r6, r4
	ldr	r2, .LCPI0_2
	mov	r0, r7
	mov	r1, r6
	mov	r3, r4
	bl	__aeabi_ldivmod
	mov	r5, r0
	ldr	r2, .LCPI0_2
	mov	r3, r4
	bl	__aeabi_lmul
	mov	r2, r1
	subs	r1, r7, r0
	sbcs	r6, r2
	asrs	r0, r6, #31
	adds	r5, r0, r5
	ldr	r2, .LCPI0_2
	cmp	r6, #0
	bpl	.LBB0_2
@ %bb.1:
	adds	r1, r1, r2
.LBB0_2:
	mov	r0, r4
	mov	r3, r4
	bl	__aeabi_uldivmod
	adds	r1, r1, r5
	add	sp, #4
	pop	{r4, r5, r6, r7, pc}
	.p2align	2
@ %bb.3:
.LCPI0_0:
	.long	1875                            @ 0x753
.LCPI0_1:
	.long	243892                          @ 0x3b8b4
.LCPI0_2:
	.long	44750                           @ 0xaece
.Lfunc_end0:
	.size	fixed_beat_deadline, .Lfunc_end0-fixed_beat_deadline
	.cantunwind
	.fnend
                                        @ -- End function
	.globl	fixed_time_ratio                @ -- Begin function fixed_time_ratio
	.p2align	2
	.type	fixed_time_ratio,%function
	.code	16
	.thumb_func
fixed_time_ratio:                       @ @fixed_time_ratio
	.fnstart
@ %bb.0:
	.save	{r4, r5, r6, r7, lr}
	push	{r4, r5, r6, r7, lr}
	.pad	#4
	sub	sp, #4
	mov	r4, r2
	mov	r5, r0
	cmp	r2, #0
	bne	.LBB1_2
@ %bb.1:
	ldr	r0, .LCPI1_0
	mov	r6, r1
	bl	credits_fail
	mov	r1, r6
.LBB1_2:
	movs	r3, #0
	mov	r0, r5
	mov	r2, r4
	bl	__aeabi_uldivmod
	mov	r6, r0
	lsrs	r0, r0, #31
	orrs	r0, r1
	beq	.LBB1_4
@ %bb.3:
	ldr	r0, .LCPI1_1
	mov	r7, r1
	bl	credits_fail
	mov	r1, r7
.LBB1_4:
	movs	r7, #0
	mov	r0, r6
	mov	r2, r4
	mov	r3, r7
	bl	__aeabi_lmul
	subs	r1, r5, r0
	mov	r0, r7
	mov	r2, r4
	mov	r3, r7
	bl	__aeabi_uldivmod
	adds	r1, r1, r6
	add	sp, #4
	pop	{r4, r5, r6, r7, pc}
	.p2align	2
@ %bb.5:
.LCPI1_0:
	.long	.L.str
.LCPI1_1:
	.long	.L.str.1
.Lfunc_end1:
	.size	fixed_time_ratio, .Lfunc_end1-fixed_time_ratio
	.cantunwind
	.fnend
                                        @ -- End function
	.globl	fixed_player_init               @ -- Begin function fixed_player_init
	.p2align	2
	.type	fixed_player_init,%function
	.code	16
	.thumb_func
fixed_player_init:                      @ @fixed_player_init
	.fnstart
@ %bb.0:
	.save	{r4, r5, r6, r7, lr}
	push	{r4, r5, r6, r7, lr}
	.pad	#20
	sub	sp, #20
	mov	r5, r2
	mov	r4, r0
	ldr	r7, [sp, #44]
	ldr	r6, [sp, #40]
	cmp	r7, #0
	str	r1, [sp, #16]                   @ 4-byte Spill
	bpl	.LBB2_2
@ %bb.1:
	ldr	r0, .LCPI2_0
	bl	credits_fail
	ldr	r1, [sp, #16]                   @ 4-byte Reload
.LBB2_2:
	mov	r0, r1
	mov	r1, r5
	bl	credits_jump
	mov	r1, r5
	movs	r5, #0
	str	r5, [r4, #44]
	str	r5, [r4, #40]
	str	r6, [r4, #16]
	str	r7, [r4, #20]
	str	r6, [r4, #24]
	str	r7, [r4, #28]
	str	r5, [r4, #68]
	movs	r0, #1
	str	r0, [r4, #64]
	str	r5, [r4, #60]
	str	r5, [r4, #56]
	str	r5, [r4, #52]
	ldr	r0, [sp, #16]                   @ 4-byte Reload
	stm	r4!, {r0, r5}
	lsls	r0, r1, #2
	mov	r6, r1
	ldr	r1, .LCPI2_1
	adds	r0, r1, r0
	subs	r0, r0, #4
	ldr	r1, [r0]
	mov	r3, r1
	subs	r3, #60
	str	r3, [r4, #40]
	ldr	r2, .LCPI2_2
	ldr	r7, .LCPI2_4
	subs	r4, #8
	cmp	r6, #1
	mov	r0, r5
	mov	r6, r5
	beq	.LBB2_6
@ %bb.3:
	str	r3, [sp, #16]                   @ 4-byte Spill
	adds	r0, r1, #1
	asrs	r1, r0, #31
	movs	r3, #0
	str	r3, [sp, #4]                    @ 4-byte Spill
	bl	__aeabi_lmul
	mov	r6, r1
	adds	r0, r0, r7
	str	r0, [sp, #12]                   @ 4-byte Spill
	ldr	r7, [sp, #4]                    @ 4-byte Reload
	adcs	r6, r7
	ldr	r2, .LCPI2_3
	mov	r1, r6
	mov	r3, r7
	bl	__aeabi_ldivmod
	str	r0, [sp, #8]                    @ 4-byte Spill
	ldr	r2, .LCPI2_3
	mov	r3, r7
	bl	__aeabi_lmul
	mov	r2, r1
	ldr	r1, [sp, #12]                   @ 4-byte Reload
	subs	r1, r1, r0
	sbcs	r6, r2
	asrs	r0, r6, #31
	ldr	r2, [sp, #8]                    @ 4-byte Reload
	adds	r0, r0, r2
	str	r0, [sp, #12]                   @ 4-byte Spill
	cmp	r6, #0
	bpl	.LBB2_5
@ %bb.4:
	ldr	r0, .LCPI2_3
	adds	r1, r1, r0
.LBB2_5:
	mov	r0, r7
	ldr	r2, .LCPI2_3
	mov	r3, r7
	bl	__aeabi_uldivmod
	ldr	r2, [sp, #12]                   @ 4-byte Reload
	adds	r6, r1, r2
	ldr	r7, .LCPI2_4
	ldr	r3, [sp, #16]                   @ 4-byte Reload
	ldr	r2, .LCPI2_2
.LBB2_6:
	str	r0, [r4, #8]
	str	r6, [r4, #12]
	asrs	r1, r3, #31
	mov	r0, r3
	mov	r3, r5
	bl	__aeabi_lmul
	mov	r6, r1
	adds	r7, r0, r7
	adcs	r6, r5
	ldr	r2, .LCPI2_3
	mov	r0, r7
	mov	r1, r6
	mov	r3, r5
	bl	__aeabi_ldivmod
	str	r0, [sp, #16]                   @ 4-byte Spill
	ldr	r2, .LCPI2_3
	mov	r3, r5
	bl	__aeabi_lmul
	mov	r2, r1
	subs	r1, r7, r0
	ldr	r7, .LCPI2_3
	sbcs	r6, r2
	bpl	.LBB2_8
@ %bb.7:
	adds	r1, r1, r7
.LBB2_8:
	mov	r0, r5
	ldr	r2, .LCPI2_3
	mov	r3, r5
	bl	__aeabi_uldivmod
	asrs	r2, r6, #31
	ldr	r3, [sp, #16]                   @ 4-byte Reload
	adds	r2, r2, r3
	adds	r2, r1, r2
	str	r0, [r4, #32]
	str	r2, [r4, #36]
	mov	r2, r7
	mov	r3, r5
	bl	__aeabi_lmul
	rsbs	r0, r0, #0
	str	r0, [r4, #40]
	add	sp, #20
	pop	{r4, r5, r6, r7, pc}
	.p2align	2
@ %bb.9:
.LCPI2_0:
	.long	.L.str.2
.LCPI2_1:
	.long	fixed_player_init.amounts
.LCPI2_2:
	.long	1875                            @ 0x753
.LCPI2_3:
	.long	44750                           @ 0xaece
.LCPI2_4:
	.long	243892                          @ 0x3b8b4
.Lfunc_end2:
	.size	fixed_player_init, .Lfunc_end2-fixed_player_init
	.cantunwind
	.fnend
                                        @ -- End function
	.globl	fixed_player_step               @ -- Begin function fixed_player_step
	.p2align	1
	.type	fixed_player_step,%function
	.code	16
	.thumb_func
fixed_player_step:                      @ @fixed_player_step
	.fnstart
@ %bb.0:
	.save	{r7, lr}
	push	{r7, lr}
	.pad	#16
	sub	sp, #16
	movs	r1, #1
	str	r1, [sp, #8]
	ldr	r1, [sp, #28]
	str	r1, [sp, #4]
	ldr	r1, [sp, #24]
	str	r1, [sp]
	bl	step
	add	sp, #16
	pop	{r7, pc}
.Lfunc_end3:
	.size	fixed_player_step, .Lfunc_end3-fixed_player_step
	.cantunwind
	.fnend
                                        @ -- End function
	.p2align	2                               @ -- Begin function step
	.type	step,%function
	.code	16
	.thumb_func
step:                                   @ @step
	.fnstart
@ %bb.0:
	.save	{r4, r5, r6, r7, lr}
	push	{r4, r5, r6, r7, lr}
	.pad	#36
	sub	sp, #36
	mov	r7, r3
	mov	r5, r2
	mov	r4, r0
	cmp	r3, #0
	bmi	.LBB4_2
@ %bb.1:
	ldr	r0, [r4, #16]
	ldr	r1, [r4, #20]
	subs	r0, r5, r0
	mov	r0, r7
	sbcs	r0, r1
	bge	.LBB4_3
.LBB4_2:
	ldr	r0, .LCPI4_0
	bl	credits_fail
.LBB4_3:
	ldr	r0, [r4, #64]
	cmp	r0, #0
	beq	.LBB4_24
@ %bb.4:
	mov	r2, r7
	ldr	r0, [sp, #64]
	ldr	r6, [sp, #60]
	cmp	r0, #0
	str	r5, [sp, #32]                   @ 4-byte Spill
	beq	.LBB4_6
@ %bb.5:
	ldr	r0, [r4, #52]
	cmp	r0, #0
	beq	.LBB4_26
.LBB4_6:
	str	r5, [r4, #16]
	str	r2, [r4, #20]
	cmp	r6, #0
	beq	.LBB4_32
.LBB4_7:
	str	r2, [sp, #28]                   @ 4-byte Spill
	ldr	r1, [r4, #8]
	ldr	r2, [r4, #12]
	ldr	r3, [r4, #32]
	ldr	r5, [r4, #36]
	movs	r6, #1
	movs	r0, #0
	subs	r1, r3, r1
	sbcs	r5, r2
	blt	.LBB4_9
@ %bb.8:
	mov	r6, r0
.LBB4_9:
	ldr	r3, [sp, #32]                   @ 4-byte Reload
	bge	.LBB4_17
@ %bb.10:
	ldr	r0, [r4]
	movs	r1, #1
	bl	credits_next
	ldr	r0, [r4, #48]
	ldr	r1, .LCPI4_1
	cmp	r0, r1
	bne	.LBB4_12
@ %bb.11:
	ldr	r0, .LCPI4_3
	bl	credits_fail
	ldr	r0, [r4, #48]
.LBB4_12:
	adds	r0, r0, #1
	str	r0, [r4, #48]
	ldr	r0, [r4, #40]
	ldr	r1, .LCPI4_4
	adds	r2, r0, r1
	ldr	r1, .LCPI4_5
	adds	r3, r0, r1
	ldr	r1, .LCPI4_6
	adds	r0, r1, #1
	ldr	r5, .LCPI4_7
	cmp	r3, r5
	bhi	.LBB4_14
@ %bb.13:
	mov	r2, r3
.LBB4_14:
	str	r2, [r4, #40]
	ldr	r3, [sp, #32]                   @ 4-byte Reload
	bhi	.LBB4_16
@ %bb.15:
	mov	r0, r1
.LBB4_16:
	ldr	r1, [r4, #32]
	movs	r2, #0
	adds	r0, r0, r1
	str	r0, [r4, #32]
	ldr	r0, [r4, #36]
	adcs	r0, r2
	str	r0, [r4, #36]
.LBB4_17:
	ldr	r0, [r4, #24]
	ldr	r1, [r4, #28]
	subs	r2, r3, r0
	sbcs	r7, r1
	movs	r0, #0
	ldr	r1, .LCPI4_8
	subs	r1, r2, r1
	sbcs	r7, r0
	blt	.LBB4_25
@ %bb.18:
	ldr	r7, [sp, #56]
	lsls	r1, r7, #31
	beq	.LBB4_36
@ %bb.19:
	ldr	r0, [r4, #56]
	cmp	r0, #0
	beq	.LBB4_35
@ %bb.20:
	lsls	r0, r7, #30
	bmi	.LBB4_37
.LBB4_21:
	lsls	r0, r7, #29
	bpl	.LBB4_22
	b	.LBB4_45
.LBB4_22:
	lsls	r0, r7, #28
	bpl	.LBB4_23
	b	.LBB4_53
.LBB4_23:
	b	.LBB4_61
.LBB4_24:
	movs	r6, #0
.LBB4_25:
	mov	r0, r6
	add	sp, #36
	pop	{r4, r5, r6, r7, pc}
.LBB4_26:
	ldr	r3, [r4, #8]
	ldr	r0, [r4, #12]
	str	r0, [sp, #24]                   @ 4-byte Spill
	ldr	r0, [r4, #16]
	ldr	r1, [r4, #20]
	str	r1, [sp, #28]                   @ 4-byte Spill
	subs	r1, r5, r0
	mov	r5, r7
	ldr	r0, [sp, #28]                   @ 4-byte Reload
	sbcs	r5, r0
	ldr	r0, .LCPI4_1
	subs	r0, r0, r5
	str	r1, [sp, #16]                   @ 4-byte Spill
	mvns	r1, r1
	str	r3, [sp, #20]                   @ 4-byte Spill
	subs	r1, r1, r3
	ldr	r1, [sp, #24]                   @ 4-byte Reload
	mov	r3, r1
	sbcs	r0, r1
	blt	.LBB4_28
@ %bb.27:
	movs	r0, #0
	b	.LBB4_29
.LBB4_28:
	movs	r0, #1
.LBB4_29:
	mov	r1, r5
	orrs	r1, r3
	lsrs	r1, r1, #31
	orrs	r1, r0
	cmp	r1, #1
	bne	.LBB4_31
@ %bb.30:
	ldr	r0, .LCPI4_2
	str	r2, [sp, #28]                   @ 4-byte Spill
	bl	credits_fail
	ldr	r3, [sp, #24]                   @ 4-byte Reload
	ldr	r2, [sp, #28]                   @ 4-byte Reload
.LBB4_31:
	ldr	r0, [sp, #20]                   @ 4-byte Reload
	ldr	r1, [sp, #16]                   @ 4-byte Reload
	adds	r0, r1, r0
	adcs	r5, r3
	str	r0, [r4, #8]
	str	r5, [r4, #12]
	ldr	r5, [sp, #32]                   @ 4-byte Reload
	str	r5, [r4, #16]
	str	r2, [r4, #20]
	cmp	r6, #0
	bne	.LBB4_7
.LBB4_32:
	movs	r6, #0
	str	r6, [r4, #64]
.LBB4_33:                               @ =>This Inner Loop Header: Depth=1
	movs	r0, #32
	movs	r1, #39
	movs	r5, #49
	movs	r3, #0
	mov	r2, r5
	bl	cell_pack
	ldr	r1, [r4]
	adds	r2, r1, r6
	str	r0, [r2, #12]
	adds	r6, r6, #4
	movs	r0, #75
	lsls	r0, r0, #6
	cmp	r6, r0
	bne	.LBB4_33
@ %bb.34:
	ldr	r0, .LCPI4_9
	str	r5, [r1, r0]
	movs	r6, #2
	mov	r0, r6
	add	sp, #36
	pop	{r4, r5, r6, r7, pc}
.LBB4_35:
	ldr	r0, [r4, #52]
	rsbs	r1, r0, #0
	adcs	r1, r0
	str	r1, [r4, #52]
	movs	r0, #1
.LBB4_36:
	str	r0, [r4, #56]
	lsls	r0, r7, #30
	bpl	.LBB4_21
.LBB4_37:
	ldr	r0, [r4, #60]
	cmp	r0, #0
	beq	.LBB4_40
@ %bb.38:
	movs	r0, #179
	lsls	r2, r0, #1
	ldr	r0, [r4, #44]
	movs	r1, #45
	movs	r3, #0
	str	r0, [sp, #24]                   @ 4-byte Spill
	str	r2, [sp, #20]                   @ 4-byte Spill
	str	r3, [sp, #4]                    @ 4-byte Spill
	bl	__aeabi_uldivmod
	mov	r2, r0
	ldr	r0, .LCPI4_1
	eors	r0, r1
	mvns	r3, r2
	str	r3, [sp, #8]                    @ 4-byte Spill
	ldr	r5, [r4, #8]
	ldr	r3, [r4, #12]
	str	r3, [sp, #12]                   @ 4-byte Spill
	str	r5, [sp, #16]                   @ 4-byte Spill
	ldr	r3, [sp, #8]                    @ 4-byte Reload
	subs	r3, r3, r5
	ldr	r5, [sp, #12]                   @ 4-byte Reload
	sbcs	r0, r5
	blt	.LBB4_41
@ %bb.39:
	ldr	r3, [sp, #4]                    @ 4-byte Reload
	b	.LBB4_42
.LBB4_40:
	movs	r0, #1
	str	r0, [r4, #60]
	lsls	r0, r7, #29
	bpl	.LBB4_22
	b	.LBB4_45
.LBB4_41:
	movs	r3, #1
.LBB4_42:
	lsrs	r0, r5, #31
	orrs	r0, r3
	cmp	r0, #1
	bne	.LBB4_44
@ %bb.43:
	ldr	r0, .LCPI4_2
	str	r2, [sp, #8]                    @ 4-byte Spill
	str	r1, [sp, #4]                    @ 4-byte Spill
	bl	credits_fail
	ldr	r1, [sp, #4]                    @ 4-byte Reload
	ldr	r2, [sp, #8]                    @ 4-byte Reload
.LBB4_44:
	ldr	r0, [sp, #16]                   @ 4-byte Reload
	adds	r0, r2, r0
	mov	r3, r1
	adcs	r3, r5
	str	r0, [r4, #8]
	str	r3, [r4, #12]
	movs	r3, #0
	mov	r0, r2
	ldr	r2, [sp, #20]                   @ 4-byte Reload
	bl	__aeabi_lmul
	ldr	r1, [sp, #24]                   @ 4-byte Reload
	subs	r0, r1, r0
	str	r0, [r4, #44]
	ldr	r3, [sp, #32]                   @ 4-byte Reload
	lsls	r0, r7, #29
	bmi	.LBB4_45
	b	.LBB4_22
.LBB4_45:
	ldr	r0, [r4, #60]
	cmp	r0, #0
	beq	.LBB4_48
@ %bb.46:
	movs	r0, #179
	lsls	r2, r0, #1
	ldr	r0, [r4, #44]
	movs	r1, #105
	movs	r3, #0
	str	r0, [sp, #24]                   @ 4-byte Spill
	str	r2, [sp, #20]                   @ 4-byte Spill
	str	r3, [sp, #4]                    @ 4-byte Spill
	bl	__aeabi_uldivmod
	mov	r2, r0
	ldr	r0, .LCPI4_1
	eors	r0, r1
	mvns	r3, r2
	str	r3, [sp, #8]                    @ 4-byte Spill
	ldr	r5, [r4, #8]
	ldr	r3, [r4, #12]
	str	r3, [sp, #12]                   @ 4-byte Spill
	str	r5, [sp, #16]                   @ 4-byte Spill
	ldr	r3, [sp, #8]                    @ 4-byte Reload
	subs	r3, r3, r5
	ldr	r5, [sp, #12]                   @ 4-byte Reload
	sbcs	r0, r5
	blt	.LBB4_49
@ %bb.47:
	ldr	r3, [sp, #4]                    @ 4-byte Reload
	b	.LBB4_50
.LBB4_48:
	movs	r0, #1
	str	r0, [r4, #60]
	lsls	r0, r7, #28
	bmi	.LBB4_53
	b	.LBB4_61
.LBB4_49:
	movs	r3, #1
.LBB4_50:
	lsrs	r0, r5, #31
	orrs	r0, r3
	cmp	r0, #1
	bne	.LBB4_52
@ %bb.51:
	ldr	r0, .LCPI4_2
	str	r2, [sp, #8]                    @ 4-byte Spill
	str	r1, [sp, #4]                    @ 4-byte Spill
	bl	credits_fail
	ldr	r1, [sp, #4]                    @ 4-byte Reload
	ldr	r2, [sp, #8]                    @ 4-byte Reload
.LBB4_52:
	ldr	r0, [sp, #16]                   @ 4-byte Reload
	adds	r0, r2, r0
	mov	r3, r1
	adcs	r3, r5
	str	r0, [r4, #8]
	str	r3, [r4, #12]
	movs	r3, #0
	mov	r0, r2
	ldr	r2, [sp, #20]                   @ 4-byte Reload
	bl	__aeabi_lmul
	ldr	r1, [sp, #24]                   @ 4-byte Reload
	subs	r0, r1, r0
	str	r0, [r4, #44]
	ldr	r3, [sp, #32]                   @ 4-byte Reload
	lsls	r0, r7, #28
	bpl	.LBB4_61
.LBB4_53:
	ldr	r0, [r4, #60]
	cmp	r0, #0
	beq	.LBB4_56
@ %bb.54:
	movs	r0, #179
	lsls	r2, r0, #1
	ldr	r0, [r4, #44]
	movs	r1, #225
	movs	r3, #0
	str	r0, [sp, #24]                   @ 4-byte Spill
	str	r2, [sp, #20]                   @ 4-byte Spill
	str	r3, [sp, #12]                   @ 4-byte Spill
	bl	__aeabi_uldivmod
	mov	r2, r0
	ldr	r0, .LCPI4_1
	eors	r0, r1
	mvns	r3, r2
	ldr	r7, [r4, #8]
	ldr	r5, [r4, #12]
	str	r7, [sp, #16]                   @ 4-byte Spill
	subs	r3, r3, r7
	sbcs	r0, r5
	blt	.LBB4_57
@ %bb.55:
	ldr	r3, [sp, #12]                   @ 4-byte Reload
	b	.LBB4_58
.LBB4_56:
	movs	r0, #1
	str	r0, [r4, #60]
	b	.LBB4_61
.LBB4_57:
	movs	r3, #1
.LBB4_58:
	lsrs	r0, r5, #31
	orrs	r0, r3
	cmp	r0, #1
	bne	.LBB4_60
@ %bb.59:
	ldr	r0, .LCPI4_2
	str	r2, [sp, #12]                   @ 4-byte Spill
	mov	r7, r1
	bl	credits_fail
	mov	r1, r7
	ldr	r2, [sp, #12]                   @ 4-byte Reload
.LBB4_60:
	ldr	r0, [sp, #16]                   @ 4-byte Reload
	adds	r0, r2, r0
	mov	r3, r1
	adcs	r3, r5
	str	r0, [r4, #8]
	str	r3, [r4, #12]
	movs	r3, #0
	mov	r0, r2
	ldr	r2, [sp, #20]                   @ 4-byte Reload
	bl	__aeabi_lmul
	ldr	r1, [sp, #24]                   @ 4-byte Reload
	subs	r0, r1, r0
	str	r0, [r4, #44]
	ldr	r3, [sp, #32]                   @ 4-byte Reload
.LBB4_61:
	str	r3, [r4, #24]
	ldr	r0, [sp, #28]                   @ 4-byte Reload
	str	r0, [r4, #28]
	mov	r0, r6
	add	sp, #36
	pop	{r4, r5, r6, r7, pc}
	.p2align	2
@ %bb.62:
.LCPI4_0:
	.long	.L.str.4
.LCPI4_1:
	.long	2147483647                      @ 0x7fffffff
.LCPI4_2:
	.long	.L.str.5
.LCPI4_3:
	.long	.L.str.6
.LCPI4_4:
	.long	4294935046                      @ 0xffff8206
.LCPI4_5:
	.long	12500                           @ 0x30d4
.LCPI4_6:
	.long	179956730                       @ 0xab9ebfa
.LCPI4_7:
	.long	44749                           @ 0xaecd
.LCPI4_8:
	.long	143165577                       @ 0x8888889
.LCPI4_9:
	.long	4820                            @ 0x12d4
.Lfunc_end4:
	.size	step, .Lfunc_end4-step
	.cantunwind
	.fnend
                                        @ -- End function
	.globl	fixed_player_sync               @ -- Begin function fixed_player_sync
	.p2align	2
	.type	fixed_player_sync,%function
	.code	16
	.thumb_func
fixed_player_sync:                      @ @fixed_player_sync
	.fnstart
@ %bb.0:
	.save	{r4, r5, r6, r7, lr}
	push	{r4, r5, r6, r7, lr}
	.pad	#28
	sub	sp, #28
	mov	r4, r0
	ldr	r5, [sp, #52]
	ldr	r7, [sp, #48]
	ldr	r1, [sp, #60]
	ldr	r6, [sp, #56]
	cmp	r5, #0
	bpl	.LBB5_2
@ %bb.1:
	ldr	r0, .LCPI5_0
	str	r3, [sp, #24]                   @ 4-byte Spill
	str	r2, [sp, #20]                   @ 4-byte Spill
	str	r1, [sp, #16]                   @ 4-byte Spill
	bl	credits_fail
	add	r3, sp, #16
	ldm	r3, {r1, r2, r3}                @ 12-byte Folded Reload
.LBB5_2:
	movs	r0, #0
	str	r0, [r4, #44]
	str	r7, [r4, #8]
	mov	r7, r0
	str	r5, [r4, #12]
	str	r6, [sp]
	str	r1, [sp, #4]
	str	r0, [sp, #8]
	mov	r0, r4
	bl	step
	cmp	r0, #2
	bne	.LBB5_4
@ %bb.3:
	movs	r0, #2
	add	sp, #28
	pop	{r4, r5, r6, r7, pc}
.LBB5_4:
	ldr	r1, [r4, #64]
	cmp	r1, #0
	beq	.LBB5_23
@ %bb.5:
	ldr	r6, [sp, #64]
	movs	r1, #115
	lsls	r2, r1, #6
	ldr	r1, [r4]
	str	r2, [sp, #24]                   @ 4-byte Spill
	ldr	r2, [r1, r2]
	cmp	r2, r6
	bge	.LBB5_23
@ %bb.6:
	ldr	r2, [r4, #8]
	ldr	r3, [r4, #12]
	ldr	r5, [r4, #32]
	str	r6, [sp, #20]                   @ 4-byte Spill
	mov	r6, r7
	ldr	r7, [r4, #36]
	subs	r2, r5, r2
	sbcs	r7, r3
	mov	r7, r6
	ldr	r6, [sp, #20]                   @ 4-byte Reload
	bge	.LBB5_23
@ %bb.7:
	movs	r5, #1
	mov	r0, r1
	mov	r1, r5
	bl	credits_next
	ldr	r0, [r4, #48]
	ldr	r1, .LCPI5_1
	cmp	r0, r1
	bne	.LBB5_9
@ %bb.8:
	ldr	r0, .LCPI5_2
	bl	credits_fail
	ldr	r0, [r4, #48]
.LBB5_9:
	adds	r0, r0, #1
	str	r0, [r4, #48]
	ldr	r0, [r4, #40]
	ldr	r1, .LCPI5_3
	adds	r1, r0, r1
	ldr	r2, .LCPI5_4
	adds	r2, r0, r2
	ldr	r0, .LCPI5_5
	adds	r0, r0, #1
	ldr	r3, .LCPI5_6
	cmp	r2, r3
	bhi	.LBB5_11
@ %bb.10:
	mov	r1, r2
.LBB5_11:
	str	r1, [r4, #40]
	bhi	.LBB5_13
@ %bb.12:
	ldr	r0, .LCPI5_5
.LBB5_13:
	ldr	r1, [r4, #32]
	adds	r1, r0, r1
	str	r1, [r4, #32]
	ldr	r3, [r4, #36]
	adcs	r3, r7
	str	r3, [r4, #36]
	ldr	r2, [r4]
	ldr	r0, [sp, #24]                   @ 4-byte Reload
	ldr	r0, [r2, r0]
	cmp	r0, r6
	bge	.LBB5_24
@ %bb.14:
	str	r5, [sp, #16]                   @ 4-byte Spill
	b	.LBB5_16
.LBB5_15:                               @   in Loop: Header=BB5_16 Depth=1
	ldr	r2, [r4, #32]
	adds	r1, r1, r2
	str	r1, [r4, #32]
	ldr	r3, [r4, #36]
	adcs	r3, r7
	str	r3, [r4, #36]
	ldr	r2, [r4]
	ldr	r5, [sp, #24]                   @ 4-byte Reload
	ldr	r5, [r2, r5]
	cmp	r5, r6
	bge	.LBB5_23
.LBB5_16:                               @ =>This Inner Loop Header: Depth=1
	ldr	r0, [r4, #8]
	ldr	r5, [r4, #12]
	subs	r0, r1, r0
	sbcs	r3, r5
	bge	.LBB5_25
@ %bb.17:                               @   in Loop: Header=BB5_16 Depth=1
	movs	r1, #1
	mov	r0, r2
	mov	r5, r1
	bl	credits_next
	ldr	r0, [r4, #48]
	ldr	r1, .LCPI5_1
	cmp	r0, r1
	bne	.LBB5_19
@ %bb.18:                               @   in Loop: Header=BB5_16 Depth=1
	ldr	r0, .LCPI5_2
	bl	credits_fail
	ldr	r0, [r4, #48]
.LBB5_19:                               @   in Loop: Header=BB5_16 Depth=1
	adds	r0, r0, #1
	str	r0, [r4, #48]
	ldr	r1, [r4, #40]
	ldr	r0, .LCPI5_3
	adds	r0, r1, r0
	ldr	r2, .LCPI5_4
	adds	r2, r1, r2
	ldr	r1, .LCPI5_5
	adds	r1, r1, #1
	ldr	r3, .LCPI5_6
	cmp	r2, r3
	bhi	.LBB5_21
@ %bb.20:                               @   in Loop: Header=BB5_16 Depth=1
	mov	r0, r2
.LBB5_21:                               @   in Loop: Header=BB5_16 Depth=1
	str	r0, [r4, #40]
	mov	r0, r5
	bhi	.LBB5_15
@ %bb.22:                               @   in Loop: Header=BB5_16 Depth=1
	ldr	r1, .LCPI5_5
	b	.LBB5_15
.LBB5_23:
	add	sp, #28
	pop	{r4, r5, r6, r7, pc}
.LBB5_24:
	mov	r0, r5
	add	sp, #28
	pop	{r4, r5, r6, r7, pc}
.LBB5_25:
	ldr	r0, [sp, #16]                   @ 4-byte Reload
	add	sp, #28
	pop	{r4, r5, r6, r7, pc}
	.p2align	2
@ %bb.26:
.LCPI5_0:
	.long	.L.str.3
.LCPI5_1:
	.long	2147483647                      @ 0x7fffffff
.LCPI5_2:
	.long	.L.str.6
.LCPI5_3:
	.long	4294935046                      @ 0xffff8206
.LCPI5_4:
	.long	12500                           @ 0x30d4
.LCPI5_5:
	.long	179956730                       @ 0xab9ebfa
.LCPI5_6:
	.long	44749                           @ 0xaecd
.Lfunc_end5:
	.size	fixed_player_sync, .Lfunc_end5-fixed_player_sync
	.cantunwind
	.fnend
                                        @ -- End function
	.type	.L.str,%object                  @ @.str
	.section	.rodata.str1.1,"aMS",%progbits,1
.L.str:
	.asciz	"zero time frequency"
	.size	.L.str, 20

	.type	.L.str.1,%object                @ @.str.1
.L.str.1:
	.asciz	"Q32.32 time range"
	.size	.L.str.1, 18

	.type	fixed_player_init.amounts,%object @ @fixed_player_init.amounts
	.section	.rodata,"a",%progbits
	.p2align	2, 0x0
fixed_player_init.amounts:
	.long	0                               @ 0x0
	.long	1000                            @ 0x3e8
	.long	1770                            @ 0x6ea
	.long	3040                            @ 0xbe0
	.long	3780                            @ 0xec4
	.long	5420                            @ 0x152c
	.size	fixed_player_init.amounts, 24

	.type	.L.str.2,%object                @ @.str.2
	.section	.rodata.str1.1,"aMS",%progbits,1
.L.str.2:
	.asciz	"negative clock"
	.size	.L.str.2, 15

	.type	.L.str.3,%object                @ @.str.3
.L.str.3:
	.asciz	"negative media clock"
	.size	.L.str.3, 21

	.type	.L.str.4,%object                @ @.str.4
.L.str.4:
	.asciz	"nonmonotonic fixed clock"
	.size	.L.str.4, 25

	.type	.L.str.5,%object                @ @.str.5
.L.str.5:
	.asciz	"Q32.32 time overflow"
	.size	.L.str.5, 21

	.type	.L.str.6,%object                @ @.str.6
.L.str.6:
	.asciz	"beat range"
	.size	.L.str.6, 11

	.ident	"clang version 23.1.2 (https://github.com/llvm/llvm-project.git 85ac560262434c9ccfc0c183ec22d4138ed647fb)"
	.section	".note.GNU-stack","",%progbits
	.addrsig
	.eabi_attribute	30, 2	@ Tag_ABI_optimization_goals
