	.syntax	unified
	.eabi_attribute	67, "2.09"	@ Tag_conformance
	.cpu	cortex-m4
	.eabi_attribute	6, 13	@ Tag_CPU_arch
	.eabi_attribute	7, 77	@ Tag_CPU_arch_profile
	.eabi_attribute	8, 0	@ Tag_ARM_ISA_use
	.eabi_attribute	9, 2	@ Tag_THUMB_ISA_use
	.fpu	fpv4-sp-d16
	.eabi_attribute	27, 1	@ Tag_ABI_HardFP_use
	.eabi_attribute	36, 1	@ Tag_FP_HP_extension
	.eabi_attribute	34, 1	@ Tag_CPU_unaligned_access
	.eabi_attribute	17, 1	@ Tag_ABI_PCS_GOT_use
	.eabi_attribute	20, 1	@ Tag_ABI_FP_denormal
	.eabi_attribute	21, 0	@ Tag_ABI_FP_exceptions
	.eabi_attribute	23, 3	@ Tag_ABI_FP_number_model
	.eabi_attribute	24, 1	@ Tag_ABI_align_needed
	.eabi_attribute	25, 1	@ Tag_ABI_align_preserved
	.eabi_attribute	28, 1	@ Tag_ABI_VFP_args
	.eabi_attribute	38, 1	@ Tag_ABI_FP_16bit_format
	.eabi_attribute	18, 4	@ Tag_ABI_PCS_wchar_t
	.eabi_attribute	26, 2	@ Tag_ABI_enum_size
	.eabi_attribute	14, 0	@ Tag_ABI_PCS_R9_use
	.file	"animator_single_impl.c"
	.section	.text.unlikely.,"ax",%progbits
	.globl	credits_private_credits_fail    @ -- Begin function credits_private_credits_fail
	.p2align	1
	.prefalign	2, .Lfunc_end0, nop
	.type	credits_private_credits_fail,%function
	.code	16
	.thumb_func
credits_private_credits_fail:           @ @credits_private_credits_fail
	.fnstart
@ %bb.0:
	movw	r1, :lower16:stderr
	movt	r1, :upper16:stderr
	ldr	r3, [r1]
	movw	r1, :lower16:.L.str
	mov	r2, r0
	movt	r1, :upper16:.L.str
	mov	r0, r3
	bl	fprintf
	bl	abort
.Lfunc_end0:
	.size	credits_private_credits_fail, .Lfunc_end0-credits_private_credits_fail
	.cantunwind
	.fnend
                                        @ -- End function
	.text
	.globl	credits_private_mem_resize      @ -- Begin function credits_private_mem_resize
	.p2align	1
	.prefalign	2, .Lfunc_end1, nop
	.type	credits_private_mem_resize,%function
	.code	16
	.thumb_func
credits_private_mem_resize:             @ @credits_private_mem_resize
	.fnstart
@ %bb.0:
	.save	{r4, lr}
	push	{r4, lr}
	cbnz	r1, .LBB1_7
@ %bb.1:
	cbnz	r2, .LBB1_7
@ %bb.2:
	ldr.w	r12, [r0, #12]
	mov	r1, r0
	cmp.w	r12, #0
	beq	.LBB1_6
@ %bb.3:
	ldrd	lr, r0, [r1, #16]
	adds	r0, #3
	bic	r2, r0, #3
	subs.w	r0, lr, r2
	blo	.LBB1_6
@ %bb.4:
	cmp	r3, r0
	bhi	.LBB1_6
@ %bb.5:
	ldrd	r0, r4, [r1]
	add.w	lr, r2, r3
	add	r3, r0
	str.w	lr, [r1, #20]
	cmp	r3, r4
	str	r3, [r1]
	it	hi
	strhi	r3, [r1, #4]
	ldr	r3, [r1, #8]
	add.w	r0, r12, r2
	adds	r2, r3, #1
	str	r2, [r1, #8]
	pop	{r4, pc}
	.p2align	2
.LBB1_6:
	movw	r0, :lower16:.L.str.2
	movt	r0, :upper16:.L.str.2
	bl	credits_private_credits_fail
	.p2align	2
.LBB1_7:
	movw	r0, :lower16:.L.str.1
	movt	r0, :upper16:.L.str.1
	bl	credits_private_credits_fail
.Lfunc_end1:
	.size	credits_private_mem_resize, .Lfunc_end1-credits_private_mem_resize
	.cantunwind
	.fnend
                                        @ -- End function
	.globl	credits_private_mem_free        @ -- Begin function credits_private_mem_free
	.p2align	1
	.prefalign	2, .Lfunc_end2, nop
	.type	credits_private_mem_free,%function
	.code	16
	.thumb_func
credits_private_mem_free:               @ @credits_private_mem_free
	.fnstart
@ %bb.0:
	ldr	r1, [r0]
	subs	r1, r1, r2
	str	r1, [r0]
	bx	lr
.Lfunc_end2:
	.size	credits_private_mem_free, .Lfunc_end2-credits_private_mem_free
	.cantunwind
	.fnend
                                        @ -- End function
	.globl	credits_private_random_seed     @ -- Begin function credits_private_random_seed
	.p2align	1
	.prefalign	2, .Lfunc_end3, nop
	.type	credits_private_random_seed,%function
	.code	16
	.thumb_func
credits_private_random_seed:            @ @credits_private_random_seed
	.fnstart
@ %bb.0:
	.save	{r4, r5, r6, r7, r8, r9, r10, lr}
	push.w	{r4, r5, r6, r7, r8, r9, r10, lr}
	.pad	#8
	sub	sp, #8
	movw	r1, #35173
	movw	r4, #54954
	movt	r1, #27655
	movt	r4, #299
	str	r2, [sp]
	movs	r2, #0
	movs	r6, #1
	movw	r12, #623
	str	r3, [sp, #4]
	str	r4, [r0]
	.p2align	2
.LBB3_1:                                @ =>This Inner Loop Header: Depth=1
	eor.w	r7, r4, r4, lsr #30
	mla	r4, r7, r1, r2
	add.w	r7, r0, r2, lsl #2
	adds	r4, #1
	eor.w	r5, r4, r4, lsr #30
	mla	r5, r5, r1, r2
	str	r4, [r7, #4]
	adds	r5, #2
	eor.w	r4, r5, r5, lsr #30
	mla	r4, r4, r1, r2
	str	r5, [r7, #8]
	adds	r5, r4, #3
	eor.w	r4, r5, r5, lsr #30
	mla	r4, r4, r1, r2
	str	r5, [r7, #12]
	adds	r5, r4, #4
	eor.w	r4, r5, r5, lsr #30
	mla	r4, r4, r1, r2
	str	r5, [r7, #16]
	adds	r5, r4, #5
	eor.w	r4, r5, r5, lsr #30
	mla	r4, r4, r1, r2
	str	r5, [r7, #20]
	adds	r5, r4, #6
	str	r5, [r7, #24]
	eor.w	r5, r5, r5, lsr #30
	mla	r4, r5, r1, r6
	mla	r5, r5, r1, r2
	adds	r2, #7
	adds	r4, #6
	adds	r5, #7
	cmp	r2, r12
	add.w	r6, r6, #7
	str	r5, [r7, #28]
	bne	.LBB3_1
@ %bb.2:
	movw	r12, #64912
	movt	r12, #65535
	movw	lr, #26125
	movt	lr, #25
	cmp	r3, #0
	mov.w	r3, #2
	mov.w	r1, #624
	mov.w	r8, #0
	mov.w	r6, #1
	mov	r9, sp
	movw	r10, #623
	mov	r5, r12
	mov.w	r7, #0
	it	eq
	moveq	r3, #1
	str.w	r1, [r0, #2496]
	str.w	r8, [r0, #2504]
	str.w	r8, [r0, #2508]
	b	.LBB3_5
	.p2align	2
.LBB3_3:                                @   in Loop: Header=BB3_5 Depth=1
	ldr.w	r1, [r0, #2492]
	movs	r6, #1
	str	r1, [r0]
.LBB3_4:                                @   in Loop: Header=BB3_5 Depth=1
	adds	r7, #1
	cmp	r7, r3
	it	ge
	movge	r7, r8
	adds	r5, #6
	beq.w	.LBB3_22
.LBB3_5:                                @ =>This Inner Loop Header: Depth=1
	add.w	r1, r0, r6, lsl #2
	ldr	r1, [r1, #-4]
	ldr.w	r2, [r0, r6, lsl #2]
	eor.w	r1, r1, r1, lsr #30
	ldr.w	r4, [r9, r7, lsl #2]
	mul	r1, r1, lr
	eors	r1, r2
	adds	r2, r4, r7
	add	r1, r2
	cmp	r6, r10
	str.w	r1, [r0, r6, lsl #2]
	blt	.LBB3_7
@ %bb.6:                                @   in Loop: Header=BB3_5 Depth=1
	ldr.w	r1, [r0, #2492]
	str	r1, [r0]
	movs	r1, #1
	b	.LBB3_8
	.p2align	2
.LBB3_7:                                @   in Loop: Header=BB3_5 Depth=1
	adds	r1, r6, #1
.LBB3_8:                                @   in Loop: Header=BB3_5 Depth=1
	adds	r6, r7, #1
	add.w	r2, r0, r1, lsl #2
	cmp	r6, r3
	it	ge
	movge	r6, r8
	ldr	r2, [r2, #-4]
	ldr.w	r4, [r0, r1, lsl #2]
	eor.w	r2, r2, r2, lsr #30
	ldr.w	r7, [r9, r6, lsl #2]
	mul	r2, r2, lr
	eors	r2, r4
	adds	r4, r7, r6
	add	r2, r4
	cmp	r1, r10
	str.w	r2, [r0, r1, lsl #2]
	blt	.LBB3_10
@ %bb.9:                                @   in Loop: Header=BB3_5 Depth=1
	ldr.w	r1, [r0, #2492]
	str	r1, [r0]
	movs	r1, #1
	b	.LBB3_11
	.p2align	2
.LBB3_10:                               @   in Loop: Header=BB3_5 Depth=1
	adds	r1, #1
.LBB3_11:                               @   in Loop: Header=BB3_5 Depth=1
	adds	r6, #1
	add.w	r2, r0, r1, lsl #2
	cmp	r6, r3
	it	ge
	movge	r6, r8
	ldr	r2, [r2, #-4]
	ldr.w	r4, [r0, r1, lsl #2]
	eor.w	r2, r2, r2, lsr #30
	ldr.w	r7, [r9, r6, lsl #2]
	mul	r2, r2, lr
	eors	r2, r4
	adds	r4, r7, r6
	add	r2, r4
	cmp	r1, r10
	str.w	r2, [r0, r1, lsl #2]
	blt	.LBB3_13
@ %bb.12:                               @   in Loop: Header=BB3_5 Depth=1
	ldr.w	r1, [r0, #2492]
	str	r1, [r0]
	movs	r1, #1
	b	.LBB3_14
	.p2align	2
.LBB3_13:                               @   in Loop: Header=BB3_5 Depth=1
	adds	r1, #1
.LBB3_14:                               @   in Loop: Header=BB3_5 Depth=1
	adds	r6, #1
	add.w	r2, r0, r1, lsl #2
	cmp	r6, r3
	it	ge
	movge	r6, r8
	ldr	r2, [r2, #-4]
	ldr.w	r4, [r0, r1, lsl #2]
	eor.w	r2, r2, r2, lsr #30
	ldr.w	r7, [r9, r6, lsl #2]
	mul	r2, r2, lr
	eors	r2, r4
	adds	r4, r7, r6
	add	r2, r4
	cmp	r1, r10
	str.w	r2, [r0, r1, lsl #2]
	blt	.LBB3_16
@ %bb.15:                               @   in Loop: Header=BB3_5 Depth=1
	ldr.w	r1, [r0, #2492]
	str	r1, [r0]
	movs	r1, #1
	b	.LBB3_17
	.p2align	2
.LBB3_16:                               @   in Loop: Header=BB3_5 Depth=1
	adds	r1, #1
.LBB3_17:                               @   in Loop: Header=BB3_5 Depth=1
	adds	r6, #1
	add.w	r2, r0, r1, lsl #2
	cmp	r6, r3
	it	ge
	movge	r6, r8
	ldr	r2, [r2, #-4]
	ldr.w	r4, [r0, r1, lsl #2]
	eor.w	r2, r2, r2, lsr #30
	ldr.w	r7, [r9, r6, lsl #2]
	mul	r2, r2, lr
	eors	r2, r4
	adds	r4, r7, r6
	add	r2, r4
	cmp	r1, r10
	str.w	r2, [r0, r1, lsl #2]
	blt	.LBB3_19
@ %bb.18:                               @   in Loop: Header=BB3_5 Depth=1
	ldr.w	r1, [r0, #2492]
	str	r1, [r0]
	movs	r1, #1
	b	.LBB3_20
	.p2align	2
.LBB3_19:                               @   in Loop: Header=BB3_5 Depth=1
	adds	r1, #1
.LBB3_20:                               @   in Loop: Header=BB3_5 Depth=1
	adds	r7, r6, #1
	add.w	r2, r0, r1, lsl #2
	cmp	r7, r3
	it	ge
	movge	r7, r8
	ldr	r2, [r2, #-4]
	ldr.w	r4, [r0, r1, lsl #2]
	eor.w	r2, r2, r2, lsr #30
	ldr.w	r6, [r9, r7, lsl #2]
	mul	r2, r2, lr
	eors	r2, r4
	adds	r4, r6, r7
	add	r2, r4
	cmp	r1, r10
	str.w	r2, [r0, r1, lsl #2]
	bge.w	.LBB3_3
@ %bb.21:                               @   in Loop: Header=BB3_5 Depth=1
	adds	r6, r1, #1
	b	.LBB3_4
	.p2align	2
.LBB3_22:
	movw	r1, #35685
	movt	r1, #23896
	add.w	r2, r12, #1
	movw	r3, #623
	b	.LBB3_24
	.p2align	2
.LBB3_23:                               @   in Loop: Header=BB3_24 Depth=1
	ldr.w	r7, [r0, #2492]
	movs	r6, #1
	str	r7, [r0]
	adds	r2, #7
	beq.w	.LBB3_44
.LBB3_24:                               @ =>This Inner Loop Header: Depth=1
	add.w	r7, r0, r6, lsl #2
	ldr	r7, [r7, #-4]
	ldr.w	r5, [r0, r6, lsl #2]
	eor.w	r7, r7, r7, lsr #30
	muls	r7, r1, r7
	eors	r7, r5
	subs	r7, r7, r6
	cmp	r6, r3
	str.w	r7, [r0, r6, lsl #2]
	blt	.LBB3_26
@ %bb.25:                               @   in Loop: Header=BB3_24 Depth=1
	ldr.w	r7, [r0, #2492]
	str	r7, [r0]
	movs	r7, #1
	b	.LBB3_27
	.p2align	2
.LBB3_26:                               @   in Loop: Header=BB3_24 Depth=1
	adds	r7, r6, #1
.LBB3_27:                               @   in Loop: Header=BB3_24 Depth=1
	add.w	r6, r0, r7, lsl #2
	ldr	r6, [r6, #-4]
	ldr.w	r5, [r0, r7, lsl #2]
	eor.w	r6, r6, r6, lsr #30
	muls	r6, r1, r6
	eors	r6, r5
	subs	r6, r6, r7
	cmp	r7, r3
	str.w	r6, [r0, r7, lsl #2]
	blt	.LBB3_29
@ %bb.28:                               @   in Loop: Header=BB3_24 Depth=1
	ldr.w	r7, [r0, #2492]
	str	r7, [r0]
	movs	r7, #1
	b	.LBB3_30
	.p2align	2
.LBB3_29:                               @   in Loop: Header=BB3_24 Depth=1
	adds	r7, #1
.LBB3_30:                               @   in Loop: Header=BB3_24 Depth=1
	add.w	r6, r0, r7, lsl #2
	ldr	r6, [r6, #-4]
	ldr.w	r5, [r0, r7, lsl #2]
	eor.w	r6, r6, r6, lsr #30
	muls	r6, r1, r6
	eors	r6, r5
	subs	r6, r6, r7
	cmp	r7, r3
	str.w	r6, [r0, r7, lsl #2]
	blt	.LBB3_32
@ %bb.31:                               @   in Loop: Header=BB3_24 Depth=1
	ldr.w	r7, [r0, #2492]
	str	r7, [r0]
	movs	r7, #1
	b	.LBB3_33
	.p2align	2
.LBB3_32:                               @   in Loop: Header=BB3_24 Depth=1
	adds	r7, #1
.LBB3_33:                               @   in Loop: Header=BB3_24 Depth=1
	add.w	r6, r0, r7, lsl #2
	ldr	r6, [r6, #-4]
	ldr.w	r5, [r0, r7, lsl #2]
	eor.w	r6, r6, r6, lsr #30
	muls	r6, r1, r6
	eors	r6, r5
	subs	r6, r6, r7
	cmp	r7, r3
	str.w	r6, [r0, r7, lsl #2]
	blt	.LBB3_35
@ %bb.34:                               @   in Loop: Header=BB3_24 Depth=1
	ldr.w	r7, [r0, #2492]
	str	r7, [r0]
	movs	r7, #1
	b	.LBB3_36
	.p2align	2
.LBB3_35:                               @   in Loop: Header=BB3_24 Depth=1
	adds	r7, #1
.LBB3_36:                               @   in Loop: Header=BB3_24 Depth=1
	add.w	r6, r0, r7, lsl #2
	ldr	r6, [r6, #-4]
	ldr.w	r5, [r0, r7, lsl #2]
	eor.w	r6, r6, r6, lsr #30
	muls	r6, r1, r6
	eors	r6, r5
	subs	r6, r6, r7
	cmp	r7, r3
	str.w	r6, [r0, r7, lsl #2]
	blt	.LBB3_38
@ %bb.37:                               @   in Loop: Header=BB3_24 Depth=1
	ldr.w	r7, [r0, #2492]
	str	r7, [r0]
	movs	r7, #1
	b	.LBB3_39
	.p2align	2
.LBB3_38:                               @   in Loop: Header=BB3_24 Depth=1
	adds	r7, #1
.LBB3_39:                               @   in Loop: Header=BB3_24 Depth=1
	add.w	r6, r0, r7, lsl #2
	ldr	r6, [r6, #-4]
	ldr.w	r5, [r0, r7, lsl #2]
	eor.w	r6, r6, r6, lsr #30
	muls	r6, r1, r6
	eors	r6, r5
	subs	r6, r6, r7
	cmp	r7, r3
	str.w	r6, [r0, r7, lsl #2]
	blt	.LBB3_41
@ %bb.40:                               @   in Loop: Header=BB3_24 Depth=1
	ldr.w	r7, [r0, #2492]
	str	r7, [r0]
	movs	r7, #1
	b	.LBB3_42
	.p2align	2
.LBB3_41:                               @   in Loop: Header=BB3_24 Depth=1
	adds	r7, #1
.LBB3_42:                               @   in Loop: Header=BB3_24 Depth=1
	add.w	r6, r0, r7, lsl #2
	ldr	r6, [r6, #-4]
	ldr.w	r5, [r0, r7, lsl #2]
	eor.w	r6, r6, r6, lsr #30
	muls	r6, r1, r6
	eors	r6, r5
	subs	r6, r6, r7
	cmp	r7, r3
	str.w	r6, [r0, r7, lsl #2]
	bge.w	.LBB3_23
@ %bb.43:                               @   in Loop: Header=BB3_24 Depth=1
	adds	r6, r7, #1
	adds	r2, #7
	bne.w	.LBB3_24
.LBB3_44:
	mov.w	r1, #-2147483648
	str	r1, [r0]
	add	sp, #8
	pop.w	{r4, r5, r6, r7, r8, r9, r10, pc}
.Lfunc_end3:
	.size	credits_private_random_seed, .Lfunc_end3-credits_private_random_seed
	.cantunwind
	.fnend
                                        @ -- End function
	.globl	credits_private_random_u32      @ -- Begin function credits_private_random_u32
	.p2align	1
	.prefalign	2, .Lfunc_end4, nop
	.type	credits_private_random_u32,%function
	.code	16
	.thumb_func
credits_private_random_u32:             @ @credits_private_random_u32
	.fnstart
@ %bb.0:
	mov	r12, r0
	ldr.w	r0, [r0, #2496]
	cmp.w	r0, #624
	blt.w	.LBB4_4
@ %bb.1:
	.save	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	push.w	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	mov	r11, r12
	movw	r8, #45279
	movw	r9, #65534
	ldr	r6, [r11], #-28
	movw	r10, #64628
	movt	r8, #39176
	movt	r9, #32767
	movs	r5, #0
	movt	r10, #65535
	movw	lr, #623
	.p2align	2
.LBB4_2:                                @ =>This Inner Loop Header: Depth=1
	add.w	r4, r12, r5, lsl #2
	ldr	r0, [r4, #4]
	mov	r1, r10
	cmp	r5, #227
	it	lo
	movwlo	r1, #1588
	and	r6, r6, #-2147483648
	and.w	r7, r0, r9
	ldr	r1, [r4, r1]
	add	r6, r7
	eor.w	r1, r1, r6, lsr #1
	lsls	r6, r0, #31
	it	ne
	eorne.w	r1, r1, r8
	str	r1, [r11, #28]!
	and	r1, r0, #-2147483648
	ldrd	r2, r0, [r4, #8]
	ldr	r7, [r4, #16]
	and.w	r6, r2, r9
	add	r1, r6
	mov	r6, r10
	cmp	r5, #226
	it	lo
	movwlo	r6, #1588
	add	r6, r4
	ldr	r3, [r6, #4]
	ldr	r6, [r4, #20]
	eor.w	r1, r3, r1, lsr #1
	lsls	r3, r2, #31
	mov	r3, r10
	it	ne
	eorne.w	r1, r1, r8
	str	r1, [r4, #4]
	cmp	r5, #225
	it	lo
	movwlo	r3, #1588
	add	r3, r4
	and	r1, r2, #-2147483648
	and.w	r2, r0, r9
	ldr	r3, [r3, #8]
	add	r1, r2
	lsls	r2, r0, #31
	eor.w	r1, r3, r1, lsr #1
	mov	r2, r10
	it	ne
	eorne.w	r1, r1, r8
	str	r1, [r4, #8]
	cmp	r5, #224
	it	lo
	movwlo	r2, #1588
	add	r2, r4
	and	r0, r0, #-2147483648
	and.w	r1, r7, r9
	ldr	r2, [r2, #12]
	add	r0, r1
	eor.w	r0, r2, r0, lsr #1
	lsls	r1, r7, #31
	mov	r2, r10
	it	ne
	eorne.w	r0, r0, r8
	str	r0, [r4, #12]
	cmp	r5, #223
	it	lo
	movwlo	r2, #1588
	add	r2, r4
	and	r0, r7, #-2147483648
	and.w	r1, r6, r9
	ldr	r2, [r2, #16]
	add	r0, r1
	eor.w	r0, r2, r0, lsr #1
	lsls	r1, r6, #31
	it	ne
	eorne.w	r0, r0, r8
	mov	r3, r10
	str	r0, [r4, #16]
	ldr	r0, [r4, #24]
	cmp	r5, #222
	it	lo
	movwlo	r3, #1588
	add	r3, r4
	and	r1, r6, #-2147483648
	and.w	r2, r0, r9
	ldr	r3, [r3, #20]
	add	r1, r2
	eor.w	r1, r3, r1, lsr #1
	lsls	r2, r0, #31
	it	ne
	eorne.w	r1, r1, r8
	str	r1, [r4, #20]
	mov	r2, r10
	ldr.w	r6, [r11, #28]
	cmp	r5, #221
	it	lo
	movwlo	r2, #1588
	add	r2, r4
	and	r0, r0, #-2147483648
	and.w	r1, r6, r9
	ldr	r2, [r2, #24]
	add	r0, r1
	adds	r5, #7
	eor.w	r0, r2, r0, lsr #1
	lsls	r1, r6, #31
	it	ne
	eorne.w	r0, r0, r8
	cmp	r5, lr
	str	r0, [r4, #24]
	bne.w	.LBB4_2
@ %bb.3:
	ldr.w	r0, [r12, #2492]
	ldr.w	r1, [r12]
	and	r0, r0, #-2147483648
	and.w	r2, r1, r9
	ldr.w	r3, [r12, #1584]
	add	r0, r2
	eor.w	r0, r3, r0, lsr #1
	lsls	r1, r1, #31
	it	ne
	eorne.w	r0, r0, r8
	str.w	r0, [r12, #2492]
	movs	r0, #0
	pop.w	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
.LBB4_4:
	adds	r1, r0, #1
	str.w	r1, [r12, #2496]
	ldr.w	r0, [r12, r0, lsl #2]
	movw	r1, #22144
	eor.w	r0, r0, r0, lsr #11
	movt	r1, #40236
	and.w	r1, r1, r0, lsl #7
	eors	r0, r1
	movs	r1, #0
	movt	r1, #61382
	and.w	r1, r1, r0, lsl #15
	eors	r0, r1
	ldr.w	r1, [r12, #2504]
	ldr.w	r2, [r12, #2508]
	adds	r1, #1
	eor.w	r0, r0, r0, lsr #18
	adc	r2, r2, #0
	str.w	r1, [r12, #2504]
	str.w	r2, [r12, #2508]
	bx	lr
.Lfunc_end4:
	.size	credits_private_random_u32, .Lfunc_end4-credits_private_random_u32
	.cantunwind
	.fnend
                                        @ -- End function
	.globl	credits_private_random_bits     @ -- Begin function credits_private_random_bits
	.p2align	1
	.prefalign	2, .Lfunc_end5, nop
	.type	credits_private_random_bits,%function
	.code	16
	.thumb_func
credits_private_random_bits:            @ @credits_private_random_bits
	.fnstart
@ %bb.0:
	.save	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	push.w	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	.pad	#20
	sub	sp, #20
	cmp	r1, #65
	bhs.w	.LBB5_18
@ %bb.1:
	mov	r6, r1
	cmp	r1, #0
	beq.w	.LBB5_8
@ %bb.2:
	movs	r5, #0
	ldr.w	r2, [r0, #2496]
	movw	r4, #22144
	movt	r5, #61382
	cmp	r6, #32
	movt	r4, #40236
	bhi.w	.LBB5_9
@ %bb.3:
	cmp.w	r2, #624
	blt.w	.LBB5_7
@ %bb.4:
	mov	r10, r0
	movw	r12, #45279
	movw	lr, #65534
	ldr	r2, [r10], #-28
	movw	r9, #64628
	str	r6, [sp, #16]                   @ 4-byte Spill
	movt	r12, #39176
	movt	lr, #32767
	movs	r6, #0
	movt	r9, #65535
	.p2align	2
.LBB5_5:                                @ =>This Inner Loop Header: Depth=1
	add.w	r7, r0, r6, lsl #2
	ldr	r3, [r7, #4]
	mov	r4, r9
	cmp	r6, #227
	it	lo
	movwlo	r4, #1588
	and	r2, r2, #-2147483648
	and.w	r5, r3, lr
	ldr	r4, [r7, r4]
	add	r2, r5
	eor.w	r2, r4, r2, lsr #1
	lsls	r4, r3, #31
	it	ne
	eorne.w	r2, r2, r12
	str	r2, [r10, #28]!
	add.w	r11, r7, #8
	ldm.w	r11, {r4, r5, r11}
	and	r2, r3, #-2147483648
	and.w	r3, r4, lr
	add	r3, r2
	mov	r2, r9
	cmp	r6, #226
	it	lo
	movwlo	r2, #1588
	add	r2, r7
	ldr.w	r8, [r2, #4]
	lsls	r1, r4, #31
	eor.w	r3, r8, r3, lsr #1
	and	r1, r4, #-2147483648
	mov	r4, r9
	ldr	r2, [r7, #20]
	it	ne
	eorne.w	r3, r3, r12
	str	r3, [r7, #4]
	cmp	r6, #225
	it	lo
	movwlo	r4, #1588
	add	r4, r7
	and.w	r3, r5, lr
	ldr	r4, [r4, #8]
	add	r1, r3
	eor.w	r1, r4, r1, lsr #1
	lsls	r3, r5, #31
	mov	r4, r9
	it	ne
	eorne.w	r1, r1, r12
	str	r1, [r7, #8]
	cmp	r6, #224
	it	lo
	movwlo	r4, #1588
	add	r4, r7
	and	r1, r5, #-2147483648
	and.w	r3, r11, lr
	ldr	r4, [r4, #12]
	add	r1, r3
	eor.w	r1, r4, r1, lsr #1
	lsls.w	r3, r11, #31
	mov	r4, r9
	it	ne
	eorne.w	r1, r1, r12
	str	r1, [r7, #12]
	cmp	r6, #223
	it	lo
	movwlo	r4, #1588
	add	r4, r7
	and	r1, r11, #-2147483648
	and.w	r3, r2, lr
	ldr	r4, [r4, #16]
	add	r1, r3
	eor.w	r1, r4, r1, lsr #1
	lsls	r3, r2, #31
	it	ne
	eorne.w	r1, r1, r12
	mov	r4, r9
	str	r1, [r7, #16]
	ldr	r1, [r7, #24]
	cmp	r6, #222
	it	lo
	movwlo	r4, #1588
	add	r4, r7
	and	r2, r2, #-2147483648
	and.w	r3, r1, lr
	ldr	r4, [r4, #20]
	add	r2, r3
	eor.w	r2, r4, r2, lsr #1
	lsls	r3, r1, #31
	it	ne
	eorne.w	r2, r2, r12
	str	r2, [r7, #20]
	mov	r4, r9
	ldr.w	r2, [r10, #28]
	cmp	r6, #221
	it	lo
	movwlo	r4, #1588
	add	r4, r7
	and	r1, r1, #-2147483648
	and.w	r3, r2, lr
	ldr	r4, [r4, #24]
	add	r1, r3
	lsls	r3, r2, #31
	add.w	r6, r6, #7
	eor.w	r1, r4, r1, lsr #1
	movw	r3, #623
	it	ne
	eorne.w	r1, r1, r12
	cmp	r6, r3
	str	r1, [r7, #24]
	bne.w	.LBB5_5
@ %bb.6:
	ldr.w	r2, [r0, #2492]
	ldr	r3, [r0]
	and	r2, r2, #-2147483648
	and.w	r7, r3, lr
	ldr.w	r6, [r0, #1584]
	add	r2, r7
	eor.w	r2, r6, r2, lsr #1
	lsls	r3, r3, #31
	it	ne
	eorne.w	r2, r2, r12
	ldr	r6, [sp, #16]                   @ 4-byte Reload
	movs	r5, #0
	movw	r4, #22144
	str.w	r2, [r0, #2492]
	movs	r2, #0
	movt	r5, #61382
	movt	r4, #40236
.LBB5_7:
	adds	r1, r2, #1
	str.w	r1, [r0, #2496]
	ldr.w	r1, [r0, r2, lsl #2]
	ldr.w	r3, [r0, #2508]
	eor.w	r1, r1, r1, lsr #11
	and.w	r2, r4, r1, lsl #7
	eors	r1, r2
	and.w	r2, r5, r1, lsl #15
	eors	r1, r2
	ldr.w	r2, [r0, #2504]
	eor.w	r1, r1, r1, lsr #18
	adds	r2, #1
	adc	r3, r3, #0
	str.w	r2, [r0, #2504]
	str.w	r3, [r0, #2508]
	rsb.w	r0, r6, #32
	lsr.w	r0, r1, r0
	movs	r1, #0
	add	sp, #20
	pop.w	{r4, r5, r6, r7, r8, r9, r10, r11, pc}
	.p2align	2
.LBB5_8:
	movs	r0, #0
	movs	r1, #0
	add	sp, #20
	pop.w	{r4, r5, r6, r7, r8, r9, r10, r11, pc}
	.p2align	2
.LBB5_9:
	movw	lr, #45279
	movw	r9, #65534
	movw	r10, #64628
	movt	lr, #39176
	movt	r9, #32767
	cmp.w	r2, #624
	movt	r10, #65535
	str	r6, [sp, #16]                   @ 4-byte Spill
	blt.w	.LBB5_13
@ %bb.10:
	mov	r12, r0
	ldr	r2, [r12], #-28
	movs	r6, #0
	movw	r8, #623
	.p2align	2
.LBB5_11:                               @ =>This Inner Loop Header: Depth=1
	add.w	r7, r0, r6, lsl #2
	ldr	r1, [r7, #4]
	mov	r4, r10
	cmp	r6, #227
	it	lo
	movwlo	r4, #1588
	and	r2, r2, #-2147483648
	and.w	r3, r1, r9
	ldr	r4, [r7, r4]
	add	r2, r3
	eor.w	r2, r4, r2, lsr #1
	lsls	r3, r1, #31
	it	ne
	eorne.w	r2, r2, lr
	str	r2, [r12, #28]!
	ldrd	r5, r4, [r7, #8]
	and	r1, r1, #-2147483648
	and.w	r2, r5, r9
	add	r1, r2
	mov	r2, r10
	ldr	r3, [r7, #16]
	cmp	r6, #226
	it	lo
	movwlo	r2, #1588
	add	r2, r7
	ldr	r2, [r2, #4]
	ldr.w	r11, [r7, #20]
	eor.w	r1, r2, r1, lsr #1
	lsls	r2, r5, #31
	it	ne
	eorne.w	r1, r1, lr
	str	r1, [r7, #4]
	and	r1, r5, #-2147483648
	mov	r5, r10
	cmp	r6, #225
	it	lo
	movwlo	r5, #1588
	add	r5, r7
	and.w	r2, r4, r9
	ldr	r5, [r5, #8]
	add	r1, r2
	eor.w	r1, r5, r1, lsr #1
	lsls	r2, r4, #31
	it	ne
	eorne.w	r1, r1, lr
	str	r1, [r7, #8]
	and	r1, r4, #-2147483648
	mov	r4, r10
	cmp	r6, #224
	it	lo
	movwlo	r4, #1588
	add	r4, r7
	and.w	r2, r3, r9
	ldr	r4, [r4, #12]
	add	r1, r2
	eor.w	r1, r4, r1, lsr #1
	lsls	r2, r3, #31
	it	ne
	eorne.w	r1, r1, lr
	str	r1, [r7, #12]
	and	r1, r3, #-2147483648
	mov	r3, r10
	cmp	r6, #223
	it	lo
	movwlo	r3, #1588
	add	r3, r7
	and.w	r2, r11, r9
	ldr	r3, [r3, #16]
	add	r1, r2
	eor.w	r1, r3, r1, lsr #1
	lsls.w	r2, r11, #31
	it	ne
	eorne.w	r1, r1, lr
	mov	r4, r10
	str	r1, [r7, #16]
	ldr	r1, [r7, #24]
	cmp	r6, #222
	it	lo
	movwlo	r4, #1588
	add	r4, r7
	and	r2, r11, #-2147483648
	and.w	r3, r1, r9
	ldr	r4, [r4, #20]
	add	r2, r3
	eor.w	r2, r4, r2, lsr #1
	lsls	r3, r1, #31
	it	ne
	eorne.w	r2, r2, lr
	str	r2, [r7, #20]
	mov	r4, r10
	ldr.w	r2, [r12, #28]
	cmp	r6, #221
	it	lo
	movwlo	r4, #1588
	add	r4, r7
	and	r1, r1, #-2147483648
	and.w	r3, r2, r9
	ldr	r4, [r4, #24]
	add	r1, r3
	adds	r6, #7
	eor.w	r1, r4, r1, lsr #1
	lsls	r3, r2, #31
	it	ne
	eorne.w	r1, r1, lr
	cmp	r6, r8
	str	r1, [r7, #24]
	bne.w	.LBB5_11
@ %bb.12:
	ldr.w	r1, [r0, #2492]
	ldr	r2, [r0]
	and	r1, r1, #-2147483648
	and.w	r3, r2, r9
	ldr.w	r7, [r0, #1584]
	add	r1, r3
	eor.w	r1, r7, r1, lsr #1
	lsls	r2, r2, #31
	it	ne
	eorne.w	r1, r1, lr
	ldr	r6, [sp, #16]                   @ 4-byte Reload
	movs	r5, #0
	movw	r4, #22144
	movs	r2, #0
	movt	r5, #61382
	movt	r4, #40236
	str.w	r1, [r0, #2492]
.LBB5_13:
	adds	r3, r2, #1
	str.w	r3, [r0, #2496]
	ldr.w	r1, [r0, r2, lsl #2]
	ldr.w	r8, [r0, #2504]
	eor.w	r1, r1, r1, lsr #11
	and.w	r7, r4, r1, lsl #7
	eors	r1, r7
	and.w	r7, r5, r1, lsl #15
	eors	r1, r7
	eor.w	r7, r1, r1, lsr #18
	ldr.w	r12, [r0, #2508]
	movw	r11, #623
	str	r7, [sp, #12]                   @ 4-byte Spill
	cmp	r2, r11
	addw	r7, r0, #2504
	blt.w	.LBB5_17
@ %bb.14:
	strd	r7, r12, [sp]                   @ 8-byte Folded Spill
	mov	r7, r0
	ldr	r2, [r7], #-28
	mov.w	r12, #0
	str.w	r8, [sp, #8]                    @ 4-byte Spill
	.p2align	2
.LBB5_15:                               @ =>This Inner Loop Header: Depth=1
	add.w	r5, r0, r12, lsl #2
	ldr	r1, [r5, #4]
	mov	r4, r10
	cmp.w	r12, #227
	it	lo
	movwlo	r4, #1588
	and	r2, r2, #-2147483648
	and.w	r3, r1, r9
	ldr	r4, [r5, r4]
	add	r2, r3
	eor.w	r2, r4, r2, lsr #1
	lsls	r3, r1, #31
	it	ne
	eorne.w	r2, r2, lr
	str	r2, [r7, #28]!
	ldrd	r4, r3, [r5, #8]
	and	r1, r1, #-2147483648
	and.w	r2, r4, r9
	add	r1, r2
	mov	r2, r10
	ldr.w	r8, [r5, #16]
	cmp.w	r12, #226
	it	lo
	movwlo	r2, #1588
	add	r2, r5
	mov	r6, r11
	ldr.w	r11, [r2, #4]
	ldr	r2, [r5, #20]
	eor.w	r1, r11, r1, lsr #1
	mov	r11, r6
	lsls	r6, r4, #31
	mov	r6, r10
	it	ne
	eorne.w	r1, r1, lr
	str	r1, [r5, #4]
	cmp.w	r12, #225
	it	lo
	movwlo	r6, #1588
	add	r6, r5
	and	r1, r4, #-2147483648
	and.w	r4, r3, r9
	ldr	r6, [r6, #8]
	add	r1, r4
	lsls	r4, r3, #31
	eor.w	r1, r6, r1, lsr #1
	mov	r4, r10
	it	ne
	eorne.w	r1, r1, lr
	str	r1, [r5, #8]
	cmp.w	r12, #224
	it	lo
	movwlo	r4, #1588
	add	r4, r5
	and	r1, r3, #-2147483648
	and.w	r3, r8, r9
	ldr	r4, [r4, #12]
	add	r1, r3
	eor.w	r1, r4, r1, lsr #1
	lsls.w	r3, r8, #31
	mov	r4, r10
	it	ne
	eorne.w	r1, r1, lr
	str	r1, [r5, #12]
	cmp.w	r12, #223
	it	lo
	movwlo	r4, #1588
	add	r4, r5
	and	r1, r8, #-2147483648
	and.w	r3, r2, r9
	ldr	r4, [r4, #16]
	add	r1, r3
	eor.w	r1, r4, r1, lsr #1
	lsls	r3, r2, #31
	it	ne
	eorne.w	r1, r1, lr
	mov	r4, r10
	str	r1, [r5, #16]
	ldr	r1, [r5, #24]
	cmp.w	r12, #222
	it	lo
	movwlo	r4, #1588
	add	r4, r5
	and	r2, r2, #-2147483648
	and.w	r3, r1, r9
	ldr	r4, [r4, #20]
	add	r2, r3
	eor.w	r2, r4, r2, lsr #1
	lsls	r3, r1, #31
	it	ne
	eorne.w	r2, r2, lr
	str	r2, [r5, #20]
	mov	r4, r10
	ldr	r2, [r7, #28]
	cmp.w	r12, #221
	it	lo
	movwlo	r4, #1588
	add	r4, r5
	and	r1, r1, #-2147483648
	and.w	r3, r2, r9
	ldr	r4, [r4, #24]
	add	r1, r3
	add.w	r12, r12, #7
	eor.w	r1, r4, r1, lsr #1
	lsls	r3, r2, #31
	it	ne
	eorne.w	r1, r1, lr
	cmp	r12, r11
	str	r1, [r5, #24]
	bne.w	.LBB5_15
@ %bb.16:
	ldr.w	r1, [r0, #2492]
	ldr	r2, [r0]
	and	r1, r1, #-2147483648
	and.w	r3, r2, r9
	ldr.w	r7, [r0, #1584]
	add	r1, r3
	eor.w	r1, r7, r1, lsr #1
	lsls	r2, r2, #31
	it	ne
	eorne.w	r1, r1, lr
	ldr	r6, [sp, #16]                   @ 4-byte Reload
	movs	r5, #0
	movw	r4, #22144
	ldr.w	r8, [sp, #8]                    @ 4-byte Reload
	ldrd	r7, r12, [sp]                   @ 8-byte Folded Reload
	movs	r3, #0
	movt	r5, #61382
	movt	r4, #40236
	str.w	r1, [r0, #2492]
.LBB5_17:
	adds	r1, r3, #1
	str.w	r1, [r0, #2496]
	ldr.w	r0, [r0, r3, lsl #2]
	eor.w	r0, r0, r0, lsr #11
	and.w	r1, r4, r0, lsl #7
	eors	r0, r1
	and.w	r1, r5, r0, lsl #15
	eors	r0, r1
	adds.w	r1, r8, #2
	adc	r2, r12, #0
	eor.w	r0, r0, r0, lsr #18
	strd	r1, r2, [r7]
	rsb.w	r1, r6, #64
	lsr.w	r1, r0, r1
	ldr	r0, [sp, #12]                   @ 4-byte Reload
	add	sp, #20
	pop.w	{r4, r5, r6, r7, r8, r9, r10, r11, pc}
	.p2align	2
.LBB5_18:
	movw	r0, :lower16:.L.str.3
	movt	r0, :upper16:.L.str.3
	bl	credits_private_credits_fail
.Lfunc_end5:
	.size	credits_private_random_bits, .Lfunc_end5-credits_private_random_bits
	.cantunwind
	.fnend
                                        @ -- End function
	.globl	credits_private_random_scaled   @ -- Begin function credits_private_random_scaled
	.p2align	1
	.prefalign	2, .Lfunc_end6, nop
	.type	credits_private_random_scaled,%function
	.code	16
	.thumb_func
credits_private_random_scaled:          @ @credits_private_random_scaled
	.fnstart
@ %bb.0:
	.save	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	push.w	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	.pad	#20
	sub	sp, #20
	subw	r2, r1, #2049
	cmn.w	r2, #2048
	blo.w	.LBB6_16
@ %bb.1:
	ldr.w	r3, [r0, #2496]
	movw	r12, #45279
	movw	r10, #65534
	movw	r11, #64628
	movt	r12, #39176
	movt	r10, #32767
	cmp.w	r3, #624
	movt	r11, #65535
	str	r1, [sp, #16]                   @ 4-byte Spill
	blt.w	.LBB6_5
@ %bb.2:
	mov	r8, r0
	ldr	r3, [r8], #-28
	movs	r4, #0
	.p2align	2
.LBB6_3:                                @ =>This Inner Loop Header: Depth=1
	add.w	r5, r0, r4, lsl #2
	ldr	r2, [r5, #4]
	mov	r7, r11
	cmp	r4, #227
	it	lo
	movwlo	r7, #1588
	and	r3, r3, #-2147483648
	and.w	r6, r2, r10
	ldr	r7, [r5, r7]
	add	r3, r6
	eor.w	r3, r7, r3, lsr #1
	lsls	r6, r2, #31
	it	ne
	eorne.w	r3, r3, r12
	str	r3, [r8, #28]!
	and	r6, r2, #-2147483648
	ldrd	r7, r2, [r5, #8]
	ldr.w	r9, [r5, #16]
	and.w	r3, r7, r10
	add	r3, r6
	mov	r6, r11
	cmp	r4, #226
	it	lo
	movwlo	r6, #1588
	add	r6, r5
	ldr.w	lr, [r6, #4]
	lsls	r1, r7, #31
	eor.w	r3, lr, r3, lsr #1
	and	r1, r7, #-2147483648
	mov	r7, r11
	ldr	r6, [r5, #20]
	it	ne
	eorne.w	r3, r3, r12
	str	r3, [r5, #4]
	cmp	r4, #225
	it	lo
	movwlo	r7, #1588
	add	r7, r5
	and.w	r3, r2, r10
	ldr	r7, [r7, #8]
	add	r1, r3
	lsls	r3, r2, #31
	eor.w	r1, r7, r1, lsr #1
	mov	r3, r11
	it	ne
	eorne.w	r1, r1, r12
	str	r1, [r5, #8]
	cmp	r4, #224
	it	lo
	movwlo	r3, #1588
	add	r3, r5
	and	r1, r2, #-2147483648
	and.w	r2, r9, r10
	ldr	r3, [r3, #12]
	add	r1, r2
	eor.w	r1, r3, r1, lsr #1
	lsls.w	r2, r9, #31
	mov	r3, r11
	it	ne
	eorne.w	r1, r1, r12
	str	r1, [r5, #12]
	cmp	r4, #223
	it	lo
	movwlo	r3, #1588
	add	r3, r5
	and	r1, r9, #-2147483648
	and.w	r2, r6, r10
	ldr	r3, [r3, #16]
	add	r1, r2
	eor.w	r1, r3, r1, lsr #1
	lsls	r2, r6, #31
	it	ne
	eorne.w	r1, r1, r12
	mov	r7, r11
	str	r1, [r5, #16]
	ldr	r1, [r5, #24]
	cmp	r4, #222
	it	lo
	movwlo	r7, #1588
	add	r7, r5
	and	r2, r6, #-2147483648
	and.w	r3, r1, r10
	ldr	r7, [r7, #20]
	add	r2, r3
	eor.w	r2, r7, r2, lsr #1
	lsls	r3, r1, #31
	it	ne
	eorne.w	r2, r2, r12
	str	r2, [r5, #20]
	mov	r7, r11
	ldr.w	r3, [r8, #28]
	cmp	r4, #221
	it	lo
	movwlo	r7, #1588
	add	r7, r5
	and	r1, r1, #-2147483648
	and.w	r2, r3, r10
	ldr	r7, [r7, #24]
	add	r1, r2
	lsls	r2, r3, #31
	add.w	r4, r4, #7
	eor.w	r1, r7, r1, lsr #1
	movw	r2, #623
	it	ne
	eorne.w	r1, r1, r12
	cmp	r4, r2
	str	r1, [r5, #24]
	bne.w	.LBB6_3
@ %bb.4:
	ldr.w	r2, [r0, #2492]
	ldr	r3, [r0]
	and	r2, r2, #-2147483648
	and.w	r7, r3, r10
	ldr.w	r6, [r0, #1584]
	add	r2, r7
	eor.w	r2, r6, r2, lsr #1
	lsls	r3, r3, #31
	it	ne
	eorne.w	r2, r2, r12
	ldr	r1, [sp, #16]                   @ 4-byte Reload
	movs	r3, #0
	str.w	r2, [r0, #2492]
.LBB6_5:
	adds	r6, r3, #1
	str.w	r6, [r0, #2496]
	ldr.w	r2, [r0, r3, lsl #2]
	movw	r4, #22144
	movt	r4, #40236
	eor.w	r7, r2, r2, lsr #11
	movs	r5, #0
	and.w	r2, r4, r7, lsl #7
	movt	r5, #61382
	eors	r7, r2
	and.w	r2, r5, r7, lsl #15
	eors	r2, r7
	movw	r7, #623
	ldr.w	lr, [r0, #2504]
	ldr.w	r9, [r0, #2508]
	cmp	r3, r7
	lsr.w	r3, r2, #23
	addw	r8, r0, #2504
	eor.w	r3, r3, r2, lsr #5
	blt.w	.LBB6_9
@ %bb.6:
	mov	r5, r0
	strd	r3, lr, [sp]                    @ 8-byte Folded Spill
	ldr	r3, [r5], #-28
	strd	r9, r8, [sp, #8]                @ 8-byte Folded Spill
	mov.w	r8, #0
	.p2align	2
.LBB6_7:                                @ =>This Inner Loop Header: Depth=1
	add.w	r6, r0, r8, lsl #2
	ldr	r1, [r6, #4]
	mov	r4, r11
	cmp.w	r8, #227
	it	lo
	movwlo	r4, #1588
	and	r3, r3, #-2147483648
	and.w	r2, r1, r10
	ldr	r4, [r6, r4]
	add	r2, r3
	eor.w	r2, r4, r2, lsr #1
	lsls	r3, r1, #31
	it	ne
	eorne.w	r2, r2, r12
	str	r2, [r5, #28]!
	add.w	lr, r6, #8
	ldm.w	lr, {r2, r3, lr}
	and	r1, r1, #-2147483648
	and.w	r4, r2, r10
	add	r1, r4
	mov	r4, r11
	cmp.w	r8, #226
	it	lo
	movwlo	r4, #1588
	add	r4, r6
	ldr	r4, [r4, #4]
	ldr.w	r9, [r6, #20]
	eor.w	r1, r4, r1, lsr #1
	lsls	r4, r2, #31
	mov	r4, r11
	it	ne
	eorne.w	r1, r1, r12
	str	r1, [r6, #4]
	cmp.w	r8, #225
	it	lo
	movwlo	r4, #1588
	add	r4, r6
	and	r1, r2, #-2147483648
	and.w	r2, r3, r10
	ldr	r4, [r4, #8]
	add	r1, r2
	eor.w	r1, r4, r1, lsr #1
	lsls	r2, r3, #31
	it	ne
	eorne.w	r1, r1, r12
	str	r1, [r6, #8]
	and	r1, r3, #-2147483648
	mov	r3, r11
	cmp.w	r8, #224
	it	lo
	movwlo	r3, #1588
	add	r3, r6
	and.w	r2, lr, r10
	ldr	r3, [r3, #12]
	add	r1, r2
	eor.w	r1, r3, r1, lsr #1
	lsls.w	r2, lr, #31
	mov	r3, r11
	it	ne
	eorne.w	r1, r1, r12
	str	r1, [r6, #12]
	cmp.w	r8, #223
	it	lo
	movwlo	r3, #1588
	add	r3, r6
	and	r1, lr, #-2147483648
	and.w	r2, r9, r10
	ldr	r3, [r3, #16]
	add	r1, r2
	eor.w	r1, r3, r1, lsr #1
	lsls.w	r2, r9, #31
	it	ne
	eorne.w	r1, r1, r12
	mov	r4, r11
	str	r1, [r6, #16]
	ldr	r1, [r6, #24]
	cmp.w	r8, #222
	it	lo
	movwlo	r4, #1588
	add	r4, r6
	and	r2, r9, #-2147483648
	and.w	r3, r1, r10
	ldr	r4, [r4, #20]
	add	r2, r3
	eor.w	r2, r4, r2, lsr #1
	lsls	r3, r1, #31
	it	ne
	eorne.w	r2, r2, r12
	str	r2, [r6, #20]
	mov	r4, r11
	ldr	r3, [r5, #28]
	cmp.w	r8, #221
	it	lo
	movwlo	r4, #1588
	add	r4, r6
	and	r1, r1, #-2147483648
	and.w	r2, r3, r10
	ldr	r4, [r4, #24]
	add	r1, r2
	add.w	r8, r8, #7
	eor.w	r1, r4, r1, lsr #1
	lsls	r2, r3, #31
	it	ne
	eorne.w	r1, r1, r12
	cmp	r8, r7
	str	r1, [r6, #24]
	bne.w	.LBB6_7
@ %bb.8:
	ldr.w	r1, [r0, #2492]
	ldr	r3, [r0]
	and	r1, r1, #-2147483648
	and.w	r7, r3, r10
	ldr.w	r6, [r0, #1584]
	add	r1, r7
	eor.w	r1, r6, r1, lsr #1
	lsls	r3, r3, #31
	it	ne
	eorne.w	r1, r1, r12
	str.w	r1, [r0, #2492]
	ldrd	r8, r1, [sp, #12]               @ 8-byte Folded Reload
	movs	r5, #0
	ldrd	lr, r9, [sp, #4]                @ 8-byte Folded Reload
	movw	r4, #22144
	ldr	r3, [sp]                        @ 4-byte Reload
	movs	r6, #0
	movt	r5, #61382
	movt	r4, #40236
.LBB6_9:
	adds	r2, r6, #1
	str.w	r2, [r0, #2496]
	ldr.w	r0, [r0, r6, lsl #2]
	adds.w	r7, lr, #2
	eor.w	r0, r0, r0, lsr #11
	and.w	r2, r4, r0, lsl #7
	eor.w	r0, r0, r2
	and.w	r2, r5, r0, lsl #15
	eor.w	r0, r0, r2
	lsr.w	r2, r0, #24
	eor.w	r0, r2, r0, lsr #6
	orr.w	r0, r0, r3, lsl #26
	umull	r10, r0, r0, r1
	lsr.w	r2, r3, #6
	mla	r2, r2, r1, r0
	adc	r3, r9, #0
	lsrs	r0, r2, #21
	strd	r7, r3, [r8]
	beq	.LBB6_15
@ %bb.10:
	clz	r1, r0
	mov.w	r6, #-2147483648
	rsbs	r5, r1, #0
	add.w	r4, r1, #32
	lsl.w	r3, r6, r5
	cmp	r1, #0
	it	pl
	lsrpl.w	r3, r6, r1
	lsr.w	r6, r6, r4
	eor	r4, r4, #63
	mov.w	r12, #2
	rsb.w	r0, r4, #32
	it	pl
	movpl	r6, #0
	subs.w	r7, r4, #32
	lsr.w	r0, r12, r0
	it	pl
	lslpl.w	r0, r12, r7
	lsl.w	r7, r12, r4
	it	pl
	movpl	r7, #0
	subs	r4, r7, #1
	rsb.w	r8, r1, #32
	sbc	r0, r0, #0
	and.w	r12, r0, r2
	lsl.w	r0, r2, r1
	lsr.w	r1, r10, r8
	orrs	r1, r0
	and.w	r4, r4, r10
	cmp	r5, #0
	it	pl
	lsrpl.w	r1, r2, r5
	lsr.w	r2, r2, r8
	it	pl
	movpl	r2, #0
	subs	r0, r3, r4
	sbcs.w	r0, r6, r12
	blo	.LBB6_13
@ %bb.11:
	eor.w	r0, r4, r3
	eor.w	r3, r12, r6
	orrs	r0, r3
	bne	.LBB6_14
@ %bb.12:
	ands	r0, r1, #1
	beq	.LBB6_14
.LBB6_13:
	adds	r1, #1
	adc	r2, r2, #0
.LBB6_14:
	lsl.w	r0, r2, r8
	rsb.w	r2, r8, #32
	lsr.w	r2, r1, r2
	orrs	r0, r2
	subs.w	r2, r8, #32
	it	pl
	lslpl.w	r0, r1, r2
	lsrs	r0, r0, #21
	add	sp, #20
	pop.w	{r4, r5, r6, r7, r8, r9, r10, r11, pc}
	.p2align	2
.LBB6_15:
	movs	r0, #0
	add	sp, #20
	pop.w	{r4, r5, r6, r7, r8, r9, r10, r11, pc}
	.p2align	2
.LBB6_16:
	movw	r0, :lower16:.L.str.4
	movt	r0, :upper16:.L.str.4
	bl	credits_private_credits_fail
.Lfunc_end6:
	.size	credits_private_random_scaled, .Lfunc_end6-credits_private_random_scaled
	.cantunwind
	.fnend
                                        @ -- End function
	.globl	credits_private_random_below    @ -- Begin function credits_private_random_below
	.p2align	1
	.prefalign	2, .Lfunc_end7, nop
	.type	credits_private_random_below,%function
	.code	16
	.thumb_func
credits_private_random_below:           @ @credits_private_random_below
	.fnstart
@ %bb.0:
	.save	{r4, r5, r6, r7, lr}
	push	{r4, r5, r6, r7, lr}
	.pad	#4
	sub	sp, #4
	orrs.w	r1, r2, r3
	beq	.LBB7_4
@ %bb.1:
	mov	r6, r0
	clz	r0, r2
	adds	r0, #32
	mov	r4, r3
	mov	r5, r2
	cmp	r3, #0
	it	ne
	clzne	r0, r3
	rsb.w	r7, r0, #64
	.p2align	2
.LBB7_2:                                @ =>This Inner Loop Header: Depth=1
	mov	r0, r6
	mov	r1, r7
	bl	credits_private_random_bits
	subs	r2, r0, r5
	sbcs.w	r2, r1, r4
	bhs	.LBB7_2
@ %bb.3:
	add	sp, #4
	pop	{r4, r5, r6, r7, pc}
	.p2align	2
.LBB7_4:
	movw	r0, :lower16:.L.str.5
	movt	r0, :upper16:.L.str.5
	bl	credits_private_credits_fail
.Lfunc_end7:
	.size	credits_private_random_below, .Lfunc_end7-credits_private_random_below
	.cantunwind
	.fnend
                                        @ -- End function
	.globl	credits_private_random_int      @ -- Begin function credits_private_random_int
	.p2align	1
	.prefalign	2, .Lfunc_end8, nop
	.type	credits_private_random_int,%function
	.code	16
	.thumb_func
credits_private_random_int:             @ @credits_private_random_int
	.fnstart
@ %bb.0:
	.save	{r4, r5, r6, r7, r8, lr}
	push.w	{r4, r5, r6, r7, r8, lr}
	cmp	r2, r1
	blt	.LBB8_5
@ %bb.1:
	mov	r8, r1
	mov	r5, r0
	asrs	r0, r2, #31
	subs	r1, r2, r1
	sbc.w	r0, r0, r8, asr #31
	adds	r7, r1, #1
	adcs	r4, r0, #0
	mov.w	r0, #0
	adcs	r0, r0, #0
	bne	.LBB8_6
@ %bb.2:
	clz	r0, r7
	adds	r0, #32
	cmp	r4, #0
	it	ne
	clzne	r0, r4
	rsb.w	r6, r0, #64
	.p2align	2
.LBB8_3:                                @ =>This Inner Loop Header: Depth=1
	mov	r0, r5
	mov	r1, r6
	bl	credits_private_random_bits
	subs	r2, r0, r7
	sbcs	r1, r4
	bhs	.LBB8_3
@ %bb.4:
	add	r0, r8
	pop.w	{r4, r5, r6, r7, r8, pc}
	.p2align	2
.LBB8_5:
	movw	r0, :lower16:.L.str.6
	movt	r0, :upper16:.L.str.6
	bl	credits_private_credits_fail
	.p2align	2
.LBB8_6:
	movw	r0, :lower16:.L.str.5
	movt	r0, :upper16:.L.str.5
	bl	credits_private_credits_fail
.Lfunc_end8:
	.size	credits_private_random_int, .Lfunc_end8-credits_private_random_int
	.cantunwind
	.fnend
                                        @ -- End function
	.globl	scheduler_init                  @ -- Begin function scheduler_init
	.p2align	1
	.prefalign	2, .Lfunc_end9, nop
	.type	scheduler_init,%function
	.code	16
	.thumb_func
scheduler_init:                         @ @scheduler_init
	.fnstart
@ %bb.0:
	.save	{r4, r5, r6, r7, r8, r9, lr}
	push.w	{r4, r5, r6, r7, r8, r9, lr}
	.pad	#4
	sub	sp, #4
	mov	r6, r1
	mov	r7, r0
	ldrd	r9, r8, [sp, #32]
	adds	r0, #16
	movs	r1, #36
	mov	r4, r3
	mov	r5, r2
	bl	__aeabi_memclr4
	mov.w	r0, #-1
	strd	r8, r0, [r7, #20]
	lsls	r1, r4, #3
	mov	r0, r5
	strd	r6, r5, [r7]
	strd	r4, r9, [r7, #8]
	bl	__aeabi_memclr4
	add	sp, #4
	pop.w	{r4, r5, r6, r7, r8, r9, pc}
.Lfunc_end9:
	.size	scheduler_init, .Lfunc_end9-scheduler_init
	.cantunwind
	.fnend
                                        @ -- End function
	.globl	credits_private_scheduler_frame @ -- Begin function credits_private_scheduler_frame
	.p2align	1
	.prefalign	2, .Lfunc_end10, nop
	.type	credits_private_scheduler_frame,%function
	.code	16
	.thumb_func
credits_private_scheduler_frame:        @ @credits_private_scheduler_frame
	.fnstart
@ %bb.0:
	.save	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	push.w	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	.pad	#4
	sub	sp, #4
	mov	r11, r0
	ldr	r0, [r0, #4]
	add.w	r9, r0, r1, lsl #3
	ldr.w	r4, [r9, #4]
	cbz	r2, .LBB10_11
@ %bb.1:
	ldr.w	r0, [r11]
	mov	r10, r1
	add.w	r1, r1, r1, lsl #1
	add.w	r6, r0, r1, lsl #2
	ldr	r0, [r6, #4]
	cmp	r0, #1
	blt	.LBB10_11
@ %bb.2:
	sub.w	r8, r4, #1
	movs	r7, #0
	b	.LBB10_5
	.p2align	2
.LBB10_3:                               @   in Loop: Header=BB10_5 Depth=1
	ldr.w	r0, [r11, #28]
	ldr.w	r5, [r11, #44]
	mov	r1, r10
	mov	r2, r7
	mov	r3, r4
	blx	r5
.LBB10_4:                               @   in Loop: Header=BB10_5 Depth=1
	ldr	r0, [r6, #4]
	adds	r7, #1
	cmp	r7, r0
	bge	.LBB10_10
.LBB10_5:                               @ =>This Inner Loop Header: Depth=1
	ldr	r0, [r6, #8]
	ldr.w	r0, [r0, r7, lsl #2]
	cmp	r4, r0
	blt	.LBB10_4
@ %bb.6:                                @   in Loop: Header=BB10_5 Depth=1
	ldr.w	r3, [r11, #32]
	mov	r0, r10
	mov	r1, r7
	mov	r2, r4
	blx	r3
	cmp	r0, #0
	beq	.LBB10_4
@ %bb.7:                                @   in Loop: Header=BB10_5 Depth=1
	ldr.w	r0, [r9]
	cmp	r4, r0
	beq	.LBB10_3
@ %bb.8:                                @   in Loop: Header=BB10_5 Depth=1
	ldr	r0, [r6, #8]
	ldr.w	r0, [r0, r7, lsl #2]
	cmp	r4, r0
	beq	.LBB10_3
@ %bb.9:                                @   in Loop: Header=BB10_5 Depth=1
	ldr.w	r0, [r11, #28]
	ldr.w	r12, [r11, #40]
	mov	r1, r10
	mov	r2, r7
	mov	r3, r8
	blx	r12
	b	.LBB10_3
	.p2align	2
.LBB10_10:
	ldr.w	r4, [r9, #4]
.LBB10_11:
	adds	r0, r4, #1
	str.w	r0, [r9, #4]
	add	sp, #4
	pop.w	{r4, r5, r6, r7, r8, r9, r10, r11, pc}
.Lfunc_end10:
	.size	credits_private_scheduler_frame, .Lfunc_end10-credits_private_scheduler_frame
	.cantunwind
	.fnend
                                        @ -- End function
	.globl	credits_private_scheduler_start @ -- Begin function credits_private_scheduler_start
	.p2align	1
	.prefalign	2, .Lfunc_end11, nop
	.type	credits_private_scheduler_start,%function
	.code	16
	.thumb_func
credits_private_scheduler_start:        @ @credits_private_scheduler_start
	.fnstart
@ %bb.0:
	.save	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	push.w	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	.pad	#4
	sub	sp, #4
	cmp	r1, #0
	bmi.w	.LBB11_24
@ %bb.1:
	mov	r6, r0
	ldr	r0, [r0, #8]
	mov	r9, r1
	cmp	r1, r0
	bge.w	.LBB11_24
@ %bb.2:
	ldr	r0, [r6, #16]
	mov	r10, r2
	cbz	r3, .LBB11_5
@ %bb.3:
	ldr	r1, [r6, #20]
	cmp	r0, r1
	beq	.LBB11_23
.LBB11_4:
	ldr	r1, [r6, #12]
	adds	r2, r0, #1
	str	r2, [r6, #16]
	str.w	r9, [r1, r0, lsl #2]
	b	.LBB11_7
	.p2align	2
.LBB11_5:
	cmp	r0, #0
	beq	.LBB11_22
@ %bb.6:
	ldr	r0, [r6, #12]
	str.w	r9, [r0]
.LBB11_7:
	ldr	r0, [r6]
	add.w	r8, r9, r9, lsl #1
	add.w	r4, r0, r8, lsl #2
	ldr	r0, [r4, #4]
	cmp	r0, #0
	ble	.LBB11_21
@ %bb.8:
	movs	r7, #0
	.p2align	2
.LBB11_9:                               @ =>This Inner Loop Header: Depth=1
	ldr	r0, [r6, #28]
	ldr	r5, [r6, #36]
	mov	r1, r9
	mov	r2, r7
	movs	r3, #0
	blx	r5
	ldr	r0, [r4, #4]
	adds	r7, #1
	cmp	r7, r0
	blt	.LBB11_9
@ %bb.10:
	ldrd	r0, r1, [r6]
	add.w	r4, r0, r8, lsl #2
	ldr	r0, [r4, #4]
	add.w	r11, r1, r9, lsl #3
	mov	r8, r11
	cmp	r0, #1
	str	r10, [r8, #4]!
	str.w	r10, [r1, r9, lsl #3]
	blt	.LBB11_20
@ %bb.11:
	movs	r7, #0
	b	.LBB11_14
	.p2align	2
.LBB11_12:                              @   in Loop: Header=BB11_14 Depth=1
	ldr	r0, [r6, #28]
	ldr	r5, [r6, #44]
	mov	r1, r9
	mov	r2, r7
	mov	r3, r10
	blx	r5
.LBB11_13:                              @   in Loop: Header=BB11_14 Depth=1
	ldr	r0, [r4, #4]
	adds	r7, #1
	cmp	r7, r0
	bge	.LBB11_19
.LBB11_14:                              @ =>This Inner Loop Header: Depth=1
	ldr	r0, [r4, #8]
	ldr.w	r0, [r0, r7, lsl #2]
	cmp	r10, r0
	blt	.LBB11_13
@ %bb.15:                               @   in Loop: Header=BB11_14 Depth=1
	ldr	r3, [r6, #32]
	mov	r0, r9
	mov	r1, r7
	mov	r2, r10
	blx	r3
	cmp	r0, #0
	beq	.LBB11_13
@ %bb.16:                               @   in Loop: Header=BB11_14 Depth=1
	ldr.w	r0, [r11]
	cmp	r10, r0
	beq	.LBB11_12
@ %bb.17:                               @   in Loop: Header=BB11_14 Depth=1
	ldr	r0, [r4, #8]
	ldr.w	r0, [r0, r7, lsl #2]
	cmp	r10, r0
	beq	.LBB11_12
@ %bb.18:                               @   in Loop: Header=BB11_14 Depth=1
	ldr	r0, [r6, #28]
	ldr.w	r12, [r6, #40]
	mov	r1, r9
	mov	r2, r7
	sub.w	r3, r10, #1
	blx	r12
	b	.LBB11_12
	.p2align	2
.LBB11_19:
	ldr.w	r10, [r8]
.LBB11_20:
	add.w	r0, r10, #1
	str.w	r0, [r8]
	add	sp, #4
	pop.w	{r4, r5, r6, r7, r8, r9, r10, r11, pc}
	.p2align	2
.LBB11_21:
	ldr	r0, [r6, #4]
	add.w	r8, r0, r9, lsl #3
	str.w	r10, [r0, r9, lsl #3]
	str	r10, [r8, #4]!
	add.w	r0, r10, #1
	str.w	r0, [r8]
	add	sp, #4
	pop.w	{r4, r5, r6, r7, r8, r9, r10, r11, pc}
	.p2align	2
.LBB11_22:
	movs	r0, #0
	ldr	r1, [r6, #20]
	cmp	r0, r1
	bne.w	.LBB11_4
.LBB11_23:
	movw	r0, :lower16:.L.str.8
	movt	r0, :upper16:.L.str.8
	bl	credits_private_credits_fail
	.p2align	2
.LBB11_24:
	movw	r0, :lower16:.L.str.7
	movt	r0, :upper16:.L.str.7
	bl	credits_private_credits_fail
.Lfunc_end11:
	.size	credits_private_scheduler_start, .Lfunc_end11-credits_private_scheduler_start
	.cantunwind
	.fnend
                                        @ -- End function
	.globl	credits_private_scheduler_remove @ -- Begin function credits_private_scheduler_remove
	.p2align	1
	.prefalign	2, .Lfunc_end12, nop
	.type	credits_private_scheduler_remove,%function
	.code	16
	.thumb_func
credits_private_scheduler_remove:       @ @credits_private_scheduler_remove
	.fnstart
@ %bb.0:
	.save	{r4, r5, r6, r7, r8, lr}
	push.w	{r4, r5, r6, r7, r8, lr}
	ldr.w	lr, [r0, #16]
	cmp.w	lr, #1
	blt	.LBB12_10
@ %bb.1:
	ldr	r3, [r0, #12]
	mov	r12, r0
	rsb.w	r4, lr, #0
	add.w	r0, r3, #12
	sub.w	r8, lr, #1
	movs	r2, #0
	.p2align	2
.LBB12_2:                               @ =>This Inner Loop Header: Depth=1
	ldr	r6, [r0, #-12]
	cmp	r6, r1
	add.w	r6, r3, r2, lsl #2
	beq	.LBB12_11
@ %bb.3:                                @   in Loop: Header=BB12_2 Depth=1
	cmp	r8, r2
	beq	.LBB12_10
@ %bb.4:                                @   in Loop: Header=BB12_2 Depth=1
	ldr	r7, [r6, #4]
	cmp	r7, r1
	beq	.LBB12_12
@ %bb.5:                                @   in Loop: Header=BB12_2 Depth=1
	adds	r7, r4, r2
	adds	r5, r7, #2
	beq	.LBB12_10
@ %bb.6:                                @   in Loop: Header=BB12_2 Depth=1
	ldr	r5, [r6, #8]
	cmp	r5, r1
	beq	.LBB12_13
@ %bb.7:                                @   in Loop: Header=BB12_2 Depth=1
	adds	r5, r7, #3
	it	eq
	popeq.w	{r4, r5, r6, r7, r8, pc}
.LBB12_8:                               @   in Loop: Header=BB12_2 Depth=1
	mov	r6, r0
	ldr	r5, [r6], #16
	cmp	r5, r1
	beq	.LBB12_14
@ %bb.9:                                @   in Loop: Header=BB12_2 Depth=1
	adds	r2, #4
	cmp	lr, r2
	mov	r0, r6
	bne	.LBB12_2
.LBB12_10:
	pop.w	{r4, r5, r6, r7, r8, pc}
	.p2align	2
.LBB12_11:
	mov	r4, r12
	mov	r0, r6
	b	.LBB12_15
	.p2align	2
.LBB12_12:
	orr	r0, r2, #1
	mov	r4, r12
	add.w	r0, r3, r0, lsl #2
	adds	r2, #1
	b	.LBB12_15
	.p2align	2
.LBB12_13:
	orr	r0, r2, #2
	mov	r4, r12
	add.w	r0, r3, r0, lsl #2
	adds	r2, #2
	b	.LBB12_15
	.p2align	2
.LBB12_14:
	mov	r4, r12
	adds	r2, #3
.LBB12_15:
	mvns	r2, r2
	add	r2, lr
	adds	r1, r0, #4
	lsls	r2, r2, #2
	bl	__aeabi_memmove4
	ldr	r0, [r4, #16]
	subs	r0, #1
	str	r0, [r4, #16]
	pop.w	{r4, r5, r6, r7, r8, pc}
.Lfunc_end12:
	.size	credits_private_scheduler_remove, .Lfunc_end12-credits_private_scheduler_remove
	.cantunwind
	.fnend
                                        @ -- End function
	.globl	credits_private_scheduler_next  @ -- Begin function credits_private_scheduler_next
	.p2align	1
	.prefalign	2, .Lfunc_end13, nop
	.type	credits_private_scheduler_next,%function
	.code	16
	.thumb_func
credits_private_scheduler_next:         @ @credits_private_scheduler_next
	.fnstart
@ %bb.0:
	.save	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	push.w	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	.pad	#4
	sub	sp, #4
	ldr	r3, [r0, #16]
	mov	r11, r0
	cmp	r3, #1
	blt.w	.LBB13_22
@ %bb.1:
	cmp	r1, #0
	beq	.LBB13_14
@ %bb.2:
	mov.w	r9, #0
	b	.LBB13_5
	.p2align	2
.LBB13_3:                               @   in Loop: Header=BB13_5 Depth=1
	ldr.w	r5, [r10, #4]
	ldr.w	r3, [r11, #16]
.LBB13_4:                               @   in Loop: Header=BB13_5 Depth=1
	add.w	r9, r9, #1
	adds	r0, r5, #1
	cmp	r9, r3
	str.w	r0, [r10, #4]
	bge.w	.LBB13_22
.LBB13_5:                               @ =>This Loop Header: Depth=1
                                        @     Child Loop BB13_9 Depth 2
	ldr.w	r0, [r11, #12]
	ldrd	r1, r2, [r11]
	ldr.w	r8, [r0, r9, lsl #2]
	add.w	r0, r8, r8, lsl #1
	add.w	r4, r1, r0, lsl #2
	add.w	r10, r2, r8, lsl #3
	ldr	r0, [r4, #4]
	ldr.w	r5, [r10, #4]
	cmp	r0, #1
	blt	.LBB13_4
@ %bb.6:                                @   in Loop: Header=BB13_5 Depth=1
	movs	r7, #0
	b	.LBB13_9
	.p2align	2
.LBB13_7:                               @   in Loop: Header=BB13_9 Depth=2
	ldr.w	r0, [r11, #28]
	ldr.w	r6, [r11, #44]
	mov	r1, r8
	mov	r2, r7
	mov	r3, r5
	blx	r6
.LBB13_8:                               @   in Loop: Header=BB13_9 Depth=2
	ldr	r0, [r4, #4]
	adds	r7, #1
	cmp	r7, r0
	bge	.LBB13_3
.LBB13_9:                               @   Parent Loop BB13_5 Depth=1
                                        @ =>  This Inner Loop Header: Depth=2
	ldr	r0, [r4, #8]
	ldr.w	r0, [r0, r7, lsl #2]
	cmp	r5, r0
	blt	.LBB13_8
@ %bb.10:                               @   in Loop: Header=BB13_9 Depth=2
	ldr.w	r3, [r11, #32]
	mov	r0, r8
	mov	r1, r7
	mov	r2, r5
	blx	r3
	cmp	r0, #0
	beq	.LBB13_8
@ %bb.11:                               @   in Loop: Header=BB13_9 Depth=2
	ldr.w	r0, [r10]
	cmp	r5, r0
	beq	.LBB13_7
@ %bb.12:                               @   in Loop: Header=BB13_9 Depth=2
	ldr	r0, [r4, #8]
	ldr.w	r0, [r0, r7, lsl #2]
	cmp	r5, r0
	beq	.LBB13_7
@ %bb.13:                               @   in Loop: Header=BB13_9 Depth=2
	ldr.w	r0, [r11, #28]
	ldr.w	r12, [r11, #40]
	mov	r1, r8
	mov	r2, r7
	subs	r3, r5, #1
	blx	r12
	b	.LBB13_7
	.p2align	2
.LBB13_14:
	ldr.w	r0, [r11, #4]
	ldr.w	r2, [r11, #12]
	and	r1, r3, #3
	lsrs	r6, r3, #2
	mov.w	r3, #0
	beq	.LBB13_19
@ %bb.15:
	bic	r6, r6, #-536870912
	sub.w	r7, r2, #16
	sub.w	r6, r3, r6, lsl #2
	.p2align	2
.LBB13_16:                              @ =>This Inner Loop Header: Depth=1
	ldr	r5, [r7, #16]!
	subs	r3, #4
	add.w	r5, r0, r5, lsl #3
	ldr	r4, [r5, #4]
	cmp	r6, r3
	add.w	r4, r4, #1
	str	r4, [r5, #4]
	ldr	r5, [r7, #4]
	add.w	r5, r0, r5, lsl #3
	ldr	r4, [r5, #4]
	add.w	r4, r4, #1
	str	r4, [r5, #4]
	ldr	r5, [r7, #8]
	add.w	r5, r0, r5, lsl #3
	ldr	r4, [r5, #4]
	add.w	r4, r4, #1
	str	r4, [r5, #4]
	ldr	r5, [r7, #12]
	add.w	r5, r0, r5, lsl #3
	ldr	r4, [r5, #4]
	add.w	r4, r4, #1
	str	r4, [r5, #4]
	bne	.LBB13_16
@ %bb.17:
	cbz	r1, .LBB13_22
@ %bb.18:
	rsbs	r3, r3, #0
.LBB13_19:
	ldr.w	r7, [r2, r3, lsl #2]
	cmp	r1, #1
	add.w	r7, r0, r7, lsl #3
	ldr	r6, [r7, #4]
	add.w	r6, r6, #1
	str	r6, [r7, #4]
	beq	.LBB13_22
@ %bb.20:
	add.w	r2, r2, r3, lsl #2
	ldr	r3, [r2, #4]
	cmp	r1, #2
	add.w	r3, r0, r3, lsl #3
	ldr	r7, [r3, #4]
	add.w	r7, r7, #1
	str	r7, [r3, #4]
	beq	.LBB13_22
@ %bb.21:
	ldr	r1, [r2, #8]
	add.w	r0, r0, r1, lsl #3
	ldr	r1, [r0, #4]
	adds	r1, #1
	str	r1, [r0, #4]
.LBB13_22:
	ldr.w	r0, [r11, #24]
	ldr.w	r2, [r11, #48]
	adds	r1, r0, #1
	str.w	r1, [r11, #24]
	cbz	r2, .LBB13_24
@ %bb.23:
	ldr.w	r0, [r11, #28]
	add	sp, #4
	pop.w	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	bx	r2
	.p2align	2
.LBB13_24:
	add	sp, #4
	pop.w	{r4, r5, r6, r7, r8, r9, r10, r11, pc}
.Lfunc_end13:
	.size	credits_private_scheduler_next, .Lfunc_end13-credits_private_scheduler_next
	.cantunwind
	.fnend
                                        @ -- End function
	.globl	credits_private_scene_due       @ -- Begin function credits_private_scene_due
	.p2align	2
	.type	credits_private_scene_due,%function
	.code	16
	.thumb_func
credits_private_scene_due:              @ @credits_private_scene_due
	.fnstart
@ %bb.0:
	cmp	r0, #21
	bhi.w	.LBB14_49
@ %bb.1:
	mov	r3, r0
	mov	r0, r1
.LCPI14_0:
	tbh	[pc, r3, lsl #1]
@ %bb.2:
.LJTI14_0:
	.short	(.LBB14_3-(.LCPI14_0+4))/2
	.short	(.LBB14_3-(.LCPI14_0+4))/2
	.short	(.LBB14_3-(.LCPI14_0+4))/2
	.short	(.LBB14_26-(.LCPI14_0+4))/2
	.short	(.LBB14_43-(.LCPI14_0+4))/2
	.short	(.LBB14_4-(.LCPI14_0+4))/2
	.short	(.LBB14_3-(.LCPI14_0+4))/2
	.short	(.LBB14_17-(.LCPI14_0+4))/2
	.short	(.LBB14_8-(.LCPI14_0+4))/2
	.short	(.LBB14_8-(.LCPI14_0+4))/2
	.short	(.LBB14_4-(.LCPI14_0+4))/2
	.short	(.LBB14_21-(.LCPI14_0+4))/2
	.short	(.LBB14_34-(.LCPI14_0+4))/2
	.short	(.LBB14_13-(.LCPI14_0+4))/2
	.short	(.LBB14_27-(.LCPI14_0+4))/2
	.short	(.LBB14_11-(.LCPI14_0+4))/2
	.short	(.LBB14_32-(.LCPI14_0+4))/2
	.short	(.LBB14_5-(.LCPI14_0+4))/2
	.short	(.LBB14_39-(.LCPI14_0+4))/2
	.short	(.LBB14_46-(.LCPI14_0+4))/2
	.short	(.LBB14_4-(.LCPI14_0+4))/2
	.short	(.LBB14_5-(.LCPI14_0+4))/2
	.p2align	1
	.p2align	2
.LBB14_3:
	clz	r0, r0
	lsrs	r0, r0, #5
	bx	lr
	.p2align	2
.LBB14_4:
	cmp	r0, #2
	b	.LBB14_6
	.p2align	2
.LBB14_5:
	cmp	r0, #4
.LBB14_6:
	mov.w	r0, #0
	it	lo
	movlo	r0, #1
.LBB14_7:
	bx	lr
	.p2align	2
.LBB14_8:
	cmp	r0, #1
	mov.w	r1, #0
	beq.w	.LBB14_50
@ %bb.9:
	cmp	r0, #0
	mov.w	r0, #0
	it	ne
	bxne	lr
.LBB14_10:
	asrs	r0, r2, #31
	add.w	r0, r2, r0, lsr #26
	bic	r0, r0, #63
	subs	r0, r2, r0
	cmp	r0, #48
	mov.w	r0, #0
	it	lt
	movlt	r0, #1
	and	r1, r2, #3
	clz	r1, r1
	lsrs	r1, r1, #5
	ands	r0, r1
	bx	lr
	.p2align	2
.LBB14_11:
	subs	r1, r0, #2
	cmp	r1, #2
	itt	lo
	movlo	r0, #1
	bxlo	lr
.LBB14_12:
	cmp	r0, #1
	bne.w	.LBB14_47
	b	.LBB14_51
	.p2align	2
.LBB14_13:
	cmp	r0, #7
	bhi.w	.LBB14_49
@ %bb.14:
.LCPI14_1:
	tbh	[pc, r0, lsl #1]
@ %bb.15:
.LJTI14_3:
	.short	(.LBB14_48-(.LCPI14_1+4))/2
	.short	(.LBB14_48-(.LCPI14_1+4))/2
	.short	(.LBB14_16-(.LCPI14_1+4))/2
	.short	(.LBB14_62-(.LCPI14_1+4))/2
	.short	(.LBB14_61-(.LCPI14_1+4))/2
	.short	(.LBB14_64-(.LCPI14_1+4))/2
	.short	(.LBB14_65-(.LCPI14_1+4))/2
	.short	(.LBB14_63-(.LCPI14_1+4))/2
	.p2align	1
	.p2align	2
.LBB14_16:
	subs	r0, r2, #2
	clz	r0, r0
	lsrs	r0, r0, #5
	bx	lr
	.p2align	2
.LBB14_17:
	cmp	r0, #11
	bhi.w	.LBB14_49
@ %bb.18:
.LCPI14_2:
	tbh	[pc, r0, lsl #1]
@ %bb.19:
.LJTI14_6:
	.short	(.LBB14_20-(.LCPI14_2+4))/2
	.short	(.LBB14_72-(.LCPI14_2+4))/2
	.short	(.LBB14_69-(.LCPI14_2+4))/2
	.short	(.LBB14_70-(.LCPI14_2+4))/2
	.short	(.LBB14_67-(.LCPI14_2+4))/2
	.short	(.LBB14_73-(.LCPI14_2+4))/2
	.short	(.LBB14_74-(.LCPI14_2+4))/2
	.short	(.LBB14_71-(.LCPI14_2+4))/2
	.short	(.LBB14_76-(.LCPI14_2+4))/2
	.short	(.LBB14_68-(.LCPI14_2+4))/2
	.short	(.LBB14_75-(.LCPI14_2+4))/2
	.short	(.LBB14_66-(.LCPI14_2+4))/2
	.p2align	1
	.p2align	2
.LBB14_20:
	sub.w	r0, r2, #64
	clz	r0, r0
	lsrs	r0, r0, #5
	bx	lr
	.p2align	2
.LBB14_21:
	cmp	r0, #4
	bhi.w	.LBB14_49
@ %bb.22:
	mov	r1, r0
	movs	r0, #1
.LCPI14_3:
	tbb	[pc, r1]
@ %bb.23:
.LJTI14_5:
	.byte	(.LBB14_25-(.LCPI14_3+4))/2
	.byte	(.LBB14_57-(.LCPI14_3+4))/2
	.byte	(.LBB14_53-(.LCPI14_3+4))/2
	.byte	(.LBB14_52-(.LCPI14_3+4))/2
	.byte	(.LBB14_24-(.LCPI14_3+4))/2
	.p2align	1
	.p2align	2
.LBB14_24:
	b	.LBB14_7
	.p2align	2
.LBB14_25:
	cmp.w	r2, #512
	mov.w	r0, #0
	it	lt
	movlt	r0, #1
	bx	lr
	.p2align	2
.LBB14_26:
	cmp	r0, #1
	bne	.LBB14_44
	b	.LBB14_7
	.p2align	2
.LBB14_27:
	cmp	r0, #6
	bhi	.LBB14_49
@ %bb.28:
	mov	r1, r0
	movs	r0, #1
.LCPI14_4:
	tbb	[pc, r1]
@ %bb.29:
.LJTI14_2:
	.byte	(.LBB14_48-(.LCPI14_4+4))/2
	.byte	(.LBB14_51-(.LCPI14_4+4))/2
	.byte	(.LBB14_60-(.LCPI14_4+4))/2
	.byte	(.LBB14_30-(.LCPI14_4+4))/2
	.byte	(.LBB14_31-(.LCPI14_4+4))/2
	.byte	(.LBB14_30-(.LCPI14_4+4))/2
	.byte	(.LBB14_31-(.LCPI14_4+4))/2
	.p2align	1
	.p2align	2
.LBB14_30:
	b	.LBB14_7
	.p2align	2
.LBB14_31:
	cmp	r2, #240
	mov.w	r0, #0
	it	lt
	movlt	r0, #1
	bx	lr
	.p2align	2
.LBB14_32:
	cmp	r0, #1
	beq	.LBB14_48
@ %bb.33:
	cmp	r0, #0
	itt	ne
	movne	r0, #0
	bxne	lr
	b	.LBB14_48
	.p2align	2
.LBB14_34:
	cmp	r0, #4
	bhi	.LBB14_49
@ %bb.35:
	mov	r1, r0
	movs	r0, #1
.LCPI14_5:
	tbb	[pc, r1]
@ %bb.36:
.LJTI14_4:
	.byte	(.LBB14_38-(.LCPI14_5+4))/2
	.byte	(.LBB14_58-(.LCPI14_5+4))/2
	.byte	(.LBB14_53-(.LCPI14_5+4))/2
	.byte	(.LBB14_52-(.LCPI14_5+4))/2
	.byte	(.LBB14_37-(.LCPI14_5+4))/2
	.p2align	1
	.p2align	2
.LBB14_37:
	b	.LBB14_7
	.p2align	2
.LBB14_38:
	and	r0, r2, #63
	clz	r0, r0
	lsrs	r0, r0, #5
	cmp.w	r2, #512
	b	.LBB14_59
	.p2align	2
.LBB14_39:
	cmp	r0, #4
	itt	hi
	movhi	r0, #0
	bxhi	lr
.LBB14_40:
.LCPI14_6:
	tbb	[pc, r0]
@ %bb.41:
.LJTI14_1:
	.byte	(.LBB14_42-(.LCPI14_6+4))/2
	.byte	(.LBB14_55-(.LCPI14_6+4))/2
	.byte	(.LBB14_48-(.LCPI14_6+4))/2
	.byte	(.LBB14_56-(.LCPI14_6+4))/2
	.byte	(.LBB14_54-(.LCPI14_6+4))/2
	.p2align	1
	.p2align	2
.LBB14_42:
	movs	r0, #0
	cmp	r2, #20
	it	lt
	movlt	r0, #1
	bics	r0, r2
	bx	lr
	.p2align	2
.LBB14_43:
	subs	r1, r0, #1
	cmp	r1, #4
	itt	lo
	movlo	r0, #1
	bxlo	lr
.LBB14_44:
	cbnz	r0, .LBB14_49
@ %bb.45:
	movs	r0, #1
	bics	r0, r2
	bx	lr
	.p2align	2
.LBB14_46:
	cmp	r0, #1
	beq.w	.LBB14_7
.LBB14_47:
	cbnz	r0, .LBB14_49
.LBB14_48:
	clz	r0, r2
	lsrs	r0, r0, #5
	bx	lr
	.p2align	2
.LBB14_49:
	movs	r0, #0
	bx	lr
	.p2align	2
.LBB14_50:
	asrs	r0, r2, #31
	add.w	r0, r2, r0, lsr #26
	bic	r0, r0, #63
	subs	r0, r2, r0
	cmp	r0, #47
	it	gt
	movgt	r1, #1
	bic.w	r0, r1, r2
	bx	lr
	.p2align	2
.LBB14_51:
	subs	r0, r2, #1
	clz	r0, r0
	lsrs	r0, r0, #5
	bx	lr
	.p2align	2
.LBB14_52:
	and	r0, r2, #3
	clz	r0, r0
	lsrs	r0, r0, #5
	cmp.w	r2, #1024
	b	.LBB14_59
	.p2align	2
.LBB14_53:
	sub.w	r0, r2, #764
	clz	r0, r0
	lsrs	r0, r0, #5
	bx	lr
	.p2align	2
.LBB14_54:
	sub.w	r0, r2, #968
	clz	r0, r0
	lsrs	r0, r0, #5
	bx	lr
	.p2align	2
.LBB14_55:
	sub.w	r0, r2, #20
	clz	r0, r0
	lsrs	r0, r0, #5
	bx	lr
	.p2align	2
.LBB14_56:
	and	r0, r2, #7
	clz	r0, r0
	lsrs	r0, r0, #5
	cmp.w	r2, #976
	b	.LBB14_59
	.p2align	2
.LBB14_57:
	cmp.w	r2, #764
	mov.w	r0, #0
	it	lt
	movlt	r0, #1
	bx	lr
	.p2align	2
.LBB14_58:
	and	r0, r2, #31
	clz	r0, r0
	lsrs	r0, r0, #5
	cmp.w	r2, #768
.LBB14_59:
	mov.w	r1, #0
	it	lt
	movlt	r1, #1
	ands	r0, r1
	bx	lr
	.p2align	2
.LBB14_60:
	movs	r0, #0
	and	r1, r2, #7
	cmp	r2, #240
	it	lt
	movlt	r0, #1
	clz	r1, r1
	lsrs	r1, r1, #5
	ands	r0, r1
	bx	lr
	.p2align	2
.LBB14_61:
	subs	r0, r2, #4
	clz	r0, r0
	lsrs	r0, r0, #5
	bx	lr
	.p2align	2
.LBB14_62:
	subs	r0, r2, #3
	clz	r0, r0
	lsrs	r0, r0, #5
	bx	lr
	.p2align	2
.LBB14_63:
	subs	r0, r2, #7
	clz	r0, r0
	lsrs	r0, r0, #5
	bx	lr
	.p2align	2
.LBB14_64:
	subs	r0, r2, #5
	clz	r0, r0
	lsrs	r0, r0, #5
	bx	lr
	.p2align	2
.LBB14_65:
	subs	r0, r2, #6
	clz	r0, r0
	lsrs	r0, r0, #5
	bx	lr
	.p2align	2
.LBB14_66:
	sub.w	r0, r2, #768
	clz	r0, r0
	lsrs	r0, r0, #5
	bx	lr
	.p2align	2
.LBB14_67:
	sub.w	r0, r2, #320
	clz	r0, r0
	lsrs	r0, r0, #5
	bx	lr
	.p2align	2
.LBB14_68:
	sub.w	r0, r2, #640
	clz	r0, r0
	lsrs	r0, r0, #5
	bx	lr
	.p2align	2
.LBB14_69:
	sub.w	r0, r2, #192
	clz	r0, r0
	lsrs	r0, r0, #5
	bx	lr
	.p2align	2
.LBB14_70:
	sub.w	r0, r2, #256
	clz	r0, r0
	lsrs	r0, r0, #5
	bx	lr
	.p2align	2
.LBB14_71:
	sub.w	r0, r2, #512
	clz	r0, r0
	lsrs	r0, r0, #5
	bx	lr
	.p2align	2
.LBB14_72:
	sub.w	r0, r2, #128
	clz	r0, r0
	lsrs	r0, r0, #5
	bx	lr
	.p2align	2
.LBB14_73:
	sub.w	r0, r2, #384
	clz	r0, r0
	lsrs	r0, r0, #5
	bx	lr
	.p2align	2
.LBB14_74:
	sub.w	r0, r2, #448
	clz	r0, r0
	lsrs	r0, r0, #5
	bx	lr
	.p2align	2
.LBB14_75:
	sub.w	r0, r2, #704
	clz	r0, r0
	lsrs	r0, r0, #5
	bx	lr
	.p2align	2
.LBB14_76:
	sub.w	r0, r2, #576
	clz	r0, r0
	lsrs	r0, r0, #5
	bx	lr
.Lfunc_end14:
	.size	credits_private_scene_due, .Lfunc_end14-credits_private_scene_due
	.cantunwind
	.fnend
                                        @ -- End function
	.globl	credits_private_corrupt_text    @ -- Begin function credits_private_corrupt_text
	.p2align	1
	.prefalign	2, .Lfunc_end15, nop
	.type	credits_private_corrupt_text,%function
	.code	16
	.thumb_func
credits_private_corrupt_text:           @ @credits_private_corrupt_text
	.fnstart
@ %bb.0:
	.save	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	push.w	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	.pad	#20
	sub	sp, #20
	movw	r6, #22144
	movw	r11, #45279
	movw	r8, #65534
	movw	r9, #64628
	mov	r10, r0
	movt	r6, #40236
	movt	r11, #39176
	movt	r8, #32767
	addw	r0, r0, #2504
	movt	r9, #65535
	strd	r3, r2, [sp]                    @ 8-byte Folded Spill
	str	r1, [sp, #12]                   @ 4-byte Spill
	str	r0, [sp, #8]                    @ 4-byte Spill
	b	.LBB15_3
	.p2align	2
.LBB15_1:                               @   in Loop: Header=BB15_3 Depth=1
	ldr	r1, [sp, #8]                    @ 4-byte Reload
	lsrs	r0, r0, #28
	strd	r4, r7, [r1]
	movw	r1, :lower16:credits_private_corrupt_text.replacements
	movt	r1, :upper16:credits_private_corrupt_text.replacements
	ldrb	r0, [r1, r0]
	ldr	r1, [sp, #12]                   @ 4-byte Reload
	strb	r0, [r1]
	.p2align	2
.LBB15_2:                               @   in Loop: Header=BB15_3 Depth=1
	ldr	r0, [sp, #12]                   @ 4-byte Reload
	adds	r0, #1
	str	r0, [sp, #12]                   @ 4-byte Spill
.LBB15_3:                               @ =>This Loop Header: Depth=1
                                        @     Child Loop BB15_8 Depth 2
                                        @       Child Loop BB15_10 Depth 3
                                        @     Child Loop BB15_15 Depth 2
                                        @       Child Loop BB15_17 Depth 3
	ldr	r0, [sp, #12]                   @ 4-byte Reload
	ldrb	r0, [r0]
	cmp	r0, #10
	beq	.LBB15_2
@ %bb.4:                                @   in Loop: Header=BB15_3 Depth=1
	cmp	r0, #0
	beq.w	.LBB15_19
@ %bb.5:                                @   in Loop: Header=BB15_3 Depth=1
	ldr	r0, [sp, #8]                    @ 4-byte Reload
	ldr.w	r5, [r10, #2496]
	ldrd	r4, r7, [r0]
	b	.LBB15_8
	.p2align	2
.LBB15_6:                               @   in Loop: Header=BB15_8 Depth=2
	ldr.w	r0, [r10, #2492]
	ldr.w	r1, [r10]
	and	r0, r0, #-2147483648
	and.w	r2, r1, r8
	ldr.w	r3, [r10, #1584]
	add	r0, r2
	eor.w	r0, r3, r0, lsr #1
	lsls	r1, r1, #31
	it	ne
	eorne.w	r0, r0, r11
	movw	r6, #22144
	ldr	r7, [sp, #16]                   @ 4-byte Reload
	movs	r5, #0
	movt	r6, #40236
	mov	r4, lr
	str.w	r0, [r10, #2492]
.LBB15_7:                               @   in Loop: Header=BB15_8 Depth=2
	mov	r0, r5
	adds	r5, #1
	str.w	r5, [r10, #2496]
	ldr.w	r0, [r10, r0, lsl #2]
	adds	r4, #1
	eor.w	r0, r0, r0, lsr #11
	and.w	r1, r6, r0, lsl #7
	eor.w	r0, r0, r1
	movw	r1, #0
	movt	r1, #61376
	and.w	r1, r1, r0, lsl #15
	eor.w	r0, r0, r1
	lsr.w	r1, r0, #25
	adc	r7, r7, #0
	cmp	r1, #124
	bls.w	.LBB15_11
.LBB15_8:                               @   Parent Loop BB15_3 Depth=1
                                        @ =>  This Loop Header: Depth=2
                                        @       Child Loop BB15_10 Depth 3
	cmp.w	r5, #624
	blt	.LBB15_7
@ %bb.9:                                @   in Loop: Header=BB15_8 Depth=2
	ldr.w	r3, [r10]
	mov	lr, r4
	movs	r2, #0
	sub.w	r12, r10, #28
	str	r7, [sp, #16]                   @ 4-byte Spill
	.p2align	2
.LBB15_10:                              @   Parent Loop BB15_3 Depth=1
                                        @     Parent Loop BB15_8 Depth=2
                                        @ =>    This Inner Loop Header: Depth=3
	add.w	r1, r10, r2, lsl #2
	ldr	r5, [r1, #4]
	mov	r7, r9
	cmp	r2, #227
	it	lo
	movwlo	r7, #1588
	and	r3, r3, #-2147483648
	and.w	r4, r5, r8
	ldr	r7, [r1, r7]
	add	r3, r4
	eor.w	r3, r7, r3, lsr #1
	lsls	r7, r5, #31
	it	ne
	eorne.w	r3, r3, r11
	str	r3, [r12, #28]!
	ldrd	r7, r4, [r1, #8]
	and	r3, r5, #-2147483648
	and.w	r6, r7, r8
	add	r6, r3
	mov	r3, r9
	ldr	r5, [r1, #16]
	cmp	r2, #226
	it	lo
	movwlo	r3, #1588
	add	r3, r1
	ldr	r0, [r3, #4]
	ldr	r3, [r1, #20]
	eor.w	r0, r0, r6, lsr #1
	lsls	r6, r7, #31
	mov	r6, r9
	it	ne
	eorne.w	r0, r0, r11
	str	r0, [r1, #4]
	cmp	r2, #225
	it	lo
	movwlo	r6, #1588
	add	r6, r1
	and	r0, r7, #-2147483648
	and.w	r7, r4, r8
	ldr	r6, [r6, #8]
	add	r0, r7
	eor.w	r0, r6, r0, lsr #1
	lsls	r7, r4, #31
	mov	r6, r9
	it	ne
	eorne.w	r0, r0, r11
	str	r0, [r1, #8]
	cmp	r2, #224
	it	lo
	movwlo	r6, #1588
	add	r6, r1
	and	r0, r4, #-2147483648
	and.w	r7, r5, r8
	ldr	r6, [r6, #12]
	add	r0, r7
	eor.w	r0, r6, r0, lsr #1
	lsls	r7, r5, #31
	mov	r6, r9
	it	ne
	eorne.w	r0, r0, r11
	str	r0, [r1, #12]
	cmp	r2, #223
	it	lo
	movwlo	r6, #1588
	add	r6, r1
	and	r0, r5, #-2147483648
	and.w	r7, r3, r8
	ldr	r6, [r6, #16]
	add	r0, r7
	eor.w	r0, r6, r0, lsr #1
	lsls	r7, r3, #31
	it	ne
	eorne.w	r0, r0, r11
	mov	r6, r9
	str	r0, [r1, #16]
	ldr	r0, [r1, #24]
	cmp	r2, #222
	it	lo
	movwlo	r6, #1588
	add	r6, r1
	and	r3, r3, #-2147483648
	and.w	r7, r0, r8
	ldr	r6, [r6, #20]
	add	r3, r7
	eor.w	r3, r6, r3, lsr #1
	lsls	r7, r0, #31
	it	ne
	eorne.w	r3, r3, r11
	str	r3, [r1, #20]
	mov	r6, r9
	ldr.w	r3, [r12, #28]
	cmp	r2, #221
	it	lo
	movwlo	r6, #1588
	add	r6, r1
	and	r0, r0, #-2147483648
	and.w	r7, r3, r8
	ldr	r6, [r6, #24]
	add	r0, r7
	adds	r2, #7
	eor.w	r0, r6, r0, lsr #1
	lsls	r7, r3, #31
	movw	r4, #623
	it	ne
	eorne.w	r0, r0, r11
	cmp	r2, r4
	str	r0, [r1, #24]
	bne.w	.LBB15_10
	b	.LBB15_6
	.p2align	2
.LBB15_11:                              @   in Loop: Header=BB15_3 Depth=1
	movs	r1, #1
	add.w	r0, r1, r0, lsr #22
	ldr	r1, [sp, #4]                    @ 4-byte Reload
	cmp	r0, r1
	ldr	r0, [sp, #8]                    @ 4-byte Reload
	strd	r4, r7, [r0]
	bge.w	.LBB15_2
@ %bb.12:                               @   in Loop: Header=BB15_3 Depth=1
	ldr	r0, [sp, #12]                   @ 4-byte Reload
	movs	r2, #4
	ldrb	r1, [r0]
	movw	r0, :lower16:.L.str.31
	movt	r0, :upper16:.L.str.31
	str	r1, [sp, #16]                   @ 4-byte Spill
	bl	memchr
	cmp	r0, #0
	bne.w	.LBB15_2
@ %bb.13:                               @   in Loop: Header=BB15_3 Depth=1
	ldr	r0, [sp]                        @ 4-byte Reload
	ldr	r1, [sp, #16]                   @ 4-byte Reload
	bl	strchr
	cmp	r0, #0
	bne.w	.LBB15_2
	b	.LBB15_15
	.p2align	2
.LBB15_14:                              @   in Loop: Header=BB15_15 Depth=2
	adds	r1, r5, #1
	str.w	r1, [r10, #2496]
	ldr.w	r0, [r10, r5, lsl #2]
	adds	r4, #1
	eor.w	r0, r0, r0, lsr #11
	and.w	r2, r6, r0, lsl #7
	eor.w	r0, r0, r2
	and	r2, r0, #114688
	eor.w	r0, r0, r2, lsl #15
	lsr.w	r2, r0, #30
	adc	r7, r7, #0
	cmp	r2, #2
	mov	r5, r1
	bls.w	.LBB15_1
.LBB15_15:                              @   Parent Loop BB15_3 Depth=1
                                        @ =>  This Loop Header: Depth=2
                                        @       Child Loop BB15_17 Depth 3
	cmp.w	r5, #624
	blt	.LBB15_14
@ %bb.16:                               @   in Loop: Header=BB15_15 Depth=2
	ldr.w	r3, [r10]
	mov	lr, r4
	movs	r2, #0
	sub.w	r12, r10, #28
	str	r7, [sp, #16]                   @ 4-byte Spill
	.p2align	2
.LBB15_17:                              @   Parent Loop BB15_3 Depth=1
                                        @     Parent Loop BB15_15 Depth=2
                                        @ =>    This Inner Loop Header: Depth=3
	add.w	r1, r10, r2, lsl #2
	ldr	r7, [r1, #4]
	mov	r5, r9
	cmp	r2, #227
	it	lo
	movwlo	r5, #1588
	and	r3, r3, #-2147483648
	and.w	r6, r7, r8
	ldr	r5, [r1, r5]
	add	r3, r6
	eor.w	r3, r5, r3, lsr #1
	lsls	r6, r7, #31
	it	ne
	eorne.w	r3, r3, r11
	str	r3, [r12, #28]!
	and	r3, r7, #-2147483648
	ldrd	r7, r4, [r1, #8]
	ldr	r5, [r1, #16]
	and.w	r6, r7, r8
	add	r6, r3
	mov	r3, r9
	cmp	r2, #226
	it	lo
	movwlo	r3, #1588
	add	r3, r1
	ldr	r0, [r3, #4]
	ldr	r3, [r1, #20]
	eor.w	r0, r0, r6, lsr #1
	lsls	r6, r7, #31
	mov	r6, r9
	it	ne
	eorne.w	r0, r0, r11
	str	r0, [r1, #4]
	cmp	r2, #225
	it	lo
	movwlo	r6, #1588
	add	r6, r1
	and	r0, r7, #-2147483648
	and.w	r7, r4, r8
	ldr	r6, [r6, #8]
	add	r0, r7
	eor.w	r0, r6, r0, lsr #1
	lsls	r7, r4, #31
	mov	r6, r9
	it	ne
	eorne.w	r0, r0, r11
	str	r0, [r1, #8]
	cmp	r2, #224
	it	lo
	movwlo	r6, #1588
	add	r6, r1
	and	r0, r4, #-2147483648
	and.w	r7, r5, r8
	ldr	r6, [r6, #12]
	add	r0, r7
	eor.w	r0, r6, r0, lsr #1
	lsls	r7, r5, #31
	mov	r6, r9
	it	ne
	eorne.w	r0, r0, r11
	str	r0, [r1, #12]
	cmp	r2, #223
	it	lo
	movwlo	r6, #1588
	add	r6, r1
	and	r0, r5, #-2147483648
	and.w	r7, r3, r8
	ldr	r6, [r6, #16]
	add	r0, r7
	eor.w	r0, r6, r0, lsr #1
	lsls	r7, r3, #31
	it	ne
	eorne.w	r0, r0, r11
	mov	r6, r9
	str	r0, [r1, #16]
	ldr	r0, [r1, #24]
	cmp	r2, #222
	it	lo
	movwlo	r6, #1588
	add	r6, r1
	and	r3, r3, #-2147483648
	and.w	r7, r0, r8
	ldr	r6, [r6, #20]
	add	r3, r7
	eor.w	r3, r6, r3, lsr #1
	lsls	r7, r0, #31
	it	ne
	eorne.w	r3, r3, r11
	str	r3, [r1, #20]
	mov	r6, r9
	ldr.w	r3, [r12, #28]
	cmp	r2, #221
	it	lo
	movwlo	r6, #1588
	add	r6, r1
	and	r0, r0, #-2147483648
	and.w	r7, r3, r8
	ldr	r6, [r6, #24]
	add	r0, r7
	adds	r2, #7
	eor.w	r0, r6, r0, lsr #1
	lsls	r7, r3, #31
	movw	r4, #623
	it	ne
	eorne.w	r0, r0, r11
	cmp	r2, r4
	str	r0, [r1, #24]
	bne.w	.LBB15_17
@ %bb.18:                               @   in Loop: Header=BB15_15 Depth=2
	ldr.w	r0, [r10, #2492]
	ldr.w	r1, [r10]
	and	r0, r0, #-2147483648
	and.w	r2, r1, r8
	ldr.w	r3, [r10, #1584]
	add	r0, r2
	eor.w	r0, r3, r0, lsr #1
	lsls	r1, r1, #31
	it	ne
	eorne.w	r0, r0, r11
	movw	r6, #22144
	ldr	r7, [sp, #16]                   @ 4-byte Reload
	movs	r5, #0
	movt	r6, #40236
	mov	r4, lr
	str.w	r0, [r10, #2492]
	b	.LBB15_14
	.p2align	2
.LBB15_19:
	add	sp, #20
	pop.w	{r4, r5, r6, r7, r8, r9, r10, r11, pc}
.Lfunc_end15:
	.size	credits_private_corrupt_text, .Lfunc_end15-credits_private_corrupt_text
	.cantunwind
	.fnend
                                        @ -- End function
	.globl	credits_private_data_init       @ -- Begin function credits_private_data_init
	.p2align	1
	.prefalign	2, .Lfunc_end16, nop
	.type	credits_private_data_init,%function
	.code	16
	.thumb_func
credits_private_data_init:              @ @credits_private_data_init
	.fnstart
@ %bb.0:
	.save	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	push.w	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	.pad	#28
	sub	sp, #28
	mov	r10, r2
	mov	r9, r1
	str	r0, [sp]                        @ 4-byte Spill
	movs	r0, #0
	mov.w	r12, #0
	str	r0, [sp, #24]
	strd	r0, r0, [sp, #16]
	strd	r0, r0, [sp, #8]
	b	.LBB16_2
	.p2align	2
.LBB16_1:                               @   in Loop: Header=BB16_2 Depth=1
	ldr.w	r2, [r8, #8]
	ldr.w	r12, [sp, #4]                   @ 4-byte Reload
	cmp	lr, r2
	beq.w	.LBB16_39
	b	.LBB16_43
	.p2align	2
.LBB16_2:                               @ =>This Loop Header: Depth=1
                                        @     Child Loop BB16_7 Depth 2
                                        @     Child Loop BB16_15 Depth 2
                                        @     Child Loop BB16_27 Depth 2
                                        @       Child Loop BB16_33 Depth 3
	movw	r1, :lower16:credits_private_data_text_definitions
	add.w	r0, r12, r12, lsl #1
	movt	r1, :upper16:credits_private_data_text_definitions
	ldr	r2, [sp]                        @ 4-byte Reload
	add.w	r0, r1, r0, lsl #3
	add.w	r1, r12, r12, lsl #2
	add.w	r8, r2, r1, lsl #2
	add	r2, sp, #8
	ldm.w	r2, {r3, r4, r5, r6, r7}
	mov	r1, r8
	stm	r1!, {r3, r4, r5, r6, r7}
	ldr.w	r1, [r9, #12]
	ldrd	r2, r3, [r0, #16]
	cmp	r1, #0
	str.w	r2, [r8, #12]
	str.w	r3, [r8, #4]
	beq.w	.LBB16_41
@ %bb.3:                                @   in Loop: Header=BB16_2 Depth=1
	ldrd	r7, r2, [r9, #16]
	adds	r2, #3
	bic	r2, r2, #3
	subs	r7, r7, r2
	blo.w	.LBB16_41
@ %bb.4:                                @   in Loop: Header=BB16_2 Depth=1
	adds	r3, #1
	cmp	r3, r7
	bhi.w	.LBB16_41
@ %bb.5:                                @   in Loop: Header=BB16_2 Depth=1
	ldrd	r6, r5, [r9]
	adds	r7, r2, r3
	add	r3, r6
	str.w	r12, [sp, #4]                   @ 4-byte Spill
	str.w	r7, [r9, #20]
	cmp	r3, r5
	str.w	r3, [r9]
	it	hi
	strhi.w	r3, [r9, #4]
	ldr.w	r3, [r9, #8]
	ldrd	r0, r4, [r0, #4]
	add	r1, r2
	adds	r2, r3, #1
	add.w	r11, r0, #4
	movs	r5, #0
	str.w	r2, [r9, #8]
	str.w	r1, [r8]
	cmp	r4, #1
	mov.w	r1, #1
	it	le
	movle	r4, r1
	b	.LBB16_7
	.p2align	2
.LBB16_6:                               @   in Loop: Header=BB16_7 Depth=2
	add	r5, r7
	subs	r4, #1
	add.w	r11, r11, #12
	beq	.LBB16_9
.LBB16_7:                               @   Parent Loop BB16_2 Depth=1
                                        @ =>  This Inner Loop Header: Depth=2
	ldr	r6, [r11, #-4]
	mov	r0, r6
	bl	strlen
	ldr.w	r1, [r8]
	mov	r7, r0
	adds	r0, r1, r5
	adds	r2, r7, #1
	mov	r1, r6
	bl	__aeabi_memcpy
	ldr.w	r2, [r11]
	cmp	r2, #0
	beq	.LBB16_6
@ %bb.8:                                @   in Loop: Header=BB16_7 Depth=2
	ldr.w	r0, [r8]
	ldr.w	r3, [r11, #4]
	adds	r1, r0, r5
	mov	r0, r10
	bl	credits_private_corrupt_text
	b	.LBB16_6
	.p2align	2
.LBB16_9:                               @   in Loop: Header=BB16_2 Depth=1
	ldr.w	r0, [r8, #4]
	mov.w	r11, #0
	cmp	r5, r0
	bne.w	.LBB16_42
@ %bb.10:                               @   in Loop: Header=BB16_2 Depth=1
	ldr.w	r12, [sp, #4]                   @ 4-byte Reload
	cmp.w	r12, #8
	blo.w	.LBB16_39
@ %bb.11:                               @   in Loop: Header=BB16_2 Depth=1
	movs	r2, #1
	cmp	r0, #1
	str.w	r2, [r8, #8]
	blt	.LBB16_20
@ %bb.12:                               @   in Loop: Header=BB16_2 Depth=1
	ldr.w	r3, [r8]
	cmp	r0, #4
	and	r1, r0, #3
	bhs	.LBB16_14
@ %bb.13:                               @   in Loop: Header=BB16_2 Depth=1
	movs	r7, #0
	b	.LBB16_17
	.p2align	2
.LBB16_14:                              @   in Loop: Header=BB16_2 Depth=1
	movw	r2, #65532
	movt	r2, #32767
	and.w	r6, r0, r2
	movs	r7, #0
	movs	r2, #1
	.p2align	2
.LBB16_15:                              @   Parent Loop BB16_2 Depth=1
                                        @ =>  This Inner Loop Header: Depth=2
	ldrb	r5, [r3, r7]
	cmp	r5, #10
	itt	eq
	addeq	r2, #1
	streq.w	r2, [r8, #8]
	adds	r5, r3, r7
	ldrb	r4, [r5, #1]
	adds	r7, #4
	cmp	r4, #10
	itt	eq
	addeq	r2, #1
	streq.w	r2, [r8, #8]
	ldrb	r4, [r5, #2]
	cmp	r4, #10
	itt	eq
	addeq	r2, #1
	streq.w	r2, [r8, #8]
	ldrb	r5, [r5, #3]
	cmp	r5, #10
	itt	eq
	addeq	r2, #1
	streq.w	r2, [r8, #8]
	cmp	r6, r7
	bne	.LBB16_15
@ %bb.16:                               @   in Loop: Header=BB16_2 Depth=1
	cbz	r1, .LBB16_20
.LBB16_17:                              @   in Loop: Header=BB16_2 Depth=1
	ldrb	r6, [r3, r7]
	cmp	r6, #10
	itt	eq
	addeq	r2, #1
	streq.w	r2, [r8, #8]
	cmp	r1, #1
	beq	.LBB16_20
@ %bb.18:                               @   in Loop: Header=BB16_2 Depth=1
	add	r3, r7
	ldrb	r7, [r3, #1]
	cmp	r7, #10
	itt	eq
	addeq	r2, #1
	streq.w	r2, [r8, #8]
	cmp	r1, #2
	beq	.LBB16_20
@ %bb.19:                               @   in Loop: Header=BB16_2 Depth=1
	ldrb	r1, [r3, #2]
	cmp	r1, #10
	itt	eq
	addeq	r2, #1
	streq.w	r2, [r8, #8]
	.p2align	2
.LBB16_20:                              @   in Loop: Header=BB16_2 Depth=1
	ldr.w	r1, [r9, #12]
	cmp	r1, #0
	beq.w	.LBB16_41
@ %bb.21:                               @   in Loop: Header=BB16_2 Depth=1
	ldrd	r7, r3, [r9, #16]
	adds	r3, #3
	bic	r3, r3, #3
	subs	r6, r7, r3
	blo.w	.LBB16_41
@ %bb.22:                               @   in Loop: Header=BB16_2 Depth=1
	add.w	r7, r2, r2, lsl #1
	lsls	r7, r7, #2
	cmp	r7, r6
	bhi.w	.LBB16_41
@ %bb.23:                               @   in Loop: Header=BB16_2 Depth=1
	ldrd	r5, r4, [r9]
	adds	r6, r3, r7
	add	r7, r5
	str.w	r6, [r9, #20]
	cmp	r7, r4
	str.w	r7, [r9]
	it	hi
	strhi.w	r7, [r9, #4]
	ldr.w	r7, [r9, #8]
	add	r1, r3
	adds	r3, r7, #1
	cmp	r0, #0
	str.w	r3, [r9, #8]
	str.w	r1, [r8, #16]
	bmi	.LBB16_38
@ %bb.24:                               @   in Loop: Header=BB16_2 Depth=1
	ldr.w	r2, [r8]
	movs	r3, #0
	movs	r7, #0
	mov.w	lr, #0
	b	.LBB16_27
	.p2align	2
.LBB16_25:                              @   in Loop: Header=BB16_27 Depth=2
	ldr.w	r0, [r8, #4]
	add.w	lr, lr, #1
	adds	r7, r3, #1
.LBB16_26:                              @   in Loop: Header=BB16_27 Depth=2
	cmp	r3, r0
	add.w	r3, r3, #1
	bge.w	.LBB16_1
.LBB16_27:                              @   Parent Loop BB16_2 Depth=1
                                        @ =>  This Loop Header: Depth=2
                                        @       Child Loop BB16_33 Depth 3
	ldrb	r6, [r2, r3]
	cbz	r6, .LBB16_29
@ %bb.28:                               @   in Loop: Header=BB16_27 Depth=2
	cmp	r6, #10
	bne	.LBB16_26
.LBB16_29:                              @   in Loop: Header=BB16_27 Depth=2
	strb.w	r11, [r2, r3]
	ldr.w	r2, [r8]
	ldr.w	r6, [r8, #16]
	add.w	r5, lr, lr, lsl #1
	adds	r4, r2, r7
	add.w	r0, r6, r5, lsl #2
	str.w	r4, [r6, r5, lsl #2]
	subs	r6, r3, r7
	mov.w	r1, #1
	strd	r6, r1, [r0, #4]
	ble	.LBB16_25
@ %bb.30:                               @   in Loop: Header=BB16_27 Depth=2
	subs	r5, r7, r3
	cmn.w	r5, #4
	and	r12, r6, #3
	bls	.LBB16_32
@ %bb.31:                               @   in Loop: Header=BB16_27 Depth=2
	movs	r6, #1
	b	.LBB16_35
	.p2align	2
.LBB16_32:                              @   in Loop: Header=BB16_27 Depth=2
	bic	r4, r6, #3
	movs	r6, #1
	.p2align	2
.LBB16_33:                              @   Parent Loop BB16_2 Depth=1
                                        @     Parent Loop BB16_27 Depth=2
                                        @ =>    This Inner Loop Header: Depth=3
	ldrb	r5, [r2, r7]
	cmp	r5, #35
	itt	eq
	addeq	r6, #1
	streq	r6, [r0, #8]
	adds	r5, r2, r7
	ldrb	r1, [r5, #1]
	adds	r7, #4
	cmp	r1, #35
	itt	eq
	addeq	r6, #1
	streq	r6, [r0, #8]
	ldrb	r1, [r5, #2]
	cmp	r1, #35
	itt	eq
	addeq	r6, #1
	streq	r6, [r0, #8]
	ldrb	r1, [r5, #3]
	cmp	r1, #35
	itt	eq
	addeq	r6, #1
	streq	r6, [r0, #8]
	subs	r4, #4
	bne	.LBB16_33
@ %bb.34:                               @   in Loop: Header=BB16_27 Depth=2
	cmp.w	r12, #0
	beq	.LBB16_25
.LBB16_35:                              @   in Loop: Header=BB16_27 Depth=2
	ldrb	r5, [r2, r7]
	cmp	r5, #35
	itt	eq
	addeq	r6, #1
	streq	r6, [r0, #8]
	cmp.w	r12, #1
	beq	.LBB16_25
@ %bb.36:                               @   in Loop: Header=BB16_27 Depth=2
	add	r7, r2
	ldrb	r5, [r7, #1]
	cmp	r5, #35
	itt	eq
	addeq	r6, #1
	streq	r6, [r0, #8]
	cmp.w	r12, #2
	beq	.LBB16_25
@ %bb.37:                               @   in Loop: Header=BB16_27 Depth=2
	ldrb	r7, [r7, #2]
	cmp	r7, #35
	itt	eq
	addeq	r7, r6, #1
	streq	r7, [r0, #8]
	b	.LBB16_25
	.p2align	2
.LBB16_38:                              @   in Loop: Header=BB16_2 Depth=1
	mov.w	lr, #0
	ldr.w	r12, [sp, #4]                   @ 4-byte Reload
	cmp	lr, r2
	bne	.LBB16_43
	.p2align	2
.LBB16_39:                              @   in Loop: Header=BB16_2 Depth=1
	add.w	r12, r12, #1
	cmp.w	r12, #18
	bne.w	.LBB16_2
@ %bb.40:
	add	sp, #28
	pop.w	{r4, r5, r6, r7, r8, r9, r10, r11, pc}
	.p2align	2
.LBB16_41:
	movw	r0, :lower16:.L.str.2
	movt	r0, :upper16:.L.str.2
	bl	credits_private_credits_fail
	.p2align	2
.LBB16_42:
	movw	r0, :lower16:.L.str.32
	movt	r0, :upper16:.L.str.32
	bl	credits_private_credits_fail
	.p2align	2
.LBB16_43:
	movw	r0, :lower16:.L.str.33
	movt	r0, :upper16:.L.str.33
	bl	credits_private_credits_fail
.Lfunc_end16:
	.size	credits_private_data_init, .Lfunc_end16-credits_private_data_init
	.cantunwind
	.fnend
                                        @ -- End function
	.globl	credits_private_data_destroy    @ -- Begin function credits_private_data_destroy
	.p2align	1
	.prefalign	2, .Lfunc_end17, nop
	.type	credits_private_data_destroy,%function
	.code	16
	.thumb_func
credits_private_data_destroy:           @ @credits_private_data_destroy
	.fnstart
@ %bb.0:
	.save	{r4, lr}
	push	{r4, lr}
	ldrd	r2, r3, [r0, #4]
	ldr	r4, [r1]
	mvns	r2, r2
	add	r2, r4
	sub.w	r3, r3, r3, lsl #2
	add.w	r2, r2, r3, lsl #2
	str	r2, [r1]
	movs	r2, #0
	ldrd	r12, lr, [r0, #24]
	strd	r2, r2, [r0]
	strd	r2, r2, [r0, #8]
	str	r2, [r0, #16]
	ldr	r3, [r1]
	mvn.w	r4, r12
	add	r3, r4
	sub.w	r4, lr, lr, lsl #2
	add.w	r3, r3, r4, lsl #2
	str	r3, [r1]
	strd	r2, r2, [r0, #20]
	strd	r2, r2, [r0, #28]
	str	r2, [r0, #36]
	ldrd	r3, r12, [r0, #44]
	ldr	r4, [r1]
	mvns	r3, r3
	add	r3, r4
	sub.w	r4, r12, r12, lsl #2
	add.w	r3, r3, r4, lsl #2
	str	r3, [r1]
	strd	r2, r2, [r0, #40]
	strd	r2, r2, [r0, #48]
	str	r2, [r0, #56]
	ldrd	r3, r12, [r0, #64]
	ldr	r4, [r1]
	mvns	r3, r3
	add	r3, r4
	sub.w	r4, r12, r12, lsl #2
	add.w	r3, r3, r4, lsl #2
	str	r3, [r1]
	strd	r2, r2, [r0, #60]
	strd	r2, r2, [r0, #68]
	str	r2, [r0, #76]
	ldrd	r3, r12, [r0, #84]
	ldr	r4, [r1]
	mvns	r3, r3
	add	r3, r4
	sub.w	r4, r12, r12, lsl #2
	add.w	r3, r3, r4, lsl #2
	str	r3, [r1]
	strd	r2, r2, [r0, #80]
	strd	r2, r2, [r0, #88]
	str	r2, [r0, #96]
	ldrd	r3, r12, [r0, #104]
	ldr	r4, [r1]
	mvns	r3, r3
	add	r3, r4
	sub.w	r4, r12, r12, lsl #2
	add.w	r3, r3, r4, lsl #2
	str	r3, [r1]
	strd	r2, r2, [r0, #100]
	strd	r2, r2, [r0, #108]
	str	r2, [r0, #116]
	ldrd	r3, r12, [r0, #124]
	ldr	r4, [r1]
	mvns	r3, r3
	add	r3, r4
	sub.w	r4, r12, r12, lsl #2
	add.w	r3, r3, r4, lsl #2
	str	r3, [r1]
	strd	r2, r2, [r0, #120]
	strd	r2, r2, [r0, #128]
	str.w	r2, [r0, #136]
	ldrd	r3, r12, [r0, #144]
	ldr	r4, [r1]
	mvns	r3, r3
	add	r3, r4
	sub.w	r4, r12, r12, lsl #2
	add.w	r3, r3, r4, lsl #2
	str	r3, [r1]
	strd	r2, r2, [r0, #140]
	strd	r2, r2, [r0, #148]
	str.w	r2, [r0, #156]
	ldrd	r3, r12, [r0, #164]
	ldr	r4, [r1]
	mvns	r3, r3
	add	r3, r4
	sub.w	r4, r12, r12, lsl #2
	add.w	r3, r3, r4, lsl #2
	str	r3, [r1]
	strd	r2, r2, [r0, #160]
	strd	r2, r2, [r0, #168]
	str.w	r2, [r0, #176]
	ldrd	r3, r12, [r0, #184]
	ldr	r4, [r1]
	mvns	r3, r3
	add	r3, r4
	sub.w	r4, r12, r12, lsl #2
	add.w	r3, r3, r4, lsl #2
	str	r3, [r1]
	strd	r2, r2, [r0, #180]
	strd	r2, r2, [r0, #188]
	str.w	r2, [r0, #196]
	ldrd	r3, r12, [r0, #204]
	ldr	r4, [r1]
	mvns	r3, r3
	add	r3, r4
	sub.w	r4, r12, r12, lsl #2
	add.w	r3, r3, r4, lsl #2
	str	r3, [r1]
	strd	r2, r2, [r0, #200]
	strd	r2, r2, [r0, #208]
	str.w	r2, [r0, #216]
	ldrd	r3, r12, [r0, #224]
	ldr	r4, [r1]
	mvns	r3, r3
	add	r3, r4
	sub.w	r4, r12, r12, lsl #2
	add.w	r3, r3, r4, lsl #2
	str	r3, [r1]
	strd	r2, r2, [r0, #220]
	strd	r2, r2, [r0, #228]
	str.w	r2, [r0, #236]
	ldrd	r3, r12, [r0, #244]
	ldr	r4, [r1]
	mvns	r3, r3
	add	r3, r4
	sub.w	r4, r12, r12, lsl #2
	add.w	r3, r3, r4, lsl #2
	str	r3, [r1]
	strd	r2, r2, [r0, #240]
	strd	r2, r2, [r0, #248]
	str.w	r2, [r0, #256]
	ldrd	r3, r12, [r0, #264]
	ldr	r4, [r1]
	mvns	r3, r3
	add	r3, r4
	sub.w	r4, r12, r12, lsl #2
	add.w	r3, r3, r4, lsl #2
	str	r3, [r1]
	strd	r2, r2, [r0, #260]
	strd	r2, r2, [r0, #268]
	str.w	r2, [r0, #276]
	ldrd	r3, r12, [r0, #284]
	ldr	r4, [r1]
	mvns	r3, r3
	add	r3, r4
	sub.w	r4, r12, r12, lsl #2
	add.w	r3, r3, r4, lsl #2
	str	r3, [r1]
	strd	r2, r2, [r0, #280]
	strd	r2, r2, [r0, #288]
	str.w	r2, [r0, #296]
	ldrd	r3, r12, [r0, #304]
	ldr	r4, [r1]
	mvns	r3, r3
	add	r3, r4
	sub.w	r4, r12, r12, lsl #2
	add.w	r3, r3, r4, lsl #2
	str	r3, [r1]
	strd	r2, r2, [r0, #300]
	strd	r2, r2, [r0, #308]
	str.w	r2, [r0, #316]
	ldrd	r3, r12, [r0, #324]
	ldr	r4, [r1]
	mvns	r3, r3
	add	r3, r4
	sub.w	r4, r12, r12, lsl #2
	add.w	r3, r3, r4, lsl #2
	str	r3, [r1]
	strd	r2, r2, [r0, #320]
	strd	r2, r2, [r0, #328]
	str.w	r2, [r0, #336]
	ldrd	r3, r12, [r0, #344]
	ldr	r4, [r1]
	mvns	r3, r3
	add	r3, r4
	sub.w	r4, r12, r12, lsl #2
	add.w	r3, r3, r4, lsl #2
	str	r3, [r1]
	strd	r2, r2, [r0, #340]
	strd	r2, r2, [r0, #348]
	str.w	r2, [r0, #356]
	pop	{r4, pc}
.Lfunc_end17:
	.size	credits_private_data_destroy, .Lfunc_end17-credits_private_data_destroy
	.cantunwind
	.fnend
                                        @ -- End function
	.globl	credits_private_data_readonly_size @ -- Begin function credits_private_data_readonly_size
	.p2align	1
	.prefalign	2, .Lfunc_end18, nop
	.type	credits_private_data_readonly_size,%function
	.code	16
	.thumb_func
credits_private_data_readonly_size:     @ @credits_private_data_readonly_size
	.fnstart
@ %bb.0:
	.save	{r4, r5, r6, r7, r8, r9, lr}
	push.w	{r4, r5, r6, r7, r8, r9, lr}
	.pad	#4
	sub	sp, #4
	movw	r8, :lower16:credits_private_data_text_definitions
	mov.w	r9, #0
	mov.w	r7, #696
	movt	r8, :upper16:credits_private_data_text_definitions
	.p2align	2
.LBB18_1:                               @ =>This Loop Header: Depth=1
                                        @     Child Loop BB18_2 Depth 2
	add.w	r0, r9, r9, lsl #1
	add.w	r1, r8, r0, lsl #3
	ldr.w	r0, [r8, r0, lsl #3]
	ldrd	r4, r6, [r1, #4]
	bl	strlen
	add	r0, r7
	add.w	r1, r6, r6, lsl #1
	add.w	r0, r0, r1, lsl #2
	adds	r7, r0, #1
	sub.w	r5, r4, #12
	cmp	r6, #1
	it	le
	movle	r6, #1
	.p2align	2
.LBB18_2:                               @   Parent Loop BB18_1 Depth=1
                                        @ =>  This Inner Loop Header: Depth=2
	ldr	r0, [r5, #12]!
	bl	strlen
	ldr	r1, [r5, #8]
	mov	r4, r0
	mov	r0, r1
	bl	strlen
	adds	r1, r7, r4
	add	r0, r1
	subs	r6, #1
	add.w	r7, r0, #2
	bne	.LBB18_2
@ %bb.3:                                @   in Loop: Header=BB18_1 Depth=1
	add.w	r9, r9, #1
	cmp.w	r9, #18
	bne	.LBB18_1
@ %bb.4:
	addw	r0, r7, #503
	add	sp, #4
	pop.w	{r4, r5, r6, r7, r8, r9, pc}
.Lfunc_end18:
	.size	credits_private_data_readonly_size, .Lfunc_end18-credits_private_data_readonly_size
	.cantunwind
	.fnend
                                        @ -- End function
	.globl	credits_private_credits_typer   @ -- Begin function credits_private_credits_typer
	.p2align	2
	.type	credits_private_credits_typer,%function
	.code	16
	.thumb_func
credits_private_credits_typer:          @ @credits_private_credits_typer
	.fnstart
@ %bb.0:
	subs	r1, #3
	cmp	r1, #17
	bhi	.LBB19_23
@ %bb.1:
.LCPI19_0:
	tbb	[pc, r1]
@ %bb.2:
.LJTI19_0:
	.byte	(.LBB19_3-(.LCPI19_0+4))/2
	.byte	(.LBB19_17-(.LCPI19_0+4))/2
	.byte	(.LBB19_23-(.LCPI19_0+4))/2
	.byte	(.LBB19_11-(.LCPI19_0+4))/2
	.byte	(.LBB19_23-(.LCPI19_0+4))/2
	.byte	(.LBB19_23-(.LCPI19_0+4))/2
	.byte	(.LBB19_23-(.LCPI19_0+4))/2
	.byte	(.LBB19_15-(.LCPI19_0+4))/2
	.byte	(.LBB19_23-(.LCPI19_0+4))/2
	.byte	(.LBB19_23-(.LCPI19_0+4))/2
	.byte	(.LBB19_23-(.LCPI19_0+4))/2
	.byte	(.LBB19_5-(.LCPI19_0+4))/2
	.byte	(.LBB19_23-(.LCPI19_0+4))/2
	.byte	(.LBB19_23-(.LCPI19_0+4))/2
	.byte	(.LBB19_7-(.LCPI19_0+4))/2
	.byte	(.LBB19_23-(.LCPI19_0+4))/2
	.byte	(.LBB19_18-(.LCPI19_0+4))/2
	.byte	(.LBB19_13-(.LCPI19_0+4))/2
	.p2align	1
	.p2align	2
.LBB19_3:
	cmp	r2, #1
	bne	.LBB19_23
@ %bb.4:
	movs	r2, #0
	b	.LBB19_22
	.p2align	2
.LBB19_5:
	cmp	r2, #6
	bne	.LBB19_23
@ %bb.6:
	movs	r2, #7
	b	.LBB19_22
	.p2align	2
.LBB19_7:
	cbz	r2, .LBB19_21
@ %bb.8:
	cmp	r2, #3
	beq	.LBB19_20
@ %bb.9:
	cmp	r2, #1
	bne	.LBB19_23
@ %bb.10:
	movs	r2, #9
	b	.LBB19_22
	.p2align	2
.LBB19_11:
	cbnz	r2, .LBB19_23
@ %bb.12:
	movs	r2, #5
	b	.LBB19_22
	.p2align	2
.LBB19_13:
	cmp	r2, #2
	bhs	.LBB19_23
@ %bb.14:
	orr	r2, r2, #12
	b	.LBB19_22
	.p2align	2
.LBB19_15:
	cbnz	r2, .LBB19_23
@ %bb.16:
	movs	r2, #6
	b	.LBB19_22
	.p2align	2
.LBB19_17:
	subs	r1, r2, #1
	cmp	r1, #4
	blo	.LBB19_22
	b	.LBB19_23
	.p2align	2
.LBB19_18:
	cmp	r2, #1
	bne	.LBB19_23
@ %bb.19:
	movs	r2, #11
	b	.LBB19_22
	.p2align	2
.LBB19_20:
	movs	r2, #10
	b	.LBB19_22
	.p2align	2
.LBB19_21:
	movs	r2, #8
.LBB19_22:
	add.w	r1, r2, r2, lsl #2
	add.w	r0, r0, r1, lsl #2
	movw	r1, #8028
	add	r0, r1
	bx	lr
	.p2align	2
.LBB19_23:
	movw	r0, :lower16:.L.str.34
	movt	r0, :upper16:.L.str.34
	bl	credits_private_credits_fail
.Lfunc_end19:
	.size	credits_private_credits_typer, .Lfunc_end19-credits_private_credits_typer
	.cantunwind
	.fnend
                                        @ -- End function
	.globl	credits_private_credits_scratch @ -- Begin function credits_private_credits_scratch
	.p2align	1
	.prefalign	2, .Lfunc_end20, nop
	.type	credits_private_credits_scratch,%function
	.code	16
	.thumb_func
credits_private_credits_scratch:        @ @credits_private_credits_scratch
	.fnstart
@ %bb.0:
	.save	{r4, r5, r7, lr}
	push	{r4, r5, r7, lr}
	movw	r2, #10128
	add	r2, r0
	ldr	r3, [r2, #4]
	cmp	r1, r3
	bls	.LBB20_7
@ %bb.1:
	cbnz	r3, .LBB20_9
@ %bb.2:
	ldr	r3, [r2]
	cbnz	r3, .LBB20_9
@ %bb.3:
	ldr.w	r12, [r0, #12]
	cmp.w	r12, #0
	beq	.LBB20_8
@ %bb.4:
	ldrd	r4, r3, [r0, #16]
	adds	r3, #3
	bic	lr, r3, #3
	subs.w	r3, r4, lr
	blo	.LBB20_8
@ %bb.5:
	add.w	r1, r1, r1, lsr #1
	adds	r1, #32
	cmp	r1, r3
	bhi	.LBB20_8
@ %bb.6:
	ldrd	r4, r5, [r0]
	add.w	r3, lr, r1
	str	r3, [r0, #20]
	adds	r3, r4, r1
	cmp	r3, r5
	str	r3, [r0]
	it	hi
	strhi	r3, [r0, #4]
	ldr	r3, [r0, #8]
	add.w	r5, r12, lr
	adds	r3, #1
	str	r3, [r0, #8]
	mov	r0, r5
	strd	r0, r1, [r2]
	pop	{r4, r5, r7, pc}
	.p2align	2
.LBB20_7:
	ldr	r0, [r2]
	pop	{r4, r5, r7, pc}
	.p2align	2
.LBB20_8:
	movw	r0, :lower16:.L.str.2
	movt	r0, :upper16:.L.str.2
	bl	credits_private_credits_fail
	.p2align	2
.LBB20_9:
	movw	r0, :lower16:.L.str.1
	movt	r0, :upper16:.L.str.1
	bl	credits_private_credits_fail
.Lfunc_end20:
	.size	credits_private_credits_scratch, .Lfunc_end20-credits_private_credits_scratch
	.cantunwind
	.fnend
                                        @ -- End function
	.globl	credits_private_credits_init    @ -- Begin function credits_private_credits_init
	.p2align	1
	.prefalign	2, .Lfunc_end21, nop
	.type	credits_private_credits_init,%function
	.code	16
	.thumb_func
credits_private_credits_init:           @ @credits_private_credits_init
	.fnstart
@ %bb.0:
	.save	{r4, r5, r6, r7, r8, lr}
	push.w	{r4, r5, r6, r7, r8, lr}
	mov	r4, r0
	movw	r0, #7352
	adds	r5, r4, r0
	mov	r0, r4
	movw	r1, #30544
	mov	r8, r3
	mov	r6, r2
	bl	__aeabi_memclr8
	movw	r0, #10160
	add	r0, r4
	movw	r1, #20378
	add.w	r7, r4, #24
	strd	r0, r1, [r4, #12]
	mov	r0, r7
	movw	r1, #4812
	bl	__aeabi_memclr4
	mov	r0, r7
	bl	credits_private_canvas_clear
	movw	r0, #4840
	adds	r7, r4, r0
	mov	r0, r7
	mov	r2, r6
	mov	r3, r8
	bl	credits_private_random_seed
	mov	r0, r7
	mov.w	r1, #2000
	bl	credits_private_random_scaled
	str.w	r0, [r5, #2444]
	movw	r0, #7668
	add	r0, r4
	mov	r1, r4
	mov	r2, r7
	bl	credits_private_data_init
	ldr.w	r12, [r4, #12]
	mov.w	r0, #1024
	cmp.w	r12, #0
	str.w	r0, [r5, #2780]
	beq.w	.LBB21_10
@ %bb.1:
	ldrd	lr, r2, [r4, #16]
	adds	r0, r2, #3
	bic	r0, r0, #3
	subs.w	r1, lr, r0
	blo.w	.LBB21_10
@ %bb.2:
	movs	r3, #0
	cmp.w	r3, r1, lsr #10
	beq.w	.LBB21_10
@ %bb.3:
	ldrd	r3, r1, [r4]
	add.w	r6, r0, #1024
	str	r6, [r4, #20]
	add.w	r6, r3, #1024
	cmp	r6, r1
	str	r6, [r4]
	itt	hi
	strhi	r6, [r4, #4]
	movhi	r1, r6
	ldr	r7, [r4, #8]
	add	r0, r12
	str.w	r0, [r5, #2776]
	addw	r0, r2, #1027
	adds	r6, r7, #1
	bic	r0, r0, #3
	str	r6, [r4, #8]
	mov.w	r8, #240
	subs.w	r6, lr, r0
	str.w	r8, [r5, #2616]
	blo.w	.LBB21_10
@ %bb.4:
	lsrs	r6, r6, #6
	cmp	r6, #44
	bls.w	.LBB21_10
@ %bb.5:
	add.w	r6, r0, #2880
	str	r6, [r4, #20]
	add.w	r6, r3, #3904
	add	r0, r12
	cmp	r6, r1
	str	r6, [r4]
	itt	hi
	strhi	r6, [r4, #4]
	movhi	r1, r6
	str.w	r0, [r5, #2608]
	addw	r0, r2, #3907
	adds	r6, r7, #2
	bic	r0, r0, #3
	str	r6, [r4, #8]
	mov.w	r8, #48
	subs.w	r6, lr, r0
	str.w	r8, [r5, #2632]
	blo.w	.LBB21_10
@ %bb.6:
	cmp.w	r6, #576
	blo	.LBB21_10
@ %bb.7:
	add.w	r6, r0, #576
	str	r6, [r4, #20]
	add.w	r6, r3, #4480
	add	r0, r12
	cmp	r6, r1
	str	r6, [r4]
	itt	hi
	strhi	r6, [r4, #4]
	movhi	r1, r6
	str.w	r0, [r5, #2624]
	movw	r0, #4483
	add	r0, r2
	adds	r6, r7, #3
	bic	r0, r0, #3
	str	r6, [r4, #8]
	movs	r6, #16
	subs.w	r2, lr, r0
	str.w	r6, [r5, #2648]
	blo	.LBB21_10
@ %bb.8:
	cmp	r2, #192
	blo	.LBB21_10
@ %bb.9:
	add.w	r2, r0, #192
	str	r2, [r4, #20]
	add.w	r2, r3, #4672
	cmp	r2, r1
	add	r0, r12
	add.w	r1, r7, #4
	str	r2, [r4]
	it	hi
	strhi	r2, [r4, #4]
	str	r1, [r4, #8]
	str.w	r0, [r5, #2640]
	movw	r0, #9800
	movw	r1, :lower16:.L__const.credits_private_weather_init.values
	add	r0, r4
	movt	r1, :upper16:.L__const.credits_private_weather_init.values
	movs	r2, #156
	bl	__aeabi_memcpy4
	movw	r0, :lower16:.L.str.154
	movt	r0, :upper16:.L.str.154
	str.w	r0, [r5, #2476]
	movw	r0, :lower16:.L.str.157
	movt	r0, :upper16:.L.str.157
	str.w	r0, [r5, #2508]
	str.w	r0, [r5, #2540]
	str.w	r0, [r5, #2572]
	movw	r0, :lower16:.L.str.51
	movt	r0, :upper16:.L.str.51
	movw	r1, #7580
	str.w	r0, [r5, #2604]
	movw	r0, #7404
	add	r1, r4
	movw	r3, :lower16:credits_private_scene_definitions
	movs	r7, #22
	add	r0, r4
	movs	r2, #0
	movt	r3, :upper16:credits_private_scene_definitions
	mov.w	r6, #-1
	strd	r7, r1, [r5, #8]
	movs	r1, #176
	strd	r3, r0, [r5]
	strd	r2, r7, [r5, #16]
	str	r6, [r5, #24]
	bl	__aeabi_memclr4
	movw	r0, :lower16:credits_private_credits_native_scene_due
	movt	r0, :upper16:credits_private_credits_native_scene_due
	movw	r1, :lower16:credits_private_credits_create_generator
	movt	r1, :upper16:credits_private_credits_create_generator
	movw	r2, :lower16:credits_private_credits_no_clear
	movw	r3, :lower16:credits_private_credits_request_generator
	movw	r7, :lower16:credits_private_credits_timeline
	strd	r4, r0, [r5, #28]
	add.w	r0, r5, #36
	movt	r2, :upper16:credits_private_credits_no_clear
	movt	r3, :upper16:credits_private_credits_request_generator
	movt	r7, :upper16:credits_private_credits_timeline
	stm	r0!, {r1, r2, r3, r7}
	pop.w	{r4, r5, r6, r7, r8, pc}
	.p2align	2
.LBB21_10:
	movw	r0, :lower16:.L.str.2
	movt	r0, :upper16:.L.str.2
	bl	credits_private_credits_fail
.Lfunc_end21:
	.size	credits_private_credits_init, .Lfunc_end21-credits_private_credits_init
	.cantunwind
	.fnend
                                        @ -- End function
	.globl	credits_private_canvas_init     @ -- Begin function credits_private_canvas_init
	.p2align	1
	.prefalign	2, .Lfunc_end22, nop
	.type	credits_private_canvas_init,%function
	.code	16
	.thumb_func
credits_private_canvas_init:            @ @credits_private_canvas_init
	.fnstart
@ %bb.0:
	.save	{r4, lr}
	push	{r4, lr}
	movw	r1, #4812
	mov	r4, r0
	bl	__aeabi_memclr4
	mov	r0, r4
	pop.w	{r4, lr}
	b	credits_private_canvas_clear
.Lfunc_end22:
	.size	credits_private_canvas_init, .Lfunc_end22-credits_private_canvas_init
	.cantunwind
	.fnend
                                        @ -- End function
	.globl	credits_private_weather_init    @ -- Begin function credits_private_weather_init
	.p2align	1
	.prefalign	2, .Lfunc_end23, nop
	.type	credits_private_weather_init,%function
	.code	16
	.thumb_func
credits_private_weather_init:           @ @credits_private_weather_init
	.fnstart
@ %bb.0:
	.save	{r4, lr}
	push	{r4, lr}
	movw	r1, :lower16:.L__const.credits_private_weather_init.values
	movt	r1, :upper16:.L__const.credits_private_weather_init.values
	movs	r2, #156
	mov	r4, r0
	bl	__aeabi_memcpy4
	movw	r0, :lower16:.L.str.154
	movt	r0, :upper16:.L.str.154
	str	r0, [r4, #28]
	movw	r0, :lower16:.L.str.157
	movt	r0, :upper16:.L.str.157
	str	r0, [r4, #60]
	str	r0, [r4, #92]
	str	r0, [r4, #124]
	movw	r0, :lower16:.L.str.51
	movt	r0, :upper16:.L.str.51
	str.w	r0, [r4, #156]
	pop	{r4, pc}
.Lfunc_end23:
	.size	credits_private_weather_init, .Lfunc_end23-credits_private_weather_init
	.cantunwind
	.fnend
                                        @ -- End function
	.p2align	1                               @ -- Begin function credits_private_credits_native_scene_due
	.prefalign	2, .Lfunc_end24, nop
	.type	credits_private_credits_native_scene_due,%function
	.code	16
	.thumb_func
credits_private_credits_native_scene_due: @ @credits_private_credits_native_scene_due
	.fnstart
@ %bb.0:
	cmp	r1, #0
	it	ne
	bne	credits_private_scene_due
.LBB24_1:
	subs	r1, r0, #3
	cmp	r1, #2
	itt	lo
	movlo	r0, #1
	bxlo	lr
.LBB24_2:
	movs	r1, #0
	b	credits_private_scene_due
.Lfunc_end24:
	.size	credits_private_credits_native_scene_due, .Lfunc_end24-credits_private_credits_native_scene_due
	.cantunwind
	.fnend
                                        @ -- End function
	.globl	credits_private_credits_create_generator @ -- Begin function credits_private_credits_create_generator
	.p2align	2
	.type	credits_private_credits_create_generator,%function
	.code	16
	.thumb_func
credits_private_credits_create_generator: @ @credits_private_credits_create_generator
	.fnstart
@ %bb.0:
	.save	{r4, r5, r7, lr}
	push	{r4, r5, r7, lr}
	subs	r3, r1, #2
	cmp	r3, #18
                                        @ implicit-def: $lr
	bhi.w	.LBB25_26
@ %bb.1:
	movw	r4, #8204
	add.w	lr, r0, r4
	movw	r12, #4104
	add	r12, r0
.LCPI25_0:
	tbh	[pc, r3, lsl #1]
@ %bb.2:
.LJTI25_0:
	.short	(.LBB25_19-(.LCPI25_0+4))/2
	.short	(.LBB25_3-(.LCPI25_0+4))/2
	.short	(.LBB25_3-(.LCPI25_0+4))/2
	.short	(.LBB25_3-(.LCPI25_0+4))/2
	.short	(.LBB25_27-(.LCPI25_0+4))/2
	.short	(.LBB25_26-(.LCPI25_0+4))/2
	.short	(.LBB25_7-(.LCPI25_0+4))/2
	.short	(.LBB25_7-(.LCPI25_0+4))/2
	.short	(.LBB25_20-(.LCPI25_0+4))/2
	.short	(.LBB25_26-(.LCPI25_0+4))/2
	.short	(.LBB25_26-(.LCPI25_0+4))/2
	.short	(.LBB25_26-(.LCPI25_0+4))/2
	.short	(.LBB25_29-(.LCPI25_0+4))/2
	.short	(.LBB25_8-(.LCPI25_0+4))/2
	.short	(.LBB25_8-(.LCPI25_0+4))/2
	.short	(.LBB25_15-(.LCPI25_0+4))/2
	.short	(.LBB25_13-(.LCPI25_0+4))/2
	.short	(.LBB25_11-(.LCPI25_0+4))/2
	.short	(.LBB25_24-(.LCPI25_0+4))/2
	.p2align	1
	.p2align	2
.LBB25_3:
	cbz	r2, .LBB25_10
@ %bb.4:
	cmp	r1, #5
                                        @ implicit-def: $lr
	beq.w	.LBB25_26
@ %bb.5:
	cmp	r1, #4
	bne.w	.LBB25_31
@ %bb.6:
	cmp	r2, #5
	blo.w	.LBB25_33
	b	.LBB25_34
	.p2align	2
.LBB25_7:
	add.w	r0, r0, r1, lsl #3
	add.w	r0, r0, r2, lsl #2
	movw	r1, #10044
	movs	r2, #1
	str	r2, [r0, r1]
	pop	{r4, r5, r7, pc}
	.p2align	2
.LBB25_8:
	cmp	r2, #1
                                        @ implicit-def: $lr
	bgt.w	.LBB25_26
@ %bb.9:
	add.w	r0, r0, r1, lsl #2
	movw	r1, #10012
	movs	r2, #0
	str	r2, [r0, r1]
	pop	{r4, r5, r7, pc}
	.p2align	2
.LBB25_10:
	rsb	r2, r1, r1, lsl #5
	add.w	r2, r0, r2, lsl #4
	movw	r3, #6820
	adds	r4, r2, r3
	mov	r5, r1
	mov	r1, r4
	bl	credits_private_credits_ocean_begin
	movw	r1, :lower16:.L.str.42
	movw	r2, :lower16:.L.str.43
	movs	r0, #100
	movt	r1, :upper16:.L.str.42
	movt	r2, :upper16:.L.str.43
	cmp	r5, #4
	it	eq
	moveq	r0, #16
	it	eq
	moveq	r2, r1
	movw	r1, :lower16:.L.str.41
	movt	r1, :upper16:.L.str.41
	cmp	r5, #3
	it	eq
	moveq	r0, #1
	it	ne
	movne	r1, r2
	strd	r0, r1, [r4, #480]
	pop	{r4, r5, r7, pc}
	.p2align	2
.LBB25_11:
	cmp	r2, #1
	beq.w	.LBB25_37
@ %bb.12:
	cmp	r2, #0
	ittt	eq
	moveq	r0, #0
	streq.w	r0, [lr, #1884]
	popeq	{r4, r5, r7, pc}
	b	.LBB25_34
	.p2align	2
.LBB25_13:
	cmp	r2, #3
	it	ne
	popne	{r4, r5, r7, pc}
.LBB25_14:
	movs	r0, #0
	str.w	r0, [lr, #1896]
	str.w	r0, [lr, #1900]
	pop	{r4, r5, r7, pc}
	.p2align	2
.LBB25_15:
	cmp	r2, #3
	beq.w	.LBB25_40
@ %bb.16:
	cmp	r2, #1
	beq.w	.LBB25_39
@ %bb.17:
	cmp	r2, #0
	bne.w	.LBB25_26
@ %bb.18:
	movw	r1, #8188
	movs	r3, #0
	adds	r2, r0, r1
	str	r3, [r0, r1]
	movw	r0, :lower16:.L.str.47
	movt	r0, :upper16:.L.str.47
	strd	r3, r3, [r2, #4]
	str	r3, [r2, #12]
	str.w	r0, [lr]
	pop	{r4, r5, r7, pc}
	.p2align	2
.LBB25_19:
	adds	r0, #24
	pop.w	{r4, r5, r7, lr}
	b	credits_private_canvas_clear
	.p2align	2
.LBB25_20:
	cmp	r2, #0
                                        @ implicit-def: $lr
	bne.w	.LBB25_26
@ %bb.21:
	movw	r2, #8148
	movs	r5, #0
	adds	r3, r0, r2
	str	r5, [r0, r2]
	movw	r2, :lower16:.L.str.45
	movt	r2, :upper16:.L.str.45
	movs	r1, #32
	str.w	r2, [r12, #4060]
	movw	r2, #63136
	movt	r1, #3175
	movt	r2, #65535
	strd	r5, r5, [r3, #4]
	str	r5, [r3, #12]
	.p2align	2
.LBB25_22:                              @ =>This Inner Loop Header: Depth=1
	adds	r4, r0, r2
	cmp	r2, #0
	str.w	r1, [r4, #2424]
	str.w	r1, [r4, #2428]
	str.w	r1, [r4, #2432]
	str.w	r1, [r4, #2436]
	str.w	r1, [r4, #2440]
	str.w	r1, [r4, #2444]
	str.w	r1, [r4, #2448]
	str.w	r1, [r4, #2452]
	str.w	r1, [r4, #2456]
	str.w	r1, [r4, #2460]
	str.w	r1, [r4, #2464]
	str.w	r1, [r4, #2468]
	str.w	r1, [r4, #2472]
	str.w	r1, [r4, #2476]
	str.w	r1, [r4, #2480]
	str.w	r1, [r4, #2484]
	str.w	r1, [r4, #2488]
	str.w	r1, [r4, #2492]
	str.w	r1, [r4, #2496]
	str.w	r1, [r4, #2500]
	str.w	r1, [r4, #2504]
	str.w	r1, [r4, #2508]
	str.w	r1, [r4, #2512]
	str.w	r1, [r4, #2516]
	str.w	r1, [r4, #2520]
	str.w	r1, [r4, #2524]
	str.w	r1, [r4, #2528]
	str.w	r1, [r4, #2532]
	str.w	r1, [r4, #2536]
	str.w	r1, [r4, #2540]
	str.w	r1, [r4, #2544]
	str.w	r1, [r4, #2548]
	str.w	r1, [r4, #2552]
	str.w	r1, [r4, #2556]
	str.w	r1, [r4, #2560]
	str.w	r1, [r4, #2564]
	str.w	r1, [r4, #2568]
	str.w	r1, [r4, #2572]
	str.w	r1, [r4, #2576]
	str.w	r1, [r4, #2580]
	str.w	r1, [r4, #2584]
	str.w	r1, [r4, #2588]
	str.w	r1, [r4, #2592]
	str.w	r1, [r4, #2596]
	str.w	r1, [r4, #2600]
	str.w	r1, [r4, #2604]
	str.w	r1, [r4, #2608]
	str.w	r1, [r4, #2612]
	str.w	r1, [r4, #2616]
	str.w	r1, [r4, #2620]
	str.w	r1, [r4, #2624]
	str.w	r1, [r4, #2628]
	str.w	r1, [r4, #2632]
	str.w	r1, [r4, #2636]
	str.w	r1, [r4, #2640]
	str.w	r1, [r4, #2644]
	str.w	r1, [r4, #2648]
	str.w	r1, [r4, #2652]
	str.w	r1, [r4, #2656]
	str.w	r1, [r4, #2660]
	beq.w	.LBB25_38
@ %bb.23:                               @   in Loop: Header=BB25_22 Depth=1
	str.w	r1, [r4, #2664]
	str.w	r1, [r4, #2668]
	str.w	r1, [r4, #2672]
	str.w	r1, [r4, #2676]
	str.w	r1, [r4, #2680]
	str.w	r1, [r4, #2684]
	str.w	r1, [r4, #2688]
	str.w	r1, [r4, #2692]
	str.w	r1, [r4, #2696]
	str.w	r1, [r4, #2700]
	str.w	r1, [r4, #2704]
	str.w	r1, [r4, #2708]
	str.w	r1, [r4, #2712]
	str.w	r1, [r4, #2716]
	str.w	r1, [r4, #2720]
	str.w	r1, [r4, #2724]
	str.w	r1, [r4, #2728]
	str.w	r1, [r4, #2732]
	str.w	r1, [r4, #2736]
	str.w	r1, [r4, #2740]
	str.w	r1, [r4, #2744]
	str.w	r1, [r4, #2748]
	str.w	r1, [r4, #2752]
	str.w	r1, [r4, #2756]
	str.w	r1, [r4, #2760]
	str.w	r1, [r4, #2764]
	str.w	r1, [r4, #2768]
	str.w	r1, [r4, #2772]
	str.w	r1, [r4, #2776]
	str.w	r1, [r4, #2780]
	str.w	r1, [r4, #2784]
	str.w	r1, [r4, #2788]
	str.w	r1, [r4, #2792]
	str.w	r1, [r4, #2796]
	str.w	r1, [r4, #2800]
	str.w	r1, [r4, #2804]
	str.w	r1, [r4, #2808]
	str.w	r1, [r4, #2812]
	str.w	r1, [r4, #2816]
	str.w	r1, [r4, #2820]
	str.w	r1, [r4, #2824]
	str.w	r1, [r4, #2828]
	str.w	r1, [r4, #2832]
	str.w	r1, [r4, #2836]
	str.w	r1, [r4, #2840]
	str.w	r1, [r4, #2844]
	str.w	r1, [r4, #2848]
	str.w	r1, [r4, #2852]
	str.w	r1, [r4, #2856]
	str.w	r1, [r4, #2860]
	str.w	r1, [r4, #2864]
	str.w	r1, [r4, #2868]
	str.w	r1, [r4, #2872]
	str.w	r1, [r4, #2876]
	str.w	r1, [r4, #2880]
	str.w	r1, [r4, #2884]
	str.w	r1, [r4, #2888]
	str.w	r1, [r4, #2892]
	str.w	r1, [r4, #2896]
	str.w	r1, [r4, #2900]
	add.w	r2, r2, #480
	b	.LBB25_22
	.p2align	2
.LBB25_24:
	cmp	r2, #2
	bhs	.LBB25_34
@ %bb.25:
	add.w	r1, r2, r2, lsl #2
	add.w	r0, r0, r1, lsl #2
	movw	r1, #8268
	movs	r3, #0
	adds	r2, r0, r1
	str	r3, [r0, r1]
	movw	r0, :lower16:.L.str.50
	movt	r0, :upper16:.L.str.50
	strd	r3, r3, [r2, #4]
	strd	r3, r0, [r2, #12]
                                        @ implicit-def: $lr
.LBB25_26:
	pop	{r4, r5, r7, pc}
	.p2align	2
.LBB25_27:
	cbnz	r2, .LBB25_34
@ %bb.28:
	mov.w	r2, #8128
	movs	r3, #0
	add.w	r1, r0, #8128
	str	r3, [r0, r2]
	movw	r0, :lower16:.L.str.44
	movt	r0, :upper16:.L.str.44
	strd	r3, r3, [r1, #4]
	str	r3, [r1, #12]
	str.w	r0, [r12, #4040]
	pop	{r4, r5, r7, pc}
	.p2align	2
.LBB25_29:
	cmp	r2, #1
	bgt	.LBB25_35
@ %bb.30:
	movs	r0, #0
	str.w	r0, [lr, #1864]
	pop	{r4, r5, r7, pc}
	.p2align	2
.LBB25_31:
	cmp	r2, #1
	bne	.LBB25_34
@ %bb.32:
	movs	r2, #0
.LBB25_33:
	add.w	r1, r2, r2, lsl #2
	add.w	r0, r0, r1, lsl #2
	movw	r1, #8028
	adds	r2, r0, r1
	movs	r3, #0
	str	r3, [r0, r1]
	strd	r3, r3, [r2, #4]
	strd	r3, r3, [r2, #12]
	pop	{r4, r5, r7, pc}
	.p2align	2
.LBB25_34:
	movw	r0, :lower16:.L.str.34
	movt	r0, :upper16:.L.str.34
	bl	credits_private_credits_fail
	.p2align	2
.LBB25_35:
	cmp	r2, #6
                                        @ implicit-def: $lr
	bne	.LBB25_26
@ %bb.36:
	movw	r1, #8168
	movs	r3, #0
	adds	r2, r0, r1
	str	r3, [r0, r1]
	movw	r0, :lower16:.L.str.46
	movt	r0, :upper16:.L.str.46
	strd	r3, r3, [r2, #4]
	str	r3, [r2, #12]
	str.w	r0, [r12, #4080]
	pop	{r4, r5, r7, pc}
	.p2align	2
.LBB25_37:
	movw	r1, #8248
	movs	r3, #0
	adds	r2, r0, r1
	str	r3, [r0, r1]
	movw	r0, :lower16:.L.str.50
	movt	r0, :upper16:.L.str.50
	strd	r3, r3, [r2, #4]
	str	r3, [r2, #12]
	str.w	r0, [lr, #60]
	pop	{r4, r5, r7, pc}
	.p2align	2
.LBB25_38:
	str.w	r1, [r0, #2664]
	str.w	r1, [r0, #2668]
	str.w	r1, [r0, #2672]
	str.w	r1, [r0, #2676]
	str.w	r1, [r0, #2680]
	str.w	r1, [r0, #2684]
	str.w	r1, [r0, #2688]
	str.w	r1, [r0, #2692]
	str.w	r1, [r0, #2696]
	str.w	r1, [r0, #2700]
	str.w	r1, [r0, #2704]
	str.w	r1, [r0, #2708]
	str.w	r1, [r0, #2712]
	str.w	r1, [r0, #2716]
	str.w	r1, [r0, #2720]
	str.w	r1, [r0, #2724]
	str.w	r1, [r0, #2728]
	str.w	r1, [r0, #2732]
	str.w	r1, [r0, #2736]
	str.w	r1, [r0, #2740]
	str.w	r1, [r0, #2744]
	str.w	r1, [r0, #2748]
	str.w	r1, [r0, #2752]
	str.w	r1, [r0, #2756]
	str.w	r1, [r0, #2760]
	str.w	r1, [r0, #2764]
	str.w	r1, [r0, #2768]
	str.w	r1, [r0, #2772]
	str.w	r1, [r0, #2776]
	str.w	r1, [r0, #2780]
	str.w	r1, [r0, #2784]
	str.w	r1, [r0, #2788]
	str.w	r1, [r0, #2904]
	str.w	r1, [r0, #2908]
	str.w	r1, [r0, #2912]
	str.w	r1, [r0, #2916]
	str.w	r1, [r0, #2920]
	str.w	r1, [r0, #2924]
	str.w	r1, [r0, #2928]
	str.w	r1, [r0, #2932]
	str.w	r1, [r0, #2936]
	str.w	r1, [r0, #2940]
	str.w	r1, [r0, #2944]
	str.w	r1, [r0, #2948]
	str.w	r1, [r0, #2952]
	str.w	r1, [r0, #2956]
	str.w	r1, [r0, #2960]
	str.w	r1, [r0, #2964]
	str.w	r1, [r0, #2968]
	str.w	r1, [r0, #2972]
	str.w	r1, [r0, #2976]
	str.w	r1, [r0, #2980]
	str.w	r1, [r0, #2984]
	str.w	r1, [r0, #2988]
	str.w	r1, [r0, #2992]
	str.w	r1, [r0, #2996]
	str.w	r1, [r0, #3000]
	str.w	r1, [r0, #3004]
	str.w	r1, [r0, #3008]
	str.w	r1, [r0, #3012]
	str.w	r1, [r0, #3016]
	str.w	r1, [r0, #3020]
	str.w	r1, [r0, #3024]
	str.w	r1, [r0, #3028]
	str.w	r1, [r0, #3144]
	str.w	r1, [r0, #3148]
	str.w	r1, [r0, #3152]
	str.w	r1, [r0, #3156]
	str.w	r1, [r0, #3160]
	str.w	r1, [r0, #3164]
	str.w	r1, [r0, #3168]
	str.w	r1, [r0, #3172]
	str.w	r1, [r0, #3176]
	str.w	r1, [r0, #3180]
	str.w	r1, [r0, #3184]
	str.w	r1, [r0, #3188]
	str.w	r1, [r0, #3192]
	str.w	r1, [r0, #3196]
	str.w	r1, [r0, #3200]
	str.w	r1, [r0, #3204]
	str.w	r1, [r0, #3208]
	str.w	r1, [r0, #3212]
	str.w	r1, [r0, #3216]
	str.w	r1, [r0, #3220]
	str.w	r1, [r0, #3224]
	str.w	r1, [r0, #3228]
	str.w	r1, [r0, #3232]
	str.w	r1, [r0, #3236]
	str.w	r1, [r0, #3240]
	str.w	r1, [r0, #3244]
	str.w	r1, [r0, #3248]
	str.w	r1, [r0, #3252]
	str.w	r1, [r0, #3256]
	str.w	r1, [r0, #3260]
	str.w	r1, [r0, #3264]
	str.w	r1, [r0, #3268]
	str.w	r1, [r0, #3384]
	str.w	r1, [r0, #3388]
	str.w	r1, [r0, #3392]
	str.w	r1, [r0, #3396]
	str.w	r1, [r0, #3400]
	str.w	r1, [r0, #3404]
	str.w	r1, [r0, #3408]
	str.w	r1, [r0, #3412]
	str.w	r1, [r0, #3416]
	str.w	r1, [r0, #3420]
	str.w	r1, [r0, #3424]
	str.w	r1, [r0, #3428]
	str.w	r1, [r0, #3432]
	str.w	r1, [r0, #3436]
	str.w	r1, [r0, #3440]
	str.w	r1, [r0, #3444]
	str.w	r1, [r0, #3448]
	str.w	r1, [r0, #3452]
	str.w	r1, [r0, #3456]
	str.w	r1, [r0, #3460]
	str.w	r1, [r0, #3464]
	str.w	r1, [r0, #3468]
	str.w	r1, [r0, #3472]
	str.w	r1, [r0, #3476]
	str.w	r1, [r0, #3480]
	str.w	r1, [r0, #3484]
	str.w	r1, [r0, #3488]
	str.w	r1, [r0, #3492]
	str.w	r1, [r0, #3496]
	str.w	r1, [r0, #3500]
	str.w	r1, [r0, #3504]
	str.w	r1, [r0, #3508]
	str.w	r1, [r0, #3624]
	str.w	r1, [r0, #3628]
	str.w	r1, [r0, #3632]
	str.w	r1, [r0, #3636]
	str.w	r1, [r0, #3640]
	str.w	r1, [r0, #3644]
	str.w	r1, [r0, #3648]
	str.w	r1, [r0, #3652]
	str.w	r1, [r0, #3656]
	str.w	r1, [r0, #3660]
	str.w	r1, [r0, #3664]
	str.w	r1, [r0, #3668]
	str.w	r1, [r0, #3672]
	str.w	r1, [r0, #3676]
	str.w	r1, [r0, #3680]
	str.w	r1, [r0, #3684]
	str.w	r1, [r0, #3688]
	str.w	r1, [r0, #3692]
	str.w	r1, [r0, #3696]
	str.w	r1, [r0, #3700]
	str.w	r1, [r0, #3704]
	str.w	r1, [r0, #3708]
	str.w	r1, [r0, #3712]
	str.w	r1, [r0, #3716]
	str.w	r1, [r0, #3720]
	str.w	r1, [r0, #3724]
	str.w	r1, [r0, #3728]
	str.w	r1, [r0, #3732]
	str.w	r1, [r0, #3736]
	str.w	r1, [r0, #3740]
	str.w	r1, [r0, #3744]
	str.w	r1, [r0, #3748]
	str.w	r1, [r0, #3864]
	str.w	r1, [r0, #3868]
	str.w	r1, [r0, #3872]
	str.w	r1, [r0, #3876]
	str.w	r1, [r0, #3880]
	str.w	r1, [r0, #3884]
	str.w	r1, [r0, #3888]
	str.w	r1, [r0, #3892]
	str.w	r1, [r0, #3896]
	str.w	r1, [r0, #3900]
	str.w	r1, [r0, #3904]
	str.w	r1, [r0, #3908]
	str.w	r1, [r0, #3912]
	str.w	r1, [r0, #3916]
	str.w	r1, [r0, #3920]
	str.w	r1, [r0, #3924]
	str.w	r1, [r0, #3928]
	str.w	r1, [r0, #3932]
	str.w	r1, [r0, #3936]
	str.w	r1, [r0, #3940]
	str.w	r1, [r0, #3944]
	str.w	r1, [r0, #3948]
	str.w	r1, [r0, #3952]
	str.w	r1, [r0, #3956]
	str.w	r1, [r0, #3960]
	str.w	r1, [r0, #3964]
	str.w	r1, [r0, #3968]
	str.w	r1, [r0, #3972]
	str.w	r1, [r0, #3976]
	str.w	r1, [r0, #3980]
	str.w	r1, [r0, #3984]
	str.w	r1, [r0, #3988]
	strd	r1, r1, [r12]
	strd	r1, r1, [r12, #8]
	strd	r1, r1, [r12, #16]
	strd	r1, r1, [r12, #24]
	strd	r1, r1, [r12, #32]
	strd	r1, r1, [r12, #40]
	strd	r1, r1, [r12, #48]
	strd	r1, r1, [r12, #56]
	strd	r1, r1, [r12, #64]
	strd	r1, r1, [r12, #72]
	strd	r1, r1, [r12, #80]
	strd	r1, r1, [r12, #88]
	strd	r1, r1, [r12, #96]
	strd	r1, r1, [r12, #104]
	strd	r1, r1, [r12, #112]
	strd	r1, r1, [r12, #120]
	pop	{r4, r5, r7, pc}
	.p2align	2
.LBB25_39:
	movw	r1, #8208
	movs	r3, #0
	adds	r2, r0, r1
	str	r3, [r0, r1]
	movw	r0, :lower16:.L.str.48
	movt	r0, :upper16:.L.str.48
	strd	r3, r3, [r2, #4]
	str	r3, [r2, #12]
	str.w	r0, [lr, #20]
	pop	{r4, r5, r7, pc}
	.p2align	2
.LBB25_40:
	movw	r1, #8228
	movs	r3, #0
	adds	r2, r0, r1
	str	r3, [r0, r1]
	movw	r0, :lower16:.L.str.49
	movt	r0, :upper16:.L.str.49
	strd	r3, r3, [r2, #4]
	str	r3, [r2, #12]
	str.w	r0, [lr, #40]
	pop	{r4, r5, r7, pc}
.Lfunc_end25:
	.size	credits_private_credits_create_generator, .Lfunc_end25-credits_private_credits_create_generator
	.cantunwind
	.fnend
                                        @ -- End function
	.p2align	1                               @ -- Begin function credits_private_credits_no_clear
	.prefalign	2, .Lfunc_end26, nop
	.type	credits_private_credits_no_clear,%function
	.code	16
	.thumb_func
credits_private_credits_no_clear:       @ @credits_private_credits_no_clear
	.fnstart
@ %bb.0:
	bx	lr
.Lfunc_end26:
	.size	credits_private_credits_no_clear, .Lfunc_end26-credits_private_credits_no_clear
	.cantunwind
	.fnend
                                        @ -- End function
	.globl	credits_private_credits_request_generator @ -- Begin function credits_private_credits_request_generator
	.p2align	2
	.type	credits_private_credits_request_generator,%function
	.code	16
	.thumb_func
credits_private_credits_request_generator: @ @credits_private_credits_request_generator
	.fnstart
@ %bb.0:
	.save	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	push.w	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	.pad	#372
	sub	sp, #372
	mov	r9, r0
	movw	r0, #10008
	mov	r6, r2
	add.w	r2, r9, r0
	cmp	r1, #21
	strd	r1, r6, [r2, #144]
	bhi.w	.LBB27_429
@ %bb.1:
	movw	r0, #4828
	add	r0, r9
	str	r0, [sp, #64]                   @ 4-byte Spill
	str.w	r9, [sp, #88]                   @ 4-byte Spill
	str	r6, [sp, #100]                  @ 4-byte Spill
.LCPI27_2:
	tbh	[pc, r1, lsl #1]
@ %bb.2:
.LJTI27_0:
	.short	(.LBB27_131-(.LCPI27_2+4))/2
	.short	(.LBB27_132-(.LCPI27_2+4))/2
	.short	(.LBB27_422-(.LCPI27_2+4))/2
	.short	(.LBB27_3-(.LCPI27_2+4))/2
	.short	(.LBB27_3-(.LCPI27_2+4))/2
	.short	(.LBB27_3-(.LCPI27_2+4))/2
	.short	(.LBB27_151-(.LCPI27_2+4))/2
	.short	(.LBB27_130-(.LCPI27_2+4))/2
	.short	(.LBB27_32-(.LCPI27_2+4))/2
	.short	(.LBB27_32-(.LCPI27_2+4))/2
	.short	(.LBB27_140-(.LCPI27_2+4))/2
	.short	(.LBB27_118-(.LCPI27_2+4))/2
	.short	(.LBB27_126-(.LCPI27_2+4))/2
	.short	(.LBB27_137-(.LCPI27_2+4))/2
	.short	(.LBB27_46-(.LCPI27_2+4))/2
	.short	(.LBB27_46-(.LCPI27_2+4))/2
	.short	(.LBB27_104-(.LCPI27_2+4))/2
	.short	(.LBB27_133-(.LCPI27_2+4))/2
	.short	(.LBB27_153-(.LCPI27_2+4))/2
	.short	(.LBB27_156-(.LCPI27_2+4))/2
	.short	(.LBB27_138-(.LCPI27_2+4))/2
	.short	(.LBB27_143-(.LCPI27_2+4))/2
	.p2align	1
	.p2align	2
.LBB27_3:
	cmp	r6, #0
	beq.w	.LBB27_101
@ %bb.4:
	cmp	r1, #4
	beq.w	.LBB27_161
@ %bb.5:
	cmp	r1, #5
	bne.w	.LBB27_164
@ %bb.6:
	movw	r1, :lower16:.L__const.credits_private_scenes60_fatal_error.text
	add	r4, sp, #104
	movw	r5, #22144
	movw	r8, #45279
	movw	r6, #65534
	movt	r1, :upper16:.L__const.credits_private_scenes60_fatal_error.text
	mov	r0, r4
	mov.w	r2, #256
	movt	r5, #40236
	movt	r8, #39176
	movt	r6, #32767
	bl	__aeabi_memcpy4
	mov	r0, r4
	bl	strlen
	str	r0, [sp, #56]                   @ 4-byte Spill
	ldr	r4, [sp, #64]                   @ 4-byte Reload
	addw	r10, r9, #2492
	addw	r0, r4, #2516
	str	r0, [sp, #52]                   @ 4-byte Spill
	movw	r0, #4856
	add	r0, r9
	str	r0, [sp, #80]                   @ 4-byte Spill
	movw	r0, #4852
	add	r0, r9
	str	r0, [sp, #76]                   @ 4-byte Spill
	movw	r0, #4848
	add	r0, r9
	movw	r9, #64628
	add.w	lr, r4, #12
	str	r0, [sp, #84]                   @ 4-byte Spill
	movs	r0, #0
	movt	r9, #65535
	strd	lr, r10, [sp, #92]              @ 8-byte Folded Spill
	.p2align	2
.LBB27_7:                               @ =>This Loop Header: Depth=1
                                        @     Child Loop BB27_8 Depth 2
                                        @       Child Loop BB27_10 Depth 3
                                        @         Child Loop BB27_12 Depth 4
	str	r0, [sp, #44]                   @ 4-byte Spill
	cmp	r0, #3
	movw	r1, :lower16:.L.str.169
	movw	r0, :lower16:.L.str.112
	movt	r1, :upper16:.L.str.169
	movt	r0, :upper16:.L.str.112
	it	eq
	moveq	r1, r0
	movs	r0, #0
	str	r1, [sp, #48]                   @ 4-byte Spill
	str	r0, [sp, #60]                   @ 4-byte Spill
	.p2align	2
.LBB27_8:                               @   Parent Loop BB27_7 Depth=1
                                        @ =>  This Loop Header: Depth=2
                                        @       Child Loop BB27_10 Depth 3
                                        @         Child Loop BB27_12 Depth 4
	ldr	r0, [sp, #52]                   @ 4-byte Reload
	ldrd	r7, r3, [r0]
	ldr.w	r0, [r4, #2508]
	b	.LBB27_10
	.p2align	2
.LBB27_9:                               @   in Loop: Header=BB27_10 Depth=3
	adds	r2, r0, #1
	str.w	r2, [r4, #2508]
	ldr.w	r0, [lr, r0, lsl #2]
	adds	r7, #1
	eor.w	r0, r0, r0, lsr #11
	and.w	r1, r5, r0, lsl #7
	eor.w	r0, r0, r1
	movw	r1, #0
	movt	r1, #61382
	and.w	r1, r1, r0, lsl #15
	eor.w	r1, r1, r0
	adc	r3, r3, #0
	cmp	r1, #0
	mov	r0, r2
	bpl.w	.LBB27_14
.LBB27_10:                              @   Parent Loop BB27_7 Depth=1
                                        @     Parent Loop BB27_8 Depth=2
                                        @ =>    This Loop Header: Depth=3
                                        @         Child Loop BB27_12 Depth 4
	cmp.w	r0, #624
	blt	.LBB27_9
@ %bb.11:                               @   in Loop: Header=BB27_10 Depth=3
	ldr.w	r12, [lr]
	strd	r3, r7, [sp, #68]               @ 8-byte Folded Spill
	movs	r3, #0
	mov	r11, r9
	mov.w	r10, #0
	.p2align	2
.LBB27_12:                              @   Parent Loop BB27_7 Depth=1
                                        @     Parent Loop BB27_8 Depth=2
                                        @       Parent Loop BB27_10 Depth=3
                                        @ =>      This Inner Loop Header: Depth=4
	ldr.w	r9, [sp, #96]                   @ 4-byte Reload
	mov	r4, r11
	add.w	r0, r9, r10
	add.w	r1, r9, r3, lsl #2
	str	r0, [sp, #100]                  @ 4-byte Spill
	ldr.w	r7, [r1, #2352]
	cmp	r3, #227
	it	lo
	movwlo	r4, #1588
	add	r4, lr
	and	r5, r12, #-2147483648
	mov	r12, r6
	ands	r6, r7
	ldr.w	r4, [r4, r3, lsl #2]
	add	r6, r5
	eor.w	r6, r4, r6, lsr #1
	lsls	r5, r7, #31
	it	ne
	eorne.w	r6, r6, r8
	ldr	r2, [sp, #84]                   @ 4-byte Reload
	str.w	r6, [r0, #2348]
	mov	r0, r11
	ldr.w	r6, [r2, r3, lsl #2]
	cmp	r3, #226
	it	lo
	movwlo	r0, #1588
	add	r0, r9
	add.w	r0, r0, r3, lsl #2
	and	r7, r7, #-2147483648
	and.w	r4, r6, r12
	ldr.w	r0, [r0, #2352]
	add	r7, r4
	eor.w	r0, r0, r7, lsr #1
	lsls	r7, r6, #31
	it	ne
	eorne.w	r0, r0, r8
	ldr.w	lr, [sp, #76]                   @ 4-byte Reload
	str.w	r0, [r1, #2352]
	and	r0, r6, #-2147483648
	ldr.w	r6, [lr, r3, lsl #2]
	mov	r4, r11
	add.w	r5, r2, r3, lsl #2
	cmp	r3, #225
	it	lo
	movwlo	r4, #1588
	ldr	r5, [r5, r4]
	and.w	r4, r6, r12
	add	r0, r4
	eor.w	r0, r5, r0, lsr #1
	lsls	r5, r6, #31
	it	ne
	eorne.w	r0, r0, r8
	str.w	r0, [r2, r3, lsl #2]
	ldr	r2, [sp, #80]                   @ 4-byte Reload
	mov	r4, r11
	ldr.w	r5, [r2, r3, lsl #2]
	add.w	r7, lr, r3, lsl #2
	cmp	r3, #224
	it	lo
	movwlo	r4, #1588
	and	r0, r6, #-2147483648
	ldr	r7, [r7, r4]
	and.w	r4, r5, r12
	add	r0, r4
	eor.w	r0, r7, r0, lsr #1
	lsls	r7, r5, #31
	it	ne
	eorne.w	r0, r0, r8
	str.w	r0, [lr, r3, lsl #2]
	ldr.w	r0, [r1, #2368]
	add.w	r6, r2, r3, lsl #2
	mov	r4, r11
	and	r7, r5, #-2147483648
	and.w	r5, r0, r12
	cmp	r3, #223
	it	lo
	movwlo	r4, #1588
	ldr	r6, [r6, r4]
	add	r7, r5
	eor.w	r7, r6, r7, lsr #1
	lsls	r6, r0, #31
	it	ne
	eorne.w	r7, r7, r8
	str.w	r7, [r2, r3, lsl #2]
	ldr	r2, [sp, #88]                   @ 4-byte Reload
	mov	r5, r11
	add.w	lr, r2, r3, lsl #2
	mov.w	r2, #4864
	ldr.w	r7, [lr, r2]
	cmp	r3, #222
	it	lo
	movwlo	r5, #1588
	add	r5, r9
	add.w	r5, r5, r3, lsl #2
	and	r0, r0, #-2147483648
	and.w	r6, r7, r12
	ldr.w	r5, [r5, #2368]
	add	r0, r6
	eor.w	r0, r5, r0, lsr #1
	lsls	r6, r7, #31
	it	ne
	eorne.w	r0, r0, r8
	str.w	r0, [r1, #2368]
	and	r1, r7, #-2147483648
	ldr	r7, [sp, #100]                  @ 4-byte Reload
	mov	r6, r12
	ldr.w	r12, [r7, #2376]
	mov	r4, r11
	add.w	r0, lr, #4864
	cmp	r3, #221
	it	lo
	movwlo	r4, #1588
	ldr	r0, [r0, r4]
	and.w	r4, r12, r6
	add	r1, r4
	eor.w	r0, r0, r1, lsr #1
	lsls.w	r1, r12, #31
	it	ne
	eorne.w	r0, r0, r8
	str.w	r0, [lr, r2]
	ldr.w	lr, [sp, #92]                   @ 4-byte Reload
	adds	r3, #7
	movw	r0, #623
	cmp	r3, r0
	add.w	r10, r10, #28
	bne.w	.LBB27_12
@ %bb.13:                               @   in Loop: Header=BB27_10 Depth=3
	ldr	r4, [sp, #64]                   @ 4-byte Reload
	movw	r5, #22144
	ldr.w	r0, [r4, #2504]
	ldr	r1, [r4, #12]
	and	r0, r0, #-2147483648
	and.w	r2, r1, r6
	ldr.w	r3, [r4, #1596]
	add	r0, r2
	eor.w	r0, r3, r0, lsr #1
	lsls	r1, r1, #31
	it	ne
	eorne.w	r0, r0, r8
	ldr.w	r10, [sp, #96]                  @ 4-byte Reload
	ldrd	r3, r7, [sp, #68]               @ 8-byte Folded Reload
	str.w	r0, [r4, #2504]
	movs	r0, #0
	movt	r5, #40236
	mov	r9, r11
	b	.LBB27_9
	.p2align	2
.LBB27_14:                              @   in Loop: Header=BB27_8 Depth=2
	ldr	r0, [sp, #52]                   @ 4-byte Reload
	movw	r12, :lower16:.L.str.168
	strd	r7, r3, [r0]
	lsrs	r3, r1, #15
	ldr	r1, [sp, #56]                   @ 4-byte Reload
	add	r0, sp, #104
	add	r0, r1
	rsb.w	r7, r1, #256
	ldr	r1, [sp, #60]                   @ 4-byte Reload
	movt	r12, :upper16:.L.str.168
	cmp	r1, #7
	ldr	r1, [sp, #48]                   @ 4-byte Reload
	movw	r2, :lower16:.L.str.167
	it	eq
	moveq	r12, r1
	mov	r1, r7
	movt	r2, :upper16:.L.str.167
	mov	r11, r10
	str.w	r12, [sp]
	bl	snprintf
	cmp	r0, #0
	bmi.w	.LBB27_426
@ %bb.15:                               @   in Loop: Header=BB27_8 Depth=2
	cmp	r0, r7
	bhs.w	.LBB27_426
@ %bb.16:                               @   in Loop: Header=BB27_8 Depth=2
	ldr	r1, [sp, #60]                   @ 4-byte Reload
	mov	r10, r11
	adds	r1, #1
	str	r1, [sp, #60]                   @ 4-byte Spill
	cmp	r1, #8
	ldr	r1, [sp, #56]                   @ 4-byte Reload
	add	r1, r0
	str	r1, [sp, #56]                   @ 4-byte Spill
	ldr.w	lr, [sp, #92]                   @ 4-byte Reload
	bne.w	.LBB27_8
@ %bb.17:                               @   in Loop: Header=BB27_7 Depth=1
	ldr	r0, [sp, #44]                   @ 4-byte Reload
	adds	r0, #1
	cmp	r0, #4
	bne.w	.LBB27_7
@ %bb.18:
	movw	r0, :lower16:.L.str.83
	movt	r0, :upper16:.L.str.83
	bl	credits_private_canvas60_style
	ldrb.w	r7, [sp, #104]
	cmp	r7, #0
	beq.w	.LBB27_422
@ %bb.19:
	ldr	r1, [sp, #88]                   @ 4-byte Reload
	add	r4, sp, #104
	adds	r1, #24
	movs	r2, #1
	movs	r6, #2
	b	.LBB27_23
	.p2align	2
.LBB27_20:                              @   in Loop: Header=BB27_23 Depth=1
	adds	r2, #1
.LBB27_21:                              @   in Loop: Header=BB27_23 Depth=1
	movs	r5, #2
.LBB27_22:                              @   in Loop: Header=BB27_23 Depth=1
	ldrb	r7, [r4]
	mov	r6, r5
	cmp	r7, #0
	beq.w	.LBB27_422
.LBB27_23:                              @ =>This Inner Loop Header: Depth=1
	sub.w	r3, r7, #194
	cmp	r3, #29
	add.w	r3, r4, #1
	bhi	.LBB27_26
@ %bb.24:                               @   in Loop: Header=BB27_23 Depth=1
	ldrsb.w	r3, [r3]
	cmn.w	r3, #65
	bgt.w	.LBB27_425
@ %bb.25:                               @   in Loop: Header=BB27_23 Depth=1
	and	r3, r3, #63
	bfi	r3, r7, #6, #5
	adds	r4, #2
	mov	r7, r3
	b	.LBB27_27
	.p2align	2
.LBB27_26:                              @   in Loop: Header=BB27_23 Depth=1
	sxtb	r5, r7
	cmp.w	r5, #-1
	mov	r4, r3
	ble.w	.LBB27_425
.LBB27_27:                              @   in Loop: Header=BB27_23 Depth=1
	cmp	r7, #13
	beq	.LBB27_21
@ %bb.28:                               @   in Loop: Header=BB27_23 Depth=1
	cmp	r7, #10
	beq	.LBB27_20
@ %bb.29:                               @   in Loop: Header=BB27_23 Depth=1
	cmp	r6, #59
	add.w	r5, r6, #1
	it	ls
	cmpls	r2, #20
	blo	.LBB27_31
@ %bb.30:                               @   in Loop: Header=BB27_23 Depth=1
	ldr	r7, [sp, #64]                   @ 4-byte Reload
	ldr	r3, [r7]
	adds	r3, #1
	str	r3, [r7]
	b	.LBB27_22
	.p2align	2
.LBB27_31:                              @   in Loop: Header=BB27_23 Depth=1
	orr.w	r3, r7, r0
	rsb	r7, r2, r2, lsl #4
	add.w	r7, r1, r7, lsl #4
	str.w	r3, [r7, r6, lsl #2]
	b	.LBB27_22
	.p2align	2
.LBB27_32:
	movw	r0, :lower16:.L.str.140
	movw	r8, :lower16:.L.str.184
	mov.w	r11, #30
	movs	r2, #35
	movt	r0, :upper16:.L.str.140
	movt	r8, :upper16:.L.str.184
	cmp	r6, #0
	it	eq
	moveq.w	r11, #26
	it	eq
	moveq	r2, #64
	it	eq
	moveq	r8, r0
	add.w	r0, r9, r1, lsl #3
	movw	r3, #10044
	adds	r5, r0, r3
	cmp	r1, #8
	it	ne
	movne	r1, #4
	ldr.w	r0, [r5, r6, lsl #2]
	add.w	r10, sp, #104
	it	eq
	moveq.w	r11, #26
	cmp	r0, #0
	mov	r0, r10
	it	eq
	moveq	r2, #46
	mov	r4, r9
	mov	r6, r1
	bl	__aeabi_memset4
	movs	r0, #0
	ldrb.w	r9, [sp, #104]
	strb.w	r0, [r10, r6]
	mov	r0, r8
	bl	credits_private_canvas60_style
	cmp.w	r9, #0
	str	r5, [sp, #96]                   @ 4-byte Spill
	beq.w	.LBB27_159
@ %bb.33:
	add.w	r10, r4, #24
	add	r4, sp, #104
	movs	r1, #7
	mov	r7, r9
	mov	r3, r11
	b	.LBB27_37
	.p2align	2
.LBB27_34:                              @   in Loop: Header=BB27_37 Depth=1
	adds	r1, #1
.LBB27_35:                              @   in Loop: Header=BB27_37 Depth=1
	mov	r5, r11
.LBB27_36:                              @   in Loop: Header=BB27_37 Depth=1
	ldrb	r7, [r4]
	mov	r3, r5
	cmp	r7, #0
	beq.w	.LBB27_62
.LBB27_37:                              @ =>This Inner Loop Header: Depth=1
	add.w	r6, r7, #62
	uxtb	r6, r6
	adds	r2, r4, #1
	cmp	r6, #29
	uxtb	r6, r7
	bhi	.LBB27_40
@ %bb.38:                               @   in Loop: Header=BB27_37 Depth=1
	ldrsb.w	r2, [r2]
	cmn.w	r2, #65
	bgt.w	.LBB27_425
@ %bb.39:                               @   in Loop: Header=BB27_37 Depth=1
	and	r2, r2, #63
	bfi	r2, r6, #6, #5
	adds	r4, #2
	mov	r6, r2
	b	.LBB27_41
	.p2align	2
.LBB27_40:                              @   in Loop: Header=BB27_37 Depth=1
	sxtb	r7, r7
	cmp.w	r7, #-1
	mov	r4, r2
	ble.w	.LBB27_425
.LBB27_41:                              @   in Loop: Header=BB27_37 Depth=1
	cmp	r6, #13
	beq	.LBB27_35
@ %bb.42:                               @   in Loop: Header=BB27_37 Depth=1
	cmp	r6, #10
	beq	.LBB27_34
@ %bb.43:                               @   in Loop: Header=BB27_37 Depth=1
	cmp	r3, #59
	add.w	r5, r3, #1
	it	ls
	cmpls	r1, #20
	blo	.LBB27_45
@ %bb.44:                               @   in Loop: Header=BB27_37 Depth=1
	ldr	r3, [sp, #64]                   @ 4-byte Reload
	ldr	r2, [r3]
	adds	r2, #1
	str	r2, [r3]
	b	.LBB27_36
	.p2align	2
.LBB27_45:                              @   in Loop: Header=BB27_37 Depth=1
	rsb	r7, r1, r1, lsl #4
	orr.w	r2, r6, r0
	add.w	r7, r10, r7, lsl #4
	str.w	r2, [r7, r3, lsl #2]
	b	.LBB27_36
	.p2align	2
.LBB27_46:
	cmp	r6, #2
	beq.w	.LBB27_183
@ %bb.47:
	cmp	r6, #1
	beq.w	.LBB27_168
@ %bb.48:
	cmp	r6, #0
	bne.w	.LBB27_185
@ %bb.49:
	movw	r0, :lower16:.L.str.45
	movt	r0, :upper16:.L.str.45
	add.w	r4, r9, #24
	bl	credits_private_canvas60_style
	movw	r5, :lower16:.L.str.186
	movt	r5, :upper16:.L.str.186
	movs	r1, #7
	movs	r3, #13
	movs	r7, #45
	b	.LBB27_52
	.p2align	2
.LBB27_50:                              @   in Loop: Header=BB27_52 Depth=1
	mov	r6, r7
.LBB27_51:                              @   in Loop: Header=BB27_52 Depth=1
	ldrb	r7, [r5]
	mov	r3, r6
	cmp	r7, #0
	beq.w	.LBB27_422
.LBB27_52:                              @ =>This Inner Loop Header: Depth=1
	sub.w	r2, r7, #194
	cmp	r2, #29
	add.w	r2, r5, #1
	bhi	.LBB27_55
@ %bb.53:                               @   in Loop: Header=BB27_52 Depth=1
	ldrsb.w	r2, [r2]
	cmn.w	r2, #65
	bgt.w	.LBB27_425
@ %bb.54:                               @   in Loop: Header=BB27_52 Depth=1
	and	r2, r2, #63
	bfi	r2, r7, #6, #5
	adds	r5, #2
	mov	r7, r2
	b	.LBB27_56
	.p2align	2
.LBB27_55:                              @   in Loop: Header=BB27_52 Depth=1
	sxtb	r6, r7
	cmp.w	r6, #-1
	mov	r5, r2
	ble.w	.LBB27_425
.LBB27_56:                              @   in Loop: Header=BB27_52 Depth=1
	cmp	r7, #13
	beq	.LBB27_50
@ %bb.57:                               @   in Loop: Header=BB27_52 Depth=1
	cmp	r7, #10
	bne	.LBB27_59
@ %bb.58:                               @   in Loop: Header=BB27_52 Depth=1
	adds	r1, #1
	movs	r6, #13
	b	.LBB27_51
	.p2align	2
.LBB27_59:                              @   in Loop: Header=BB27_52 Depth=1
	cmp	r3, #59
	add.w	r6, r3, #1
	it	ls
	cmpls	r1, #20
	blo	.LBB27_61
@ %bb.60:                               @   in Loop: Header=BB27_52 Depth=1
	ldr	r3, [sp, #64]                   @ 4-byte Reload
	ldr	r2, [r3]
	adds	r2, #1
	str	r2, [r3]
	b	.LBB27_51
	.p2align	2
.LBB27_61:                              @   in Loop: Header=BB27_52 Depth=1
	orr.w	r2, r7, r0
	rsb	r7, r1, r1, lsl #4
	add.w	r7, r4, r7, lsl #4
	str.w	r2, [r7, r3, lsl #2]
	b	.LBB27_51
	.p2align	2
.LBB27_62:
	mov	r0, r8
	bl	credits_private_canvas60_style
	add	r5, sp, #104
	movs	r1, #8
	mov	r7, r9
	mov	r3, r11
	b	.LBB27_66
	.p2align	2
.LBB27_63:                              @   in Loop: Header=BB27_66 Depth=1
	adds	r1, #1
.LBB27_64:                              @   in Loop: Header=BB27_66 Depth=1
	mov	r4, r11
.LBB27_65:                              @   in Loop: Header=BB27_66 Depth=1
	ldrb	r7, [r5]
	mov	r3, r4
	cbz	r7, .LBB27_75
.LBB27_66:                              @ =>This Inner Loop Header: Depth=1
	add.w	r6, r7, #62
	uxtb	r6, r6
	adds	r2, r5, #1
	cmp	r6, #30
	uxtb	r6, r7
	bhs	.LBB27_69
@ %bb.67:                               @   in Loop: Header=BB27_66 Depth=1
	ldrsb.w	r2, [r2]
	cmn.w	r2, #65
	bgt.w	.LBB27_425
@ %bb.68:                               @   in Loop: Header=BB27_66 Depth=1
	and	r2, r2, #63
	bfi	r2, r6, #6, #5
	adds	r5, #2
	mov	r6, r2
	b	.LBB27_70
	.p2align	2
.LBB27_69:                              @   in Loop: Header=BB27_66 Depth=1
	sxtb	r7, r7
	cmp	r7, #0
	mov	r5, r2
	bmi.w	.LBB27_425
.LBB27_70:                              @   in Loop: Header=BB27_66 Depth=1
	cmp	r6, #13
	beq	.LBB27_64
@ %bb.71:                               @   in Loop: Header=BB27_66 Depth=1
	cmp	r6, #10
	beq	.LBB27_63
@ %bb.72:                               @   in Loop: Header=BB27_66 Depth=1
	cmp	r3, #59
	add.w	r4, r3, #1
	it	ls
	cmpls	r1, #19
	bls	.LBB27_74
@ %bb.73:                               @   in Loop: Header=BB27_66 Depth=1
	ldr	r3, [sp, #64]                   @ 4-byte Reload
	ldr	r2, [r3]
	adds	r2, #1
	str	r2, [r3]
	b	.LBB27_65
	.p2align	2
.LBB27_74:                              @   in Loop: Header=BB27_66 Depth=1
	rsb	r7, r1, r1, lsl #4
	orr.w	r2, r6, r0
	add.w	r7, r10, r7, lsl #4
	str.w	r2, [r7, r3, lsl #2]
	b	.LBB27_65
	.p2align	2
.LBB27_75:
	mov	r0, r8
	bl	credits_private_canvas60_style
	add	r4, sp, #104
	movs	r1, #9
	mov	r7, r9
	mov	r3, r11
	b	.LBB27_79
	.p2align	2
.LBB27_76:                              @   in Loop: Header=BB27_79 Depth=1
	adds	r1, #1
.LBB27_77:                              @   in Loop: Header=BB27_79 Depth=1
	mov	r5, r11
.LBB27_78:                              @   in Loop: Header=BB27_79 Depth=1
	ldrb	r7, [r4]
	mov	r3, r5
	cbz	r7, .LBB27_88
.LBB27_79:                              @ =>This Inner Loop Header: Depth=1
	add.w	r6, r7, #62
	uxtb	r6, r6
	adds	r2, r4, #1
	cmp	r6, #30
	uxtb	r6, r7
	bhs	.LBB27_82
@ %bb.80:                               @   in Loop: Header=BB27_79 Depth=1
	ldrsb.w	r2, [r2]
	cmn.w	r2, #65
	bgt.w	.LBB27_425
@ %bb.81:                               @   in Loop: Header=BB27_79 Depth=1
	and	r2, r2, #63
	bfi	r2, r6, #6, #5
	adds	r4, #2
	mov	r6, r2
	b	.LBB27_83
	.p2align	2
.LBB27_82:                              @   in Loop: Header=BB27_79 Depth=1
	sxtb	r7, r7
	cmp	r7, #0
	mov	r4, r2
	bmi.w	.LBB27_425
.LBB27_83:                              @   in Loop: Header=BB27_79 Depth=1
	cmp	r6, #13
	beq	.LBB27_77
@ %bb.84:                               @   in Loop: Header=BB27_79 Depth=1
	cmp	r6, #10
	beq	.LBB27_76
@ %bb.85:                               @   in Loop: Header=BB27_79 Depth=1
	cmp	r3, #59
	add.w	r5, r3, #1
	it	ls
	cmpls	r1, #19
	bls	.LBB27_87
@ %bb.86:                               @   in Loop: Header=BB27_79 Depth=1
	ldr	r3, [sp, #64]                   @ 4-byte Reload
	ldr	r2, [r3]
	adds	r2, #1
	str	r2, [r3]
	b	.LBB27_78
	.p2align	2
.LBB27_87:                              @   in Loop: Header=BB27_79 Depth=1
	rsb	r7, r1, r1, lsl #4
	orr.w	r2, r6, r0
	add.w	r7, r10, r7, lsl #4
	str.w	r2, [r7, r3, lsl #2]
	b	.LBB27_78
	.p2align	2
.LBB27_88:
	mov	r0, r8
	bl	credits_private_canvas60_style
	ldr	r4, [sp, #64]                   @ 4-byte Reload
	add	r7, sp, #104
	movs	r1, #10
	mov	r3, r11
	b	.LBB27_92
	.p2align	2
.LBB27_89:                              @   in Loop: Header=BB27_92 Depth=1
	adds	r1, #1
.LBB27_90:                              @   in Loop: Header=BB27_92 Depth=1
	mov	r5, r11
.LBB27_91:                              @   in Loop: Header=BB27_92 Depth=1
	ldrb.w	r9, [r7]
	mov	r3, r5
	cmp.w	r9, #0
	beq.w	.LBB27_160
.LBB27_92:                              @ =>This Inner Loop Header: Depth=1
	add.w	r6, r9, #62
	uxtb	r6, r6
	adds	r2, r7, #1
	cmp	r6, #30
	uxtb.w	r6, r9
	bhs	.LBB27_95
@ %bb.93:                               @   in Loop: Header=BB27_92 Depth=1
	ldrsb.w	r2, [r2]
	cmn.w	r2, #65
	bgt.w	.LBB27_425
@ %bb.94:                               @   in Loop: Header=BB27_92 Depth=1
	and	r2, r2, #63
	bfi	r2, r6, #6, #5
	adds	r7, #2
	mov	r6, r2
	b	.LBB27_96
	.p2align	2
.LBB27_95:                              @   in Loop: Header=BB27_92 Depth=1
	sxtb.w	r7, r9
	cmp	r7, #0
	mov	r7, r2
	bmi.w	.LBB27_425
.LBB27_96:                              @   in Loop: Header=BB27_92 Depth=1
	cmp	r6, #13
	beq	.LBB27_90
@ %bb.97:                               @   in Loop: Header=BB27_92 Depth=1
	cmp	r6, #10
	beq	.LBB27_89
@ %bb.98:                               @   in Loop: Header=BB27_92 Depth=1
	cmp	r3, #59
	add.w	r5, r3, #1
	it	ls
	cmpls	r1, #19
	bls	.LBB27_100
@ %bb.99:                               @   in Loop: Header=BB27_92 Depth=1
	ldr	r2, [r4]
	adds	r2, #1
	str	r2, [r4]
	b	.LBB27_91
	.p2align	2
.LBB27_100:                             @   in Loop: Header=BB27_92 Depth=1
	orr.w	r2, r6, r0
	rsb	r6, r1, r1, lsl #4
	add.w	r6, r10, r6, lsl #4
	str.w	r2, [r6, r3, lsl #2]
	b	.LBB27_91
	.p2align	2
.LBB27_101:
	rsb	r0, r1, r1, lsl #5
	add.w	r0, r9, r0, lsl #4
	movw	r2, #6820
	cmp	r1, #5
	add.w	r5, r0, r2
	it	ne
	andsne	r0, r3, #1
	bne	.LBB27_103
@ %bb.102:
	adds	r1, r5, #1
	mov	r0, r5
	movs	r2, #59
	bl	__aeabi_memmove
	add.w	r0, r5, #60
	add.w	r1, r5, #61
	movs	r2, #59
	bl	__aeabi_memmove
	add.w	r0, r5, #120
	add.w	r1, r5, #121
	movs	r2, #59
	bl	__aeabi_memmove
	add.w	r0, r5, #180
	add.w	r1, r5, #181
	movs	r2, #59
	bl	__aeabi_memmove
	add.w	r0, r5, #240
	add.w	r1, r5, #241
	movs	r2, #59
	bl	__aeabi_memmove
	add.w	r0, r5, #300
	addw	r1, r5, #301
	movs	r2, #59
	bl	__aeabi_memmove
	add.w	r0, r5, #360
	addw	r1, r5, #361
	movs	r2, #59
	bl	__aeabi_memmove
	add.w	r0, r5, #420
	addw	r1, r5, #421
	movs	r2, #59
	bl	__aeabi_memmove
	ldr.w	r2, [r5, #480]
	mov	r0, r5
	movs	r1, #59
	bl	credits_private_ocean60_column
.LBB27_103:
	mov	r0, r9
	mov	r1, r5
	add	sp, #372
	pop.w	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	b	credits_private_credits_ocean_render
	.p2align	2
.LBB27_104:
	cmp	r6, #0
	beq.w	.LBB27_194
@ %bb.105:
	movw	r0, :lower16:.L.str.46
	movt	r0, :upper16:.L.str.46
	add.w	r4, r9, #24
	bl	credits_private_canvas60_style
	movw	r5, :lower16:.L.str.85
	movt	r5, :upper16:.L.str.85
	movs	r1, #1
	movs	r3, #2
	movs	r7, #65
	b	.LBB27_109
	.p2align	2
.LBB27_106:                             @   in Loop: Header=BB27_109 Depth=1
	adds	r1, #1
.LBB27_107:                             @   in Loop: Header=BB27_109 Depth=1
	movs	r6, #2
.LBB27_108:                             @   in Loop: Header=BB27_109 Depth=1
	ldrb	r7, [r5]
	mov	r3, r6
	cmp	r7, #0
	beq.w	.LBB27_422
.LBB27_109:                             @ =>This Inner Loop Header: Depth=1
	sub.w	r2, r7, #194
	cmp	r2, #29
	add.w	r2, r5, #1
	bhi	.LBB27_112
@ %bb.110:                              @   in Loop: Header=BB27_109 Depth=1
	ldrsb.w	r2, [r2]
	cmn.w	r2, #65
	bgt.w	.LBB27_425
@ %bb.111:                              @   in Loop: Header=BB27_109 Depth=1
	and	r2, r2, #63
	bfi	r2, r7, #6, #5
	adds	r5, #2
	mov	r7, r2
	b	.LBB27_113
	.p2align	2
.LBB27_112:                             @   in Loop: Header=BB27_109 Depth=1
	sxtb	r6, r7
	cmp.w	r6, #-1
	mov	r5, r2
	ble.w	.LBB27_425
.LBB27_113:                             @   in Loop: Header=BB27_109 Depth=1
	cmp	r7, #13
	beq	.LBB27_107
@ %bb.114:                              @   in Loop: Header=BB27_109 Depth=1
	cmp	r7, #10
	beq	.LBB27_106
@ %bb.115:                              @   in Loop: Header=BB27_109 Depth=1
	cmp	r3, #59
	add.w	r6, r3, #1
	it	ls
	cmpls	r1, #20
	blo	.LBB27_117
@ %bb.116:                              @   in Loop: Header=BB27_109 Depth=1
	ldr	r3, [sp, #64]                   @ 4-byte Reload
	ldr	r2, [r3]
	adds	r2, #1
	str	r2, [r3]
	b	.LBB27_108
	.p2align	2
.LBB27_117:                             @   in Loop: Header=BB27_109 Depth=1
	orr.w	r2, r7, r0
	rsb	r7, r1, r1, lsl #4
	add.w	r7, r4, r7, lsl #4
	str.w	r2, [r7, r3, lsl #2]
	b	.LBB27_108
	.p2align	2
.LBB27_118:
	cmp	r6, #3
	bhi.w	.LBB27_229
@ %bb.119:
.LCPI27_3:
	tbh	[pc, r6, lsl #1]
@ %bb.120:
.LJTI27_3:
	.short	(.LBB27_121-(.LCPI27_3+4))/2
	.short	(.LBB27_219-(.LCPI27_3+4))/2
	.short	(.LBB27_210-(.LCPI27_3+4))/2
	.short	(.LBB27_211-(.LCPI27_3+4))/2
	.p2align	1
	.p2align	2
.LBB27_121:
	ands	r1, r3, #63
	asr.w	r0, r3, #31
	it	ne
	movne	r1, #1
	add.w	r0, r3, r0, lsr #26
	and.w	r1, r1, r3, lsr #31
	rsb	r0, r1, r0, asr #6
	cmp	r0, #1
	blt.w	.LBB27_235
@ %bb.122:
	movw	r1, :lower16:.L__const.credits_private_credits_date.lengths
	movw	r7, #2009
	movs	r3, #22
	movs	r2, #9
	movt	r1, :upper16:.L__const.credits_private_credits_date.lengths
	b	.LBB27_124
	.p2align	2
.LBB27_123:                             @   in Loop: Header=BB27_124 Depth=1
	subs	r0, r0, r6
	cmp	r0, #0
	ble.w	.LBB27_234
.LBB27_124:                             @ =>This Inner Loop Header: Depth=1
	and	r6, r7, #3
	eor	r5, r2, #1
	orrs	r6, r5
	ldr.w	r5, [r1, r2, lsl #2]
	clz	r6, r6
	lsrs	r4, r6, #5
	subs	r6, r5, r3
	add	r6, r4
	adds	r6, #1
	cmp	r0, r6
	it	lt
	movlt	r6, r0
	add	r3, r6
	add	r5, r4
	cmp	r3, r5
	ble	.LBB27_123
@ %bb.125:                              @   in Loop: Header=BB27_124 Depth=1
	cmp	r2, #10
	add.w	r2, r2, #1
	mov.w	r3, #1
	itt	gt
	addgt	r7, #1
	movgt	r2, #0
	b	.LBB27_123
	.p2align	2
.LBB27_126:
	cmp	r6, #4
	bhi.w	.LBB27_422
@ %bb.127:
.LCPI27_4:
	tbh	[pc, r6, lsl #1]
@ %bb.128:
.LJTI27_2:
	.short	(.LBB27_129-(.LCPI27_4+4))/2
	.short	(.LBB27_257-(.LCPI27_4+4))/2
	.short	(.LBB27_255-(.LCPI27_4+4))/2
	.short	(.LBB27_256-(.LCPI27_4+4))/2
	.short	(.LBB27_254-(.LCPI27_4+4))/2
	.p2align	1
	.p2align	2
.LBB27_129:
	asrs	r0, r3, #31
	add.w	r0, r3, r0, lsr #26
	asrs	r1, r0, #6
	cmp	r1, #2
	mov.w	r1, #2
	it	lt
	asrlt	r1, r0, #6
	add.w	r0, r9, r1, lsl #5
	movw	r1, #9800
	movs	r2, #0
	vldr	s0, .LCPI27_6
	add	r1, r0
	cmp	r3, #127
	it	gt
	movgt	r2, #1
	mov	r0, r9
	add	sp, #372
	pop.w	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	b	credits_private_credits_weather
	.p2align	2
.LBB27_130:
	mov	r0, r9
	mov	r1, r6
	movs	r2, #1
	add	sp, #372
	pop.w	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	b	credits_private_scenes60_ui
	.p2align	2
.LBB27_131:
	mov	r0, r9
	mov	r1, r3
	movs	r2, #1
	add	sp, #372
	pop.w	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	b	credits_private_scenes60_noise
	.p2align	2
.LBB27_132:
	mov	r0, r9
	mov	r1, r3
	movs	r2, #0
	add	sp, #372
	pop.w	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	b	credits_private_scenes60_noise
	.p2align	2
.LBB27_133:
	cmp	r6, #3
	bhi.w	.LBB27_422
@ %bb.134:
.LCPI27_5:
	tbh	[pc, r6, lsl #1]
@ %bb.135:
.LJTI27_1:
	.short	(.LBB27_136-(.LCPI27_5+4))/2
	.short	(.LBB27_227-(.LCPI27_5+4))/2
	.short	(.LBB27_224-(.LCPI27_5+4))/2
	.short	(.LBB27_226-(.LCPI27_5+4))/2
	.p2align	1
	.p2align	2
.LBB27_136:
	movw	r0, #8188
	add.w	r1, r9, r0
	movs	r7, #0
	mov	r0, r9
	movs	r2, #4
	movs	r3, #2
	str	r7, [sp]
	bl	credits_private_credits_type_words
	add	sp, #372
	pop.w	{r4, r5, r6, r7, r8, r9, r10, r11, pc}
	.p2align	2
.LBB27_137:
	adds	r1, r6, #4
	mov	r0, r9
	movs	r2, #0
	add	sp, #372
	pop.w	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	b	credits_private_scenes60_ui
	.p2align	2
.LBB27_138:
	cmp	r6, #2
	bhs.w	.LBB27_427
@ %bb.139:
	add.w	r0, r6, r6, lsl #2
	add.w	r0, r9, r0, lsl #2
	movw	r1, #8268
	movs	r3, #16
	add	r1, r0
	cmp	r6, #0
	it	eq
	moveq	r3, #1
	movs	r7, #0
	mov	r0, r9
	movs	r2, #2
	str	r7, [sp]
	bl	credits_private_credits_type_words
	add	sp, #372
	pop.w	{r4, r5, r6, r7, r8, r9, r10, r11, pc}
	.p2align	2
.LBB27_140:
	cmp	r6, #0
	beq.w	.LBB27_195
@ %bb.141:
	ldr	r0, [r2]
	cmp	r0, #0
	beq.w	.LBB27_422
@ %bb.142:
	movs	r3, #0
	mov	r0, r9
	movs	r1, #0
	str	r3, [r2]
	add	sp, #372
	pop.w	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	b	credits_private_credits60_history
	.p2align	2
.LBB27_143:
	adds	r0, r6, r3
	subs	r0, #2
	cmp	r0, #0
	ble.w	.LBB27_428
@ %bb.144:
	cmp	r0, #10
	bhi.w	.LBB27_422
@ %bb.145:
	movw	r1, :lower16:credits_private_math_lookup_poweroff_height
	movt	r1, :upper16:credits_private_math_lookup_poweroff_height
	add	r0, r1
	ldrb	r0, [r0, #-1]
	cmp	r0, #21
	bhs.w	.LBB27_431
@ %bb.146:
	cmp	r0, #0
	beq.w	.LBB27_422
@ %bb.147:
	movw	r2, :lower16:.L__const.credits_private_scenes60_poweroff.colours
	movt	r2, :upper16:.L__const.credits_private_scenes60_poweroff.colours
	ldr.w	r5, [r2, r6, lsl #2]
	movs	r2, #10
	lsrs	r1, r0, #1
	sub.w	r4, r2, r0, lsr #1
	rsb	r0, r0, r0, lsl #4
	lsls	r6, r0, #4
	sub.w	r0, r1, r1, lsl #4
	add.w	r8, r9, r0, lsl #4
	movs	r7, #0
	b	.LBB27_149
	.p2align	2
.LBB27_148:                             @   in Loop: Header=BB27_149 Depth=1
	ldr	r1, [sp, #64]                   @ 4-byte Reload
	ldr	r0, [r1]
	adds	r0, #60
	str	r0, [r1]
	adds	r7, #240
	cmp	r6, r7
	add.w	r4, r4, #1
	beq.w	.LBB27_422
.LBB27_149:                             @ =>This Inner Loop Header: Depth=1
	mov	r0, r5
	bl	credits_private_canvas60_style
	cmp	r4, #19
	bhi	.LBB27_148
@ %bb.150:                              @   in Loop: Header=BB27_149 Depth=1
	add.w	r1, r8, r7
	orr	r0, r0, #35
	str.w	r0, [r1, #2424]
	str.w	r0, [r1, #2428]
	str.w	r0, [r1, #2432]
	str.w	r0, [r1, #2436]
	str.w	r0, [r1, #2440]
	str.w	r0, [r1, #2444]
	str.w	r0, [r1, #2448]
	str.w	r0, [r1, #2452]
	str.w	r0, [r1, #2456]
	str.w	r0, [r1, #2460]
	str.w	r0, [r1, #2464]
	str.w	r0, [r1, #2468]
	str.w	r0, [r1, #2472]
	str.w	r0, [r1, #2476]
	str.w	r0, [r1, #2480]
	str.w	r0, [r1, #2484]
	str.w	r0, [r1, #2488]
	str.w	r0, [r1, #2492]
	str.w	r0, [r1, #2496]
	str.w	r0, [r1, #2500]
	str.w	r0, [r1, #2504]
	str.w	r0, [r1, #2508]
	str.w	r0, [r1, #2512]
	str.w	r0, [r1, #2516]
	str.w	r0, [r1, #2520]
	str.w	r0, [r1, #2524]
	str.w	r0, [r1, #2528]
	str.w	r0, [r1, #2532]
	str.w	r0, [r1, #2536]
	str.w	r0, [r1, #2540]
	str.w	r0, [r1, #2544]
	str.w	r0, [r1, #2548]
	str.w	r0, [r1, #2552]
	str.w	r0, [r1, #2556]
	str.w	r0, [r1, #2560]
	str.w	r0, [r1, #2564]
	str.w	r0, [r1, #2568]
	str.w	r0, [r1, #2572]
	str.w	r0, [r1, #2576]
	str.w	r0, [r1, #2580]
	str.w	r0, [r1, #2584]
	str.w	r0, [r1, #2588]
	str.w	r0, [r1, #2592]
	str.w	r0, [r1, #2596]
	str.w	r0, [r1, #2600]
	str.w	r0, [r1, #2604]
	str.w	r0, [r1, #2608]
	str.w	r0, [r1, #2612]
	str.w	r0, [r1, #2616]
	str.w	r0, [r1, #2620]
	str.w	r0, [r1, #2624]
	str.w	r0, [r1, #2628]
	str.w	r0, [r1, #2632]
	str.w	r0, [r1, #2636]
	str.w	r0, [r1, #2640]
	str.w	r0, [r1, #2644]
	str.w	r0, [r1, #2648]
	str.w	r0, [r1, #2652]
	str.w	r0, [r1, #2656]
	str.w	r0, [r1, #2660]
	adds	r7, #240
	cmp	r6, r7
	add.w	r4, r4, #1
	bne.w	.LBB27_149
	b.w	.LBB27_422
	.p2align	2
.LBB27_151:
	cmp	r6, #0
	bne.w	.LBB27_427
@ %bb.152:
	movw	r6, :lower16:.L.str.44
	add.w	r1, r9, #8128
	movs	r7, #1
	movt	r6, :upper16:.L.str.44
	mov	r0, r9
	b	.LBB27_167
	.p2align	2
.LBB27_153:
	cmp	r6, #1
	bgt.w	.LBB27_393
@ %bb.154:
	cmp	r6, #0
	beq.w	.LBB27_251
@ %bb.155:
	movw	r0, :lower16:.L.str.47
	movt	r0, :upper16:.L.str.47
	str	r0, [sp, #56]                   @ 4-byte Spill
	mov.w	r10, #2
	b.w	.LBB27_265
	.p2align	2
.LBB27_156:
	cmp	r6, #1
	beq.w	.LBB27_193
@ %bb.157:
	cmp	r6, #0
	bne.w	.LBB27_427
@ %bb.158:
	movw	r7, :lower16:.L.str.45
	movw	r3, :lower16:.L.str.89
	movt	r7, :upper16:.L.str.45
	movt	r3, :upper16:.L.str.89
	mov	r0, r9
	movs	r1, #2
	movs	r2, #17
	str	r7, [sp]
	bl	credits_private_credits_multiline
	add	sp, #372
	pop.w	{r4, r5, r6, r7, r8, r9, r10, r11, pc}
	.p2align	2
.LBB27_159:
	mov	r0, r8
	bl	credits_private_canvas60_style
	mov	r0, r8
	bl	credits_private_canvas60_style
	mov	r0, r8
	bl	credits_private_canvas60_style
.LBB27_160:
	ldrd	r2, r1, [sp, #96]               @ 8-byte Folded Reload
	ldr.w	r0, [r2, r1, lsl #2]
	clz	r0, r0
	lsrs	r0, r0, #5
	str.w	r0, [r2, r1, lsl #2]
	add	sp, #372
	pop.w	{r4, r5, r6, r7, r8, r9, r10, r11, pc}
	.p2align	2
.LBB27_161:
	movw	r0, #6508
	cmp	r3, r0
	bhi.w	.LBB27_430
@ %bb.162:
	cmp	r6, #5
	bhs.w	.LBB27_430
@ %bb.163:
	movw	r0, :lower16:credits_private_math_lookup_ocean_text_mask
	movt	r0, :upper16:credits_private_math_lookup_ocean_text_mask
	ldrb	r0, [r0, r3]
	subs	r2, r6, #1
	lsrs	r0, r2
	and	r7, r0, #1
	add.w	r0, r6, r6, lsl #2
	add.w	r0, r9, r0, lsl #2
	movw	r2, #8028
	add	r2, r0
	b	.LBB27_166
	.p2align	2
.LBB27_164:
	cmp	r6, #1
	bne.w	.LBB27_427
@ %bb.165:
	movw	r0, #8028
	add.w	r2, r9, r0
	movs	r7, #1
.LBB27_166:
	movw	r0, :lower16:.L.str.44
	movw	r6, :lower16:.L.str.83
	movt	r0, :upper16:.L.str.44
	movt	r6, :upper16:.L.str.83
	cmp	r1, #3
	it	eq
	moveq	r6, r0
	mov	r0, r9
	mov	r1, r2
.LBB27_167:
	movs	r2, #2
	movs	r3, #1
	strd	r6, r7, [sp]
	bl	credits_private_credits60_characters
	add	sp, #372
	pop.w	{r4, r5, r6, r7, r8, r9, r10, r11, pc}
	.p2align	2
.LBB27_168:
	movw	r0, :lower16:.L.str.188
	movw	r5, :lower16:.L.str.187
	movt	r0, :upper16:.L.str.188
	movt	r5, :upper16:.L.str.187
	cmp	r1, #15
	it	ne
	movne	r5, r0
	movw	r0, :lower16:.L.str.46
	movt	r0, :upper16:.L.str.46
	bl	credits_private_canvas60_style
	ldrb	r1, [r5]
	cmp	r1, #0
	beq.w	.LBB27_422
@ %bb.169:
	add.w	r12, r9, #24
	movs	r2, #8
	movs	r7, #15
	b	.LBB27_174
	.p2align	2
@ %bb.170:
.LCPI27_6:
	.long	0x00000000                      @ float 0
	.p2align	2
.LBB27_171:                             @   in Loop: Header=BB27_174 Depth=1
	adds	r2, #1
.LBB27_172:                             @   in Loop: Header=BB27_174 Depth=1
	movs	r6, #15
.LBB27_173:                             @   in Loop: Header=BB27_174 Depth=1
	ldrb	r1, [r5]
	mov	r7, r6
	cmp	r1, #0
	beq.w	.LBB27_422
.LBB27_174:                             @ =>This Inner Loop Header: Depth=1
	sub.w	r6, r1, #194
	cmp	r6, #29
	add.w	r4, r5, #1
	bhi	.LBB27_177
@ %bb.175:                              @   in Loop: Header=BB27_174 Depth=1
	ldrsb.w	r6, [r4]
	cmn.w	r6, #65
	bgt.w	.LBB27_425
@ %bb.176:                              @   in Loop: Header=BB27_174 Depth=1
	and	r3, r6, #63
	bfi	r3, r1, #6, #5
	adds	r5, #2
	mov	r1, r3
	b	.LBB27_178
	.p2align	2
.LBB27_177:                             @   in Loop: Header=BB27_174 Depth=1
	sxtb	r3, r1
	cmp.w	r3, #-1
	mov	r5, r4
	ble.w	.LBB27_425
.LBB27_178:                             @   in Loop: Header=BB27_174 Depth=1
	ldr	r3, [sp, #64]                   @ 4-byte Reload
	cmp	r1, #13
	beq	.LBB27_172
@ %bb.179:                              @   in Loop: Header=BB27_174 Depth=1
	cmp	r1, #10
	beq	.LBB27_171
@ %bb.180:                              @   in Loop: Header=BB27_174 Depth=1
	cmp	r7, #59
	add.w	r6, r7, #1
	it	ls
	cmpls	r2, #20
	blo	.LBB27_182
@ %bb.181:                              @   in Loop: Header=BB27_174 Depth=1
	ldr	r1, [r3]
	adds	r1, #1
	str	r1, [r3]
	b	.LBB27_173
	.p2align	2
.LBB27_182:                             @   in Loop: Header=BB27_174 Depth=1
	rsb	r3, r2, r2, lsl #4
	orrs	r1, r0
	add.w	r3, r12, r3, lsl #4
	str.w	r1, [r3, r7, lsl #2]
	b	.LBB27_173
	.p2align	2
.LBB27_183:
	cmp	r1, #15
	beq.w	.LBB27_196
@ %bb.184:
	movs	r0, #1
	b	.LBB27_208
	.p2align	2
.LBB27_185:
	ldr	r4, [sp, #64]                   @ 4-byte Reload
	cmp	r1, #15
	beq.w	.LBB27_202
@ %bb.186:
	cmp	r6, #3
	bne.w	.LBB27_202
@ %bb.187:
	str	r1, [sp, #60]                   @ 4-byte Spill
	addw	r0, r4, #2516
	movw	r1, #4852
	movw	lr, #22144
	movw	r3, #45279
	str	r0, [sp, #72]                   @ 4-byte Spill
	ldr.w	r12, [r4, #2508]
	ldr.w	r5, [r4, #2516]
	ldr.w	r7, [r4, #2520]
	movw	r0, #4856
	add.w	r10, r9, r1
	movw	r1, #4848
	movt	lr, #40236
	movt	r3, #39176
	add.w	r8, r4, #12
	addw	r11, r9, #2492
	add.w	r6, r9, r0
	add.w	r0, r9, r1
	strd	r10, r0, [sp, #92]              @ 8-byte Folded Spill
	str.w	r8, [sp, #84]                   @ 4-byte Spill
	b	.LBB27_189
	.p2align	2
.LBB27_188:                             @   in Loop: Header=BB27_189 Depth=1
	add.w	r0, r12, #1
	str.w	r0, [r4, #2508]
	ldr.w	r1, [r8, r12, lsl #2]
	adds	r5, #1
	eor.w	r1, r1, r1, lsr #11
	and.w	r2, lr, r1, lsl #7
	eor.w	r1, r1, r2
	and	r2, r1, #118784
	eor.w	r1, r1, r2, lsl #15
	lsr.w	r1, r1, #27
	adc	r7, r7, #0
	cmp	r1, #31
	mov	r12, r0
	bne.w	.LBB27_209
.LBB27_189:                             @ =>This Loop Header: Depth=1
                                        @     Child Loop BB27_191 Depth 2
	cmp.w	r12, #624
	blt	.LBB27_188
@ %bb.190:                              @   in Loop: Header=BB27_189 Depth=1
	strd	r7, r5, [sp, #76]               @ 8-byte Folded Spill
	ldr.w	r12, [r8]
	movw	r7, #65534
	movs	r1, #0
	mov.w	lr, #0
	movt	r7, #32767
	.p2align	2
.LBB27_191:                             @   Parent Loop BB27_189 Depth=1
                                        @ =>  This Inner Loop Header: Depth=2
	add.w	r9, r11, r1, lsl #2
	ldr.w	r0, [r9, #2352]
	movw	r10, #64628
	movt	r10, #65535
	add.w	r4, r11, lr
	and.w	r5, r0, r7
	mov	r7, r10
	str	r4, [sp, #100]                  @ 4-byte Spill
	cmp	r1, #227
	it	lo
	movwlo	r7, #1588
	add	r7, r8
	and	r12, r12, #-2147483648
	ldr.w	r7, [r7, r1, lsl #2]
	add	r5, r12
	eor.w	r7, r7, r5, lsr #1
	lsls	r5, r0, #31
	it	ne
	eorne	r7, r3
	ldr.w	r8, [sp, #96]                   @ 4-byte Reload
	str.w	r7, [r4, #2348]
	ldr.w	r7, [r8, r1, lsl #2]
	movw	r2, #65534
	movt	r2, #32767
	and.w	r4, r7, r2
	mov	r2, r10
	cmp	r1, #226
	it	lo
	movwlo	r2, #1588
	add	r2, r11
	add.w	r2, r2, r1, lsl #2
	and	r0, r0, #-2147483648
	ldr.w	r2, [r2, #2352]
	add	r0, r4
	eor.w	r0, r2, r0, lsr #1
	lsls	r2, r7, #31
	it	ne
	eorne	r0, r3
	ldr.w	r12, [sp, #92]                  @ 4-byte Reload
	mov	r4, r10
	add.w	r5, r8, r1, lsl #2
	str.w	r0, [r9, #2352]
	and	r0, r7, #-2147483648
	ldr.w	r7, [r12, r1, lsl #2]
	cmp	r1, #225
	it	lo
	movwlo	r4, #1588
	ldr	r5, [r5, r4]
	movw	r4, #65534
	movt	r4, #32767
	ands	r4, r7
	add	r0, r4
	eor.w	r0, r5, r0, lsr #1
	lsls	r5, r7, #31
	mov	r4, r10
	add.w	r2, r12, r1, lsl #2
	it	ne
	eorne	r0, r3
	str.w	r0, [r8, r1, lsl #2]
	ldr.w	r5, [r6, r1, lsl #2]
	cmp	r1, #224
	it	lo
	movwlo	r4, #1588
	ldr	r2, [r2, r4]
	movw	r4, #65534
	movt	r4, #32767
	and	r0, r7, #-2147483648
	ands	r4, r5
	add	r0, r4
	eor.w	r0, r2, r0, lsr #1
	lsls	r2, r5, #31
	it	ne
	eorne	r0, r3
	str.w	r0, [r12, r1, lsl #2]
	ldr.w	r0, [r9, #2368]
	and	r2, r5, #-2147483648
	movw	r5, #65534
	add.w	r7, r6, r1, lsl #2
	movt	r5, #32767
	mov	r4, r10
	ands	r5, r0
	cmp	r1, #223
	it	lo
	movwlo	r4, #1588
	ldr	r7, [r7, r4]
	add	r2, r5
	eor.w	r2, r7, r2, lsr #1
	lsls	r7, r0, #31
	it	ne
	eorne	r2, r3
	str.w	r2, [r6, r1, lsl #2]
	ldr	r2, [sp, #88]                   @ 4-byte Reload
	mov	r12, r10
	mov	r8, r6
	add.w	r10, r2, r1, lsl #2
	mov.w	r6, #4864
	mov	r5, r12
	ldr.w	r2, [r10, r6]
	cmp	r1, #222
	it	lo
	movwlo	r5, #1588
	movw	r7, #65534
	add	r5, r11
	movt	r7, #32767
	add.w	r5, r5, r1, lsl #2
	and	r0, r0, #-2147483648
	ands	r7, r2
	ldr.w	r5, [r5, #2368]
	add	r0, r7
	eor.w	r0, r5, r0, lsr #1
	lsls	r7, r2, #31
	it	ne
	eorne	r0, r3
	ldr	r5, [sp, #100]                  @ 4-byte Reload
	str.w	r0, [r9, #2368]
	mov	r4, r12
	movw	r7, #65534
	ldr.w	r12, [r5, #2376]
	movt	r7, #32767
	add.w	r0, r10, #4864
	cmp	r1, #221
	it	lo
	movwlo	r4, #1588
	and	r2, r2, #-2147483648
	ldr	r0, [r0, r4]
	and.w	r4, r12, r7
	add	r2, r4
	eor.w	r0, r0, r2, lsr #1
	lsls.w	r2, r12, #31
	it	ne
	eorne	r0, r3
	str.w	r0, [r10, r6]
	mov	r6, r8
	ldrd	r8, r9, [sp, #84]               @ 8-byte Folded Reload
	adds	r1, #7
	movw	r0, #623
	cmp	r1, r0
	add.w	lr, lr, #28
	bne.w	.LBB27_191
@ %bb.192:                              @   in Loop: Header=BB27_189 Depth=1
	ldr	r4, [sp, #64]                   @ 4-byte Reload
	ldr.w	r12, [r4, #2504]
	ldr	r0, [r4, #12]
	and	r12, r12, #-2147483648
	and.w	lr, r0, r7
	ldr.w	r2, [r4, #1596]
	add.w	r1, lr, r12
	eor.w	r12, r2, r1, lsr #1
	lsls	r1, r0, #31
	it	ne
	eorne.w	r12, r12, r3
	movw	lr, #22144
	ldrd	r7, r5, [sp, #76]               @ 8-byte Folded Reload
	str.w	r12, [r4, #2504]
	mov.w	r12, #0
	movt	lr, #40236
	b	.LBB27_188
	.p2align	2
.LBB27_193:
	movw	r0, #8248
	add.w	r1, r9, r0
	movs	r7, #0
	mov	r0, r9
	movs	r2, #12
	movs	r3, #18
	str	r7, [sp]
	bl	credits_private_credits_type_words
	add	sp, #372
	pop.w	{r4, r5, r6, r7, r8, r9, r10, r11, pc}
	.p2align	2
.LBB27_194:
	movw	r7, :lower16:.L.str.45
	movw	r3, :lower16:.L.str.84
	movt	r7, :upper16:.L.str.45
	movt	r3, :upper16:.L.str.84
	mov	r0, r9
	movs	r1, #0
	movs	r2, #11
	str	r7, [sp]
	bl	credits_private_credits_multiline
	add	sp, #372
	pop.w	{r4, r5, r6, r7, r8, r9, r10, r11, pc}
	.p2align	2
.LBB27_195:
	movw	r0, #8148
	add.w	r1, r9, r0
	movs	r7, #0
	b	.LBB27_228
	.p2align	2
.LBB27_196:
	str	r1, [sp, #60]                   @ 4-byte Spill
	ldr	r0, [sp, #64]                   @ 4-byte Reload
	addw	r10, r9, #2492
	addw	r1, r0, #2516
	str	r1, [sp, #56]                   @ 4-byte Spill
	movw	r1, #4856
	add.w	r8, r9, r1
	movw	r1, #4852
	add.w	r11, r9, r1
	movw	r1, #4848
	add.w	lr, r0, #12
	add	r9, r1
	str.w	r11, [sp, #84]                  @ 4-byte Spill
	strd	r10, lr, [sp, #92]              @ 8-byte Folded Spill
	strd	r9, r8, [sp, #76]               @ 8-byte Folded Spill
	movw	r2, #45279
	movw	r5, #65534
	ldr.w	r12, [r0, #2508]
	ldr.w	r4, [r0, #2516]
	ldr.w	r6, [r0, #2520]
	ldr.w	r10, [sp, #92]                  @ 4-byte Reload
	movt	r2, #39176
	movt	r5, #32767
	b	.LBB27_198
	.p2align	2
.LBB27_197:                             @   in Loop: Header=BB27_198 Depth=1
	ldr	r1, [sp, #64]                   @ 4-byte Reload
	add.w	r0, r12, #1
	str.w	r0, [r1, #2508]
	ldr.w	r1, [lr, r12, lsl #2]
	mov.w	r7, #-2147483648
	eor.w	r3, r1, r1, lsr #11
	and.w	r7, r7, r1, lsl #7
	eor.w	r3, r7, r3, lsl #15
	eors	r1, r3
	adds	r4, #1
	lsr.w	r1, r1, #30
	adc	r6, r6, #0
	cmp	r1, #3
	mov	r12, r0
	bne.w	.LBB27_207
.LBB27_198:                             @ =>This Loop Header: Depth=1
                                        @     Child Loop BB27_200 Depth 2
	cmp.w	r12, #624
	blt	.LBB27_197
@ %bb.199:                              @   in Loop: Header=BB27_198 Depth=1
	ldr.w	r11, [lr]
	mov.w	lr, #0
	mov.w	r12, #0
	strd	r6, r4, [sp, #68]               @ 8-byte Folded Spill
	.p2align	2
.LBB27_200:                             @   Parent Loop BB27_198 Depth=1
                                        @ =>  This Inner Loop Header: Depth=2
	movw	r1, #64628
	movt	r1, #65535
	add.w	r4, r10, r12
	add.w	r8, r10, lr, lsl #2
	mov	r3, r1
	str	r4, [sp, #100]                  @ 4-byte Spill
	ldr.w	r7, [r8, #2352]
	cmp.w	lr, #227
	it	lo
	movwlo	r3, #1588
	ldr	r0, [sp, #96]                   @ 4-byte Reload
	and	r6, r11, #-2147483648
	add	r3, r0
	mov	r11, r5
	ands	r5, r7
	ldr.w	r3, [r3, lr, lsl #2]
	add	r5, r6
	eor.w	r3, r3, r5, lsr #1
	lsls	r5, r7, #31
	it	ne
	eorne	r3, r2
	str.w	r3, [r4, #2348]
	ldr	r4, [sp, #76]                   @ 4-byte Reload
	mov	r0, r1
	ldr.w	r5, [r4, lr, lsl #2]
	cmp.w	lr, #226
	it	lo
	movwlo	r0, #1588
	add	r0, r10
	add.w	r0, r0, lr, lsl #2
	and	r3, r7, #-2147483648
	and.w	r7, r5, r11
	ldr.w	r0, [r0, #2352]
	add	r3, r7
	eor.w	r0, r0, r3, lsr #1
	lsls	r3, r5, #31
	it	ne
	eorne	r0, r2
	ldr.w	r9, [sp, #84]                   @ 4-byte Reload
	str.w	r0, [r8, #2352]
	and	r0, r5, #-2147483648
	ldr.w	r5, [r9, lr, lsl #2]
	mov	r7, r1
	add.w	r6, r4, lr, lsl #2
	cmp.w	lr, #225
	it	lo
	movwlo	r7, #1588
	ldr	r6, [r6, r7]
	and.w	r7, r5, r11
	add	r0, r7
	eor.w	r0, r6, r0, lsr #1
	lsls	r6, r5, #31
	it	ne
	eorne	r0, r2
	str.w	r0, [r4, lr, lsl #2]
	ldr	r4, [sp, #80]                   @ 4-byte Reload
	mov	r7, r1
	ldr.w	r6, [r4, lr, lsl #2]
	add.w	r3, r9, lr, lsl #2
	cmp.w	lr, #224
	it	lo
	movwlo	r7, #1588
	and	r0, r5, #-2147483648
	ldr	r3, [r3, r7]
	and.w	r7, r6, r11
	add	r0, r7
	eor.w	r0, r3, r0, lsr #1
	lsls	r3, r6, #31
	it	ne
	eorne	r0, r2
	str.w	r0, [r9, lr, lsl #2]
	ldr.w	r0, [r8, #2368]
	add.w	r5, r4, lr, lsl #2
	mov	r7, r1
	and	r3, r6, #-2147483648
	and.w	r6, r0, r11
	cmp.w	lr, #223
	it	lo
	movwlo	r7, #1588
	ldr	r5, [r5, r7]
	add	r3, r6
	eor.w	r3, r5, r3, lsr #1
	lsls	r5, r0, #31
	it	ne
	eorne	r3, r2
	str.w	r3, [r4, lr, lsl #2]
	ldr	r3, [sp, #88]                   @ 4-byte Reload
	mov.w	r4, #4864
	add.w	r9, r3, lr, lsl #2
	mov	r6, r1
	ldr.w	r3, [r9, r4]
	cmp.w	lr, #222
	it	lo
	movwlo	r6, #1588
	add	r6, r10
	add.w	r6, r6, lr, lsl #2
	and	r0, r0, #-2147483648
	and.w	r5, r3, r11
	ldr.w	r6, [r6, #2368]
	add	r0, r5
	eor.w	r0, r6, r0, lsr #1
	lsls	r5, r3, #31
	it	ne
	eorne	r0, r2
	ldr	r6, [sp, #100]                  @ 4-byte Reload
	str.w	r0, [r8, #2368]
	mov	r5, r11
	ldr.w	r11, [r6, #2376]
	add.w	r0, r9, #4864
	cmp.w	lr, #221
	it	lo
	movwlo	r1, #1588
	and	r3, r3, #-2147483648
	ldr	r0, [r0, r1]
	and.w	r1, r11, r5
	add	r1, r3
	eor.w	r0, r0, r1, lsr #1
	lsls.w	r1, r11, #31
	it	ne
	eorne	r0, r2
	str.w	r0, [r9, r4]
	add.w	lr, lr, #7
	movw	r0, #623
	cmp	lr, r0
	add.w	r12, r12, #28
	bne.w	.LBB27_200
@ %bb.201:                              @   in Loop: Header=BB27_198 Depth=1
	ldr	r0, [sp, #64]                   @ 4-byte Reload
	ldr.w	r12, [r0, #2504]
	ldr.w	r9, [r0, #12]
	and	r12, r12, #-2147483648
	and.w	lr, r9, r5
	ldr.w	r8, [r0, #1596]
	add.w	r1, lr, r12
	eor.w	r12, r8, r1, lsr #1
	lsls.w	r1, r9, #31
	it	ne
	eorne.w	r12, r12, r2
	ldr.w	lr, [sp, #96]                   @ 4-byte Reload
	ldrd	r6, r4, [sp, #68]               @ 8-byte Folded Reload
	str.w	r12, [r0, #2504]
	mov.w	r12, #0
	b	.LBB27_197
	.p2align	2
.LBB27_202:
	subs	r3, r6, #5
	subs.w	r0, r1, #15
	clz	r3, r3
	it	ne
	movne	r0, #1
	cmp	r1, #15
	mov.w	r7, #3
	lsr.w	r3, r3, #5
	it	ne
	movne	r7, #4
	cmp	r6, r7
	and.w	r5, r0, r3
	beq.w	.LBB27_260
@ %bb.203:
	cmp	r5, #0
	bne.w	.LBB27_260
@ %bb.204:
	cmp	r6, #6
	bne.w	.LBB27_422
@ %bb.205:
	cmp	r1, #14
	bne.w	.LBB27_427
@ %bb.206:
	movw	r0, #8168
	add.w	r1, r9, r0
	movs	r7, #0
	mov	r0, r9
	movs	r2, #6
	movs	r3, #11
	str	r7, [sp]
	bl	credits_private_credits_type_words
	add	sp, #372
	pop.w	{r4, r5, r6, r7, r8, r9, r10, r11, pc}
	.p2align	2
.LBB27_207:
	ldr	r0, [sp, #56]                   @ 4-byte Reload
	ldr.w	r9, [sp, #88]                   @ 4-byte Reload
	strd	r4, r6, [r0]
	adds	r0, r1, #4
	ldr	r1, [sp, #60]                   @ 4-byte Reload
.LBB27_208:
	add.w	r1, r9, r1, lsl #2
	movw	r2, #10012
	ldr	r3, [r1, r2]
	add	r0, r3
	str	r0, [r1, r2]
	add	sp, #372
	pop.w	{r4, r5, r6, r7, r8, r9, r10, r11, pc}
	.p2align	2
.LBB27_209:
	ldr	r0, [sp, #72]                   @ 4-byte Reload
	movw	r2, #10012
	strd	r5, r7, [r0]
	ldr	r0, [sp, #60]                   @ 4-byte Reload
	add.w	r0, r9, r0, lsl #2
	ldr	r3, [r0, r2]
	add	r1, r3
	adds	r1, #40
	str	r1, [r0, r2]
	add	sp, #372
	pop.w	{r4, r5, r6, r7, r8, r9, r10, r11, pc}
	.p2align	2
.LBB27_210:
	movw	r0, #16191
	movt	r0, #63
	str.w	r0, [sp, #111]
	movw	r0, #11839
	movt	r0, #16191
	str	r0, [sp, #108]
	movw	r0, #16191
	movt	r0, #16174
	str	r0, [sp, #104]
	b	.LBB27_237
	.p2align	2
.LBB27_211:
	add.w	r0, r3, r3, lsl #1
	lsls	r0, r0, #3
	cmp.w	r0, r3, lsl #3
	blt.w	.LBB27_432
@ %bb.212:
	movw	r1, #4840
	add.w	r5, r9, r1
	lsls	r1, r3, #3
	mov.w	r2, #768
	subs	r7, r0, r1
	add.w	r8, r2, r3, lsl #3
	asr.w	r2, r0, #31
	orr	r0, r7, #1
	clz	r0, r0
	sbc.w	r4, r2, r1, asr #31
	adds	r0, #32
	cmp	r4, #0
	it	ne
	clzne	r0, r4
	rsb.w	r6, r0, #64
	.p2align	2
.LBB27_213:                             @ =>This Inner Loop Header: Depth=1
	mov	r0, r5
	mov	r1, r6
	bl	credits_private_random_bits
	subs	r2, r7, r0
	sbcs.w	r1, r4, r1
	blo	.LBB27_213
@ %bb.214:
	add	r0, r8
	asrs	r1, r0, #31
	ands	r2, r0, #63
	add.w	r1, r0, r1, lsr #26
	it	ne
	movne	r2, #1
	and.w	r0, r2, r0, lsr #31
	rsb	r0, r0, r1, asr #6
	cmp	r0, #1
	blt.w	.LBB27_235
@ %bb.215:
	movw	r1, :lower16:.L__const.credits_private_credits_date.lengths
	movw	r7, #2009
	movs	r3, #22
	movs	r2, #9
	movt	r1, :upper16:.L__const.credits_private_credits_date.lengths
	b	.LBB27_217
	.p2align	2
.LBB27_216:                             @   in Loop: Header=BB27_217 Depth=1
	subs	r0, r0, r6
	cmp	r0, #0
	ble.w	.LBB27_234
.LBB27_217:                             @ =>This Inner Loop Header: Depth=1
	and	r6, r7, #3
	eor	r5, r2, #1
	orrs	r6, r5
	ldr.w	r5, [r1, r2, lsl #2]
	clz	r6, r6
	lsrs	r4, r6, #5
	subs	r6, r5, r3
	add	r6, r4
	adds	r6, #1
	cmp	r0, r6
	it	lt
	movlt	r6, r0
	add	r3, r6
	add	r5, r4
	cmp	r3, r5
	ble	.LBB27_216
@ %bb.218:                              @   in Loop: Header=BB27_217 Depth=1
	cmp	r2, #10
	add.w	r2, r2, #1
	mov.w	r3, #1
	itt	gt
	addgt	r7, #1
	movgt	r2, #0
	b	.LBB27_216
	.p2align	2
.LBB27_219:
	movw	r0, #65024
	movt	r0, #65535
	add.w	r0, r0, r3, lsl #1
	asrs	r1, r0, #31
	ands	r2, r3, #31
	add.w	r1, r0, r1, lsr #26
	it	ne
	movne	r2, #1
	and.w	r0, r2, r0, lsr #31
	rsb	r0, r0, r1, asr #6
	cmp	r0, #1
	blt.w	.LBB27_235
@ %bb.220:
	movw	r1, :lower16:.L__const.credits_private_credits_date.lengths
	movw	r7, #2009
	movs	r3, #22
	movs	r2, #9
	movt	r1, :upper16:.L__const.credits_private_credits_date.lengths
	b	.LBB27_222
	.p2align	2
.LBB27_221:                             @   in Loop: Header=BB27_222 Depth=1
	subs	r0, r0, r6
	cmp	r0, #0
	ble	.LBB27_234
.LBB27_222:                             @ =>This Inner Loop Header: Depth=1
	and	r6, r7, #3
	eor	r5, r2, #1
	orrs	r6, r5
	ldr.w	r5, [r1, r2, lsl #2]
	clz	r6, r6
	lsrs	r4, r6, #5
	subs	r6, r5, r3
	add	r6, r4
	adds	r6, #1
	cmp	r0, r6
	it	lt
	movlt	r6, r0
	add	r3, r6
	add	r5, r4
	cmp	r3, r5
	ble	.LBB27_221
@ %bb.223:                              @   in Loop: Header=BB27_222 Depth=1
	cmp	r2, #10
	add.w	r2, r2, #1
	mov.w	r3, #1
	itt	gt
	addgt	r7, #1
	movgt	r2, #0
	b	.LBB27_221
	.p2align	2
.LBB27_224:
	ldr	r0, [r2]
	cmp	r0, #0
	beq.w	.LBB27_422
@ %bb.225:
	movs	r3, #0
	mov	r0, r9
	movs	r1, #1
	str	r3, [r2]
	add	sp, #372
	pop.w	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	b	credits_private_credits60_history
	.p2align	2
.LBB27_226:
	movw	r0, #8228
	add.w	r1, r9, r0
	movs	r7, #2
	mov	r0, r9
	movs	r2, #8
	movs	r3, #5
	str	r7, [sp]
	bl	credits_private_credits_type_words
	add	sp, #372
	pop.w	{r4, r5, r6, r7, r8, r9, r10, r11, pc}
	.p2align	2
.LBB27_227:
	movw	r0, #8208
	add.w	r1, r9, r0
	movs	r7, #1
.LBB27_228:
	mov	r0, r9
	movs	r2, #4
	movs	r3, #19
	str	r7, [sp]
	bl	credits_private_credits_type_words
	add	sp, #372
	pop.w	{r4, r5, r6, r7, r8, r9, r10, r11, pc}
	.p2align	2
.LBB27_229:
	movw	r1, #65040
	lsls	r0, r3, #6
	movt	r1, #65535
	add.w	r0, r1, r0, asr #6
	cmp	r0, #1
	blt	.LBB27_235
@ %bb.230:
	movw	r1, :lower16:.L__const.credits_private_credits_date.lengths
	movw	r7, #2009
	movs	r3, #22
	movs	r2, #9
	movt	r1, :upper16:.L__const.credits_private_credits_date.lengths
	b	.LBB27_232
	.p2align	2
.LBB27_231:                             @   in Loop: Header=BB27_232 Depth=1
	subs	r0, r0, r6
	cmp	r0, #0
	ble	.LBB27_234
.LBB27_232:                             @ =>This Inner Loop Header: Depth=1
	and	r6, r7, #3
	eor	r5, r2, #1
	orrs	r6, r5
	ldr.w	r5, [r1, r2, lsl #2]
	clz	r6, r6
	lsrs	r4, r6, #5
	subs	r6, r5, r3
	add	r6, r4
	adds	r6, #1
	cmp	r0, r6
	it	lt
	movlt	r6, r0
	add	r3, r6
	add	r5, r4
	cmp	r3, r5
	ble	.LBB27_231
@ %bb.233:                              @   in Loop: Header=BB27_232 Depth=1
	cmp	r2, #10
	add.w	r2, r2, #1
	mov.w	r3, #1
	itt	gt
	addgt	r7, #1
	movgt	r2, #0
	b	.LBB27_231
	.p2align	2
.LBB27_234:
	adds	r6, r2, #1
	b	.LBB27_236
	.p2align	2
.LBB27_235:
	movs	r6, #10
	movs	r3, #22
	movw	r7, #2009
.LBB27_236:
	movw	r2, :lower16:.L.str.52
	movt	r2, :upper16:.L.str.52
	add	r0, sp, #104
	movs	r1, #32
	strd	r6, r7, [sp]
	bl	snprintf
.LBB27_237:
	movw	r0, :lower16:.L.str.49
	movt	r0, :upper16:.L.str.49
	bl	credits_private_canvas60_style
	ldrb.w	r7, [sp, #104]
	cmp	r7, #0
	beq.w	.LBB27_422
@ %bb.238:
	add.w	r1, r9, #24
	add	r4, sp, #104
	movs	r2, #12
	movs	r6, #34
	b	.LBB27_242
	.p2align	2
.LBB27_239:                             @   in Loop: Header=BB27_242 Depth=1
	adds	r2, #1
.LBB27_240:                             @   in Loop: Header=BB27_242 Depth=1
	movs	r5, #34
.LBB27_241:                             @   in Loop: Header=BB27_242 Depth=1
	ldrb	r7, [r4]
	mov	r6, r5
	cmp	r7, #0
	beq.w	.LBB27_422
.LBB27_242:                             @ =>This Inner Loop Header: Depth=1
	sub.w	r3, r7, #194
	cmp	r3, #29
	add.w	r3, r4, #1
	bhi	.LBB27_245
@ %bb.243:                              @   in Loop: Header=BB27_242 Depth=1
	ldrsb.w	r3, [r3]
	cmn.w	r3, #65
	bgt.w	.LBB27_425
@ %bb.244:                              @   in Loop: Header=BB27_242 Depth=1
	and	r3, r3, #63
	bfi	r3, r7, #6, #5
	adds	r4, #2
	mov	r7, r3
	b	.LBB27_246
	.p2align	2
.LBB27_245:                             @   in Loop: Header=BB27_242 Depth=1
	sxtb	r5, r7
	cmp.w	r5, #-1
	mov	r4, r3
	ble.w	.LBB27_425
.LBB27_246:                             @   in Loop: Header=BB27_242 Depth=1
	cmp	r7, #13
	beq	.LBB27_240
@ %bb.247:                              @   in Loop: Header=BB27_242 Depth=1
	cmp	r7, #10
	beq	.LBB27_239
@ %bb.248:                              @   in Loop: Header=BB27_242 Depth=1
	cmp	r6, #59
	add.w	r5, r6, #1
	it	ls
	cmpls	r2, #20
	blo	.LBB27_250
@ %bb.249:                              @   in Loop: Header=BB27_242 Depth=1
	ldr	r7, [sp, #64]                   @ 4-byte Reload
	ldr	r3, [r7]
	adds	r3, #1
	str	r3, [r7]
	b	.LBB27_241
	.p2align	2
.LBB27_250:                             @   in Loop: Header=BB27_242 Depth=1
	orr.w	r3, r7, r0
	rsb	r7, r2, r2, lsl #4
	add.w	r7, r1, r7, lsl #4
	str.w	r3, [r7, r6, lsl #2]
	b	.LBB27_241
	.p2align	2
.LBB27_251:
	cmp.w	r3, #-1
	ble.w	.LBB27_433
@ %bb.252:
	cmp	r3, #17
	bhi	.LBB27_263
@ %bb.253:
	movw	r0, :lower16:credits_private_math_lookup_access_limit
	movt	r0, :upper16:credits_private_math_lookup_access_limit
	ldrb	r0, [r0, r3]
	add.w	r10, r0, #1
	b	.LBB27_264
	.p2align	2
.LBB27_254:
	subs.w	r1, r3, #1080
	vmov	s0, r1
	vldr	s2, .LCPI27_7
	vcvt.f32.u32	s0, s0
	movw	r0, #9896
	vmul.f32	s2, s0, s2
	vldr	s0, .LCPI27_8
	add.w	r1, r9, r0
	it	gt
	vmovgt.f32	s0, s2
	b	.LBB27_259
	.p2align	2
.LBB27_255:
	movw	r0, #9928
	b	.LBB27_258
	.p2align	2
.LBB27_256:
	movw	r0, #9864
	vldr	s0, .LCPI27_8
	add.w	r1, r9, r0
	mov	r0, r9
	movs	r2, #14
	add	sp, #372
	pop.w	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	b	credits_private_credits_weather
	.p2align	2
.LBB27_257:
	movw	r0, #9864
.LBB27_258:
	vldr	s0, .LCPI27_8
	add.w	r1, r9, r0
.LBB27_259:
	mov	r0, r9
	movs	r2, #1
	add	sp, #372
	pop.w	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	b	credits_private_credits_weather
	.p2align	2
.LBB27_260:
	add.w	r0, r9, r1, lsl #2
	movw	r3, #10012
	ldr	r7, [r0, r3]
	cmp.w	r7, #-1
	ble.w	.LBB27_434
@ %bb.261:
	ldr	r0, [r2, #124]
	cmp	r7, r0
	bhs.w	.LBB27_400
@ %bb.262:
	ldr	r4, [r2, #120]
	mov	r6, r1
	b.w	.LBB27_406
	.p2align	2
.LBB27_263:
	mov.w	r10, #2
.LBB27_264:
	movw	r0, :lower16:.L.str.46
	movt	r0, :upper16:.L.str.46
	str	r0, [sp, #56]                   @ 4-byte Spill
.LBB27_265:
	add	r2, sp, #104
	add.w	r0, r2, #10
	str	r0, [sp, #96]                   @ 4-byte Spill
	adds	r0, r2, #7
	str	r0, [sp, #92]                   @ 4-byte Spill
	ldr	r1, [sp, #88]                   @ 4-byte Reload
	movw	r0, #4840
	add.w	r9, r1, r0
	clz	r0, r10
	rsb.w	r7, r0, #32
	add.w	r0, r1, #24
	str	r0, [sp, #52]                   @ 4-byte Spill
	add.w	r0, r2, #17
	str	r0, [sp, #84]                   @ 4-byte Spill
	add.w	r0, r2, #20
	str	r0, [sp, #80]                   @ 4-byte Spill
	add.w	r0, r2, #27
	str	r0, [sp, #76]                   @ 4-byte Spill
	add.w	r0, r2, #30
	str	r0, [sp, #72]                   @ 4-byte Spill
	add.w	r0, r2, #37
	str	r0, [sp, #68]                   @ 4-byte Spill
	add.w	r0, r2, #40
	str	r0, [sp, #48]                   @ 4-byte Spill
	add.w	r0, r2, #47
	str	r0, [sp, #44]                   @ 4-byte Spill
	add.w	r0, r2, #50
	movs	r3, #0
	str	r0, [sp, #40]                   @ 4-byte Spill
	b	.LBB27_269
	.p2align	2
.LBB27_266:                             @   in Loop: Header=BB27_269 Depth=1
	cmp	r6, #0
	beq.w	.LBB27_355
@ %bb.267:                              @   in Loop: Header=BB27_269 Depth=1
	movw	r4, :lower16:.L.str.191
	add.w	r11, sp, #360
	movt	r4, :upper16:.L.str.191
	ldr	r3, [sp, #32]                   @ 4-byte Reload
	mov	r0, r11
	movs	r1, #8
	mov	r2, r4
	bl	snprintf
	ldr	r0, [sp, #360]
	ldr.w	r1, [sp, #363]
	ldr	r5, [sp, #92]                   @ 4-byte Reload
	str	r0, [sp, #104]
	movs	r0, #32
	ldr	r3, [sp, #28]                   @ 4-byte Reload
	str.w	r1, [sp, #107]
	movw	r8, #8224
	strb	r0, [r5, #2]
	mov	r0, r11
	movs	r1, #8
	mov	r2, r4
	strh.w	r8, [r5]
	bl	snprintf
	ldr	r0, [sp, #360]
	ldr	r4, [sp, #96]                   @ 4-byte Reload
	ldr.w	r1, [sp, #363]
	str	r0, [r4]
	ldr	r0, [sp, #84]                   @ 4-byte Reload
	mov.w	r11, #32
	movw	r2, :lower16:.L.str.191
	ldr	r3, [sp, #24]                   @ 4-byte Reload
	str.w	r1, [r4, #3]
	strh.w	r8, [r0]
	strb.w	r11, [r0, #2]
	add	r0, sp, #360
	movs	r1, #8
	movt	r2, :upper16:.L.str.191
	bl	snprintf
	ldr	r0, [sp, #360]
	ldr	r2, [sp, #80]                   @ 4-byte Reload
	ldr.w	r1, [sp, #363]
	str	r0, [r2]
	ldr	r0, [sp, #76]                   @ 4-byte Reload
	str.w	r1, [r2, #3]
	movw	r2, :lower16:.L.str.191
	strh.w	r8, [r0]
	strb.w	r11, [r0, #2]
	add	r0, sp, #360
	movs	r1, #8
	movt	r2, :upper16:.L.str.191
	movs	r3, #22
	mov	r8, r0
	mov	r11, r2
	bl	snprintf
	ldr	r0, [sp, #360]
	ldr.w	r1, [sp, #363]
	ldr	r2, [sp, #72]                   @ 4-byte Reload
	movs	r3, #23
	str	r0, [r2]
	str.w	r1, [r2, #3]
	mov	r0, r8
	movs	r1, #8
	mov	r2, r11
	bl	snprintf
	ldr	r3, [sp, #36]                   @ 4-byte Reload
	mov	r0, r8
	movs	r1, #8
	mov	r2, r11
	bl	snprintf
	movw	r1, #30575
	movw	r2, #28245
	movt	r1, #110
	movt	r2, #28267
	str	r1, [sp, #364]
	str	r2, [sp, #360]
	ldr.w	r0, [sp, #363]
	str	r2, [sp, #104]
	str.w	r0, [sp, #107]
	movw	r0, #8224
	strh	r0, [r5]
	movs	r0, #32
	strd	r2, r1, [sp, #360]
	strb	r0, [r5, #2]
	ldr.w	r0, [sp, #363]
	str	r2, [r4]
	str.w	r0, [r4, #3]
.LBB27_268:                             @   in Loop: Header=BB27_269 Depth=1
	ldr	r3, [sp, #12]                   @ 4-byte Reload
	adds	r3, #1
	cmp	r3, #4
	beq.w	.LBB27_393
.LBB27_269:                             @ =>This Loop Header: Depth=1
                                        @     Child Loop BB27_272 Depth 2
                                        @       Child Loop BB27_273 Depth 3
                                        @       Child Loop BB27_280 Depth 3
                                        @       Child Loop BB27_287 Depth 3
                                        @       Child Loop BB27_296 Depth 3
                                        @       Child Loop BB27_303 Depth 3
                                        @       Child Loop BB27_310 Depth 3
                                        @       Child Loop BB27_317 Depth 3
                                        @         Child Loop BB27_322 Depth 4
                                        @       Child Loop BB27_346 Depth 3
                                        @     Child Loop BB27_357 Depth 2
                                        @       Child Loop BB27_364 Depth 3
                                        @       Child Loop BB27_371 Depth 3
                                        @       Child Loop BB27_378 Depth 3
                                        @       Child Loop BB27_385 Depth 3
                                        @       Child Loop BB27_389 Depth 3
	add.w	r1, r3, r3, lsl #1
	lsls	r0, r1, #1
	adds	r2, r0, #1
	str	r2, [sp, #32]                   @ 4-byte Spill
	movs	r2, #2
	add.w	r2, r2, r1, lsl #1
	str	r2, [sp, #28]                   @ 4-byte Spill
	movs	r2, #3
	add.w	r1, r2, r1, lsl #1
	str	r1, [sp, #24]                   @ 4-byte Spill
	cmp	r3, #3
	add.w	r1, r0, #6
	str	r1, [sp, #36]                   @ 4-byte Spill
	str	r3, [sp, #12]                   @ 4-byte Spill
	beq.w	.LBB27_266
@ %bb.270:                              @   in Loop: Header=BB27_269 Depth=1
	lsls	r1, r3, #2
	adds	r1, #1
	str	r1, [sp, #60]                   @ 4-byte Spill
	adds	r1, r0, #4
	adds	r0, #5
	mov.w	r11, #0
	str	r1, [sp, #20]                   @ 4-byte Spill
	str	r0, [sp, #16]                   @ 4-byte Spill
	b	.LBB27_272
	.p2align	2
.LBB27_271:                             @   in Loop: Header=BB27_272 Depth=2
	add.w	r11, r11, #1
	cmp.w	r11, #3
	beq	.LBB27_268
.LBB27_272:                             @   Parent Loop BB27_269 Depth=1
                                        @ =>  This Loop Header: Depth=2
                                        @       Child Loop BB27_273 Depth 3
                                        @       Child Loop BB27_280 Depth 3
                                        @       Child Loop BB27_287 Depth 3
                                        @       Child Loop BB27_296 Depth 3
                                        @       Child Loop BB27_303 Depth 3
                                        @       Child Loop BB27_310 Depth 3
                                        @       Child Loop BB27_317 Depth 3
                                        @         Child Loop BB27_322 Depth 4
                                        @       Child Loop BB27_346 Depth 3
	movw	r4, #30575
	movw	r0, #8227
	movt	r4, #110
	movt	r0, #32
	movw	r8, #28245
	cmp.w	r11, #0
	it	eq
	moveq	r4, r0
	movt	r8, #28267
	movw	r0, #8224
	movt	r0, #8995
	it	eq
	moveq	r8, r0
	cbnz	r6, .LBB27_275
	.p2align	2
.LBB27_273:                             @   Parent Loop BB27_269 Depth=1
                                        @     Parent Loop BB27_272 Depth=2
                                        @ =>    This Inner Loop Header: Depth=3
	mov	r0, r9
	mov	r1, r7
	bl	credits_private_random_bits
	subs.w	r2, r0, r10
	sbcs	r1, r1, #0
	bhs	.LBB27_273
@ %bb.274:                              @   in Loop: Header=BB27_272 Depth=2
	cmp	r0, #4
	bge	.LBB27_279
.LBB27_275:                             @   in Loop: Header=BB27_272 Depth=2
	cmp.w	r11, #1
	bne	.LBB27_277
@ %bb.276:                              @   in Loop: Header=BB27_272 Depth=2
	movw	r2, :lower16:.L.str.191
	ldr	r3, [sp, #32]                   @ 4-byte Reload
	add	r0, sp, #360
	movs	r1, #8
	movt	r2, :upper16:.L.str.191
	bl	snprintf
	b	.LBB27_278
	.p2align	2
.LBB27_277:                             @   in Loop: Header=BB27_272 Depth=2
	strd	r8, r4, [sp, #360]
.LBB27_278:                             @   in Loop: Header=BB27_272 Depth=2
	ldr.w	r0, [sp, #363]
	ldr	r1, [sp, #360]
	str.w	r0, [sp, #107]
	ldr	r0, [sp, #92]                   @ 4-byte Reload
	str	r1, [sp, #104]
	movw	r1, #8224
	strh	r1, [r0]
	mov.w	r1, #32
	strb	r1, [r0, #2]
	cbnz	r6, .LBB27_282
	b	.LBB27_280
	.p2align	2
.LBB27_279:                             @   in Loop: Header=BB27_272 Depth=2
	movw	r0, #8224
	movt	r0, #32
	mov.w	r1, #538976288
	str	r0, [sp, #364]
	str	r1, [sp, #360]
	ldr.w	r0, [sp, #363]
	str	r1, [sp, #104]
	str.w	r0, [sp, #107]
	ldr	r0, [sp, #92]                   @ 4-byte Reload
	movw	r1, #8224
	strh	r1, [r0]
	movs	r1, #32
	strb	r1, [r0, #2]
	.p2align	2
.LBB27_280:                             @   Parent Loop BB27_269 Depth=1
                                        @     Parent Loop BB27_272 Depth=2
                                        @ =>    This Inner Loop Header: Depth=3
	mov	r0, r9
	mov	r1, r7
	bl	credits_private_random_bits
	subs.w	r2, r0, r10
	sbcs	r1, r1, #0
	bhs	.LBB27_280
@ %bb.281:                              @   in Loop: Header=BB27_272 Depth=2
	cmp	r0, #4
	bge	.LBB27_286
.LBB27_282:                             @   in Loop: Header=BB27_272 Depth=2
	cmp.w	r11, #1
	bne	.LBB27_284
@ %bb.283:                              @   in Loop: Header=BB27_272 Depth=2
	movw	r2, :lower16:.L.str.191
	ldr	r3, [sp, #28]                   @ 4-byte Reload
	add	r0, sp, #360
	movs	r1, #8
	movt	r2, :upper16:.L.str.191
	bl	snprintf
	b	.LBB27_285
	.p2align	2
.LBB27_284:                             @   in Loop: Header=BB27_272 Depth=2
	strd	r8, r4, [sp, #360]
.LBB27_285:                             @   in Loop: Header=BB27_272 Depth=2
	ldr.w	r0, [sp, #363]
	ldr	r2, [sp, #96]                   @ 4-byte Reload
	ldr	r1, [sp, #360]
	str.w	r0, [r2, #3]
	ldr	r0, [sp, #84]                   @ 4-byte Reload
	str	r1, [r2]
	movw	r1, #8224
	strh	r1, [r0]
	mov.w	r1, #32
	strb	r1, [r0, #2]
	cbnz	r6, .LBB27_289
	b	.LBB27_287
	.p2align	2
.LBB27_286:                             @   in Loop: Header=BB27_272 Depth=2
	movw	r0, #8224
	movt	r0, #32
	mov.w	r2, #538976288
	str	r0, [sp, #364]
	str	r2, [sp, #360]
	ldr.w	r0, [sp, #363]
	ldr	r1, [sp, #96]                   @ 4-byte Reload
	str	r2, [r1]
	str.w	r0, [r1, #3]
	ldr	r0, [sp, #84]                   @ 4-byte Reload
	movw	r1, #8224
	strh	r1, [r0]
	movs	r1, #32
	strb	r1, [r0, #2]
	.p2align	2
.LBB27_287:                             @   Parent Loop BB27_269 Depth=1
                                        @     Parent Loop BB27_272 Depth=2
                                        @ =>    This Inner Loop Header: Depth=3
	mov	r0, r9
	mov	r1, r7
	bl	credits_private_random_bits
	subs.w	r2, r0, r10
	sbcs	r1, r1, #0
	bhs	.LBB27_287
@ %bb.288:                              @   in Loop: Header=BB27_272 Depth=2
	cmp	r0, #4
	bge	.LBB27_295
.LBB27_289:                             @   in Loop: Header=BB27_272 Depth=2
	cmp.w	r11, #1
	bne	.LBB27_291
@ %bb.290:                              @   in Loop: Header=BB27_272 Depth=2
	movw	r2, :lower16:.L.str.191
	ldr	r3, [sp, #24]                   @ 4-byte Reload
	add	r0, sp, #360
	movs	r1, #8
	movt	r2, :upper16:.L.str.191
	bl	snprintf
	b	.LBB27_292
	.p2align	2
.LBB27_291:                             @   in Loop: Header=BB27_272 Depth=2
	strd	r8, r4, [sp, #360]
.LBB27_292:                             @   in Loop: Header=BB27_272 Depth=2
	ldr.w	r0, [sp, #363]
	ldr	r2, [sp, #80]                   @ 4-byte Reload
	ldr	r1, [sp, #360]
	str.w	r0, [r2, #3]
	ldr	r0, [sp, #76]                   @ 4-byte Reload
	str	r1, [r2]
	movw	r1, #8224
	strh	r1, [r0]
	mov.w	r1, #32
	strb	r1, [r0, #2]
	cbnz	r6, .LBB27_298
	b	.LBB27_296
	.p2align	2
@ %bb.293:
.LCPI27_7:
	.long	0x400ccccd                      @ float 2.20000005
	.p2align	2
@ %bb.294:
.LCPI27_8:
	.long	0x00000000                      @ float 0
	.p2align	2
.LBB27_295:                             @   in Loop: Header=BB27_272 Depth=2
	movw	r0, #8224
	movt	r0, #32
	mov.w	r2, #538976288
	str	r0, [sp, #364]
	str	r2, [sp, #360]
	ldr.w	r0, [sp, #363]
	ldr	r1, [sp, #80]                   @ 4-byte Reload
	str	r2, [r1]
	str.w	r0, [r1, #3]
	ldr	r0, [sp, #76]                   @ 4-byte Reload
	movw	r1, #8224
	strh	r1, [r0]
	movs	r1, #32
	strb	r1, [r0, #2]
	.p2align	2
.LBB27_296:                             @   Parent Loop BB27_269 Depth=1
                                        @     Parent Loop BB27_272 Depth=2
                                        @ =>    This Inner Loop Header: Depth=3
	mov	r0, r9
	mov	r1, r7
	bl	credits_private_random_bits
	subs.w	r2, r0, r10
	sbcs	r1, r1, #0
	bhs	.LBB27_296
@ %bb.297:                              @   in Loop: Header=BB27_272 Depth=2
	cmp	r0, #4
	bge	.LBB27_302
.LBB27_298:                             @   in Loop: Header=BB27_272 Depth=2
	cmp.w	r11, #1
	bne	.LBB27_300
@ %bb.299:                              @   in Loop: Header=BB27_272 Depth=2
	movw	r2, :lower16:.L.str.191
	ldr	r3, [sp, #20]                   @ 4-byte Reload
	add	r0, sp, #360
	movs	r1, #8
	movt	r2, :upper16:.L.str.191
	bl	snprintf
	b	.LBB27_301
	.p2align	2
.LBB27_300:                             @   in Loop: Header=BB27_272 Depth=2
	strd	r8, r4, [sp, #360]
.LBB27_301:                             @   in Loop: Header=BB27_272 Depth=2
	ldr.w	r0, [sp, #363]
	ldr	r2, [sp, #72]                   @ 4-byte Reload
	ldr	r1, [sp, #360]
	str.w	r0, [r2, #3]
	ldr	r0, [sp, #68]                   @ 4-byte Reload
	str	r1, [r2]
	movw	r1, #8224
	strh	r1, [r0]
	mov.w	r1, #32
	strb	r1, [r0, #2]
	cbnz	r6, .LBB27_305
	b	.LBB27_303
	.p2align	2
.LBB27_302:                             @   in Loop: Header=BB27_272 Depth=2
	movw	r0, #8224
	movt	r0, #32
	mov.w	r2, #538976288
	str	r0, [sp, #364]
	str	r2, [sp, #360]
	ldr.w	r0, [sp, #363]
	ldr	r1, [sp, #72]                   @ 4-byte Reload
	str	r2, [r1]
	str.w	r0, [r1, #3]
	ldr	r0, [sp, #68]                   @ 4-byte Reload
	movw	r1, #8224
	strh	r1, [r0]
	movs	r1, #32
	strb	r1, [r0, #2]
	.p2align	2
.LBB27_303:                             @   Parent Loop BB27_269 Depth=1
                                        @     Parent Loop BB27_272 Depth=2
                                        @ =>    This Inner Loop Header: Depth=3
	mov	r0, r9
	mov	r1, r7
	bl	credits_private_random_bits
	subs.w	r2, r0, r10
	sbcs	r1, r1, #0
	bhs	.LBB27_303
@ %bb.304:                              @   in Loop: Header=BB27_272 Depth=2
	cmp	r0, #4
	bge	.LBB27_309
.LBB27_305:                             @   in Loop: Header=BB27_272 Depth=2
	cmp.w	r11, #1
	bne	.LBB27_307
@ %bb.306:                              @   in Loop: Header=BB27_272 Depth=2
	movw	r2, :lower16:.L.str.191
	ldr	r3, [sp, #16]                   @ 4-byte Reload
	add	r0, sp, #360
	movs	r1, #8
	movt	r2, :upper16:.L.str.191
	bl	snprintf
	b	.LBB27_308
	.p2align	2
.LBB27_307:                             @   in Loop: Header=BB27_272 Depth=2
	strd	r8, r4, [sp, #360]
.LBB27_308:                             @   in Loop: Header=BB27_272 Depth=2
	ldr.w	r0, [sp, #363]
	ldr	r2, [sp, #48]                   @ 4-byte Reload
	ldr	r1, [sp, #360]
	str.w	r0, [r2, #3]
	ldr	r0, [sp, #44]                   @ 4-byte Reload
	str	r1, [r2]
	movw	r1, #8224
	strh	r1, [r0]
	mov.w	r1, #32
	strb	r1, [r0, #2]
	cbnz	r6, .LBB27_312
	b	.LBB27_310
	.p2align	2
.LBB27_309:                             @   in Loop: Header=BB27_272 Depth=2
	movw	r0, #8224
	movt	r0, #32
	mov.w	r2, #538976288
	str	r0, [sp, #364]
	str	r2, [sp, #360]
	ldr.w	r0, [sp, #363]
	ldr	r1, [sp, #48]                   @ 4-byte Reload
	str	r2, [r1]
	str.w	r0, [r1, #3]
	ldr	r0, [sp, #44]                   @ 4-byte Reload
	movw	r1, #8224
	strh	r1, [r0]
	movs	r1, #32
	strb	r1, [r0, #2]
	.p2align	2
.LBB27_310:                             @   Parent Loop BB27_269 Depth=1
                                        @     Parent Loop BB27_272 Depth=2
                                        @ =>    This Inner Loop Header: Depth=3
	mov	r0, r9
	mov	r1, r7
	bl	credits_private_random_bits
	subs.w	r2, r0, r10
	sbcs	r1, r1, #0
	bhs	.LBB27_310
@ %bb.311:                              @   in Loop: Header=BB27_272 Depth=2
	cmp	r0, #4
	bge	.LBB27_315
.LBB27_312:                             @   in Loop: Header=BB27_272 Depth=2
	cmp.w	r11, #1
	bne	.LBB27_314
@ %bb.313:                              @   in Loop: Header=BB27_272 Depth=2
	movw	r2, :lower16:.L.str.191
	ldr	r3, [sp, #36]                   @ 4-byte Reload
	add	r0, sp, #360
	movs	r1, #8
	movt	r2, :upper16:.L.str.191
	bl	snprintf
	b	.LBB27_316
	.p2align	2
.LBB27_314:                             @   in Loop: Header=BB27_272 Depth=2
	strd	r8, r4, [sp, #360]
	b	.LBB27_316
	.p2align	2
.LBB27_315:                             @   in Loop: Header=BB27_272 Depth=2
	movw	r0, #8224
	movt	r0, #32
	str	r0, [sp, #364]
	mov.w	r0, #538976288
	str	r0, [sp, #360]
.LBB27_316:                             @   in Loop: Header=BB27_272 Depth=2
	ldr.w	r0, [sp, #363]
	ldr	r2, [sp, #40]                   @ 4-byte Reload
	ldr	r1, [sp, #360]
	str.w	r0, [r2, #3]
	movs	r0, #0
	strb.w	r0, [sp, #161]
	ldr	r0, [sp, #60]                   @ 4-byte Reload
	str	r1, [r2]
	ldrd	lr, r1, [sp, #52]               @ 8-byte Folded Reload
	add.w	r12, r0, r11
	movs	r0, #1
	movs	r2, #49
	movs	r3, #39
	ldrb	r6, [r1]
	cmp	r6, #27
	bne.w	.LBB27_340
	.p2align	2
.LBB27_317:                             @   Parent Loop BB27_269 Depth=1
                                        @     Parent Loop BB27_272 Depth=2
                                        @ =>    This Loop Header: Depth=3
                                        @         Child Loop BB27_322 Depth 4
	ldrb	r6, [r1, #1]
	cmp	r6, #91
	bne.w	.LBB27_423
@ %bb.318:                              @   in Loop: Header=BB27_317 Depth=3
	adds	r4, r1, #2
	ldrb	r6, [r4]
	sub.w	r1, r6, #48
	cmp	r1, #9
	bhi	.LBB27_320
	b	.LBB27_321
	.p2align	2
.LBB27_319:                             @   in Loop: Header=BB27_317 Depth=3
	adds	r4, #1
	ldrb	r6, [r4]
	sub.w	r1, r6, #48
	cmp	r1, #9
	bls	.LBB27_321
.LBB27_320:                             @   in Loop: Header=BB27_317 Depth=3
	movs	r0, #0
	movs	r2, #49
	movs	r3, #39
	b	.LBB27_337
	.p2align	2
.LBB27_321:                             @   in Loop: Header=BB27_317 Depth=3
	movs	r1, #0
	.p2align	2
.LBB27_322:                             @   Parent Loop BB27_269 Depth=1
                                        @     Parent Loop BB27_272 Depth=2
                                        @       Parent Loop BB27_317 Depth=3
                                        @ =>      This Inner Loop Header: Depth=4
	add.w	r1, r1, r1, lsl #2
	add.w	r1, r6, r1, lsl #1
	ldrb	r6, [r4, #1]
	subs	r1, #48
	sub.w	r5, r6, #48
	cmp	r5, #9
	bhi	.LBB27_327
@ %bb.323:                              @   in Loop: Header=BB27_322 Depth=4
	add.w	r1, r1, r1, lsl #2
	add.w	r1, r6, r1, lsl #1
	ldrb	r6, [r4, #2]
	subs	r1, #48
	sub.w	r5, r6, #48
	cmp	r5, #9
	bhi	.LBB27_328
@ %bb.324:                              @   in Loop: Header=BB27_322 Depth=4
	ldrb	r5, [r4, #3]
	add.w	r1, r1, r1, lsl #2
	add.w	r1, r6, r1, lsl #1
	sub.w	r6, r5, #48
	cmp	r6, #9
	sub.w	r1, r1, #48
	bhi	.LBB27_329
@ %bb.325:                              @   in Loop: Header=BB27_322 Depth=4
	ldrb	r6, [r4, #4]!
	add.w	r1, r1, r1, lsl #2
	add.w	r1, r5, r1, lsl #1
	sub.w	r5, r6, #48
	cmp	r5, #10
	sub.w	r1, r1, #48
	blo	.LBB27_322
@ %bb.326:                              @   in Loop: Header=BB27_317 Depth=3
	subs	r5, r1, #1
	cmp	r5, #2
	bhs	.LBB27_330
	b	.LBB27_332
	.p2align	2
.LBB27_327:                             @   in Loop: Header=BB27_317 Depth=3
	adds	r4, #1
	subs	r5, r1, #1
	cmp	r5, #2
	bhs	.LBB27_330
	b	.LBB27_332
	.p2align	2
.LBB27_328:                             @   in Loop: Header=BB27_317 Depth=3
	adds	r4, #2
	subs	r5, r1, #1
	cmp	r5, #2
	bhs	.LBB27_330
	b	.LBB27_332
	.p2align	2
.LBB27_329:                             @   in Loop: Header=BB27_317 Depth=3
	adds	r4, #3
	mov	r6, r5
	subs	r5, r1, #1
	cmp	r5, #2
	blo	.LBB27_332
.LBB27_330:                             @   in Loop: Header=BB27_317 Depth=3
	cbz	r1, .LBB27_333
@ %bb.331:                              @   in Loop: Header=BB27_317 Depth=3
	cmp	r1, #22
	bne	.LBB27_334
.LBB27_332:                             @   in Loop: Header=BB27_317 Depth=3
	subs.w	r0, r1, #22
	it	ne
	movne	r0, r1
	b	.LBB27_337
	.p2align	2
.LBB27_333:                             @   in Loop: Header=BB27_317 Depth=3
	movs	r2, #49
	movs	r3, #39
	mov	r0, r1
	b	.LBB27_337
	.p2align	2
.LBB27_334:                             @   in Loop: Header=BB27_317 Depth=3
	sub.w	r5, r1, #30
	cmp	r5, #10
	bhs	.LBB27_336
@ %bb.335:                              @   in Loop: Header=BB27_317 Depth=3
	mov	r3, r1
	b	.LBB27_337
	.p2align	2
.LBB27_336:                             @   in Loop: Header=BB27_317 Depth=3
	sub.w	r2, r1, #40
	cmp	r2, #10
	mov	r2, r1
	bhs.w	.LBB27_424
	.p2align	2
.LBB27_337:                             @   in Loop: Header=BB27_317 Depth=3
	cmp	r6, #59
	beq.w	.LBB27_319
@ %bb.338:                              @   in Loop: Header=BB27_317 Depth=3
	cmp	r6, #109
	bne.w	.LBB27_399
@ %bb.339:                              @   in Loop: Header=BB27_317 Depth=3
	adds	r1, r4, #1
	ldrb	r6, [r1]
	cmp	r6, #27
	beq.w	.LBB27_317
.LBB27_340:                             @   in Loop: Header=BB27_272 Depth=2
	cmp	r6, #0
	bne.w	.LBB27_423
@ %bb.341:                              @   in Loop: Header=BB27_272 Depth=2
	ldrb.w	r5, [sp, #104]
	ldr	r4, [sp, #64]                   @ 4-byte Reload
	ldr	r6, [sp, #100]                  @ 4-byte Reload
	cmp	r5, #0
	beq.w	.LBB27_271
@ %bb.342:                              @   in Loop: Header=BB27_272 Depth=2
	lsls	r1, r2, #22
	orr.w	r1, r1, r3, lsl #16
	orr.w	r1, r1, r0, lsl #28
	movs	r2, #2
	add	r0, sp, #104
	b	.LBB27_346
	.p2align	2
.LBB27_343:                             @   in Loop: Header=BB27_346 Depth=3
	add.w	r12, r12, #1
.LBB27_344:                             @   in Loop: Header=BB27_346 Depth=3
	movs	r3, #2
.LBB27_345:                             @   in Loop: Header=BB27_346 Depth=3
	ldrb	r5, [r0]
	mov	r2, r3
	cmp	r5, #0
	beq.w	.LBB27_271
.LBB27_346:                             @   Parent Loop BB27_269 Depth=1
                                        @     Parent Loop BB27_272 Depth=2
                                        @ =>    This Inner Loop Header: Depth=3
	sub.w	r3, r5, #194
	cmp	r3, #29
	add.w	r3, r0, #1
	bhi	.LBB27_349
@ %bb.347:                              @   in Loop: Header=BB27_346 Depth=3
	ldrsb.w	r3, [r3]
	cmn.w	r3, #65
	bgt.w	.LBB27_425
@ %bb.348:                              @   in Loop: Header=BB27_346 Depth=3
	and	r3, r3, #63
	bfi	r3, r5, #6, #5
	adds	r0, #2
	mov	r5, r3
	b	.LBB27_350
	.p2align	2
.LBB27_349:                             @   in Loop: Header=BB27_346 Depth=3
	sxtb	r0, r5
	cmp.w	r0, #-1
	mov	r0, r3
	ble.w	.LBB27_425
.LBB27_350:                             @   in Loop: Header=BB27_346 Depth=3
	cmp	r5, #13
	beq	.LBB27_344
@ %bb.351:                              @   in Loop: Header=BB27_346 Depth=3
	cmp	r5, #10
	beq	.LBB27_343
@ %bb.352:                              @   in Loop: Header=BB27_346 Depth=3
	cmp	r2, #59
	add.w	r3, r2, #1
	it	ls
	cmpls.w	r12, #20
	blo	.LBB27_354
@ %bb.353:                              @   in Loop: Header=BB27_346 Depth=3
	ldr	r2, [r4]
	adds	r2, #1
	str	r2, [r4]
	b	.LBB27_345
	.p2align	2
.LBB27_354:                             @   in Loop: Header=BB27_346 Depth=3
	orr.w	r6, r1, r5
	rsb	r5, r12, r12, lsl #4
	add.w	r5, lr, r5, lsl #4
	str.w	r6, [r5, r2, lsl #2]
	ldr	r6, [sp, #100]                  @ 4-byte Reload
	b	.LBB27_345
	.p2align	2
.LBB27_355:                             @   in Loop: Header=BB27_269 Depth=1
	movs	r4, #0
	b	.LBB27_357
	.p2align	2
.LBB27_356:                             @   in Loop: Header=BB27_357 Depth=2
	adds	r4, #1
	cmp	r4, #3
	beq.w	.LBB27_268
	.p2align	2
.LBB27_357:                             @   Parent Loop BB27_269 Depth=1
                                        @ =>  This Loop Header: Depth=2
                                        @       Child Loop BB27_364 Depth 3
                                        @       Child Loop BB27_371 Depth 3
                                        @       Child Loop BB27_378 Depth 3
                                        @       Child Loop BB27_385 Depth 3
                                        @       Child Loop BB27_389 Depth 3
	mov	r0, r9
	mov	r1, r7
	bl	credits_private_random_bits
	subs.w	r2, r0, r10
	sbcs	r1, r1, #0
	bhs	.LBB27_357
@ %bb.358:                              @   in Loop: Header=BB27_357 Depth=2
	movw	r8, #30575
	movw	r1, #8227
	movt	r8, #110
	movt	r1, #32
	movw	r5, #28245
	cmp	r4, #0
	it	eq
	moveq	r8, r1
	movt	r5, #28267
	movw	r1, #8224
	movt	r1, #8995
	it	eq
	moveq	r5, r1
	cmp	r0, #4
	bge	.LBB27_361
@ %bb.359:                              @   in Loop: Header=BB27_357 Depth=2
	cmp	r4, #1
	beq	.LBB27_362
@ %bb.360:                              @   in Loop: Header=BB27_357 Depth=2
	strd	r5, r8, [sp, #360]
	b	.LBB27_363
	.p2align	2
.LBB27_361:                             @   in Loop: Header=BB27_357 Depth=2
	movw	r0, #8224
	movt	r0, #32
	str	r0, [sp, #364]
	mov.w	r0, #538976288
	str	r0, [sp, #360]
	b	.LBB27_363
	.p2align	2
.LBB27_362:                             @   in Loop: Header=BB27_357 Depth=2
	movw	r2, :lower16:.L.str.191
	ldr	r3, [sp, #32]                   @ 4-byte Reload
	add	r0, sp, #360
	movs	r1, #8
	movt	r2, :upper16:.L.str.191
	bl	snprintf
.LBB27_363:                             @   in Loop: Header=BB27_357 Depth=2
	ldr.w	r0, [sp, #363]
	ldr	r1, [sp, #360]
	str.w	r0, [sp, #107]
	ldr	r0, [sp, #92]                   @ 4-byte Reload
	str	r1, [sp, #104]
	movw	r1, #8224
	strh	r1, [r0]
	movs	r1, #32
	strb	r1, [r0, #2]
	.p2align	2
.LBB27_364:                             @   Parent Loop BB27_269 Depth=1
                                        @     Parent Loop BB27_357 Depth=2
                                        @ =>    This Inner Loop Header: Depth=3
	mov	r0, r9
	mov	r1, r7
	bl	credits_private_random_bits
	subs.w	r2, r0, r10
	sbcs	r1, r1, #0
	bhs	.LBB27_364
@ %bb.365:                              @   in Loop: Header=BB27_357 Depth=2
	cmp	r0, #4
	bge	.LBB27_368
@ %bb.366:                              @   in Loop: Header=BB27_357 Depth=2
	cmp	r4, #1
	beq	.LBB27_369
@ %bb.367:                              @   in Loop: Header=BB27_357 Depth=2
	strd	r5, r8, [sp, #360]
	b	.LBB27_370
	.p2align	2
.LBB27_368:                             @   in Loop: Header=BB27_357 Depth=2
	movw	r0, #8224
	movt	r0, #32
	str	r0, [sp, #364]
	mov.w	r0, #538976288
	str	r0, [sp, #360]
	b	.LBB27_370
	.p2align	2
.LBB27_369:                             @   in Loop: Header=BB27_357 Depth=2
	movw	r2, :lower16:.L.str.191
	ldr	r3, [sp, #28]                   @ 4-byte Reload
	add	r0, sp, #360
	movs	r1, #8
	movt	r2, :upper16:.L.str.191
	bl	snprintf
.LBB27_370:                             @   in Loop: Header=BB27_357 Depth=2
	ldr.w	r0, [sp, #363]
	ldr	r2, [sp, #96]                   @ 4-byte Reload
	ldr	r1, [sp, #360]
	str.w	r0, [r2, #3]
	ldr	r0, [sp, #84]                   @ 4-byte Reload
	str	r1, [r2]
	movw	r1, #8224
	strh	r1, [r0]
	movs	r1, #32
	strb	r1, [r0, #2]
	.p2align	2
.LBB27_371:                             @   Parent Loop BB27_269 Depth=1
                                        @     Parent Loop BB27_357 Depth=2
                                        @ =>    This Inner Loop Header: Depth=3
	mov	r0, r9
	mov	r1, r7
	bl	credits_private_random_bits
	subs.w	r2, r0, r10
	sbcs	r1, r1, #0
	bhs	.LBB27_371
@ %bb.372:                              @   in Loop: Header=BB27_357 Depth=2
	cmp	r0, #4
	bge	.LBB27_375
@ %bb.373:                              @   in Loop: Header=BB27_357 Depth=2
	cmp	r4, #1
	beq	.LBB27_376
@ %bb.374:                              @   in Loop: Header=BB27_357 Depth=2
	strd	r5, r8, [sp, #360]
	b	.LBB27_377
	.p2align	2
.LBB27_375:                             @   in Loop: Header=BB27_357 Depth=2
	movw	r0, #8224
	movt	r0, #32
	str	r0, [sp, #364]
	mov.w	r0, #538976288
	str	r0, [sp, #360]
	b	.LBB27_377
	.p2align	2
.LBB27_376:                             @   in Loop: Header=BB27_357 Depth=2
	movw	r2, :lower16:.L.str.191
	ldr	r3, [sp, #24]                   @ 4-byte Reload
	add	r0, sp, #360
	movs	r1, #8
	movt	r2, :upper16:.L.str.191
	bl	snprintf
.LBB27_377:                             @   in Loop: Header=BB27_357 Depth=2
	ldr.w	r0, [sp, #363]
	ldr	r2, [sp, #80]                   @ 4-byte Reload
	ldr	r1, [sp, #360]
	str.w	r0, [r2, #3]
	ldr	r0, [sp, #76]                   @ 4-byte Reload
	str	r1, [r2]
	movw	r1, #8224
	strh	r1, [r0]
	movs	r1, #32
	strb	r1, [r0, #2]
	.p2align	2
.LBB27_378:                             @   Parent Loop BB27_269 Depth=1
                                        @     Parent Loop BB27_357 Depth=2
                                        @ =>    This Inner Loop Header: Depth=3
	mov	r0, r9
	mov	r1, r7
	bl	credits_private_random_bits
	subs.w	r2, r0, r10
	sbcs	r1, r1, #0
	bhs	.LBB27_378
@ %bb.379:                              @   in Loop: Header=BB27_357 Depth=2
	cmp	r0, #4
	bge	.LBB27_382
@ %bb.380:                              @   in Loop: Header=BB27_357 Depth=2
	cmp	r4, #1
	beq	.LBB27_383
@ %bb.381:                              @   in Loop: Header=BB27_357 Depth=2
	strd	r5, r8, [sp, #360]
	b	.LBB27_384
	.p2align	2
.LBB27_382:                             @   in Loop: Header=BB27_357 Depth=2
	movw	r0, #8224
	movt	r0, #32
	str	r0, [sp, #364]
	mov.w	r0, #538976288
	str	r0, [sp, #360]
	b	.LBB27_384
	.p2align	2
.LBB27_383:                             @   in Loop: Header=BB27_357 Depth=2
	movw	r2, :lower16:.L.str.191
	add	r0, sp, #360
	movs	r1, #8
	movt	r2, :upper16:.L.str.191
	movs	r3, #22
	bl	snprintf
.LBB27_384:                             @   in Loop: Header=BB27_357 Depth=2
	ldr.w	r0, [sp, #363]
	ldr	r2, [sp, #72]                   @ 4-byte Reload
	ldr	r1, [sp, #360]
	str.w	r0, [r2, #3]
	ldr	r0, [sp, #68]                   @ 4-byte Reload
	str	r1, [r2]
	movw	r1, #8224
	strh	r1, [r0]
	movs	r1, #32
	strb	r1, [r0, #2]
	.p2align	2
.LBB27_385:                             @   Parent Loop BB27_269 Depth=1
                                        @     Parent Loop BB27_357 Depth=2
                                        @ =>    This Inner Loop Header: Depth=3
	mov	r0, r9
	mov	r1, r7
	bl	credits_private_random_bits
	subs.w	r2, r0, r10
	sbcs	r1, r1, #0
	bhs	.LBB27_385
@ %bb.386:                              @   in Loop: Header=BB27_357 Depth=2
	cmp	r0, #3
	bgt	.LBB27_389
@ %bb.387:                              @   in Loop: Header=BB27_357 Depth=2
	cmp	r4, #1
	bne	.LBB27_389
@ %bb.388:                              @   in Loop: Header=BB27_357 Depth=2
	movw	r2, :lower16:.L.str.191
	add	r0, sp, #360
	movs	r1, #8
	movt	r2, :upper16:.L.str.191
	movs	r3, #23
	bl	snprintf
	.p2align	2
.LBB27_389:                             @   Parent Loop BB27_269 Depth=1
                                        @     Parent Loop BB27_357 Depth=2
                                        @ =>    This Inner Loop Header: Depth=3
	mov	r0, r9
	mov	r1, r7
	bl	credits_private_random_bits
	subs.w	r2, r0, r10
	sbcs	r1, r1, #0
	bhs	.LBB27_389
@ %bb.390:                              @   in Loop: Header=BB27_357 Depth=2
	cmp	r0, #3
	bgt.w	.LBB27_356
@ %bb.391:                              @   in Loop: Header=BB27_357 Depth=2
	cmp	r4, #1
	bne.w	.LBB27_356
@ %bb.392:                              @   in Loop: Header=BB27_357 Depth=2
	movw	r2, :lower16:.L.str.191
	ldr	r3, [sp, #36]                   @ 4-byte Reload
	add	r0, sp, #360
	movs	r1, #8
	movt	r2, :upper16:.L.str.191
	bl	snprintf
	b	.LBB27_356
	.p2align	2
.LBB27_393:
	cmp	r6, #4
	beq	.LBB27_398
@ %bb.394:
	ldr	r0, [sp, #88]                   @ 4-byte Reload
	cmp	r6, #3
	beq	.LBB27_397
@ %bb.395:
	cmp	r6, #2
	bne.w	.LBB27_422
@ %bb.396:
	movw	r7, :lower16:.L.str.46
	movw	r3, :lower16:.L.str.86
	movt	r7, :upper16:.L.str.46
	movt	r3, :upper16:.L.str.86
	movs	r1, #2
	movs	r2, #13
	str	r7, [sp]
	bl	credits_private_credits_multiline
	add	sp, #372
	pop.w	{r4, r5, r6, r7, r8, r9, r10, r11, pc}
	.p2align	2
.LBB27_397:
	add	sp, #372
	pop.w	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	b	credits_private_scenes60_access_ping
	.p2align	2
.LBB27_398:
	movw	r2, :lower16:.L.str.87
	movw	r3, :lower16:.L.str.88
	ldr	r0, [sp, #88]                   @ 4-byte Reload
	movt	r2, :upper16:.L.str.87
	movt	r3, :upper16:.L.str.88
	movs	r1, #13
	add	sp, #372
	pop.w	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	b	credits_private_scenes60_access_tile
	.p2align	2
.LBB27_399:
	movw	r0, :lower16:.L.str.82
	movt	r0, :upper16:.L.str.82
	bl	credits_private_credits_fail
	.p2align	2
.LBB27_400:
	cmp	r0, #0
	bne.w	.LBB27_436
@ %bb.401:
	ldr	r0, [r2, #120]
	cmp	r0, #0
	bne.w	.LBB27_436
@ %bb.402:
	ldr.w	r12, [r9, #12]
	cmp.w	r12, #0
	beq.w	.LBB27_435
@ %bb.403:
	mov	lr, r1
	ldrd	r3, r1, [r9, #16]
	adds	r1, #3
	bic	r1, r1, #3
	subs	r6, r3, r1
	blo.w	.LBB27_435
@ %bb.404:
	adds	r3, r7, #1
	add.w	r3, r7, r3, lsr #1
	adds	r3, #33
	cmp	r3, r6
	bhi.w	.LBB27_435
@ %bb.405:
	ldrd	r4, r0, [r9]
	adds	r6, r1, r3
	str.w	r6, [r9, #20]
	adds	r6, r4, r3
	cmp	r6, r0
	str.w	r6, [r9]
	it	hi
	strhi.w	r6, [r9, #4]
	ldr.w	r0, [r9, #8]
	mov	r6, lr
	add.w	r4, r12, r1
	adds	r0, #1
	str.w	r0, [r9, #8]
	strd	r4, r3, [r2, #120]
.LBB27_406:
	mov	r0, r4
	mov	r1, r7
	movs	r2, #35
	bl	__aeabi_memset
	movs	r0, #0
	strb	r0, [r4, r7]
	cbz	r5, .LBB27_408
@ %bb.407:
	movw	r0, #4840
	movw	r3, :lower16:.L.str.112
	add	r0, r9
	movt	r3, :upper16:.L.str.112
	mov	r1, r4
	mov.w	r2, #400
	bl	credits_private_corrupt_text
.LBB27_408:
	cmp	r7, #33
	itt	hs
	movhs	r0, #0
	strbhs.w	r0, [r4, #32]
	movw	r0, :lower16:.L.str.54
	movw	r1, :lower16:.L.str.49
	ldr	r2, [sp, #100]                  @ 4-byte Reload
	movt	r0, :upper16:.L.str.54
	movt	r1, :upper16:.L.str.49
	cmp	r2, #5
	it	eq
	moveq	r1, r0
	movw	r0, :lower16:.L.str.88
	movt	r0, :upper16:.L.str.88
	cmp	r6, #15
	it	ne
	movne	r0, r1
	bl	credits_private_canvas60_style
	ldrb	r1, [r4]
	cbz	r1, .LBB27_422
@ %bb.409:
	add.w	r12, r9, #24
	movs	r2, #8
	movs	r7, #15
	b	.LBB27_413
	.p2align	2
.LBB27_410:                             @   in Loop: Header=BB27_413 Depth=1
	adds	r2, #1
.LBB27_411:                             @   in Loop: Header=BB27_413 Depth=1
	movs	r5, #15
.LBB27_412:                             @   in Loop: Header=BB27_413 Depth=1
	ldrb	r1, [r4]
	mov	r7, r5
	cbz	r1, .LBB27_422
.LBB27_413:                             @ =>This Inner Loop Header: Depth=1
	sub.w	r6, r1, #194
	cmp	r6, #29
	add.w	r6, r4, #1
	bhi	.LBB27_416
@ %bb.414:                              @   in Loop: Header=BB27_413 Depth=1
	ldrsb.w	r6, [r6]
	cmn.w	r6, #65
	bgt	.LBB27_425
@ %bb.415:                              @   in Loop: Header=BB27_413 Depth=1
	and	r3, r6, #63
	bfi	r3, r1, #6, #5
	adds	r4, #2
	mov	r1, r3
	b	.LBB27_417
	.p2align	2
.LBB27_416:                             @   in Loop: Header=BB27_413 Depth=1
	sxtb	r3, r1
	cmp.w	r3, #-1
	mov	r4, r6
	ble	.LBB27_425
.LBB27_417:                             @   in Loop: Header=BB27_413 Depth=1
	cmp	r1, #13
	beq	.LBB27_411
@ %bb.418:                              @   in Loop: Header=BB27_413 Depth=1
	cmp	r1, #10
	beq	.LBB27_410
@ %bb.419:                              @   in Loop: Header=BB27_413 Depth=1
	cmp	r7, #59
	add.w	r5, r7, #1
	it	ls
	cmpls	r2, #20
	blo	.LBB27_421
@ %bb.420:                              @   in Loop: Header=BB27_413 Depth=1
	ldr	r3, [sp, #64]                   @ 4-byte Reload
	ldr	r1, [r3]
	adds	r1, #1
	str	r1, [r3]
	b	.LBB27_412
	.p2align	2
.LBB27_421:                             @   in Loop: Header=BB27_413 Depth=1
	rsb	r3, r2, r2, lsl #4
	orrs	r1, r0
	add.w	r3, r12, r3, lsl #4
	str.w	r1, [r3, r7, lsl #2]
	b	.LBB27_412
	.p2align	2
.LBB27_422:
	add	sp, #372
	pop.w	{r4, r5, r6, r7, r8, r9, r10, r11, pc}
	.p2align	2
.LBB27_423:
	movw	r0, :lower16:.L.str.80
	movt	r0, :upper16:.L.str.80
	bl	credits_private_credits_fail
	.p2align	2
.LBB27_424:
	movw	r0, :lower16:.L.str.81
	movt	r0, :upper16:.L.str.81
	bl	credits_private_credits_fail
	.p2align	2
.LBB27_425:
	movw	r0, :lower16:.L.str.162
	movt	r0, :upper16:.L.str.162
	bl	credits_private_credits_fail
	.p2align	2
.LBB27_426:
	movw	r0, :lower16:.L.str.170
	movt	r0, :upper16:.L.str.170
	bl	credits_private_credits_fail
	.p2align	2
.LBB27_427:
	movw	r0, :lower16:.L.str.34
	movt	r0, :upper16:.L.str.34
	bl	credits_private_credits_fail
	.p2align	2
.LBB27_428:
	movw	r0, :lower16:.L.str.79
	movt	r0, :upper16:.L.str.79
	bl	credits_private_credits_fail
	.p2align	2
.LBB27_429:
	movw	r0, :lower16:.L.str.90
	movt	r0, :upper16:.L.str.90
	bl	credits_private_credits_fail
	.p2align	2
.LBB27_430:
	movw	r0, :lower16:.L.str.76
	movt	r0, :upper16:.L.str.76
	bl	credits_private_credits_fail
	.p2align	2
.LBB27_431:
	movw	r0, :lower16:.L.str.198
	movt	r0, :upper16:.L.str.198
	bl	credits_private_credits_fail
	.p2align	2
.LBB27_432:
	movw	r0, :lower16:.L.str.6
	movt	r0, :upper16:.L.str.6
	bl	credits_private_credits_fail
	.p2align	2
.LBB27_433:
	movw	r0, :lower16:.L.str.77
	movt	r0, :upper16:.L.str.77
	bl	credits_private_credits_fail
	.p2align	2
.LBB27_434:
	movw	r0, :lower16:.L.str.189
	movt	r0, :upper16:.L.str.189
	bl	credits_private_credits_fail
	.p2align	2
.LBB27_435:
	movw	r0, :lower16:.L.str.2
	movt	r0, :upper16:.L.str.2
	bl	credits_private_credits_fail
	.p2align	2
.LBB27_436:
	movw	r0, :lower16:.L.str.1
	movt	r0, :upper16:.L.str.1
	bl	credits_private_credits_fail
@ %bb.437:
.Lfunc_end27:
	.size	credits_private_credits_request_generator, .Lfunc_end27-credits_private_credits_request_generator
	.cantunwind
	.fnend
                                        @ -- End function
	.p2align	2                               @ -- Begin function credits_private_credits_timeline
	.type	credits_private_credits_timeline,%function
	.code	16
	.thumb_func
credits_private_credits_timeline:       @ @credits_private_credits_timeline
	.fnstart
@ %bb.0:
	.save	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	push.w	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	.pad	#84
	sub	sp, #84
	mov	r7, r1
	mov	r1, r0
	movw	r0, #9964
	add	r0, r1
	str	r0, [sp, #32]                   @ 4-byte Spill
	movw	r0, #4840
	add	r0, r1
	str	r0, [sp, #72]                   @ 4-byte Spill
	movw	r0, #7344
	add	r0, r1
	str	r0, [sp, #24]                   @ 4-byte Spill
	movw	r0, #8028
	add	r0, r1
	str	r0, [sp, #12]                   @ 4-byte Spill
	movw	r0, #7668
	add	r0, r1
	str	r0, [sp, #4]                    @ 4-byte Spill
	movw	r0, #7352
	add	r0, r1
	str	r0, [sp, #28]                   @ 4-byte Spill
	addw	r0, r1, #2492
	str	r0, [sp, #40]                   @ 4-byte Spill
	movw	r0, #4856
	add	r0, r1
	str	r0, [sp, #68]                   @ 4-byte Spill
	movw	r0, #4852
	add	r0, r1
	str	r0, [sp, #64]                   @ 4-byte Spill
	movw	r0, #4848
	movw	r6, #65534
	add	r0, r1
	movw	r11, #45279
	movt	r6, #32767
	str	r1, [sp, #76]                   @ 4-byte Spill
	str	r0, [sp, #60]                   @ 4-byte Spill
	mov.w	r9, #-2147483648
	movs	r0, #0
	movt	r11, #39176
	str	r7, [sp, #8]                    @ 4-byte Spill
	b	.LBB28_2
	.p2align	2
.LBB28_1:                               @   in Loop: Header=BB28_2 Depth=1
	ldr	r0, [sp, #16]                   @ 4-byte Reload
	ldr	r7, [sp, #8]                    @ 4-byte Reload
	adds	r0, #1
	cmp	r0, #85
	beq.w	.LBB28_111
.LBB28_2:                               @ =>This Loop Header: Depth=1
                                        @     Child Loop BB28_7 Depth 2
                                        @       Child Loop BB28_42 Depth 3
                                        @         Child Loop BB28_44 Depth 4
                                        @       Child Loop BB28_15 Depth 3
	movw	r1, :lower16:credits_private_credits_timeline_events
	str	r0, [sp, #16]                   @ 4-byte Spill
	lsls	r0, r0, #4
	movt	r1, :upper16:credits_private_credits_timeline_events
	ldr	r0, [r1, r0]
	cmp	r0, r7
	bne	.LBB28_1
@ %bb.3:                                @   in Loop: Header=BB28_2 Depth=1
	ldr	r2, [sp, #32]                   @ 4-byte Reload
	movw	r0, :lower16:credits_private_credits_timeline_events
	ldr.w	r3, [r2, #180]
	ldr	r1, [sp, #16]                   @ 4-byte Reload
	movt	r0, :upper16:credits_private_credits_timeline_events
	add.w	r7, r0, r1, lsl #4
	cbz	r3, .LBB28_5
@ %bb.4:                                @   in Loop: Header=BB28_2 Depth=1
	ldr.w	r0, [r2, #184]
	ldr	r2, [r7, #4]
	ldr	r1, [sp, #8]                    @ 4-byte Reload
	blx	r3
	ldr	r2, [sp, #32]                   @ 4-byte Reload
.LBB28_5:                               @   in Loop: Header=BB28_2 Depth=1
	ldr.w	r0, [r2, #176]
	ldrd	r1, r3, [r7, #8]
	adds	r0, #1
	str.w	r0, [r2, #176]
	add.w	r0, r1, r1, lsl #2
	movw	r1, :lower16:credits_private_credits_event_actions
	movt	r1, :upper16:credits_private_credits_event_actions
	add.w	r0, r1, r0, lsl #2
	movs	r1, #0
	str	r0, [sp, #44]                   @ 4-byte Spill
	cmp	r3, #1
	mov.w	r0, #1
	it	le
	movle	r3, r0
	str	r3, [sp, #36]                   @ 4-byte Spill
	b	.LBB28_7
	.p2align	2
.LBB28_6:                               @   in Loop: Header=BB28_7 Depth=2
	ldr	r1, [sp, #48]                   @ 4-byte Reload
	ldr	r0, [sp, #36]                   @ 4-byte Reload
	adds	r1, #1
	cmp	r1, r0
	beq	.LBB28_1
.LBB28_7:                               @   Parent Loop BB28_2 Depth=1
                                        @ =>  This Loop Header: Depth=2
                                        @       Child Loop BB28_42 Depth 3
                                        @         Child Loop BB28_44 Depth 4
                                        @       Child Loop BB28_15 Depth 3
	str	r1, [sp, #48]                   @ 4-byte Spill
	ldr	r0, [sp, #44]                   @ 4-byte Reload
	add.w	r1, r1, r1, lsl #2
	ldr.w	r0, [r0, r1, lsl #2]
	cmp	r0, #10
	bhi	.LBB28_6
@ %bb.8:                                @   in Loop: Header=BB28_7 Depth=2
	ldr	r3, [sp, #44]                   @ 4-byte Reload
	add.w	r3, r3, r1, lsl #2
.LCPI28_0:
	tbh	[pc, r0, lsl #1]
@ %bb.9:
.LJTI28_0:
	.short	(.LBB28_11-(.LCPI28_0+4))/2
	.short	(.LBB28_29-(.LCPI28_0+4))/2
	.short	(.LBB28_13-(.LCPI28_0+4))/2
	.short	(.LBB28_23-(.LCPI28_0+4))/2
	.short	(.LBB28_10-(.LCPI28_0+4))/2
	.short	(.LBB28_30-(.LCPI28_0+4))/2
	.short	(.LBB28_35-(.LCPI28_0+4))/2
	.short	(.LBB28_24-(.LCPI28_0+4))/2
	.short	(.LBB28_47-(.LCPI28_0+4))/2
	.short	(.LBB28_12-(.LCPI28_0+4))/2
	.short	(.LBB28_40-(.LCPI28_0+4))/2
	.p2align	1
	.p2align	2
.LBB28_10:                              @   in Loop: Header=BB28_7 Depth=2
	ldr	r0, [r3, #12]
	ldr	r1, [sp, #32]                   @ 4-byte Reload
	str	r0, [r1, #44]
	b	.LBB28_6
	.p2align	2
.LBB28_11:                              @   in Loop: Header=BB28_7 Depth=2
	ldr	r1, [r3, #4]
	ldr	r2, [r3, #12]
	ldr	r0, [sp, #28]                   @ 4-byte Reload
	movs	r3, #0
	bl	credits_private_scheduler_start
	b	.LBB28_6
	.p2align	2
.LBB28_12:                              @   in Loop: Header=BB28_7 Depth=2
	ldr	r0, [r3, #4]
	ldr	r2, [sp, #76]                   @ 4-byte Reload
	ldr	r1, [r3, #16]
	rsb	r0, r0, r0, lsl #5
	add.w	r0, r2, r0, lsl #4
	movw	r2, #7304
	str	r1, [r0, r2]
	b	.LBB28_6
	.p2align	2
.LBB28_13:                              @   in Loop: Header=BB28_7 Depth=2
	ldr	r0, [sp, #72]                   @ 4-byte Reload
	ldr.w	r4, [r0, #2528]
	cmp	r4, #1
	blt	.LBB28_6
@ %bb.14:                               @   in Loop: Header=BB28_7 Depth=2
	ldr	r0, [sp, #72]                   @ 4-byte Reload
	ldr	r7, [r3, #4]
	ldr.w	r1, [r0, #2524]
	rsbs	r5, r4, #0
	add.w	lr, r1, #12
	sub.w	r8, r4, #1
	movs	r3, #0
.LBB28_15:                              @   Parent Loop BB28_2 Depth=1
                                        @     Parent Loop BB28_7 Depth=2
                                        @ =>    This Inner Loop Header: Depth=3
	ldr	r0, [lr, #-12]
	cmp	r0, r7
	add.w	r0, r1, r3, lsl #2
	beq.w	.LBB28_93
@ %bb.16:                               @   in Loop: Header=BB28_15 Depth=3
	cmp	r8, r3
	beq	.LBB28_6
@ %bb.17:                               @   in Loop: Header=BB28_15 Depth=3
	ldr	r2, [r0, #4]
	cmp	r2, r7
	beq.w	.LBB28_94
@ %bb.18:                               @   in Loop: Header=BB28_15 Depth=3
	add.w	r12, r5, r3
	adds.w	r2, r12, #2
	beq	.LBB28_6
@ %bb.19:                               @   in Loop: Header=BB28_15 Depth=3
	ldr	r0, [r0, #8]
	cmp	r0, r7
	beq.w	.LBB28_95
@ %bb.20:                               @   in Loop: Header=BB28_15 Depth=3
	adds.w	r0, r12, #3
	beq	.LBB28_6
@ %bb.21:                               @   in Loop: Header=BB28_15 Depth=3
	mov	r0, lr
	ldr	r2, [r0], #16
	cmp	r2, r7
	beq.w	.LBB28_96
@ %bb.22:                               @   in Loop: Header=BB28_15 Depth=3
	adds	r3, #4
	cmp	r4, r3
	mov	lr, r0
	bne	.LBB28_15
	b	.LBB28_6
	.p2align	2
.LBB28_23:                              @   in Loop: Header=BB28_7 Depth=2
	ldr	r0, [sp, #32]                   @ 4-byte Reload
	movs	r1, #0
	str	r1, [r0]
	b	.LBB28_6
	.p2align	2
.LBB28_24:                              @   in Loop: Header=BB28_7 Depth=2
	ldr	r0, [r3, #4]
	ldr	r7, [sp, #76]                   @ 4-byte Reload
	subs	r2, r0, #3
	cmp	r2, #17
	bhi.w	.LBB28_134
@ %bb.25:                               @   in Loop: Header=BB28_7 Depth=2
	ldrd	r1, r0, [r3, #8]
.LCPI28_1:
	tbh	[pc, r2, lsl #1]
@ %bb.26:
.LJTI28_1:
	.short	(.LBB28_27-(.LCPI28_1+4))/2
	.short	(.LBB28_64-(.LCPI28_1+4))/2
	.short	(.LBB28_134-(.LCPI28_1+4))/2
	.short	(.LBB28_56-(.LCPI28_1+4))/2
	.short	(.LBB28_134-(.LCPI28_1+4))/2
	.short	(.LBB28_134-(.LCPI28_1+4))/2
	.short	(.LBB28_134-(.LCPI28_1+4))/2
	.short	(.LBB28_62-(.LCPI28_1+4))/2
	.short	(.LBB28_134-(.LCPI28_1+4))/2
	.short	(.LBB28_134-(.LCPI28_1+4))/2
	.short	(.LBB28_134-(.LCPI28_1+4))/2
	.short	(.LBB28_48-(.LCPI28_1+4))/2
	.short	(.LBB28_134-(.LCPI28_1+4))/2
	.short	(.LBB28_134-(.LCPI28_1+4))/2
	.short	(.LBB28_50-(.LCPI28_1+4))/2
	.short	(.LBB28_134-(.LCPI28_1+4))/2
	.short	(.LBB28_87-(.LCPI28_1+4))/2
	.short	(.LBB28_60-(.LCPI28_1+4))/2
	.p2align	1
	.p2align	2
.LBB28_27:                              @   in Loop: Header=BB28_7 Depth=2
	cmp	r1, #1
	bne.w	.LBB28_134
@ %bb.28:                               @   in Loop: Header=BB28_7 Depth=2
	movs	r1, #0
	b	.LBB28_100
	.p2align	2
.LBB28_29:                              @   in Loop: Header=BB28_7 Depth=2
	ldr	r1, [r3, #4]
	ldr	r2, [r3, #12]
	ldr	r0, [sp, #28]                   @ 4-byte Reload
	movs	r3, #1
	bl	credits_private_scheduler_start
	b	.LBB28_6
	.p2align	2
.LBB28_30:                              @   in Loop: Header=BB28_7 Depth=2
	ldr	r0, [r3, #4]
	subs	r1, r0, #3
	cmp	r1, #17
	bhi.w	.LBB28_134
@ %bb.31:                               @   in Loop: Header=BB28_7 Depth=2
	ldr	r0, [r3, #8]
.LCPI28_2:
	tbh	[pc, r1, lsl #1]
@ %bb.32:
.LJTI28_3:
	.short	(.LBB28_33-(.LCPI28_2+4))/2
	.short	(.LBB28_81-(.LCPI28_2+4))/2
	.short	(.LBB28_134-(.LCPI28_2+4))/2
	.short	(.LBB28_73-(.LCPI28_2+4))/2
	.short	(.LBB28_134-(.LCPI28_2+4))/2
	.short	(.LBB28_134-(.LCPI28_2+4))/2
	.short	(.LBB28_134-(.LCPI28_2+4))/2
	.short	(.LBB28_77-(.LCPI28_2+4))/2
	.short	(.LBB28_134-(.LCPI28_2+4))/2
	.short	(.LBB28_134-(.LCPI28_2+4))/2
	.short	(.LBB28_134-(.LCPI28_2+4))/2
	.short	(.LBB28_54-(.LCPI28_2+4))/2
	.short	(.LBB28_134-(.LCPI28_2+4))/2
	.short	(.LBB28_134-(.LCPI28_2+4))/2
	.short	(.LBB28_65-(.LCPI28_2+4))/2
	.short	(.LBB28_134-(.LCPI28_2+4))/2
	.short	(.LBB28_89-(.LCPI28_2+4))/2
	.short	(.LBB28_75-(.LCPI28_2+4))/2
	.p2align	1
	.p2align	2
.LBB28_33:                              @   in Loop: Header=BB28_7 Depth=2
	cmp	r0, #1
	bne.w	.LBB28_134
@ %bb.34:                               @   in Loop: Header=BB28_7 Depth=2
	movs	r0, #0
	b	.LBB28_104
	.p2align	2
.LBB28_35:                              @   in Loop: Header=BB28_7 Depth=2
	ldr	r0, [r3, #4]
	ldr	r7, [sp, #76]                   @ 4-byte Reload
	subs	r2, r0, #3
	cmp	r2, #17
	bhi.w	.LBB28_134
@ %bb.36:                               @   in Loop: Header=BB28_7 Depth=2
	ldrd	r1, r0, [r3, #8]
.LCPI28_3:
	tbh	[pc, r2, lsl #1]
@ %bb.37:
.LJTI28_2:
	.short	(.LBB28_38-(.LCPI28_3+4))/2
	.short	(.LBB28_86-(.LCPI28_3+4))/2
	.short	(.LBB28_134-(.LCPI28_3+4))/2
	.short	(.LBB28_79-(.LCPI28_3+4))/2
	.short	(.LBB28_134-(.LCPI28_3+4))/2
	.short	(.LBB28_134-(.LCPI28_3+4))/2
	.short	(.LBB28_134-(.LCPI28_3+4))/2
	.short	(.LBB28_84-(.LCPI28_3+4))/2
	.short	(.LBB28_134-(.LCPI28_3+4))/2
	.short	(.LBB28_134-(.LCPI28_3+4))/2
	.short	(.LBB28_134-(.LCPI28_3+4))/2
	.short	(.LBB28_58-(.LCPI28_3+4))/2
	.short	(.LBB28_134-(.LCPI28_3+4))/2
	.short	(.LBB28_134-(.LCPI28_3+4))/2
	.short	(.LBB28_69-(.LCPI28_3+4))/2
	.short	(.LBB28_134-(.LCPI28_3+4))/2
	.short	(.LBB28_91-(.LCPI28_3+4))/2
	.short	(.LBB28_82-(.LCPI28_3+4))/2
	.p2align	1
	.p2align	2
.LBB28_38:                              @   in Loop: Header=BB28_7 Depth=2
	cmp	r1, #1
	bne.w	.LBB28_134
@ %bb.39:                               @   in Loop: Header=BB28_7 Depth=2
	movs	r1, #0
	b	.LBB28_110
	.p2align	2
.LBB28_40:                              @   in Loop: Header=BB28_7 Depth=2
	str	r3, [sp, #20]                   @ 4-byte Spill
	ldr	r0, [sp, #24]                   @ 4-byte Reload
	ldr	r7, [sp, #72]                   @ 4-byte Reload
	ldrd	r5, r2, [r0]
	ldr.w	r0, [r7, #2496]
	b	.LBB28_42
	.p2align	2
.LBB28_41:                              @   in Loop: Header=BB28_42 Depth=3
	adds	r4, r0, #1
	str.w	r4, [r7, #2496]
	ldr.w	r0, [r7, r0, lsl #2]
	adds	r5, #1
	eor.w	r1, r0, r0, lsr #11
	and.w	r3, r9, r0, lsl #7
	eor.w	r1, r3, r1, lsl #15
	eor.w	r1, r1, r0
	adc	r2, r2, #0
	cmp	r1, #0
	mov	r0, r4
	bpl.w	.LBB28_46
.LBB28_42:                              @   Parent Loop BB28_2 Depth=1
                                        @     Parent Loop BB28_7 Depth=2
                                        @ =>    This Loop Header: Depth=3
                                        @         Child Loop BB28_44 Depth 4
	cmp.w	r0, #624
	blt	.LBB28_41
@ %bb.43:                               @   in Loop: Header=BB28_42 Depth=3
	strd	r2, r5, [sp, #52]               @ 8-byte Folded Spill
	ldr.w	r12, [r7]
	ldr.w	r9, [sp, #40]                   @ 4-byte Reload
	movw	r8, #64628
	movs	r0, #0
	mov.w	r10, #0
	movt	r8, #65535
	.p2align	2
.LBB28_44:                              @   Parent Loop BB28_2 Depth=1
                                        @     Parent Loop BB28_7 Depth=2
                                        @       Parent Loop BB28_42 Depth=3
                                        @ =>      This Inner Loop Header: Depth=4
	add.w	r1, r9, r0, lsl #2
	ldr.w	r2, [r1, #2352]
	add.w	r3, r9, r10
	and	r5, r12, #-2147483648
	and.w	r4, r2, r6
	mov	r12, r6
	mov	r6, r8
	str	r3, [sp, #80]                   @ 4-byte Spill
	cmp	r0, #227
	it	lo
	movwlo	r6, #1588
	add	r6, r7
	ldr.w	r6, [r6, r0, lsl #2]
	add	r5, r4
	eor.w	r6, r6, r5, lsr #1
	lsls	r5, r2, #31
	it	ne
	eorne.w	r6, r6, r11
	ldr.w	lr, [sp, #60]                   @ 4-byte Reload
	str.w	r6, [r3, #2348]
	mov	r7, r8
	ldr.w	r6, [lr, r0, lsl #2]
	cmp	r0, #226
	it	lo
	movwlo	r7, #1588
	add	r7, r9
	add.w	r7, r7, r0, lsl #2
	and	r2, r2, #-2147483648
	and.w	r4, r6, r12
	ldr.w	r7, [r7, #2352]
	add	r2, r4
	eor.w	r2, r7, r2, lsr #1
	lsls	r7, r6, #31
	it	ne
	eorne.w	r2, r2, r11
	ldr	r3, [sp, #64]                   @ 4-byte Reload
	str.w	r2, [r1, #2352]
	and	r2, r6, #-2147483648
	ldr.w	r6, [r3, r0, lsl #2]
	mov	r4, r8
	add.w	r5, lr, r0, lsl #2
	cmp	r0, #225
	it	lo
	movwlo	r4, #1588
	ldr	r5, [r5, r4]
	and.w	r4, r6, r12
	add	r2, r4
	eor.w	r2, r5, r2, lsr #1
	lsls	r5, r6, #31
	it	ne
	eorne.w	r2, r2, r11
	str.w	r2, [lr, r0, lsl #2]
	ldr.w	lr, [sp, #68]                   @ 4-byte Reload
	mov	r4, r8
	ldr.w	r5, [lr, r0, lsl #2]
	add.w	r7, r3, r0, lsl #2
	cmp	r0, #224
	it	lo
	movwlo	r4, #1588
	and	r2, r6, #-2147483648
	ldr	r7, [r7, r4]
	and.w	r4, r5, r12
	add	r2, r4
	eor.w	r2, r7, r2, lsr #1
	lsls	r7, r5, #31
	it	ne
	eorne.w	r2, r2, r11
	ldr.w	r7, [r1, #2368]
	add.w	r6, lr, r0, lsl #2
	mov	r4, r8
	str.w	r2, [r3, r0, lsl #2]
	and	r2, r5, #-2147483648
	and.w	r5, r7, r12
	cmp	r0, #223
	it	lo
	movwlo	r4, #1588
	ldr	r6, [r6, r4]
	add	r2, r5
	eor.w	r2, r6, r2, lsr #1
	lsls	r6, r7, #31
	it	ne
	eorne.w	r2, r2, r11
	str.w	r2, [lr, r0, lsl #2]
	ldr	r2, [sp, #76]                   @ 4-byte Reload
	mov.w	lr, #4864
	add.w	r2, r2, r0, lsl #2
	mov	r4, r8
	ldr.w	r6, [r2, lr]
	cmp	r0, #222
	it	lo
	movwlo	r4, #1588
	add	r4, r9
	add.w	r4, r4, r0, lsl #2
	and	r7, r7, #-2147483648
	and.w	r5, r6, r12
	ldr.w	r4, [r4, #2368]
	add	r7, r5
	eor.w	r7, r4, r7, lsr #1
	lsls	r5, r6, #31
	it	ne
	eorne.w	r7, r7, r11
	ldr	r3, [sp, #80]                   @ 4-byte Reload
	str.w	r7, [r1, #2368]
	and	r4, r6, #-2147483648
	mov	r6, r12
	ldr.w	r12, [r3, #2376]
	mov	r7, r8
	add.w	r1, r2, #4864
	cmp	r0, #221
	it	lo
	movwlo	r7, #1588
	ldr	r1, [r1, r7]
	and.w	r7, r12, r6
	add	r7, r4
	eor.w	r1, r1, r7, lsr #1
	lsls.w	r7, r12, #31
	ldr	r7, [sp, #72]                   @ 4-byte Reload
	it	ne
	eorne.w	r1, r1, r11
	str.w	r1, [r2, lr]
	adds	r0, #7
	movw	r1, #623
	cmp	r0, r1
	add.w	r10, r10, #28
	bne.w	.LBB28_44
@ %bb.45:                               @   in Loop: Header=BB28_42 Depth=3
	ldr.w	r0, [r7, #2492]
	ldr	r1, [r7]
	and	r0, r0, #-2147483648
	and.w	r2, r1, r6
	ldr.w	r3, [r7, #1584]
	add	r0, r2
	eor.w	r0, r3, r0, lsr #1
	lsls	r1, r1, #31
	it	ne
	eorne.w	r0, r0, r11
	ldrd	r2, r5, [sp, #52]               @ 8-byte Folded Reload
	str.w	r0, [r7, #2492]
	movs	r0, #0
	mov.w	r9, #-2147483648
	b	.LBB28_41
	.p2align	2
.LBB28_46:                              @   in Loop: Header=BB28_7 Depth=2
	ldr	r0, [sp, #24]                   @ 4-byte Reload
	cmp.w	r1, #1073741824
	ldr	r1, [sp, #20]                   @ 4-byte Reload
	strd	r5, r2, [r0]
	movw	r0, :lower16:.L.str.135
	movw	r2, :lower16:.L.str.42
	movt	r0, :upper16:.L.str.135
	ldr	r1, [r1, #4]
	movt	r2, :upper16:.L.str.42
	it	lo
	movlo	r0, r2
	ldr	r2, [sp, #76]                   @ 4-byte Reload
	rsb	r1, r1, r1, lsl #5
	add.w	r1, r2, r1, lsl #4
	movw	r2, #7304
	str	r0, [r1, r2]
	b	.LBB28_6
	.p2align	2
.LBB28_47:                              @   in Loop: Header=BB28_7 Depth=2
	ldr	r0, [r3, #4]
	ldr	r2, [sp, #76]                   @ 4-byte Reload
	ldr	r1, [r3, #12]
	rsb	r0, r0, r0, lsl #5
	add.w	r0, r2, r0, lsl #4
	movw	r2, #7300
	str	r1, [r0, r2]
	b	.LBB28_6
	.p2align	2
.LBB28_48:                              @   in Loop: Header=BB28_7 Depth=2
	cmp	r1, #6
	bne.w	.LBB28_134
@ %bb.49:                               @   in Loop: Header=BB28_7 Depth=2
	movs	r1, #7
	b	.LBB28_100
	.p2align	2
.LBB28_50:                              @   in Loop: Header=BB28_7 Depth=2
	cmp	r1, #0
	beq.w	.LBB28_99
@ %bb.51:                               @   in Loop: Header=BB28_7 Depth=2
	cmp	r1, #3
	beq.w	.LBB28_98
@ %bb.52:                               @   in Loop: Header=BB28_7 Depth=2
	cmp	r1, #1
	bne.w	.LBB28_134
@ %bb.53:                               @   in Loop: Header=BB28_7 Depth=2
	movs	r1, #9
	b	.LBB28_100
	.p2align	2
.LBB28_54:                              @   in Loop: Header=BB28_7 Depth=2
	cmp	r0, #6
	bne.w	.LBB28_134
@ %bb.55:                               @   in Loop: Header=BB28_7 Depth=2
	movs	r0, #7
	b	.LBB28_104
	.p2align	2
.LBB28_56:                              @   in Loop: Header=BB28_7 Depth=2
	cmp	r1, #0
	bne.w	.LBB28_134
@ %bb.57:                               @   in Loop: Header=BB28_7 Depth=2
	movs	r1, #5
	b	.LBB28_100
	.p2align	2
.LBB28_58:                              @   in Loop: Header=BB28_7 Depth=2
	cmp	r1, #6
	bne.w	.LBB28_134
@ %bb.59:                               @   in Loop: Header=BB28_7 Depth=2
	movs	r1, #7
	b	.LBB28_110
	.p2align	2
.LBB28_60:                              @   in Loop: Header=BB28_7 Depth=2
	cmp	r1, #2
	bhs.w	.LBB28_134
@ %bb.61:                               @   in Loop: Header=BB28_7 Depth=2
	orr	r1, r1, #12
	b	.LBB28_100
	.p2align	2
.LBB28_62:                              @   in Loop: Header=BB28_7 Depth=2
	cmp	r1, #0
	bne.w	.LBB28_134
@ %bb.63:                               @   in Loop: Header=BB28_7 Depth=2
	movs	r1, #6
	b	.LBB28_100
	.p2align	2
.LBB28_64:                              @   in Loop: Header=BB28_7 Depth=2
	subs	r2, r1, #1
	cmp	r2, #4
	blo.w	.LBB28_100
	b	.LBB28_134
	.p2align	2
.LBB28_65:                              @   in Loop: Header=BB28_7 Depth=2
	cmp	r0, #0
	beq.w	.LBB28_103
@ %bb.66:                               @   in Loop: Header=BB28_7 Depth=2
	cmp	r0, #3
	beq.w	.LBB28_101
@ %bb.67:                               @   in Loop: Header=BB28_7 Depth=2
	cmp	r0, #1
	bne.w	.LBB28_134
@ %bb.68:                               @   in Loop: Header=BB28_7 Depth=2
	movs	r0, #9
	b	.LBB28_104
	.p2align	2
.LBB28_69:                              @   in Loop: Header=BB28_7 Depth=2
	cmp	r1, #0
	beq.w	.LBB28_109
@ %bb.70:                               @   in Loop: Header=BB28_7 Depth=2
	cmp	r1, #3
	beq	.LBB28_102
@ %bb.71:                               @   in Loop: Header=BB28_7 Depth=2
	cmp	r1, #1
	bne.w	.LBB28_134
@ %bb.72:                               @   in Loop: Header=BB28_7 Depth=2
	movs	r1, #9
	b	.LBB28_110
	.p2align	2
.LBB28_73:                              @   in Loop: Header=BB28_7 Depth=2
	cmp	r0, #0
	bne.w	.LBB28_134
@ %bb.74:                               @   in Loop: Header=BB28_7 Depth=2
	movs	r0, #5
	b	.LBB28_104
	.p2align	2
.LBB28_75:                              @   in Loop: Header=BB28_7 Depth=2
	cmp	r0, #2
	bhs.w	.LBB28_134
@ %bb.76:                               @   in Loop: Header=BB28_7 Depth=2
	orr	r0, r0, #12
	b	.LBB28_104
	.p2align	2
.LBB28_77:                              @   in Loop: Header=BB28_7 Depth=2
	cmp	r0, #0
	bne.w	.LBB28_134
@ %bb.78:                               @   in Loop: Header=BB28_7 Depth=2
	movs	r0, #6
	b	.LBB28_104
	.p2align	2
.LBB28_79:                              @   in Loop: Header=BB28_7 Depth=2
	cmp	r1, #0
	bne.w	.LBB28_134
@ %bb.80:                               @   in Loop: Header=BB28_7 Depth=2
	movs	r1, #5
	b	.LBB28_110
	.p2align	2
.LBB28_81:                              @   in Loop: Header=BB28_7 Depth=2
	subs	r1, r0, #1
	cmp	r1, #4
	blo	.LBB28_104
	b	.LBB28_134
	.p2align	2
.LBB28_82:                              @   in Loop: Header=BB28_7 Depth=2
	cmp	r1, #2
	bhs.w	.LBB28_134
@ %bb.83:                               @   in Loop: Header=BB28_7 Depth=2
	orr	r1, r1, #12
	b	.LBB28_110
	.p2align	2
.LBB28_84:                              @   in Loop: Header=BB28_7 Depth=2
	cmp	r1, #0
	bne.w	.LBB28_134
@ %bb.85:                               @   in Loop: Header=BB28_7 Depth=2
	movs	r1, #6
	b	.LBB28_110
	.p2align	2
.LBB28_86:                              @   in Loop: Header=BB28_7 Depth=2
	subs	r2, r1, #1
	cmp	r2, #4
	blo	.LBB28_110
	b	.LBB28_134
	.p2align	2
.LBB28_87:                              @   in Loop: Header=BB28_7 Depth=2
	cmp	r1, #1
	bne.w	.LBB28_134
@ %bb.88:                               @   in Loop: Header=BB28_7 Depth=2
	movs	r1, #11
	b	.LBB28_100
	.p2align	2
.LBB28_89:                              @   in Loop: Header=BB28_7 Depth=2
	cmp	r0, #1
	bne.w	.LBB28_134
@ %bb.90:                               @   in Loop: Header=BB28_7 Depth=2
	movs	r0, #11
	b	.LBB28_104
	.p2align	2
.LBB28_91:                              @   in Loop: Header=BB28_7 Depth=2
	cmp	r1, #1
	bne.w	.LBB28_134
@ %bb.92:                               @   in Loop: Header=BB28_7 Depth=2
	movs	r1, #11
	b	.LBB28_110
	.p2align	2
.LBB28_93:                              @   in Loop: Header=BB28_7 Depth=2
	mov	lr, r0
	b	.LBB28_97
	.p2align	2
.LBB28_94:                              @   in Loop: Header=BB28_7 Depth=2
	orr	r0, r3, #1
	add.w	lr, r1, r0, lsl #2
	adds	r3, #1
	b	.LBB28_97
	.p2align	2
.LBB28_95:                              @   in Loop: Header=BB28_7 Depth=2
	orr	r0, r3, #2
	add.w	lr, r1, r0, lsl #2
	adds	r3, #2
	b	.LBB28_97
	.p2align	2
.LBB28_96:                              @   in Loop: Header=BB28_7 Depth=2
	adds	r3, #3
.LBB28_97:                              @   in Loop: Header=BB28_7 Depth=2
	mvns	r0, r3
	add	r0, r4
	add.w	r1, lr, #4
	lsls	r2, r0, #2
	mov	r0, lr
	bl	__aeabi_memmove4
	ldr	r1, [sp, #72]                   @ 4-byte Reload
	ldr.w	r0, [r1, #2528]
	subs	r0, #1
	str.w	r0, [r1, #2528]
	b	.LBB28_6
	.p2align	2
.LBB28_98:                              @   in Loop: Header=BB28_7 Depth=2
	movs	r1, #10
	b	.LBB28_100
	.p2align	2
.LBB28_99:                              @   in Loop: Header=BB28_7 Depth=2
	movs	r1, #8
.LBB28_100:                             @   in Loop: Header=BB28_7 Depth=2
	add.w	r1, r1, r1, lsl #2
	add.w	r1, r7, r1, lsl #2
	movw	r2, #8040
	str	r0, [r1, r2]
	b	.LBB28_6
	.p2align	2
.LBB28_101:                             @   in Loop: Header=BB28_7 Depth=2
	movs	r0, #10
	b	.LBB28_104
	.p2align	2
.LBB28_102:                             @   in Loop: Header=BB28_7 Depth=2
	movs	r1, #10
	b	.LBB28_110
	.p2align	2
.LBB28_103:                             @   in Loop: Header=BB28_7 Depth=2
	movs	r0, #8
.LBB28_104:                             @   in Loop: Header=BB28_7 Depth=2
	ldr	r1, [r3, #12]
	ldr	r2, [sp, #12]                   @ 4-byte Reload
	add.w	r0, r0, r0, lsl #2
	cmp	r1, #0
	add.w	r0, r2, r0, lsl #2
	bmi	.LBB28_106
@ %bb.105:                              @   in Loop: Header=BB28_7 Depth=2
	ldr	r3, [sp, #4]                    @ 4-byte Reload
	add.w	r1, r1, r1, lsl #2
	add.w	r2, r3, r1, lsl #2
	ldr.w	r1, [r3, r1, lsl #2]
	strd	r2, r1, [r0]
	b	.LBB28_6
	.p2align	2
.LBB28_106:                             @   in Loop: Header=BB28_7 Depth=2
	adds	r1, #1
	beq	.LBB28_108
@ %bb.107:                              @   in Loop: Header=BB28_7 Depth=2
	movw	r1, :lower16:credits_private_credits_apply_event.empty
	movw	r2, :lower16:.L.str.112
	movt	r1, :upper16:credits_private_credits_apply_event.empty
	movt	r2, :upper16:.L.str.112
	strd	r1, r2, [r0]
	b	.LBB28_6
	.p2align	2
.LBB28_108:                             @   in Loop: Header=BB28_7 Depth=2
	ldr	r1, [r3, #16]
	movs	r2, #0
	strd	r2, r1, [r0]
	b	.LBB28_6
	.p2align	2
.LBB28_109:                             @   in Loop: Header=BB28_7 Depth=2
	movs	r1, #8
.LBB28_110:                             @   in Loop: Header=BB28_7 Depth=2
	add.w	r1, r1, r1, lsl #2
	add.w	r1, r7, r1, lsl #2
	movw	r2, #8036
	str	r0, [r1, r2]
	b	.LBB28_6
	.p2align	2
.LBB28_111:
	ldr	r2, [sp, #32]                   @ 4-byte Reload
	ldr.w	r0, [r2, #160]
	cmp	r0, #3
	bne	.LBB28_128
@ %bb.112:
	movw	r0, #1860
	cmp	r7, r0
	beq	.LBB28_114
@ %bb.113:
	movw	r0, #1849
	cmp	r7, r0
	bne	.LBB28_128
.LBB28_114:
	ldr.w	r3, [r2, #180]
	cbz	r3, .LBB28_116
@ %bb.115:
	ldr.w	r0, [r2, #184]
	mov	r1, r7
	movs	r2, #0
	blx	r3
	ldr	r2, [sp, #32]                   @ 4-byte Reload
.LBB28_116:
	ldr.w	r0, [r2, #176]
	movw	r1, #1849
	adds	r0, #1
	str.w	r0, [r2, #176]
	ldr	r0, [sp, #72]                   @ 4-byte Reload
	cmp	r7, r1
	bne	.LBB28_118
@ %bb.117:
	ldr	r0, [sp, #28]                   @ 4-byte Reload
	movs	r1, #13
	movs	r2, #0
	movs	r3, #1
	add	sp, #84
	pop.w	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	b	credits_private_scheduler_start
	.p2align	2
.LBB28_118:
	ldr.w	r2, [r0, #2528]
	cmp	r2, #1
	blt	.LBB28_128
@ %bb.119:
	ldr	r0, [sp, #72]                   @ 4-byte Reload
	rsbs	r7, r2, #0
	ldr.w	r1, [r0, #2524]
	sub.w	r12, r2, #1
	add.w	r0, r1, #12
	movs	r3, #0
.LBB28_120:                             @ =>This Inner Loop Header: Depth=1
	ldr	r5, [r0, #-12]
	cmp	r5, #13
	add.w	r5, r1, r3, lsl #2
	beq	.LBB28_129
@ %bb.121:                              @   in Loop: Header=BB28_120 Depth=1
	cmp	r12, r3
	beq	.LBB28_128
@ %bb.122:                              @   in Loop: Header=BB28_120 Depth=1
	ldr	r4, [r5, #4]
	cmp	r4, #13
	beq	.LBB28_130
@ %bb.123:                              @   in Loop: Header=BB28_120 Depth=1
	adds	r4, r7, r3
	adds	r6, r4, #2
	beq	.LBB28_128
@ %bb.124:                              @   in Loop: Header=BB28_120 Depth=1
	ldr	r6, [r5, #8]
	cmp	r6, #13
	beq	.LBB28_131
@ %bb.125:                              @   in Loop: Header=BB28_120 Depth=1
	adds	r6, r4, #3
	beq	.LBB28_128
@ %bb.126:                              @   in Loop: Header=BB28_120 Depth=1
	mov	r5, r0
	ldr	r6, [r5], #16
	cmp	r6, #13
	beq	.LBB28_132
@ %bb.127:                              @   in Loop: Header=BB28_120 Depth=1
	adds	r3, #4
	cmp	r2, r3
	mov	r0, r5
	bne	.LBB28_120
.LBB28_128:
	add	sp, #84
	pop.w	{r4, r5, r6, r7, r8, r9, r10, r11, pc}
	.p2align	2
.LBB28_129:
	mov	r0, r5
	b	.LBB28_133
	.p2align	2
.LBB28_130:
	orr	r0, r3, #1
	add.w	r0, r1, r0, lsl #2
	adds	r3, #1
	b	.LBB28_133
	.p2align	2
.LBB28_131:
	orr	r0, r3, #2
	add.w	r0, r1, r0, lsl #2
	adds	r3, #2
	b	.LBB28_133
	.p2align	2
.LBB28_132:
	adds	r3, #3
.LBB28_133:
	mvns	r3, r3
	add	r2, r3
	adds	r1, r0, #4
	lsls	r2, r2, #2
	bl	__aeabi_memmove4
	ldr	r1, [sp, #72]                   @ 4-byte Reload
	ldr.w	r0, [r1, #2528]
	subs	r0, #1
	str.w	r0, [r1, #2528]
	add	sp, #84
	pop.w	{r4, r5, r6, r7, r8, r9, r10, r11, pc}
	.p2align	2
.LBB28_134:
	movw	r0, :lower16:.L.str.34
	movt	r0, :upper16:.L.str.34
	bl	credits_private_credits_fail
.Lfunc_end28:
	.size	credits_private_credits_timeline, .Lfunc_end28-credits_private_credits_timeline
	.cantunwind
	.fnend
                                        @ -- End function
	.globl	credits_private_credits_jump    @ -- Begin function credits_private_credits_jump
	.p2align	1
	.prefalign	2, .Lfunc_end29, nop
	.type	credits_private_credits_jump,%function
	.code	16
	.thumb_func
credits_private_credits_jump:           @ @credits_private_credits_jump
	.fnstart
@ %bb.0:
	subs	r2, r1, #7
	cmn.w	r2, #7
	bls	.LBB29_4
@ %bb.1:
	movw	r2, #7376
	add	r0, r2
	ldr.w	r2, [r0, #2760]
	cmp	r2, #0
	itt	eq
	ldreq	r2, [r0]
	addseq.w	r2, r2, #1
	beq	.LBB29_3
@ %bb.2:
	movw	r0, :lower16:.L.str.36
	movt	r0, :upper16:.L.str.36
	bl	credits_private_credits_fail
	.p2align	2
.LBB29_3:
	movw	r2, :lower16:credits_private_fixed_player_init.amounts
	movt	r2, :upper16:credits_private_fixed_player_init.amounts
	str.w	r1, [r0, #2748]
	add.w	r1, r2, r1, lsl #2
	ldr	r1, [r1, #-4]
	subs	r1, #1
	str	r1, [r0]
	bx	lr
	.p2align	2
.LBB29_4:
	movw	r0, :lower16:.L.str.35
	movt	r0, :upper16:.L.str.35
	bl	credits_private_credits_fail
.Lfunc_end29:
	.size	credits_private_credits_jump, .Lfunc_end29-credits_private_credits_jump
	.cantunwind
	.fnend
                                        @ -- End function
	.globl	credits_private_credits_next    @ -- Begin function credits_private_credits_next
	.p2align	1
	.prefalign	2, .Lfunc_end30, nop
	.type	credits_private_credits_next,%function
	.code	16
	.thumb_func
credits_private_credits_next:           @ @credits_private_credits_next
	.fnstart
@ %bb.0:
	.save	{r4, lr}
	push	{r4, lr}
	mov	r4, r0
	movw	r0, #7352
	add	r0, r4
	bl	credits_private_scheduler_next
	movw	r0, #10136
	ldr	r1, [r4, r0]
	adds	r1, #1
	str	r1, [r4, r0]
	pop	{r4, pc}
.Lfunc_end30:
	.size	credits_private_credits_next, .Lfunc_end30-credits_private_credits_next
	.cantunwind
	.fnend
                                        @ -- End function
	.globl	credits_private_canvas_render   @ -- Begin function credits_private_canvas_render
	.p2align	1
	.prefalign	2, .Lfunc_end31, nop
	.type	credits_private_canvas_render,%function
	.code	16
	.thumb_func
credits_private_canvas_render:          @ @credits_private_canvas_render
	.fnstart
@ %bb.0:
	bx	lr
.Lfunc_end31:
	.size	credits_private_canvas_render, .Lfunc_end31-credits_private_canvas_render
	.cantunwind
	.fnend
                                        @ -- End function
	.globl	credits_private_credits_destroy @ -- Begin function credits_private_credits_destroy
	.p2align	1
	.prefalign	2, .Lfunc_end32, nop
	.type	credits_private_credits_destroy,%function
	.code	16
	.thumb_func
credits_private_credits_destroy:        @ @credits_private_credits_destroy
	.fnstart
@ %bb.0:
	.save	{r4, r5, r6, lr}
	push	{r4, r5, r6, lr}
	movw	r6, #9960
	mov	r4, r0
	adds	r5, r0, r6
	movw	r0, #7668
	add	r0, r4
	mov	r1, r4
	bl	credits_private_data_destroy
	movs	r1, #0
	ldr	r2, [r5, #8]
	ldr	r3, [r5, #24]
	str	r1, [r4, r6]
	ldr	r6, [r5, #40]
	add	r2, r3
	ldr.w	r12, [r4]
	add	r2, r6
	ldr.w	r0, [r5, #172]
	sub.w	r2, r2, r2, lsl #2
	add.w	r2, r12, r2, lsl #2
	subs	r0, r2, r0
	strd	r1, r1, [r5, #4]
	strd	r1, r1, [r5, #16]
	str	r1, [r5, #24]
	strd	r1, r1, [r5, #32]
	str	r1, [r5, #40]
	str	r0, [r4]
	strd	r1, r1, [r5, #168]
	pop	{r4, r5, r6, pc}
.Lfunc_end32:
	.size	credits_private_credits_destroy, .Lfunc_end32-credits_private_credits_destroy
	.cantunwind
	.fnend
                                        @ -- End function
	.globl	credits_private_canvas_destroy  @ -- Begin function credits_private_canvas_destroy
	.p2align	1
	.prefalign	2, .Lfunc_end33, nop
	.type	credits_private_canvas_destroy,%function
	.code	16
	.thumb_func
credits_private_canvas_destroy:         @ @credits_private_canvas_destroy
	.fnstart
@ %bb.0:
	bx	lr
.Lfunc_end33:
	.size	credits_private_canvas_destroy, .Lfunc_end33-credits_private_canvas_destroy
	.cantunwind
	.fnend
                                        @ -- End function
	.globl	credits_private_credits_history_destroy @ -- Begin function credits_private_credits_history_destroy
	.p2align	1
	.prefalign	2, .Lfunc_end34, nop
	.type	credits_private_credits_history_destroy,%function
	.code	16
	.thumb_func
credits_private_credits_history_destroy: @ @credits_private_credits_history_destroy
	.fnstart
@ %bb.0:
	.save	{r4, r5, r7, lr}
	push	{r4, r5, r7, lr}
	movw	r12, #9960
	add.w	r2, r0, r12
	ldr	r1, [r2, #8]
	ldr	r3, [r0]
	ldr.w	lr, [r2, #24]
	ldr	r5, [r2, #40]
	sub.w	r1, r1, r1, lsl #2
	add.w	r1, r3, r1, lsl #2
	sub.w	r4, lr, lr, lsl #2
	add.w	r1, r1, r4, lsl #2
	sub.w	r5, r5, r5, lsl #2
	movs	r3, #0
	add.w	r1, r1, r5, lsl #2
	str.w	r3, [r0, r12]
	strd	r3, r3, [r2, #4]
	strd	r3, r3, [r2, #16]
	str	r3, [r2, #24]
	strd	r3, r3, [r2, #32]
	str	r3, [r2, #40]
	str	r1, [r0]
	pop	{r4, r5, r7, pc}
.Lfunc_end34:
	.size	credits_private_credits_history_destroy, .Lfunc_end34-credits_private_credits_history_destroy
	.cantunwind
	.fnend
                                        @ -- End function
	.globl	credits_private_credits_type_characters @ -- Begin function credits_private_credits_type_characters
	.p2align	1
	.prefalign	2, .Lfunc_end35, nop
	.type	credits_private_credits_type_characters,%function
	.code	16
	.thumb_func
credits_private_credits_type_characters: @ @credits_private_credits_type_characters
	.fnstart
@ %bb.0:
	.save	{r7, lr}
	push	{r7, lr}
	ldrd	r12, lr, [sp, #8]
	strd	r12, lr, [sp, #8]
	pop.w	{r7, lr}
	b	credits_private_credits60_characters
.Lfunc_end35:
	.size	credits_private_credits_type_characters, .Lfunc_end35-credits_private_credits_type_characters
	.cantunwind
	.fnend
                                        @ -- End function
	.globl	credits_private_credits60_characters @ -- Begin function credits_private_credits60_characters
	.p2align	1
	.prefalign	2, .Lfunc_end36, nop
	.type	credits_private_credits60_characters,%function
	.code	16
	.thumb_func
credits_private_credits60_characters:   @ @credits_private_credits60_characters
	.fnstart
@ %bb.0:
	.save	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	push.w	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	.pad	#100
	sub	sp, #100
	ldr	r7, [r1, #4]
	cmp	r7, #0
	beq.w	.LBB36_29
@ %bb.1:
	mov	r6, r0
	ldrb	r0, [r7]
	cmp	r0, #0
	beq.w	.LBB36_29
@ %bb.2:
	movw	r0, #10128
	add	r0, r6
	str	r0, [sp, #68]                   @ 4-byte Spill
	ldr	r0, [r0, #24]
	mov	r5, r1
	movw	r1, :lower16:.L.str.91
	mov	r8, r2
	ldr.w	r10, [sp, #140]
	cmp	r0, #6
	mov.w	r4, #12
	movt	r1, :upper16:.L.str.91
	mov	r0, r7
	mov.w	r2, #9
	it	eq
	moveq	r4, #20
	mov	r9, r3
	sub.w	r11, r4, r3
	bl	strncmp
	cmp	r0, #0
	beq	.LBB36_16
@ %bb.3:
	ldr.w	r10, [r5, #8]
	mov	r0, r7
	bl	strlen
	cmp	r10, r0
	bge.w	.LBB36_28
@ %bb.4:
	cmp.w	r8, #59
	str	r5, [sp, #44]                   @ 4-byte Spill
	bgt.w	.LBB36_96
@ %bb.5:
	mov	r1, r8
	orrs.w	r0, r9, r8
	bmi.w	.LBB36_96
@ %bb.6:
	cmp.w	r11, #0
	ble.w	.LBB36_96
@ %bb.7:
	rsb.w	r0, r1, #60
	str	r0, [sp, #52]                   @ 4-byte Spill
	ldr	r0, [sp, #140]
	strd	r11, r9, [sp, #56]              @ 8-byte Folded Spill
	movw	r9, #32
	add.w	r11, r6, #24
	cmp	r0, #0
	movt	r9, #3175
	str	r6, [sp, #64]                   @ 4-byte Spill
	beq.w	.LBB36_30
@ %bb.8:
	ldr.w	r12, [sp, #60]                  @ 4-byte Reload
	rsbs	r0, r1, #0
	ldr	r2, [sp, #64]                   @ 4-byte Reload
	and	r6, r0, #3
	rsb	r0, r12, r12, lsl #4
	add.w	r0, r2, r0, lsl #4
	add.w	r10, r1, #1
	sub.w	r5, r1, #57
	adds	r0, #8
	b	.LBB36_10
	.p2align	2
.LBB36_9:                               @   in Loop: Header=BB36_10 Depth=1
	add.w	r12, r12, #1
	cmp	r12, r4
	add.w	r0, r0, #240
	bge	.LBB36_30
.LBB36_10:                              @ =>This Loop Header: Depth=1
                                        @     Child Loop BB36_15 Depth 2
	mov	r2, r1
	cbz	r6, .LBB36_13
@ %bb.11:                               @   in Loop: Header=BB36_10 Depth=1
	rsb	r2, r12, r12, lsl #4
	add.w	r3, r11, r2, lsl #4
	cmp	r6, #1
	mov	r2, r10
	str.w	r9, [r3, r1, lsl #2]
	beq	.LBB36_13
@ %bb.12:                               @   in Loop: Header=BB36_10 Depth=1
	adds	r2, r1, #2
	str.w	r9, [r3, r10, lsl #2]
	cmp	r6, #2
	ittt	ne
	addne	r2, r1, #2
	strne.w	r9, [r3, r2, lsl #2]
	addne	r2, r1, #3
.LBB36_13:                              @   in Loop: Header=BB36_10 Depth=1
	cmp	r5, #3
	blo	.LBB36_9
@ %bb.14:                               @   in Loop: Header=BB36_10 Depth=1
	add.w	r8, r0, r2, lsl #2
	sub.w	lr, r2, #60
	.p2align	2
.LBB36_15:                              @   Parent Loop BB36_10 Depth=1
                                        @ =>  This Inner Loop Header: Depth=2
	str	r9, [r8, #16]!
	adds.w	lr, lr, #4
	strd	r9, r9, [r8, #4]
	str.w	r9, [r8, #12]
	bne	.LBB36_15
	b	.LBB36_9
	.p2align	2
.LBB36_16:
	cmp.w	r10, #0
	beq	.LBB36_29
@ %bb.17:
	mov	r1, r8
	cmp.w	r8, #59
	bgt.w	.LBB36_96
@ %bb.18:
	mov	r0, r9
	orrs.w	r2, r9, r1
	bmi.w	.LBB36_96
@ %bb.19:
	cmp.w	r11, #1
	blt.w	.LBB36_96
@ %bb.20:
	rsbs	r2, r1, #0
	and	r7, r2, #3
	rsb	r2, r0, r0, lsl #4
	movs	r3, #32
	add.w	r2, r6, r2, lsl #4
	add.w	r10, r6, #24
	movt	r3, #3175
	add.w	r8, r1, #1
	add.w	lr, r1, #2
	add.w	r12, r1, #3
	sub.w	r9, r1, #57
	add.w	r6, r2, #8
	b	.LBB36_22
	.p2align	2
.LBB36_21:                              @   in Loop: Header=BB36_22 Depth=1
	adds	r0, #1
	cmp	r0, r4
	add.w	r6, r6, #240
	bge	.LBB36_29
.LBB36_22:                              @ =>This Loop Header: Depth=1
                                        @     Child Loop BB36_27 Depth 2
	mov	r2, r1
	cbz	r7, .LBB36_25
@ %bb.23:                               @   in Loop: Header=BB36_22 Depth=1
	rsb	r2, r0, r0, lsl #4
	add.w	r5, r10, r2, lsl #4
	cmp	r7, #1
	mov	r2, r8
	str.w	r3, [r5, r1, lsl #2]
	beq	.LBB36_25
@ %bb.24:                               @   in Loop: Header=BB36_22 Depth=1
	mov	r2, lr
	str.w	r3, [r5, r8, lsl #2]
	cmp	r7, #2
	itt	ne
	strne.w	r3, [r5, lr, lsl #2]
	movne	r2, r12
.LBB36_25:                              @   in Loop: Header=BB36_22 Depth=1
	cmp.w	r9, #3
	blo	.LBB36_21
@ %bb.26:                               @   in Loop: Header=BB36_22 Depth=1
	add.w	r5, r6, r2, lsl #2
	subs	r2, #60
	.p2align	2
.LBB36_27:                              @   Parent Loop BB36_22 Depth=1
                                        @ =>  This Inner Loop Header: Depth=2
	str	r3, [r5, #16]!
	adds	r2, #4
	strd	r3, r3, [r5, #4]
	str	r3, [r5, #12]
	bne	.LBB36_27
	b	.LBB36_21
	.p2align	2
.LBB36_28:
	add.w	r0, r10, #1
	str	r0, [r5, #8]
.LBB36_29:
	add	sp, #100
	pop.w	{r4, r5, r6, r7, r8, r9, r10, r11, pc}
	.p2align	2
.LBB36_30:
	ldr	r0, [sp, #60]                   @ 4-byte Reload
	strd	r11, r1, [sp, #72]
	str	r0, [sp, #80]
	ldr	r0, [sp, #52]                   @ 4-byte Reload
	str	r0, [sp, #84]
	ldr	r0, [sp, #56]                   @ 4-byte Reload
	str	r0, [sp, #88]
	movs	r0, #0
	strd	r0, r0, [sp, #92]
	mov	r0, r7
	bl	strlen
	ldr.w	r10, [sp, #44]                  @ 4-byte Reload
	ldr	r6, [sp, #68]                   @ 4-byte Reload
	str	r0, [sp, #56]                   @ 4-byte Spill
	movs	r4, #0
	movs	r0, #0
	movs	r5, #0
	str	r0, [sp, #52]                   @ 4-byte Spill
	b	.LBB36_34
	.p2align	2
.LBB36_31:                              @   in Loop: Header=BB36_34 Depth=1
	mov.w	r2, #4800
	ldr	r0, [r6, r2]
	ldr.w	r8, [sp, #32]                   @ 4-byte Reload
	adds	r0, #1
	str	r0, [r6, r2]
	ldr	r6, [sp, #68]                   @ 4-byte Reload
	str.w	lr, [sp, #92]
.LBB36_32:                              @   in Loop: Header=BB36_34 Depth=1
	ldr	r2, [sp, #136]
	movs	r3, #0
	add	r0, sp, #72
	cmp	r8, r12
	it	lt
	movlt	r3, #1
	bl	credits_private_canvas60_line
.LBB36_33:                              @   in Loop: Header=BB36_34 Depth=1
	add.w	r7, r11, #1
	cmp.w	r11, #0
	add.w	r4, r4, #1
	beq.w	.LBB36_93
.LBB36_34:                              @ =>This Loop Header: Depth=1
                                        @     Child Loop BB36_51 Depth 2
                                        @     Child Loop BB36_77 Depth 2
                                        @     Child Loop BB36_89 Depth 2
	mov	r0, r7
	movs	r1, #10
	bl	strchr
	mov	r11, r0
	cbz	r0, .LBB36_36
@ %bb.35:                               @   in Loop: Header=BB36_34 Depth=1
	sub.w	r0, r11, r7
	ldr.w	r1, [r10, #8]
	subs.w	r8, r1, r5
	bpl	.LBB36_37
	b	.LBB36_33
	.p2align	2
.LBB36_36:                              @   in Loop: Header=BB36_34 Depth=1
	mov	r0, r7
	bl	strlen
	ldr.w	r1, [r10, #8]
	subs.w	r8, r1, r5
	bmi	.LBB36_33
.LBB36_37:                              @   in Loop: Header=BB36_34 Depth=1
	ldr	r1, [sp, #56]                   @ 4-byte Reload
	cmp	r8, r1
	bge	.LBB36_33
@ %bb.38:                               @   in Loop: Header=BB36_34 Depth=1
	mov	r2, r0
	cmp	r8, r0
	it	lt
	movlt	r2, r8
	ldr	r1, [r6, #4]
	mov	r3, r6
	adds	r6, r2, #2
	cmp	r6, r1
	bls	.LBB36_46
@ %bb.39:                               @   in Loop: Header=BB36_34 Depth=1
	cmp	r1, #0
	str	r0, [sp, #60]                   @ 4-byte Spill
	bne.w	.LBB36_95
@ %bb.40:                               @   in Loop: Header=BB36_34 Depth=1
	ldr	r1, [sp, #68]                   @ 4-byte Reload
	ldr	r1, [r1]
	cmp	r1, #0
	bne.w	.LBB36_95
@ %bb.41:                               @   in Loop: Header=BB36_34 Depth=1
	ldr	r3, [sp, #64]                   @ 4-byte Reload
	ldr	r1, [r3, #12]
	cmp	r1, #0
	beq.w	.LBB36_94
@ %bb.42:                               @   in Loop: Header=BB36_34 Depth=1
	mov	r0, r11
	mov	r11, r5
	ldrd	r5, r3, [r3, #16]
	adds	r3, #3
	bic	r3, r3, #3
	subs	r5, r5, r3
	blo.w	.LBB36_94
@ %bb.43:                               @   in Loop: Header=BB36_34 Depth=1
	add.w	r6, r2, r6, lsr #1
	adds	r6, #34
	cmp	r6, r5
	bhi.w	.LBB36_94
@ %bb.44:                               @   in Loop: Header=BB36_34 Depth=1
	mov	lr, r4
	ldr	r4, [sp, #64]                   @ 4-byte Reload
	mov	r10, r8
	ldrd	r4, r12, [r4]
	ldr.w	r8, [sp, #64]                   @ 4-byte Reload
	adds	r5, r3, r6
	str.w	r5, [r8, #20]
	adds	r5, r4, r6
	ldr	r4, [sp, #64]                   @ 4-byte Reload
	cmp	r5, r12
	str	r5, [r4]
	it	hi
	strhi	r5, [r4, #4]
	ldr	r5, [r4, #8]
	add	r1, r3
	adds	r3, r5, #1
	str	r3, [r4, #8]
	ldr	r3, [sp, #68]                   @ 4-byte Reload
	mov	r5, r11
	mov	r11, r0
	mov	r8, r10
	ldr.w	r10, [sp, #44]                  @ 4-byte Reload
	ldr	r0, [sp, #60]                   @ 4-byte Reload
	mov	r4, lr
	strd	r1, r6, [r3]
	cmp	r2, #1
	bge	.LBB36_47
.LBB36_45:                              @   in Loop: Header=BB36_34 Depth=1
	movs	r2, #0
	b	.LBB36_68
	.p2align	2
.LBB36_46:                              @   in Loop: Header=BB36_34 Depth=1
	ldr	r1, [r3]
	cmp	r2, #1
	blt	.LBB36_45
.LBB36_47:                              @   in Loop: Header=BB36_34 Depth=1
	cmp	r2, #4
	and	r12, r2, #3
	bhs	.LBB36_49
@ %bb.48:                               @   in Loop: Header=BB36_34 Depth=1
	movs	r6, #0
	movs	r2, #0
	b	.LBB36_60
	.p2align	2
.LBB36_49:                              @   in Loop: Header=BB36_34 Depth=1
	movw	r3, #65532
	movt	r3, #32767
	str	r5, [sp, #48]                   @ 4-byte Spill
	mov	lr, r4
	and.w	r5, r2, r3
	movs	r6, #0
	movs	r2, #0
	b	.LBB36_51
	.p2align	2
.LBB36_50:                              @   in Loop: Header=BB36_51 Depth=2
	adds	r6, #4
	cmp	r5, r6
	beq	.LBB36_59
.LBB36_51:                              @   Parent Loop BB36_34 Depth=1
                                        @ =>  This Inner Loop Header: Depth=2
	ldrb	r4, [r7, r6]
	cmp	r4, #64
	beq	.LBB36_53
@ %bb.52:                               @   in Loop: Header=BB36_51 Depth=2
	cmp	r4, #126
	itt	ne
	strbne	r4, [r1, r2]
	addne	r2, #1
.LBB36_53:                              @   in Loop: Header=BB36_51 Depth=2
	adds	r4, r7, r6
	ldrb	r3, [r4, #1]
	cmp	r3, #64
	beq	.LBB36_55
@ %bb.54:                               @   in Loop: Header=BB36_51 Depth=2
	cmp	r3, #126
	itt	ne
	strbne	r3, [r1, r2]
	addne	r2, #1
.LBB36_55:                              @   in Loop: Header=BB36_51 Depth=2
	ldrb	r3, [r4, #2]
	cmp	r3, #64
	beq	.LBB36_57
@ %bb.56:                               @   in Loop: Header=BB36_51 Depth=2
	cmp	r3, #126
	itt	ne
	strbne	r3, [r1, r2]
	addne	r2, #1
.LBB36_57:                              @   in Loop: Header=BB36_51 Depth=2
	ldrb	r3, [r4, #3]
	cmp	r3, #64
	beq	.LBB36_50
@ %bb.58:                               @   in Loop: Header=BB36_51 Depth=2
	cmp	r3, #126
	itt	ne
	strbne	r3, [r1, r2]
	addne	r2, #1
	b	.LBB36_50
	.p2align	2
.LBB36_59:                              @   in Loop: Header=BB36_34 Depth=1
	ldr	r5, [sp, #48]                   @ 4-byte Reload
	cmp.w	r12, #0
	mov	r4, lr
	beq	.LBB36_68
.LBB36_60:                              @   in Loop: Header=BB36_34 Depth=1
	ldrb	r3, [r7, r6]
	cmp	r3, #64
	beq	.LBB36_62
@ %bb.61:                               @   in Loop: Header=BB36_34 Depth=1
	cmp	r3, #126
	itt	ne
	strbne	r3, [r1, r2]
	addne	r2, #1
.LBB36_62:                              @   in Loop: Header=BB36_34 Depth=1
	cmp.w	r12, #1
	beq	.LBB36_68
@ %bb.63:                               @   in Loop: Header=BB36_34 Depth=1
	add	r6, r7
	ldrb	r3, [r6, #1]
	cmp	r3, #64
	beq	.LBB36_65
@ %bb.64:                               @   in Loop: Header=BB36_34 Depth=1
	cmp	r3, #126
	itt	ne
	strbne	r3, [r1, r2]
	addne	r2, #1
.LBB36_65:                              @   in Loop: Header=BB36_34 Depth=1
	cmp.w	r12, #2
	beq	.LBB36_68
@ %bb.66:                               @   in Loop: Header=BB36_34 Depth=1
	ldrb	r3, [r6, #2]
	cmp	r3, #64
	beq	.LBB36_68
@ %bb.67:                               @   in Loop: Header=BB36_34 Depth=1
	cmp	r3, #126
	itt	ne
	strbne	r3, [r1, r2]
	addne	r2, #1
	.p2align	2
.LBB36_68:                              @   in Loop: Header=BB36_34 Depth=1
	sub.w	r12, r0, #1
	cmp	r8, r12
	ittt	lt
	movlt	r3, #95
	strblt	r3, [r1, r2]
	addlt	r2, #1
	ldr	r6, [sp, #68]                   @ 4-byte Reload
	cmp	r8, r0
	mov.w	r3, #0
	strb	r3, [r1, r2]
	bge	.LBB36_70
@ %bb.69:                               @   in Loop: Header=BB36_34 Depth=1
	ldrb.w	r2, [r7, r8]
	cmp	r2, #64
	ldr	r2, [sp, #52]                   @ 4-byte Reload
	it	eq
	addeq	r2, #3
	str	r2, [sp, #52]                   @ 4-byte Spill
.LBB36_70:                              @   in Loop: Header=BB36_34 Depth=1
	ldr	r2, [sp, #140]
	add	r5, r0
	cmp	r2, #0
	beq.w	.LBB36_33
@ %bb.71:                               @   in Loop: Header=BB36_34 Depth=1
	cmp	r4, #0
	beq.w	.LBB36_32
@ %bb.72:                               @   in Loop: Header=BB36_34 Depth=1
	movs	r0, #0
	str	r0, [sp, #96]
	ldrd	r2, r0, [sp, #88]
	adds	r0, #1
	cmp	r0, r2
	str	r0, [sp, #92]
	blt.w	.LBB36_32
@ %bb.73:                               @   in Loop: Header=BB36_34 Depth=1
	strd	r8, r11, [sp, #32]              @ 8-byte Folded Spill
	ldrd	r6, r8, [sp, #72]
	ldrd	r3, r0, [sp, #80]
	cmp	r2, #2
	sub.w	lr, r2, #1
	str	r5, [sp, #48]                   @ 4-byte Spill
	str	r4, [sp, #40]                   @ 4-byte Spill
	blt.w	.LBB36_83
@ %bb.74:                               @   in Loop: Header=BB36_34 Depth=1
	str	r0, [sp, #12]                   @ 4-byte Spill
	lsls	r7, r0, #2
	subs	r0, r2, #2
	cmp	r0, #3
	and	r4, lr, #3
	add	r0, sp, #16
	str	r1, [sp, #28]                   @ 4-byte Spill
	stm.w	r0, {r2, r6, r12}               @ 12-byte Folded Spill
	str	r3, [sp, #8]                    @ 4-byte Spill
	bhs	.LBB36_76
@ %bb.75:                               @   in Loop: Header=BB36_34 Depth=1
	movs	r0, #0
	b	.LBB36_80
	.p2align	2
.LBB36_76:                              @   in Loop: Header=BB36_34 Depth=1
	bic	r0, lr, #3
	rsbs	r0, r0, #0
	str	r0, [sp, #60]                   @ 4-byte Spill
	rsb	r0, r3, r3, lsl #4
	lsls	r0, r0, #4
	add.w	r0, r0, r8, lsl #2
	add	r0, r6
	sub.w	r5, r0, #960
	mov.w	r11, #0
	str	r4, [sp, #4]                    @ 4-byte Spill
	.p2align	2
.LBB36_77:                              @   Parent Loop BB36_34 Depth=1
                                        @ =>  This Inner Loop Header: Depth=2
	add.w	r10, r5, #960
	add.w	r4, r5, #1200
	mov	r0, r10
	mov	r1, r4
	mov	r2, r7
	bl	__aeabi_memmove4
	add.w	r6, r5, #1440
	mov	r0, r4
	mov	r1, r6
	mov	r2, r7
	bl	__aeabi_memmove4
	add.w	r4, r5, #1680
	mov	r0, r6
	mov	r1, r4
	mov	r2, r7
	bl	__aeabi_memmove4
	add.w	r1, r5, #1920
	mov	r0, r4
	mov	r2, r7
	bl	__aeabi_memmove4
	ldr	r0, [sp, #60]                   @ 4-byte Reload
	sub.w	r11, r11, #4
	cmp	r0, r11
	mov	r5, r10
	bne	.LBB36_77
@ %bb.78:                               @   in Loop: Header=BB36_34 Depth=1
	add.w	r12, sp, #16
	ldr	r4, [sp, #4]                    @ 4-byte Reload
	ldm.w	r12, {r2, r6, r12}              @ 12-byte Folded Reload
	ldr	r1, [sp, #28]                   @ 4-byte Reload
	ldrd	r3, r0, [sp, #8]                @ 8-byte Folded Reload
	sub.w	lr, r2, #1
	cbz	r4, .LBB36_83
@ %bb.79:                               @   in Loop: Header=BB36_34 Depth=1
	rsb.w	r0, r11, #0
.LBB36_80:                              @   in Loop: Header=BB36_34 Depth=1
	add	r0, r3
	rsb	r0, r0, r0, lsl #4
	add.w	r0, r6, r0, lsl #4
	add.w	r5, r0, r8, lsl #2
	add.w	r11, r5, #240
	mov	r0, r5
	mov	r1, r11
	mov	r2, r7
	bl	__aeabi_memmove4
	ldr	r2, [sp, #16]                   @ 4-byte Reload
	ldr	r3, [sp, #8]                    @ 4-byte Reload
	ldr	r6, [sp, #20]                   @ 4-byte Reload
	ldrd	r12, r1, [sp, #24]              @ 8-byte Folded Reload
	ldr	r0, [sp, #12]                   @ 4-byte Reload
	cmp	r4, #1
	sub.w	lr, r2, #1
	beq	.LBB36_83
@ %bb.81:                               @   in Loop: Header=BB36_34 Depth=1
	add.w	r10, r5, #480
	mov	r0, r11
	mov	r1, r10
	mov	r2, r7
	bl	__aeabi_memmove4
	ldr	r2, [sp, #16]                   @ 4-byte Reload
	ldrd	r3, r0, [sp, #8]                @ 8-byte Folded Reload
	ldrd	r6, r12, [sp, #20]              @ 8-byte Folded Reload
	ldr	r1, [sp, #28]                   @ 4-byte Reload
	sub.w	lr, r2, #1
	cmp	r4, #2
	beq	.LBB36_83
@ %bb.82:                               @   in Loop: Header=BB36_34 Depth=1
	add.w	r1, r5, #720
	mov	r0, r10
	mov	r2, r7
	bl	__aeabi_memmove4
	ldr	r2, [sp, #16]                   @ 4-byte Reload
	ldrd	r3, r0, [sp, #8]                @ 8-byte Folded Reload
	ldrd	r6, r12, [sp, #20]              @ 8-byte Folded Reload
	ldr	r1, [sp, #28]                   @ 4-byte Reload
	sub.w	lr, r2, #1
.LBB36_83:                              @   in Loop: Header=BB36_34 Depth=1
	cmp.w	r8, #0
	bmi	.LBB36_96
@ %bb.84:                               @   in Loop: Header=BB36_34 Depth=1
	add	r2, r3
	cmp	r2, #1
	blt	.LBB36_96
@ %bb.85:                               @   in Loop: Header=BB36_34 Depth=1
	cmp	r0, #1
	blt	.LBB36_96
@ %bb.86:                               @   in Loop: Header=BB36_34 Depth=1
	add	r0, r8
	cmp	r0, #60
	bgt	.LBB36_96
@ %bb.87:                               @   in Loop: Header=BB36_34 Depth=1
	cmp	r2, #20
	bgt	.LBB36_96
@ %bb.88:                               @   in Loop: Header=BB36_34 Depth=1
	rsb	r2, r2, r2, lsl #4
	lsls	r2, r2, #4
	add.w	r2, r2, r8, lsl #2
	add	r2, r6
	ldrd	r10, r5, [sp, #44]              @ 8-byte Folded Reload
	ldrd	r11, r4, [sp, #36]              @ 8-byte Folded Reload
	subs	r2, #240
	.p2align	2
.LBB36_89:                              @   Parent Loop BB36_34 Depth=1
                                        @ =>  This Inner Loop Header: Depth=2
	add.w	r3, r8, #1
	cmp	r3, r0
	str.w	r9, [r2]
	bge.w	.LBB36_31
@ %bb.90:                               @   in Loop: Header=BB36_89 Depth=2
	add.w	r3, r8, #2
	cmp	r3, r0
	str.w	r9, [r2, #4]
	bge.w	.LBB36_31
@ %bb.91:                               @   in Loop: Header=BB36_89 Depth=2
	add.w	r3, r8, #3
	cmp	r3, r0
	str.w	r9, [r2, #8]
	bge.w	.LBB36_31
@ %bb.92:                               @   in Loop: Header=BB36_89 Depth=2
	add.w	r8, r8, #4
	str.w	r9, [r2, #12]
	cmp	r8, r0
	add.w	r2, r2, #16
	blt	.LBB36_89
	b	.LBB36_31
	.p2align	2
.LBB36_93:
	ldr.w	r0, [r10, #8]
	ldr	r1, [sp, #52]                   @ 4-byte Reload
	add	r0, r1
	adds	r0, #1
	str.w	r0, [r10, #8]
	add	sp, #100
	pop.w	{r4, r5, r6, r7, r8, r9, r10, r11, pc}
	.p2align	2
.LBB36_94:
	movw	r0, :lower16:.L.str.2
	movt	r0, :upper16:.L.str.2
	bl	credits_private_credits_fail
	.p2align	2
.LBB36_95:
	movw	r0, :lower16:.L.str.1
	movt	r0, :upper16:.L.str.1
	bl	credits_private_credits_fail
	.p2align	2
.LBB36_96:
	movw	r0, :lower16:.L.str.163
	movt	r0, :upper16:.L.str.163
	bl	credits_private_credits_fail
.Lfunc_end36:
	.size	credits_private_credits60_characters, .Lfunc_end36-credits_private_credits60_characters
	.cantunwind
	.fnend
                                        @ -- End function
	.globl	credits_private_credits_multiline @ -- Begin function credits_private_credits_multiline
	.p2align	1
	.prefalign	2, .Lfunc_end37, nop
	.type	credits_private_credits_multiline,%function
	.code	16
	.thumb_func
credits_private_credits_multiline:      @ @credits_private_credits_multiline
	.fnstart
@ %bb.0:
	.save	{r4, r5, r6, r7, r8, r9, lr}
	push.w	{r4, r5, r6, r7, r8, r9, lr}
	.pad	#4
	sub	sp, #4
	mov	r8, r1
	ldr	r1, [sp, #32]
	mov	r5, r0
	mov	r0, r1
	mov	r4, r3
	mov	r9, r2
	bl	credits_private_canvas60_style
	ldrb	r1, [r4]
	cmp	r1, #0
	beq	.LBB37_14
@ %bb.1:
	movw	r2, #4828
	add.w	r12, r5, #24
	add	r2, r5
	mov	r5, r8
	b	.LBB37_5
	.p2align	2
.LBB37_2:                               @   in Loop: Header=BB37_5 Depth=1
	add.w	r9, r9, #1
.LBB37_3:                               @   in Loop: Header=BB37_5 Depth=1
	mov	r7, r8
.LBB37_4:                               @   in Loop: Header=BB37_5 Depth=1
	ldrb	r1, [r4]
	mov	r5, r7
	cbz	r1, .LBB37_14
.LBB37_5:                               @ =>This Inner Loop Header: Depth=1
	sub.w	r7, r1, #194
	cmp	r7, #29
	add.w	r6, r4, #1
	bhi	.LBB37_8
@ %bb.6:                                @   in Loop: Header=BB37_5 Depth=1
	ldrsb.w	r7, [r6]
	cmn.w	r7, #65
	bgt	.LBB37_15
@ %bb.7:                                @   in Loop: Header=BB37_5 Depth=1
	and	r3, r7, #63
	bfi	r3, r1, #6, #5
	adds	r4, #2
	mov	r1, r3
	b	.LBB37_9
	.p2align	2
.LBB37_8:                               @   in Loop: Header=BB37_5 Depth=1
	sxtb	r3, r1
	cmp.w	r3, #-1
	mov	r4, r6
	ble	.LBB37_15
.LBB37_9:                               @   in Loop: Header=BB37_5 Depth=1
	cmp	r1, #13
	beq	.LBB37_3
@ %bb.10:                               @   in Loop: Header=BB37_5 Depth=1
	cmp	r1, #10
	beq	.LBB37_2
@ %bb.11:                               @   in Loop: Header=BB37_5 Depth=1
	cmp	r5, #59
	add.w	r7, r5, #1
	it	ls
	cmpls.w	r9, #20
	blo	.LBB37_13
@ %bb.12:                               @   in Loop: Header=BB37_5 Depth=1
	ldr	r1, [r2]
	adds	r1, #1
	str	r1, [r2]
	b	.LBB37_4
	.p2align	2
.LBB37_13:                              @   in Loop: Header=BB37_5 Depth=1
	rsb	r3, r9, r9, lsl #4
	orrs	r1, r0
	add.w	r3, r12, r3, lsl #4
	str.w	r1, [r3, r5, lsl #2]
	b	.LBB37_4
	.p2align	2
.LBB37_14:
	add	sp, #4
	pop.w	{r4, r5, r6, r7, r8, r9, pc}
	.p2align	2
.LBB37_15:
	movw	r0, :lower16:.L.str.162
	movt	r0, :upper16:.L.str.162
	bl	credits_private_credits_fail
.Lfunc_end37:
	.size	credits_private_credits_multiline, .Lfunc_end37-credits_private_credits_multiline
	.cantunwind
	.fnend
                                        @ -- End function
	.globl	credits_private_canvas_string   @ -- Begin function credits_private_canvas_string
	.p2align	1
	.prefalign	2, .Lfunc_end38, nop
	.type	credits_private_canvas_string,%function
	.code	16
	.thumb_func
credits_private_canvas_string:          @ @credits_private_canvas_string
	.fnstart
@ %bb.0:
	.save	{r4, r5, r6, r7, r8, r9, r10, lr}
	push.w	{r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r9, r1
	ldr	r1, [sp, #32]
	mov	r8, r0
	mov	r0, r1
	mov	r7, r3
	mov	r10, r2
	bl	credits_private_canvas60_style
	ldrb	r4, [r7]
	cmp	r4, #0
	it	eq
	popeq.w	{r4, r5, r6, r7, r8, r9, r10, pc}
.LBB38_1:
	movw	r1, #4804
	add	r1, r8
	mov	r3, r9
	b	.LBB38_5
	.p2align	2
.LBB38_2:                               @   in Loop: Header=BB38_5 Depth=1
	add.w	r10, r10, #1
.LBB38_3:                               @   in Loop: Header=BB38_5 Depth=1
	mov	r5, r9
.LBB38_4:                               @   in Loop: Header=BB38_5 Depth=1
	ldrb	r4, [r7]
	mov	r3, r5
	cbz	r4, .LBB38_14
.LBB38_5:                               @ =>This Inner Loop Header: Depth=1
	sub.w	r6, r4, #194
	cmp	r6, #29
	add.w	r6, r7, #1
	bhi	.LBB38_8
@ %bb.6:                                @   in Loop: Header=BB38_5 Depth=1
	ldrsb.w	r6, [r6]
	cmn.w	r6, #65
	bgt	.LBB38_15
@ %bb.7:                                @   in Loop: Header=BB38_5 Depth=1
	and	r2, r6, #63
	bfi	r2, r4, #6, #5
	adds	r7, #2
	mov	r4, r2
	b	.LBB38_9
	.p2align	2
.LBB38_8:                               @   in Loop: Header=BB38_5 Depth=1
	sxtb	r2, r4
	cmp.w	r2, #-1
	mov	r7, r6
	ble	.LBB38_15
.LBB38_9:                               @   in Loop: Header=BB38_5 Depth=1
	cmp	r4, #13
	beq	.LBB38_3
@ %bb.10:                               @   in Loop: Header=BB38_5 Depth=1
	cmp	r4, #10
	beq	.LBB38_2
@ %bb.11:                               @   in Loop: Header=BB38_5 Depth=1
	cmp	r3, #59
	add.w	r5, r3, #1
	it	ls
	cmpls.w	r10, #20
	blo	.LBB38_13
@ %bb.12:                               @   in Loop: Header=BB38_5 Depth=1
	ldr	r2, [r1]
	adds	r2, #1
	str	r2, [r1]
	b	.LBB38_4
	.p2align	2
.LBB38_13:                              @   in Loop: Header=BB38_5 Depth=1
	rsb	r6, r10, r10, lsl #4
	orr.w	r2, r4, r0
	add.w	r6, r8, r6, lsl #4
	str.w	r2, [r6, r3, lsl #2]
	b	.LBB38_4
	.p2align	2
.LBB38_14:
	pop.w	{r4, r5, r6, r7, r8, r9, r10, pc}
	.p2align	2
.LBB38_15:
	movw	r0, :lower16:.L.str.162
	movt	r0, :upper16:.L.str.162
	bl	credits_private_credits_fail
.Lfunc_end38:
	.size	credits_private_canvas_string, .Lfunc_end38-credits_private_canvas_string
	.cantunwind
	.fnend
                                        @ -- End function
	.globl	credits_private_credits_type_words @ -- Begin function credits_private_credits_type_words
	.p2align	1
	.prefalign	2, .Lfunc_end39, nop
	.type	credits_private_credits_type_words,%function
	.code	16
	.thumb_func
credits_private_credits_type_words:     @ @credits_private_credits_type_words
	.fnstart
@ %bb.0:
	.save	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	push.w	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	.pad	#28
	sub	sp, #28
	ldr	r7, [r1]
	cmp	r7, #0
	beq.w	.LBB39_20
@ %bb.1:
	ldr	r6, [r7, #8]
	cmp	r6, #0
	beq.w	.LBB39_20
@ %bb.2:
	ldr	r4, [r7, #12]
	ldr	r5, [r1, #12]
	muls	r4, r6, r4
	cmp	r5, r4
	bge.w	.LBB39_20
@ %bb.3:
	cmp	r5, #0
	bmi.w	.LBB39_55
@ %bb.4:
	ldr	r4, [sp, #64]
	cmp	r4, #2
	bgt.w	.LBB39_55
@ %bb.5:
	ldr.w	r8, [r1, #8]
	orr.w	r4, r4, r8
	cmp.w	r4, #-1
	ble.w	.LBB39_55
@ %bb.6:
	sdiv	r4, r5, r6
	ldr	r7, [r7, #16]
	mls	r6, r4, r6, r5
	movw	r12, #10008
	add.w	r6, r6, r6, lsl #1
	add.w	r7, r7, r6, lsl #2
	add.w	r10, r0, r12
	ldr.w	r9, [r7, #4]
	ldr.w	r6, [r10, #124]
	add.w	r5, r9, #64
	cmp	r5, r6
	str	r1, [sp, #20]                   @ 4-byte Spill
	strd	r2, r0, [sp, #12]               @ 8-byte Folded Spill
	bls	.LBB39_13
@ %bb.7:
	cmp	r6, #0
	bne.w	.LBB39_57
@ %bb.8:
	ldr.w	r1, [r10, #120]
	cmp	r1, #0
	bne.w	.LBB39_57
@ %bb.9:
	ldr.w	r12, [r0, #12]
	cmp.w	r12, #0
	beq.w	.LBB39_56
@ %bb.10:
	ldrd	r4, r6, [r0, #16]
	adds	r6, #3
	bic	r6, r6, #3
	subs	r4, r4, r6
	blo.w	.LBB39_56
@ %bb.11:
	add.w	r5, r9, r5, lsr #1
	adds	r5, #96
	cmp	r5, r4
	bhi.w	.LBB39_56
@ %bb.12:
	ldrd	r1, lr, [r0]
	adds	r4, r6, r5
	str	r4, [r0, #20]
	adds	r4, r1, r5
	cmp	r4, lr
	str	r4, [r0]
	it	hi
	strhi	r4, [r0, #4]
	ldr	r1, [r0, #8]
	mov	r11, r3
	add.w	r4, r12, r6
	adds	r1, #1
	str	r1, [r0, #8]
	strd	r4, r5, [r10, #120]
	b	.LBB39_14
	.p2align	2
.LBB39_13:
	ldr.w	r4, [r10, #120]
	mov	r11, r3
.LBB39_14:
	ldr	r5, [r7]
	movw	r1, :lower16:.L.str.38
	movt	r1, :upper16:.L.str.38
	mov	r0, r5
	movs	r2, #9
	bl	strncmp
	cbz	r0, .LBB39_21
@ %bb.15:
	cmp.w	r9, #1
	it	ge
	cmpge.w	r8, #1
	bge.w	.LBB39_33
.LBB39_16:
	mov	r0, r4
	movs	r1, #60
	movs	r2, #32
	mov.w	r9, #60
	bl	__aeabi_memset
	mov.w	r8, #0
	movs	r0, #1
	str	r0, [sp, #8]                    @ 4-byte Spill
.LBB39_17:
	ldrd	r2, r12, [sp, #12]              @ 8-byte Folded Reload
.LBB39_18:
	ldr	r1, [sp, #20]                   @ 4-byte Reload
	movs	r6, #0
	mov	r0, r12
	mov	r3, r11
	strb.w	r6, [r4, r9]
	str	r6, [sp]
	bl	credits_private_credits60_words
	ldr	r0, [sp, #20]                   @ 4-byte Reload
	ldr	r2, [r7, #8]
	ldr	r1, [r0, #8]
	cmp	r1, r2
	bge	.LBB39_25
@ %bb.19:
	adds	r1, #1
	str	r1, [r0, #8]
.LBB39_20:
	add	sp, #28
	pop.w	{r4, r5, r6, r7, r8, r9, r10, r11, pc}
	.p2align	2
.LBB39_21:
	movw	r1, :lower16:.L.str.39
	add.w	r0, r5, #9
	movt	r1, :upper16:.L.str.39
	add	r2, sp, #24
	bl	sscanf
	cmp	r0, #1
	bne.w	.LBB39_58
@ %bb.22:
	ldr	r1, [sp, #24]
	cmp.w	r1, #-1
	ble.w	.LBB39_58
@ %bb.23:
	ldr.w	r2, [r10, #124]
	ldr	r0, [sp, #16]                   @ 4-byte Reload
	cmp	r1, r2
	bhs.w	.LBB39_48
@ %bb.24:
	ldr.w	r4, [r10, #120]
	b	.LBB39_54
	.p2align	2
.LBB39_25:
	ldr	r5, [sp, #16]                   @ 4-byte Reload
	ldr	r1, [sp, #64]
	movw	r6, #9960
	add.w	r3, r5, r1, lsl #4
	str.w	r10, [sp, #12]                  @ 4-byte Spill
	add.w	r10, r3, r6
	ldrd	r2, r4, [r10, #4]
	ldr	r6, [r3, r6]
	cmp	r2, r4
	add.w	r11, r2, r2, lsl #1
	bne	.LBB39_32
@ %bb.26:
	movs	r4, #0
	cmp.w	r4, r11, lsl #2
	bne.w	.LBB39_57
@ %bb.27:
	cmp	r6, #0
	bne.w	.LBB39_57
@ %bb.28:
	ldr.w	lr, [r5, #12]
	cmp.w	lr, #0
	beq.w	.LBB39_56
@ %bb.29:
	ldrd	r3, r6, [r5, #16]
	adds	r6, #3
	bic	r4, r6, #3
	subs.w	r9, r3, r4
	blo.w	.LBB39_56
@ %bb.30:
	movs	r3, #16
	add.w	r12, r3, r2, lsl #1
	add.w	r3, r12, r12, lsl #1
	lsls	r6, r3, #2
	cmp	r6, r9
	bhi.w	.LBB39_56
@ %bb.31:
	mov	r1, r8
	ldrd	r3, r8, [r5]
	add.w	r9, r4, r6
	add	r6, r3
	str.w	r9, [r5, #20]
	cmp	r6, r8
	str	r6, [r5]
	it	hi
	strhi	r6, [r5, #4]
	ldr	r3, [r5, #8]
	add.w	r6, lr, r4
	adds	r3, #1
	mov	r8, r1
	str	r3, [r5, #8]
	str.w	r6, [r10]
	str.w	r12, [r10, #8]
.LBB39_32:
	ldr	r1, [sp, #8]                    @ 4-byte Reload
	movw	r12, :lower16:.L.str.50
	movw	r4, :lower16:.L.str.142
	adds	r5, r2, #1
	movt	r12, :upper16:.L.str.50
	movt	r4, :upper16:.L.str.142
	cmp	r1, #0
	movw	r3, :lower16:.L.str.46
	movw	r1, :lower16:.L.str.143
	str.w	r5, [r10, #4]
	it	ne
	movne	r4, r12
	movt	r3, :upper16:.L.str.46
	movw	r12, :lower16:.L.str.144
	movt	r1, :upper16:.L.str.143
	movt	r12, :upper16:.L.str.144
	it	ne
	movne	r1, r12
	cmp.w	r8, #0
	it	ne
	movne	r3, r4
	movw	r4, :lower16:.L.str.92
	movt	r4, :upper16:.L.str.92
	it	ne
	movne	r4, r1
	ldr.w	r1, [r10, #12]
	add.w	lr, r6, r11, lsl #2
	str.w	r7, [r6, r11, lsl #2]
	cmp	r2, r1
	strd	r3, r4, [lr, #4]
	it	ge
	strge.w	r5, [r10, #12]
	ldr	r2, [sp, #12]                   @ 4-byte Reload
	movs	r1, #1
	str	r1, [r2]
	ldr	r2, [r0, #12]
	movs	r1, #0
	str	r1, [r0, #8]
	adds	r1, r2, #1
	str	r1, [r0, #12]
	add	sp, #28
	pop.w	{r4, r5, r6, r7, r8, r9, r10, r11, pc}
	.p2align	2
.LBB39_33:
	movs	r0, #0
	movs	r1, #0
	movs	r2, #0
	b	.LBB39_36
	.p2align	2
.LBB39_34:                              @   in Loop: Header=BB39_36 Depth=1
	adds	r1, #1
.LBB39_35:                              @   in Loop: Header=BB39_36 Depth=1
	adds	r2, #1
	cmp	r2, r9
	it	lt
	cmplt	r1, r8
	bge	.LBB39_38
.LBB39_36:                              @ =>This Inner Loop Header: Depth=1
	ldr	r3, [r7]
	ldrb	r3, [r3, r2]
	cmp	r3, #35
	beq	.LBB39_34
@ %bb.37:                               @   in Loop: Header=BB39_36 Depth=1
	strb	r3, [r4, r0]
	ldr.w	r9, [r7, #4]
	adds	r0, #1
	b	.LBB39_35
	.p2align	2
.LBB39_38:
	movs	r1, #0
	cmp	r0, #0
	strb	r1, [r4, r0]
	beq.w	.LBB39_16
@ %bb.39:
	ldrb	r1, [r4]
	add	r0, r4
	ldrb	r0, [r0, #-1]
	subs.w	r8, r1, #32
	it	ne
	movne.w	r8, #1
	subs.w	r1, r0, #126
	ldr	r0, [sp, #20]                   @ 4-byte Reload
	mov.w	r9, #0
	ldr.w	lr, [r0, #8]
	it	ne
	movne	r1, #1
	cmp.w	lr, #1
	str	r1, [sp, #8]                    @ 4-byte Spill
	blt.w	.LBB39_17
@ %bb.40:
	ldr	r6, [r7, #4]
	ldrd	r2, r12, [sp, #12]              @ 8-byte Folded Reload
	cmp	r6, #1
	blt.w	.LBB39_18
@ %bb.41:
	movs	r0, #0
	movs	r1, #0
	.p2align	2
.LBB39_42:                              @ =>This Inner Loop Header: Depth=1
	ldr	r5, [r7]
	ldrb	r5, [r5, r1]
	cmp	r5, #126
	beq	.LBB39_46
@ %bb.43:                               @   in Loop: Header=BB39_42 Depth=1
	cmp	r5, #35
	bne	.LBB39_45
@ %bb.44:                               @   in Loop: Header=BB39_42 Depth=1
	adds	r0, #1
	b	.LBB39_46
	.p2align	2
.LBB39_45:                              @   in Loop: Header=BB39_42 Depth=1
	strb.w	r5, [r4, r9]
	ldr	r6, [r7, #4]
	add.w	r9, r9, #1
.LBB39_46:                              @   in Loop: Header=BB39_42 Depth=1
	adds	r1, #1
	cmp	r1, r6
	bge.w	.LBB39_18
@ %bb.47:                               @   in Loop: Header=BB39_42 Depth=1
	cmp	r0, lr
	blt	.LBB39_42
	b	.LBB39_18
	.p2align	2
.LBB39_48:
	cmp	r2, #0
	bne	.LBB39_57
@ %bb.49:
	ldr.w	r2, [r10, #120]
	cbnz	r2, .LBB39_57
@ %bb.50:
	ldr	r2, [r0, #12]
	cbz	r2, .LBB39_56
@ %bb.51:
	ldrd	r7, r3, [r0, #16]
	adds	r3, #3
	bic	r3, r3, #3
	subs	r6, r7, r3
	blo	.LBB39_56
@ %bb.52:
	adds	r7, r1, #1
	add.w	r7, r1, r7, lsr #1
	adds	r7, #33
	cmp	r7, r6
	bhi	.LBB39_56
@ %bb.53:
	ldrd	r5, r4, [r0]
	adds	r6, r3, r7
	str	r6, [r0, #20]
	adds	r6, r5, r7
	cmp	r6, r4
	str	r6, [r0]
	it	hi
	strhi	r6, [r0, #4]
	ldr	r6, [r0, #8]
	adds	r4, r2, r3
	adds	r2, r6, #1
	str	r2, [r0, #8]
	strd	r4, r7, [r10, #120]
.LBB39_54:
	mov	r0, r4
	movs	r2, #32
	bl	__aeabi_memset
	ldr	r0, [sp, #24]
	movs	r1, #0
	strb	r1, [r4, r0]
	ldr	r1, [sp, #20]                   @ 4-byte Reload
	ldrd	r2, r0, [sp, #12]               @ 8-byte Folded Reload
	movs	r7, #1
	mov	r3, r11
	str	r7, [sp]
	bl	credits_private_credits60_words
	add	sp, #28
	pop.w	{r4, r5, r6, r7, r8, r9, r10, r11, pc}
	.p2align	2
.LBB39_55:
	movw	r0, :lower16:.L.str.37
	movt	r0, :upper16:.L.str.37
	bl	credits_private_credits_fail
	.p2align	2
.LBB39_56:
	movw	r0, :lower16:.L.str.2
	movt	r0, :upper16:.L.str.2
	bl	credits_private_credits_fail
	.p2align	2
.LBB39_57:
	movw	r0, :lower16:.L.str.1
	movt	r0, :upper16:.L.str.1
	bl	credits_private_credits_fail
	.p2align	2
.LBB39_58:
	movw	r0, :lower16:.L.str.40
	movt	r0, :upper16:.L.str.40
	bl	credits_private_credits_fail
.Lfunc_end39:
	.size	credits_private_credits_type_words, .Lfunc_end39-credits_private_credits_type_words
	.cantunwind
	.fnend
                                        @ -- End function
	.globl	credits_private_credits60_words @ -- Begin function credits_private_credits60_words
	.p2align	2
	.type	credits_private_credits60_words,%function
	.code	16
	.thumb_func
credits_private_credits60_words:        @ @credits_private_credits60_words
	.fnstart
@ %bb.0:
	.save	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	push.w	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	.pad	#76
	sub	sp, #76
	movw	r6, #10152
	ldr	r7, [r0, r6]
	adds	r4, r0, r6
	subs	r7, #10
	cmp	r7, #10
	bhi	.LBB40_4
@ %bb.1:
	movs	r5, #1
	mov.w	r11, #19
	str	r5, [sp, #40]                   @ 4-byte Spill
.LCPI40_0:
	tbb	[pc, r7]
@ %bb.2:
.LJTI40_0:
	.byte	(.LBB40_11-(.LCPI40_0+4))/2
	.byte	(.LBB40_4-(.LCPI40_0+4))/2
	.byte	(.LBB40_4-(.LCPI40_0+4))/2
	.byte	(.LBB40_4-(.LCPI40_0+4))/2
	.byte	(.LBB40_3-(.LCPI40_0+4))/2
	.byte	(.LBB40_4-(.LCPI40_0+4))/2
	.byte	(.LBB40_4-(.LCPI40_0+4))/2
	.byte	(.LBB40_5-(.LCPI40_0+4))/2
	.byte	(.LBB40_4-(.LCPI40_0+4))/2
	.byte	(.LBB40_8-(.LCPI40_0+4))/2
	.byte	(.LBB40_10-(.LCPI40_0+4))/2
	.p2align	1
	.p2align	2
.LBB40_3:
	movs	r3, #9
	mov.w	r11, #11
	b	.LBB40_13
	.p2align	2
.LBB40_4:
	rsb.w	r7, r3, #20
	mov	r11, r3
	str	r7, [sp, #40]                   @ 4-byte Spill
	cmp	r2, #59
	str	r4, [sp, #32]                   @ 4-byte Spill
	str	r1, [sp, #12]                   @ 4-byte Spill
	bls	.LBB40_14
	b	.LBB40_71
	.p2align	2
.LBB40_5:
	ldr	r3, [r4, #4]
	cbz	r3, .LBB40_12
@ %bb.6:
	cmp	r3, #1
	beq	.LBB40_9
@ %bb.7:
	movs	r3, #6
	mov.w	r11, #5
	b	.LBB40_13
	.p2align	2
.LBB40_8:
	mov.w	r11, #18
.LBB40_9:
	movs	r3, #1
	b	.LBB40_13
	.p2align	2
.LBB40_10:
	ldr	r3, [r4, #4]
	mov.w	r11, #16
	cmp	r3, #0
	mov.w	r3, #4
	it	eq
	moveq	r3, #5
	str	r3, [sp, #40]                   @ 4-byte Spill
	it	eq
	moveq.w	r11, #1
.LBB40_11:
	cmp	r2, #59
	str	r4, [sp, #32]                   @ 4-byte Spill
	str	r1, [sp, #12]                   @ 4-byte Spill
	bls	.LBB40_14
	b	.LBB40_71
	.p2align	2
.LBB40_12:
	movs	r3, #3
	mov.w	r11, #2
.LBB40_13:
	str	r3, [sp, #40]                   @ 4-byte Spill
	cmp	r2, #59
	str	r4, [sp, #32]                   @ 4-byte Spill
	str	r1, [sp, #12]                   @ 4-byte Spill
	bhi.w	.LBB40_71
.LBB40_14:
	cmp.w	r11, #0
	bmi.w	.LBB40_71
@ %bb.15:
	ldr	r1, [sp, #40]                   @ 4-byte Reload
	cmp	r1, #1
	blt.w	.LBB40_71
@ %bb.16:
	ldr	r1, [sp, #40]                   @ 4-byte Reload
	add.w	r7, r11, r1
	cmp	r7, #20
	bgt.w	.LBB40_71
@ %bb.17:
	rsb.w	r1, r2, #60
	str	r1, [sp, #44]                   @ 4-byte Spill
	rsbs	r1, r2, #0
	add.w	r6, r0, #24
	and	r4, r1, #3
	mov	r1, r0
	rsb	r0, r11, r11, lsl #4
	movw	r9, #32
	add.w	r0, r1, r0, lsl #4
	movt	r9, #3175
	add.w	r8, r2, #1
	add.w	r10, r2, #2
	str	r1, [sp, #8]                    @ 4-byte Spill
	add.w	r5, r0, #8
	mov	r1, r11
	b	.LBB40_19
	.p2align	2
.LBB40_18:                              @   in Loop: Header=BB40_19 Depth=1
	adds	r1, #1
	cmp	r1, r7
	add.w	r5, r5, #240
	bge	.LBB40_25
.LBB40_19:                              @ =>This Loop Header: Depth=1
                                        @     Child Loop BB40_24 Depth 2
	mov	r0, r2
	cbz	r4, .LBB40_22
@ %bb.20:                               @   in Loop: Header=BB40_19 Depth=1
	rsb	r0, r1, r1, lsl #4
	add.w	r3, r6, r0, lsl #4
	cmp	r4, #1
	mov	r0, r8
	str.w	r9, [r3, r2, lsl #2]
	beq	.LBB40_22
@ %bb.21:                               @   in Loop: Header=BB40_19 Depth=1
	mov	r0, r10
	str.w	r9, [r3, r8, lsl #2]
	cmp	r4, #2
	itt	ne
	strne.w	r9, [r3, r10, lsl #2]
	addne	r0, r2, #3
.LBB40_22:                              @   in Loop: Header=BB40_19 Depth=1
	cmp	r2, #56
	bhi	.LBB40_18
@ %bb.23:                               @   in Loop: Header=BB40_19 Depth=1
	add.w	r12, r5, r0, lsl #2
	sub.w	lr, r0, #60
	.p2align	2
.LBB40_24:                              @   Parent Loop BB40_19 Depth=1
                                        @ =>  This Inner Loop Header: Depth=2
	str	r9, [r12, #16]!
	adds.w	lr, lr, #4
	strd	r9, r9, [r12, #4]
	str.w	r9, [r12, #12]
	bne	.LBB40_24
	b	.LBB40_18
	.p2align	2
.LBB40_25:
	ldr	r0, [sp, #44]                   @ 4-byte Reload
	ldr	r1, [sp, #112]
	str.w	r11, [sp, #56]
	ldr.w	r11, [sp, #40]                  @ 4-byte Reload
	str	r0, [sp, #60]
	movs	r0, #0
	strd	r6, r2, [sp, #48]
	str.w	r11, [sp, #64]
	str	r0, [sp, #68]
	str	r0, [sp, #72]
	cbz	r1, .LBB40_27
@ %bb.26:
	add	sp, #76
	pop.w	{r4, r5, r6, r7, r8, r9, r10, r11, pc}
	.p2align	2
.LBB40_27:
	ldr.w	r8, [sp, #12]                   @ 4-byte Reload
	ldr.w	r0, [r8]
	str	r0, [sp, #36]                   @ 4-byte Spill
	ldr	r0, [sp, #32]                   @ 4-byte Reload
	ldr	r1, [r0]
	ldr.w	r0, [r8, #12]
	cmp	r1, #20
	bne.w	.LBB40_69
@ %bb.28:
	ldr.w	r10, [sp, #8]                   @ 4-byte Reload
	cmp	r0, #1
	blt.w	.LBB40_70
@ %bb.29:
	movs	r6, #0
	b	.LBB40_32
	.p2align	2
.LBB40_30:                              @   in Loop: Header=BB40_32 Depth=1
	mov.w	r1, #4800
	ldr	r0, [r3, r1]
	ldr.w	r8, [sp, #12]                   @ 4-byte Reload
	adds	r0, #1
	str	r4, [sp, #68]
	str	r0, [r3, r1]
.LBB40_31:                              @   in Loop: Header=BB40_32 Depth=1
	ldr.w	r0, [r8, #12]
	adds	r6, #1
	cmp	r6, r0
	bge.w	.LBB40_70
.LBB40_32:                              @ =>This Loop Header: Depth=1
                                        @     Child Loop BB40_42 Depth 2
                                        @       Child Loop BB40_43 Depth 3
                                        @     Child Loop BB40_53 Depth 2
                                        @     Child Loop BB40_65 Depth 2
	ldr	r2, [sp, #36]                   @ 4-byte Reload
	ldr	r0, [r2, #8]
	ldr	r4, [r2, #16]
	sdiv	r1, r6, r0
	movs	r2, #9
	mls	r0, r1, r0, r6
	movw	r1, :lower16:.L.str.38
	add.w	r5, r0, r0, lsl #1
	ldr.w	r0, [r4, r5, lsl #2]
	movt	r1, :upper16:.L.str.38
	bl	strncmp
	cbz	r0, .LBB40_34
@ %bb.33:                               @   in Loop: Header=BB40_32 Depth=1
	add.w	r2, r4, r5, lsl #2
	ldr	r3, [r2, #8]
	ldr.w	r7, [r8, #16]
	mov	r0, r10
	add	r1, sp, #48
	str	r7, [sp]
	bl	credits_private_text60_emit_words
	ldrd	r11, r0, [sp, #64]
	adds	r0, #1
	b	.LBB40_48
	.p2align	2
.LBB40_34:                              @   in Loop: Header=BB40_32 Depth=1
	ldr	r0, [sp, #52]
	cmp	r0, #0
	bmi.w	.LBB40_71
@ %bb.35:                               @   in Loop: Header=BB40_32 Depth=1
	ldr	r1, [sp, #56]
	cmp	r1, #0
	bmi.w	.LBB40_71
@ %bb.36:                               @   in Loop: Header=BB40_32 Depth=1
	ldr	r2, [sp, #60]
	cmp	r2, #1
	blt.w	.LBB40_71
@ %bb.37:                               @   in Loop: Header=BB40_32 Depth=1
	cmp.w	r11, #1
	blt.w	.LBB40_71
@ %bb.38:                               @   in Loop: Header=BB40_32 Depth=1
	add	r2, r0
	cmp	r2, #60
	bgt.w	.LBB40_71
@ %bb.39:                               @   in Loop: Header=BB40_32 Depth=1
	add.w	r12, r11, r1
	cmp.w	r12, #20
	bgt.w	.LBB40_71
@ %bb.40:                               @   in Loop: Header=BB40_32 Depth=1
	rsb	r7, r1, r1, lsl #4
	lsls	r7, r7, #4
	add.w	r7, r7, r0, lsl #2
	mov	lr, r6
	add	r7, r10
	b	.LBB40_42
	.p2align	2
.LBB40_41:                              @   in Loop: Header=BB40_42 Depth=2
	adds	r1, #1
	cmp	r1, r12
	add.w	r7, r7, #240
	bge	.LBB40_47
.LBB40_42:                              @   Parent Loop BB40_32 Depth=1
                                        @ =>  This Loop Header: Depth=2
                                        @       Child Loop BB40_43 Depth 3
	movs	r6, #0
	.p2align	2
.LBB40_43:                              @   Parent Loop BB40_32 Depth=1
                                        @     Parent Loop BB40_42 Depth=2
                                        @ =>    This Inner Loop Header: Depth=3
	adds	r4, r0, r6
	adds	r3, r4, #1
	add.w	r5, r7, r6, lsl #2
	cmp	r3, r2
	str.w	r9, [r5, #24]
	bge	.LBB40_41
@ %bb.44:                               @   in Loop: Header=BB40_43 Depth=3
	adds	r3, r4, #2
	cmp	r3, r2
	str.w	r9, [r5, #28]
	bge	.LBB40_41
@ %bb.45:                               @   in Loop: Header=BB40_43 Depth=3
	adds	r3, r4, #3
	cmp	r3, r2
	str.w	r9, [r5, #32]
	bge	.LBB40_41
@ %bb.46:                               @   in Loop: Header=BB40_43 Depth=3
	adds	r6, #4
	adds	r3, r0, r6
	cmp	r3, r2
	str.w	r9, [r5, #36]
	blt	.LBB40_43
	b	.LBB40_41
	.p2align	2
.LBB40_47:                              @   in Loop: Header=BB40_32 Depth=1
	movs	r0, #1
	mov	r6, lr
.LBB40_48:                              @   in Loop: Header=BB40_32 Depth=1
	movs	r1, #0
	cmp	r0, r11
	str	r1, [sp, #72]
	str	r0, [sp, #68]
	blt	.LBB40_31
@ %bb.49:                               @   in Loop: Header=BB40_32 Depth=1
	ldrd	r3, r8, [sp, #48]
	ldrd	r1, r0, [sp, #56]
	cmp.w	r11, #2
	sub.w	r4, r11, #1
	str	r6, [sp, #32]                   @ 4-byte Spill
	str.w	r11, [sp, #40]                  @ 4-byte Spill
	blt	.LBB40_59
@ %bb.50:                               @   in Loop: Header=BB40_32 Depth=1
	str	r0, [sp, #20]                   @ 4-byte Spill
	lsls	r7, r0, #2
	ldr	r0, [sp, #40]                   @ 4-byte Reload
	and	r5, r4, #3
	subs	r0, #2
	cmp	r0, #3
	strd	r4, r3, [sp, #24]               @ 8-byte Folded Spill
	str	r1, [sp, #16]                   @ 4-byte Spill
	bhs	.LBB40_52
@ %bb.51:                               @   in Loop: Header=BB40_32 Depth=1
	movs	r0, #0
	b	.LBB40_56
	.p2align	2
.LBB40_52:                              @   in Loop: Header=BB40_32 Depth=1
	bic	r0, r4, #3
	rsbs	r0, r0, #0
	str	r0, [sp, #44]                   @ 4-byte Spill
	rsb	r0, r1, r1, lsl #4
	lsls	r0, r0, #4
	add.w	r0, r0, r8, lsl #2
	add	r0, r3
	sub.w	r6, r0, #960
	mov.w	r11, #0
	str	r5, [sp, #4]                    @ 4-byte Spill
	.p2align	2
.LBB40_53:                              @   Parent Loop BB40_32 Depth=1
                                        @ =>  This Inner Loop Header: Depth=2
	add.w	r10, r6, #960
	add.w	r4, r6, #1200
	mov	r0, r10
	mov	r1, r4
	mov	r2, r7
	bl	__aeabi_memmove4
	add.w	r5, r6, #1440
	mov	r0, r4
	mov	r1, r5
	mov	r2, r7
	bl	__aeabi_memmove4
	add.w	r4, r6, #1680
	mov	r0, r5
	mov	r1, r4
	mov	r2, r7
	bl	__aeabi_memmove4
	add.w	r1, r6, #1920
	mov	r0, r4
	mov	r2, r7
	bl	__aeabi_memmove4
	ldr	r0, [sp, #44]                   @ 4-byte Reload
	sub.w	r11, r11, #4
	cmp	r0, r11
	mov	r6, r10
	bne	.LBB40_53
@ %bb.54:                               @   in Loop: Header=BB40_32 Depth=1
	ldr	r5, [sp, #4]                    @ 4-byte Reload
	ldr.w	r10, [sp, #8]                   @ 4-byte Reload
	ldrd	r4, r3, [sp, #24]               @ 8-byte Folded Reload
	ldrd	r1, r0, [sp, #16]               @ 8-byte Folded Reload
	cbz	r5, .LBB40_59
@ %bb.55:                               @   in Loop: Header=BB40_32 Depth=1
	rsb.w	r0, r11, #0
.LBB40_56:                              @   in Loop: Header=BB40_32 Depth=1
	add	r0, r1
	rsb	r0, r0, r0, lsl #4
	add.w	r0, r3, r0, lsl #4
	add.w	r6, r0, r8, lsl #2
	add.w	r11, r6, #240
	mov	r0, r6
	mov	r1, r11
	mov	r2, r7
	bl	__aeabi_memmove4
	ldr	r1, [sp, #16]                   @ 4-byte Reload
	ldr	r3, [sp, #28]                   @ 4-byte Reload
	ldrd	r0, r4, [sp, #20]               @ 8-byte Folded Reload
	cmp	r5, #1
	beq	.LBB40_59
@ %bb.57:                               @   in Loop: Header=BB40_32 Depth=1
	mov	r10, r5
	add.w	r5, r6, #480
	mov	r0, r11
	mov	r1, r5
	mov	r2, r7
	bl	__aeabi_memmove4
	ldrd	r1, r0, [sp, #16]               @ 8-byte Folded Reload
	ldrd	r4, r3, [sp, #24]               @ 8-byte Folded Reload
	cmp.w	r10, #2
	ldr.w	r10, [sp, #8]                   @ 4-byte Reload
	beq	.LBB40_59
@ %bb.58:                               @   in Loop: Header=BB40_32 Depth=1
	add.w	r1, r6, #720
	mov	r0, r5
	mov	r2, r7
	bl	__aeabi_memmove4
	ldrd	r1, r0, [sp, #16]               @ 8-byte Folded Reload
	ldrd	r4, r3, [sp, #24]               @ 8-byte Folded Reload
	.p2align	2
.LBB40_59:                              @   in Loop: Header=BB40_32 Depth=1
	ldr.w	r11, [sp, #40]                  @ 4-byte Reload
	cmp.w	r8, #0
	bmi	.LBB40_71
@ %bb.60:                               @   in Loop: Header=BB40_32 Depth=1
	add	r1, r11
	cmp	r1, #1
	blt	.LBB40_71
@ %bb.61:                               @   in Loop: Header=BB40_32 Depth=1
	cmp	r0, #1
	blt	.LBB40_71
@ %bb.62:                               @   in Loop: Header=BB40_32 Depth=1
	add	r0, r8
	cmp	r0, #60
	bgt	.LBB40_71
@ %bb.63:                               @   in Loop: Header=BB40_32 Depth=1
	cmp	r1, #20
	bgt	.LBB40_71
@ %bb.64:                               @   in Loop: Header=BB40_32 Depth=1
	rsb	r1, r1, r1, lsl #4
	lsls	r1, r1, #4
	add.w	r1, r1, r8, lsl #2
	add	r1, r3
	ldr	r6, [sp, #32]                   @ 4-byte Reload
	subs	r1, #240
	.p2align	2
.LBB40_65:                              @   Parent Loop BB40_32 Depth=1
                                        @ =>  This Inner Loop Header: Depth=2
	add.w	r2, r8, #1
	cmp	r2, r0
	str.w	r9, [r1]
	bge.w	.LBB40_30
@ %bb.66:                               @   in Loop: Header=BB40_65 Depth=2
	add.w	r2, r8, #2
	cmp	r2, r0
	str.w	r9, [r1, #4]
	bge.w	.LBB40_30
@ %bb.67:                               @   in Loop: Header=BB40_65 Depth=2
	add.w	r2, r8, #3
	cmp	r2, r0
	str.w	r9, [r1, #8]
	bge.w	.LBB40_30
@ %bb.68:                               @   in Loop: Header=BB40_65 Depth=2
	add.w	r8, r8, #4
	str.w	r9, [r1, #12]
	cmp	r8, r0
	add.w	r1, r1, #16
	blt	.LBB40_65
	b	.LBB40_30
	.p2align	2
.LBB40_69:
	ldr.w	r10, [sp, #8]                   @ 4-byte Reload
.LBB40_70:
	ldr	r3, [sp, #36]                   @ 4-byte Reload
	ldr.w	r7, [r8, #16]
	ldr	r1, [r3, #8]
	sdiv	r2, r0, r1
	mls	r0, r2, r1, r0
	ldr	r1, [r3, #16]
	add.w	r0, r0, r0, lsl #1
	ldr.w	r3, [r8, #8]
	add.w	r2, r1, r0, lsl #2
	add	r1, sp, #48
	mov	r0, r10
	str	r7, [sp]
	bl	credits_private_text60_emit_words
	add	sp, #76
	pop.w	{r4, r5, r6, r7, r8, r9, r10, r11, pc}
	.p2align	2
.LBB40_71:
	movw	r0, :lower16:.L.str.163
	movt	r0, :upper16:.L.str.163
	bl	credits_private_credits_fail
.Lfunc_end40:
	.size	credits_private_credits60_words, .Lfunc_end40-credits_private_credits60_words
	.cantunwind
	.fnend
                                        @ -- End function
	.globl	credits_private_credits_write_history @ -- Begin function credits_private_credits_write_history
	.p2align	1
	.prefalign	2, .Lfunc_end41, nop
	.type	credits_private_credits_write_history,%function
	.code	16
	.thumb_func
credits_private_credits_write_history:  @ @credits_private_credits_write_history
	.fnstart
@ %bb.0:
	movw	r2, #10008
	ldr	r1, [r0, r2]
	cmp	r1, #0
	it	eq
	bxeq	lr
.LBB41_1:
	ldr	r1, [sp]
	add	r2, r0
	movs	r3, #0
	str	r3, [r2]
	b	credits_private_credits60_history
.Lfunc_end41:
	.size	credits_private_credits_write_history, .Lfunc_end41-credits_private_credits_write_history
	.cantunwind
	.fnend
                                        @ -- End function
	.globl	credits_private_credits60_history @ -- Begin function credits_private_credits60_history
	.p2align	1
	.prefalign	2, .Lfunc_end42, nop
	.type	credits_private_credits60_history,%function
	.code	16
	.thumb_func
credits_private_credits60_history:      @ @credits_private_credits60_history
	.fnstart
@ %bb.0:
	.save	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	push.w	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	.pad	#76
	sub	sp, #76
	mov	r11, r0
	movw	r0, #10128
	add	r0, r11
	movs	r5, #0
	str	r0, [sp, #28]                   @ 4-byte Spill
	cmp	r1, #1
	it	eq
	moveq	r5, #12
	mov.w	r9, #31
	add.w	r0, r11, #24
	rsb	r2, r5, r5, lsl #4
	movw	r8, #32
	it	eq
	moveq.w	r9, #60
	str	r0, [sp, #36]                   @ 4-byte Spill
	and	r12, r9, #60
	add.w	r0, r11, r2, lsl #4
	movt	r8, #3175
	mov.w	r10, #18
	and	lr, r9, #3
	sub.w	r3, r0, #16
	mov	r4, r12
	it	eq
	moveq.w	r10, #19
	.p2align	2
.LBB42_1:                               @ =>This Inner Loop Header: Depth=1
	strd	r8, r8, [r3, #40]
	strd	r8, r8, [r3, #48]
	subs	r4, #4
	add.w	r3, r3, #16
	bne	.LBB42_1
@ %bb.2:
	cmp.w	lr, #0
	beq	.LBB42_5
@ %bb.3:
	cmp.w	lr, #1
	str.w	r8, [r3, #40]
	beq	.LBB42_5
@ %bb.4:
	cmp.w	lr, #2
	str.w	r8, [r3, #44]
	it	ne
	strne.w	r8, [r3, #48]
.LBB42_5:
	mvn	r3, #15
	add.w	r2, r3, r2, lsl #4
	mov	r3, r12
	.p2align	2
.LBB42_6:                               @ =>This Inner Loop Header: Depth=1
	add.w	r4, r11, r2
	subs	r3, #4
	add.w	r2, r2, #16
	strd	r8, r8, [r4, #280]
	strd	r8, r8, [r4, #288]
	bne	.LBB42_6
@ %bb.7:
	cmp.w	lr, #0
	beq	.LBB42_10
@ %bb.8:
	add	r2, r11
	cmp.w	lr, #1
	str.w	r8, [r2, #280]
	beq	.LBB42_10
@ %bb.9:
	cmp.w	lr, #2
	str.w	r8, [r2, #284]
	it	ne
	strne.w	r8, [r2, #288]
.LBB42_10:
	cmp	r1, #1
	str	r5, [sp, #44]                   @ 4-byte Spill
	bne	.LBB42_17
@ %bb.11:
	movs	r2, #240
	and.w	r3, r2, r9, lsl #2
	movs	r2, #0
	.p2align	2
.LBB42_12:                              @ =>This Inner Loop Header: Depth=1
	adds	r4, r0, r2
	adds	r2, #16
	cmp	r3, r2
	strd	r8, r8, [r4, #504]
	str.w	r8, [r4, #512]
	str.w	r8, [r4, #516]
	bne	.LBB42_12
@ %bb.13:
	cmp.w	lr, #0
	beq	.LBB42_16
@ %bb.14:
	add	r0, r2
	cmp.w	lr, #1
	str.w	r8, [r0, #504]
	beq	.LBB42_16
@ %bb.15:
	cmp.w	lr, #2
	str.w	r8, [r0, #508]
	it	ne
	strne.w	r8, [r0, #512]
.LBB42_16:
	orr	r4, r5, #3
	b	.LBB42_18
	.p2align	2
.LBB42_17:
	orr	r4, r5, #2
.LBB42_18:
	rsb	r0, r4, r4, lsl #4
	add.w	r3, r11, r0, lsl #4
	add.w	r5, r3, #36
	add.w	r0, r3, #276
	add.w	r2, r3, #516
	add.w	r7, r3, #756
	str.w	r11, [sp, #40]                  @ 4-byte Spill
	b	.LBB42_20
	.p2align	2
.LBB42_19:                              @   in Loop: Header=BB42_20 Depth=1
	adds	r4, #4
	add.w	r5, r5, #960
	add.w	r0, r0, #960
	add.w	r2, r2, #960
	cmp	r4, r10
	add.w	r7, r7, #960
	beq	.LBB42_40
.LBB42_20:                              @ =>This Loop Header: Depth=1
                                        @     Child Loop BB42_21 Depth 2
                                        @     Child Loop BB42_26 Depth 2
                                        @     Child Loop BB42_31 Depth 2
                                        @     Child Loop BB42_36 Depth 2
	mov	r11, r12
	mov	r3, r5
	.p2align	2
.LBB42_21:                              @   Parent Loop BB42_20 Depth=1
                                        @ =>  This Inner Loop Header: Depth=2
	strd	r8, r8, [r3, #-12]
	str	r8, [r3, #-4]
	str	r8, [r3], #16
	subs.w	r11, r11, #4
	bne	.LBB42_21
@ %bb.22:                               @   in Loop: Header=BB42_20 Depth=1
	cmp.w	lr, #0
	beq	.LBB42_25
@ %bb.23:                               @   in Loop: Header=BB42_20 Depth=1
	cmp.w	lr, #1
	str	r8, [r3, #-12]
	beq	.LBB42_25
@ %bb.24:                               @   in Loop: Header=BB42_20 Depth=1
	cmp.w	lr, #2
	str	r8, [r3, #-8]
	it	ne
	strne	r8, [r3, #-4]
.LBB42_25:                              @   in Loop: Header=BB42_20 Depth=1
	ldr.w	r11, [sp, #40]                  @ 4-byte Reload
	mov	r6, r12
	mov	r3, r0
	.p2align	2
.LBB42_26:                              @   Parent Loop BB42_20 Depth=1
                                        @ =>  This Inner Loop Header: Depth=2
	strd	r8, r8, [r3, #-12]
	str	r8, [r3, #-4]
	str	r8, [r3], #16
	subs	r6, #4
	bne	.LBB42_26
@ %bb.27:                               @   in Loop: Header=BB42_20 Depth=1
	cmp.w	lr, #0
	beq	.LBB42_30
@ %bb.28:                               @   in Loop: Header=BB42_20 Depth=1
	cmp.w	lr, #1
	str	r8, [r3, #-12]
	beq	.LBB42_30
@ %bb.29:                               @   in Loop: Header=BB42_20 Depth=1
	cmp.w	lr, #2
	str	r8, [r3, #-8]
	it	ne
	strne	r8, [r3, #-4]
.LBB42_30:                              @   in Loop: Header=BB42_20 Depth=1
	mov	r6, r12
	mov	r3, r2
	.p2align	2
.LBB42_31:                              @   Parent Loop BB42_20 Depth=1
                                        @ =>  This Inner Loop Header: Depth=2
	strd	r8, r8, [r3, #-12]
	str	r8, [r3, #-4]
	str	r8, [r3], #16
	subs	r6, #4
	bne	.LBB42_31
@ %bb.32:                               @   in Loop: Header=BB42_20 Depth=1
	cmp.w	lr, #0
	beq	.LBB42_35
@ %bb.33:                               @   in Loop: Header=BB42_20 Depth=1
	cmp.w	lr, #1
	str	r8, [r3, #-12]
	beq	.LBB42_35
@ %bb.34:                               @   in Loop: Header=BB42_20 Depth=1
	cmp.w	lr, #2
	str	r8, [r3, #-8]
	it	ne
	strne	r8, [r3, #-4]
.LBB42_35:                              @   in Loop: Header=BB42_20 Depth=1
	mov	r6, r12
	mov	r3, r7
	.p2align	2
.LBB42_36:                              @   Parent Loop BB42_20 Depth=1
                                        @ =>  This Inner Loop Header: Depth=2
	strd	r8, r8, [r3, #-12]
	str	r8, [r3, #-4]
	str	r8, [r3], #16
	subs	r6, #4
	bne	.LBB42_36
@ %bb.37:                               @   in Loop: Header=BB42_20 Depth=1
	cmp.w	lr, #0
	beq	.LBB42_19
@ %bb.38:                               @   in Loop: Header=BB42_20 Depth=1
	cmp.w	lr, #1
	str	r8, [r3, #-12]
	beq	.LBB42_19
@ %bb.39:                               @   in Loop: Header=BB42_20 Depth=1
	cmp.w	lr, #2
	str	r8, [r3, #-8]
	it	ne
	strne	r8, [r3, #-4]
	b	.LBB42_19
	.p2align	2
.LBB42_40:
	add.w	r0, r11, r1, lsl #4
	movw	r2, #9960
	add.w	r10, r0, r2
	movs	r0, #18
	cmp	r1, #1
	it	eq
	moveq	r0, #7
	ldr	r1, [sp, #36]                   @ 4-byte Reload
	str	r0, [sp, #64]
	str	r1, [sp, #48]
	ldr	r1, [sp, #44]                   @ 4-byte Reload
	movs	r2, #0
	strd	r1, r9, [sp, #56]
	ldr.w	r1, [r10, #4]
	ldr.w	r9, [sp, #28]                   @ 4-byte Reload
	subs	r0, r1, r0
	bic.w	r0, r0, r0, asr #31
	cmp	r0, r1
	str	r2, [sp, #52]
	str	r2, [sp, #68]
	str	r0, [sp, #32]                   @ 4-byte Spill
	str	r2, [sp, #72]
	bge.w	.LBB42_122
@ %bb.41:
	ldr	r3, [sp, #32]                   @ 4-byte Reload
	str.w	r10, [sp, #4]                   @ 4-byte Spill
	b	.LBB42_44
	.p2align	2
.LBB42_42:                              @   in Loop: Header=BB42_44 Depth=1
	movs	r7, #0
.LBB42_43:                              @   in Loop: Header=BB42_44 Depth=1
	adds	r0, r6, #4
	mov	r1, r6
	mov	r2, r7
	bl	__aeabi_memmove
	movw	r0, #8224
	strh	r0, [r6]
	ldr	r0, [r4, #8]
	movs	r1, #0
	ldrh	r0, [r0]
	movs	r3, #0
	strh	r0, [r6, #2]
	adds	r0, r6, r7
	strb	r1, [r0, #4]
	ldr	r2, [r4, #4]
	add	r0, sp, #48
	mov	r1, r6
	bl	credits_private_canvas60_line
	ldr	r3, [sp, #44]                   @ 4-byte Reload
	ldr.w	r0, [r10, #4]
	adds	r3, #1
	cmp	r3, r0
	bge.w	.LBB42_122
.LBB42_44:                              @ =>This Loop Header: Depth=1
                                        @     Child Loop BB42_50 Depth 2
                                        @     Child Loop BB42_62 Depth 2
                                        @     Child Loop BB42_77 Depth 2
                                        @     Child Loop BB42_90 Depth 2
                                        @     Child Loop BB42_103 Depth 2
                                        @     Child Loop BB42_116 Depth 2
	ldr	r0, [sp, #32]                   @ 4-byte Reload
	str	r3, [sp, #44]                   @ 4-byte Spill
	cmp	r3, r0
	bls.w	.LBB42_67
@ %bb.45:                               @   in Loop: Header=BB42_44 Depth=1
	movs	r0, #0
	str	r0, [sp, #72]
	ldrd	r1, r0, [sp, #64]
	adds	r0, #1
	cmp	r0, r1
	str	r0, [sp, #68]
	blt.w	.LBB42_67
@ %bb.46:                               @   in Loop: Header=BB42_44 Depth=1
	ldrd	r4, r10, [sp, #48]
	ldrd	r7, r2, [sp, #56]
	cmp	r1, #2
	sub.w	r5, r1, #1
	blt.w	.LBB42_56
@ %bb.47:                               @   in Loop: Header=BB42_44 Depth=1
	subs	r0, r1, #2
	lsls	r6, r2, #2
	cmp	r0, #3
	and	r0, r5, #3
	str	r4, [sp, #24]                   @ 4-byte Spill
	strd	r2, r1, [sp, #16]               @ 8-byte Folded Spill
	strd	r0, r7, [sp, #8]                @ 8-byte Folded Spill
	bhs	.LBB42_49
@ %bb.48:                               @   in Loop: Header=BB42_44 Depth=1
	movs	r0, #0
	b	.LBB42_53
	.p2align	2
.LBB42_49:                              @   in Loop: Header=BB42_44 Depth=1
	bic	r0, r5, #3
	rsbs	r0, r0, #0
	str	r0, [sp, #36]                   @ 4-byte Spill
	rsb	r0, r7, r7, lsl #4
	lsls	r0, r0, #4
	add.w	r0, r0, r10, lsl #2
	add	r0, r4
	sub.w	r7, r0, #960
	mov.w	r9, #0
	.p2align	2
.LBB42_50:                              @   Parent Loop BB42_44 Depth=1
                                        @ =>  This Inner Loop Header: Depth=2
	add.w	r11, r7, #960
	add.w	r5, r7, #1200
	mov	r0, r11
	mov	r1, r5
	mov	r2, r6
	bl	__aeabi_memmove4
	add.w	r4, r7, #1440
	mov	r0, r5
	mov	r1, r4
	mov	r2, r6
	bl	__aeabi_memmove4
	add.w	r5, r7, #1680
	mov	r0, r4
	mov	r1, r5
	mov	r2, r6
	bl	__aeabi_memmove4
	add.w	r1, r7, #1920
	mov	r0, r5
	mov	r2, r6
	bl	__aeabi_memmove4
	ldr	r0, [sp, #36]                   @ 4-byte Reload
	sub.w	r9, r9, #4
	cmp	r0, r9
	mov	r7, r11
	bne	.LBB42_50
@ %bb.51:                               @   in Loop: Header=BB42_44 Depth=1
	ldr	r0, [sp, #8]                    @ 4-byte Reload
	ldrd	r1, r4, [sp, #20]               @ 8-byte Folded Reload
	ldrd	r11, r3, [sp, #40]              @ 8-byte Folded Reload
	ldrd	r7, r2, [sp, #12]               @ 8-byte Folded Reload
	sub.w	r5, r1, #1
	cbz	r0, .LBB42_56
@ %bb.52:                               @   in Loop: Header=BB42_44 Depth=1
	rsb.w	r0, r9, #0
.LBB42_53:                              @   in Loop: Header=BB42_44 Depth=1
	add	r0, r7
	rsb	r0, r0, r0, lsl #4
	add.w	r0, r4, r0, lsl #4
	add.w	r9, r0, r10, lsl #2
	add.w	r1, r9, #240
	mov	r0, r9
	mov	r2, r6
	bl	__aeabi_memmove4
	ldrd	r12, r7, [sp, #8]               @ 8-byte Folded Reload
	ldr	r1, [sp, #20]                   @ 4-byte Reload
	ldr	r4, [sp, #24]                   @ 4-byte Reload
	ldr	r3, [sp, #44]                   @ 4-byte Reload
	ldr	r2, [sp, #16]                   @ 4-byte Reload
	cmp.w	r12, #1
	sub.w	r5, r1, #1
	beq	.LBB42_56
@ %bb.54:                               @   in Loop: Header=BB42_44 Depth=1
	add.w	r1, r9, #480
	add.w	r0, r9, #240
	mov	r2, r6
	str	r1, [sp, #36]                   @ 4-byte Spill
	bl	__aeabi_memmove4
	ldr	r1, [sp, #20]                   @ 4-byte Reload
	ldr	r0, [sp, #8]                    @ 4-byte Reload
	ldrd	r7, r2, [sp, #12]               @ 8-byte Folded Reload
	ldr	r4, [sp, #24]                   @ 4-byte Reload
	ldr	r3, [sp, #44]                   @ 4-byte Reload
	subs	r5, r1, #1
	cmp	r0, #2
	beq	.LBB42_56
@ %bb.55:                               @   in Loop: Header=BB42_44 Depth=1
	ldr	r0, [sp, #36]                   @ 4-byte Reload
	add.w	r1, r9, #720
	mov	r2, r6
	bl	__aeabi_memmove4
	ldr	r1, [sp, #20]                   @ 4-byte Reload
	ldrd	r7, r2, [sp, #12]               @ 8-byte Folded Reload
	ldr	r4, [sp, #24]                   @ 4-byte Reload
	ldr	r3, [sp, #44]                   @ 4-byte Reload
	subs	r5, r1, #1
	.p2align	2
.LBB42_56:                              @   in Loop: Header=BB42_44 Depth=1
	cmp.w	r10, #0
	bmi.w	.LBB42_125
@ %bb.57:                               @   in Loop: Header=BB42_44 Depth=1
	add	r1, r7
	cmp	r1, #1
	blt.w	.LBB42_125
@ %bb.58:                               @   in Loop: Header=BB42_44 Depth=1
	cmp	r2, #1
	blt.w	.LBB42_125
@ %bb.59:                               @   in Loop: Header=BB42_44 Depth=1
	add.w	r0, r2, r10
	cmp	r0, #60
	bgt.w	.LBB42_125
@ %bb.60:                               @   in Loop: Header=BB42_44 Depth=1
	cmp	r1, #20
	bgt.w	.LBB42_125
@ %bb.61:                               @   in Loop: Header=BB42_44 Depth=1
	rsb	r1, r1, r1, lsl #4
	lsls	r1, r1, #4
	add.w	r1, r1, r10, lsl #2
	add	r1, r4
	ldr.w	r9, [sp, #28]                   @ 4-byte Reload
	subs	r1, #240
	.p2align	2
.LBB42_62:                              @   Parent Loop BB42_44 Depth=1
                                        @ =>  This Inner Loop Header: Depth=2
	add.w	r2, r10, #1
	cmp	r2, r0
	str.w	r8, [r1]
	bge	.LBB42_66
@ %bb.63:                               @   in Loop: Header=BB42_62 Depth=2
	add.w	r2, r10, #2
	cmp	r2, r0
	str.w	r8, [r1, #4]
	bge	.LBB42_66
@ %bb.64:                               @   in Loop: Header=BB42_62 Depth=2
	add.w	r2, r10, #3
	cmp	r2, r0
	str.w	r8, [r1, #8]
	bge	.LBB42_66
@ %bb.65:                               @   in Loop: Header=BB42_62 Depth=2
	add.w	r10, r10, #4
	str.w	r8, [r1, #12]
	cmp	r10, r0
	add.w	r1, r1, #16
	blt	.LBB42_62
.LBB42_66:                              @   in Loop: Header=BB42_44 Depth=1
	mov.w	r1, #4800
	ldr	r0, [r4, r1]
	ldr.w	r10, [sp, #4]                   @ 4-byte Reload
	adds	r0, #1
	str	r5, [sp, #68]
	str	r0, [r4, r1]
.LBB42_67:                              @   in Loop: Header=BB42_44 Depth=1
	ldr.w	r12, [r10]
	add.w	lr, r3, r3, lsl #1
	ldr.w	r0, [r12, lr, lsl #2]
	ldr.w	r7, [r9, #4]
	ldr	r2, [r0, #4]
	add.w	r5, r2, #64
	cmp	r5, r7
	bls	.LBB42_74
@ %bb.68:                               @   in Loop: Header=BB42_44 Depth=1
	cmp	r7, #0
	bne.w	.LBB42_124
@ %bb.69:                               @   in Loop: Header=BB42_44 Depth=1
	ldr.w	r7, [r9]
	cmp	r7, #0
	bne.w	.LBB42_124
@ %bb.70:                               @   in Loop: Header=BB42_44 Depth=1
	ldr.w	r7, [r11, #12]
	cmp	r7, #0
	beq.w	.LBB42_123
@ %bb.71:                               @   in Loop: Header=BB42_44 Depth=1
	ldrd	r4, r6, [r11, #16]
	adds	r6, #3
	bic	r6, r6, #3
	subs	r4, r4, r6
	blo.w	.LBB42_123
@ %bb.72:                               @   in Loop: Header=BB42_44 Depth=1
	add.w	r5, r2, r5, lsr #1
	adds	r5, #96
	cmp	r5, r4
	bhi.w	.LBB42_123
@ %bb.73:                               @   in Loop: Header=BB42_44 Depth=1
	ldrd	r1, r3, [r11]
	adds	r4, r6, r5
	str.w	r4, [r11, #20]
	adds	r4, r1, r5
	cmp	r4, r3
	str.w	r4, [r11]
	it	hi
	strhi.w	r4, [r11, #4]
	ldr.w	r1, [r11, #8]
	add	r6, r7
	adds	r1, #1
	str.w	r1, [r11, #8]
	strd	r6, r5, [r9]
	cmp	r2, #1
	add.w	r4, r12, lr, lsl #2
	bge	.LBB42_75
	b	.LBB42_42
	.p2align	2
.LBB42_74:                              @   in Loop: Header=BB42_44 Depth=1
	ldr.w	r6, [r9]
	cmp	r2, #1
	add.w	r4, r12, lr, lsl #2
	blt.w	.LBB42_42
.LBB42_75:                              @   in Loop: Header=BB42_44 Depth=1
	movs	r1, #0
	movs	r3, #0
	b	.LBB42_77
	.p2align	2
.LBB42_76:                              @   in Loop: Header=BB42_77 Depth=2
	adds	r3, #4
	cmp	r3, r2
	bge	.LBB42_88
.LBB42_77:                              @   Parent Loop BB42_44 Depth=1
                                        @ =>  This Inner Loop Header: Depth=2
	ldr	r7, [r0]
	ldrb	r7, [r7, r3]
	cmp	r7, #35
	beq	.LBB42_79
@ %bb.78:                               @   in Loop: Header=BB42_77 Depth=2
	strb	r7, [r6, r1]
	ldr	r2, [r0, #4]
	adds	r1, #1
.LBB42_79:                              @   in Loop: Header=BB42_77 Depth=2
	adds	r7, r3, #1
	cmp	r7, r2
	bge	.LBB42_88
@ %bb.80:                               @   in Loop: Header=BB42_77 Depth=2
	ldr	r7, [r0]
	add	r7, r3
	ldrb	r7, [r7, #1]
	cmp	r7, #35
	beq	.LBB42_82
@ %bb.81:                               @   in Loop: Header=BB42_77 Depth=2
	strb	r7, [r6, r1]
	ldr	r2, [r0, #4]
	adds	r1, #1
.LBB42_82:                              @   in Loop: Header=BB42_77 Depth=2
	adds	r7, r3, #2
	cmp	r7, r2
	bge	.LBB42_88
@ %bb.83:                               @   in Loop: Header=BB42_77 Depth=2
	ldr	r7, [r0]
	add	r7, r3
	ldrb	r7, [r7, #2]
	cmp	r7, #35
	beq	.LBB42_85
@ %bb.84:                               @   in Loop: Header=BB42_77 Depth=2
	strb	r7, [r6, r1]
	ldr	r2, [r0, #4]
	adds	r1, #1
.LBB42_85:                              @   in Loop: Header=BB42_77 Depth=2
	adds	r7, r3, #3
	cmp	r7, r2
	bge	.LBB42_88
@ %bb.86:                               @   in Loop: Header=BB42_77 Depth=2
	ldr	r7, [r0]
	add	r7, r3
	ldrb	r7, [r7, #3]
	cmp	r7, #35
	beq	.LBB42_76
@ %bb.87:                               @   in Loop: Header=BB42_77 Depth=2
	strb	r7, [r6, r1]
	ldr	r2, [r0, #4]
	adds	r1, #1
	b	.LBB42_76
	.p2align	2
.LBB42_88:                              @   in Loop: Header=BB42_44 Depth=1
	cmp	r1, #1
	blt	.LBB42_98
@ %bb.89:                               @   in Loop: Header=BB42_44 Depth=1
	rsbs	r2, r1, #0
	movs	r0, #3
.LBB42_90:                              @   Parent Loop BB42_44 Depth=1
                                        @ =>  This Inner Loop Header: Depth=2
	adds	r3, r6, r0
	ldrb	r7, [r3, #-3]
	cmp	r7, #32
	bne	.LBB42_99
@ %bb.91:                               @   in Loop: Header=BB42_90 Depth=2
	adds	r7, r2, r0
	cmp	r7, #2
	beq.w	.LBB42_42
@ %bb.92:                               @   in Loop: Header=BB42_90 Depth=2
	ldrb	r5, [r3, #-2]
	cmp	r5, #32
	bne	.LBB42_100
@ %bb.93:                               @   in Loop: Header=BB42_90 Depth=2
	cmp	r7, #1
	beq.w	.LBB42_42
@ %bb.94:                               @   in Loop: Header=BB42_90 Depth=2
	ldrb	r3, [r3, #-1]
	cmp	r3, #32
	bne	.LBB42_111
@ %bb.95:                               @   in Loop: Header=BB42_90 Depth=2
	cmp	r1, r0
	beq.w	.LBB42_42
@ %bb.96:                               @   in Loop: Header=BB42_90 Depth=2
	ldrb	r3, [r6, r0]
	cmp	r3, #32
	bne	.LBB42_101
@ %bb.97:                               @   in Loop: Header=BB42_90 Depth=2
	adds	r0, #4
	adds	r3, r2, r0
	cmp	r3, #3
	bne	.LBB42_90
	b	.LBB42_42
	.p2align	2
.LBB42_98:                              @   in Loop: Header=BB42_44 Depth=1
	movs	r0, #0
	cmp	r0, r1
	bge.w	.LBB42_42
	b	.LBB42_113
	.p2align	2
.LBB42_99:                              @   in Loop: Header=BB42_44 Depth=1
	subs	r0, #3
	cmp	r1, r0
	bgt	.LBB42_102
	b	.LBB42_112
	.p2align	2
.LBB42_100:                             @   in Loop: Header=BB42_44 Depth=1
	subs	r0, #2
.LBB42_101:                             @   in Loop: Header=BB42_44 Depth=1
	cmp	r1, r0
	ble	.LBB42_112
.LBB42_102:                             @   in Loop: Header=BB42_44 Depth=1
	subs	r2, r6, #2
.LBB42_103:                             @   Parent Loop BB42_44 Depth=1
                                        @ =>  This Inner Loop Header: Depth=2
	adds	r3, r2, r1
	ldrb	r7, [r3, #1]
	cmp	r7, #32
	bne	.LBB42_112
@ %bb.104:                              @   in Loop: Header=BB42_103 Depth=2
	subs	r7, r1, #1
	cmp	r7, r0
	ble.w	.LBB42_42
@ %bb.105:                              @   in Loop: Header=BB42_103 Depth=2
	ldrb	r5, [r2, r1]
	cmp	r5, #32
	bne	.LBB42_121
@ %bb.106:                              @   in Loop: Header=BB42_103 Depth=2
	subs	r7, r1, #2
	cmp	r7, r0
	ble.w	.LBB42_42
@ %bb.107:                              @   in Loop: Header=BB42_103 Depth=2
	ldrb	r5, [r3, #-1]
	cmp	r5, #32
	bne	.LBB42_121
@ %bb.108:                              @   in Loop: Header=BB42_103 Depth=2
	subs	r7, r1, #3
	cmp	r7, r0
	ble.w	.LBB42_42
@ %bb.109:                              @   in Loop: Header=BB42_103 Depth=2
	ldrb	r3, [r3, #-2]
	cmp	r3, #32
	bne	.LBB42_121
@ %bb.110:                              @   in Loop: Header=BB42_103 Depth=2
	subs	r1, #4
	cmp	r1, r0
	mov.w	r7, #0
	bgt	.LBB42_103
	b	.LBB42_43
	.p2align	2
.LBB42_111:                             @   in Loop: Header=BB42_44 Depth=1
	subs	r0, #1
	cmp	r1, r0
	bgt	.LBB42_102
	.p2align	2
.LBB42_112:                             @   in Loop: Header=BB42_44 Depth=1
	cmp	r0, r1
	bge.w	.LBB42_42
.LBB42_113:                             @   in Loop: Header=BB42_44 Depth=1
	subs	r2, r1, r0
	subs	r1, r0, r1
	cmn.w	r1, #4
	and	r1, r2, #3
	bls	.LBB42_115
@ %bb.114:                              @   in Loop: Header=BB42_44 Depth=1
	movs	r7, #0
	b	.LBB42_118
	.p2align	2
.LBB42_115:                             @   in Loop: Header=BB42_44 Depth=1
	bic	r2, r2, #3
	movs	r7, #0
	.p2align	2
.LBB42_116:                             @   Parent Loop BB42_44 Depth=1
                                        @ =>  This Inner Loop Header: Depth=2
	ldrb	r3, [r6, r0]
	cmp	r3, #126
	itt	ne
	strbne	r3, [r6, r7]
	addne	r7, #1
	adds	r3, r6, r0
	ldrb	r5, [r3, #1]
	adds	r0, #4
	cmp	r5, #126
	itt	ne
	strbne	r5, [r6, r7]
	addne	r7, #1
	ldrb	r5, [r3, #2]
	cmp	r5, #126
	itt	ne
	strbne	r5, [r6, r7]
	addne	r7, #1
	ldrb	r3, [r3, #3]
	cmp	r3, #126
	itt	ne
	strbne	r3, [r6, r7]
	addne	r7, #1
	subs	r2, #4
	bne	.LBB42_116
@ %bb.117:                              @   in Loop: Header=BB42_44 Depth=1
	cmp	r1, #0
	beq.w	.LBB42_43
.LBB42_118:                             @   in Loop: Header=BB42_44 Depth=1
	ldrb	r2, [r6, r0]
	cmp	r2, #126
	itt	ne
	strbne	r2, [r6, r7]
	addne	r7, #1
	cmp	r1, #1
	beq.w	.LBB42_43
@ %bb.119:                              @   in Loop: Header=BB42_44 Depth=1
	add	r0, r6
	ldrb	r2, [r0, #1]
	cmp	r2, #126
	itt	ne
	strbne	r2, [r6, r7]
	addne	r7, #1
	cmp	r1, #2
	beq.w	.LBB42_43
@ %bb.120:                              @   in Loop: Header=BB42_44 Depth=1
	ldrb	r0, [r0, #2]
	cmp	r0, #126
	itt	ne
	strbne	r0, [r6, r7]
	addne	r7, #1
	b	.LBB42_43
	.p2align	2
.LBB42_121:                             @   in Loop: Header=BB42_44 Depth=1
	mov	r1, r7
	cmp	r0, r1
	bge.w	.LBB42_42
	b	.LBB42_113
	.p2align	2
.LBB42_122:
	add	sp, #76
	pop.w	{r4, r5, r6, r7, r8, r9, r10, r11, pc}
	.p2align	2
.LBB42_123:
	movw	r0, :lower16:.L.str.2
	movt	r0, :upper16:.L.str.2
	bl	credits_private_credits_fail
	.p2align	2
.LBB42_124:
	movw	r0, :lower16:.L.str.1
	movt	r0, :upper16:.L.str.1
	bl	credits_private_credits_fail
	.p2align	2
.LBB42_125:
	movw	r0, :lower16:.L.str.163
	movt	r0, :upper16:.L.str.163
	bl	credits_private_credits_fail
.Lfunc_end42:
	.size	credits_private_credits60_history, .Lfunc_end42-credits_private_credits60_history
	.cantunwind
	.fnend
                                        @ -- End function
	.globl	credits_private_canvas_clear    @ -- Begin function credits_private_canvas_clear
	.p2align	1
	.prefalign	2, .Lfunc_end43, nop
	.type	credits_private_canvas_clear,%function
	.code	16
	.thumb_func
credits_private_canvas_clear:           @ @credits_private_canvas_clear
	.fnstart
@ %bb.0:
	movw	r1, #65056
	movs	r2, #32
	movt	r1, #65535
	movt	r2, #3175
	.p2align	2
.LBB43_1:                               @ =>This Inner Loop Header: Depth=1
	adds	r3, r0, r1
	add.w	r1, r1, #480
	cmp.w	r1, #4320
	strd	r2, r2, [r3, #480]
	strd	r2, r2, [r3, #488]
	strd	r2, r2, [r3, #496]
	strd	r2, r2, [r3, #504]
	strd	r2, r2, [r3, #512]
	strd	r2, r2, [r3, #520]
	strd	r2, r2, [r3, #528]
	strd	r2, r2, [r3, #536]
	strd	r2, r2, [r3, #544]
	strd	r2, r2, [r3, #552]
	strd	r2, r2, [r3, #560]
	strd	r2, r2, [r3, #568]
	strd	r2, r2, [r3, #576]
	strd	r2, r2, [r3, #584]
	strd	r2, r2, [r3, #592]
	strd	r2, r2, [r3, #600]
	strd	r2, r2, [r3, #608]
	strd	r2, r2, [r3, #616]
	strd	r2, r2, [r3, #624]
	strd	r2, r2, [r3, #632]
	strd	r2, r2, [r3, #640]
	strd	r2, r2, [r3, #648]
	strd	r2, r2, [r3, #656]
	strd	r2, r2, [r3, #664]
	strd	r2, r2, [r3, #672]
	strd	r2, r2, [r3, #680]
	strd	r2, r2, [r3, #688]
	strd	r2, r2, [r3, #696]
	strd	r2, r2, [r3, #704]
	strd	r2, r2, [r3, #712]
	strd	r2, r2, [r3, #720]
	strd	r2, r2, [r3, #728]
	strd	r2, r2, [r3, #736]
	strd	r2, r2, [r3, #744]
	strd	r2, r2, [r3, #752]
	strd	r2, r2, [r3, #760]
	strd	r2, r2, [r3, #768]
	strd	r2, r2, [r3, #776]
	strd	r2, r2, [r3, #784]
	strd	r2, r2, [r3, #792]
	strd	r2, r2, [r3, #800]
	strd	r2, r2, [r3, #808]
	strd	r2, r2, [r3, #816]
	strd	r2, r2, [r3, #824]
	strd	r2, r2, [r3, #832]
	strd	r2, r2, [r3, #840]
	strd	r2, r2, [r3, #848]
	strd	r2, r2, [r3, #856]
	strd	r2, r2, [r3, #864]
	strd	r2, r2, [r3, #872]
	strd	r2, r2, [r3, #880]
	strd	r2, r2, [r3, #888]
	strd	r2, r2, [r3, #896]
	strd	r2, r2, [r3, #904]
	strd	r2, r2, [r3, #912]
	strd	r2, r2, [r3, #920]
	strd	r2, r2, [r3, #928]
	strd	r2, r2, [r3, #936]
	strd	r2, r2, [r3, #944]
	str.w	r2, [r3, #952]
	str.w	r2, [r3, #956]
	bne.w	.LBB43_1
@ %bb.2:
	movw	r1, #4808
	movs	r2, #49
	str	r2, [r0, r1]
	bx	lr
.Lfunc_end43:
	.size	credits_private_canvas_clear, .Lfunc_end43-credits_private_canvas_clear
	.cantunwind
	.fnend
                                        @ -- End function
	.globl	credits_private_credits_ocean_begin @ -- Begin function credits_private_credits_ocean_begin
	.p2align	1
	.prefalign	2, .Lfunc_end44, nop
	.type	credits_private_credits_ocean_begin,%function
	.code	16
	.thumb_func
credits_private_credits_ocean_begin:    @ @credits_private_credits_ocean_begin
	.fnstart
@ %bb.0:
	.save	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	push.w	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	.pad	#36
	sub	sp, #36
	movw	r2, #4840
	adds	r3, r0, r2
	mov	r4, r1
	movw	r1, #9796
	str	r3, [sp, #28]                   @ 4-byte Spill
	ldr.w	r3, [r3, #2496]
	ldr	r2, [r0, r1]
	cmp.w	r3, #624
	add.w	r6, r0, r1
	str.w	r2, [r4, #488]
	str	r0, [sp, #24]                   @ 4-byte Spill
	blt.w	.LBB44_4
@ %bb.1:
	ldr	r0, [sp, #28]                   @ 4-byte Reload
	ldr	r1, [sp, #24]                   @ 4-byte Reload
	ldr.w	r12, [r0]
	addw	r0, r1, #2492
	str	r0, [sp, #12]                   @ 4-byte Spill
	movw	r0, #4856
	add	r0, r1
	str	r0, [sp, #20]                   @ 4-byte Spill
	movw	r0, #4852
	add	r0, r1
	str	r0, [sp, #16]                   @ 4-byte Spill
	movw	r0, #4848
	ldr.w	lr, [sp, #12]                   @ 4-byte Reload
	movw	r11, #45279
	strd	r6, r4, [sp]                    @ 8-byte Folded Spill
	add	r0, r1
	mov.w	r8, #0
	movs	r6, #0
	movt	r11, #39176
	str	r0, [sp, #8]                    @ 4-byte Spill
	.p2align	2
.LBB44_2:                               @ =>This Inner Loop Header: Depth=1
	movw	r9, #64628
	movt	r9, #65535
	add.w	r3, lr, r6
	add.w	r10, lr, r8, lsl #2
	mov	r4, r9
	str	r3, [sp, #32]                   @ 4-byte Spill
	ldr.w	r0, [r10, #2352]
	cmp.w	r8, #227
	it	lo
	movwlo	r4, #1588
	ldr	r2, [sp, #28]                   @ 4-byte Reload
	and	r7, r12, #-2147483648
	movw	r12, #65534
	movt	r12, #32767
	add	r4, r2
	and.w	r1, r0, r12
	ldr.w	r4, [r4, r8, lsl #2]
	add	r1, r7
	eor.w	r1, r4, r1, lsr #1
	lsls	r7, r0, #31
	it	ne
	eorne.w	r1, r1, r11
	str.w	r1, [r3, #2348]
	ldr	r3, [sp, #8]                    @ 4-byte Reload
	mov	r2, r9
	ldr.w	r1, [r3, r8, lsl #2]
	cmp.w	r8, #226
	it	lo
	movwlo	r2, #1588
	add	r2, lr
	add.w	r2, r2, r8, lsl #2
	and	r0, r0, #-2147483648
	and.w	r4, r1, r12
	ldr.w	r2, [r2, #2352]
	add	r0, r4
	eor.w	r0, r2, r0, lsr #1
	lsls	r2, r1, #31
	it	ne
	eorne.w	r0, r0, r11
	ldr	r5, [sp, #16]                   @ 4-byte Reload
	mov	r4, r9
	ldr.w	r2, [r5, r8, lsl #2]
	add.w	r7, r3, r8, lsl #2
	str.w	r0, [r10, #2352]
	cmp.w	r8, #225
	it	lo
	movwlo	r4, #1588
	and	r0, r1, #-2147483648
	ldr	r7, [r7, r4]
	and.w	r4, r2, r12
	add	r0, r4
	eor.w	r0, r7, r0, lsr #1
	lsls	r7, r2, #31
	it	ne
	eorne.w	r0, r0, r11
	str.w	r0, [r3, r8, lsl #2]
	ldr	r3, [sp, #20]                   @ 4-byte Reload
	mov	r4, r9
	ldr.w	r7, [r3, r8, lsl #2]
	add.w	r1, r5, r8, lsl #2
	cmp.w	r8, #224
	it	lo
	movwlo	r4, #1588
	and	r0, r2, #-2147483648
	ldr	r1, [r1, r4]
	and.w	r4, r7, r12
	add	r0, r4
	eor.w	r0, r1, r0, lsr #1
	lsls	r1, r7, #31
	it	ne
	eorne.w	r0, r0, r11
	ldr.w	r1, [r10, #2368]
	add.w	r2, r3, r8, lsl #2
	mov	r4, r9
	str.w	r0, [r5, r8, lsl #2]
	and	r0, r7, #-2147483648
	and.w	r7, r1, r12
	cmp.w	r8, #223
	it	lo
	movwlo	r4, #1588
	ldr	r2, [r2, r4]
	add	r0, r7
	eor.w	r0, r2, r0, lsr #1
	lsls	r2, r1, #31
	it	ne
	eorne.w	r0, r0, r11
	str.w	r0, [r3, r8, lsl #2]
	ldr	r0, [sp, #24]                   @ 4-byte Reload
	mov.w	r3, #4864
	add.w	r0, r0, r8, lsl #2
	mov	r4, r9
	ldr	r2, [r0, r3]
	cmp.w	r8, #222
	it	lo
	movwlo	r4, #1588
	add	r4, lr
	add.w	r4, r4, r8, lsl #2
	and	r1, r1, #-2147483648
	and.w	r7, r2, r12
	ldr.w	r4, [r4, #2368]
	add	r1, r7
	eor.w	r1, r4, r1, lsr #1
	lsls	r7, r2, #31
	it	ne
	eorne.w	r1, r1, r11
	ldr	r7, [sp, #32]                   @ 4-byte Reload
	str.w	r1, [r10, #2368]
	mov	r5, r12
	ldr.w	r12, [r7, #2376]
	add.w	r1, r0, #4864
	and	r2, r2, #-2147483648
	cmp.w	r8, #221
	it	lo
	movwlo	r9, #1588
	ldr.w	r1, [r1, r9]
	and.w	r7, r12, r5
	add	r2, r7
	eor.w	r1, r1, r2, lsr #1
	lsls.w	r2, r12, #31
	it	ne
	eorne.w	r1, r1, r11
	str	r1, [r0, r3]
	add.w	r8, r8, #7
	movw	r0, #623
	cmp	r8, r0
	add.w	r6, r6, #28
	bne.w	.LBB44_2
@ %bb.3:
	ldr	r2, [sp, #28]                   @ 4-byte Reload
	movw	r3, #65534
	ldr.w	r0, [r2, #2492]
	ldr	r1, [r2]
	movt	r3, #32767
	and	r0, r0, #-2147483648
	ands	r3, r1
	ldr.w	r7, [r2, #1584]
	add	r0, r3
	lsls	r1, r1, #31
	eor.w	r0, r7, r0, lsr #1
	movw	r1, #45279
	movt	r1, #39176
	it	ne
	eorne	r0, r1
	ldrd	r6, r4, [sp]                    @ 8-byte Folded Reload
	movs	r3, #0
	str.w	r0, [r2, #2492]
.LBB44_4:
	ldr	r5, [sp, #28]                   @ 4-byte Reload
	adds	r1, r3, #1
	str.w	r1, [r5, #2496]
	ldr.w	r0, [r5, r3, lsl #2]
	movw	r1, #22144
	eor.w	r0, r0, r0, lsr #11
	movt	r1, #40236
	and.w	r1, r1, r0, lsl #7
	eors	r0, r1
	movs	r1, #0
	ldr.w	r3, [r5, #2504]
	movt	r1, #61382
	ldr.w	r7, [r5, #2508]
	and.w	r1, r1, r0, lsl #15
	adds	r3, #1
	eor.w	r2, r1, r0
	adc	r7, r7, #0
	eor.w	r2, r2, r2, lsr #18
	str.w	r3, [r5, #2504]
	str.w	r7, [r5, #2508]
	movs	r5, #0
	cmp	r1, r0
	itt	eq
	movweq	r2, #31161
	movteq	r2, #40503
	str.w	r2, [r4, #492]
	.p2align	2
.LBB44_5:                               @ =>This Inner Loop Header: Depth=1
	mov	r0, r4
	mov	r1, r5
	movs	r2, #1
	bl	credits_private_ocean60_column
	adds	r5, #1
	cmp	r5, #60
	bne	.LBB44_5
@ %bb.6:
	ldr.w	r0, [r4, #488]
	str	r0, [r6]
	add	sp, #36
	pop.w	{r4, r5, r6, r7, r8, r9, r10, r11, pc}
.Lfunc_end44:
	.size	credits_private_credits_ocean_begin, .Lfunc_end44-credits_private_credits_ocean_begin
	.cantunwind
	.fnend
                                        @ -- End function
	.globl	credits_private_canvas60_clear_region @ -- Begin function credits_private_canvas60_clear_region
	.p2align	1
	.prefalign	2, .Lfunc_end45, nop
	.type	credits_private_canvas60_clear_region,%function
	.code	16
	.thumb_func
credits_private_canvas60_clear_region:  @ @credits_private_canvas60_clear_region
	.fnstart
@ %bb.0:
	.save	{r4, r5, r6, r7, lr}
	push	{r4, r5, r6, r7, lr}
	.pad	#4
	sub	sp, #4
	cmp	r1, #0
	bmi	.LBB45_14
@ %bb.1:
	cmp	r2, #0
	bmi	.LBB45_14
@ %bb.2:
	cmp	r3, #1
	blt	.LBB45_14
@ %bb.3:
	ldr	r6, [sp, #24]
	cmp	r6, #1
	blt	.LBB45_14
@ %bb.4:
	add	r3, r1
	cmp	r3, #60
	bgt	.LBB45_14
@ %bb.5:
	add.w	r12, r2, r6
	cmp.w	r12, #20
	bgt	.LBB45_14
@ %bb.6:
	rsb	r5, r2, r2, lsl #4
	lsls	r6, r5, #4
	adds	r4, r1, #1
	add.w	r1, r6, r1, lsl #2
	movw	lr, #32
	add	r1, r0
	movt	lr, #3175
	adds	r1, #8
	add.w	r0, r0, r5, lsl #4
	b	.LBB45_8
	.p2align	2
.LBB45_7:                               @   in Loop: Header=BB45_8 Depth=1
	adds	r2, #1
	adds	r1, #240
	cmp	r2, r12
	add.w	r0, r0, #240
	bge	.LBB45_13
.LBB45_8:                               @ =>This Loop Header: Depth=1
                                        @     Child Loop BB45_9 Depth 2
	mov	r5, r1
	mov	r6, r4
	.p2align	2
.LBB45_9:                               @   Parent Loop BB45_8 Depth=1
                                        @ =>  This Inner Loop Header: Depth=2
	cmp	r6, r3
	str	lr, [r5, #-8]
	bge	.LBB45_7
@ %bb.10:                               @   in Loop: Header=BB45_9 Depth=2
	adds	r7, r6, #1
	cmp	r7, r3
	str.w	lr, [r0, r6, lsl #2]
	bge	.LBB45_7
@ %bb.11:                               @   in Loop: Header=BB45_9 Depth=2
	adds	r7, r6, #2
	cmp	r7, r3
	str.w	lr, [r5]
	bge	.LBB45_7
@ %bb.12:                               @   in Loop: Header=BB45_9 Depth=2
	adds	r7, r6, #3
	str.w	lr, [r5, #4]
	adds	r6, #4
	adds	r5, #16
	cmp	r7, r3
	blt	.LBB45_9
	b	.LBB45_7
	.p2align	2
.LBB45_13:
	add	sp, #4
	pop	{r4, r5, r6, r7, pc}
	.p2align	2
.LBB45_14:
	movw	r0, :lower16:.L.str.163
	movt	r0, :upper16:.L.str.163
	bl	credits_private_credits_fail
.Lfunc_end45:
	.size	credits_private_canvas60_clear_region, .Lfunc_end45-credits_private_canvas60_clear_region
	.cantunwind
	.fnend
                                        @ -- End function
	.globl	credits_private_weather_mutate  @ -- Begin function credits_private_weather_mutate
	.p2align	2
	.type	credits_private_weather_mutate,%function
	.code	16
	.thumb_func
credits_private_weather_mutate:         @ @credits_private_weather_mutate
	.fnstart
@ %bb.0:
	.save	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	push.w	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	.pad	#4
	sub	sp, #4
	.vsave	{d8, d9, d10, d11, d12, d13, d14, d15}
	vpush	{d8, d9, d10, d11, d12, d13, d14, d15}
	.pad	#32
	sub	sp, #32
	cmp	r2, #0
	str	r2, [sp, #4]                    @ 4-byte Spill
	str	r0, [sp, #20]                   @ 4-byte Spill
	ble.w	.LBB46_58
@ %bb.1:
	movw	lr, #22144
	movw	r8, #45279
	movw	r9, #65534
	addw	r0, r1, #2504
	ldr.w	r2, [r1, #2496]
	ldr.w	r6, [r1, #2504]
	ldr.w	r5, [r1, #2508]
	movw	r11, #64628
	vldr	s20, .LCPI46_15
	vldr	s22, .LCPI46_16
	vldr	s24, .LCPI46_17
	vldr	s28, .LCPI46_18
	vldr	s25, .LCPI46_19
	vldr	s27, .LCPI46_20
	vldr	s29, .LCPI46_21
	mov	r10, r1
	movt	lr, #40236
	movt	r8, #39176
	movt	r9, #32767
	str	r0, [sp, #16]                   @ 4-byte Spill
	movs	r0, #0
	movt	r11, #65535
	vmov.f32	s26, #1.000000e+00
	vmov.f32	s30, #1.300000e+01
	vmov.f32	s17, #1.500000e+01
	vmov.f32	s19, #3.000000e+00
	vmov.f32	s21, #2.000000e+01
	vmov.f32	s23, #5.000000e+00
	vmov.f32	s31, #5.000000e-01
	str	r0, [sp, #12]                   @ 4-byte Spill
	b	.LBB46_3
	.p2align	2
.LBB46_2:                               @   in Loop: Header=BB46_3 Depth=1
	adds	r1, r2, #1
	str.w	r1, [r10, #2496]
	ldr.w	r0, [r10, r2, lsl #2]
	adds	r6, #1
	eor.w	r0, r0, r0, lsr #11
	and.w	r2, lr, r0, lsl #7
	eor.w	r0, r0, r2
	and	r2, r0, #122368
	eor.w	r0, r0, r2, lsl #15
	lsr.w	r2, r0, #24
	adc	r5, r5, #0
	cmp	r2, #200
	mov	r2, r1
	bls.w	.LBB46_7
.LBB46_3:                               @ =>This Loop Header: Depth=1
                                        @     Child Loop BB46_5 Depth 2
                                        @     Child Loop BB46_9 Depth 2
                                        @     Child Loop BB46_20 Depth 2
                                        @       Child Loop BB46_22 Depth 3
                                        @     Child Loop BB46_26 Depth 2
                                        @       Child Loop BB46_28 Depth 3
                                        @     Child Loop BB46_32 Depth 2
                                        @     Child Loop BB46_35 Depth 2
                                        @       Child Loop BB46_37 Depth 3
                                        @     Child Loop BB46_41 Depth 2
                                        @     Child Loop BB46_45 Depth 2
                                        @       Child Loop BB46_47 Depth 3
                                        @     Child Loop BB46_50 Depth 2
                                        @     Child Loop BB46_53 Depth 2
                                        @       Child Loop BB46_55 Depth 3
	cmp.w	r2, #624
	blt	.LBB46_2
@ %bb.4:                                @   in Loop: Header=BB46_3 Depth=1
	ldr.w	r0, [r10]
	movs	r7, #0
	sub.w	lr, r10, #28
	strd	r5, r6, [sp, #24]               @ 8-byte Folded Spill
	.p2align	2
.LBB46_5:                               @   Parent Loop BB46_3 Depth=1
                                        @ =>  This Inner Loop Header: Depth=2
	add.w	r3, r10, r7, lsl #2
	ldr	r1, [r3, #4]
	mov	r4, r11
	cmp	r7, #227
	it	lo
	movwlo	r4, #1588
	and	r0, r0, #-2147483648
	and.w	r6, r1, r9
	ldr	r4, [r3, r4]
	add	r0, r6
	eor.w	r0, r4, r0, lsr #1
	lsls	r4, r1, #31
	it	ne
	eorne.w	r0, r0, r8
	str	r0, [lr, #28]!
	ldrd	r4, r6, [r3, #8]
	and	r0, r1, #-2147483648
	and.w	r12, r4, r9
	add.w	r5, r12, r0
	mov	r0, r11
	ldr	r1, [r3, #16]
	cmp	r7, #226
	it	lo
	movwlo	r0, #1588
	add	r0, r3
	ldr	r2, [r0, #4]
	ldr	r0, [r3, #20]
	eor.w	r2, r2, r5, lsr #1
	lsls	r5, r4, #31
	it	ne
	eorne.w	r2, r2, r8
	str	r2, [r3, #4]
	and	r2, r4, #-2147483648
	mov	r4, r11
	cmp	r7, #225
	it	lo
	movwlo	r4, #1588
	add	r4, r3
	and.w	r5, r6, r9
	ldr	r4, [r4, #8]
	add	r2, r5
	lsls	r5, r6, #31
	eor.w	r2, r4, r2, lsr #1
	mov	r5, r11
	it	ne
	eorne.w	r2, r2, r8
	str	r2, [r3, #8]
	cmp	r7, #224
	it	lo
	movwlo	r5, #1588
	add	r5, r3
	and	r2, r6, #-2147483648
	and.w	r6, r1, r9
	ldr	r5, [r5, #12]
	add	r2, r6
	lsls	r6, r1, #31
	eor.w	r2, r5, r2, lsr #1
	mov	r6, r11
	it	ne
	eorne.w	r2, r2, r8
	str	r2, [r3, #12]
	cmp	r7, #223
	it	lo
	movwlo	r6, #1588
	add	r6, r3
	and	r1, r1, #-2147483648
	and.w	r2, r0, r9
	ldr	r6, [r6, #16]
	add	r1, r2
	eor.w	r1, r6, r1, lsr #1
	lsls	r2, r0, #31
	it	ne
	eorne.w	r1, r1, r8
	mov	r6, r11
	str	r1, [r3, #16]
	ldr	r1, [r3, #24]
	cmp	r7, #222
	it	lo
	movwlo	r6, #1588
	add	r6, r3
	and	r0, r0, #-2147483648
	and.w	r2, r1, r9
	ldr	r6, [r6, #20]
	add	r0, r2
	eor.w	r0, r6, r0, lsr #1
	lsls	r2, r1, #31
	it	ne
	eorne.w	r0, r0, r8
	str	r0, [r3, #20]
	mov	r6, r11
	ldr.w	r0, [lr, #28]
	cmp	r7, #221
	it	lo
	movwlo	r6, #1588
	add	r6, r3
	and	r1, r1, #-2147483648
	and.w	r2, r0, r9
	ldr	r6, [r6, #24]
	add	r1, r2
	lsls	r2, r0, #31
	add.w	r7, r7, #7
	eor.w	r1, r6, r1, lsr #1
	movw	r2, #623
	it	ne
	eorne.w	r1, r1, r8
	cmp	r7, r2
	str	r1, [r3, #24]
	bne.w	.LBB46_5
@ %bb.6:                                @   in Loop: Header=BB46_3 Depth=1
	ldr.w	r0, [r10, #2492]
	ldr.w	r1, [r10]
	and	r0, r0, #-2147483648
	and.w	r2, r1, r9
	ldr.w	r3, [r10, #1584]
	add	r0, r2
	eor.w	r0, r3, r0, lsr #1
	lsls	r1, r1, #31
	it	ne
	eorne.w	r0, r0, r8
	movw	lr, #22144
	ldrd	r5, r6, [sp, #24]               @ 8-byte Folded Reload
	movs	r2, #0
	movt	lr, #40236
	str.w	r0, [r10, #2492]
	b	.LBB46_2
	.p2align	2
.LBB46_7:                               @   in Loop: Header=BB46_3 Depth=1
	ldr	r1, [sp, #20]                   @ 4-byte Reload
	vldr	s0, [r1]
	vsub.f32	s0, s20, s0
	vcmp.f32	s0, #0
	vneg.f32	s2, s0
	vmrs	APSR_nzcv, fpscr
	it	mi
	vmovmi.f32	s0, s2
	vmul.f32	s0, s0, s22
	vcvt.s32.f32	s0, s0
	vmov	r1, s0
	ldr	r2, [sp, #16]                   @ 4-byte Reload
	cmp.w	r1, #-1
	strd	r6, r5, [r2]
	ble.w	.LBB46_78
@ %bb.8:                                @   in Loop: Header=BB46_3 Depth=1
	mvn	r2, #99
	add.w	r0, r2, r0, lsr #24
	vmov	s0, r0
	vldr	s2, .LCPI46_22
	vcvt.f32.s32	s0, s0
	vdiv.f32	s16, s0, s2
	adds	r6, r1, #1
	clz	r0, r6
	rsb.w	r7, r0, #32
	.p2align	2
.LBB46_9:                               @   Parent Loop BB46_3 Depth=1
                                        @ =>  This Inner Loop Header: Depth=2
	mov	r0, r10
	mov	r1, r7
	bl	credits_private_random_bits
	subs	r2, r0, r6
	sbcs	r1, r1, #0
	bhs	.LBB46_9
@ %bb.10:                               @   in Loop: Header=BB46_3 Depth=1
	vmov	s0, r0
	vcvt.f32.u32	s0, s0
	vdiv.f32	s0, s0, s24
	ldr	r0, [sp, #20]                   @ 4-byte Reload
	movw	lr, #22144
	vldr	s2, [r0]
	movt	lr, #40236
	vcmp.f32	s2, s20
	vmrs	APSR_nzcv, fpscr
	vneg.f32	s4, s0
	it	gt
	vmovgt.f32	s0, s4
	vadd.f32	s0, s16, s0
	vadd.f32	s0, s2, s0
	vcmp.f32	s0, s26
	vmrs	APSR_nzcv, fpscr
	vcmp.f32	s0, #0
	it	gt
	vmovgt.f32	s0, s26
	vmrs	APSR_nzcv, fpscr
	it	mi
	vmovmi.f32	s0, s28
	ldr	r1, [r0, #20]
	ldr.w	r2, [r10, #2496]
	str	r1, [sp, #8]                    @ 4-byte Spill
	ldr	r1, [sp, #16]                   @ 4-byte Reload
	vstr	s0, [r0]
	ldrd	r3, r7, [r1]
	b	.LBB46_20
	.p2align	2
@ %bb.11:
.LCPI46_15:
	.long	0x3ea8f5c3                      @ float 0.330000013
	.p2align	2
@ %bb.12:
.LCPI46_16:
	.long	0x42c80000                      @ float 100
	.p2align	2
@ %bb.13:
.LCPI46_17:
	.long	0x43480000                      @ float 200
	.p2align	2
@ %bb.14:
.LCPI46_18:
	.long	0x00000000                      @ float 0
	.p2align	2
@ %bb.15:
.LCPI46_19:
	.long	0x43fa0000                      @ float 500
	.p2align	2
@ %bb.16:
.LCPI46_20:
	.long	0x3e4ccccd                      @ float 0.200000003
	.p2align	2
@ %bb.17:
.LCPI46_21:
	.long	0x3c23d70a                      @ float 0.00999999977
	.p2align	2
@ %bb.18:
.LCPI46_22:
	.long	0x43c80000                      @ float 400
	.p2align	2
.LBB46_19:                              @   in Loop: Header=BB46_20 Depth=2
	mov	r0, r2
	adds	r2, #1
	str.w	r2, [r10, #2496]
	ldr.w	r0, [r10, r0, lsl #2]
	adds	r3, #1
	eor.w	r0, r0, r0, lsr #11
	and.w	r1, lr, r0, lsl #7
	eor.w	r0, r0, r1
	eor.w	r0, r0, r0, lsl #15
	lsr.w	r0, r0, #29
	adc	r7, r7, #0
	cmp	r0, #7
	bne.w	.LBB46_24
.LBB46_20:                              @   Parent Loop BB46_3 Depth=1
                                        @ =>  This Loop Header: Depth=2
                                        @       Child Loop BB46_22 Depth 3
	cmp.w	r2, #624
	blt	.LBB46_19
@ %bb.21:                               @   in Loop: Header=BB46_20 Depth=2
	ldr.w	r0, [r10]
	strd	r7, r3, [sp, #24]               @ 8-byte Folded Spill
	movs	r2, #0
	sub.w	r3, r10, #28
	.p2align	2
.LBB46_22:                              @   Parent Loop BB46_3 Depth=1
                                        @     Parent Loop BB46_20 Depth=2
                                        @ =>    This Inner Loop Header: Depth=3
	add.w	r7, r10, r2, lsl #2
	ldr	r1, [r7, #4]
	mov	r5, r11
	cmp	r2, #227
	it	lo
	movwlo	r5, #1588
	and	r0, r0, #-2147483648
	and.w	r6, r1, r9
	ldr	r5, [r7, r5]
	add	r0, r6
	eor.w	r0, r5, r0, lsr #1
	lsls	r6, r1, #31
	it	ne
	eorne.w	r0, r0, r8
	str	r0, [r3, #28]!
	and	r0, r1, #-2147483648
	ldrd	r5, r1, [r7, #8]
	ldr.w	r12, [r7, #16]
	and.w	r6, r5, r9
	add	r6, r0
	mov	r0, r11
	cmp	r2, #226
	it	lo
	movwlo	r0, #1588
	add	r0, r7
	ldr.w	lr, [r0, #4]
	lsls	r4, r5, #31
	eor.w	r6, lr, r6, lsr #1
	mov	r4, r11
	ldr	r0, [r7, #20]
	it	ne
	eorne.w	r6, r6, r8
	str	r6, [r7, #4]
	cmp	r2, #225
	it	lo
	movwlo	r4, #1588
	add	r4, r7
	and	r6, r5, #-2147483648
	and.w	r5, r1, r9
	ldr	r4, [r4, #8]
	add	r6, r5
	lsls	r5, r1, #31
	eor.w	r6, r4, r6, lsr #1
	mov	r5, r11
	it	ne
	eorne.w	r6, r6, r8
	str	r6, [r7, #8]
	cmp	r2, #224
	it	lo
	movwlo	r5, #1588
	add	r5, r7
	and	r1, r1, #-2147483648
	and.w	r6, r12, r9
	ldr	r5, [r5, #12]
	add	r1, r6
	eor.w	r1, r5, r1, lsr #1
	lsls.w	r6, r12, #31
	mov	r5, r11
	it	ne
	eorne.w	r1, r1, r8
	str	r1, [r7, #12]
	cmp	r2, #223
	it	lo
	movwlo	r5, #1588
	add	r5, r7
	and	r1, r12, #-2147483648
	and.w	r6, r0, r9
	ldr	r5, [r5, #16]
	add	r1, r6
	eor.w	r1, r5, r1, lsr #1
	lsls	r6, r0, #31
	it	ne
	eorne.w	r1, r1, r8
	mov	r5, r11
	str	r1, [r7, #16]
	ldr	r1, [r7, #24]
	cmp	r2, #222
	it	lo
	movwlo	r5, #1588
	add	r5, r7
	and	r0, r0, #-2147483648
	and.w	r6, r1, r9
	ldr	r5, [r5, #20]
	add	r0, r6
	eor.w	r0, r5, r0, lsr #1
	lsls	r6, r1, #31
	it	ne
	eorne.w	r0, r0, r8
	str	r0, [r7, #20]
	mov	r5, r11
	ldr	r0, [r3, #28]
	cmp	r2, #221
	it	lo
	movwlo	r5, #1588
	add	r5, r7
	and	r1, r1, #-2147483648
	and.w	r6, r0, r9
	ldr	r5, [r5, #24]
	add	r1, r6
	lsls	r6, r0, #31
	add.w	r2, r2, #7
	eor.w	r1, r5, r1, lsr #1
	movw	r6, #623
	it	ne
	eorne.w	r1, r1, r8
	cmp	r2, r6
	str	r1, [r7, #24]
	bne.w	.LBB46_22
@ %bb.23:                               @   in Loop: Header=BB46_20 Depth=2
	ldr.w	r0, [r10, #2492]
	ldr.w	r1, [r10]
	and	r0, r0, #-2147483648
	and.w	r2, r1, r9
	ldr.w	r3, [r10, #1584]
	add	r0, r2
	eor.w	r0, r3, r0, lsr #1
	lsls	r1, r1, #31
	it	ne
	eorne.w	r0, r0, r8
	movw	lr, #22144
	ldrd	r7, r3, [sp, #24]               @ 8-byte Folded Reload
	movs	r2, #0
	movt	lr, #40236
	str.w	r0, [r10, #2492]
	b	.LBB46_19
	.p2align	2
.LBB46_24:                              @   in Loop: Header=BB46_3 Depth=1
	ldr	r1, [sp, #8]                    @ 4-byte Reload
	add	r0, r1
	adds	r0, #5
	ldr	r1, [sp, #20]                   @ 4-byte Reload
	and	r0, r0, #7
	str	r0, [r1, #20]
	b	.LBB46_26
	.p2align	2
.LBB46_25:                              @   in Loop: Header=BB46_26 Depth=2
	adds	r1, r2, #1
	str.w	r1, [r10, #2496]
	ldr.w	r0, [r10, r2, lsl #2]
	adds	r3, #1
	eor.w	r0, r0, r0, lsr #11
	and.w	r2, lr, r0, lsl #7
	eor.w	r0, r0, r2
	and	r2, r0, #122368
	eor.w	r0, r0, r2, lsl #15
	lsr.w	r2, r0, #24
	adc	r7, r7, #0
	cmp	r2, #200
	mov	r2, r1
	bls.w	.LBB46_30
.LBB46_26:                              @   Parent Loop BB46_3 Depth=1
                                        @ =>  This Loop Header: Depth=2
                                        @       Child Loop BB46_28 Depth 3
	cmp.w	r2, #624
	blt	.LBB46_25
@ %bb.27:                               @   in Loop: Header=BB46_26 Depth=2
	ldr.w	r0, [r10]
	strd	r7, r3, [sp, #24]               @ 8-byte Folded Spill
	movs	r7, #0
	sub.w	r12, r10, #28
	.p2align	2
.LBB46_28:                              @   Parent Loop BB46_3 Depth=1
                                        @     Parent Loop BB46_26 Depth=2
                                        @ =>    This Inner Loop Header: Depth=3
	add.w	r3, r10, r7, lsl #2
	ldr	r1, [r3, #4]
	mov	r5, r11
	cmp	r7, #227
	it	lo
	movwlo	r5, #1588
	and	r0, r0, #-2147483648
	and.w	r6, r1, r9
	ldr	r5, [r3, r5]
	add	r0, r6
	eor.w	r0, r5, r0, lsr #1
	lsls	r6, r1, #31
	it	ne
	eorne.w	r0, r0, r8
	str	r0, [r12, #28]!
	ldrd	r5, r6, [r3, #8]
	and	r0, r1, #-2147483648
	and.w	r4, r5, r9
	add	r4, r0
	mov	r0, r11
	ldr	r1, [r3, #16]
	cmp	r7, #226
	it	lo
	movwlo	r0, #1588
	add	r0, r3
	ldr	r2, [r0, #4]
	ldr	r0, [r3, #20]
	eor.w	r2, r2, r4, lsr #1
	lsls	r4, r5, #31
	mov	r4, r11
	it	ne
	eorne.w	r2, r2, r8
	str	r2, [r3, #4]
	cmp	r7, #225
	it	lo
	movwlo	r4, #1588
	add	r4, r3
	and	r2, r5, #-2147483648
	and.w	r5, r6, r9
	ldr	r4, [r4, #8]
	add	r2, r5
	lsls	r5, r6, #31
	eor.w	r2, r4, r2, lsr #1
	mov	r5, r11
	it	ne
	eorne.w	r2, r2, r8
	str	r2, [r3, #8]
	cmp	r7, #224
	it	lo
	movwlo	r5, #1588
	add	r5, r3
	and	r2, r6, #-2147483648
	and.w	r6, r1, r9
	ldr	r5, [r5, #12]
	add	r2, r6
	lsls	r6, r1, #31
	eor.w	r2, r5, r2, lsr #1
	mov	r6, r11
	it	ne
	eorne.w	r2, r2, r8
	str	r2, [r3, #12]
	cmp	r7, #223
	it	lo
	movwlo	r6, #1588
	add	r6, r3
	and	r1, r1, #-2147483648
	and.w	r2, r0, r9
	ldr	r6, [r6, #16]
	add	r1, r2
	eor.w	r1, r6, r1, lsr #1
	lsls	r2, r0, #31
	it	ne
	eorne.w	r1, r1, r8
	mov	r6, r11
	str	r1, [r3, #16]
	ldr	r1, [r3, #24]
	cmp	r7, #222
	it	lo
	movwlo	r6, #1588
	add	r6, r3
	and	r0, r0, #-2147483648
	and.w	r2, r1, r9
	ldr	r6, [r6, #20]
	add	r0, r2
	eor.w	r0, r6, r0, lsr #1
	lsls	r2, r1, #31
	it	ne
	eorne.w	r0, r0, r8
	str	r0, [r3, #20]
	mov	r6, r11
	ldr.w	r0, [r12, #28]
	cmp	r7, #221
	it	lo
	movwlo	r6, #1588
	add	r6, r3
	and	r1, r1, #-2147483648
	and.w	r2, r0, r9
	ldr	r6, [r6, #24]
	add	r1, r2
	lsls	r2, r0, #31
	add.w	r7, r7, #7
	eor.w	r1, r6, r1, lsr #1
	movw	r2, #623
	it	ne
	eorne.w	r1, r1, r8
	cmp	r7, r2
	str	r1, [r3, #24]
	bne.w	.LBB46_28
@ %bb.29:                               @   in Loop: Header=BB46_26 Depth=2
	ldr.w	r0, [r10, #2492]
	ldr.w	r1, [r10]
	and	r0, r0, #-2147483648
	and.w	r2, r1, r9
	ldr.w	r3, [r10, #1584]
	add	r0, r2
	eor.w	r0, r3, r0, lsr #1
	lsls	r1, r1, #31
	it	ne
	eorne.w	r0, r0, r8
	ldrd	r7, r3, [sp, #24]               @ 8-byte Folded Reload
	movs	r2, #0
	str.w	r0, [r10, #2492]
	b	.LBB46_25
	.p2align	2
.LBB46_30:                              @   in Loop: Header=BB46_3 Depth=1
	ldr	r1, [sp, #20]                   @ 4-byte Reload
	ldr	r2, [sp, #16]                   @ 4-byte Reload
	vldr	s0, [r1, #8]
	strd	r3, r7, [r2]
	vsub.f32	s0, s17, s0
	vabs.f32	s0, s0
	vcvt.s32.f32	s0, s0
	vmov	r1, s0
	cmp.w	r1, #-1
	ble.w	.LBB46_78
@ %bb.31:                               @   in Loop: Header=BB46_3 Depth=1
	mvn	r2, #99
	add.w	r0, r2, r0, lsr #24
	vmov	s0, r0
	vcvt.f32.s32	s0, s0
	vdiv.f32	s16, s0, s30
	adds	r6, r1, #1
	clz	r0, r6
	rsb.w	r7, r0, #32
	.p2align	2
.LBB46_32:                              @   Parent Loop BB46_3 Depth=1
                                        @ =>  This Inner Loop Header: Depth=2
	mov	r0, r10
	mov	r1, r7
	bl	credits_private_random_bits
	subs	r2, r0, r6
	sbcs	r1, r1, #0
	bhs	.LBB46_32
@ %bb.33:                               @   in Loop: Header=BB46_3 Depth=1
	vmov	s0, r0
	vcvt.f32.u32	s0, s0
	vdiv.f32	s0, s0, s19
	ldr	r1, [sp, #20]                   @ 4-byte Reload
	vldr	s2, [r1, #8]
	vcmp.f32	s2, s17
	vmrs	APSR_nzcv, fpscr
	vneg.f32	s4, s0
	it	gt
	vmovgt.f32	s0, s4
	vadd.f32	s0, s16, s0
	vadd.f32	s0, s2, s0
	vcmp.f32	s0, #0
	vmrs	APSR_nzcv, fpscr
	it	mi
	vmovmi.f32	s0, s28
	ldr	r0, [r1, #24]
	vstr	s0, [r1, #8]
	sub.w	r0, r0, #282
	bl	credits_private_math_weather_target
	ldr	r0, [sp, #16]                   @ 4-byte Reload
	movw	r3, #22144
	ldrd	r7, r6, [r0]
	ldr.w	r0, [r10, #2496]
	vmov.f32	s16, s0
	movt	r3, #40236
	b	.LBB46_35
	.p2align	2
.LBB46_34:                              @   in Loop: Header=BB46_35 Depth=2
	adds	r2, r0, #1
	str.w	r2, [r10, #2496]
	ldr.w	r0, [r10, r0, lsl #2]
	adds	r7, #1
	eor.w	r0, r0, r0, lsr #11
	and.w	r1, r3, r0, lsl #7
	eor.w	r0, r0, r1
	and	r1, r0, #122368
	eor.w	r1, r0, r1, lsl #15
	lsr.w	r0, r1, #24
	adc	r6, r6, #0
	cmp	r0, #200
	mov	r0, r2
	bls.w	.LBB46_39
.LBB46_35:                              @   Parent Loop BB46_3 Depth=1
                                        @ =>  This Loop Header: Depth=2
                                        @       Child Loop BB46_37 Depth 3
	cmp.w	r0, #624
	blt	.LBB46_34
@ %bb.36:                               @   in Loop: Header=BB46_35 Depth=2
	ldr.w	r0, [r10]
	strd	r6, r7, [sp, #24]               @ 8-byte Folded Spill
	movs	r7, #0
	sub.w	lr, r10, #28
	.p2align	2
.LBB46_37:                              @   Parent Loop BB46_3 Depth=1
                                        @     Parent Loop BB46_35 Depth=2
                                        @ =>    This Inner Loop Header: Depth=3
	add.w	r3, r10, r7, lsl #2
	ldr	r1, [r3, #4]
	mov	r5, r11
	cmp	r7, #227
	it	lo
	movwlo	r5, #1588
	and	r0, r0, #-2147483648
	and.w	r4, r1, r9
	ldr	r5, [r3, r5]
	add	r0, r4
	eor.w	r0, r5, r0, lsr #1
	lsls	r4, r1, #31
	it	ne
	eorne.w	r0, r0, r8
	str	r0, [lr, #28]!
	ldrd	r4, r6, [r3, #8]
	and	r0, r1, #-2147483648
	and.w	r5, r4, r9
	add	r5, r0
	mov	r0, r11
	ldr	r1, [r3, #16]
	cmp	r7, #226
	it	lo
	movwlo	r0, #1588
	add	r0, r3
	ldr.w	r12, [r0, #4]
	lsls	r2, r4, #31
	eor.w	r5, r12, r5, lsr #1
	and	r2, r4, #-2147483648
	mov	r4, r11
	ldr	r0, [r3, #20]
	it	ne
	eorne.w	r5, r5, r8
	str	r5, [r3, #4]
	cmp	r7, #225
	it	lo
	movwlo	r4, #1588
	add	r4, r3
	and.w	r5, r6, r9
	ldr	r4, [r4, #8]
	add	r2, r5
	lsls	r5, r6, #31
	eor.w	r2, r4, r2, lsr #1
	mov	r5, r11
	it	ne
	eorne.w	r2, r2, r8
	str	r2, [r3, #8]
	cmp	r7, #224
	it	lo
	movwlo	r5, #1588
	add	r5, r3
	and	r2, r6, #-2147483648
	and.w	r6, r1, r9
	ldr	r5, [r5, #12]
	add	r2, r6
	lsls	r6, r1, #31
	eor.w	r2, r5, r2, lsr #1
	mov	r6, r11
	it	ne
	eorne.w	r2, r2, r8
	str	r2, [r3, #12]
	cmp	r7, #223
	it	lo
	movwlo	r6, #1588
	add	r6, r3
	and	r1, r1, #-2147483648
	and.w	r2, r0, r9
	ldr	r6, [r6, #16]
	add	r1, r2
	eor.w	r1, r6, r1, lsr #1
	lsls	r2, r0, #31
	it	ne
	eorne.w	r1, r1, r8
	mov	r6, r11
	str	r1, [r3, #16]
	ldr	r1, [r3, #24]
	cmp	r7, #222
	it	lo
	movwlo	r6, #1588
	add	r6, r3
	and	r0, r0, #-2147483648
	and.w	r2, r1, r9
	ldr	r6, [r6, #20]
	add	r0, r2
	eor.w	r0, r6, r0, lsr #1
	lsls	r2, r1, #31
	it	ne
	eorne.w	r0, r0, r8
	str	r0, [r3, #20]
	mov	r6, r11
	ldr.w	r0, [lr, #28]
	cmp	r7, #221
	it	lo
	movwlo	r6, #1588
	add	r6, r3
	and	r1, r1, #-2147483648
	and.w	r2, r0, r9
	ldr	r6, [r6, #24]
	add	r1, r2
	lsls	r2, r0, #31
	add.w	r7, r7, #7
	eor.w	r1, r6, r1, lsr #1
	movw	r2, #623
	it	ne
	eorne.w	r1, r1, r8
	cmp	r7, r2
	str	r1, [r3, #24]
	bne.w	.LBB46_37
@ %bb.38:                               @   in Loop: Header=BB46_35 Depth=2
	ldr.w	r0, [r10, #2492]
	ldr.w	r1, [r10]
	and	r0, r0, #-2147483648
	and.w	r2, r1, r9
	ldr.w	r3, [r10, #1584]
	add	r0, r2
	eor.w	r0, r3, r0, lsr #1
	lsls	r1, r1, #31
	it	ne
	eorne.w	r0, r0, r8
	movw	r3, #22144
	ldrd	r6, r7, [sp, #24]               @ 8-byte Folded Reload
	str.w	r0, [r10, #2492]
	movs	r0, #0
	movt	r3, #40236
	b	.LBB46_34
	.p2align	2
.LBB46_39:                              @   in Loop: Header=BB46_3 Depth=1
	ldr	r0, [sp, #20]                   @ 4-byte Reload
	ldr	r2, [sp, #16]                   @ 4-byte Reload
	vldr	s0, [r0, #4]
	strd	r7, r6, [r2]
	vsub.f32	s0, s16, s0
	vabs.f32	s0, s0
	vcvt.s32.f32	s0, s0
	vmov	r0, s0
	cmp.w	r0, #-1
	ble.w	.LBB46_78
@ %bb.40:                               @   in Loop: Header=BB46_3 Depth=1
	mvn	r2, #99
	add.w	r1, r2, r1, lsr #24
	vmov	s0, r1
	vcvt.f32.s32	s0, s0
	vdiv.f32	s18, s0, s21
	adds	r6, r0, #1
	clz	r0, r6
	rsb.w	r7, r0, #32
	.p2align	2
.LBB46_41:                              @   Parent Loop BB46_3 Depth=1
                                        @ =>  This Inner Loop Header: Depth=2
	mov	r0, r10
	mov	r1, r7
	bl	credits_private_random_bits
	subs	r2, r0, r6
	sbcs	r1, r1, #0
	bhs	.LBB46_41
@ %bb.42:                               @   in Loop: Header=BB46_3 Depth=1
	vmov	s0, r0
	vcvt.f32.u32	s0, s0
	vdiv.f32	s0, s0, s23
	ldr	r1, [sp, #20]                   @ 4-byte Reload
	movw	r3, #22144
	vldr	s2, [r1, #4]
	movt	r3, #40236
	vcmp.f32	s16, s2
	vmrs	APSR_nzcv, fpscr
	vneg.f32	s4, s0
	it	mi
	vmovmi.f32	s0, s4
	vadd.f32	s0, s18, s0
	vadd.f32	s0, s2, s0
	vcmp.f32	s0, #0
	vmrs	APSR_nzcv, fpscr
	it	mi
	vmovmi.f32	s0, s28
	ldr	r0, [sp, #16]                   @ 4-byte Reload
	vstr	s0, [r1, #4]
	ldrd	r7, r6, [r0]
	ldr.w	r0, [r10, #2496]
	b	.LBB46_45
	.p2align	2
.LBB46_43:                              @   in Loop: Header=BB46_45 Depth=2
	ldr.w	r0, [r10, #2492]
	ldr.w	r1, [r10]
	and	r0, r0, #-2147483648
	and.w	r2, r1, r9
	ldr.w	r3, [r10, #1584]
	add	r0, r2
	eor.w	r0, r3, r0, lsr #1
	lsls	r1, r1, #31
	it	ne
	eorne.w	r0, r0, r8
	movw	r3, #22144
	ldrd	r6, r7, [sp, #24]               @ 8-byte Folded Reload
	str.w	r0, [r10, #2492]
	movs	r0, #0
	movt	r3, #40236
.LBB46_44:                              @   in Loop: Header=BB46_45 Depth=2
	adds	r2, r0, #1
	str.w	r2, [r10, #2496]
	ldr.w	r0, [r10, r0, lsl #2]
	adds	r7, #1
	eor.w	r0, r0, r0, lsr #11
	and.w	r1, r3, r0, lsl #7
	eor.w	r0, r0, r1
	and	r1, r0, #122368
	eor.w	r1, r0, r1, lsl #15
	lsr.w	r0, r1, #24
	adc	r6, r6, #0
	cmp	r0, #200
	mov	r0, r2
	bls.w	.LBB46_48
.LBB46_45:                              @   Parent Loop BB46_3 Depth=1
                                        @ =>  This Loop Header: Depth=2
                                        @       Child Loop BB46_47 Depth 3
	cmp.w	r0, #624
	blt	.LBB46_44
@ %bb.46:                               @   in Loop: Header=BB46_45 Depth=2
	ldr.w	r0, [r10]
	strd	r6, r7, [sp, #24]               @ 8-byte Folded Spill
	movs	r7, #0
	sub.w	lr, r10, #28
	.p2align	2
.LBB46_47:                              @   Parent Loop BB46_3 Depth=1
                                        @     Parent Loop BB46_45 Depth=2
                                        @ =>    This Inner Loop Header: Depth=3
	add.w	r3, r10, r7, lsl #2
	ldr	r1, [r3, #4]
	mov	r5, r11
	cmp	r7, #227
	it	lo
	movwlo	r5, #1588
	and	r0, r0, #-2147483648
	and.w	r4, r1, r9
	ldr	r5, [r3, r5]
	add	r0, r4
	eor.w	r0, r5, r0, lsr #1
	lsls	r4, r1, #31
	it	ne
	eorne.w	r0, r0, r8
	str	r0, [lr, #28]!
	ldrd	r4, r6, [r3, #8]
	and	r0, r1, #-2147483648
	and.w	r5, r4, r9
	add	r5, r0
	mov	r0, r11
	ldr	r1, [r3, #16]
	cmp	r7, #226
	it	lo
	movwlo	r0, #1588
	add	r0, r3
	ldr.w	r12, [r0, #4]
	lsls	r2, r4, #31
	eor.w	r5, r12, r5, lsr #1
	and	r2, r4, #-2147483648
	mov	r4, r11
	ldr	r0, [r3, #20]
	it	ne
	eorne.w	r5, r5, r8
	str	r5, [r3, #4]
	cmp	r7, #225
	it	lo
	movwlo	r4, #1588
	add	r4, r3
	and.w	r5, r6, r9
	ldr	r4, [r4, #8]
	add	r2, r5
	lsls	r5, r6, #31
	eor.w	r2, r4, r2, lsr #1
	mov	r5, r11
	it	ne
	eorne.w	r2, r2, r8
	str	r2, [r3, #8]
	cmp	r7, #224
	it	lo
	movwlo	r5, #1588
	add	r5, r3
	and	r2, r6, #-2147483648
	and.w	r6, r1, r9
	ldr	r5, [r5, #12]
	add	r2, r6
	lsls	r6, r1, #31
	eor.w	r2, r5, r2, lsr #1
	mov	r6, r11
	it	ne
	eorne.w	r2, r2, r8
	str	r2, [r3, #12]
	cmp	r7, #223
	it	lo
	movwlo	r6, #1588
	add	r6, r3
	and	r1, r1, #-2147483648
	and.w	r2, r0, r9
	ldr	r6, [r6, #16]
	add	r1, r2
	eor.w	r1, r6, r1, lsr #1
	lsls	r2, r0, #31
	it	ne
	eorne.w	r1, r1, r8
	mov	r6, r11
	str	r1, [r3, #16]
	ldr	r1, [r3, #24]
	cmp	r7, #222
	it	lo
	movwlo	r6, #1588
	add	r6, r3
	and	r0, r0, #-2147483648
	and.w	r2, r1, r9
	ldr	r6, [r6, #20]
	add	r0, r2
	eor.w	r0, r6, r0, lsr #1
	lsls	r2, r1, #31
	it	ne
	eorne.w	r0, r0, r8
	str	r0, [r3, #20]
	mov	r6, r11
	ldr.w	r0, [lr, #28]
	cmp	r7, #221
	it	lo
	movwlo	r6, #1588
	add	r6, r3
	and	r1, r1, #-2147483648
	and.w	r2, r0, r9
	ldr	r6, [r6, #24]
	add	r1, r2
	lsls	r2, r0, #31
	add.w	r7, r7, #7
	eor.w	r1, r6, r1, lsr #1
	movw	r2, #623
	it	ne
	eorne.w	r1, r1, r8
	cmp	r7, r2
	str	r1, [r3, #24]
	bne.w	.LBB46_47
	b	.LBB46_43
	.p2align	2
.LBB46_48:                              @   in Loop: Header=BB46_3 Depth=1
	ldr	r0, [sp, #20]                   @ 4-byte Reload
	ldr	r2, [sp, #16]                   @ 4-byte Reload
	vldr	s0, [r0, #16]
	strd	r7, r6, [r2]
	vsub.f32	s0, s27, s0
	vabs.f32	s0, s0
	vcvt.s32.f32	s0, s0
	vmov	r0, s0
	cmp.w	r0, #-1
	ble.w	.LBB46_78
@ %bb.49:                               @   in Loop: Header=BB46_3 Depth=1
	mvn	r2, #99
	add.w	r1, r2, r1, lsr #24
	vmov	s0, r1
	vcvt.f32.s32	s0, s0
	vdiv.f32	s16, s0, s25
	adds	r6, r0, #1
	clz	r0, r6
	rsb.w	r7, r0, #32
	.p2align	2
.LBB46_50:                              @   Parent Loop BB46_3 Depth=1
                                        @ =>  This Inner Loop Header: Depth=2
	mov	r0, r10
	mov	r1, r7
	bl	credits_private_random_bits
	subs	r2, r0, r6
	sbcs	r1, r1, #0
	bhs	.LBB46_50
@ %bb.51:                               @   in Loop: Header=BB46_3 Depth=1
	vmov	s0, r0
	vcvt.f32.u32	s0, s0
	vdiv.f32	s0, s0, s24
	ldr	r0, [sp, #20]                   @ 4-byte Reload
	movw	lr, #22144
	vldr	s2, [r0, #16]
	movt	lr, #40236
	vcmp.f32	s2, s31
	vmrs	APSR_nzcv, fpscr
	vneg.f32	s4, s0
	it	gt
	vmovgt.f32	s0, s4
	vadd.f32	s0, s16, s0
	vadd.f32	s0, s2, s0
	vcmp.f32	s0, s26
	vmrs	APSR_nzcv, fpscr
	vcmp.f32	s0, #0
	it	gt
	vmovgt.f32	s0, s26
	vmrs	APSR_nzcv, fpscr
	it	mi
	vmovmi.f32	s0, s28
	ldr	r1, [sp, #16]                   @ 4-byte Reload
	ldr.w	r2, [r10, #2496]
	ldrd	r6, r5, [r1]
	vldr	s2, [r0, #8]
	vstr	s0, [r0, #16]
	b	.LBB46_53
	.p2align	2
.LBB46_52:                              @   in Loop: Header=BB46_53 Depth=2
	mov	r0, r2
	adds	r2, #1
	str.w	r2, [r10, #2496]
	ldr.w	r0, [r10, r0, lsl #2]
	adds	r6, #1
	eor.w	r0, r0, r0, lsr #11
	and.w	r1, lr, r0, lsl #7
	eor.w	r0, r0, r1
	and	r1, r0, #120832
	eor.w	r0, r0, r1, lsl #15
	lsr.w	r1, r0, #26
	adc	r5, r5, #0
	cmp	r1, #50
	bls.w	.LBB46_57
.LBB46_53:                              @   Parent Loop BB46_3 Depth=1
                                        @ =>  This Loop Header: Depth=2
                                        @       Child Loop BB46_55 Depth 3
	cmp.w	r2, #624
	blt	.LBB46_52
@ %bb.54:                               @   in Loop: Header=BB46_53 Depth=2
	ldr.w	r0, [r10]
	movs	r7, #0
	sub.w	r12, r10, #28
	strd	r5, r6, [sp, #24]               @ 8-byte Folded Spill
	.p2align	2
.LBB46_55:                              @   Parent Loop BB46_3 Depth=1
                                        @     Parent Loop BB46_53 Depth=2
                                        @ =>    This Inner Loop Header: Depth=3
	add.w	r3, r10, r7, lsl #2
	ldr	r1, [r3, #4]
	mov	r5, r11
	cmp	r7, #227
	it	lo
	movwlo	r5, #1588
	and	r0, r0, #-2147483648
	and.w	r6, r1, r9
	ldr	r5, [r3, r5]
	add	r0, r6
	eor.w	r0, r5, r0, lsr #1
	lsls	r6, r1, #31
	it	ne
	eorne.w	r0, r0, r8
	str	r0, [r12, #28]!
	ldrd	r5, r6, [r3, #8]
	and	r0, r1, #-2147483648
	and.w	r4, r5, r9
	add	r4, r0
	mov	r0, r11
	ldr	r1, [r3, #16]
	cmp	r7, #226
	it	lo
	movwlo	r0, #1588
	add	r0, r3
	ldr	r2, [r0, #4]
	ldr	r0, [r3, #20]
	eor.w	r2, r2, r4, lsr #1
	lsls	r4, r5, #31
	mov	r4, r11
	it	ne
	eorne.w	r2, r2, r8
	str	r2, [r3, #4]
	cmp	r7, #225
	it	lo
	movwlo	r4, #1588
	add	r4, r3
	and	r2, r5, #-2147483648
	and.w	r5, r6, r9
	ldr	r4, [r4, #8]
	add	r2, r5
	lsls	r5, r6, #31
	eor.w	r2, r4, r2, lsr #1
	mov	r5, r11
	it	ne
	eorne.w	r2, r2, r8
	str	r2, [r3, #8]
	cmp	r7, #224
	it	lo
	movwlo	r5, #1588
	add	r5, r3
	and	r2, r6, #-2147483648
	and.w	r6, r1, r9
	ldr	r5, [r5, #12]
	add	r2, r6
	lsls	r6, r1, #31
	eor.w	r2, r5, r2, lsr #1
	mov	r6, r11
	it	ne
	eorne.w	r2, r2, r8
	str	r2, [r3, #12]
	cmp	r7, #223
	it	lo
	movwlo	r6, #1588
	add	r6, r3
	and	r1, r1, #-2147483648
	and.w	r2, r0, r9
	ldr	r6, [r6, #16]
	add	r1, r2
	eor.w	r1, r6, r1, lsr #1
	lsls	r2, r0, #31
	it	ne
	eorne.w	r1, r1, r8
	mov	r6, r11
	str	r1, [r3, #16]
	ldr	r1, [r3, #24]
	cmp	r7, #222
	it	lo
	movwlo	r6, #1588
	add	r6, r3
	and	r0, r0, #-2147483648
	and.w	r2, r1, r9
	ldr	r6, [r6, #20]
	add	r0, r2
	eor.w	r0, r6, r0, lsr #1
	lsls	r2, r1, #31
	it	ne
	eorne.w	r0, r0, r8
	str	r0, [r3, #20]
	mov	r6, r11
	ldr.w	r0, [r12, #28]
	cmp	r7, #221
	it	lo
	movwlo	r6, #1588
	add	r6, r3
	and	r1, r1, #-2147483648
	and.w	r2, r0, r9
	ldr	r6, [r6, #24]
	add	r1, r2
	lsls	r2, r0, #31
	add.w	r7, r7, #7
	eor.w	r1, r6, r1, lsr #1
	movw	r2, #623
	it	ne
	eorne.w	r1, r1, r8
	cmp	r7, r2
	str	r1, [r3, #24]
	bne.w	.LBB46_55
@ %bb.56:                               @   in Loop: Header=BB46_53 Depth=2
	ldr.w	r0, [r10, #2492]
	ldr.w	r1, [r10]
	and	r0, r0, #-2147483648
	and.w	r2, r1, r9
	ldr.w	r3, [r10, #1584]
	add	r0, r2
	eor.w	r0, r3, r0, lsr #1
	lsls	r1, r1, #31
	it	ne
	eorne.w	r0, r0, r8
	ldrd	r5, r6, [sp, #24]               @ 8-byte Folded Reload
	movs	r2, #0
	str.w	r0, [r10, #2492]
	b	.LBB46_52
	.p2align	2
.LBB46_57:                              @   in Loop: Header=BB46_3 Depth=1
	ldr	r1, [sp, #16]                   @ 4-byte Reload
	ldr	r7, [sp, #12]                   @ 4-byte Reload
	strd	r6, r5, [r1]
	movs	r1, #210
	add.w	r0, r1, r0, lsr #26
	vmov	s4, r0
	ldr	r0, [sp, #20]                   @ 4-byte Reload
	vcvt.f32.u32	s4, s4
	ldr	r1, [r0, #24]
	ldr	r3, [sp, #4]                    @ 4-byte Reload
	vmul.f32	s2, s2, s4
	adds	r7, #1
	vmul.f32	s2, s2, s29
	adds	r1, #1
	cmp	r7, r3
	vstr	s2, [r0, #12]
	str	r7, [sp, #12]                   @ 4-byte Spill
	str	r1, [r0, #24]
	bne.w	.LBB46_3
	b	.LBB46_59
	.p2align	2
.LBB46_58:
	vldr	s0, [r0, #16]
.LBB46_59:
	vmov.f32	s4, #5.000000e-01
	vldr	s2, [r0]
	vcmp.f32	s0, s4
	vldr	s4, .LCPI46_8
	vmrs	APSR_nzcv, fpscr
	ble	.LBB46_63
@ %bb.60:
	vcmp.f32	s2, s4
	vmrs	APSR_nzcv, fpscr
	ble	.LBB46_66
@ %bb.61:
	vldr	s2, [r0, #8]
	vldr	s0, .LCPI46_14
	vcmp.f32	s2, s0
	vmrs	APSR_nzcv, fpscr
	ble	.LBB46_71
@ %bb.62:
	vldr	s0, [r0, #4]
	vldr	s2, .LCPI46_10
	movw	r1, :lower16:.L.str.145
	movw	r2, :lower16:.L.str.146
	movt	r1, :upper16:.L.str.145
	movt	r2, :upper16:.L.str.146
	vcmp.f32	s0, s2
	b	.LBB46_74
	.p2align	2
.LBB46_63:
	vcmp.f32	s2, s4
	vmrs	APSR_nzcv, fpscr
	ble	.LBB46_69
@ %bb.64:
	vldr	s0, [r0, #4]
.LBB46_65:
	vldr	s2, .LCPI46_10
	movw	r1, :lower16:.L.str.149
	movw	r2, :lower16:.L.str.150
	movt	r1, :upper16:.L.str.149
	movt	r2, :upper16:.L.str.150
	vcmp.f32	s0, s2
	b	.LBB46_74
	.p2align	2
.LBB46_66:
	vmov.f32	s4, #2.500000e-01
	vcmp.f32	s2, s4
	vmrs	APSR_nzcv, fpscr
	bgt	.LBB46_70
@ %bb.67:
	vldr	s4, .LCPI46_11
	vcmp.f32	s0, s4
	vmrs	APSR_nzcv, fpscr
	ble	.LBB46_77
@ %bb.68:
	movw	r2, :lower16:.L.str.153
	movt	r2, :upper16:.L.str.153
	b	.LBB46_76
	.p2align	2
.LBB46_69:
	vldr	s4, .LCPI46_6
	vcmp.f32	s2, s4
	vmrs	APSR_nzcv, fpscr
	ble	.LBB46_73
.LBB46_70:
	vldr	s0, [r0, #4]
	vldr	s2, .LCPI46_10
	movw	r1, :lower16:.L.str.151
	movw	r2, :lower16:.L.str.152
	movt	r1, :upper16:.L.str.151
	movt	r2, :upper16:.L.str.152
	vcmp.f32	s0, s2
	b	.LBB46_74
	.p2align	2
.LBB46_71:
	vmov.f32	s4, #2.500000e+01
	vldr	s0, [r0, #4]
	vcmp.f32	s2, s4
	vmrs	APSR_nzcv, fpscr
	ble	.LBB46_65
@ %bb.72:
	vldr	s2, .LCPI46_10
	movw	r1, :lower16:.L.str.147
	movw	r2, :lower16:.L.str.148
	movt	r1, :upper16:.L.str.147
	movt	r2, :upper16:.L.str.148
	vcmp.f32	s0, s2
	b	.LBB46_74
	.p2align	2
.LBB46_73:
	vldr	s2, .LCPI46_9
	movw	r1, :lower16:.L.str.157
	vcmp.f32	s0, s2
	movw	r2, :lower16:.L.str.158
	movw	r0, :lower16:.L.str.156
	movt	r1, :upper16:.L.str.157
	vmrs	APSR_nzcv, fpscr
	movt	r2, :upper16:.L.str.158
	vcmp.f32	s0, s4
	movt	r0, :upper16:.L.str.156
	it	mi
	movmi	r1, r0
.LBB46_74:
	vmrs	APSR_nzcv, fpscr
	it	mi
	movmi	r2, r1
.LBB46_75:
	ldr	r0, [sp, #20]                   @ 4-byte Reload
.LBB46_76:
	str	r2, [r0, #28]
	add	sp, #32
	vpop	{d8, d9, d10, d11, d12, d13, d14, d15}
	add	sp, #4
	pop.w	{r4, r5, r6, r7, r8, r9, r10, r11, pc}
	.p2align	2
.LBB46_77:
	vldr	s4, .LCPI46_12
	movw	r2, :lower16:.L.str.155
	vcmp.f32	s2, s4
	vldr	s2, .LCPI46_13
	movw	r1, :lower16:.L.str.154
	movt	r2, :upper16:.L.str.155
	movt	r1, :upper16:.L.str.154
	vmrs	APSR_nzcv, fpscr
	it	gt
	movgt	r2, r1
	vcmp.f32	s0, s2
	vmrs	APSR_nzcv, fpscr
	it	gt
	movgt	r2, r1
	b	.LBB46_75
	.p2align	2
.LBB46_78:
	movw	r0, :lower16:.L.str.6
	movt	r0, :upper16:.L.str.6
	bl	credits_private_credits_fail
	.p2align	2
@ %bb.79:
.LCPI46_6:
	.long	0x3e4ccccd                      @ float 0.200000003
.LCPI46_8:
	.long	0x3ecccccd                      @ float 0.400000006
.LCPI46_9:
	.long	0x3dcccccd                      @ float 0.100000001
.LCPI46_10:
	.long	0x42000000                      @ float 32
.LCPI46_11:
	.long	0x3f4ccccd                      @ float 0.800000011
.LCPI46_12:
	.long	0x3e99999a                      @ float 0.300000012
.LCPI46_13:
	.long	0x3f266666                      @ float 0.649999976
.LCPI46_14:
	.long	0x422c0000                      @ float 43
.Lfunc_end46:
	.size	credits_private_weather_mutate, .Lfunc_end46-credits_private_weather_mutate
	.cantunwind
	.fnend
                                        @ -- End function
	.globl	credits_private_math_weather_target @ -- Begin function credits_private_math_weather_target
	.p2align	2
	.type	credits_private_math_weather_target,%function
	.code	16
	.thumb_func
credits_private_math_weather_target:    @ @credits_private_math_weather_target
	.fnstart
@ %bb.0:
	movw	r1, #63921
	movt	r1, #45964
	smmla	r1, r1, r0, r0
	vldr	s2, .LCPI47_0
	asrs	r2, r1, #8
	add.w	r1, r2, r1, lsr #31
	movw	r2, #365
	mls	r0, r1, r2, r0
	vldr	s4, .LCPI47_1
	cmp	r0, #0
	it	mi
	addwmi	r0, r0, #365
	vmov	s0, r0
	vcvt.f32.u32	s0, s0
	vmul.f32	s0, s0, s2
	vadd.f32	s0, s0, s4
	vldr	s2, .LCPI47_2
	vabs.f32	s4, s0
	vcmp.f32	s4, s2
	vmrs	APSR_nzcv, fpscr
	bhi.w	.LBB47_2
@ %bb.1:
	vldr	s6, .LCPI47_3
	vadd.f32	s4, s0, s2
	vcmp.f32	s0, #0
	vmrs	APSR_nzcv, fpscr
	it	mi
	vmovmi.f32	s0, s4
	vadd.f32	s4, s0, s6
	vcmp.f32	s0, s2
	vmrs	APSR_nzcv, fpscr
	it	lt
	vmovlt.f32	s4, s0
	vldr	s0, .LCPI47_4
	vldr	s2, .LCPI47_5
	vadd.f32	s0, s4, s0
	vcmp.f32	s4, s2
	vmrs	APSR_nzcv, fpscr
	mrs	r0, apsr
	it	ge
	vmovge.f32	s4, s0
	vldr	s0, .LCPI47_6
	vsub.f32	s2, s2, s4
	vcmp.f32	s4, s0
	vmov.f32	s0, #1.000000e+01
	vmrs	APSR_nzcv, fpscr
	it	gt
	vmovgt.f32	s4, s2
	vdiv.f32	s2, s4, s0
	vmov.f32	s10, #-6.000000e+00
	movw	r3, :lower16:credits_private_math_lookup_cos_units
	movt	r3, :upper16:credits_private_math_lookup_cos_units
	vcvt.s32.f32	s2, s2
	vcvt.f32.s32	s6, s2
	vmul.f32	s0, s6, s0
	vsub.f32	s0, s4, s0
	vldr	s4, .LCPI47_7
	vmov	r1, s2
	vmul.f32	s4, s0, s4
	vmul.f32	s8, s4, s4
	vdiv.f32	s8, s8, s10
	vcvt.s32.f32	s2, s0
	vmov	r2, s2
	add.w	r2, r3, r2, lsl #2
	vcvt.f32.s32	s6, s2
	vldr	s2, [r2]
	vldr	s10, [r2, #4]
	movw	r2, :lower16:credits_private_math_lookup_sin_tens
	vsub.f32	s0, s0, s6
	vsub.f32	s6, s10, s2
	movt	r2, :upper16:credits_private_math_lookup_sin_tens
	vmul.f32	s0, s0, s6
	add.w	r3, r2, r1, lsl #2
	vadd.f32	s0, s2, s0
	vmov.f32	s2, #1.000000e+00
	rsb.w	r1, r1, #9
	vadd.f32	s6, s8, s2
	add.w	r1, r2, r1, lsl #2
	vldr	s12, [r3]
	vmul.f32	s4, s4, s6
	vldr	s6, [r1]
	vmul.f32	s0, s12, s0
	vmul.f32	s4, s4, s6
	vadd.f32	s0, s4, s0
	vneg.f32	s4, s0
	msr	apsr_nzcvq, r0
	it	ge
	vmovge.f32	s0, s4
	vldr	s4, .LCPI47_8
	vadd.f32	s0, s0, s2
	vmul.f32	s0, s0, s4
	vmov.f32	s2, #2.000000e+01
	vadd.f32	s0, s0, s2
	bx	lr
	.p2align	2
.LBB47_2:
	movw	r0, :lower16:.L.str.74
	movt	r0, :upper16:.L.str.74
	bl	credits_private_credits_fail
	.p2align	2
@ %bb.3:
.LCPI47_0:
	.long	0x3f7c7e3f                      @ float 0.986301362
.LCPI47_1:
	.long	0xc2700000                      @ float -60
.LCPI47_2:
	.long	0x43b40000                      @ float 360
.LCPI47_3:
	.long	0xc3b40000                      @ float -360
.LCPI47_4:
	.long	0xc3340000                      @ float -180
.LCPI47_5:
	.long	0x43340000                      @ float 180
.LCPI47_6:
	.long	0x42b40000                      @ float 90
.LCPI47_7:
	.long	0x3c8efa35                      @ float 0.0174532924
.LCPI47_8:
	.long	0x42200000                      @ float 40
.Lfunc_end47:
	.size	credits_private_math_weather_target, .Lfunc_end47-credits_private_math_weather_target
	.cantunwind
	.fnend
                                        @ -- End function
	.globl	credits_private_credits_date    @ -- Begin function credits_private_credits_date
	.p2align	1
	.prefalign	2, .Lfunc_end48, nop
	.type	credits_private_credits_date,%function
	.code	16
	.thumb_func
credits_private_credits_date:           @ @credits_private_credits_date
	.fnstart
@ %bb.0:
	.save	{r4, r5, r6, lr}
	push	{r4, r5, r6, lr}
	.pad	#8
	sub	sp, #8
	asrs	r3, r1, #31
	add.w	r3, r1, r3, lsr #26
	add.w	r2, r2, r3, asr #6
	ands	r3, r1, #63
	it	ne
	movne	r3, #1
	and.w	r1, r3, r1, lsr #31
	subs	r1, r2, r1
	cmp	r1, #1
	blt	.LBB48_6
@ %bb.1:
	movw	lr, :lower16:.L__const.credits_private_credits_date.lengths
	movw	r12, #2009
	movs	r3, #22
	movs	r2, #9
	movt	lr, :upper16:.L__const.credits_private_credits_date.lengths
	b	.LBB48_3
	.p2align	2
.LBB48_2:                               @   in Loop: Header=BB48_3 Depth=1
	subs	r1, r1, r4
	cmp	r1, #0
	ble	.LBB48_5
.LBB48_3:                               @ =>This Inner Loop Header: Depth=1
	and	r4, r12, #3
	eor	r5, r2, #1
	orrs	r4, r5
	clz	r4, r4
	lsrs	r5, r4, #5
	ldr.w	r6, [lr, r2, lsl #2]
	subs	r4, r5, r3
	add	r4, r6
	adds	r4, #1
	cmp	r1, r4
	it	lt
	movlt	r4, r1
	add	r3, r4
	add	r5, r6
	cmp	r3, r5
	ble	.LBB48_2
@ %bb.4:                                @   in Loop: Header=BB48_3 Depth=1
	cmp	r2, #10
	add.w	r2, r2, #1
	mov.w	r3, #1
	itt	gt
	addgt.w	r12, r12, #1
	movgt	r2, #0
	b	.LBB48_2
	.p2align	2
.LBB48_5:
	adds	r4, r2, #1
	b	.LBB48_7
	.p2align	2
.LBB48_6:
	movs	r4, #10
	movs	r3, #22
	movw	r12, #2009
.LBB48_7:
	movw	r2, :lower16:.L.str.52
	movt	r2, :upper16:.L.str.52
	movs	r1, #32
	strd	r4, r12, [sp]
	bl	snprintf
	add	sp, #8
	pop	{r4, r5, r6, pc}
.Lfunc_end48:
	.size	credits_private_credits_date, .Lfunc_end48-credits_private_credits_date
	.cantunwind
	.fnend
                                        @ -- End function
	.globl	credits_private_credits_weather @ -- Begin function credits_private_credits_weather
	.p2align	2
	.type	credits_private_credits_weather,%function
	.code	16
	.thumb_func
credits_private_credits_weather:        @ @credits_private_credits_weather
	.fnstart
@ %bb.0:
	.save	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	push.w	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	.pad	#4
	sub	sp, #4
	.vsave	{d8, d9}
	vpush	{d8, d9}
	.pad	#232
	sub	sp, #232
	mov	r11, r2
	ldr	r3, [r1, #28]
	movw	r2, :lower16:.L.str.53
	add	r4, sp, #72
	mov	r5, r1
	mov	r10, r0
	movt	r2, :upper16:.L.str.53
	mov	r0, r4
	movs	r1, #160
	vmov.f32	s16, s0
	bl	snprintf
	vldr	s0, [r5]
	vmov.f32	s18, #-1.000000e+00
	movw	r0, :lower16:.L.str.50
	movw	r7, :lower16:.L.str.54
	vcmp.f32	s0, s18
	movs	r1, #27
	movt	r0, :upper16:.L.str.50
	movt	r7, :upper16:.L.str.54
	vmrs	APSR_nzcv, fpscr
	it	ne
	movne	r1, #32
	it	ne
	movne	r7, r0
	mov	r0, r10
	movs	r2, #15
	mov	r3, r4
	vmov.f32	s0, s16
	str	r7, [sp]
	bl	credits_private_weather60_spaced
	vldr	s0, [r5, #4]
	movw	r0, #17097
	vcvt.s32.f32	s0, s0
	vmov	r3, s0
	movt	r0, #45590
	smmla	r0, r0, r3, r3
	asrs	r1, r0, #4
	add.w	r0, r1, r0, lsr #31
	movs	r1, #23
	mls	r1, r0, r1, r3
	cmp	r1, #0
	it	ne
	movne	r1, #1
	and.w	r1, r1, r3, lsr #31
	subs	r0, r0, r1
	lsrs	r1, r0, #31
	cmp	r0, #3
	it	ge
	movge	r0, #3
	add.w	r6, r0, r1, lsl #2
	cmp	r6, #4
	bhs.w	.LBB49_14
@ %bb.1:
	movw	r2, :lower16:.L.str.56
	add	r4, sp, #72
	movt	r2, :upper16:.L.str.56
	mov	r0, r4
	movs	r1, #160
	bl	snprintf
	movw	r0, :lower16:.L__const.credits_private_credits_weather.colours
	movt	r0, :upper16:.L__const.credits_private_credits_weather.colours
	ldr.w	r7, [r0, r6, lsl #2]
	mov	r0, r10
	movs	r1, #27
	movs	r2, #17
	mov	r3, r4
	vmov.f32	s0, s16
	str	r7, [sp]
	bl	credits_private_weather60_spaced
	ldr	r0, [r5, #20]
	movs	r1, #8
	and.w	r1, r1, r0, lsr #28
	add	r0, r1
	cmp	r0, #8
	bhs.w	.LBB49_15
@ %bb.2:
	vldr	s0, [r5, #8]
	movw	r1, :lower16:.L__const.credits_private_credits_weather.directions
	movt	r1, :upper16:.L__const.credits_private_credits_weather.directions
	vcvt.s32.f32	s0, s0
	ldr.w	r7, [r1, r0, lsl #2]
	movw	r2, :lower16:.L.str.66
	add.w	r9, sp, #72
	vmov	r3, s0
	movt	r2, :upper16:.L.str.66
	mov	r0, r9
	movs	r1, #160
	str	r7, [sp]
	bl	snprintf
	movw	r7, :lower16:.L.str.48
	movt	r7, :upper16:.L.str.48
	mov	r0, r10
	movs	r1, #32
	movs	r2, #17
	mov	r3, r9
	vmov.f32	s0, s16
	str	r7, [sp]
	bl	credits_private_weather60_spaced
	movw	r0, #28271
	movt	r0, #32
	str.w	r0, [sp, #83]
	movw	r0, #29793
	movt	r0, #28521
	str	r0, [sp, #80]
	movw	r0, #28777
	movt	r0, #29801
	str	r0, [sp, #76]
	movw	r0, #29264
	movt	r0, #25445
	movw	r7, :lower16:.L.str.68
	str	r0, [sp, #72]
	movt	r7, :upper16:.L.str.68
	mov	r0, r10
	movs	r1, #32
	movs	r2, #19
	mov	r3, r9
	vmov.f32	s0, s16
	str	r7, [sp]
	bl	credits_private_weather60_spaced
	vldr	s0, [r5]
	vcmp.f32	s0, s18
	vmrs	APSR_nzcv, fpscr
	beq	.LBB49_7
@ %bb.3:
	vcmp.f32	s0, #0
	vmrs	APSR_nzcv, fpscr
	beq	.LBB49_7
@ %bb.4:
	vmov.f32	s2, #1.000000e+00
	vcmp.f32	s0, s2
	vmrs	APSR_nzcv, fpscr
	beq	.LBB49_7
@ %bb.5:
	vldr	s2, .LCPI49_0
	vmul.f32	s0, s0, s2
	vcvt.s32.f32	s4, s0
	vcvt.f32.s32	s2, s4
	vsub.f32	s0, s0, s2
	vmov.f32	s2, #5.000000e-01
	vcmp.f32	s0, s2
	vmrs	APSR_nzcv, fpscr
	vmov	r0, s4
	ble	.LBB49_8
@ %bb.6:
	adds	r0, #1
	b	.LBB49_10
	.p2align	2
.LBB49_7:
	vldr	s2, .LCPI49_1
	movw	r2, :lower16:.L.str.39
	vmul.f32	s0, s0, s2
	vcvt.s32.f32	s0, s0
	add	r4, sp, #8
	vmov	r3, s0
	movt	r2, :upper16:.L.str.39
	mov	r0, r4
	movs	r1, #64
	bl	snprintf
	mov	r0, r4
	bl	strlen
	b	.LBB49_13
	.p2align	2
.LBB49_8:
	lsls	r1, r0, #31
	beq	.LBB49_10
@ %bb.9:
	vcmp.f32	s0, s2
	vmrs	APSR_nzcv, fpscr
	it	eq
	addeq	r0, #1
.LBB49_10:
	movw	r1, #34079
	movt	r1, #20971
	smmul	r1, r0, r1
	asrs	r2, r1, #5
	add.w	r3, r2, r1, lsr #31
	movs	r1, #100
	mls	r7, r3, r1, r0
	movw	r2, :lower16:.L.str.69
	add	r4, sp, #8
	movt	r2, :upper16:.L.str.69
	mov	r0, r4
	movs	r1, #64
	str	r7, [sp]
	bl	snprintf
	mov	r0, r4
	bl	strlen
	cbz	r0, .LBB49_12
@ %bb.11:
	adds	r1, r4, r0
	ldrb	r1, [r1, #-1]
	cmp	r1, #48
	ittt	eq
	subeq	r0, #1
	moveq	r1, #0
	strbeq	r1, [r4, r0]
	b	.LBB49_13
	.p2align	2
.LBB49_12:
	movs	r0, #0
.LBB49_13:
	add	r7, sp, #8
	movs	r1, #37
	adds	r4, r0, #1
	strh	r1, [r7, r0]
	rsb.w	r0, r0, #12
	bic.w	r8, r0, r0, asr #31
	lsr.w	r1, r8, #1
	mov	r0, r9
	movs	r2, #32
	bl	__aeabi_memset4
	add.w	r6, r9, r8, lsr #1
	mov	r0, r6
	mov	r1, r7
	mov	r2, r4
	bl	__aeabi_memcpy
	sub.w	r1, r8, r8, lsr #1
	adds	r0, r6, r4
	adds	r1, #1
	movs	r2, #32
	bl	__aeabi_memset
	add.w	r0, r9, r4
	add	r0, r8
	movs	r1, #0
	movw	r7, :lower16:.L.str.68
	strb	r1, [r0, #1]
	mov	r0, r10
	movs	r1, #32
	movs	r2, #20
	mov	r3, r9
	vmov.f32	s0, s16
	movt	r7, :upper16:.L.str.68
	str	r7, [sp]
	bl	credits_private_weather60_spaced
	movw	r0, #4840
	add.w	r1, r10, r0
	mov	r0, r5
	mov	r2, r11
	add	sp, #232
	vpop	{d8, d9}
	add	sp, #4
	pop.w	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	b	credits_private_weather_mutate
	.p2align	2
.LBB49_14:
	movw	r0, :lower16:.L.str.55
	movt	r0, :upper16:.L.str.55
	bl	credits_private_credits_fail
	.p2align	2
.LBB49_15:
	movw	r0, :lower16:.L.str.65
	movt	r0, :upper16:.L.str.65
	bl	credits_private_credits_fail
	.p2align	2
@ %bb.16:
.LCPI49_0:
	.long	0x461c4000                      @ float 1.0E+4
.LCPI49_1:
	.long	0x42c80000                      @ float 100
.Lfunc_end49:
	.size	credits_private_credits_weather, .Lfunc_end49-credits_private_credits_weather
	.cantunwind
	.fnend
                                        @ -- End function
	.p2align	1                               @ -- Begin function credits_private_weather60_spaced
	.prefalign	2, .Lfunc_end50, nop
	.type	credits_private_weather60_spaced,%function
	.code	16
	.thumb_func
credits_private_weather60_spaced:       @ @credits_private_weather60_spaced
	.fnstart
@ %bb.0:
	.save	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	push.w	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	.pad	#68
	sub	sp, #68
	strd	r1, r2, [sp, #4]                @ 8-byte Folded Spill
	ldrb	r1, [r3]
	movw	r2, #4828
	add	r2, r0
	cmp	r1, #0
	str	r3, [sp, #20]                   @ 4-byte Spill
	str	r0, [sp, #48]                   @ 4-byte Spill
	beq.w	.LBB50_15
@ %bb.1:
	addw	r0, r2, #2516
	ldr	r1, [sp, #48]                   @ 4-byte Reload
	str	r0, [sp, #16]                   @ 4-byte Spill
	movw	r0, #4856
	add.w	r8, r1, r0
	movw	r0, #4852
	movw	r3, #45279
	movw	r11, #65534
	add.w	r7, r2, #12
	adds	r6, r1, r0
	movw	r0, #4848
	movt	r3, #39176
	movt	r11, #32767
	addw	r9, r1, #2492
	add.w	r12, r1, r0
	movs	r1, #0
	movs	r0, #0
	mov	r4, r7
	str	r0, [sp, #12]                   @ 4-byte Spill
	str	r7, [sp, #52]                   @ 4-byte Spill
	str	r2, [sp, #28]                   @ 4-byte Spill
	str.w	r9, [sp, #64]                   @ 4-byte Spill
	strd	r6, r12, [sp, #40]              @ 8-byte Folded Spill
	b	.LBB50_5
	.p2align	2
.LBB50_2:                               @   in Loop: Header=BB50_5 Depth=1
	ldr.w	r9, [sp, #24]                   @ 4-byte Reload
	ldr	r4, [sp, #52]                   @ 4-byte Reload
	movs	r6, #32
	mov	r10, r9
.LBB50_3:                               @   in Loop: Header=BB50_5 Depth=1
	ldr	r0, [sp, #20]                   @ 4-byte Reload
	strb.w	r6, [r0, r10]
	add.w	r10, r9, r1
.LBB50_4:                               @   in Loop: Header=BB50_5 Depth=1
	add	r5, lr
	ldrb	r0, [r0, r5]
	mov	r1, r10
	cmp	r0, #0
	str	r5, [sp, #12]                   @ 4-byte Spill
	beq.w	.LBB50_16
.LBB50_5:                               @ =>This Loop Header: Depth=1
                                        @     Child Loop BB50_7 Depth 2
                                        @       Child Loop BB50_9 Depth 3
	ldr	r0, [sp, #16]                   @ 4-byte Reload
	str	r1, [sp, #24]                   @ 4-byte Spill
	ldrd	r5, r0, [r0]
	ldr.w	r1, [r2, #2508]
	str	r0, [sp, #36]                   @ 4-byte Spill
	b	.LBB50_7
	.p2align	2
.LBB50_6:                               @   in Loop: Header=BB50_7 Depth=2
	adds	r0, r1, #1
	str.w	r0, [r2, #2508]
	ldr.w	r1, [r4, r1, lsl #2]
	movw	r7, #22144
	eor.w	r1, r1, r1, lsr #11
	movt	r7, #40236
	and.w	r7, r7, r1, lsl #7
	eors	r1, r7
	and	r7, r1, #121856
	eor.w	r1, r1, r7, lsl #15
	ldr	r7, [sp, #36]                   @ 4-byte Reload
	adds	r5, #1
	adc	r7, r7, #0
	str	r7, [sp, #36]                   @ 4-byte Spill
	lsrs	r7, r1, #25
	cmp	r7, #100
	mov	r1, r0
	bls.w	.LBB50_11
.LBB50_7:                               @   Parent Loop BB50_5 Depth=1
                                        @ =>  This Loop Header: Depth=2
                                        @       Child Loop BB50_9 Depth 3
	cmp.w	r1, #624
	blt	.LBB50_6
@ %bb.8:                                @   in Loop: Header=BB50_7 Depth=2
	ldr	r1, [r4]
	str	r5, [sp, #32]                   @ 4-byte Spill
	mov	r5, r4
	mov.w	lr, #0
	movs	r0, #0
	.p2align	2
.LBB50_9:                               @   Parent Loop BB50_5 Depth=1
                                        @     Parent Loop BB50_7 Depth=2
                                        @ =>    This Inner Loop Header: Depth=3
	ldr.w	r12, [sp, #64]                  @ 4-byte Reload
	mov	r2, r11
	add.w	r9, r12, lr, lsl #2
	ldr.w	r7, [r9, #2352]
	mov	r10, r8
	and.w	r8, r7, r11
	movw	r11, #64628
	movt	r11, #65535
	str	r0, [sp, #60]                   @ 4-byte Spill
	add.w	r4, r12, r0
	mov	r0, r11
	str	r4, [sp, #56]                   @ 4-byte Spill
	cmp.w	lr, #227
	it	lo
	movwlo	r0, #1588
	add	r0, r5
	and	r1, r1, #-2147483648
	ldr.w	r0, [r0, lr, lsl #2]
	add	r1, r8
	eor.w	r0, r0, r1, lsr #1
	ldr	r6, [sp, #48]                   @ 4-byte Reload
	lsls	r1, r7, #31
	it	ne
	eorne	r0, r3
	ldr.w	r8, [sp, #44]                   @ 4-byte Reload
	str.w	r0, [r4, #2348]
	mov	r4, r11
	ldr.w	r1, [r8, lr, lsl #2]
	cmp.w	lr, #226
	it	lo
	movwlo	r4, #1588
	add	r4, r12
	add.w	r4, r4, lr, lsl #2
	and	r0, r7, #-2147483648
	and.w	r5, r1, r2
	ldr.w	r4, [r4, #2352]
	add	r0, r5
	eor.w	r0, r4, r0, lsr #1
	lsls	r4, r1, #31
	it	ne
	eorne	r0, r3
	str.w	r0, [r9, #2352]
	mov	r12, r9
	ldr.w	r9, [sp, #40]                   @ 4-byte Reload
	mov	r5, r11
	ldr.w	r4, [r9, lr, lsl #2]
	add.w	r7, r8, lr, lsl #2
	cmp.w	lr, #225
	it	lo
	movwlo	r5, #1588
	and	r0, r1, #-2147483648
	ldr	r5, [r7, r5]
	and.w	r7, r4, r2
	add	r0, r7
	eor.w	r0, r5, r0, lsr #1
	lsls	r5, r4, #31
	it	ne
	eorne	r0, r3
	ldr.w	r5, [r10, lr, lsl #2]
	mov	r7, r11
	add.w	r1, r9, lr, lsl #2
	str.w	r0, [r8, lr, lsl #2]
	cmp.w	lr, #224
	it	lo
	movwlo	r7, #1588
	and	r0, r4, #-2147483648
	ldr	r1, [r1, r7]
	and.w	r7, r5, r2
	add	r0, r7
	eor.w	r0, r1, r0, lsr #1
	lsls	r1, r5, #31
	it	ne
	eorne	r0, r3
	str.w	r0, [r9, lr, lsl #2]
	ldr.w	r0, [r12, #2368]
	add.w	r4, r10, lr, lsl #2
	mov	r7, r11
	and	r1, r5, #-2147483648
	and.w	r5, r0, r2
	cmp.w	lr, #223
	it	lo
	movwlo	r7, #1588
	ldr	r4, [r4, r7]
	add	r1, r5
	eor.w	r1, r4, r1, lsr #1
	lsls	r4, r0, #31
	it	ne
	eorne	r1, r3
	add.w	r7, r6, lr, lsl #2
	mov.w	r9, #4864
	mov	r5, r11
	str.w	r1, [r10, lr, lsl #2]
	ldr.w	r1, [r7, r9]
	cmp.w	lr, #222
	it	lo
	movwlo	r5, #1588
	ldr	r6, [sp, #64]                   @ 4-byte Reload
	and	r0, r0, #-2147483648
	add	r5, r6
	add.w	r5, r5, lr, lsl #2
	and.w	r4, r1, r2
	ldr.w	r5, [r5, #2368]
	add	r0, r4
	eor.w	r0, r5, r0, lsr #1
	lsls	r4, r1, #31
	it	ne
	eorne	r0, r3
	and	r4, r1, #-2147483648
	ldr	r1, [sp, #56]                   @ 4-byte Reload
	str.w	r0, [r12, #2368]
	ldr.w	r1, [r1, #2376]
	add.w	r0, r7, #4864
	cmp.w	lr, #221
	it	lo
	movwlo	r11, #1588
	ldr.w	r0, [r0, r11]
	and.w	r5, r1, r2
	add	r4, r5
	eor.w	r0, r0, r4, lsr #1
	lsls	r4, r1, #31
	ldr	r5, [sp, #52]                   @ 4-byte Reload
	it	ne
	eorne	r0, r3
	str.w	r0, [r7, r9]
	add.w	lr, lr, #7
	movw	r0, #623
	cmp	lr, r0
	ldr	r0, [sp, #60]                   @ 4-byte Reload
	mov	r8, r10
	mov	r11, r2
	add.w	r0, r0, #28
	bne.w	.LBB50_9
@ %bb.10:                               @   in Loop: Header=BB50_7 Depth=2
	ldr	r2, [sp, #28]                   @ 4-byte Reload
	mov	r4, r5
	ldr.w	r1, [r2, #2504]
	ldr	r7, [r2, #12]
	and	lr, r1, #-2147483648
	and.w	r9, r7, r11
	ldr.w	r0, [r2, #1596]
	add.w	r1, r9, lr
	eor.w	r1, r0, r1, lsr #1
	lsls	r7, r7, #31
	it	ne
	eorne	r1, r3
	ldr	r5, [sp, #32]                   @ 4-byte Reload
	str.w	r1, [r2, #2504]
	movs	r1, #0
	b	.LBB50_6
	.p2align	2
.LBB50_11:                              @   in Loop: Header=BB50_5 Depth=1
	ldr	r0, [sp, #16]                   @ 4-byte Reload
	ldr	r1, [sp, #36]                   @ 4-byte Reload
	ldr	r4, [sp, #20]                   @ 4-byte Reload
	strd	r5, r1, [r0]
	ldr	r5, [sp, #12]                   @ 4-byte Reload
	vmov	s2, r7
	ldrb	r7, [r4, r5]
	vcvt.f32.u32	s2, s2
	cmp	r7, #191
	mov.w	lr, #1
	vcmp.f32	s0, s2
	it	hi
	movhi.w	lr, #2
	vmrs	APSR_nzcv, fpscr
	mov.w	r1, #1
	bgt.w	.LBB50_2
@ %bb.12:                               @   in Loop: Header=BB50_5 Depth=1
	adds	r1, r4, r5
	ldr	r0, [sp, #24]                   @ 4-byte Reload
	ldrb.w	r9, [r1]
	add.w	r10, r0, #1
	cmp	r7, #192
	strb.w	r9, [r4, r0]
	blo	.LBB50_14
@ %bb.13:                               @   in Loop: Header=BB50_5 Depth=1
	ldrb	r6, [r1, #1]
	ldr	r4, [sp, #52]                   @ 4-byte Reload
	ldr.w	r9, [sp, #24]                   @ 4-byte Reload
	movs	r1, #2
	b	.LBB50_3
	.p2align	2
.LBB50_14:                              @   in Loop: Header=BB50_5 Depth=1
	ldr	r0, [sp, #20]                   @ 4-byte Reload
	ldr	r4, [sp, #52]                   @ 4-byte Reload
	b	.LBB50_4
	.p2align	2
.LBB50_15:
	mov.w	r10, #0
.LBB50_16:
	ldr	r4, [sp, #20]                   @ 4-byte Reload
	movs	r0, #0
	strb.w	r0, [r4, r10]
	ldr	r0, [sp, #104]
	mov	r5, r2
	bl	credits_private_canvas60_style
	mov	r1, r4
	ldrb	r4, [r4]
	cmp	r4, #0
	beq	.LBB50_30
@ %bb.17:
	ldr	r2, [sp, #48]                   @ 4-byte Reload
	ldr	r3, [sp, #4]                    @ 4-byte Reload
	add.w	r12, r2, #24
	mvn	r2, #19
	add.w	lr, r2, r3, lsl #1
	ldr	r2, [sp, #8]                    @ 4-byte Reload
	subs	r3, r2, #3
	mov	r2, lr
	b	.LBB50_21
	.p2align	2
.LBB50_18:                              @   in Loop: Header=BB50_21 Depth=1
	adds	r3, #1
.LBB50_19:                              @   in Loop: Header=BB50_21 Depth=1
	mov	r7, lr
.LBB50_20:                              @   in Loop: Header=BB50_21 Depth=1
	ldrb	r4, [r1]
	mov	r2, r7
	cbz	r4, .LBB50_30
.LBB50_21:                              @ =>This Inner Loop Header: Depth=1
	sub.w	r7, r4, #194
	cmp	r7, #29
	add.w	r7, r1, #1
	bhi	.LBB50_24
@ %bb.22:                               @   in Loop: Header=BB50_21 Depth=1
	ldrsb.w	r7, [r7]
	cmn.w	r7, #65
	bgt	.LBB50_31
@ %bb.23:                               @   in Loop: Header=BB50_21 Depth=1
	and	r6, r7, #63
	bfi	r6, r4, #6, #5
	adds	r1, #2
	mov	r4, r6
	b	.LBB50_25
	.p2align	2
.LBB50_24:                              @   in Loop: Header=BB50_21 Depth=1
	sxtb	r6, r4
	cmp.w	r6, #-1
	mov	r1, r7
	ble	.LBB50_31
.LBB50_25:                              @   in Loop: Header=BB50_21 Depth=1
	cmp	r4, #13
	beq	.LBB50_19
@ %bb.26:                               @   in Loop: Header=BB50_21 Depth=1
	cmp	r4, #10
	beq	.LBB50_18
@ %bb.27:                               @   in Loop: Header=BB50_21 Depth=1
	cmp	r2, #59
	add.w	r7, r2, #1
	it	ls
	cmpls	r3, #20
	blo	.LBB50_29
@ %bb.28:                               @   in Loop: Header=BB50_21 Depth=1
	ldr	r2, [r5]
	adds	r2, #1
	str	r2, [r5]
	b	.LBB50_20
	.p2align	2
.LBB50_29:                              @   in Loop: Header=BB50_21 Depth=1
	orr.w	r6, r4, r0
	rsb	r4, r3, r3, lsl #4
	add.w	r4, r12, r4, lsl #4
	str.w	r6, [r4, r2, lsl #2]
	b	.LBB50_20
	.p2align	2
.LBB50_30:
	add	sp, #68
	pop.w	{r4, r5, r6, r7, r8, r9, r10, r11, pc}
	.p2align	2
.LBB50_31:
	movw	r0, :lower16:.L.str.162
	movt	r0, :upper16:.L.str.162
	bl	credits_private_credits_fail
.Lfunc_end50:
	.size	credits_private_weather60_spaced, .Lfunc_end50-credits_private_weather60_spaced
	.cantunwind
	.fnend
                                        @ -- End function
	.globl	credits_private_framebuffer_pixel @ -- Begin function credits_private_framebuffer_pixel
	.p2align	1
	.prefalign	2, .Lfunc_end51, nop
	.type	credits_private_framebuffer_pixel,%function
	.code	16
	.thumb_func
credits_private_framebuffer_pixel:      @ @credits_private_framebuffer_pixel
	.fnstart
@ %bb.0:
	mov	r3, r0
	cmp	r1, #255
	mov.w	r0, #0
	it	ls
	cmpls	r2, #127
	bls	.LBB51_2
@ %bb.1:
	bx	lr
	.p2align	2
.LBB51_2:
	lsrs	r0, r1, #3
	add.w	r2, r3, r2, lsl #5
	ldrb	r0, [r2, r0]
	movs	r2, #7
	bic.w	r1, r2, r1
	lsrs	r0, r1
	and	r0, r0, #1
	bx	lr
.Lfunc_end51:
	.size	credits_private_framebuffer_pixel, .Lfunc_end51-credits_private_framebuffer_pixel
	.cantunwind
	.fnend
                                        @ -- End function
	.globl	credits_private_framebuffer_render @ -- Begin function credits_private_framebuffer_render
	.p2align	1
	.prefalign	2, .Lfunc_end52, nop
	.type	credits_private_framebuffer_render,%function
	.code	16
	.thumb_func
credits_private_framebuffer_render:     @ @credits_private_framebuffer_render
	.fnstart
@ %bb.0:
	movs	r2, #0
	b	credits_private_framebuffer_render_grid
.Lfunc_end52:
	.size	credits_private_framebuffer_render, .Lfunc_end52-credits_private_framebuffer_render
	.cantunwind
	.fnend
                                        @ -- End function
	.globl	credits_private_framebuffer_render_case @ -- Begin function credits_private_framebuffer_render_case
	.p2align	1
	.prefalign	2, .Lfunc_end53, nop
	.type	credits_private_framebuffer_render_case,%function
	.code	16
	.thumb_func
credits_private_framebuffer_render_case: @ @credits_private_framebuffer_render_case
	.fnstart
@ %bb.0:
	b	credits_private_framebuffer_render_grid
.Lfunc_end53:
	.size	credits_private_framebuffer_render_case, .Lfunc_end53-credits_private_framebuffer_render_case
	.cantunwind
	.fnend
                                        @ -- End function
	.p2align	1                               @ -- Begin function credits_private_framebuffer_render_grid
	.prefalign	2, .Lfunc_end54, nop
	.type	credits_private_framebuffer_render_grid,%function
	.code	16
	.thumb_func
credits_private_framebuffer_render_grid: @ @credits_private_framebuffer_render_grid
	.fnstart
@ %bb.0:
	.save	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	push.w	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	.pad	#44
	sub	sp, #44
	strd	r1, r2, [sp, #4]                @ 8-byte Folded Spill
	mov.w	r1, #4096
	str	r0, [sp, #32]                   @ 4-byte Spill
	bl	__aeabi_memclr
	movs	r0, #0
	movs	r2, #128
	movs	r5, #0
	str	r0, [sp, #12]                   @ 4-byte Spill
	b	.LBB54_2
	.p2align	2
.LBB54_1:                               @   in Loop: Header=BB54_2 Depth=1
	ldr	r5, [sp, #16]                   @ 4-byte Reload
	adds	r5, #1
	cmp.w	r5, #1200
	beq.w	.LBB54_72
.LBB54_2:                               @ =>This Loop Header: Depth=1
                                        @     Child Loop BB54_34 Depth 2
                                        @       Child Loop BB54_35 Depth 3
                                        @     Child Loop BB54_12 Depth 2
                                        @       Child Loop BB54_15 Depth 3
                                        @     Child Loop BB54_66 Depth 2
                                        @       Child Loop BB54_67 Depth 3
                                        @     Child Loop BB54_44 Depth 2
                                        @       Child Loop BB54_47 Depth 3
	ldr	r0, [sp, #4]                    @ 4-byte Reload
	mvn	r1, #31
	ldr.w	r6, [r0, r5, lsl #2]
	mvn	r0, #96
	uxth	r3, r6
	uxtah	r0, r0, r6
	cmp	r0, #26
	mov	r0, r3
	it	lo
	uxtahlo	r0, r1, r6
	ldr	r1, [sp, #8]                    @ 4-byte Reload
	cmp	r1, #0
	it	eq
	moveq	r0, r3
	cmp	r0, #160
	it	eq
	moveq	r0, #32
	sub.w	r3, r0, #32
	cmp	r3, #95
	bhs	.LBB54_4
@ %bb.3:                                @   in Loop: Header=BB54_2 Depth=1
	movw	r1, :lower16:credits_private_framebuffer_font
	movt	r1, :upper16:credits_private_framebuffer_font
	add.w	r0, r1, r0, lsl #1
	ldrh	r9, [r0, #-64]
	b	.LBB54_5
	.p2align	2
.LBB54_4:                               @   in Loop: Header=BB54_2 Depth=1
	cmp	r0, #176
	ldr	r0, [sp, #12]                   @ 4-byte Reload
	mov.w	r9, #10880
	it	ne
	addne	r0, #1
	str	r0, [sp, #12]                   @ 4-byte Spill
	it	ne
	movwne	r9, #29314
.LBB54_5:                               @   in Loop: Header=BB54_2 Depth=1
	movw	r0, #34953
	movt	r0, #34952
	umull	r0, r7, r5, r0
	movs	r0, #6
	tst.w	r6, #1073741824
	it	eq
	moveq	r0, #5
	str	r0, [sp, #40]                   @ 4-byte Spill
	lsr.w	r0, r7, #5
	mov	r11, r6
	lsl.w	r6, r0, #4
	sub.w	r7, r6, r7, lsr #5
	mov.w	r3, #4
	sub.w	r4, r5, r7, lsl #2
	mov.w	r1, #8
	it	eq
	moveq	r3, #3
	str	r5, [sp, #16]                   @ 4-byte Spill
	add.w	r5, r1, r4, lsl #2
	add.w	r0, r0, r0, lsl #1
	mov.w	r1, #4
	lsl.w	r12, r4, #2
	add.w	r0, r1, r0, lsl #1
	str	r0, [sp, #36]                   @ 4-byte Spill
	str.w	r11, [sp, #28]                  @ 4-byte Spill
	bne.w	.LBB54_32
@ %bb.6:                                @   in Loop: Header=BB54_2 Depth=1
	and	r0, r11, #4128768
	cmp.w	r0, #1966080
	ubfx	r0, r11, #22, #6
	mov	r6, r11
	bne.w	.LBB54_40
@ %bb.7:                                @   in Loop: Header=BB54_2 Depth=1
	and	r4, r6, #805306368
	cmp.w	r4, #268435456
	beq.w	.LBB54_40
@ %bb.8:                                @   in Loop: Header=BB54_2 Depth=1
	cmp	r0, #40
	str	r5, [sp, #20]                   @ 4-byte Spill
	beq	.LBB54_1
@ %bb.9:                                @   in Loop: Header=BB54_2 Depth=1
	cmp	r0, #49
	beq	.LBB54_1
@ %bb.10:                               @   in Loop: Header=BB54_2 Depth=1
	and	r10, r3, #3
	and	r5, r3, #4
	mov.w	r8, #0
	mov.w	lr, #11
	b	.LBB54_12
	.p2align	2
.LBB54_11:                              @   in Loop: Header=BB54_12 Depth=2
	ldr	r0, [sp, #40]                   @ 4-byte Reload
	add.w	r8, r8, #1
	ldr	r6, [sp, #28]                   @ 4-byte Reload
	cmp	r8, r0
	sub.w	lr, lr, #3
	beq.w	.LBB54_1
.LBB54_12:                              @   Parent Loop BB54_2 Depth=1
                                        @ =>  This Loop Header: Depth=2
                                        @       Child Loop BB54_15 Depth 3
	ldr	r0, [sp, #36]                   @ 4-byte Reload
	lsls	r1, r6, #1
	ldr	r1, [sp, #32]                   @ 4-byte Reload
	add	r0, r8
	add.w	r4, r1, r0, lsl #5
	mov.w	r6, #0
	bpl	.LBB54_24
@ %bb.13:                               @   in Loop: Header=BB54_12 Depth=2
	mov	r0, lr
	b	.LBB54_15
	.p2align	2
.LBB54_14:                              @   in Loop: Header=BB54_15 Depth=3
	adds	r6, #4
	cmp	r5, r6
	sub.w	r0, r0, #4
	beq	.LBB54_23
.LBB54_15:                              @   Parent Loop BB54_2 Depth=1
                                        @     Parent Loop BB54_12 Depth=2
                                        @ =>    This Inner Loop Header: Depth=3
	adds	r1, r0, #3
	lsr.w	r1, r9, r1
	lsls	r1, r1, #31
	beq	.LBB54_19
@ %bb.16:                               @   in Loop: Header=BB54_15 Depth=3
	adds	r1, r0, #2
	lsr.w	r1, r9, r1
	lsls	r1, r1, #31
	beq	.LBB54_20
.LBB54_17:                              @   in Loop: Header=BB54_15 Depth=3
	adds	r1, r0, #1
	lsr.w	r1, r9, r1
	lsls	r1, r1, #31
	beq	.LBB54_21
.LBB54_18:                              @   in Loop: Header=BB54_15 Depth=3
	lsr.w	r1, r9, r0
	lsls	r1, r1, #31
	bne	.LBB54_14
	b	.LBB54_22
	.p2align	2
.LBB54_19:                              @   in Loop: Header=BB54_15 Depth=3
	add.w	r1, r12, r6
	adds	r1, #8
	and	r7, r1, #4
	lsrs	r1, r1, #3
	ldrb	r3, [r4, r1]
	lsr.w	r7, r2, r7
	orrs	r3, r7
	strb	r3, [r4, r1]
	adds	r1, r0, #2
	lsr.w	r1, r9, r1
	lsls	r1, r1, #31
	bne	.LBB54_17
.LBB54_20:                              @   in Loop: Header=BB54_15 Depth=3
	add.w	r1, r12, r6
	adds	r1, #9
	and	r3, r1, #5
	lsrs	r1, r1, #3
	ldrb	r7, [r4, r1]
	lsr.w	r3, r2, r3
	orrs	r3, r7
	strb	r3, [r4, r1]
	adds	r1, r0, #1
	lsr.w	r1, r9, r1
	lsls	r1, r1, #31
	bne	.LBB54_18
.LBB54_21:                              @   in Loop: Header=BB54_15 Depth=3
	add.w	r1, r12, r6
	adds	r1, #10
	and	r3, r1, #6
	lsrs	r1, r1, #3
	ldrb	r7, [r4, r1]
	lsr.w	r3, r2, r3
	orrs	r3, r7
	strb	r3, [r4, r1]
	lsr.w	r1, r9, r0
	lsls	r1, r1, #31
	bne	.LBB54_14
.LBB54_22:                              @   in Loop: Header=BB54_15 Depth=3
	add.w	r1, r12, r6
	adds	r1, #11
	and	r3, r1, #7
	lsrs	r1, r1, #3
	ldrb	r7, [r4, r1]
	lsr.w	r3, r2, r3
	orrs	r3, r7
	strb	r3, [r4, r1]
	b	.LBB54_14
	.p2align	2
.LBB54_23:                              @   in Loop: Header=BB54_12 Depth=2
	cmp.w	r10, #0
	beq	.LBB54_11
.LBB54_24:                              @   in Loop: Header=BB54_12 Depth=2
	sub.w	r0, r8, r8, lsl #2
	adds	r0, #14
	subs	r1, r0, r6
	lsr.w	r1, r9, r1
	lsls	r1, r1, #31
	beq	.LBB54_26
@ %bb.25:                               @   in Loop: Header=BB54_12 Depth=2
	cmp.w	r10, #1
	beq.w	.LBB54_11
	b	.LBB54_27
	.p2align	2
.LBB54_26:                              @   in Loop: Header=BB54_12 Depth=2
	ldr	r1, [sp, #20]                   @ 4-byte Reload
	add	r1, r6
	and	r3, r1, #7
	lsrs	r1, r1, #3
	ldrb	r7, [r4, r1]
	lsr.w	r3, r2, r3
	orrs	r3, r7
	strb	r3, [r4, r1]
	cmp.w	r10, #1
	beq.w	.LBB54_11
.LBB54_27:                              @   in Loop: Header=BB54_12 Depth=2
	add.w	r11, r6, #1
	sub.w	r1, r0, r11
	lsr.w	r1, r9, r1
	lsls	r1, r1, #31
	beq	.LBB54_29
@ %bb.28:                               @   in Loop: Header=BB54_12 Depth=2
	cmp.w	r10, #2
	beq.w	.LBB54_11
	b	.LBB54_30
	.p2align	2
.LBB54_29:                              @   in Loop: Header=BB54_12 Depth=2
	ldr	r1, [sp, #20]                   @ 4-byte Reload
	add	r1, r11
	and	r3, r1, #7
	lsrs	r1, r1, #3
	ldrb	r7, [r4, r1]
	lsr.w	r3, r2, r3
	orrs	r3, r7
	strb	r3, [r4, r1]
	cmp.w	r10, #2
	beq.w	.LBB54_11
.LBB54_30:                              @   in Loop: Header=BB54_12 Depth=2
	adds	r6, #2
	subs	r0, r0, r6
	lsr.w	r0, r9, r0
	lsls	r0, r0, #31
	bne.w	.LBB54_11
@ %bb.31:                               @   in Loop: Header=BB54_12 Depth=2
	ldr	r0, [sp, #20]                   @ 4-byte Reload
	add	r0, r6
	and	r1, r0, #7
	lsrs	r0, r0, #3
	ldrb	r3, [r4, r0]
	lsr.w	r1, r2, r1
	orrs	r1, r3
	strb	r1, [r4, r0]
	b	.LBB54_11
	.p2align	2
.LBB54_32:                              @   in Loop: Header=BB54_2 Depth=1
	adds	r0, r5, #2
	and	lr, r3, #3
	and	r3, r3, #4
	add.w	r10, r5, #1
	mov	r9, r5
	mov.w	r8, #0
	mov	r6, r11
	mov	r11, r0
	b	.LBB54_34
	.p2align	2
.LBB54_33:                              @   in Loop: Header=BB54_34 Depth=2
	ldr	r0, [sp, #40]                   @ 4-byte Reload
	add.w	r8, r8, #1
	cmp	r8, r0
	beq.w	.LBB54_1
.LBB54_34:                              @   Parent Loop BB54_2 Depth=1
                                        @ =>  This Loop Header: Depth=2
                                        @       Child Loop BB54_35 Depth 3
	ldr	r0, [sp, #36]                   @ 4-byte Reload
	lsls	r7, r6, #1
	add.w	r1, r8, r0
	ldr	r0, [sp, #32]                   @ 4-byte Reload
	mov.w	r4, #0
	add.w	r5, r0, r1, lsl #5
	bpl	.LBB54_37
	.p2align	2
.LBB54_35:                              @   Parent Loop BB54_2 Depth=1
                                        @     Parent Loop BB54_34 Depth=2
                                        @ =>    This Inner Loop Header: Depth=3
	add.w	r0, r12, r4
	add.w	r1, r0, #8
	and	r7, r1, #4
	lsrs	r1, r1, #3
	ldrb	r6, [r5, r1]
	lsr.w	r7, r2, r7
	orrs	r6, r7
	strb	r6, [r5, r1]
	add.w	r1, r0, #9
	and	r6, r1, #5
	lsrs	r1, r1, #3
	ldrb	r7, [r5, r1]
	lsr.w	r6, r2, r6
	orrs	r6, r7
	strb	r6, [r5, r1]
	add.w	r1, r0, #10
	and	r6, r1, #6
	lsrs	r1, r1, #3
	ldrb	r7, [r5, r1]
	lsr.w	r6, r2, r6
	orrs	r6, r7
	adds	r0, #11
	strb	r6, [r5, r1]
	and	r1, r0, #7
	lsrs	r0, r0, #3
	ldrb	r6, [r5, r0]
	lsr.w	r1, r2, r1
	adds	r4, #4
	orrs	r1, r6
	cmp	r3, r4
	strb	r1, [r5, r0]
	bne	.LBB54_35
@ %bb.36:                               @   in Loop: Header=BB54_34 Depth=2
	ldr	r6, [sp, #28]                   @ 4-byte Reload
	cmp.w	lr, #0
	beq	.LBB54_33
.LBB54_37:                              @   in Loop: Header=BB54_34 Depth=2
	add.w	r1, r9, r4
	and	r7, r1, #7
	lsrs	r1, r1, #3
	ldrb	r0, [r5, r1]
	lsr.w	r7, r2, r7
	orrs	r0, r7
	cmp.w	lr, #1
	strb	r0, [r5, r1]
	beq	.LBB54_33
@ %bb.38:                               @   in Loop: Header=BB54_34 Depth=2
	add.w	r0, r4, r10
	and	r1, r0, #7
	lsrs	r0, r0, #3
	ldrb	r7, [r5, r0]
	lsr.w	r1, r2, r1
	orrs	r1, r7
	cmp.w	lr, #2
	strb	r1, [r5, r0]
	beq	.LBB54_33
@ %bb.39:                               @   in Loop: Header=BB54_34 Depth=2
	add.w	r0, r4, r11
	and	r1, r0, #7
	lsrs	r0, r0, #3
	ldrb	r4, [r5, r0]
	lsr.w	r1, r2, r1
	orrs	r1, r4
	strb	r1, [r5, r0]
	b	.LBB54_33
	.p2align	2
.LBB54_40:                              @   in Loop: Header=BB54_2 Depth=1
	and	r1, r3, #3
	cmp	r0, #49
	and	r11, r3, #4
	str	r1, [sp, #24]                   @ 4-byte Spill
	beq	.LBB54_42
@ %bb.41:                               @   in Loop: Header=BB54_2 Depth=1
	cmp	r0, #40
	bne.w	.LBB54_64
.LBB54_42:                              @   in Loop: Header=BB54_2 Depth=1
	movs	r4, #0
	mov.w	lr, #11
	str	r5, [sp, #20]                   @ 4-byte Spill
	b	.LBB54_44
	.p2align	2
.LBB54_43:                              @   in Loop: Header=BB54_44 Depth=2
	ldr	r0, [sp, #40]                   @ 4-byte Reload
	adds	r4, #1
	ldr	r6, [sp, #28]                   @ 4-byte Reload
	cmp	r4, r0
	sub.w	lr, lr, #3
	beq.w	.LBB54_1
.LBB54_44:                              @   Parent Loop BB54_2 Depth=1
                                        @ =>  This Loop Header: Depth=2
                                        @       Child Loop BB54_47 Depth 3
	ldr	r0, [sp, #36]                   @ 4-byte Reload
	ldr	r1, [sp, #32]                   @ 4-byte Reload
	add	r0, r4
	lsls	r5, r6, #1
	add.w	r0, r1, r0, lsl #5
	mov.w	r5, #0
	bpl	.LBB54_56
@ %bb.45:                               @   in Loop: Header=BB54_44 Depth=2
	mov	r6, lr
	b	.LBB54_47
	.p2align	2
.LBB54_46:                              @   in Loop: Header=BB54_47 Depth=3
	adds	r5, #4
	cmp	r11, r5
	sub.w	r6, r6, #4
	beq	.LBB54_55
.LBB54_47:                              @   Parent Loop BB54_2 Depth=1
                                        @     Parent Loop BB54_44 Depth=2
                                        @ =>    This Inner Loop Header: Depth=3
	adds	r7, r6, #3
	lsr.w	r7, r9, r7
	lsls	r7, r7, #31
	beq	.LBB54_49
@ %bb.48:                               @   in Loop: Header=BB54_47 Depth=3
	add.w	r7, r12, r5
	adds	r7, #8
	and	r8, r7, #4
	lsrs	r7, r7, #3
	ldrb.w	r10, [r0, r7]
	lsr.w	r1, r2, r8
	orr.w	r1, r1, r10
	strb	r1, [r0, r7]
.LBB54_49:                              @   in Loop: Header=BB54_47 Depth=3
	adds	r1, r6, #2
	lsr.w	r1, r9, r1
	lsls	r1, r1, #31
	beq	.LBB54_51
@ %bb.50:                               @   in Loop: Header=BB54_47 Depth=3
	add.w	r1, r12, r5
	adds	r1, #9
	and	r7, r1, #5
	lsrs	r1, r1, #3
	ldrb	r3, [r0, r1]
	lsr.w	r7, r2, r7
	orrs	r3, r7
	strb	r3, [r0, r1]
.LBB54_51:                              @   in Loop: Header=BB54_47 Depth=3
	adds	r1, r6, #1
	lsr.w	r1, r9, r1
	lsls	r1, r1, #31
	beq	.LBB54_53
@ %bb.52:                               @   in Loop: Header=BB54_47 Depth=3
	add.w	r1, r12, r5
	adds	r1, #10
	and	r3, r1, #6
	lsrs	r1, r1, #3
	ldrb	r7, [r0, r1]
	lsr.w	r3, r2, r3
	orrs	r3, r7
	strb	r3, [r0, r1]
.LBB54_53:                              @   in Loop: Header=BB54_47 Depth=3
	lsr.w	r1, r9, r6
	lsls	r1, r1, #31
	beq	.LBB54_46
@ %bb.54:                               @   in Loop: Header=BB54_47 Depth=3
	add.w	r1, r12, r5
	adds	r1, #11
	and	r3, r1, #7
	lsrs	r1, r1, #3
	ldrb	r7, [r0, r1]
	lsr.w	r3, r2, r3
	orrs	r3, r7
	strb	r3, [r0, r1]
	b	.LBB54_46
	.p2align	2
.LBB54_55:                              @   in Loop: Header=BB54_44 Depth=2
	ldr	r1, [sp, #24]                   @ 4-byte Reload
	cmp	r1, #0
	beq	.LBB54_43
.LBB54_56:                              @   in Loop: Header=BB54_44 Depth=2
	sub.w	r1, r4, r4, lsl #2
	add.w	r6, r1, #14
	subs	r1, r6, r5
	lsr.w	r1, r9, r1
	lsls	r1, r1, #31
	beq	.LBB54_58
@ %bb.57:                               @   in Loop: Header=BB54_44 Depth=2
	ldr	r1, [sp, #20]                   @ 4-byte Reload
	add	r1, r5
	and	r3, r1, #7
	lsrs	r1, r1, #3
	ldrb	r7, [r0, r1]
	lsr.w	r3, r2, r3
	orrs	r3, r7
	strb	r3, [r0, r1]
.LBB54_58:                              @   in Loop: Header=BB54_44 Depth=2
	ldr	r1, [sp, #24]                   @ 4-byte Reload
	cmp	r1, #1
	beq.w	.LBB54_43
@ %bb.59:                               @   in Loop: Header=BB54_44 Depth=2
	adds	r7, r5, #1
	subs	r1, r6, r7
	lsr.w	r1, r9, r1
	lsls	r1, r1, #31
	beq	.LBB54_61
@ %bb.60:                               @   in Loop: Header=BB54_44 Depth=2
	ldr	r1, [sp, #20]                   @ 4-byte Reload
	add	r1, r7
	and	r3, r1, #7
	lsrs	r1, r1, #3
	ldrb	r7, [r0, r1]
	lsr.w	r3, r2, r3
	orrs	r3, r7
	strb	r3, [r0, r1]
.LBB54_61:                              @   in Loop: Header=BB54_44 Depth=2
	ldr	r1, [sp, #24]                   @ 4-byte Reload
	cmp	r1, #2
	beq.w	.LBB54_43
@ %bb.62:                               @   in Loop: Header=BB54_44 Depth=2
	adds	r5, #2
	subs	r1, r6, r5
	lsr.w	r1, r9, r1
	lsls	r1, r1, #31
	beq.w	.LBB54_43
@ %bb.63:                               @   in Loop: Header=BB54_44 Depth=2
	ldr	r1, [sp, #20]                   @ 4-byte Reload
	add	r1, r5
	and	r3, r1, #7
	lsrs	r1, r1, #3
	ldrb	r5, [r0, r1]
	lsr.w	r3, r2, r3
	orrs	r3, r5
	strb	r3, [r0, r1]
	b	.LBB54_43
	.p2align	2
.LBB54_64:                              @   in Loop: Header=BB54_2 Depth=1
	add.w	r8, r5, #1
	mov	r9, r5
	add.w	lr, r5, #2
	movs	r4, #0
	b	.LBB54_66
	.p2align	2
.LBB54_65:                              @   in Loop: Header=BB54_66 Depth=2
	ldr	r0, [sp, #40]                   @ 4-byte Reload
	adds	r4, #1
	ldr	r6, [sp, #28]                   @ 4-byte Reload
	cmp	r4, r0
	beq.w	.LBB54_1
.LBB54_66:                              @   Parent Loop BB54_2 Depth=1
                                        @ =>  This Loop Header: Depth=2
                                        @       Child Loop BB54_67 Depth 3
	ldr	r0, [sp, #36]                   @ 4-byte Reload
	lsls	r7, r6, #1
	add.w	r1, r4, r0
	ldr	r0, [sp, #32]                   @ 4-byte Reload
	mov.w	r6, #0
	add.w	r5, r0, r1, lsl #5
	bpl	.LBB54_69
	.p2align	2
.LBB54_67:                              @   Parent Loop BB54_2 Depth=1
                                        @     Parent Loop BB54_66 Depth=2
                                        @ =>    This Inner Loop Header: Depth=3
	add.w	r1, r12, r6
	add.w	r7, r1, #8
	and	r3, r7, #4
	lsrs	r7, r7, #3
	ldrb	r0, [r5, r7]
	lsr.w	r3, r2, r3
	orrs	r0, r3
	strb	r0, [r5, r7]
	add.w	r0, r1, #9
	and	r3, r0, #5
	lsrs	r0, r0, #3
	ldrb	r7, [r5, r0]
	lsr.w	r3, r2, r3
	orrs	r3, r7
	strb	r3, [r5, r0]
	add.w	r0, r1, #10
	and	r3, r0, #6
	lsrs	r0, r0, #3
	ldrb	r7, [r5, r0]
	lsr.w	r3, r2, r3
	orrs	r3, r7
	strb	r3, [r5, r0]
	add.w	r0, r1, #11
	and	r1, r0, #7
	lsrs	r0, r0, #3
	ldrb	r3, [r5, r0]
	lsr.w	r1, r2, r1
	adds	r6, #4
	orrs	r1, r3
	cmp	r11, r6
	strb	r1, [r5, r0]
	bne	.LBB54_67
@ %bb.68:                               @   in Loop: Header=BB54_66 Depth=2
	ldr	r0, [sp, #24]                   @ 4-byte Reload
	cmp	r0, #0
	beq	.LBB54_65
.LBB54_69:                              @   in Loop: Header=BB54_66 Depth=2
	add.w	r0, r9, r6
	and	r1, r0, #7
	lsrs	r0, r0, #3
	ldrb	r3, [r5, r0]
	lsr.w	r1, r2, r1
	orrs	r1, r3
	ldr	r3, [sp, #24]                   @ 4-byte Reload
	strb	r1, [r5, r0]
	cmp	r3, #1
	beq	.LBB54_65
@ %bb.70:                               @   in Loop: Header=BB54_66 Depth=2
	add.w	r0, r6, r8
	and	r1, r0, #7
	lsrs	r0, r0, #3
	ldrb	r3, [r5, r0]
	lsr.w	r1, r2, r1
	orrs	r1, r3
	ldr	r3, [sp, #24]                   @ 4-byte Reload
	strb	r1, [r5, r0]
	cmp	r3, #2
	beq	.LBB54_65
@ %bb.71:                               @   in Loop: Header=BB54_66 Depth=2
	add.w	r0, r6, lr
	and	r1, r0, #7
	lsrs	r0, r0, #3
	ldrb	r3, [r5, r0]
	lsr.w	r1, r2, r1
	orrs	r1, r3
	strb	r1, [r5, r0]
	b	.LBB54_65
	.p2align	2
.LBB54_72:
	ldr	r0, [sp, #12]                   @ 4-byte Reload
	add	sp, #44
	pop.w	{r4, r5, r6, r7, r8, r9, r10, r11, pc}
.Lfunc_end54:
	.size	credits_private_framebuffer_render_grid, .Lfunc_end54-credits_private_framebuffer_render_grid
	.cantunwind
	.fnend
                                        @ -- End function
	.globl	credits_private_framebuffer_render60 @ -- Begin function credits_private_framebuffer_render60
	.p2align	1
	.prefalign	2, .Lfunc_end55, nop
	.type	credits_private_framebuffer_render60,%function
	.code	16
	.thumb_func
credits_private_framebuffer_render60:   @ @credits_private_framebuffer_render60
	.fnstart
@ %bb.0:
	b	credits_private_framebuffer_render_grid
.Lfunc_end55:
	.size	credits_private_framebuffer_render60, .Lfunc_end55-credits_private_framebuffer_render60
	.cantunwind
	.fnend
                                        @ -- End function
	.globl	credits_private_fixed_beat_deadline @ -- Begin function credits_private_fixed_beat_deadline
	.p2align	1
	.prefalign	2, .Lfunc_end56, nop
	.type	credits_private_fixed_beat_deadline,%function
	.code	16
	.thumb_func
credits_private_fixed_beat_deadline:    @ @credits_private_fixed_beat_deadline
	.fnstart
@ %bb.0:
	.save	{r4, r5, r6, r7, lr}
	push	{r4, r5, r6, r7, lr}
	.pad	#4
	sub	sp, #4
	movw	r4, #47284
	movt	r4, #3
	movw	r1, #1875
	movs	r5, #0
	smlal	r4, r5, r0, r1
	mov	r0, r4
	mov	r1, r5
	movw	r2, #44750
	movs	r3, #0
	movs	r6, #0
	movw	r7, #44750
	bl	__aeabi_ldivmod
	umull	r2, r3, r0, r7
	mla	r1, r1, r7, r3
	movw	r3, #9745
	subs	r2, r4, r2
	movt	r3, #26967
	sbcs.w	r1, r5, r1
	it	mi
	addmi	r2, r7
	umull	r3, r7, r2, r3
	movw	r3, #15119
	movt	r3, #23994
	umlal	r7, r6, r2, r3
	add.w	r1, r0, r1, asr #31
	lsls	r0, r6, #18
	orr.w	r0, r0, r7, lsr #14
	add.w	r1, r1, r6, lsr #14
	add	sp, #4
	pop	{r4, r5, r6, r7, pc}
.Lfunc_end56:
	.size	credits_private_fixed_beat_deadline, .Lfunc_end56-credits_private_fixed_beat_deadline
	.cantunwind
	.fnend
                                        @ -- End function
	.globl	credits_private_fixed_time_ratio @ -- Begin function credits_private_fixed_time_ratio
	.p2align	1
	.prefalign	2, .Lfunc_end57, nop
	.type	credits_private_fixed_time_ratio,%function
	.code	16
	.thumb_func
credits_private_fixed_time_ratio:       @ @credits_private_fixed_time_ratio
	.fnstart
@ %bb.0:
	.save	{r4, r5, r6, lr}
	push	{r4, r5, r6, lr}
	cbz	r2, .LBB57_3
@ %bb.1:
	movs	r3, #0
	mov	r4, r2
	mov	r5, r0
	bl	__aeabi_uldivmod
	mov	r6, r0
	subs.w	r0, r0, #-2147483648
	sbcs	r0, r1, #0
	bhs	.LBB57_4
@ %bb.2:
	mls	r1, r6, r4, r5
	movs	r0, #0
	mov	r2, r4
	movs	r3, #0
	bl	__aeabi_uldivmod
	add	r1, r6
	pop	{r4, r5, r6, pc}
	.p2align	2
.LBB57_3:
	movw	r0, :lower16:.L.str.70
	movt	r0, :upper16:.L.str.70
	bl	credits_private_credits_fail
	.p2align	2
.LBB57_4:
	movw	r0, :lower16:.L.str.71
	movt	r0, :upper16:.L.str.71
	bl	credits_private_credits_fail
.Lfunc_end57:
	.size	credits_private_fixed_time_ratio, .Lfunc_end57-credits_private_fixed_time_ratio
	.cantunwind
	.fnend
                                        @ -- End function
	.globl	credits_private_fixed_player_init @ -- Begin function credits_private_fixed_player_init
	.p2align	1
	.prefalign	2, .Lfunc_end58, nop
	.type	credits_private_fixed_player_init,%function
	.code	16
	.thumb_func
credits_private_fixed_player_init:      @ @credits_private_fixed_player_init
	.fnstart
@ %bb.0:
	.save	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	push.w	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	.pad	#4
	sub	sp, #4
	ldr.w	r12, [sp, #44]
	cmp.w	r12, #-1
	ble.w	.LBB58_8
@ %bb.1:
	mov	r4, r0
	subs	r0, r2, #7
	cmn.w	r0, #7
	bls.w	.LBB58_9
@ %bb.2:
	movw	r0, #7376
	adds	r7, r1, r0
	ldr.w	r0, [r7, #2760]
	cmp	r0, #0
	itt	eq
	ldreq	r0, [r7]
	addseq.w	r0, r0, #1
	beq	.LBB58_4
@ %bb.3:
	movw	r0, :lower16:.L.str.36
	movt	r0, :upper16:.L.str.36
	bl	credits_private_credits_fail
	.p2align	2
.LBB58_4:
	movw	r0, :lower16:credits_private_fixed_player_init.amounts
	movt	r0, :upper16:credits_private_fixed_player_init.amounts
	str.w	r2, [r7, #2748]
	add.w	r0, r0, r2, lsl #2
	ldr	r0, [r0, #-4]
	ldr	r6, [sp, #40]
	movs	r5, #0
	movw	r8, #47284
	subs	r3, r0, #1
	movw	r10, #9745
	movw	r9, #15119
	movt	r8, #3
	str	r3, [r7]
	sub.w	r11, r0, #60
	strd	r1, r5, [r4]
	movs	r1, #1
	cmp	r2, #1
	movt	r10, #26967
	movt	r9, #23994
	strd	r6, r12, [r4, #16]
	strd	r6, r12, [r4, #24]
	strd	r5, r5, [r4, #40]
	strd	r11, r5, [r4, #48]
	strd	r5, r5, [r4, #56]
	strd	r1, r5, [r4, #64]
	bne	.LBB58_6
@ %bb.5:
	movs	r0, #0
	movs	r1, #0
	b	.LBB58_7
	.p2align	2
.LBB58_6:
	adds	r0, #1
	movw	r1, #1875
	mov	r6, r8
	movs	r7, #0
	smlal	r6, r7, r0, r1
	mov	r0, r6
	mov	r1, r7
	movw	r2, #44750
	movs	r3, #0
	mov	r10, r9
	movw	r9, #44750
	bl	__aeabi_ldivmod
	umull	r2, r3, r0, r9
	mla	r1, r1, r9, r3
	subs	r2, r6, r2
	sbcs.w	r1, r7, r1
	it	mi
	addmi	r2, r9
	mov	r9, r10
	movw	r10, #9745
	movt	r10, #26967
	umull	r3, r7, r2, r10
	movs	r3, #0
	umlal	r7, r3, r2, r9
	add.w	r1, r0, r1, asr #31
	lsls	r0, r3, #18
	orr.w	r0, r0, r7, lsr #14
	add.w	r1, r1, r3, lsr #14
.LBB58_7:
	strd	r0, r1, [r4, #8]
	movw	r0, #1875
	movs	r6, #0
	smlal	r8, r6, r11, r0
	mov	r0, r8
	mov	r1, r6
	movw	r2, #44750
	movs	r3, #0
	movw	r7, #44750
	bl	__aeabi_ldivmod
	umull	r2, r3, r0, r7
	mla	r1, r1, r7, r3
	subs.w	r2, r8, r2
	sbcs.w	r1, r6, r1
	it	mi
	addmi	r2, r7
	umull	r3, r6, r2, r10
	umlal	r6, r5, r2, r9
	add.w	r0, r0, r1, asr #31
	lsls	r1, r5, #18
	orr.w	r1, r1, r6, lsr #14
	mul	r2, r1, r7
	rsbs	r2, r2, #0
	add.w	r0, r0, r5, lsr #14
	strd	r1, r0, [r4, #32]
	str	r2, [r4, #40]
	add	sp, #4
	pop.w	{r4, r5, r6, r7, r8, r9, r10, r11, pc}
	.p2align	2
.LBB58_8:
	movw	r0, :lower16:.L.str.72
	movt	r0, :upper16:.L.str.72
	bl	credits_private_credits_fail
	.p2align	2
.LBB58_9:
	movw	r0, :lower16:.L.str.35
	movt	r0, :upper16:.L.str.35
	bl	credits_private_credits_fail
.Lfunc_end58:
	.size	credits_private_fixed_player_init, .Lfunc_end58-credits_private_fixed_player_init
	.cantunwind
	.fnend
                                        @ -- End function
	.globl	credits_private_fixed_player_step @ -- Begin function credits_private_fixed_player_step
	.p2align	1
	.prefalign	2, .Lfunc_end59, nop
	.type	credits_private_fixed_player_step,%function
	.code	16
	.thumb_func
credits_private_fixed_player_step:      @ @credits_private_fixed_player_step
	.fnstart
@ %bb.0:
	.save	{r7, lr}
	push	{r7, lr}
	.pad	#16
	sub	sp, #16
	ldrd	r1, r12, [sp, #24]
	mov.w	lr, #1
	stm.w	sp, {r1, r12, lr}
	bl	credits_private_player_fixed_step
	add	sp, #16
	pop	{r7, pc}
.Lfunc_end59:
	.size	credits_private_fixed_player_step, .Lfunc_end59-credits_private_fixed_player_step
	.cantunwind
	.fnend
                                        @ -- End function
	.p2align	1                               @ -- Begin function credits_private_player_fixed_step
	.prefalign	2, .Lfunc_end60, nop
	.type	credits_private_player_fixed_step,%function
	.code	16
	.thumb_func
credits_private_player_fixed_step:      @ @credits_private_player_fixed_step
	.fnstart
@ %bb.0:
	.save	{r4, r5, r6, r7, r8, r9, lr}
	push.w	{r4, r5, r6, r7, r8, r9, lr}
	.pad	#4
	sub	sp, #4
	cmp	r3, #0
	bmi.w	.LBB60_42
@ %bb.1:
	ldrd	r6, r1, [r0, #16]
	subs	r7, r2, r6
	sbcs.w	r7, r3, r1
	blt.w	.LBB60_42
@ %bb.2:
	ldr	r7, [r0, #64]
	cmp	r7, #0
	beq	.LBB60_12
@ %bb.3:
	ldr	r7, [sp, #40]
	cbz	r7, .LBB60_5
@ %bb.4:
	ldr	r7, [r0, #52]
	cmp	r7, #0
	beq	.LBB60_14
.LBB60_5:
	ldr	r1, [sp, #36]
	strd	r2, r3, [r0, #16]
	cmp	r1, #0
	beq	.LBB60_17
.LBB60_6:
	ldrd	r1, r7, [r0, #8]
	ldrd	r6, r5, [r0, #32]
	movs	r4, #0
	subs	r1, r6, r1
	sbcs.w	r1, r5, r7
	it	lt
	movlt	r4, #1
	bge	.LBB60_9
@ %bb.7:
	ldr	r5, [r0]
	movw	r1, #7352
	add	r1, r5
	mov	r7, r0
	mov	r0, r1
	movs	r1, #1
	mov	r8, r2
	mov	r9, r3
	bl	credits_private_scheduler_next
	movw	r2, #10136
	ldr	r1, [r5, r2]
	mov	r0, r7
	adds	r3, r1, #1
	ldr	r1, [r7, #48]
	mvn	r7, #-2147483648
	cmp	r1, r7
	str	r3, [r5, r2]
	beq.w	.LBB60_44
@ %bb.8:
	adds	r1, #1
	add.w	r3, r0, #32
	movw	r7, #12500
	str	r1, [r0, #48]
	ldm	r3, {r1, r2, r3}
	add	r7, r3
	movw	r5, #60410
	movw	r6, #44749
	movt	r5, #2745
	cmp	r7, r6
	it	hi
	addhi	r5, #1
	movw	r6, #32250
	it	hi
	subhi	r7, r3, r6
	adds	r1, r1, r5
	adc	r2, r2, #0
	add.w	r3, r0, #32
	stm	r3!, {r1, r2, r7}
	mov	r3, r9
	mov	r2, r8
.LBB60_9:
	ldrd	r1, r7, [r0, #24]
	movw	r6, #34953
	subs	r1, r2, r1
	movt	r6, #2184
	sbc.w	r7, r3, r7
	subs	r1, r1, r6
	sbcs	r1, r7, #0
	blt	.LBB60_13
@ %bb.10:
	ldr.w	r12, [sp, #32]
	lsls.w	r1, r12, #31
	bne	.LBB60_20
@ %bb.11:
	movs	r1, #0
	b	.LBB60_23
	.p2align	2
.LBB60_12:
	movs	r4, #0
.LBB60_13:
	mov	r0, r4
	add	sp, #4
	pop.w	{r4, r5, r6, r7, r8, r9, pc}
	.p2align	2
.LBB60_14:
	ldr	r5, [r0, #12]
	subs	r6, r2, r6
	sbc.w	r1, r3, r1
	orrs.w	r7, r1, r5
	bmi.w	.LBB60_43
@ %bb.15:
	ldr	r7, [r0, #8]
	mvn	r4, #-2147483648
	eor.w	r12, r1, r4
	mvns	r4, r6
	subs	r4, r4, r7
	sbcs.w	r4, r12, r5
	blt.w	.LBB60_43
@ %bb.16:
	adds	r7, r7, r6
	adcs	r1, r5
	strd	r7, r1, [r0, #8]
	ldr	r1, [sp, #36]
	strd	r2, r3, [r0, #16]
	cmp	r1, #0
	bne	.LBB60_6
.LBB60_17:
	movs	r1, #32
	ldr	r2, [r0]
	movt	r1, #3175
	movs	r3, #0
	str	r3, [r0, #64]
	.p2align	2
.LBB60_18:                              @ =>This Inner Loop Header: Depth=1
	adds	r0, r2, r3
	adds	r3, #240
	cmp.w	r3, #4800
	strd	r1, r1, [r0, #24]
	strd	r1, r1, [r0, #32]
	strd	r1, r1, [r0, #40]
	strd	r1, r1, [r0, #48]
	strd	r1, r1, [r0, #56]
	strd	r1, r1, [r0, #64]
	strd	r1, r1, [r0, #72]
	strd	r1, r1, [r0, #80]
	strd	r1, r1, [r0, #88]
	strd	r1, r1, [r0, #96]
	strd	r1, r1, [r0, #104]
	strd	r1, r1, [r0, #112]
	strd	r1, r1, [r0, #120]
	strd	r1, r1, [r0, #128]
	strd	r1, r1, [r0, #136]
	strd	r1, r1, [r0, #144]
	strd	r1, r1, [r0, #152]
	strd	r1, r1, [r0, #160]
	strd	r1, r1, [r0, #168]
	strd	r1, r1, [r0, #176]
	strd	r1, r1, [r0, #184]
	strd	r1, r1, [r0, #192]
	strd	r1, r1, [r0, #200]
	strd	r1, r1, [r0, #208]
	strd	r1, r1, [r0, #216]
	strd	r1, r1, [r0, #224]
	strd	r1, r1, [r0, #232]
	strd	r1, r1, [r0, #240]
	strd	r1, r1, [r0, #248]
	str.w	r1, [r0, #256]
	str.w	r1, [r0, #260]
	bne	.LBB60_18
@ %bb.19:
	mov.w	r0, #4832
	movs	r1, #49
	str	r1, [r2, r0]
	movs	r4, #2
	mov	r0, r4
	add	sp, #4
	pop.w	{r4, r5, r6, r7, r8, r9, pc}
	.p2align	2
.LBB60_20:
	ldr	r1, [r0, #56]
	cbz	r1, .LBB60_22
@ %bb.21:
	lsls.w	r1, r12, #30
	bmi	.LBB60_24
	b	.LBB60_28
	.p2align	2
.LBB60_22:
	ldr	r1, [r0, #52]
	clz	r1, r1
	lsrs	r1, r1, #5
	str	r1, [r0, #52]
	movs	r1, #1
.LBB60_23:
	str	r1, [r0, #56]
	lsls.w	r1, r12, #30
	bpl	.LBB60_28
.LBB60_24:
	ldr	r1, [r0, #60]
	cmp	r1, #0
	beq	.LBB60_33
@ %bb.25:
	ldr.w	lr, [r0, #44]
	movw	r1, #48695
	movt	r1, #23065
	umull	r1, r6, lr, r1
	movw	r1, #4027
	movt	r1, #183
	movs	r7, #0
	umlal	r6, r7, lr, r1
	movw	r1, #28587
	movt	r1, #54918
	ldr	r5, [r0, #12]
	adds	r1, r1, r6
	mov.w	r8, #0
	adcs	r9, r7, #15
	adc	r8, r8, #0
	cmp	r5, #0
	bmi.w	.LBB60_43
@ %bb.26:
	movw	r6, #50143
	movt	r6, #8237
	ldr	r7, [r0, #8]
	add	r6, r9
	mvn	r1, #-2147483648
	eor.w	r9, r8, r1
	mvns	r1, r6
	subs	r1, r1, r7
	sbcs.w	r1, r9, r5
	blt.w	.LBB60_43
@ %bb.27:
	adds	r1, r6, r7
	mov.w	r7, #358
	mls	r7, r6, r7, lr
	adc.w	r5, r5, r8
	strd	r1, r5, [r0, #8]
	str	r7, [r0, #44]
.LBB60_28:
	lsls.w	r1, r12, #29
	bpl	.LBB60_35
.LBB60_29:
	ldr	r1, [r0, #60]
	cmp	r1, #0
	beq	.LBB60_34
@ %bb.30:
	ldr.w	lr, [r0, #44]
	movw	r1, #48695
	movt	r1, #23065
	umull	r1, r6, lr, r1
	movw	r1, #4027
	movt	r1, #183
	movs	r7, #0
	umlal	r6, r7, lr, r1
	movw	r1, #1167
	movt	r1, #62607
	ldr	r5, [r0, #12]
	adds	r1, r1, r6
	mov.w	r8, #0
	adcs	r9, r7, #36
	adc	r8, r8, #0
	cmp	r5, #0
	bmi	.LBB60_43
@ %bb.31:
	movw	r6, #29619
	movt	r6, #19221
	ldr	r7, [r0, #8]
	add	r6, r9
	mvn	r1, #-2147483648
	eor.w	r9, r8, r1
	mvns	r1, r6
	subs	r1, r1, r7
	sbcs.w	r1, r9, r5
	blt	.LBB60_43
@ %bb.32:
	adds	r1, r6, r7
	mov.w	r7, #358
	mls	r7, r6, r7, lr
	adc.w	r5, r5, r8
	strd	r1, r5, [r0, #8]
	str	r7, [r0, #44]
	b	.LBB60_35
	.p2align	2
.LBB60_33:
	movs	r1, #1
	str	r1, [r0, #60]
	lsls.w	r1, r12, #29
	bmi	.LBB60_29
	b	.LBB60_35
	.p2align	2
.LBB60_34:
	movs	r1, #1
	str	r1, [r0, #60]
.LBB60_35:
	lsls.w	r1, r12, #28
	bpl	.LBB60_40
@ %bb.36:
	ldr	r1, [r0, #60]
	cbz	r1, .LBB60_41
@ %bb.37:
	ldr.w	r12, [r0, #44]
	movw	r1, #48695
	movt	r1, #23065
	umull	r1, r7, r12, r1
	movw	r1, #4027
	movt	r1, #183
	movs	r5, #0
	umlal	r7, r5, r12, r1
	movw	r1, #11863
	movt	r1, #12448
	ldr	r6, [r0, #12]
	adds	r1, r1, r7
	mov.w	lr, #0
	adcs	r8, r5, #79
	adc	lr, lr, #0
	cmp	r6, #0
	bmi	.LBB60_43
@ %bb.38:
	movw	r1, #54107
	movt	r1, #41188
	ldr	r7, [r0, #8]
	add	r1, r8
	mvn	r5, #-2147483648
	eor.w	r8, lr, r5
	mvns	r5, r1
	subs	r5, r5, r7
	sbcs.w	r5, r8, r6
	blt	.LBB60_43
@ %bb.39:
	adds	r5, r1, r7
	adc.w	r7, lr, r6
	mov.w	r6, #358
	mls	r1, r1, r6, r12
	strd	r5, r7, [r0, #8]
	str	r1, [r0, #44]
.LBB60_40:
	strd	r2, r3, [r0, #24]
	mov	r0, r4
	add	sp, #4
	pop.w	{r4, r5, r6, r7, r8, r9, pc}
	.p2align	2
.LBB60_41:
	movs	r1, #1
	str	r1, [r0, #60]
	strd	r2, r3, [r0, #24]
	mov	r0, r4
	add	sp, #4
	pop.w	{r4, r5, r6, r7, r8, r9, pc}
	.p2align	2
.LBB60_42:
	movw	r0, :lower16:.L.str.159
	movt	r0, :upper16:.L.str.159
	bl	credits_private_credits_fail
	.p2align	2
.LBB60_43:
	movw	r0, :lower16:.L.str.160
	movt	r0, :upper16:.L.str.160
	bl	credits_private_credits_fail
	.p2align	2
.LBB60_44:
	movw	r0, :lower16:.L.str.161
	movt	r0, :upper16:.L.str.161
	bl	credits_private_credits_fail
.Lfunc_end60:
	.size	credits_private_player_fixed_step, .Lfunc_end60-credits_private_player_fixed_step
	.cantunwind
	.fnend
                                        @ -- End function
	.globl	credits_private_fixed_player_sync @ -- Begin function credits_private_fixed_player_sync
	.p2align	1
	.prefalign	2, .Lfunc_end61, nop
	.type	credits_private_fixed_player_sync,%function
	.code	16
	.thumb_func
credits_private_fixed_player_sync:      @ @credits_private_fixed_player_sync
	.fnstart
@ %bb.0:
	.save	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	push.w	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	.pad	#12
	sub	sp, #12
	ldr	r1, [sp, #52]
	cmp.w	r1, #-1
	ble.w	.LBB61_14
@ %bb.1:
	mov	r4, r0
	ldr	r0, [sp, #48]
	ldrd	r6, r7, [sp, #56]
	strd	r0, r1, [r4, #8]
	movs	r1, #0
	mov	r0, r4
	str	r1, [r4, #44]
	strd	r6, r7, [sp]
	str	r1, [sp, #8]
	bl	credits_private_player_fixed_step
	cmp	r0, #2
	bne	.LBB61_3
@ %bb.2:
	movs	r0, #2
	add	sp, #12
	pop.w	{r4, r5, r6, r7, r8, r9, r10, r11, pc}
	.p2align	2
.LBB61_3:
	ldr	r1, [r4, #64]
	cmp	r1, #0
	beq	.LBB61_12
@ %bb.4:
	ldr	r1, [r4]
	movw	r2, #7376
	ldr.w	r9, [sp, #64]
	ldr	r3, [r1, r2]
	cmp	r3, r9
	bge	.LBB61_12
@ %bb.5:
	ldrd	r3, r7, [r4, #8]
	ldrd	r6, r5, [r4, #32]
	subs	r3, r6, r3
	sbcs.w	r3, r5, r7
	bge	.LBB61_12
@ %bb.6:
	movw	r0, #7352
	adds	r5, r1, r2
	add	r0, r1
	movs	r1, #1
	bl	credits_private_scheduler_next
	ldr.w	r0, [r5, #2760]
	mvn	r2, #-2147483648
	adds	r1, r0, #1
	ldr	r0, [r4, #48]
	str.w	r1, [r5, #2760]
	cmp	r0, r2
	beq	.LBB61_15
@ %bb.7:
	ldr	r1, [r4, #40]
	movw	r5, #60410
	adds	r0, #1
	movw	r3, #12500
	movt	r5, #2745
	str	r0, [r4, #48]
	ldr	r7, [r4]
	ldrd	r0, r2, [r4, #32]
	add	r3, r1
	movw	r12, #44749
	adds	r6, r5, #1
	cmp	r3, r12
	movw	r8, #7376
	mov	r11, r6
	it	hi
	movhi	r5, r6
	movw	r6, #32250
	it	hi
	subhi	r3, r1, r6
	adds	r1, r5, r0
	ldr.w	r0, [r7, r8]
	adc	r2, r2, #0
	cmp	r0, r9
	str	r1, [r4, #32]
	str	r2, [r4, #36]
	str	r3, [r4, #40]
	bge	.LBB61_13
@ %bb.8:
	movw	r10, #10136
	movw	r5, #32250
	.p2align	2
.LBB61_9:                               @ =>This Inner Loop Header: Depth=1
	ldrd	r0, r3, [r4, #8]
	subs	r0, r1, r0
	sbcs.w	r0, r2, r3
	bge	.LBB61_13
@ %bb.10:                               @   in Loop: Header=BB61_9 Depth=1
	movw	r0, #7352
	add	r0, r7
	movs	r1, #1
	bl	credits_private_scheduler_next
	ldr.w	r1, [r7, r10]
	ldr	r0, [r4, #48]
	mvn	r2, #-2147483648
	adds	r1, #1
	cmp	r0, r2
	str.w	r1, [r7, r10]
	beq	.LBB61_15
@ %bb.11:                               @   in Loop: Header=BB61_9 Depth=1
	ldr	r1, [r4, #40]
	movw	r3, #12500
	adds	r0, #1
	add	r3, r1
	movw	r6, #44749
	str	r0, [r4, #48]
	ldr	r7, [r4]
	ldrd	r0, r2, [r4, #32]
	cmp	r3, r6
	movw	r6, #60410
	movt	r6, #2745
	itt	hi
	movhi	r6, r11
	subhi	r3, r1, r5
	adds	r1, r6, r0
	ldr.w	r0, [r7, r8]
	adc	r2, r2, #0
	cmp	r0, r9
	mov.w	r0, #1
	strd	r1, r2, [r4, #32]
	str	r3, [r4, #40]
	blt	.LBB61_9
.LBB61_12:
	add	sp, #12
	pop.w	{r4, r5, r6, r7, r8, r9, r10, r11, pc}
	.p2align	2
.LBB61_13:
	movs	r0, #1
	add	sp, #12
	pop.w	{r4, r5, r6, r7, r8, r9, r10, r11, pc}
	.p2align	2
.LBB61_14:
	movw	r0, :lower16:.L.str.73
	movt	r0, :upper16:.L.str.73
	bl	credits_private_credits_fail
	.p2align	2
.LBB61_15:
	movw	r0, :lower16:.L.str.161
	movt	r0, :upper16:.L.str.161
	bl	credits_private_credits_fail
.Lfunc_end61:
	.size	credits_private_fixed_player_sync, .Lfunc_end61-credits_private_fixed_player_sync
	.cantunwind
	.fnend
                                        @ -- End function
	.p2align	1                               @ -- Begin function credits_private_ocean60_column
	.prefalign	2, .Lfunc_end62, nop
	.type	credits_private_ocean60_column,%function
	.code	16
	.thumb_func
credits_private_ocean60_column:         @ @credits_private_ocean60_column
	.fnstart
@ %bb.0:
	.save	{r4, r5, r6, r7, r8, lr}
	push.w	{r4, r5, r6, r7, r8, lr}
	ldr.w	r5, [r0, #488]
	adds	r3, r5, #1
	cmp.w	r5, #4096
	str.w	r3, [r0, #488]
	bhs.w	.LBB62_20
@ %bb.1:
	ldr.w	r3, [r0, #492]
	add	r1, r0
	eor.w	r3, r3, r3, lsl #13
	eor.w	r3, r3, r3, lsr #17
	cmp.w	r2, #500
	eor.w	r3, r3, r3, lsl #5
	bge.w	.LBB62_18
@ %bb.2:
	movw	r4, :lower16:credits_private_math_lookup_ocean_height
	movt	r4, :upper16:credits_private_math_lookup_ocean_height
	ldrb.w	lr, [r4, r5]
	mov.w	r8, #500
	umull	r6, r7, r3, r8
	cmp.w	lr, #0
	mvn	r5, #95
	bic.w	r12, r2, r2, asr #31
	it	eq
	moveq	r5, #35
	rsbs	r2, r6, #0
	sbcs.w	r2, r12, r7
	mvn	r2, #95
	blo	.LBB62_4
@ %bb.3:
	eor.w	r3, r3, r3, lsl #13
	eor.w	r3, r3, r3, lsr #17
	eor.w	r3, r3, r3, lsl #5
	movs	r4, #26
	umull	r4, r5, r3, r4
	adds	r5, #97
.LBB62_4:
	eor.w	r3, r3, r3, lsl #13
	eor.w	r3, r3, r3, lsr #17
	eor.w	r3, r3, r3, lsl #5
	cmp.w	lr, #0
	umull	r4, r6, r3, r8
	it	eq
	moveq	r2, #46
	cmp.w	lr, #1
	it	eq
	moveq	r2, #35
	rsbs	r4, r4, #0
	sbcs.w	r4, r12, r6
	strb	r5, [r1]
	blo	.LBB62_6
@ %bb.5:
	eor.w	r2, r3, r3, lsl #13
	eor.w	r2, r2, r2, lsr #17
	eor.w	r3, r2, r2, lsl #5
	movs	r2, #26
	umull	r2, r4, r3, r2
	add.w	r2, r4, #97
.LBB62_6:
	eor.w	r3, r3, r3, lsl #13
	eor.w	r3, r3, r3, lsr #17
	eor.w	r4, r3, r3, lsl #5
	mov.w	r3, #500
	mvn	r5, #95
	umull	r6, r7, r4, r3
	strb.w	r2, [r1, #60]
	cmp.w	lr, #2
	it	lo
	movlo	r5, #46
	it	eq
	moveq	r5, #35
	rsbs	r2, r6, #0
	sbcs.w	r2, r12, r7
	mvn	r2, #95
	blo	.LBB62_8
@ %bb.7:
	eor.w	r4, r4, r4, lsl #13
	eor.w	r4, r4, r4, lsr #17
	eor.w	r4, r4, r4, lsl #5
	movs	r5, #26
	umull	r5, r6, r4, r5
	add.w	r5, r6, #97
	str.w	r4, [r0, #492]
.LBB62_8:
	eor.w	r4, r4, r4, lsl #13
	eor.w	r4, r4, r4, lsr #17
	eor.w	r4, r4, r4, lsl #5
	umull	r3, r6, r4, r3
	cmp.w	lr, #3
	it	lo
	movlo	r2, #46
	it	eq
	moveq	r2, #35
	rsbs	r3, r3, #0
	sbcs.w	r3, r12, r6
	strb.w	r5, [r1, #120]
	blo	.LBB62_10
@ %bb.9:
	eor.w	r2, r4, r4, lsl #13
	eor.w	r2, r2, r2, lsr #17
	eor.w	r4, r2, r2, lsl #5
	movs	r2, #26
	umull	r2, r3, r4, r2
	add.w	r2, r3, #97
.LBB62_10:
	eor.w	r3, r4, r4, lsl #13
	eor.w	r3, r3, r3, lsr #17
	eor.w	r4, r3, r3, lsl #5
	mov.w	r3, #500
	mvn	r5, #95
	umull	r6, r7, r4, r3
	strb.w	r2, [r1, #180]
	cmp.w	lr, #4
	it	lo
	movlo	r5, #46
	it	eq
	moveq	r5, #35
	rsbs	r2, r6, #0
	sbcs.w	r2, r12, r7
	mvn	r2, #95
	blo	.LBB62_12
@ %bb.11:
	eor.w	r4, r4, r4, lsl #13
	eor.w	r4, r4, r4, lsr #17
	eor.w	r4, r4, r4, lsl #5
	movs	r5, #26
	umull	r5, r6, r4, r5
	add.w	r5, r6, #97
.LBB62_12:
	eor.w	r4, r4, r4, lsl #13
	eor.w	r4, r4, r4, lsr #17
	eor.w	r4, r4, r4, lsl #5
	umull	r3, r6, r4, r3
	cmp.w	lr, #5
	it	lo
	movlo	r2, #46
	it	eq
	moveq	r2, #35
	rsbs	r3, r3, #0
	sbcs.w	r3, r12, r6
	strb.w	r5, [r1, #240]
	blo	.LBB62_14
@ %bb.13:
	eor.w	r2, r4, r4, lsl #13
	eor.w	r2, r2, r2, lsr #17
	eor.w	r4, r2, r2, lsl #5
	movs	r2, #26
	umull	r2, r3, r4, r2
	add.w	r2, r3, #97
.LBB62_14:
	eor.w	r3, r4, r4, lsl #13
	eor.w	r3, r3, r3, lsr #17
	eor.w	r4, r3, r3, lsl #5
	mov.w	r3, #500
	mvn	r5, #95
	umull	r6, r7, r4, r3
	strb.w	r2, [r1, #300]
	cmp.w	lr, #6
	it	lo
	movlo	r5, #46
	it	eq
	moveq	r5, #35
	rsbs	r2, r6, #0
	sbcs.w	r2, r12, r7
	mvn	r2, #95
	blo	.LBB62_16
@ %bb.15:
	eor.w	r4, r4, r4, lsl #13
	eor.w	r4, r4, r4, lsr #17
	eor.w	r4, r4, r4, lsl #5
	movs	r5, #26
	umull	r5, r6, r4, r5
	add.w	r5, r6, #97
.LBB62_16:
	eor.w	r4, r4, r4, lsl #13
	eor.w	r4, r4, r4, lsr #17
	eor.w	r4, r4, r4, lsl #5
	umull	r3, r6, r4, r3
	strb.w	r5, [r1, #360]
	cmp.w	lr, #7
	it	lo
	movlo	r2, #46
	it	eq
	moveq	r2, #35
	rsbs	r3, r3, #0
	sbcs.w	r3, r12, r6
	str.w	r4, [r0, #492]
	bhs.w	.LBB62_19
@ %bb.17:
	strb.w	r2, [r1, #420]
	pop.w	{r4, r5, r6, r7, r8, pc}
	.p2align	2
.LBB62_18:
	eor.w	r2, r3, r3, lsl #13
	eor.w	r2, r2, r2, lsr #17
	eor.w	r3, r2, r2, lsl #5
	movs	r2, #26
	umull	r5, r12, r3, r2
	eor.w	r3, r3, r3, lsl #13
	eor.w	r3, r3, r3, lsr #17
	eor.w	r3, r3, r3, lsl #5
	eor.w	r3, r3, r3, lsl #13
	eor.w	r3, r3, r3, lsr #17
	eor.w	r5, r3, r3, lsl #5
	umull	r4, lr, r5, r2
	eor.w	r5, r5, r5, lsl #13
	eor.w	r5, r5, r5, lsr #17
	eor.w	r5, r5, r5, lsl #5
	eor.w	r5, r5, r5, lsl #13
	eor.w	r5, r5, r5, lsr #17
	eor.w	r5, r5, r5, lsl #5
	umull	r3, r8, r5, r2
	eor.w	r3, r5, r5, lsl #13
	eor.w	r3, r3, r3, lsr #17
	eor.w	r3, r3, r3, lsl #5
	eor.w	r3, r3, r3, lsl #13
	eor.w	r3, r3, r3, lsr #17
	eor.w	r3, r3, r3, lsl #5
	umull	r6, r5, r3, r2
	eor.w	r3, r3, r3, lsl #13
	eor.w	r3, r3, r3, lsr #17
	eor.w	r3, r3, r3, lsl #5
	eor.w	r3, r3, r3, lsl #13
	eor.w	r3, r3, r3, lsr #17
	eor.w	r3, r3, r3, lsl #5
	umull	r6, r7, r3, r2
	eor.w	r3, r3, r3, lsl #13
	eor.w	r3, r3, r3, lsr #17
	eor.w	r3, r3, r3, lsl #5
	eor.w	r3, r3, r3, lsl #13
	eor.w	r3, r3, r3, lsr #17
	eor.w	r3, r3, r3, lsl #5
	umull	r6, r4, r3, r2
	eor.w	r3, r3, r3, lsl #13
	eor.w	r3, r3, r3, lsr #17
	eor.w	r3, r3, r3, lsl #5
	eor.w	r3, r3, r3, lsl #13
	eor.w	r3, r3, r3, lsr #17
	eor.w	r3, r3, r3, lsl #5
	umull	r2, r6, r3, r2
	add.w	r2, r12, #97
	strb	r2, [r1]
	add.w	r2, lr, #97
	strb.w	r2, [r1, #60]
	add.w	r2, r8, #97
	strb.w	r2, [r1, #120]
	add.w	r2, r5, #97
	strb.w	r2, [r1, #180]
	add.w	r2, r7, #97
	strb.w	r2, [r1, #240]
	add.w	r2, r4, #97
	strb.w	r2, [r1, #300]
	add.w	r2, r6, #97
	strb.w	r2, [r1, #360]
	eor.w	r2, r3, r3, lsl #13
	eor.w	r2, r2, r2, lsr #17
	eor.w	r4, r2, r2, lsl #5
.LBB62_19:
	eor.w	r2, r4, r4, lsl #13
	eor.w	r2, r2, r2, lsr #17
	eor.w	r2, r2, r2, lsl #5
	movs	r3, #26
	umull	r3, r7, r2, r3
	str.w	r2, [r0, #492]
	add.w	r2, r7, #97
	strb.w	r2, [r1, #420]
	pop.w	{r4, r5, r6, r7, r8, pc}
	.p2align	2
.LBB62_20:
	movw	r0, :lower16:.L.str.75
	movt	r0, :upper16:.L.str.75
	bl	credits_private_credits_fail
.Lfunc_end62:
	.size	credits_private_ocean60_column, .Lfunc_end62-credits_private_ocean60_column
	.cantunwind
	.fnend
                                        @ -- End function
	.globl	credits_private_credits_ocean_update @ -- Begin function credits_private_credits_ocean_update
	.p2align	1
	.prefalign	2, .Lfunc_end63, nop
	.type	credits_private_credits_ocean_update,%function
	.code	16
	.thumb_func
credits_private_credits_ocean_update:   @ @credits_private_credits_ocean_update
	.fnstart
@ %bb.0:
	.save	{r4, r5, r7, lr}
	push	{r4, r5, r7, lr}
	mov	r4, r1
	mov	r5, r0
	adds	r1, #1
	mov	r0, r4
	movs	r2, #59
	bl	__aeabi_memmove
	add.w	r0, r4, #60
	add.w	r1, r4, #61
	movs	r2, #59
	bl	__aeabi_memmove
	add.w	r0, r4, #120
	add.w	r1, r4, #121
	movs	r2, #59
	bl	__aeabi_memmove
	add.w	r0, r4, #180
	add.w	r1, r4, #181
	movs	r2, #59
	bl	__aeabi_memmove
	add.w	r0, r4, #240
	add.w	r1, r4, #241
	movs	r2, #59
	bl	__aeabi_memmove
	add.w	r0, r4, #300
	addw	r1, r4, #301
	movs	r2, #59
	bl	__aeabi_memmove
	add.w	r0, r4, #360
	addw	r1, r4, #361
	movs	r2, #59
	bl	__aeabi_memmove
	add.w	r0, r4, #420
	addw	r1, r4, #421
	movs	r2, #59
	bl	__aeabi_memmove
	ldr.w	r2, [r4, #480]
	mov	r0, r4
	movs	r1, #59
	bl	credits_private_ocean60_column
	mov	r0, r5
	mov	r1, r4
	pop.w	{r4, r5, r7, lr}
	b	credits_private_credits_ocean_render
.Lfunc_end63:
	.size	credits_private_credits_ocean_update, .Lfunc_end63-credits_private_credits_ocean_update
	.cantunwind
	.fnend
                                        @ -- End function
	.globl	credits_private_credits_ocean_render @ -- Begin function credits_private_credits_ocean_render
	.p2align	1
	.prefalign	2, .Lfunc_end64, nop
	.type	credits_private_credits_ocean_render,%function
	.code	16
	.thumb_func
credits_private_credits_ocean_render:   @ @credits_private_credits_ocean_render
	.fnstart
@ %bb.0:
	.save	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	push.w	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	.pad	#12
	sub	sp, #12
	mov	r5, r0
	ldr.w	r0, [r1, #484]
	movw	r11, #20352
	mov	r9, r1
	movs	r4, #0
	movt	r11, #18
	bl	credits_private_canvas60_style
	movw	r8, #33205
	add.w	r5, r5, #2912
	movt	r8, #6990
	mov.w	r10, #1200
	mov	r12, r9
	b	.LBB64_2
	.p2align	2
.LBB64_1:                               @   in Loop: Header=BB64_2 Depth=1
	ldr	r4, [sp, #8]                    @ 4-byte Reload
	ldr	r5, [sp, #4]                    @ 4-byte Reload
	adds	r4, #1
	adds	r5, #240
	cmp	r4, #8
	add.w	r12, r12, #60
	beq.w	.LBB64_20
.LBB64_2:                               @ =>This Loop Header: Depth=1
                                        @     Child Loop BB64_5 Depth 2
	movs	r1, #0
	str	r4, [sp, #8]                    @ 4-byte Spill
	str	r5, [sp, #4]                    @ 4-byte Spill
	b	.LBB64_5
	.p2align	2
.LBB64_3:                               @   in Loop: Header=BB64_5 Depth=2
	eor.w	r2, r3, r3, lsl #13
	eor.w	r2, r2, r2, lsr #17
	eor.w	r2, r2, r2, lsl #5
	movs	r3, #26
	umull	r3, r7, r2, r3
	str.w	r2, [r9, #492]
	add.w	r2, r7, #97
.LBB64_4:                               @   in Loop: Header=BB64_5 Depth=2
	orrs	r2, r0
	adds	r1, #3
	cmp	r1, #60
	str	r2, [r5], #12
	beq	.LBB64_1
.LBB64_5:                               @   Parent Loop BB64_2 Depth=1
                                        @ =>  This Inner Loop Header: Depth=2
	ldrb.w	r2, [r12, r1]
	cmp	r2, #35
	it	ne
	cmpne	r2, #160
	bne	.LBB64_9
.LBB64_6:                               @   in Loop: Header=BB64_5 Depth=2
	ldrd	r3, r6, [r9, #488]
	smmul	r7, r3, r8
	asrs	r4, r7, #7
	add.w	r4, r4, r7, lsr #31
	mls	r3, r4, r10, r3
	ldr.w	r4, [r9, #480]
	adds	r3, #240
	bic.w	r4, r4, r4, asr #31
	smull	r7, r4, r3, r4
	eor.w	r3, r6, r6, lsl #13
	eor.w	r3, r3, r3, lsr #17
	subs.w	r6, r7, r11
	eor.w	r3, r3, r3, lsl #5
	sbcs	r4, r4, #0
	str.w	r3, [r9, #492]
	bhs	.LBB64_8
@ %bb.7:                                @   in Loop: Header=BB64_5 Depth=2
	umull	r4, r6, r3, r11
	rsbs	r4, r4, #0
	sbcs.w	r4, r7, r6
	blo	.LBB64_10
.LBB64_8:                               @   in Loop: Header=BB64_5 Depth=2
	eor.w	r2, r3, r3, lsl #13
	eor.w	r2, r2, r2, lsr #17
	eor.w	r2, r2, r2, lsl #5
	movs	r3, #26
	umull	r3, r4, r2, r3
	str.w	r2, [r9, #492]
	add.w	r2, r4, #97
	b	.LBB64_10
	.p2align	2
.LBB64_9:                               @   in Loop: Header=BB64_5 Depth=2
	cmp	r2, #46
	beq	.LBB64_6
	.p2align	2
.LBB64_10:                              @   in Loop: Header=BB64_5 Depth=2
	orrs	r2, r0
	str	r2, [r5, #-8]
	add.w	lr, r12, r1
	ldrb.w	r3, [lr, #1]
	cmp	r3, #35
	it	ne
	cmpne	r3, #160
	bne	.LBB64_14
.LBB64_11:                              @   in Loop: Header=BB64_5 Depth=2
	ldrd	r4, r6, [r9, #488]
	smmul	r7, r4, r8
	asrs	r2, r7, #7
	add.w	r2, r2, r7, lsr #31
	mls	r2, r2, r10, r4
	ldr.w	r4, [r9, #480]
	adds	r2, #240
	bic.w	r4, r4, r4, asr #31
	smull	r8, r2, r2, r4
	eor.w	r4, r6, r6, lsl #13
	eor.w	r4, r4, r4, lsr #17
	eor.w	r7, r4, r4, lsl #5
	subs.w	r4, r8, r11
	sbcs	r2, r2, #0
	str.w	r7, [r9, #492]
	bhs	.LBB64_13
@ %bb.12:                               @   in Loop: Header=BB64_5 Depth=2
	umull	r2, r4, r7, r11
	rsbs	r2, r2, #0
	sbcs.w	r2, r8, r4
	blo	.LBB64_15
.LBB64_13:                              @   in Loop: Header=BB64_5 Depth=2
	eor.w	r2, r7, r7, lsl #13
	eor.w	r2, r2, r2, lsr #17
	eor.w	r2, r2, r2, lsl #5
	movs	r3, #26
	umull	r3, r4, r2, r3
	add.w	r3, r4, #97
	str.w	r2, [r9, #492]
	b	.LBB64_15
	.p2align	2
.LBB64_14:                              @   in Loop: Header=BB64_5 Depth=2
	cmp	r3, #46
	beq	.LBB64_11
	.p2align	2
.LBB64_15:                              @   in Loop: Header=BB64_5 Depth=2
	orr.w	r2, r0, r3
	str	r2, [r5, #-4]
	ldrb.w	r2, [lr, #2]
	cmp	r2, #35
	it	ne
	cmpne	r2, #160
	bne	.LBB64_18
.LBB64_16:                              @   in Loop: Header=BB64_5 Depth=2
	ldrd	r3, r6, [r9, #488]
	movw	r8, #33205
	movt	r8, #6990
	smmul	r7, r3, r8
	asrs	r4, r7, #7
	add.w	r7, r4, r7, lsr #31
	mls	r3, r7, r10, r3
	ldr.w	r7, [r9, #480]
	adds	r3, #240
	bic.w	r7, r7, r7, asr #31
	smull	r7, r4, r3, r7
	eor.w	r3, r6, r6, lsl #13
	eor.w	r3, r3, r3, lsr #17
	subs.w	r6, r7, r11
	eor.w	r3, r3, r3, lsl #5
	sbcs	r6, r4, #0
	str.w	r3, [r9, #492]
	bhs.w	.LBB64_3
@ %bb.17:                               @   in Loop: Header=BB64_5 Depth=2
	umull	r6, r4, r3, r11
	rsbs	r6, r6, #0
	sbcs	r7, r4
	bhs.w	.LBB64_3
	b	.LBB64_4
	.p2align	2
.LBB64_18:                              @   in Loop: Header=BB64_5 Depth=2
	cmp	r2, #46
	beq	.LBB64_16
@ %bb.19:                               @   in Loop: Header=BB64_5 Depth=2
	movw	r8, #33205
	movt	r8, #6990
	b	.LBB64_4
	.p2align	2
.LBB64_20:
	add	sp, #12
	pop.w	{r4, r5, r6, r7, r8, r9, r10, r11, pc}
.Lfunc_end64:
	.size	credits_private_credits_ocean_render, .Lfunc_end64-credits_private_credits_ocean_render
	.cantunwind
	.fnend
                                        @ -- End function
	.globl	credits_private_canvas60_style  @ -- Begin function credits_private_canvas60_style
	.p2align	1
	.prefalign	2, .Lfunc_end65, nop
	.type	credits_private_canvas60_style,%function
	.code	16
	.thumb_func
credits_private_canvas60_style:         @ @credits_private_canvas60_style
	.fnstart
@ %bb.0:
	.save	{r4, lr}
	push	{r4, lr}
	movs	r2, #1
	mov.w	lr, #49
	mov.w	r12, #39
	ldrb	r1, [r0]
	cmp	r1, #27
	bne.w	.LBB65_24
	.p2align	2
.LBB65_1:                               @ =>This Loop Header: Depth=1
                                        @     Child Loop BB65_4 Depth 2
	ldrb	r1, [r0, #1]
	cmp	r1, #91
	bne.w	.LBB65_25
@ %bb.2:                                @   in Loop: Header=BB65_1 Depth=1
	adds	r0, #2
	ldrb	r3, [r0]
	sub.w	r1, r3, #48
	cmp	r1, #9
	bhi	.LBB65_8
	.p2align	2
.LBB65_3:                               @   in Loop: Header=BB65_1 Depth=1
	movs	r1, #0
	.p2align	2
.LBB65_4:                               @   Parent Loop BB65_1 Depth=1
                                        @ =>  This Inner Loop Header: Depth=2
	add.w	r1, r1, r1, lsl #2
	add.w	r1, r3, r1, lsl #1
	ldrb	r3, [r0, #1]
	subs	r1, #48
	sub.w	r4, r3, #48
	cmp	r4, #9
	bhi	.LBB65_9
@ %bb.5:                                @   in Loop: Header=BB65_4 Depth=2
	add.w	r1, r1, r1, lsl #2
	add.w	r1, r3, r1, lsl #1
	ldrb	r3, [r0, #2]
	subs	r1, #48
	sub.w	r4, r3, #48
	cmp	r4, #9
	bhi	.LBB65_10
@ %bb.6:                                @   in Loop: Header=BB65_4 Depth=2
	ldrb	r4, [r0, #3]
	add.w	r1, r1, r1, lsl #2
	add.w	r1, r3, r1, lsl #1
	sub.w	r3, r4, #48
	cmp	r3, #9
	sub.w	r1, r1, #48
	bhi	.LBB65_16
@ %bb.7:                                @   in Loop: Header=BB65_4 Depth=2
	ldrb	r3, [r0, #4]!
	add.w	r1, r1, r1, lsl #2
	add.w	r1, r4, r1, lsl #1
	sub.w	r4, r3, #48
	cmp	r4, #10
	sub.w	r1, r1, #48
	blo	.LBB65_4
	b	.LBB65_11
	.p2align	2
.LBB65_8:                               @   in Loop: Header=BB65_1 Depth=1
	movs	r2, #0
	mov.w	lr, #49
	mov.w	r12, #39
	b	.LBB65_20
	.p2align	2
.LBB65_9:                               @   in Loop: Header=BB65_1 Depth=1
	adds	r0, #1
	subs	r4, r1, #1
	cmp	r4, #2
	bhs	.LBB65_12
	b	.LBB65_17
	.p2align	2
.LBB65_10:                              @   in Loop: Header=BB65_1 Depth=1
	adds	r0, #2
.LBB65_11:                              @   in Loop: Header=BB65_1 Depth=1
	subs	r4, r1, #1
	cmp	r4, #2
	blo	.LBB65_17
.LBB65_12:                              @   in Loop: Header=BB65_1 Depth=1
	cbz	r1, .LBB65_18
@ %bb.13:                               @   in Loop: Header=BB65_1 Depth=1
	cmp	r1, #22
	beq	.LBB65_17
@ %bb.14:                               @   in Loop: Header=BB65_1 Depth=1
	sub.w	r4, r1, #30
	cmp	r4, #10
	bhs	.LBB65_19
@ %bb.15:                               @   in Loop: Header=BB65_1 Depth=1
	mov	r12, r1
	b	.LBB65_20
	.p2align	2
.LBB65_16:                              @   in Loop: Header=BB65_1 Depth=1
	adds	r0, #3
	mov	r3, r4
	subs	r4, r1, #1
	cmp	r4, #2
	bhs	.LBB65_12
	.p2align	2
.LBB65_17:                              @   in Loop: Header=BB65_1 Depth=1
	subs.w	r2, r1, #22
	it	ne
	movne	r2, r1
	b	.LBB65_20
	.p2align	2
.LBB65_18:                              @   in Loop: Header=BB65_1 Depth=1
	mov.w	lr, #49
	mov.w	r12, #39
	mov	r2, r1
	b	.LBB65_20
	.p2align	2
.LBB65_19:                              @   in Loop: Header=BB65_1 Depth=1
	sub.w	r4, r1, #40
	cmp	r4, #10
	mov	lr, r1
	bhs	.LBB65_27
	.p2align	2
.LBB65_20:                              @   in Loop: Header=BB65_1 Depth=1
	cmp	r3, #59
	bne	.LBB65_22
@ %bb.21:                               @   in Loop: Header=BB65_1 Depth=1
	adds	r0, #1
	ldrb	r3, [r0]
	sub.w	r1, r3, #48
	cmp	r1, #9
	bhi	.LBB65_8
	b	.LBB65_3
	.p2align	2
.LBB65_22:                              @   in Loop: Header=BB65_1 Depth=1
	cmp	r3, #109
	bne	.LBB65_26
@ %bb.23:                               @   in Loop: Header=BB65_1 Depth=1
	adds	r0, #1
	ldrb	r1, [r0]
	cmp	r1, #27
	beq.w	.LBB65_1
.LBB65_24:
	cmp	r1, #0
	itttt	eq
	lsleq.w	r0, lr, #22
	orreq.w	r0, r0, r12, lsl #16
	orreq.w	r0, r0, r2, lsl #28
	popeq	{r4, pc}
.LBB65_25:
	movw	r0, :lower16:.L.str.80
	movt	r0, :upper16:.L.str.80
	bl	credits_private_credits_fail
	.p2align	2
.LBB65_26:
	movw	r0, :lower16:.L.str.82
	movt	r0, :upper16:.L.str.82
	bl	credits_private_credits_fail
	.p2align	2
.LBB65_27:
	movw	r0, :lower16:.L.str.81
	movt	r0, :upper16:.L.str.81
	bl	credits_private_credits_fail
.Lfunc_end65:
	.size	credits_private_canvas60_style, .Lfunc_end65-credits_private_canvas60_style
	.cantunwind
	.fnend
                                        @ -- End function
	.globl	credits_private_canvas60_put    @ -- Begin function credits_private_canvas60_put
	.p2align	1
	.prefalign	2, .Lfunc_end66, nop
	.type	credits_private_canvas60_put,%function
	.code	16
	.thumb_func
credits_private_canvas60_put:           @ @credits_private_canvas60_put
	.fnstart
@ %bb.0:
	cmp	r1, #59
	it	ls
	cmpls	r2, #20
	blo	.LBB66_2
@ %bb.1:
	movw	r1, #4804
	ldr	r2, [r0, r1]
	adds	r2, #1
	str	r2, [r0, r1]
	bx	lr
	.p2align	2
.LBB66_2:
	rsb	r2, r2, r2, lsl #4
	add.w	r0, r0, r2, lsl #4
	str.w	r3, [r0, r1, lsl #2]
	bx	lr
.Lfunc_end66:
	.size	credits_private_canvas60_put, .Lfunc_end66-credits_private_canvas60_put
	.cantunwind
	.fnend
                                        @ -- End function
	.globl	credits_private_math_sin_degrees @ -- Begin function credits_private_math_sin_degrees
	.p2align	2
	.type	credits_private_math_sin_degrees,%function
	.code	16
	.thumb_func
credits_private_math_sin_degrees:       @ @credits_private_math_sin_degrees
	.fnstart
@ %bb.0:
	vldr	s2, .LCPI67_0
	vabs.f32	s4, s0
	vcmp.f32	s4, s2
	vmrs	APSR_nzcv, fpscr
	bhi.w	.LBB67_2
@ %bb.1:
	vldr	s6, .LCPI67_1
	vadd.f32	s4, s0, s2
	vcmp.f32	s0, #0
	vmrs	APSR_nzcv, fpscr
	it	mi
	vmovmi.f32	s0, s4
	vadd.f32	s4, s0, s6
	vcmp.f32	s0, s2
	vmrs	APSR_nzcv, fpscr
	it	lt
	vmovlt.f32	s4, s0
	vldr	s0, .LCPI67_2
	vldr	s2, .LCPI67_3
	vadd.f32	s0, s4, s0
	vcmp.f32	s4, s2
	vmrs	APSR_nzcv, fpscr
	mrs	r0, apsr
	it	ge
	vmovge.f32	s4, s0
	vldr	s0, .LCPI67_4
	vsub.f32	s2, s2, s4
	vcmp.f32	s4, s0
	vmov.f32	s0, #1.000000e+01
	vmrs	APSR_nzcv, fpscr
	it	gt
	vmovgt.f32	s4, s2
	vdiv.f32	s2, s4, s0
	vmov.f32	s10, #-6.000000e+00
	movw	r3, :lower16:credits_private_math_lookup_cos_units
	movt	r3, :upper16:credits_private_math_lookup_cos_units
	vcvt.s32.f32	s2, s2
	vcvt.f32.s32	s6, s2
	vmul.f32	s0, s6, s0
	vsub.f32	s0, s4, s0
	vldr	s4, .LCPI67_5
	vmov	r1, s2
	vmul.f32	s4, s0, s4
	vmul.f32	s8, s4, s4
	vdiv.f32	s8, s8, s10
	vcvt.s32.f32	s2, s0
	vmov	r2, s2
	add.w	r2, r3, r2, lsl #2
	vcvt.f32.s32	s6, s2
	vldr	s2, [r2]
	vldr	s10, [r2, #4]
	movw	r2, :lower16:credits_private_math_lookup_sin_tens
	vsub.f32	s0, s0, s6
	vsub.f32	s6, s10, s2
	movt	r2, :upper16:credits_private_math_lookup_sin_tens
	vmul.f32	s0, s0, s6
	add.w	r3, r2, r1, lsl #2
	vadd.f32	s0, s2, s0
	vmov.f32	s2, #1.000000e+00
	rsb.w	r1, r1, #9
	vadd.f32	s2, s8, s2
	add.w	r1, r2, r1, lsl #2
	vldr	s12, [r3]
	vmul.f32	s2, s4, s2
	vldr	s4, [r1]
	vmul.f32	s0, s12, s0
	vmul.f32	s2, s2, s4
	vadd.f32	s0, s2, s0
	vneg.f32	s2, s0
	msr	apsr_nzcvq, r0
	it	ge
	vmovge.f32	s0, s2
	bx	lr
	.p2align	2
.LBB67_2:
	movw	r0, :lower16:.L.str.74
	movt	r0, :upper16:.L.str.74
	bl	credits_private_credits_fail
	.p2align	2
@ %bb.3:
.LCPI67_0:
	.long	0x43b40000                      @ float 360
.LCPI67_1:
	.long	0xc3b40000                      @ float -360
.LCPI67_2:
	.long	0xc3340000                      @ float -180
.LCPI67_3:
	.long	0x43340000                      @ float 180
.LCPI67_4:
	.long	0x42b40000                      @ float 90
.LCPI67_5:
	.long	0x3c8efa35                      @ float 0.0174532924
.Lfunc_end67:
	.size	credits_private_math_sin_degrees, .Lfunc_end67-credits_private_math_sin_degrees
	.cantunwind
	.fnend
                                        @ -- End function
	.globl	credits_private_math_ocean_height @ -- Begin function credits_private_math_ocean_height
	.p2align	1
	.prefalign	2, .Lfunc_end68, nop
	.type	credits_private_math_ocean_height,%function
	.code	16
	.thumb_func
credits_private_math_ocean_height:      @ @credits_private_math_ocean_height
	.fnstart
@ %bb.0:
	cmp.w	r0, #4096
	itttt	lo
	movwlo	r1, :lower16:credits_private_math_lookup_ocean_height
	movtlo	r1, :upper16:credits_private_math_lookup_ocean_height
	ldrblo	r0, [r1, r0]
	bxlo	lr
.LBB68_1:
	movw	r0, :lower16:.L.str.75
	movt	r0, :upper16:.L.str.75
	bl	credits_private_credits_fail
.Lfunc_end68:
	.size	credits_private_math_ocean_height, .Lfunc_end68-credits_private_math_ocean_height
	.cantunwind
	.fnend
                                        @ -- End function
	.globl	credits_private_math_ocean_text @ -- Begin function credits_private_math_ocean_text
	.p2align	1
	.prefalign	2, .Lfunc_end69, nop
	.type	credits_private_math_ocean_text,%function
	.code	16
	.thumb_func
credits_private_math_ocean_text:        @ @credits_private_math_ocean_text
	.fnstart
@ %bb.0:
	movw	r2, #6508
	cmp	r0, r2
	bhi	.LBB69_3
@ %bb.1:
	subs	r2, r1, #5
	cmn.w	r2, #5
	bls	.LBB69_3
@ %bb.2:
	movw	r2, :lower16:credits_private_math_lookup_ocean_text_mask
	movt	r2, :upper16:credits_private_math_lookup_ocean_text_mask
	ldrb	r0, [r2, r0]
	subs	r1, #1
	lsrs	r0, r1
	and	r0, r0, #1
	bx	lr
	.p2align	2
.LBB69_3:
	movw	r0, :lower16:.L.str.76
	movt	r0, :upper16:.L.str.76
	bl	credits_private_credits_fail
.Lfunc_end69:
	.size	credits_private_math_ocean_text, .Lfunc_end69-credits_private_math_ocean_text
	.cantunwind
	.fnend
                                        @ -- End function
	.globl	credits_private_math_access_limit @ -- Begin function credits_private_math_access_limit
	.p2align	1
	.prefalign	2, .Lfunc_end70, nop
	.type	credits_private_math_access_limit,%function
	.code	16
	.thumb_func
credits_private_math_access_limit:      @ @credits_private_math_access_limit
	.fnstart
@ %bb.0:
	cmp.w	r0, #-1
	ble	.LBB70_2
@ %bb.1:
	cmp	r0, #17
	iteee	hi
	movhi	r0, #1
	movwls	r1, :lower16:credits_private_math_lookup_access_limit
	movtls	r1, :upper16:credits_private_math_lookup_access_limit
	ldrbls	r0, [r1, r0]
	bx	lr
	.p2align	2
.LBB70_2:
	movw	r0, :lower16:.L.str.77
	movt	r0, :upper16:.L.str.77
	bl	credits_private_credits_fail
.Lfunc_end70:
	.size	credits_private_math_access_limit, .Lfunc_end70-credits_private_math_access_limit
	.cantunwind
	.fnend
                                        @ -- End function
	.globl	credits_private_math_noise_count @ -- Begin function credits_private_math_noise_count
	.p2align	1
	.prefalign	2, .Lfunc_end71, nop
	.type	credits_private_math_noise_count,%function
	.code	16
	.thumb_func
credits_private_math_noise_count:       @ @credits_private_math_noise_count
	.fnstart
@ %bb.0:
	cmp	r0, #0
	bmi	.LBB71_3
@ %bb.1:
	cmp	r1, #0
	mov.w	r2, #61
	it	eq
	moveq	r2, #33
	cmp	r0, r2
	bhs	.LBB71_3
@ %bb.2:
	movw	r3, :lower16:credits_private_math_lookup_wipe_count
	movw	r2, :lower16:credits_private_math_lookup_clear_count
	movt	r3, :upper16:credits_private_math_lookup_wipe_count
	movt	r2, :upper16:credits_private_math_lookup_clear_count
	cmp	r1, #0
	it	eq
	moveq	r3, r2
	ldrh.w	r0, [r3, r0, lsl #1]
	bx	lr
	.p2align	2
.LBB71_3:
	movw	r0, :lower16:.L.str.78
	movt	r0, :upper16:.L.str.78
	bl	credits_private_credits_fail
.Lfunc_end71:
	.size	credits_private_math_noise_count, .Lfunc_end71-credits_private_math_noise_count
	.cantunwind
	.fnend
                                        @ -- End function
	.globl	credits_private_math_poweroff_height @ -- Begin function credits_private_math_poweroff_height
	.p2align	1
	.prefalign	2, .Lfunc_end72, nop
	.type	credits_private_math_poweroff_height,%function
	.code	16
	.thumb_func
credits_private_math_poweroff_height:   @ @credits_private_math_poweroff_height
	.fnstart
@ %bb.0:
	cmp	r0, #0
	ble	.LBB72_3
@ %bb.1:
	cmp	r0, #10
	itt	hi
	movhi	r0, #0
	bxhi	lr
.LBB72_2:
	movw	r1, :lower16:credits_private_math_lookup_poweroff_height
	movt	r1, :upper16:credits_private_math_lookup_poweroff_height
	add	r0, r1
	ldrb	r0, [r0, #-1]
	bx	lr
	.p2align	2
.LBB72_3:
	movw	r0, :lower16:.L.str.79
	movt	r0, :upper16:.L.str.79
	bl	credits_private_credits_fail
.Lfunc_end72:
	.size	credits_private_math_poweroff_height, .Lfunc_end72-credits_private_math_poweroff_height
	.cantunwind
	.fnend
                                        @ -- End function
	.globl	credits_private_math_lookup_bytes @ -- Begin function credits_private_math_lookup_bytes
	.p2align	1
	.prefalign	2, .Lfunc_end73, nop
	.type	credits_private_math_lookup_bytes,%function
	.code	16
	.thumb_func
credits_private_math_lookup_bytes:      @ @credits_private_math_lookup_bytes
	.fnstart
@ %bb.0:
	movw	r0, #10905
	bx	lr
.Lfunc_end73:
	.size	credits_private_math_lookup_bytes, .Lfunc_end73-credits_private_math_lookup_bytes
	.cantunwind
	.fnend
                                        @ -- End function
	.globl	credits_private_cell_pack       @ -- Begin function credits_private_cell_pack
	.p2align	1
	.prefalign	2, .Lfunc_end74, nop
	.type	credits_private_cell_pack,%function
	.code	16
	.thumb_func
credits_private_cell_pack:              @ @credits_private_cell_pack
	.fnstart
@ %bb.0:
	orr.w	r0, r0, r1, lsl #16
	orr.w	r0, r0, r2, lsl #22
	orr.w	r0, r0, r3, lsl #28
	bx	lr
.Lfunc_end74:
	.size	credits_private_cell_pack, .Lfunc_end74-credits_private_cell_pack
	.cantunwind
	.fnend
                                        @ -- End function
	.globl	credits_private_canvas_chars    @ -- Begin function credits_private_canvas_chars
	.p2align	1
	.prefalign	2, .Lfunc_end75, nop
	.type	credits_private_canvas_chars,%function
	.code	16
	.thumb_func
credits_private_canvas_chars:           @ @credits_private_canvas_chars
	.fnstart
@ %bb.0:
	.save	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	push.w	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	.pad	#4
	sub	sp, #4
	mov	r9, r1
	ldrd	r5, r1, [sp, #40]
	mov	r8, r0
	mov	r0, r1
	mov	r11, r3
	mov	r7, r2
	bl	credits_private_canvas60_style
	cmp	r5, #1
	blt	.LBB75_20
@ %bb.1:
	movw	r1, #4804
	cmp	r7, #19
	add	r1, r8
	bls	.LBB75_4
@ %bb.2:
	ldr	r0, [r1]
	add	r0, r5
.LBB75_3:
	str	r0, [r1]
	add	sp, #4
	pop.w	{r4, r5, r6, r7, r8, r9, r10, r11, pc}
	.p2align	2
.LBB75_4:
	rsb	lr, r7, r7, lsl #4
	cmp	r5, #4
	and	r12, r5, #3
	bhs	.LBB75_6
@ %bb.5:
	movs	r3, #0
	b	.LBB75_18
	.p2align	2
.LBB75_6:
	lsl.w	r3, lr, #4
	movw	r2, #65532
	movt	r2, #32767
	add.w	r3, r3, r9, lsl #2
	and.w	r10, r5, r2
	add.w	r7, r8, r3
	movs	r3, #0
	movs	r6, #0
	b	.LBB75_9
	.p2align	2
.LBB75_7:                               @   in Loop: Header=BB75_9 Depth=1
	ldr	r2, [r1]
	adds	r2, #1
	str	r2, [r1]
.LBB75_8:                               @   in Loop: Header=BB75_9 Depth=1
	adds	r3, #4
	cmp	r10, r3
	add.w	r6, r6, #16
	beq	.LBB75_17
.LBB75_9:                               @ =>This Inner Loop Header: Depth=1
	add.w	r5, r9, r3
	cmp	r5, #60
	blo	.LBB75_13
@ %bb.10:                               @   in Loop: Header=BB75_9 Depth=1
	ldr	r2, [r1]
	adds	r2, #1
	str	r2, [r1]
	adds	r2, r5, #1
	cmp	r2, #59
	bls	.LBB75_14
.LBB75_11:                              @   in Loop: Header=BB75_9 Depth=1
	ldr	r2, [r1]
	adds	r2, #1
	str	r2, [r1]
	adds	r2, r5, #2
	cmp	r2, #59
	bls	.LBB75_15
.LBB75_12:                              @   in Loop: Header=BB75_9 Depth=1
	ldr	r2, [r1]
	adds	r2, #1
	str	r2, [r1]
	adds	r2, r5, #3
	cmp	r2, #59
	bhi	.LBB75_7
	b	.LBB75_16
	.p2align	2
.LBB75_13:                              @   in Loop: Header=BB75_9 Depth=1
	ldr.w	r2, [r11, r6]
	orrs	r2, r0
	str	r2, [r7, r6]
	adds	r2, r5, #1
	cmp	r2, #59
	bhi	.LBB75_11
.LBB75_14:                              @   in Loop: Header=BB75_9 Depth=1
	add.w	r2, r11, r3, lsl #2
	ldr	r2, [r2, #4]
	adds	r4, r7, r6
	orrs	r2, r0
	str	r2, [r4, #4]
	adds	r2, r5, #2
	cmp	r2, #59
	bhi	.LBB75_12
.LBB75_15:                              @   in Loop: Header=BB75_9 Depth=1
	add.w	r2, r11, r3, lsl #2
	ldr	r2, [r2, #8]
	adds	r4, r7, r6
	orrs	r2, r0
	str	r2, [r4, #8]
	adds	r2, r5, #3
	cmp	r2, #59
	bhi	.LBB75_7
.LBB75_16:                              @   in Loop: Header=BB75_9 Depth=1
	add.w	r2, r11, r6
	ldr	r2, [r2, #12]
	adds	r4, r7, r6
	orrs	r2, r0
	str	r2, [r4, #12]
	b	.LBB75_8
	.p2align	2
.LBB75_17:
	cmp.w	r12, #0
	beq	.LBB75_20
.LBB75_18:
	add.w	r5, r3, r9
	cmp	r5, #59
	add.w	r2, r8, lr, lsl #4
	bls	.LBB75_21
@ %bb.19:
	ldr	r7, [r1]
	adds	r7, #1
	str	r7, [r1]
	cmp.w	r12, #1
	bne	.LBB75_22
.LBB75_20:
	add	sp, #4
	pop.w	{r4, r5, r6, r7, r8, r9, r10, r11, pc}
	.p2align	2
.LBB75_21:
	ldr.w	r7, [r11, r3, lsl #2]
	orrs	r7, r0
	str.w	r7, [r2, r5, lsl #2]
	cmp.w	r12, #1
	beq	.LBB75_20
.LBB75_22:
	adds	r6, r3, #1
	add.w	r7, r6, r9
	cmp	r7, #59
	bls	.LBB75_24
@ %bb.23:
	ldr	r7, [r1]
	adds	r7, #1
	str	r7, [r1]
	cmp.w	r12, #2
	beq	.LBB75_20
	b	.LBB75_25
	.p2align	2
.LBB75_24:
	ldr.w	r6, [r11, r6, lsl #2]
	orrs	r6, r0
	str.w	r6, [r2, r7, lsl #2]
	cmp.w	r12, #2
	beq	.LBB75_20
.LBB75_25:
	adds	r7, r3, #2
	add.w	r3, r7, r9
	cmp	r3, #59
	bls	.LBB75_27
@ %bb.26:
	ldr	r0, [r1]
	adds	r0, #1
	b	.LBB75_3
	.p2align	2
.LBB75_27:
	ldr.w	r1, [r11, r7, lsl #2]
	orrs	r0, r1
	str.w	r0, [r2, r3, lsl #2]
	add	sp, #4
	pop.w	{r4, r5, r6, r7, r8, r9, r10, r11, pc}
.Lfunc_end75:
	.size	credits_private_canvas_chars, .Lfunc_end75-credits_private_canvas_chars
	.cantunwind
	.fnend
                                        @ -- End function
	.globl	credits_private_canvas_string_cursor @ -- Begin function credits_private_canvas_string_cursor
	.p2align	1
	.prefalign	2, .Lfunc_end76, nop
	.type	credits_private_canvas_string_cursor,%function
	.code	16
	.thumb_func
credits_private_canvas_string_cursor:   @ @credits_private_canvas_string_cursor
	.fnstart
@ %bb.0:
	.save	{r4, r5, r6, r7, r8, r9, lr}
	push.w	{r4, r5, r6, r7, r8, r9, lr}
	.pad	#4
	sub	sp, #4
	mov	r9, r1
	ldr	r1, [sp, #32]
	mov	r8, r0
	mov	r0, r1
	mov	r7, r3
	mov	r4, r2
	bl	credits_private_canvas60_style
	ldrb	r2, [r7]
	cmp	r2, #0
	beq.w	.LBB76_27
@ %bb.1:
	ldr	r3, [sp, #36]
	movw	r1, #4804
	adds	r6, r3, #1
	add.w	r12, r8, r1
	beq	.LBB76_15
@ %bb.2:
	mov	r5, r9
	b	.LBB76_6
	.p2align	2
.LBB76_3:                               @   in Loop: Header=BB76_6 Depth=1
	adds	r4, #1
.LBB76_4:                               @   in Loop: Header=BB76_6 Depth=1
	mov	r6, r9
.LBB76_5:                               @   in Loop: Header=BB76_6 Depth=1
	ldrb	r2, [r7]
	subs	r3, #1
	cmp	r2, #0
	mov	r5, r6
	beq.w	.LBB76_27
.LBB76_6:                               @ =>This Inner Loop Header: Depth=1
	sub.w	r1, r2, #194
	cmp	r1, #29
	add.w	r1, r7, #1
	bhi	.LBB76_9
@ %bb.7:                                @   in Loop: Header=BB76_6 Depth=1
	ldrsb.w	r1, [r1]
	cmn.w	r1, #65
	bgt	.LBB76_28
@ %bb.8:                                @   in Loop: Header=BB76_6 Depth=1
	and	r1, r1, #63
	bfi	r1, r2, #6, #5
	adds	r7, #2
	mov	r2, r1
	b	.LBB76_10
	.p2align	2
.LBB76_9:                               @   in Loop: Header=BB76_6 Depth=1
	sxtb	r7, r2
	cmp.w	r7, #-1
	mov	r7, r1
	ble	.LBB76_28
.LBB76_10:                              @   in Loop: Header=BB76_6 Depth=1
	cmp	r3, #0
	mov.w	r1, #0
	it	eq
	moveq.w	r1, #1073741824
	cmp	r2, #13
	beq	.LBB76_4
@ %bb.11:                               @   in Loop: Header=BB76_6 Depth=1
	cmp	r2, #10
	beq	.LBB76_3
@ %bb.12:                               @   in Loop: Header=BB76_6 Depth=1
	cmp	r4, #19
	add.w	r6, r5, #1
	it	ls
	cmpls	r5, #60
	blo	.LBB76_14
@ %bb.13:                               @   in Loop: Header=BB76_6 Depth=1
	ldr.w	r1, [r12]
	adds	r1, #1
	str.w	r1, [r12]
	b	.LBB76_5
	.p2align	2
.LBB76_14:                              @   in Loop: Header=BB76_6 Depth=1
	orrs	r1, r0
	orrs	r1, r2
	rsb	r2, r4, r4, lsl #4
	add.w	r2, r8, r2, lsl #4
	str.w	r1, [r2, r5, lsl #2]
	b	.LBB76_5
	.p2align	2
.LBB76_15:
	mov	r3, r9
	b	.LBB76_17
	.p2align	2
.LBB76_16:                              @   in Loop: Header=BB76_17 Depth=1
	mov	r2, r6
	mov	r6, r9
	cmp	r2, #0
	mov	r3, r6
	beq	.LBB76_27
.LBB76_17:                              @ =>This Inner Loop Header: Depth=1
	sub.w	r1, r2, #194
	cmp	r1, #30
	add.w	r1, r7, #1
	bhs	.LBB76_20
@ %bb.18:                               @   in Loop: Header=BB76_17 Depth=1
	ldrsb.w	r1, [r1]
	cmn.w	r1, #65
	bgt	.LBB76_28
@ %bb.19:                               @   in Loop: Header=BB76_17 Depth=1
	and	r1, r1, #63
	bfi	r1, r2, #6, #5
	adds	r7, #2
	mov	r2, r1
	b	.LBB76_21
	.p2align	2
.LBB76_20:                              @   in Loop: Header=BB76_17 Depth=1
	sxtb	r7, r2
	cmp	r7, #0
	mov	r7, r1
	bmi	.LBB76_28
.LBB76_21:                              @   in Loop: Header=BB76_17 Depth=1
	ldrb	r6, [r7]
	mov	r1, r0
	cmp	r6, #0
	it	eq
	orreq	r1, r1, #1073741824
	cmp	r2, #13
	beq	.LBB76_16
@ %bb.22:                               @   in Loop: Header=BB76_17 Depth=1
	cmp	r2, #10
	bne	.LBB76_24
@ %bb.23:                               @   in Loop: Header=BB76_17 Depth=1
	adds	r4, #1
	mov	r6, r9
	ldrb	r2, [r7]
	cmp	r2, #0
	mov	r3, r6
	bne	.LBB76_17
	b	.LBB76_27
	.p2align	2
.LBB76_24:                              @   in Loop: Header=BB76_17 Depth=1
	cmp	r4, #19
	add.w	r6, r3, #1
	it	ls
	cmpls	r3, #59
	bls	.LBB76_26
@ %bb.25:                               @   in Loop: Header=BB76_17 Depth=1
	ldr.w	r1, [r12]
	adds	r1, #1
	str.w	r1, [r12]
	ldrb	r2, [r7]
	cmp	r2, #0
	mov	r3, r6
	bne	.LBB76_17
	b	.LBB76_27
	.p2align	2
.LBB76_26:                              @   in Loop: Header=BB76_17 Depth=1
	orrs	r1, r2
	rsb	r2, r4, r4, lsl #4
	add.w	r2, r8, r2, lsl #4
	str.w	r1, [r2, r3, lsl #2]
	ldrb	r2, [r7]
	cmp	r2, #0
	mov	r3, r6
	bne	.LBB76_17
.LBB76_27:
	add	sp, #4
	pop.w	{r4, r5, r6, r7, r8, r9, pc}
	.p2align	2
.LBB76_28:
	movw	r0, :lower16:.L.str.162
	movt	r0, :upper16:.L.str.162
	bl	credits_private_credits_fail
.Lfunc_end76:
	.size	credits_private_canvas_string_cursor, .Lfunc_end76-credits_private_canvas_string_cursor
	.cantunwind
	.fnend
                                        @ -- End function
	.globl	credits_private_canvas_char     @ -- Begin function credits_private_canvas_char
	.p2align	1
	.prefalign	2, .Lfunc_end77, nop
	.type	credits_private_canvas_char,%function
	.code	16
	.thumb_func
credits_private_canvas_char:            @ @credits_private_canvas_char
	.fnstart
@ %bb.0:
	.save	{r4, r5, r6, r7, r8, r9, r10, lr}
	push.w	{r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r9, r1
	ldr	r1, [sp, #32]
	mov	r8, r0
	mov	r0, r1
	mov	r7, r3
	mov	r10, r2
	bl	credits_private_canvas60_style
	ldrb	r4, [r7]
	cmp	r4, #0
	it	eq
	popeq.w	{r4, r5, r6, r7, r8, r9, r10, pc}
.LBB77_1:
	movw	r1, #4804
	add	r1, r8
	mov	r3, r9
	b	.LBB77_5
	.p2align	2
.LBB77_2:                               @   in Loop: Header=BB77_5 Depth=1
	add.w	r10, r10, #1
.LBB77_3:                               @   in Loop: Header=BB77_5 Depth=1
	mov	r5, r9
.LBB77_4:                               @   in Loop: Header=BB77_5 Depth=1
	ldrb	r4, [r7]
	mov	r3, r5
	cbz	r4, .LBB77_14
.LBB77_5:                               @ =>This Inner Loop Header: Depth=1
	sub.w	r6, r4, #194
	cmp	r6, #29
	add.w	r6, r7, #1
	bhi	.LBB77_8
@ %bb.6:                                @   in Loop: Header=BB77_5 Depth=1
	ldrsb.w	r6, [r6]
	cmn.w	r6, #65
	bgt	.LBB77_15
@ %bb.7:                                @   in Loop: Header=BB77_5 Depth=1
	and	r2, r6, #63
	bfi	r2, r4, #6, #5
	adds	r7, #2
	mov	r4, r2
	b	.LBB77_9
	.p2align	2
.LBB77_8:                               @   in Loop: Header=BB77_5 Depth=1
	sxtb	r2, r4
	cmp.w	r2, #-1
	mov	r7, r6
	ble	.LBB77_15
.LBB77_9:                               @   in Loop: Header=BB77_5 Depth=1
	cmp	r4, #13
	beq	.LBB77_3
@ %bb.10:                               @   in Loop: Header=BB77_5 Depth=1
	cmp	r4, #10
	beq	.LBB77_2
@ %bb.11:                               @   in Loop: Header=BB77_5 Depth=1
	cmp	r3, #59
	add.w	r5, r3, #1
	it	ls
	cmpls.w	r10, #20
	blo	.LBB77_13
@ %bb.12:                               @   in Loop: Header=BB77_5 Depth=1
	ldr	r2, [r1]
	adds	r2, #1
	str	r2, [r1]
	b	.LBB77_4
	.p2align	2
.LBB77_13:                              @   in Loop: Header=BB77_5 Depth=1
	rsb	r6, r10, r10, lsl #4
	orr.w	r2, r4, r0
	add.w	r6, r8, r6, lsl #4
	str.w	r2, [r6, r3, lsl #2]
	b	.LBB77_4
	.p2align	2
.LBB77_14:
	pop.w	{r4, r5, r6, r7, r8, r9, r10, pc}
	.p2align	2
.LBB77_15:
	movw	r0, :lower16:.L.str.162
	movt	r0, :upper16:.L.str.162
	bl	credits_private_credits_fail
.Lfunc_end77:
	.size	credits_private_canvas_char, .Lfunc_end77-credits_private_canvas_char
	.cantunwind
	.fnend
                                        @ -- End function
	.globl	credits_private_canvas60_flow   @ -- Begin function credits_private_canvas60_flow
	.p2align	1
	.prefalign	2, .Lfunc_end78, nop
	.type	credits_private_canvas60_flow,%function
	.code	16
	.thumb_func
credits_private_canvas60_flow:          @ @credits_private_canvas60_flow
	.fnstart
@ %bb.0:
	.save	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	push.w	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	.pad	#4
	sub	sp, #4
	cmp	r2, #0
	str	r1, [sp]                        @ 4-byte Spill
	bmi	.LBB78_15
@ %bb.1:
	cmp	r3, #0
	bmi	.LBB78_15
@ %bb.2:
	ldr	r1, [sp, #40]
	cmp	r1, #1
	blt	.LBB78_15
@ %bb.3:
	ldr	r7, [sp, #44]
	cmp	r7, #1
	blt	.LBB78_15
@ %bb.4:
	adds	r4, r2, r1
	cmp	r4, #60
	bgt	.LBB78_15
@ %bb.5:
	add.w	r9, r3, r7
	cmp.w	r9, #21
	bge	.LBB78_15
@ %bb.6:
	ldr	r7, [sp, #48]
	cbz	r7, .LBB78_14
@ %bb.7:
	rsb	r12, r3, r3, lsl #4
	lsl.w	r7, r12, #4
	ldr	r5, [sp]                        @ 4-byte Reload
	add.w	r7, r7, r2, lsl #2
	movs	r6, #32
	add	r7, r5
	movt	r6, #3175
	adds	r1, r2, #1
	add.w	r10, r7, #8
	add.w	r12, r5, r12, lsl #4
	mov	r11, r3
	b	.LBB78_9
	.p2align	2
.LBB78_8:                               @   in Loop: Header=BB78_9 Depth=1
	add.w	r11, r11, #1
	add.w	r10, r10, #240
	cmp	r11, r9
	add.w	r12, r12, #240
	bge	.LBB78_14
.LBB78_9:                               @ =>This Loop Header: Depth=1
                                        @     Child Loop BB78_10 Depth 2
	mov	r7, r10
	mov	r8, r1
	.p2align	2
.LBB78_10:                              @   Parent Loop BB78_9 Depth=1
                                        @ =>  This Inner Loop Header: Depth=2
	cmp	r8, r4
	str	r6, [r7, #-8]
	bge	.LBB78_8
@ %bb.11:                               @   in Loop: Header=BB78_10 Depth=2
	add.w	lr, r8, #1
	cmp	lr, r4
	str.w	r6, [r12, r8, lsl #2]
	bge	.LBB78_8
@ %bb.12:                               @   in Loop: Header=BB78_10 Depth=2
	add.w	r5, r8, #2
	cmp	r5, r4
	str	r6, [r7]
	bge	.LBB78_8
@ %bb.13:                               @   in Loop: Header=BB78_10 Depth=2
	add.w	r5, r8, #3
	str	r6, [r7, #4]
	add.w	r8, r8, #4
	adds	r7, #16
	cmp	r5, r4
	blt	.LBB78_10
	b	.LBB78_8
	.p2align	2
.LBB78_14:
	ldr	r7, [sp]                        @ 4-byte Reload
	movs	r1, #0
	strd	r7, r2, [r0]
	ldr	r2, [sp, #40]
	str	r3, [r0, #8]
	str	r2, [r0, #12]
	ldr	r2, [sp, #44]
	str	r1, [r0, #24]
	strd	r2, r1, [r0, #16]
	add	sp, #4
	pop.w	{r4, r5, r6, r7, r8, r9, r10, r11, pc}
	.p2align	2
.LBB78_15:
	movw	r0, :lower16:.L.str.163
	movt	r0, :upper16:.L.str.163
	bl	credits_private_credits_fail
.Lfunc_end78:
	.size	credits_private_canvas60_flow, .Lfunc_end78-credits_private_canvas60_flow
	.cantunwind
	.fnend
                                        @ -- End function
	.globl	credits_private_canvas60_newline @ -- Begin function credits_private_canvas60_newline
	.p2align	1
	.prefalign	2, .Lfunc_end79, nop
	.type	credits_private_canvas60_newline,%function
	.code	16
	.thumb_func
credits_private_canvas60_newline:       @ @credits_private_canvas60_newline
	.fnstart
@ %bb.0:
	.save	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	push.w	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	.pad	#12
	sub	sp, #12
	mov	r4, r0
	ldrd	r7, r1, [r4, #16]
	movs	r0, #0
	str	r0, [r4, #24]
	adds	r0, r1, #1
	cmp	r0, r7
	str	r0, [r4, #20]
	blt.w	.LBB79_21
@ %bb.1:
	ldrd	r6, r1, [r4, #4]
	ldr.w	r9, [r4, #12]
	cmp	r7, #2
	sub.w	r12, r7, #1
	blt	.LBB79_10
@ %bb.2:
	subs	r0, r7, #2
	lsl.w	r5, r9, #2
	cmp	r0, #3
	and	r0, r12, #3
	str	r1, [sp, #8]                    @ 4-byte Spill
	bhs	.LBB79_4
@ %bb.3:
	mov.w	r11, #0
	b	.LBB79_7
	.p2align	2
.LBB79_4:
	str	r0, [sp, #4]                    @ 4-byte Spill
	rsb	r0, r1, r1, lsl #4
	lsls	r0, r0, #4
	add.w	r0, r0, r6, lsl #2
	bic	r8, r12, #3
	sub.w	r10, r0, #960
	mov.w	r11, #0
	.p2align	2
.LBB79_5:                               @ =>This Inner Loop Header: Depth=1
	ldr	r0, [r4]
	mov	r2, r5
	add.w	r1, r0, r10
	add.w	r0, r1, #960
	add.w	r1, r1, #1200
	bl	__aeabi_memmove4
	ldr	r0, [r4]
	mov	r2, r5
	add.w	r1, r0, r10
	add.w	r0, r1, #1200
	add.w	r1, r1, #1440
	bl	__aeabi_memmove4
	ldr	r0, [r4]
	mov	r2, r5
	add.w	r1, r0, r10
	add.w	r0, r1, #1440
	add.w	r1, r1, #1680
	bl	__aeabi_memmove4
	ldr	r0, [r4]
	mov	r2, r5
	add.w	r1, r0, r10
	add.w	r0, r1, #1680
	add.w	r1, r1, #1920
	bl	__aeabi_memmove4
	add.w	r11, r11, #4
	cmp	r8, r11
	add.w	r10, r10, #960
	bne	.LBB79_5
@ %bb.6:
	ldr	r0, [sp, #4]                    @ 4-byte Reload
	ldr	r1, [sp, #8]                    @ 4-byte Reload
	sub.w	r12, r7, #1
	cbz	r0, .LBB79_10
.LBB79_7:
	ldr	r1, [sp, #8]                    @ 4-byte Reload
	mov	r10, r0
	ldr	r0, [r4]
	add	r1, r11
	rsb	r8, r1, r1, lsl #4
	add.w	r0, r0, r8, lsl #4
	add.w	r0, r0, r6, lsl #2
	add.w	r1, r0, #240
	mov	r2, r5
	mov	r11, r12
	bl	__aeabi_memmove4
	ldr	r1, [sp, #8]                    @ 4-byte Reload
	mov	r12, r11
	cmp.w	r10, #1
	beq	.LBB79_10
@ %bb.8:
	ldr	r0, [r4]
	mov	r2, r5
	add.w	r0, r0, r8, lsl #4
	add.w	r1, r0, r6, lsl #2
	add.w	r0, r1, #240
	add.w	r1, r1, #480
	bl	__aeabi_memmove4
	ldr	r1, [sp, #8]                    @ 4-byte Reload
	mov	r12, r11
	cmp.w	r10, #2
	beq	.LBB79_10
@ %bb.9:
	ldr	r0, [r4]
	mov	r2, r5
	add.w	r0, r0, r8, lsl #4
	add.w	r1, r0, r6, lsl #2
	add.w	r0, r1, #480
	add.w	r1, r1, #720
	bl	__aeabi_memmove4
	ldr	r1, [sp, #8]                    @ 4-byte Reload
	mov	r12, r11
.LBB79_10:
	cmp	r6, #0
	bmi	.LBB79_22
@ %bb.11:
	adds	r3, r1, r7
	cmp	r3, #1
	blt	.LBB79_22
@ %bb.12:
	cmp.w	r9, #1
	blt	.LBB79_22
@ %bb.13:
	add.w	r0, r9, r6
	cmp	r0, #60
	bgt	.LBB79_22
@ %bb.14:
	cmp	r3, #20
	bgt	.LBB79_22
@ %bb.15:
	rsb	r3, r3, r3, lsl #4
	ldr	r1, [r4]
	lsls	r3, r3, #4
	add.w	r3, r3, r6, lsl #2
	movs	r2, #32
	add	r3, r1
	movt	r2, #3175
	subs	r3, #240
	.p2align	2
.LBB79_16:                              @ =>This Inner Loop Header: Depth=1
	adds	r7, r6, #1
	cmp	r7, r0
	str	r2, [r3]
	bge	.LBB79_20
@ %bb.17:                               @   in Loop: Header=BB79_16 Depth=1
	adds	r7, r6, #2
	cmp	r7, r0
	str	r2, [r3, #4]
	bge	.LBB79_20
@ %bb.18:                               @   in Loop: Header=BB79_16 Depth=1
	adds	r7, r6, #3
	cmp	r7, r0
	str	r2, [r3, #8]
	bge	.LBB79_20
@ %bb.19:                               @   in Loop: Header=BB79_16 Depth=1
	adds	r6, #4
	str	r2, [r3, #12]
	cmp	r6, r0
	add.w	r3, r3, #16
	blt	.LBB79_16
.LBB79_20:
	mov.w	r0, #4800
	ldr	r2, [r1, r0]
	str.w	r12, [r4, #20]
	adds	r2, #1
	str	r2, [r1, r0]
.LBB79_21:
	add	sp, #12
	pop.w	{r4, r5, r6, r7, r8, r9, r10, r11, pc}
	.p2align	2
.LBB79_22:
	movw	r0, :lower16:.L.str.163
	movt	r0, :upper16:.L.str.163
	bl	credits_private_credits_fail
.Lfunc_end79:
	.size	credits_private_canvas60_newline, .Lfunc_end79-credits_private_canvas60_newline
	.cantunwind
	.fnend
                                        @ -- End function
	.globl	credits_private_canvas60_line   @ -- Begin function credits_private_canvas60_line
	.p2align	1
	.prefalign	2, .Lfunc_end80, nop
	.type	credits_private_canvas60_line,%function
	.code	16
	.thumb_func
credits_private_canvas60_line:          @ @credits_private_canvas60_line
	.fnstart
@ %bb.0:
	.save	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	push.w	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	.pad	#36
	sub	sp, #36
	mov	r5, r0
	mov	r0, r2
	mov	r11, r3
	mov	r8, r1
	bl	credits_private_canvas60_style
	str	r0, [sp, #28]                   @ 4-byte Spill
	mov	r0, r8
	bl	strlen
	cbz	r0, .LBB80_10
@ %bb.1:
	subs	r1, r0, #3
	subs	r2, r0, #2
.LBB80_2:                               @ =>This Inner Loop Header: Depth=1
	add.w	r7, r8, r0
	mov	r3, r7
	ldrb	r6, [r3, #-1]!
	cmp	r6, #32
	bne	.LBB80_11
@ %bb.3:                                @   in Loop: Header=BB80_2 Depth=1
	cmp	r3, r8
	bls	.LBB80_10
@ %bb.4:                                @   in Loop: Header=BB80_2 Depth=1
	ldrb	r3, [r7, #-2]
	cmp	r3, #32
	bne	.LBB80_12
@ %bb.5:                                @   in Loop: Header=BB80_2 Depth=1
	add.w	r12, r8, r2
	cmp	r12, r8
	bls	.LBB80_10
@ %bb.6:                                @   in Loop: Header=BB80_2 Depth=1
	ldrb	r3, [r7, #-3]
	cmp	r3, #32
	bne	.LBB80_13
@ %bb.7:                                @   in Loop: Header=BB80_2 Depth=1
	add.w	r12, r8, r1
	cmp	r12, r8
	bls	.LBB80_10
@ %bb.8:                                @   in Loop: Header=BB80_2 Depth=1
	ldrb	r3, [r7, #-4]
	cmp	r3, #32
	bne	.LBB80_13
@ %bb.9:                                @   in Loop: Header=BB80_2 Depth=1
	subs	r0, #4
	add.w	r3, r8, r0
	subs	r1, #4
	cmp	r3, r8
	sub.w	r2, r2, #4
	bhi	.LBB80_2
.LBB80_10:
	add	sp, #36
	pop.w	{r4, r5, r6, r7, r8, r9, r10, r11, pc}
	.p2align	2
.LBB80_11:
	mov	r12, r7
	b	.LBB80_13
	.p2align	2
.LBB80_12:
	sub.w	r12, r7, #1
.LBB80_13:
	movw	lr, #32
	movt	lr, #3175
	mov	r4, r8
	str.w	r11, [sp, #4]                   @ 4-byte Spill
	str.w	r12, [sp, #12]                  @ 4-byte Spill
	b	.LBB80_16
	.p2align	2
.LBB80_14:                              @   in Loop: Header=BB80_16 Depth=1
	movs	r0, #0
	str	r0, [r5, #24]
.LBB80_15:                              @   in Loop: Header=BB80_16 Depth=1
	cmp	r4, r12
	mov	r8, r4
	bhs	.LBB80_10
.LBB80_16:                              @ =>This Loop Header: Depth=1
                                        @     Child Loop BB80_30 Depth 2
                                        @     Child Loop BB80_62 Depth 2
                                        @     Child Loop BB80_73 Depth 2
                                        @     Child Loop BB80_81 Depth 2
                                        @       Child Loop BB80_92 Depth 3
                                        @       Child Loop BB80_103 Depth 3
                                        @     Child Loop BB80_45 Depth 2
                                        @     Child Loop BB80_56 Depth 2
	ldrb	r0, [r4], #1
	sub.w	r1, r0, #194
	cmp	r1, #29
	bhi	.LBB80_19
@ %bb.17:                               @   in Loop: Header=BB80_16 Depth=1
	ldrsb.w	r1, [r4]
	cmn.w	r1, #65
	bgt.w	.LBB80_111
@ %bb.18:                               @   in Loop: Header=BB80_16 Depth=1
	and	r1, r1, #63
	bfi	r1, r0, #6, #5
	add.w	r4, r8, #2
	mov	r0, r1
	b	.LBB80_20
	.p2align	2
.LBB80_19:                              @   in Loop: Header=BB80_16 Depth=1
	sxtb	r1, r0
	cmp.w	r1, #-1
	ble.w	.LBB80_111
.LBB80_20:                              @   in Loop: Header=BB80_16 Depth=1
	cmp	r0, #13
	beq	.LBB80_14
@ %bb.21:                               @   in Loop: Header=BB80_16 Depth=1
	cmp	r0, #10
	bne	.LBB80_26
@ %bb.22:                               @   in Loop: Header=BB80_16 Depth=1
	ldrd	r9, r0, [r5, #16]
	movs	r1, #0
	adds	r0, #1
	cmp	r0, r9
	str	r1, [r5, #24]
	str	r0, [r5, #20]
	blt	.LBB80_15
@ %bb.23:                               @   in Loop: Header=BB80_16 Depth=1
	ldrd	r6, r1, [r5, #4]
	ldr.w	r10, [r5, #12]
	cmp.w	r9, #2
	sub.w	r0, r9, #1
	str	r4, [sp, #32]                   @ 4-byte Spill
	str	r0, [sp, #24]                   @ 4-byte Spill
	blt.w	.LBB80_50
@ %bb.24:                               @   in Loop: Header=BB80_16 Depth=1
	sub.w	r0, r9, #2
	cmp	r0, #3
	sub.w	r0, r9, #1
	lsl.w	r4, r10, #2
	and	r2, r0, #3
	str	r1, [sp, #20]                   @ 4-byte Spill
	bhs	.LBB80_44
@ %bb.25:                               @   in Loop: Header=BB80_16 Depth=1
	mov.w	r8, #0
	b	.LBB80_47
	.p2align	2
.LBB80_26:                              @   in Loop: Header=BB80_16 Depth=1
	bic	r0, r0, #128
	cmp	r0, #32
	bne	.LBB80_28
@ %bb.27:                               @   in Loop: Header=BB80_16 Depth=1
	ldr	r0, [r5, #12]
	ldr	r1, [r5, #24]
	mov	r9, r4
	cmp	r1, r0
	beq	.LBB80_15
	b	.LBB80_78
	.p2align	2
.LBB80_28:                              @   in Loop: Header=BB80_16 Depth=1
	movs	r0, #1
	cmp	r4, r12
	bhs	.LBB80_38
@ %bb.29:                               @   in Loop: Header=BB80_16 Depth=1
	mov	r9, r4
.LBB80_30:                              @   Parent Loop BB80_16 Depth=1
                                        @ =>  This Inner Loop Header: Depth=2
	ldrb	r1, [r9], #1
	sub.w	r2, r1, #194
	cmp	r2, #29
	bhi	.LBB80_33
@ %bb.31:                               @   in Loop: Header=BB80_30 Depth=2
	ldrsb.w	r2, [r9]
	cmn.w	r2, #65
	bgt.w	.LBB80_111
@ %bb.32:                               @   in Loop: Header=BB80_30 Depth=2
	and	r2, r2, #63
	bfi	r2, r1, #6, #5
	add.w	r9, r4, #2
	mov	r1, r2
	b	.LBB80_34
	.p2align	2
.LBB80_33:                              @   in Loop: Header=BB80_30 Depth=2
	sxtb	r2, r1
	cmp.w	r2, #-1
	ble.w	.LBB80_111
.LBB80_34:                              @   in Loop: Header=BB80_30 Depth=2
	bic	r2, r1, #128
	cmp	r2, #32
	it	ne
	cmpne	r1, #10
	beq	.LBB80_38
@ %bb.35:                               @   in Loop: Header=BB80_30 Depth=2
	cmp	r1, #13
	beq	.LBB80_38
@ %bb.36:                               @   in Loop: Header=BB80_30 Depth=2
	adds	r0, #1
	cmp	r9, r12
	mov	r4, r9
	blo	.LBB80_30
@ %bb.37:                               @   in Loop: Header=BB80_16 Depth=1
	ldr	r6, [r5, #12]
	cmp	r0, r6
	ble	.LBB80_39
	b	.LBB80_78
	.p2align	2
.LBB80_38:                              @   in Loop: Header=BB80_16 Depth=1
	mov	r9, r4
	ldr	r6, [r5, #12]
	cmp	r0, r6
	bgt.w	.LBB80_78
.LBB80_39:                              @   in Loop: Header=BB80_16 Depth=1
	ldr	r1, [r5, #24]
	add	r0, r1
	cmp	r0, r6
	ble.w	.LBB80_78
@ %bb.40:                               @   in Loop: Header=BB80_16 Depth=1
	ldrd	r2, r0, [r5, #16]
	movs	r1, #0
	adds	r0, #1
	cmp	r0, r2
	str	r1, [r5, #24]
	str	r0, [r5, #20]
	blt.w	.LBB80_78
@ %bb.41:                               @   in Loop: Header=BB80_16 Depth=1
	ldrd	r7, r1, [r5, #4]
	cmp	r2, #2
	sub.w	r0, r2, #1
	str.w	r9, [sp, #8]                    @ 4-byte Spill
	str	r0, [sp, #32]                   @ 4-byte Spill
	blt.w	.LBB80_67
@ %bb.42:                               @   in Loop: Header=BB80_16 Depth=1
	subs	r0, r2, #2
	subs	r3, r2, #1
	lsls	r4, r6, #2
	cmp	r0, #3
	and	r10, r3, #3
	strd	r2, r1, [sp, #20]               @ 8-byte Folded Spill
	bhs.w	.LBB80_61
@ %bb.43:                               @   in Loop: Header=BB80_16 Depth=1
	mov.w	r9, #0
	b	.LBB80_64
	.p2align	2
.LBB80_44:                              @   in Loop: Header=BB80_16 Depth=1
	bic	r7, r0, #3
	rsb	r0, r1, r1, lsl #4
	lsls	r0, r0, #4
	add.w	r0, r0, r6, lsl #2
	sub.w	r11, r0, #960
	mov.w	r8, #0
	str	r2, [sp, #16]                   @ 4-byte Spill
	.p2align	2
.LBB80_45:                              @   Parent Loop BB80_16 Depth=1
                                        @ =>  This Inner Loop Header: Depth=2
	ldr	r0, [r5]
	mov	r2, r4
	add.w	r1, r0, r11
	add.w	r0, r1, #960
	add.w	r1, r1, #1200
	bl	__aeabi_memmove4
	ldr	r0, [r5]
	mov	r2, r4
	add.w	r1, r0, r11
	add.w	r0, r1, #1200
	add.w	r1, r1, #1440
	bl	__aeabi_memmove4
	ldr	r0, [r5]
	mov	r2, r4
	add.w	r1, r0, r11
	add.w	r0, r1, #1440
	add.w	r1, r1, #1680
	bl	__aeabi_memmove4
	ldr	r0, [r5]
	mov	r2, r4
	add.w	r1, r0, r11
	add.w	r0, r1, #1680
	add.w	r1, r1, #1920
	bl	__aeabi_memmove4
	add.w	r8, r8, #4
	cmp	r7, r8
	add.w	r11, r11, #960
	bne	.LBB80_45
@ %bb.46:                               @   in Loop: Header=BB80_16 Depth=1
	ldr	r2, [sp, #16]                   @ 4-byte Reload
	ldr.w	r11, [sp, #4]                   @ 4-byte Reload
	ldr.w	r12, [sp, #12]                  @ 4-byte Reload
	movw	lr, #32
	ldr	r1, [sp, #20]                   @ 4-byte Reload
	cmp	r2, #0
	movt	lr, #3175
	beq	.LBB80_50
.LBB80_47:                              @   in Loop: Header=BB80_16 Depth=1
	ldr	r1, [sp, #20]                   @ 4-byte Reload
	ldr	r0, [r5]
	add	r1, r8
	rsb	r8, r1, r1, lsl #4
	add.w	r0, r0, r8, lsl #4
	add.w	r0, r0, r6, lsl #2
	add.w	r1, r0, #240
	mov	r7, r2
	mov	r2, r4
	bl	__aeabi_memmove4
	ldr	r1, [sp, #20]                   @ 4-byte Reload
	movw	lr, #32
	ldr.w	r12, [sp, #12]                  @ 4-byte Reload
	movt	lr, #3175
	cmp	r7, #1
	beq	.LBB80_50
@ %bb.48:                               @   in Loop: Header=BB80_16 Depth=1
	ldr	r0, [r5]
	mov	r2, r4
	add.w	r0, r0, r8, lsl #4
	add.w	r1, r0, r6, lsl #2
	add.w	r0, r1, #240
	add.w	r1, r1, #480
	bl	__aeabi_memmove4
	ldr	r1, [sp, #20]                   @ 4-byte Reload
	movw	lr, #32
	ldr.w	r12, [sp, #12]                  @ 4-byte Reload
	movt	lr, #3175
	cmp	r7, #2
	beq	.LBB80_50
@ %bb.49:                               @   in Loop: Header=BB80_16 Depth=1
	ldr	r0, [r5]
	mov	r2, r4
	add.w	r0, r0, r8, lsl #4
	add.w	r1, r0, r6, lsl #2
	add.w	r0, r1, #480
	add.w	r1, r1, #720
	bl	__aeabi_memmove4
	ldr	r1, [sp, #20]                   @ 4-byte Reload
	movw	lr, #32
	ldr.w	r12, [sp, #12]                  @ 4-byte Reload
	movt	lr, #3175
.LBB80_50:                              @   in Loop: Header=BB80_16 Depth=1
	cmp	r6, #0
	bmi.w	.LBB80_112
@ %bb.51:                               @   in Loop: Header=BB80_16 Depth=1
	add.w	r2, r1, r9
	cmp	r2, #1
	blt.w	.LBB80_112
@ %bb.52:                               @   in Loop: Header=BB80_16 Depth=1
	cmp.w	r10, #1
	blt.w	.LBB80_112
@ %bb.53:                               @   in Loop: Header=BB80_16 Depth=1
	add.w	r0, r10, r6
	cmp	r0, #60
	bgt.w	.LBB80_112
@ %bb.54:                               @   in Loop: Header=BB80_16 Depth=1
	cmp	r2, #20
	bgt.w	.LBB80_112
@ %bb.55:                               @   in Loop: Header=BB80_16 Depth=1
	rsb	r2, r2, r2, lsl #4
	ldr	r1, [r5]
	lsls	r2, r2, #4
	add.w	r2, r2, r6, lsl #2
	add	r2, r1
	ldr	r4, [sp, #32]                   @ 4-byte Reload
	subs	r2, #240
	.p2align	2
.LBB80_56:                              @   Parent Loop BB80_16 Depth=1
                                        @ =>  This Inner Loop Header: Depth=2
	adds	r3, r6, #1
	cmp	r3, r0
	str.w	lr, [r2]
	bge	.LBB80_60
@ %bb.57:                               @   in Loop: Header=BB80_56 Depth=2
	adds	r3, r6, #2
	cmp	r3, r0
	str.w	lr, [r2, #4]
	bge	.LBB80_60
@ %bb.58:                               @   in Loop: Header=BB80_56 Depth=2
	adds	r3, r6, #3
	cmp	r3, r0
	str.w	lr, [r2, #8]
	bge	.LBB80_60
@ %bb.59:                               @   in Loop: Header=BB80_56 Depth=2
	adds	r6, #4
	str.w	lr, [r2, #12]
	cmp	r6, r0
	add.w	r2, r2, #16
	blt	.LBB80_56
.LBB80_60:                              @   in Loop: Header=BB80_16 Depth=1
	mov.w	r2, #4800
	ldr	r0, [r1, r2]
	ldr	r3, [sp, #24]                   @ 4-byte Reload
	adds	r0, #1
	str	r3, [r5, #20]
	str	r0, [r1, r2]
	b	.LBB80_15
	.p2align	2
.LBB80_61:                              @   in Loop: Header=BB80_16 Depth=1
	rsb	r0, r1, r1, lsl #4
	lsls	r0, r0, #4
	add.w	r0, r0, r7, lsl #2
	str.w	r10, [sp, #16]                  @ 4-byte Spill
	bic	r11, r3, #3
	sub.w	r10, r0, #960
	mov.w	r9, #0
	.p2align	2
.LBB80_62:                              @   Parent Loop BB80_16 Depth=1
                                        @ =>  This Inner Loop Header: Depth=2
	ldr	r0, [r5]
	mov	r2, r4
	add.w	r1, r0, r10
	add.w	r0, r1, #960
	add.w	r1, r1, #1200
	bl	__aeabi_memmove4
	ldr	r0, [r5]
	mov	r2, r4
	add.w	r1, r0, r10
	add.w	r0, r1, #1200
	add.w	r1, r1, #1440
	bl	__aeabi_memmove4
	ldr	r0, [r5]
	mov	r2, r4
	add.w	r1, r0, r10
	add.w	r0, r1, #1440
	add.w	r1, r1, #1680
	bl	__aeabi_memmove4
	ldr	r0, [r5]
	mov	r2, r4
	add.w	r1, r0, r10
	add.w	r0, r1, #1680
	add.w	r1, r1, #1920
	bl	__aeabi_memmove4
	add.w	r9, r9, #4
	cmp	r11, r9
	add.w	r10, r10, #960
	bne	.LBB80_62
@ %bb.63:                               @   in Loop: Header=BB80_16 Depth=1
	ldr.w	r10, [sp, #16]                  @ 4-byte Reload
	ldr.w	r11, [sp, #4]                   @ 4-byte Reload
	ldr.w	r12, [sp, #12]                  @ 4-byte Reload
	movw	lr, #32
	ldrd	r2, r1, [sp, #20]               @ 8-byte Folded Reload
	cmp.w	r10, #0
	movt	lr, #3175
	beq	.LBB80_67
.LBB80_64:                              @   in Loop: Header=BB80_16 Depth=1
	ldr	r1, [sp, #24]                   @ 4-byte Reload
	ldr	r0, [r5]
	add	r1, r9
	rsb	r9, r1, r1, lsl #4
	add.w	r0, r0, r9, lsl #4
	add.w	r0, r0, r7, lsl #2
	add.w	r1, r0, #240
	mov	r2, r4
	bl	__aeabi_memmove4
	ldrd	r2, r1, [sp, #20]               @ 8-byte Folded Reload
	movw	lr, #32
	ldr.w	r12, [sp, #12]                  @ 4-byte Reload
	movt	lr, #3175
	cmp.w	r10, #1
	beq	.LBB80_67
@ %bb.65:                               @   in Loop: Header=BB80_16 Depth=1
	ldr	r0, [r5]
	mov	r2, r4
	add.w	r0, r0, r9, lsl #4
	add.w	r1, r0, r7, lsl #2
	add.w	r0, r1, #240
	add.w	r1, r1, #480
	bl	__aeabi_memmove4
	ldrd	r2, r1, [sp, #20]               @ 8-byte Folded Reload
	movw	lr, #32
	ldr.w	r12, [sp, #12]                  @ 4-byte Reload
	movt	lr, #3175
	cmp.w	r10, #2
	beq	.LBB80_67
@ %bb.66:                               @   in Loop: Header=BB80_16 Depth=1
	ldr	r0, [r5]
	mov	r2, r4
	add.w	r0, r0, r9, lsl #4
	add.w	r1, r0, r7, lsl #2
	add.w	r0, r1, #480
	add.w	r1, r1, #720
	bl	__aeabi_memmove4
	ldrd	r2, r1, [sp, #20]               @ 8-byte Folded Reload
	movw	lr, #32
	ldr.w	r12, [sp, #12]                  @ 4-byte Reload
	movt	lr, #3175
.LBB80_67:                              @   in Loop: Header=BB80_16 Depth=1
	cmp	r6, #1
	blt.w	.LBB80_112
@ %bb.68:                               @   in Loop: Header=BB80_16 Depth=1
	cmp	r7, #0
	bmi.w	.LBB80_112
@ %bb.69:                               @   in Loop: Header=BB80_16 Depth=1
	add	r2, r1
	cmp	r2, #1
	blt.w	.LBB80_112
@ %bb.70:                               @   in Loop: Header=BB80_16 Depth=1
	adds	r0, r7, r6
	cmp	r0, #60
	bgt.w	.LBB80_112
@ %bb.71:                               @   in Loop: Header=BB80_16 Depth=1
	cmp	r2, #20
	bgt.w	.LBB80_112
@ %bb.72:                               @   in Loop: Header=BB80_16 Depth=1
	rsb	r2, r2, r2, lsl #4
	ldr	r1, [r5]
	lsls	r2, r2, #4
	add.w	r2, r2, r7, lsl #2
	add	r2, r1
	ldr.w	r9, [sp, #8]                    @ 4-byte Reload
	subs	r2, #240
	.p2align	2
.LBB80_73:                              @   Parent Loop BB80_16 Depth=1
                                        @ =>  This Inner Loop Header: Depth=2
	adds	r3, r7, #1
	cmp	r3, r0
	str.w	lr, [r2]
	bge	.LBB80_77
@ %bb.74:                               @   in Loop: Header=BB80_73 Depth=2
	adds	r3, r7, #2
	cmp	r3, r0
	str.w	lr, [r2, #4]
	bge	.LBB80_77
@ %bb.75:                               @   in Loop: Header=BB80_73 Depth=2
	adds	r3, r7, #3
	cmp	r3, r0
	str.w	lr, [r2, #8]
	bge	.LBB80_77
@ %bb.76:                               @   in Loop: Header=BB80_73 Depth=2
	adds	r7, #4
	str.w	lr, [r2, #12]
	cmp	r7, r0
	add.w	r2, r2, #16
	blt	.LBB80_73
.LBB80_77:                              @   in Loop: Header=BB80_16 Depth=1
	mov.w	r2, #4800
	ldr	r0, [r1, r2]
	ldr	r3, [sp, #32]                   @ 4-byte Reload
	adds	r0, #1
	str	r3, [r5, #20]
	str	r0, [r1, r2]
	.p2align	2
.LBB80_78:                              @   in Loop: Header=BB80_16 Depth=1
	mov	r4, r8
	cmp	r8, r9
	bhs.w	.LBB80_15
@ %bb.79:                               @   in Loop: Header=BB80_16 Depth=1
	str.w	r9, [sp, #8]                    @ 4-byte Spill
	b	.LBB80_81
	.p2align	2
.LBB80_80:                              @   in Loop: Header=BB80_81 Depth=2
	movw	r2, #4804
	ldr	r1, [r0, r2]
	adds	r1, #1
	str	r1, [r0, r2]
	cmp	r4, r9
	bhs.w	.LBB80_15
.LBB80_81:                              @   Parent Loop BB80_16 Depth=1
                                        @ =>  This Loop Header: Depth=2
                                        @       Child Loop BB80_92 Depth 3
                                        @       Child Loop BB80_103 Depth 3
	mov	r0, r4
	ldrb	r6, [r0], #1
	sub.w	r1, r6, #194
	cmp	r1, #29
	bhi	.LBB80_84
@ %bb.82:                               @   in Loop: Header=BB80_81 Depth=2
	ldrsb.w	r0, [r0]
	cmn.w	r0, #65
	bgt.w	.LBB80_111
@ %bb.83:                               @   in Loop: Header=BB80_81 Depth=2
	and	r0, r0, #63
	bfi	r0, r6, #6, #5
	adds	r4, #2
	mov	r6, r0
	b	.LBB80_85
	.p2align	2
.LBB80_84:                              @   in Loop: Header=BB80_81 Depth=2
	sxtb	r1, r6
	cmp.w	r1, #-1
	mov	r4, r0
	ble.w	.LBB80_111
.LBB80_85:                              @   in Loop: Header=BB80_81 Depth=2
	ldr	r0, [r5, #12]
	ldrd	r7, r10, [r5, #20]
	cmp	r10, r0
	bne.w	.LBB80_108
@ %bb.86:                               @   in Loop: Header=BB80_81 Depth=2
	ldr	r1, [r5, #16]
	adds	r7, #1
	movs	r0, #0
	cmp	r7, r1
	strd	r7, r0, [r5, #20]
	bge	.LBB80_88
@ %bb.87:                               @   in Loop: Header=BB80_81 Depth=2
	mov.w	r10, #0
	b	.LBB80_108
	.p2align	2
.LBB80_88:                              @   in Loop: Header=BB80_81 Depth=2
	str	r6, [sp, #24]                   @ 4-byte Spill
	ldrd	r6, r2, [r5, #4]
	cmp	r1, #2
	sub.w	r7, r1, #1
	str	r4, [sp, #32]                   @ 4-byte Spill
	blt.w	.LBB80_97
@ %bb.89:                               @   in Loop: Header=BB80_81 Depth=2
	subs	r0, r1, #2
	lsl.w	r4, r10, #2
	cmp	r0, #3
	and	r11, r7, #3
	strd	r2, r1, [sp, #16]               @ 8-byte Folded Spill
	bhs	.LBB80_91
@ %bb.90:                               @   in Loop: Header=BB80_81 Depth=2
	mov.w	r9, #0
	b	.LBB80_94
	.p2align	2
.LBB80_91:                              @   in Loop: Header=BB80_81 Depth=2
	rsb	r0, r2, r2, lsl #4
	lsls	r0, r0, #4
	add.w	r0, r0, r6, lsl #2
	str.w	r11, [sp]                       @ 4-byte Spill
	bic	r11, r7, #3
	sub.w	r8, r0, #960
	mov.w	r9, #0
	.p2align	2
.LBB80_92:                              @   Parent Loop BB80_16 Depth=1
                                        @     Parent Loop BB80_81 Depth=2
                                        @ =>    This Inner Loop Header: Depth=3
	ldr	r0, [r5]
	mov	r2, r4
	add.w	r1, r0, r8
	add.w	r0, r1, #960
	add.w	r1, r1, #1200
	bl	__aeabi_memmove4
	ldr	r0, [r5]
	mov	r2, r4
	add.w	r1, r0, r8
	add.w	r0, r1, #1200
	add.w	r1, r1, #1440
	bl	__aeabi_memmove4
	ldr	r0, [r5]
	mov	r2, r4
	add.w	r1, r0, r8
	add.w	r0, r1, #1440
	add.w	r1, r1, #1680
	bl	__aeabi_memmove4
	ldr	r0, [r5]
	mov	r2, r4
	add.w	r1, r0, r8
	add.w	r0, r1, #1680
	add.w	r1, r1, #1920
	bl	__aeabi_memmove4
	add.w	r9, r9, #4
	cmp	r11, r9
	add.w	r8, r8, #960
	bne	.LBB80_92
@ %bb.93:                               @   in Loop: Header=BB80_81 Depth=2
	ldr.w	r11, [sp]                       @ 4-byte Reload
	ldr.w	r12, [sp, #12]                  @ 4-byte Reload
	movw	lr, #32
	ldrd	r2, r1, [sp, #16]               @ 8-byte Folded Reload
	cmp.w	r11, #0
	movt	lr, #3175
	beq	.LBB80_97
.LBB80_94:                              @   in Loop: Header=BB80_81 Depth=2
	ldr	r0, [r5]
	add.w	r1, r9, r2
	rsb	r8, r1, r1, lsl #4
	add.w	r0, r0, r8, lsl #4
	add.w	r0, r0, r6, lsl #2
	add.w	r1, r0, #240
	mov	r2, r4
	bl	__aeabi_memmove4
	ldrd	r2, r1, [sp, #16]               @ 8-byte Folded Reload
	movw	lr, #32
	ldr.w	r12, [sp, #12]                  @ 4-byte Reload
	movt	lr, #3175
	cmp.w	r11, #1
	beq	.LBB80_97
@ %bb.95:                               @   in Loop: Header=BB80_81 Depth=2
	ldr	r0, [r5]
	mov	r2, r4
	add.w	r0, r0, r8, lsl #4
	add.w	r1, r0, r6, lsl #2
	add.w	r0, r1, #240
	add.w	r1, r1, #480
	bl	__aeabi_memmove4
	ldrd	r2, r1, [sp, #16]               @ 8-byte Folded Reload
	movw	lr, #32
	ldr.w	r12, [sp, #12]                  @ 4-byte Reload
	movt	lr, #3175
	cmp.w	r11, #2
	beq	.LBB80_97
@ %bb.96:                               @   in Loop: Header=BB80_81 Depth=2
	ldr	r0, [r5]
	mov	r2, r4
	add.w	r0, r0, r8, lsl #4
	add.w	r1, r0, r6, lsl #2
	add.w	r0, r1, #480
	add.w	r1, r1, #720
	bl	__aeabi_memmove4
	ldrd	r2, r1, [sp, #16]               @ 8-byte Folded Reload
	movw	lr, #32
	ldr.w	r12, [sp, #12]                  @ 4-byte Reload
	movt	lr, #3175
	.p2align	2
.LBB80_97:                              @   in Loop: Header=BB80_81 Depth=2
	cmp.w	r10, #1
	blt	.LBB80_112
@ %bb.98:                               @   in Loop: Header=BB80_81 Depth=2
	cmp	r6, #0
	bmi	.LBB80_112
@ %bb.99:                               @   in Loop: Header=BB80_81 Depth=2
	add	r2, r1
	cmp	r2, #1
	blt	.LBB80_112
@ %bb.100:                              @   in Loop: Header=BB80_81 Depth=2
	add.w	r0, r6, r10
	cmp	r0, #60
	bgt	.LBB80_112
@ %bb.101:                              @   in Loop: Header=BB80_81 Depth=2
	cmp	r2, #20
	bgt	.LBB80_112
@ %bb.102:                              @   in Loop: Header=BB80_81 Depth=2
	rsb	r2, r2, r2, lsl #4
	ldr	r1, [r5]
	lsls	r2, r2, #4
	add.w	r2, r2, r6, lsl #2
	add	r2, r1
	ldr	r4, [sp, #32]                   @ 4-byte Reload
	ldr.w	r9, [sp, #8]                    @ 4-byte Reload
	subs	r2, #240
	.p2align	2
.LBB80_103:                             @   Parent Loop BB80_16 Depth=1
                                        @     Parent Loop BB80_81 Depth=2
                                        @ =>    This Inner Loop Header: Depth=3
	adds	r3, r6, #1
	cmp	r3, r0
	str.w	lr, [r2]
	bge	.LBB80_107
@ %bb.104:                              @   in Loop: Header=BB80_103 Depth=3
	adds	r3, r6, #2
	cmp	r3, r0
	str.w	lr, [r2, #4]
	bge	.LBB80_107
@ %bb.105:                              @   in Loop: Header=BB80_103 Depth=3
	adds	r3, r6, #3
	cmp	r3, r0
	str.w	lr, [r2, #8]
	bge	.LBB80_107
@ %bb.106:                              @   in Loop: Header=BB80_103 Depth=3
	adds	r6, #4
	str.w	lr, [r2, #12]
	cmp	r6, r0
	add.w	r2, r2, #16
	blt	.LBB80_103
.LBB80_107:                             @   in Loop: Header=BB80_81 Depth=2
	mov.w	r2, #4800
	ldr	r0, [r1, r2]
	ldr.w	r10, [r5, #24]
	ldr	r6, [sp, #24]                   @ 4-byte Reload
	ldr.w	r11, [sp, #4]                   @ 4-byte Reload
	adds	r0, #1
	str	r7, [r5, #20]
	str	r0, [r1, r2]
.LBB80_108:                             @   in Loop: Header=BB80_81 Depth=2
	ldm.w	r5, {r0, r1, r2}
	add	r1, r10
	add.w	r3, r10, #1
	cmp	r1, #59
	str	r3, [r5, #24]
	bhi.w	.LBB80_80
@ %bb.109:                              @   in Loop: Header=BB80_81 Depth=2
	add	r2, r7
	cmp	r2, #20
	bhs.w	.LBB80_80
@ %bb.110:                              @   in Loop: Header=BB80_81 Depth=2
	ldr	r3, [sp, #28]                   @ 4-byte Reload
	rsb	r2, r2, r2, lsl #4
	orr.w	r7, r6, r3
	mov	r3, r7
	cmp	r4, r12
	it	eq
	orreq	r3, r3, #1073741824
	add.w	r0, r0, r2, lsl #4
	cmp.w	r11, #0
	it	eq
	moveq	r3, r7
	str.w	r3, [r0, r1, lsl #2]
	cmp	r4, r9
	blo.w	.LBB80_81
	b	.LBB80_15
	.p2align	2
.LBB80_111:
	movw	r0, :lower16:.L.str.162
	movt	r0, :upper16:.L.str.162
	bl	credits_private_credits_fail
	.p2align	2
.LBB80_112:
	movw	r0, :lower16:.L.str.163
	movt	r0, :upper16:.L.str.163
	bl	credits_private_credits_fail
.Lfunc_end80:
	.size	credits_private_canvas60_line, .Lfunc_end80-credits_private_canvas60_line
	.cantunwind
	.fnend
                                        @ -- End function
	.p2align	1                               @ -- Begin function credits_private_scenes60_noise
	.prefalign	2, .Lfunc_end81, nop
	.type	credits_private_scenes60_noise,%function
	.code	16
	.thumb_func
credits_private_scenes60_noise:         @ @credits_private_scenes60_noise
	.fnstart
@ %bb.0:
	.save	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	push.w	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	.pad	#84
	sub	sp, #84
	cmp	r1, #0
	bmi.w	.LBB81_53
@ %bb.1:
	mov	r8, r0
	cmp	r2, #0
	mov.w	r0, #61
	it	eq
	moveq	r0, #33
	cmp	r1, r0
	bhs.w	.LBB81_53
@ %bb.2:
	movw	r3, :lower16:credits_private_math_lookup_wipe_count
	movw	r0, :lower16:credits_private_math_lookup_clear_count
	movt	r3, :upper16:credits_private_math_lookup_wipe_count
	movt	r0, :upper16:credits_private_math_lookup_clear_count
	str	r2, [sp, #12]                   @ 4-byte Spill
	cmp	r2, #0
	it	eq
	moveq	r3, r0
	str	r1, [sp, #4]                    @ 4-byte Spill
	ldrh.w	r1, [r3, r1, lsl #1]
	cmp	r1, #0
	str	r1, [sp, #8]                    @ 4-byte Spill
	beq.w	.LBB81_51
@ %bb.3:
	movw	r0, #4828
	ldr	r1, [sp, #4]                    @ 4-byte Reload
	add.w	r4, r8, r0
	movs	r0, #160
	sub.w	r0, r0, r1, lsl #2
	bic.w	r0, r0, r0, asr #31
	add.w	r6, r0, #70
	clz	r0, r6
	rsb.w	r12, r0, #32
	add.w	r0, r8, #24
	str	r0, [sp, #32]                   @ 4-byte Spill
	movw	r0, #4856
	add.w	r7, r8, r0
	movw	r0, #4852
	addw	r1, r4, #2516
	add.w	r11, r8, r0
	movw	r0, #4848
	add.w	r5, r4, #12
	str	r1, [sp, #28]                   @ 4-byte Spill
	addw	r10, r8, #2492
	add.w	lr, r8, r0
	movs	r1, #0
	str	r5, [sp, #80]                   @ 4-byte Spill
	strd	r6, r4, [sp, #44]               @ 8-byte Folded Spill
	strd	r7, r8, [sp, #72]               @ 8-byte Folded Spill
	strd	r10, r12, [sp, #36]             @ 8-byte Folded Spill
	strd	r11, lr, [sp, #64]              @ 8-byte Folded Spill
	b	.LBB81_5
	.p2align	2
.LBB81_4:                               @   in Loop: Header=BB81_5 Depth=1
	ldr	r1, [sp, #24]                   @ 4-byte Reload
	ldr	r0, [sp, #8]                    @ 4-byte Reload
	adds	r1, #1
	ldr	r5, [sp, #80]                   @ 4-byte Reload
	ldrd	r12, r6, [sp, #40]              @ 8-byte Folded Reload
	cmp	r1, r0
	beq.w	.LBB81_51
.LBB81_5:                               @ =>This Loop Header: Depth=1
                                        @     Child Loop BB81_7 Depth 2
                                        @       Child Loop BB81_9 Depth 3
                                        @     Child Loop BB81_13 Depth 2
                                        @       Child Loop BB81_15 Depth 3
                                        @     Child Loop BB81_19 Depth 2
                                        @       Child Loop BB81_21 Depth 3
                                        @     Child Loop BB81_29 Depth 2
                                        @     Child Loop BB81_24 Depth 2
                                        @       Child Loop BB81_26 Depth 3
                                        @     Child Loop BB81_33 Depth 2
                                        @       Child Loop BB81_35 Depth 3
                                        @     Child Loop BB81_42 Depth 2
	ldr	r0, [sp, #28]                   @ 4-byte Reload
	ldr.w	r2, [r4, #2508]
	ldrd	r3, r0, [r0]
	str	r1, [sp, #24]                   @ 4-byte Spill
	str	r0, [sp, #56]                   @ 4-byte Spill
	b	.LBB81_7
	.p2align	2
.LBB81_6:                               @   in Loop: Header=BB81_7 Depth=2
	mov	r0, r2
	adds	r2, #1
	str.w	r2, [r4, #2508]
	ldr.w	r0, [r5, r0, lsl #2]
	movw	r1, #22144
	eor.w	r0, r0, r0, lsr #11
	movt	r1, #40236
	and.w	r1, r1, r0, lsl #7
	eors	r0, r1
	and	r1, r0, #121856
	eor.w	r1, r0, r1, lsl #15
	ldr	r0, [sp, #56]                   @ 4-byte Reload
	adds	r3, #1
	adc	r0, r0, #0
	str	r0, [sp, #56]                   @ 4-byte Spill
	lsrs	r0, r1, #29
	cmp	r0, #4
	bls.w	.LBB81_11
.LBB81_7:                               @   Parent Loop BB81_5 Depth=1
                                        @ =>  This Loop Header: Depth=2
                                        @       Child Loop BB81_9 Depth 3
	cmp.w	r2, #624
	blt	.LBB81_6
@ %bb.8:                                @   in Loop: Header=BB81_7 Depth=2
	ldr.w	r12, [r5]
	movw	r11, #65534
	movw	r8, #64628
	str	r3, [sp, #52]                   @ 4-byte Spill
	movs	r3, #0
	mov.w	lr, #0
	movt	r11, #32767
	movt	r8, #65535
	.p2align	2
.LBB81_9:                               @   Parent Loop BB81_5 Depth=1
                                        @     Parent Loop BB81_7 Depth=2
                                        @ =>    This Inner Loop Header: Depth=3
	add.w	r2, r10, lr
	add.w	r1, r10, r3, lsl #2
	mov	r7, r8
	str	r2, [sp, #60]                   @ 4-byte Spill
	ldr.w	r5, [r1, #2352]
	cmp	r3, #227
	it	lo
	movwlo	r7, #1588
	ldr	r0, [sp, #80]                   @ 4-byte Reload
	and	r6, r12, #-2147483648
	add	r7, r0
	and.w	r4, r5, r11
	ldr.w	r7, [r7, r3, lsl #2]
	add	r6, r4
	eor.w	r7, r7, r6, lsr #1
	movw	r9, #45279
	lsls	r6, r5, #31
	movt	r9, #39176
	it	ne
	eorne.w	r7, r7, r9
	str.w	r7, [r2, #2348]
	ldr	r2, [sp, #68]                   @ 4-byte Reload
	mov	r0, r8
	ldr.w	r6, [r2, r3, lsl #2]
	cmp	r3, #226
	it	lo
	movwlo	r0, #1588
	add	r0, r10
	add.w	r0, r0, r3, lsl #2
	and	r7, r5, #-2147483648
	and.w	r4, r6, r11
	ldr.w	r0, [r0, #2352]
	add	r7, r4
	eor.w	r0, r0, r7, lsr #1
	lsls	r7, r6, #31
	it	ne
	eorne.w	r0, r0, r9
	ldr.w	r12, [sp, #64]                  @ 4-byte Reload
	str.w	r0, [r1, #2352]
	and	r0, r6, #-2147483648
	ldr.w	r6, [r12, r3, lsl #2]
	mov	r4, r8
	add.w	r5, r2, r3, lsl #2
	cmp	r3, #225
	it	lo
	movwlo	r4, #1588
	ldr	r5, [r5, r4]
	and.w	r4, r6, r11
	add	r0, r4
	eor.w	r0, r5, r0, lsr #1
	lsls	r5, r6, #31
	it	ne
	eorne.w	r0, r0, r9
	str.w	r0, [r2, r3, lsl #2]
	ldr	r2, [sp, #72]                   @ 4-byte Reload
	mov	r4, r8
	ldr.w	r5, [r2, r3, lsl #2]
	add.w	r7, r12, r3, lsl #2
	cmp	r3, #224
	it	lo
	movwlo	r4, #1588
	and	r0, r6, #-2147483648
	ldr	r7, [r7, r4]
	and.w	r4, r5, r11
	add	r0, r4
	eor.w	r0, r7, r0, lsr #1
	lsls	r7, r5, #31
	it	ne
	eorne.w	r0, r0, r9
	str.w	r0, [r12, r3, lsl #2]
	ldr.w	r0, [r1, #2368]
	add.w	r6, r2, r3, lsl #2
	mov	r4, r8
	and	r7, r5, #-2147483648
	and.w	r5, r0, r11
	cmp	r3, #223
	it	lo
	movwlo	r4, #1588
	ldr	r6, [r6, r4]
	add	r7, r5
	eor.w	r7, r6, r7, lsr #1
	lsls	r6, r0, #31
	it	ne
	eorne.w	r7, r7, r9
	str.w	r7, [r2, r3, lsl #2]
	ldr	r2, [sp, #76]                   @ 4-byte Reload
	mov	r4, r8
	add.w	r6, r2, r3, lsl #2
	mov.w	r2, #4864
	ldr	r7, [r6, r2]
	cmp	r3, #222
	it	lo
	movwlo	r4, #1588
	add	r4, r10
	add.w	r4, r4, r3, lsl #2
	and	r0, r0, #-2147483648
	and.w	r5, r7, r11
	ldr.w	r4, [r4, #2368]
	add	r0, r5
	eor.w	r0, r4, r0, lsr #1
	lsls	r5, r7, #31
	it	ne
	eorne.w	r0, r0, r9
	str.w	r0, [r1, #2368]
	and	r1, r7, #-2147483648
	ldr	r7, [sp, #60]                   @ 4-byte Reload
	add.w	r0, r6, #4864
	ldr.w	r12, [r7, #2376]
	mov	r7, r8
	cmp	r3, #221
	it	lo
	movwlo	r7, #1588
	ldr	r0, [r0, r7]
	and.w	r7, r12, r11
	add	r1, r7
	eor.w	r0, r0, r1, lsr #1
	lsls.w	r1, r12, #31
	it	ne
	eorne.w	r0, r0, r9
	str	r0, [r6, r2]
	adds	r3, #7
	movw	r0, #623
	cmp	r3, r0
	add.w	lr, lr, #28
	bne.w	.LBB81_9
@ %bb.10:                               @   in Loop: Header=BB81_7 Depth=2
	ldr	r4, [sp, #48]                   @ 4-byte Reload
	ldr.w	r0, [r4, #2504]
	ldr	r1, [r4, #12]
	and	r0, r0, #-2147483648
	and.w	r2, r1, r11
	ldr.w	r3, [r4, #1596]
	add	r0, r2
	lsls	r1, r1, #31
	eor.w	r0, r3, r0, lsr #1
	movw	r1, #45279
	movt	r1, #39176
	it	ne
	eorne	r0, r1
	ldr	r5, [sp, #80]                   @ 4-byte Reload
	ldrd	r12, r6, [sp, #40]              @ 8-byte Folded Reload
	ldr	r3, [sp, #52]                   @ 4-byte Reload
	movs	r2, #0
	str.w	r0, [r4, #2504]
	b	.LBB81_6
	.p2align	2
.LBB81_11:                              @   in Loop: Header=BB81_5 Depth=1
	str	r1, [sp, #20]                   @ 4-byte Spill
	b	.LBB81_13
	.p2align	2
.LBB81_12:                              @   in Loop: Header=BB81_13 Depth=2
	mov	r0, r2
	adds	r2, #1
	str.w	r2, [r4, #2508]
	ldr.w	r0, [r5, r0, lsl #2]
	movw	r1, #22144
	eor.w	r0, r0, r0, lsr #11
	movt	r1, #40236
	and.w	r1, r1, r0, lsl #7
	eors	r0, r1
	and	r1, r0, #118784
	eor.w	r1, r0, r1, lsl #15
	ldr	r0, [sp, #56]                   @ 4-byte Reload
	adds	r3, #1
	adc	r0, r0, #0
	str	r0, [sp, #56]                   @ 4-byte Spill
	lsrs	r0, r1, #30
	cmp	r0, #2
	bls.w	.LBB81_17
.LBB81_13:                              @   Parent Loop BB81_5 Depth=1
                                        @ =>  This Loop Header: Depth=2
                                        @       Child Loop BB81_15 Depth 3
	cmp.w	r2, #624
	blt	.LBB81_12
@ %bb.14:                               @   in Loop: Header=BB81_13 Depth=2
	ldr	r6, [r5]
	movw	r9, #64628
	mov	r11, r10
	movw	r10, #65534
	str	r3, [sp, #52]                   @ 4-byte Spill
	movs	r3, #0
	mov.w	r12, #0
	movt	r9, #65535
	movt	r10, #32767
	.p2align	2
.LBB81_15:                              @   Parent Loop BB81_5 Depth=1
                                        @     Parent Loop BB81_13 Depth=2
                                        @ =>    This Inner Loop Header: Depth=3
	add.w	r2, r11, r12
	add.w	r1, r11, r3, lsl #2
	mov	r4, r9
	str	r2, [sp, #60]                   @ 4-byte Spill
	ldr.w	r7, [r1, #2352]
	cmp	r3, #227
	it	lo
	movwlo	r4, #1588
	ldr	r0, [sp, #80]                   @ 4-byte Reload
	and	r6, r6, #-2147483648
	add	r4, r0
	and.w	r5, r7, r10
	ldr.w	r4, [r4, r3, lsl #2]
	add	r6, r5
	eor.w	r6, r4, r6, lsr #1
	movw	lr, #45279
	lsls	r5, r7, #31
	movt	lr, #39176
	it	ne
	eorne.w	r6, r6, lr
	str.w	r6, [r2, #2348]
	ldr	r2, [sp, #68]                   @ 4-byte Reload
	mov	r0, r9
	ldr.w	r6, [r2, r3, lsl #2]
	cmp	r3, #226
	it	lo
	movwlo	r0, #1588
	add	r0, r11
	add.w	r0, r0, r3, lsl #2
	and	r7, r7, #-2147483648
	and.w	r4, r6, r10
	ldr.w	r0, [r0, #2352]
	add	r7, r4
	eor.w	r0, r0, r7, lsr #1
	lsls	r7, r6, #31
	it	ne
	eorne.w	r0, r0, lr
	ldr.w	r8, [sp, #64]                   @ 4-byte Reload
	str.w	r0, [r1, #2352]
	and	r0, r6, #-2147483648
	ldr.w	r6, [r8, r3, lsl #2]
	mov	r4, r9
	add.w	r5, r2, r3, lsl #2
	cmp	r3, #225
	it	lo
	movwlo	r4, #1588
	ldr	r5, [r5, r4]
	and.w	r4, r6, r10
	add	r0, r4
	eor.w	r0, r5, r0, lsr #1
	lsls	r5, r6, #31
	it	ne
	eorne.w	r0, r0, lr
	str.w	r0, [r2, r3, lsl #2]
	ldr	r2, [sp, #72]                   @ 4-byte Reload
	mov	r4, r9
	ldr.w	r5, [r2, r3, lsl #2]
	add.w	r7, r8, r3, lsl #2
	cmp	r3, #224
	it	lo
	movwlo	r4, #1588
	and	r0, r6, #-2147483648
	ldr	r7, [r7, r4]
	and.w	r4, r5, r10
	add	r0, r4
	eor.w	r0, r7, r0, lsr #1
	lsls	r7, r5, #31
	it	ne
	eorne.w	r0, r0, lr
	str.w	r0, [r8, r3, lsl #2]
	ldr.w	r0, [r1, #2368]
	add.w	r6, r2, r3, lsl #2
	mov	r4, r9
	and	r7, r5, #-2147483648
	and.w	r5, r0, r10
	cmp	r3, #223
	it	lo
	movwlo	r4, #1588
	ldr	r6, [r6, r4]
	add	r7, r5
	eor.w	r7, r6, r7, lsr #1
	lsls	r6, r0, #31
	it	ne
	eorne.w	r7, r7, lr
	ldr	r4, [sp, #76]                   @ 4-byte Reload
	mov.w	r8, #4864
	add.w	r5, r4, r3, lsl #2
	mov	r4, r9
	str.w	r7, [r2, r3, lsl #2]
	ldr.w	r7, [r5, r8]
	cmp	r3, #222
	it	lo
	movwlo	r4, #1588
	add	r4, r11
	add.w	r4, r4, r3, lsl #2
	and	r0, r0, #-2147483648
	and.w	r6, r7, r10
	ldr.w	r4, [r4, #2368]
	add	r0, r6
	eor.w	r0, r4, r0, lsr #1
	lsls	r6, r7, #31
	it	ne
	eorne.w	r0, r0, lr
	ldr	r2, [sp, #60]                   @ 4-byte Reload
	str.w	r0, [r1, #2368]
	and	r1, r7, #-2147483648
	ldr.w	r6, [r2, #2376]
	mov	r7, r9
	add.w	r0, r5, #4864
	cmp	r3, #221
	it	lo
	movwlo	r7, #1588
	ldr	r0, [r0, r7]
	and.w	r7, r6, r10
	add	r1, r7
	eor.w	r0, r0, r1, lsr #1
	lsls	r1, r6, #31
	it	ne
	eorne.w	r0, r0, lr
	str.w	r0, [r5, r8]
	adds	r3, #7
	movw	r0, #623
	cmp	r3, r0
	add.w	r12, r12, #28
	bne.w	.LBB81_15
@ %bb.16:                               @   in Loop: Header=BB81_13 Depth=2
	ldr	r4, [sp, #48]                   @ 4-byte Reload
	ldr.w	r0, [r4, #2504]
	ldr	r1, [r4, #12]
	and	r0, r0, #-2147483648
	and.w	r2, r1, r10
	ldr.w	r3, [r4, #1596]
	add	r0, r2
	lsls	r1, r1, #31
	eor.w	r0, r3, r0, lsr #1
	movw	r1, #45279
	movt	r1, #39176
	it	ne
	eorne	r0, r1
	ldr	r5, [sp, #80]                   @ 4-byte Reload
	ldrd	r12, r6, [sp, #40]              @ 8-byte Folded Reload
	ldr	r3, [sp, #52]                   @ 4-byte Reload
	movs	r2, #0
	mov	r10, r11
	str.w	r0, [r4, #2504]
	b	.LBB81_12
	.p2align	2
.LBB81_17:                              @   in Loop: Header=BB81_5 Depth=1
	ldr	r0, [sp, #12]                   @ 4-byte Reload
	str	r1, [sp, #16]                   @ 4-byte Spill
	cbnz	r0, .LBB81_19
	b	.LBB81_24
	.p2align	2
.LBB81_18:                              @   in Loop: Header=BB81_19 Depth=2
	adds	r1, r2, #1
	str.w	r1, [r4, #2508]
	ldr.w	r0, [r5, r2, lsl #2]
	mov.w	r3, #-2147483648
	eor.w	r2, r0, r0, lsr #11
	and.w	r3, r3, r0, lsl #7
	eor.w	r2, r3, r2, lsl #15
	ldr	r3, [sp, #52]                   @ 4-byte Reload
	eors	r0, r2
	ldr	r2, [sp, #56]                   @ 4-byte Reload
	adds	r3, #1
	adc	r2, r2, #0
	lsrs	r0, r0, #30
	str	r2, [sp, #56]                   @ 4-byte Spill
	cmp	r0, #3
	mov	r2, r1
	bne.w	.LBB81_28
.LBB81_19:                              @   Parent Loop BB81_5 Depth=1
                                        @ =>  This Loop Header: Depth=2
                                        @       Child Loop BB81_21 Depth 3
	cmp.w	r2, #624
	str	r3, [sp, #52]                   @ 4-byte Spill
	blt	.LBB81_18
@ %bb.20:                               @   in Loop: Header=BB81_19 Depth=2
	ldr	r6, [r5]
	movw	r9, #64628
	mov	r11, r10
	movw	r10, #65534
	movs	r3, #0
	mov.w	r12, #0
	movt	r9, #65535
	movt	r10, #32767
	.p2align	2
.LBB81_21:                              @   Parent Loop BB81_5 Depth=1
                                        @     Parent Loop BB81_19 Depth=2
                                        @ =>    This Inner Loop Header: Depth=3
	add.w	r2, r11, r12
	add.w	r1, r11, r3, lsl #2
	mov	r4, r9
	str	r2, [sp, #60]                   @ 4-byte Spill
	ldr.w	r7, [r1, #2352]
	cmp	r3, #227
	it	lo
	movwlo	r4, #1588
	ldr	r0, [sp, #80]                   @ 4-byte Reload
	and	r6, r6, #-2147483648
	add	r4, r0
	and.w	r5, r7, r10
	ldr.w	r4, [r4, r3, lsl #2]
	add	r6, r5
	eor.w	r6, r4, r6, lsr #1
	movw	lr, #45279
	lsls	r5, r7, #31
	movt	lr, #39176
	it	ne
	eorne.w	r6, r6, lr
	str.w	r6, [r2, #2348]
	ldr	r2, [sp, #68]                   @ 4-byte Reload
	mov	r0, r9
	ldr.w	r6, [r2, r3, lsl #2]
	cmp	r3, #226
	it	lo
	movwlo	r0, #1588
	add	r0, r11
	add.w	r0, r0, r3, lsl #2
	and	r7, r7, #-2147483648
	and.w	r4, r6, r10
	ldr.w	r0, [r0, #2352]
	add	r7, r4
	eor.w	r0, r0, r7, lsr #1
	lsls	r7, r6, #31
	it	ne
	eorne.w	r0, r0, lr
	ldr.w	r8, [sp, #64]                   @ 4-byte Reload
	str.w	r0, [r1, #2352]
	and	r0, r6, #-2147483648
	ldr.w	r6, [r8, r3, lsl #2]
	mov	r4, r9
	add.w	r5, r2, r3, lsl #2
	cmp	r3, #225
	it	lo
	movwlo	r4, #1588
	ldr	r5, [r5, r4]
	and.w	r4, r6, r10
	add	r0, r4
	eor.w	r0, r5, r0, lsr #1
	lsls	r5, r6, #31
	it	ne
	eorne.w	r0, r0, lr
	str.w	r0, [r2, r3, lsl #2]
	ldr	r2, [sp, #72]                   @ 4-byte Reload
	mov	r4, r9
	ldr.w	r5, [r2, r3, lsl #2]
	add.w	r7, r8, r3, lsl #2
	cmp	r3, #224
	it	lo
	movwlo	r4, #1588
	and	r0, r6, #-2147483648
	ldr	r7, [r7, r4]
	and.w	r4, r5, r10
	add	r0, r4
	eor.w	r0, r7, r0, lsr #1
	lsls	r7, r5, #31
	it	ne
	eorne.w	r0, r0, lr
	str.w	r0, [r8, r3, lsl #2]
	ldr.w	r0, [r1, #2368]
	add.w	r6, r2, r3, lsl #2
	mov	r4, r9
	and	r7, r5, #-2147483648
	and.w	r5, r0, r10
	cmp	r3, #223
	it	lo
	movwlo	r4, #1588
	ldr	r6, [r6, r4]
	add	r7, r5
	eor.w	r7, r6, r7, lsr #1
	lsls	r6, r0, #31
	it	ne
	eorne.w	r7, r7, lr
	ldr	r4, [sp, #76]                   @ 4-byte Reload
	mov.w	r8, #4864
	add.w	r5, r4, r3, lsl #2
	mov	r4, r9
	str.w	r7, [r2, r3, lsl #2]
	ldr.w	r7, [r5, r8]
	cmp	r3, #222
	it	lo
	movwlo	r4, #1588
	add	r4, r11
	add.w	r4, r4, r3, lsl #2
	and	r0, r0, #-2147483648
	and.w	r6, r7, r10
	ldr.w	r4, [r4, #2368]
	add	r0, r6
	eor.w	r0, r4, r0, lsr #1
	lsls	r6, r7, #31
	it	ne
	eorne.w	r0, r0, lr
	ldr	r2, [sp, #60]                   @ 4-byte Reload
	str.w	r0, [r1, #2368]
	and	r1, r7, #-2147483648
	ldr.w	r6, [r2, #2376]
	mov	r7, r9
	add.w	r0, r5, #4864
	cmp	r3, #221
	it	lo
	movwlo	r7, #1588
	ldr	r0, [r0, r7]
	and.w	r7, r6, r10
	add	r1, r7
	eor.w	r0, r0, r1, lsr #1
	lsls	r1, r6, #31
	it	ne
	eorne.w	r0, r0, lr
	str.w	r0, [r5, r8]
	adds	r3, #7
	movw	r0, #623
	cmp	r3, r0
	add.w	r12, r12, #28
	bne.w	.LBB81_21
@ %bb.22:                               @   in Loop: Header=BB81_19 Depth=2
	ldr	r4, [sp, #48]                   @ 4-byte Reload
	ldr.w	r0, [r4, #2504]
	ldr	r1, [r4, #12]
	and	r0, r0, #-2147483648
	and.w	r2, r1, r10
	ldr.w	r3, [r4, #1596]
	add	r0, r2
	lsls	r1, r1, #31
	eor.w	r0, r3, r0, lsr #1
	movw	r1, #45279
	movt	r1, #39176
	it	ne
	eorne	r0, r1
	ldr	r5, [sp, #80]                   @ 4-byte Reload
	ldrd	r12, r6, [sp, #40]              @ 8-byte Folded Reload
	movs	r2, #0
	mov	r10, r11
	str.w	r0, [r4, #2504]
	b	.LBB81_18
	.p2align	2
.LBB81_23:                              @   in Loop: Header=BB81_24 Depth=2
	mov	r0, r2
	adds	r2, #1
	str.w	r2, [r4, #2508]
	ldr.w	r0, [r5, r0, lsl #2]
	eor.w	r1, r0, r0, lsr #11
	lsls	r3, r0, #7
	eor.w	r1, r3, r1, lsl #15
	ldr	r3, [sp, #52]                   @ 4-byte Reload
	eors	r0, r1
	ldr	r1, [sp, #56]                   @ 4-byte Reload
	adds	r3, #1
	adc	r1, r1, #0
	cmp	r0, #0
	str	r1, [sp, #56]                   @ 4-byte Spill
	bpl.w	.LBB81_31
.LBB81_24:                              @   Parent Loop BB81_5 Depth=1
                                        @ =>  This Loop Header: Depth=2
                                        @       Child Loop BB81_26 Depth 3
	cmp.w	r2, #624
	str	r3, [sp, #52]                   @ 4-byte Spill
	blt	.LBB81_23
@ %bb.25:                               @   in Loop: Header=BB81_24 Depth=2
	ldr	r6, [r5]
	movw	r9, #64628
	mov	r11, r10
	movw	r10, #65534
	movs	r3, #0
	mov.w	r12, #0
	movt	r9, #65535
	movt	r10, #32767
	.p2align	2
.LBB81_26:                              @   Parent Loop BB81_5 Depth=1
                                        @     Parent Loop BB81_24 Depth=2
                                        @ =>    This Inner Loop Header: Depth=3
	add.w	r2, r11, r12
	add.w	r1, r11, r3, lsl #2
	mov	r4, r9
	str	r2, [sp, #60]                   @ 4-byte Spill
	ldr.w	r7, [r1, #2352]
	cmp	r3, #227
	it	lo
	movwlo	r4, #1588
	ldr	r0, [sp, #80]                   @ 4-byte Reload
	and	r6, r6, #-2147483648
	add	r4, r0
	and.w	r5, r7, r10
	ldr.w	r4, [r4, r3, lsl #2]
	add	r6, r5
	eor.w	r6, r4, r6, lsr #1
	movw	lr, #45279
	lsls	r5, r7, #31
	movt	lr, #39176
	it	ne
	eorne.w	r6, r6, lr
	str.w	r6, [r2, #2348]
	ldr	r2, [sp, #68]                   @ 4-byte Reload
	mov	r0, r9
	ldr.w	r6, [r2, r3, lsl #2]
	cmp	r3, #226
	it	lo
	movwlo	r0, #1588
	add	r0, r11
	add.w	r0, r0, r3, lsl #2
	and	r7, r7, #-2147483648
	and.w	r4, r6, r10
	ldr.w	r0, [r0, #2352]
	add	r7, r4
	eor.w	r0, r0, r7, lsr #1
	lsls	r7, r6, #31
	it	ne
	eorne.w	r0, r0, lr
	ldr.w	r8, [sp, #64]                   @ 4-byte Reload
	str.w	r0, [r1, #2352]
	and	r0, r6, #-2147483648
	ldr.w	r6, [r8, r3, lsl #2]
	mov	r4, r9
	add.w	r5, r2, r3, lsl #2
	cmp	r3, #225
	it	lo
	movwlo	r4, #1588
	ldr	r5, [r5, r4]
	and.w	r4, r6, r10
	add	r0, r4
	eor.w	r0, r5, r0, lsr #1
	lsls	r5, r6, #31
	it	ne
	eorne.w	r0, r0, lr
	str.w	r0, [r2, r3, lsl #2]
	ldr	r2, [sp, #72]                   @ 4-byte Reload
	mov	r4, r9
	ldr.w	r5, [r2, r3, lsl #2]
	add.w	r7, r8, r3, lsl #2
	cmp	r3, #224
	it	lo
	movwlo	r4, #1588
	and	r0, r6, #-2147483648
	ldr	r7, [r7, r4]
	and.w	r4, r5, r10
	add	r0, r4
	eor.w	r0, r7, r0, lsr #1
	lsls	r7, r5, #31
	it	ne
	eorne.w	r0, r0, lr
	str.w	r0, [r8, r3, lsl #2]
	ldr.w	r0, [r1, #2368]
	add.w	r6, r2, r3, lsl #2
	mov	r4, r9
	and	r7, r5, #-2147483648
	and.w	r5, r0, r10
	cmp	r3, #223
	it	lo
	movwlo	r4, #1588
	ldr	r6, [r6, r4]
	add	r7, r5
	eor.w	r7, r6, r7, lsr #1
	lsls	r6, r0, #31
	it	ne
	eorne.w	r7, r7, lr
	ldr	r4, [sp, #76]                   @ 4-byte Reload
	mov.w	r8, #4864
	add.w	r5, r4, r3, lsl #2
	mov	r4, r9
	str.w	r7, [r2, r3, lsl #2]
	ldr.w	r7, [r5, r8]
	cmp	r3, #222
	it	lo
	movwlo	r4, #1588
	add	r4, r11
	add.w	r4, r4, r3, lsl #2
	and	r0, r0, #-2147483648
	and.w	r6, r7, r10
	ldr.w	r4, [r4, #2368]
	add	r0, r6
	eor.w	r0, r4, r0, lsr #1
	lsls	r6, r7, #31
	it	ne
	eorne.w	r0, r0, lr
	ldr	r2, [sp, #60]                   @ 4-byte Reload
	str.w	r0, [r1, #2368]
	and	r1, r7, #-2147483648
	ldr.w	r6, [r2, #2376]
	mov	r7, r9
	add.w	r0, r5, #4864
	cmp	r3, #221
	it	lo
	movwlo	r7, #1588
	ldr	r0, [r0, r7]
	and.w	r7, r6, r10
	add	r1, r7
	eor.w	r0, r0, r1, lsr #1
	lsls	r1, r6, #31
	it	ne
	eorne.w	r0, r0, lr
	str.w	r0, [r5, r8]
	adds	r3, #7
	movw	r0, #623
	cmp	r3, r0
	add.w	r12, r12, #28
	bne.w	.LBB81_26
@ %bb.27:                               @   in Loop: Header=BB81_24 Depth=2
	ldr	r4, [sp, #48]                   @ 4-byte Reload
	ldr.w	r0, [r4, #2504]
	ldr	r1, [r4, #12]
	and	r0, r0, #-2147483648
	and.w	r2, r1, r10
	ldr.w	r3, [r4, #1596]
	add	r0, r2
	lsls	r1, r1, #31
	eor.w	r0, r3, r0, lsr #1
	movw	r1, #45279
	movt	r1, #39176
	it	ne
	eorne	r0, r1
	ldr	r5, [sp, #80]                   @ 4-byte Reload
	movs	r2, #0
	mov	r10, r11
	str.w	r0, [r4, #2504]
	b	.LBB81_23
	.p2align	2
.LBB81_28:                              @   in Loop: Header=BB81_5 Depth=1
	movw	r1, :lower16:credits_private_scenes60_noise.chars
	movt	r1, :upper16:credits_private_scenes60_noise.chars
	ldr.w	r9, [r1, r0, lsl #2]
	ldr	r0, [sp, #28]                   @ 4-byte Reload
	ldr	r1, [sp, #56]                   @ 4-byte Reload
	mov	r7, r12
	strd	r3, r1, [r0]
	.p2align	2
.LBB81_29:                              @   Parent Loop BB81_5 Depth=1
                                        @ =>  This Inner Loop Header: Depth=2
	mov	r0, r5
	mov	r1, r7
	bl	credits_private_random_bits
	subs	r2, r0, r6
	sbcs	r2, r1, #0
	bhs	.LBB81_29
@ %bb.30:                               @   in Loop: Header=BB81_5 Depth=1
	subs.w	r2, r0, #70
	sbcs	r2, r1, #0
	mov	r2, r0
	movw	r0, :lower16:.L.str.42
	movw	r3, :lower16:.L.str.166
	movt	r0, :upper16:.L.str.42
	movt	r3, :upper16:.L.str.166
	it	lo
	movlo	r0, r3
	ldr	r3, [sp, #4]                    @ 4-byte Reload
	subs	r2, r2, r3
	sbcs	r1, r1, #0
	movw	r1, :lower16:.L.str.44
	movt	r1, :upper16:.L.str.44
	it	lo
	movlo	r0, r1
	bl	credits_private_canvas60_style
	ldrb.w	r5, [r9]
	cmp	r5, #0
	bne.w	.LBB81_38
	b.w	.LBB81_4
	.p2align	2
.LBB81_31:                              @   in Loop: Header=BB81_5 Depth=1
	movw	lr, #45279
	movw	r10, #65534
	ldr	r6, [sp, #56]                   @ 4-byte Reload
	movw	r9, #64628
	movt	lr, #39176
	movt	r10, #32767
	movt	r9, #65535
	b	.LBB81_33
	.p2align	2
.LBB81_32:                              @   in Loop: Header=BB81_33 Depth=2
	adds	r0, r2, #1
	str.w	r0, [r4, #2508]
	ldr.w	r1, [r5, r2, lsl #2]
	eor.w	r2, r1, r1, lsr #11
	lsls	r3, r1, #7
	eor.w	r2, r3, r2, lsl #15
	ldr	r3, [sp, #52]                   @ 4-byte Reload
	eors	r1, r2
	adds	r3, #1
	adc	r6, r6, #0
	cmp.w	r1, #-1
	mov	r2, r0
	bgt.w	.LBB81_37
.LBB81_33:                              @   Parent Loop BB81_5 Depth=1
                                        @ =>  This Loop Header: Depth=2
                                        @       Child Loop BB81_35 Depth 3
	cmp.w	r2, #624
	str	r3, [sp, #52]                   @ 4-byte Spill
	blt	.LBB81_32
@ %bb.34:                               @   in Loop: Header=BB81_33 Depth=2
	str	r6, [sp, #56]                   @ 4-byte Spill
	ldr	r6, [r5]
	ldr.w	r8, [sp, #36]                   @ 4-byte Reload
	movs	r3, #0
	mov.w	r12, #0
	.p2align	2
.LBB81_35:                              @   Parent Loop BB81_5 Depth=1
                                        @     Parent Loop BB81_33 Depth=2
                                        @ =>    This Inner Loop Header: Depth=3
	add.w	r2, r8, r12
	add.w	r1, r8, r3, lsl #2
	mov	r4, r9
	str	r2, [sp, #60]                   @ 4-byte Spill
	ldr.w	r7, [r1, #2352]
	cmp	r3, #227
	it	lo
	movwlo	r4, #1588
	ldr	r0, [sp, #80]                   @ 4-byte Reload
	and	r6, r6, #-2147483648
	add	r4, r0
	and.w	r5, r7, r10
	ldr.w	r4, [r4, r3, lsl #2]
	add	r6, r5
	eor.w	r6, r4, r6, lsr #1
	lsls	r5, r7, #31
	it	ne
	eorne.w	r6, r6, lr
	str.w	r6, [r2, #2348]
	ldr	r2, [sp, #68]                   @ 4-byte Reload
	mov	r0, r9
	ldr.w	r6, [r2, r3, lsl #2]
	cmp	r3, #226
	it	lo
	movwlo	r0, #1588
	add	r0, r8
	add.w	r0, r0, r3, lsl #2
	and	r7, r7, #-2147483648
	and.w	r4, r6, r10
	ldr.w	r0, [r0, #2352]
	add	r7, r4
	eor.w	r0, r0, r7, lsr #1
	lsls	r7, r6, #31
	it	ne
	eorne.w	r0, r0, lr
	ldr.w	r11, [sp, #64]                  @ 4-byte Reload
	str.w	r0, [r1, #2352]
	and	r0, r6, #-2147483648
	ldr.w	r6, [r11, r3, lsl #2]
	mov	r4, r9
	add.w	r5, r2, r3, lsl #2
	cmp	r3, #225
	it	lo
	movwlo	r4, #1588
	ldr	r5, [r5, r4]
	and.w	r4, r6, r10
	add	r0, r4
	eor.w	r0, r5, r0, lsr #1
	lsls	r5, r6, #31
	it	ne
	eorne.w	r0, r0, lr
	str.w	r0, [r2, r3, lsl #2]
	ldr	r2, [sp, #72]                   @ 4-byte Reload
	mov	r4, r9
	ldr.w	r5, [r2, r3, lsl #2]
	add.w	r7, r11, r3, lsl #2
	cmp	r3, #224
	it	lo
	movwlo	r4, #1588
	and	r0, r6, #-2147483648
	ldr	r7, [r7, r4]
	and.w	r4, r5, r10
	add	r0, r4
	eor.w	r0, r7, r0, lsr #1
	lsls	r7, r5, #31
	it	ne
	eorne.w	r0, r0, lr
	str.w	r0, [r11, r3, lsl #2]
	ldr.w	r0, [r1, #2368]
	add.w	r6, r2, r3, lsl #2
	mov	r4, r9
	and	r7, r5, #-2147483648
	and.w	r5, r0, r10
	cmp	r3, #223
	it	lo
	movwlo	r4, #1588
	ldr	r6, [r6, r4]
	add	r7, r5
	eor.w	r7, r6, r7, lsr #1
	lsls	r6, r0, #31
	it	ne
	eorne.w	r7, r7, lr
	str.w	r7, [r2, r3, lsl #2]
	ldr	r2, [sp, #76]                   @ 4-byte Reload
	mov.w	r11, #4864
	add.w	r5, r2, r3, lsl #2
	mov	r4, r9
	ldr.w	r7, [r5, r11]
	cmp	r3, #222
	it	lo
	movwlo	r4, #1588
	add	r4, r8
	add.w	r4, r4, r3, lsl #2
	and	r0, r0, #-2147483648
	and.w	r6, r7, r10
	ldr.w	r4, [r4, #2368]
	add	r0, r6
	eor.w	r0, r4, r0, lsr #1
	lsls	r6, r7, #31
	it	ne
	eorne.w	r0, r0, lr
	ldr	r2, [sp, #60]                   @ 4-byte Reload
	str.w	r0, [r1, #2368]
	and	r1, r7, #-2147483648
	ldr.w	r6, [r2, #2376]
	mov	r7, r9
	add.w	r0, r5, #4864
	cmp	r3, #221
	it	lo
	movwlo	r7, #1588
	ldr	r0, [r0, r7]
	and.w	r7, r6, r10
	add	r1, r7
	eor.w	r0, r0, r1, lsr #1
	lsls	r1, r6, #31
	it	ne
	eorne.w	r0, r0, lr
	str.w	r0, [r5, r11]
	adds	r3, #7
	movw	r0, #623
	cmp	r3, r0
	add.w	r12, r12, #28
	bne.w	.LBB81_35
@ %bb.36:                               @   in Loop: Header=BB81_33 Depth=2
	ldr	r4, [sp, #48]                   @ 4-byte Reload
	ldr.w	r0, [r4, #2504]
	ldr	r1, [r4, #12]
	and	r0, r0, #-2147483648
	and.w	r2, r1, r10
	ldr.w	r3, [r4, #1596]
	add	r0, r2
	eor.w	r0, r3, r0, lsr #1
	lsls	r1, r1, #31
	it	ne
	eorne.w	r0, r0, lr
	ldr	r5, [sp, #80]                   @ 4-byte Reload
	ldr	r6, [sp, #56]                   @ 4-byte Reload
	movs	r2, #0
	str.w	r0, [r4, #2504]
	b	.LBB81_32
	.p2align	2
.LBB81_37:                              @   in Loop: Header=BB81_5 Depth=1
	ldr	r0, [sp, #28]                   @ 4-byte Reload
	movw	r9, :lower16:.L.str.92
	strd	r3, r6, [r0]
	movw	r0, :lower16:.L.str.45
	ldr.w	r10, [sp, #36]                  @ 4-byte Reload
	movt	r9, :upper16:.L.str.92
	movt	r0, :upper16:.L.str.45
	bl	credits_private_canvas60_style
	ldrb.w	r5, [r9]
	cmp	r5, #0
	beq.w	.LBB81_4
.LBB81_38:                              @   in Loop: Header=BB81_5 Depth=1
	ldr	r1, [sp, #20]                   @ 4-byte Reload
	movs	r2, #58
	lsrs	r1, r1, #25
	muls	r1, r2, r1
	movw	r2, #37331
	movt	r2, #829
	umull	r1, r12, r1, r2
	ldr	r1, [sp, #16]                   @ 4-byte Reload
	movs	r2, #19
	lsrs	r1, r1, #27
	muls	r1, r2, r1
	movw	r2, #25645
	movt	r2, #2849
	umull	r1, r2, r1, r2
	mov	r1, r12
	b	.LBB81_42
	.p2align	2
.LBB81_39:                              @   in Loop: Header=BB81_42 Depth=2
	adds	r2, #1
.LBB81_40:                              @   in Loop: Header=BB81_42 Depth=2
	mov	r6, r12
.LBB81_41:                              @   in Loop: Header=BB81_42 Depth=2
	ldrb.w	r5, [r9]
	mov	r1, r6
	cmp	r5, #0
	beq.w	.LBB81_4
.LBB81_42:                              @   Parent Loop BB81_5 Depth=1
                                        @ =>  This Inner Loop Header: Depth=2
	sub.w	r7, r5, #194
	cmp	r7, #29
	add.w	r6, r9, #1
	bhi	.LBB81_45
@ %bb.43:                               @   in Loop: Header=BB81_42 Depth=2
	ldrsb.w	r6, [r6]
	cmn.w	r6, #65
	bgt	.LBB81_52
@ %bb.44:                               @   in Loop: Header=BB81_42 Depth=2
	and	r3, r6, #63
	bfi	r3, r5, #6, #5
	add.w	r9, r9, #2
	mov	r5, r3
	b	.LBB81_46
	.p2align	2
.LBB81_45:                              @   in Loop: Header=BB81_42 Depth=2
	sxtb	r3, r5
	cmp.w	r3, #-1
	mov	r9, r6
	ble	.LBB81_52
.LBB81_46:                              @   in Loop: Header=BB81_42 Depth=2
	cmp	r5, #13
	beq	.LBB81_40
@ %bb.47:                               @   in Loop: Header=BB81_42 Depth=2
	cmp	r5, #10
	beq	.LBB81_39
@ %bb.48:                               @   in Loop: Header=BB81_42 Depth=2
	cmp	r1, #59
	add.w	r6, r1, #1
	it	ls
	cmpls	r2, #20
	blo	.LBB81_50
@ %bb.49:                               @   in Loop: Header=BB81_42 Depth=2
	ldr	r1, [r4]
	adds	r1, #1
	str	r1, [r4]
	b	.LBB81_41
	.p2align	2
.LBB81_50:                              @   in Loop: Header=BB81_42 Depth=2
	orr.w	r3, r5, r0
	ldr	r5, [sp, #32]                   @ 4-byte Reload
	rsb	r7, r2, r2, lsl #4
	add.w	r7, r5, r7, lsl #4
	str.w	r3, [r7, r1, lsl #2]
	b	.LBB81_41
	.p2align	2
.LBB81_51:
	add	sp, #84
	pop.w	{r4, r5, r6, r7, r8, r9, r10, r11, pc}
	.p2align	2
.LBB81_52:
	movw	r0, :lower16:.L.str.162
	movt	r0, :upper16:.L.str.162
	bl	credits_private_credits_fail
	.p2align	2
.LBB81_53:
	movw	r0, :lower16:.L.str.78
	movt	r0, :upper16:.L.str.78
	bl	credits_private_credits_fail
.Lfunc_end81:
	.size	credits_private_scenes60_noise, .Lfunc_end81-credits_private_scenes60_noise
	.cantunwind
	.fnend
                                        @ -- End function
	.p2align	2                               @ -- Begin function credits_private_scenes60_ui
	.type	credits_private_scenes60_ui,%function
	.code	16
	.thumb_func
credits_private_scenes60_ui:            @ @credits_private_scenes60_ui
	.fnstart
@ %bb.0:
	.save	{r4, r5, r6, r7, r8, r9, lr}
	push.w	{r4, r5, r6, r7, r8, r9, lr}
	.pad	#4
	sub	sp, #4
	cmp	r1, #11
	bhi.w	.LBB82_109
@ %bb.1:
	mov	r4, r0
	movw	r0, #4592
	add.w	r9, r4, r0
.LCPI82_0:
	tbh	[pc, r1, lsl #1]
@ %bb.2:
.LJTI82_0:
	.short	(.LBB82_3-(.LCPI82_0+4))/2
	.short	(.LBB82_95-(.LCPI82_0+4))/2
	.short	(.LBB82_56-(.LCPI82_0+4))/2
	.short	(.LBB82_69-(.LCPI82_0+4))/2
	.short	(.LBB82_29-(.LCPI82_0+4))/2
	.short	(.LBB82_108-(.LCPI82_0+4))/2
	.short	(.LBB82_110-(.LCPI82_0+4))/2
	.short	(.LBB82_82-(.LCPI82_0+4))/2
	.short	(.LBB82_136-(.LCPI82_0+4))/2
	.short	(.LBB82_42-(.LCPI82_0+4))/2
	.short	(.LBB82_123-(.LCPI82_0+4))/2
	.short	(.LBB82_16-(.LCPI82_0+4))/2
	.p2align	1
	.p2align	2
.LBB82_3:
	movw	r0, :lower16:.L.str.48
	movt	r0, :upper16:.L.str.48
	add.w	r8, r4, #24
	bl	credits_private_canvas60_style
	movw	r7, :lower16:.L.str.171
	movt	r7, :upper16:.L.str.171
	movs	r1, #1
	movs	r3, #2
	movs	r6, #97
	b	.LBB82_7
	.p2align	2
.LBB82_4:                               @   in Loop: Header=BB82_7 Depth=1
	adds	r1, #1
.LBB82_5:                               @   in Loop: Header=BB82_7 Depth=1
	movs	r4, #2
.LBB82_6:                               @   in Loop: Header=BB82_7 Depth=1
	ldrb	r6, [r7]
	mov	r3, r4
	cmp	r6, #0
	beq.w	.LBB82_109
.LBB82_7:                               @ =>This Inner Loop Header: Depth=1
	sub.w	r2, r6, #194
	cmp	r2, #29
	add.w	r2, r7, #1
	bhi	.LBB82_10
@ %bb.8:                                @   in Loop: Header=BB82_7 Depth=1
	ldrsb.w	r2, [r2]
	cmn.w	r2, #65
	bgt.w	.LBB82_149
@ %bb.9:                                @   in Loop: Header=BB82_7 Depth=1
	and	r2, r2, #63
	bfi	r2, r6, #6, #5
	adds	r7, #2
	mov	r6, r2
	b	.LBB82_11
	.p2align	2
.LBB82_10:                              @   in Loop: Header=BB82_7 Depth=1
	sxtb	r7, r6
	cmp.w	r7, #-1
	mov	r7, r2
	ble.w	.LBB82_149
.LBB82_11:                              @   in Loop: Header=BB82_7 Depth=1
	cmp	r6, #13
	beq	.LBB82_5
@ %bb.12:                               @   in Loop: Header=BB82_7 Depth=1
	cmp	r6, #10
	beq	.LBB82_4
@ %bb.13:                               @   in Loop: Header=BB82_7 Depth=1
	cmp	r3, #59
	add.w	r4, r3, #1
	it	ls
	cmpls	r1, #20
	blo	.LBB82_15
@ %bb.14:                               @   in Loop: Header=BB82_7 Depth=1
	ldr.w	r2, [r9, #236]
	adds	r2, #1
	str.w	r2, [r9, #236]
	b	.LBB82_6
	.p2align	2
.LBB82_15:                              @   in Loop: Header=BB82_7 Depth=1
	orr.w	r2, r6, r0
	rsb	r6, r1, r1, lsl #4
	add.w	r6, r8, r6, lsl #4
	str.w	r2, [r6, r3, lsl #2]
	b	.LBB82_6
	.p2align	2
.LBB82_16:
	movw	r0, :lower16:.L.str.50
	movt	r0, :upper16:.L.str.50
	adds	r4, #24
	bl	credits_private_canvas60_style
	movw	r5, :lower16:.L.str.154
	movt	r5, :upper16:.L.str.154
	movs	r1, #12
	movs	r3, #52
	movs	r6, #67
	b	.LBB82_20
	.p2align	2
.LBB82_17:                              @   in Loop: Header=BB82_20 Depth=1
	adds	r1, #1
.LBB82_18:                              @   in Loop: Header=BB82_20 Depth=1
	movs	r7, #52
.LBB82_19:                              @   in Loop: Header=BB82_20 Depth=1
	ldrb	r6, [r5]
	mov	r3, r7
	cmp	r6, #0
	beq.w	.LBB82_109
.LBB82_20:                              @ =>This Inner Loop Header: Depth=1
	sub.w	r2, r6, #194
	cmp	r2, #29
	add.w	r2, r5, #1
	bhi	.LBB82_23
@ %bb.21:                               @   in Loop: Header=BB82_20 Depth=1
	ldrsb.w	r2, [r2]
	cmn.w	r2, #65
	bgt.w	.LBB82_149
@ %bb.22:                               @   in Loop: Header=BB82_20 Depth=1
	and	r2, r2, #63
	bfi	r2, r6, #6, #5
	adds	r5, #2
	mov	r6, r2
	b	.LBB82_24
	.p2align	2
.LBB82_23:                              @   in Loop: Header=BB82_20 Depth=1
	sxtb	r7, r6
	cmp.w	r7, #-1
	mov	r5, r2
	ble.w	.LBB82_149
.LBB82_24:                              @   in Loop: Header=BB82_20 Depth=1
	cmp	r6, #13
	beq	.LBB82_18
@ %bb.25:                               @   in Loop: Header=BB82_20 Depth=1
	cmp	r6, #10
	beq	.LBB82_17
@ %bb.26:                               @   in Loop: Header=BB82_20 Depth=1
	cmp	r3, #59
	add.w	r7, r3, #1
	it	ls
	cmpls	r1, #20
	blo	.LBB82_28
@ %bb.27:                               @   in Loop: Header=BB82_20 Depth=1
	ldr.w	r2, [r9, #236]
	adds	r2, #1
	str.w	r2, [r9, #236]
	b	.LBB82_19
	.p2align	2
.LBB82_28:                              @   in Loop: Header=BB82_20 Depth=1
	orr.w	r2, r6, r0
	rsb	r6, r1, r1, lsl #4
	add.w	r6, r4, r6, lsl #4
	str.w	r2, [r6, r3, lsl #2]
	b	.LBB82_19
	.p2align	2
.LBB82_29:
	movw	r0, :lower16:.L.str.45
	movt	r0, :upper16:.L.str.45
	add.w	r8, r4, #24
	bl	credits_private_canvas60_style
	movw	r4, :lower16:.L.str.176
	movt	r4, :upper16:.L.str.176
	movs	r1, #18
	movs	r3, #0
	movs	r6, #45
	b	.LBB82_33
	.p2align	2
.LBB82_30:                              @   in Loop: Header=BB82_33 Depth=1
	adds	r1, #1
.LBB82_31:                              @   in Loop: Header=BB82_33 Depth=1
	movs	r7, #0
.LBB82_32:                              @   in Loop: Header=BB82_33 Depth=1
	ldrb	r6, [r4]
	mov	r3, r7
	cmp	r6, #0
	beq.w	.LBB82_109
.LBB82_33:                              @ =>This Inner Loop Header: Depth=1
	sub.w	r2, r6, #194
	cmp	r2, #29
	add.w	r2, r4, #1
	bhi	.LBB82_36
@ %bb.34:                               @   in Loop: Header=BB82_33 Depth=1
	ldrsb.w	r2, [r2]
	cmn.w	r2, #65
	bgt.w	.LBB82_149
@ %bb.35:                               @   in Loop: Header=BB82_33 Depth=1
	and	r2, r2, #63
	bfi	r2, r6, #6, #5
	adds	r4, #2
	mov	r6, r2
	b	.LBB82_37
	.p2align	2
.LBB82_36:                              @   in Loop: Header=BB82_33 Depth=1
	sxtb	r7, r6
	cmp.w	r7, #-1
	mov	r4, r2
	ble.w	.LBB82_149
.LBB82_37:                              @   in Loop: Header=BB82_33 Depth=1
	cmp	r6, #13
	beq	.LBB82_31
@ %bb.38:                               @   in Loop: Header=BB82_33 Depth=1
	cmp	r6, #10
	beq	.LBB82_30
@ %bb.39:                               @   in Loop: Header=BB82_33 Depth=1
	cmp	r3, #59
	add.w	r7, r3, #1
	it	ls
	cmpls	r1, #20
	blo	.LBB82_41
@ %bb.40:                               @   in Loop: Header=BB82_33 Depth=1
	ldr.w	r2, [r9, #236]
	adds	r2, #1
	str.w	r2, [r9, #236]
	b	.LBB82_32
	.p2align	2
.LBB82_41:                              @   in Loop: Header=BB82_33 Depth=1
	orr.w	r2, r6, r0
	rsb	r6, r1, r1, lsl #4
	add.w	r6, r8, r6, lsl #4
	str.w	r2, [r6, r3, lsl #2]
	b	.LBB82_32
	.p2align	2
.LBB82_42:
	movw	r0, :lower16:.L.str.182
	movw	r5, :lower16:.L.str.181
	movt	r0, :upper16:.L.str.182
	movt	r5, :upper16:.L.str.181
	cmp	r2, #0
	it	eq
	moveq	r5, r0
	movw	r0, :lower16:.L.str.48
	movt	r0, :upper16:.L.str.48
	bl	credits_private_canvas60_style
	ldrb	r1, [r5]
	cmp	r1, #0
	beq.w	.LBB82_109
@ %bb.43:
	add.w	r12, r4, #24
	movs	r2, #14
	movs	r4, #34
	b	.LBB82_47
	.p2align	2
.LBB82_44:                              @   in Loop: Header=BB82_47 Depth=1
	adds	r2, #1
.LBB82_45:                              @   in Loop: Header=BB82_47 Depth=1
	movs	r7, #34
.LBB82_46:                              @   in Loop: Header=BB82_47 Depth=1
	ldrb	r1, [r5]
	mov	r4, r7
	cmp	r1, #0
	beq.w	.LBB82_109
.LBB82_47:                              @ =>This Inner Loop Header: Depth=1
	sub.w	r7, r1, #194
	cmp	r7, #29
	add.w	r6, r5, #1
	bhi	.LBB82_50
@ %bb.48:                               @   in Loop: Header=BB82_47 Depth=1
	ldrsb.w	r7, [r6]
	cmn.w	r7, #65
	bgt.w	.LBB82_149
@ %bb.49:                               @   in Loop: Header=BB82_47 Depth=1
	and	r3, r7, #63
	bfi	r3, r1, #6, #5
	adds	r5, #2
	mov	r1, r3
	b	.LBB82_51
	.p2align	2
.LBB82_50:                              @   in Loop: Header=BB82_47 Depth=1
	sxtb	r3, r1
	cmp.w	r3, #-1
	mov	r5, r6
	ble.w	.LBB82_149
.LBB82_51:                              @   in Loop: Header=BB82_47 Depth=1
	cmp	r1, #13
	beq	.LBB82_45
@ %bb.52:                               @   in Loop: Header=BB82_47 Depth=1
	cmp	r1, #10
	beq	.LBB82_44
@ %bb.53:                               @   in Loop: Header=BB82_47 Depth=1
	cmp	r4, #59
	add.w	r7, r4, #1
	it	ls
	cmpls	r2, #20
	blo	.LBB82_55
@ %bb.54:                               @   in Loop: Header=BB82_47 Depth=1
	ldr.w	r1, [r9, #236]
	adds	r1, #1
	str.w	r1, [r9, #236]
	b	.LBB82_46
	.p2align	2
.LBB82_55:                              @   in Loop: Header=BB82_47 Depth=1
	rsb	r3, r2, r2, lsl #4
	orrs	r1, r0
	add.w	r3, r12, r3, lsl #4
	str.w	r1, [r3, r4, lsl #2]
	b	.LBB82_46
	.p2align	2
.LBB82_56:
	movw	r0, :lower16:.L.str.174
	movt	r0, :upper16:.L.str.174
	add.w	r8, r4, #24
	bl	credits_private_canvas60_style
	movw	r4, :lower16:.L.str.173
	movt	r4, :upper16:.L.str.173
	movs	r1, #4
	movs	r3, #2
	movs	r6, #77
	b	.LBB82_60
	.p2align	2
.LBB82_57:                              @   in Loop: Header=BB82_60 Depth=1
	adds	r1, #1
.LBB82_58:                              @   in Loop: Header=BB82_60 Depth=1
	movs	r7, #2
.LBB82_59:                              @   in Loop: Header=BB82_60 Depth=1
	ldrb	r6, [r4]
	mov	r3, r7
	cmp	r6, #0
	beq.w	.LBB82_109
.LBB82_60:                              @ =>This Inner Loop Header: Depth=1
	sub.w	r2, r6, #194
	cmp	r2, #29
	add.w	r2, r4, #1
	bhi	.LBB82_63
@ %bb.61:                               @   in Loop: Header=BB82_60 Depth=1
	ldrsb.w	r2, [r2]
	cmn.w	r2, #65
	bgt.w	.LBB82_149
@ %bb.62:                               @   in Loop: Header=BB82_60 Depth=1
	and	r2, r2, #63
	bfi	r2, r6, #6, #5
	adds	r4, #2
	mov	r6, r2
	b	.LBB82_64
	.p2align	2
.LBB82_63:                              @   in Loop: Header=BB82_60 Depth=1
	sxtb	r7, r6
	cmp.w	r7, #-1
	mov	r4, r2
	ble.w	.LBB82_149
.LBB82_64:                              @   in Loop: Header=BB82_60 Depth=1
	cmp	r6, #13
	beq	.LBB82_58
@ %bb.65:                               @   in Loop: Header=BB82_60 Depth=1
	cmp	r6, #10
	beq	.LBB82_57
@ %bb.66:                               @   in Loop: Header=BB82_60 Depth=1
	cmp	r3, #59
	add.w	r7, r3, #1
	it	ls
	cmpls	r1, #20
	blo	.LBB82_68
@ %bb.67:                               @   in Loop: Header=BB82_60 Depth=1
	ldr.w	r2, [r9, #236]
	adds	r2, #1
	str.w	r2, [r9, #236]
	b	.LBB82_59
	.p2align	2
.LBB82_68:                              @   in Loop: Header=BB82_60 Depth=1
	orr.w	r2, r6, r0
	rsb	r6, r1, r1, lsl #4
	add.w	r6, r8, r6, lsl #4
	str.w	r2, [r6, r3, lsl #2]
	b	.LBB82_59
	.p2align	2
.LBB82_69:
	movw	r0, :lower16:.L.str.174
	movt	r0, :upper16:.L.str.174
	add.w	r8, r4, #24
	bl	credits_private_canvas60_style
	movw	r4, :lower16:.L.str.175
	movt	r4, :upper16:.L.str.175
	movs	r1, #5
	movs	r3, #2
	movs	r6, #79
	b	.LBB82_73
	.p2align	2
.LBB82_70:                              @   in Loop: Header=BB82_73 Depth=1
	adds	r1, #1
.LBB82_71:                              @   in Loop: Header=BB82_73 Depth=1
	movs	r7, #2
.LBB82_72:                              @   in Loop: Header=BB82_73 Depth=1
	ldrb	r6, [r4]
	mov	r3, r7
	cmp	r6, #0
	beq.w	.LBB82_109
.LBB82_73:                              @ =>This Inner Loop Header: Depth=1
	sub.w	r2, r6, #194
	cmp	r2, #29
	add.w	r2, r4, #1
	bhi	.LBB82_76
@ %bb.74:                               @   in Loop: Header=BB82_73 Depth=1
	ldrsb.w	r2, [r2]
	cmn.w	r2, #65
	bgt.w	.LBB82_149
@ %bb.75:                               @   in Loop: Header=BB82_73 Depth=1
	and	r2, r2, #63
	bfi	r2, r6, #6, #5
	adds	r4, #2
	mov	r6, r2
	b	.LBB82_77
	.p2align	2
.LBB82_76:                              @   in Loop: Header=BB82_73 Depth=1
	sxtb	r7, r6
	cmp.w	r7, #-1
	mov	r4, r2
	ble.w	.LBB82_149
.LBB82_77:                              @   in Loop: Header=BB82_73 Depth=1
	cmp	r6, #13
	beq	.LBB82_71
@ %bb.78:                               @   in Loop: Header=BB82_73 Depth=1
	cmp	r6, #10
	beq	.LBB82_70
@ %bb.79:                               @   in Loop: Header=BB82_73 Depth=1
	cmp	r3, #59
	add.w	r7, r3, #1
	it	ls
	cmpls	r1, #20
	blo	.LBB82_81
@ %bb.80:                               @   in Loop: Header=BB82_73 Depth=1
	ldr.w	r2, [r9, #236]
	adds	r2, #1
	str.w	r2, [r9, #236]
	b	.LBB82_72
	.p2align	2
.LBB82_81:                              @   in Loop: Header=BB82_73 Depth=1
	orr.w	r2, r6, r0
	rsb	r6, r1, r1, lsl #4
	add.w	r6, r8, r6, lsl #4
	str.w	r2, [r6, r3, lsl #2]
	b	.LBB82_72
	.p2align	2
.LBB82_82:
	movw	r0, :lower16:.L.str.49
	movt	r0, :upper16:.L.str.49
	add.w	r8, r4, #24
	bl	credits_private_canvas60_style
	movw	r4, :lower16:.L.str.179
	movt	r4, :upper16:.L.str.179
	movs	r1, #12
	movs	r3, #34
	movs	r6, #50
	b	.LBB82_86
	.p2align	2
.LBB82_83:                              @   in Loop: Header=BB82_86 Depth=1
	adds	r1, #1
.LBB82_84:                              @   in Loop: Header=BB82_86 Depth=1
	movs	r7, #34
.LBB82_85:                              @   in Loop: Header=BB82_86 Depth=1
	ldrb	r6, [r4]
	mov	r3, r7
	cmp	r6, #0
	beq.w	.LBB82_109
.LBB82_86:                              @ =>This Inner Loop Header: Depth=1
	sub.w	r2, r6, #194
	cmp	r2, #29
	add.w	r2, r4, #1
	bhi	.LBB82_89
@ %bb.87:                               @   in Loop: Header=BB82_86 Depth=1
	ldrsb.w	r2, [r2]
	cmn.w	r2, #65
	bgt.w	.LBB82_149
@ %bb.88:                               @   in Loop: Header=BB82_86 Depth=1
	and	r2, r2, #63
	bfi	r2, r6, #6, #5
	adds	r4, #2
	mov	r6, r2
	b	.LBB82_90
	.p2align	2
.LBB82_89:                              @   in Loop: Header=BB82_86 Depth=1
	sxtb	r7, r6
	cmp.w	r7, #-1
	mov	r4, r2
	ble.w	.LBB82_149
.LBB82_90:                              @   in Loop: Header=BB82_86 Depth=1
	cmp	r6, #13
	beq	.LBB82_84
@ %bb.91:                               @   in Loop: Header=BB82_86 Depth=1
	cmp	r6, #10
	beq	.LBB82_83
@ %bb.92:                               @   in Loop: Header=BB82_86 Depth=1
	cmp	r3, #59
	add.w	r7, r3, #1
	it	ls
	cmpls	r1, #20
	blo	.LBB82_94
@ %bb.93:                               @   in Loop: Header=BB82_86 Depth=1
	ldr.w	r2, [r9, #236]
	adds	r2, #1
	str.w	r2, [r9, #236]
	b	.LBB82_85
	.p2align	2
.LBB82_94:                              @   in Loop: Header=BB82_86 Depth=1
	orr.w	r2, r6, r0
	rsb	r6, r1, r1, lsl #4
	add.w	r6, r8, r6, lsl #4
	str.w	r2, [r6, r3, lsl #2]
	b	.LBB82_85
	.p2align	2
.LBB82_95:
	movw	r0, :lower16:.L.str.48
	movt	r0, :upper16:.L.str.48
	add.w	r8, r4, #24
	bl	credits_private_canvas60_style
	movw	r4, :lower16:.L.str.172
	movt	r4, :upper16:.L.str.172
	movs	r3, #2
	movs	r6, #98
	movs	r2, #2
	b	.LBB82_99
	.p2align	2
.LBB82_96:                              @   in Loop: Header=BB82_99 Depth=1
	adds	r2, #1
.LBB82_97:                              @   in Loop: Header=BB82_99 Depth=1
	movs	r7, #2
.LBB82_98:                              @   in Loop: Header=BB82_99 Depth=1
	ldrb	r6, [r4]
	mov	r3, r7
	cmp	r6, #0
	beq	.LBB82_109
.LBB82_99:                              @ =>This Inner Loop Header: Depth=1
	sub.w	r1, r6, #194
	cmp	r1, #29
	add.w	r1, r4, #1
	bhi	.LBB82_102
@ %bb.100:                              @   in Loop: Header=BB82_99 Depth=1
	ldrsb.w	r1, [r1]
	cmn.w	r1, #65
	bgt.w	.LBB82_149
@ %bb.101:                              @   in Loop: Header=BB82_99 Depth=1
	and	r1, r1, #63
	bfi	r1, r6, #6, #5
	adds	r4, #2
	mov	r6, r1
	b	.LBB82_103
	.p2align	2
.LBB82_102:                             @   in Loop: Header=BB82_99 Depth=1
	sxtb	r7, r6
	cmp.w	r7, #-1
	mov	r4, r1
	ble.w	.LBB82_149
.LBB82_103:                             @   in Loop: Header=BB82_99 Depth=1
	cmp	r6, #13
	beq	.LBB82_97
@ %bb.104:                              @   in Loop: Header=BB82_99 Depth=1
	cmp	r6, #10
	beq	.LBB82_96
@ %bb.105:                              @   in Loop: Header=BB82_99 Depth=1
	cmp	r3, #59
	add.w	r7, r3, #1
	it	ls
	cmpls	r2, #20
	blo	.LBB82_107
@ %bb.106:                              @   in Loop: Header=BB82_99 Depth=1
	ldr.w	r1, [r9, #236]
	adds	r1, #1
	str.w	r1, [r9, #236]
	b	.LBB82_98
	.p2align	2
.LBB82_107:                             @   in Loop: Header=BB82_99 Depth=1
	orr.w	r1, r6, r0
	rsb	r6, r2, r2, lsl #4
	add.w	r6, r8, r6, lsl #4
	str.w	r1, [r6, r3, lsl #2]
	b	.LBB82_98
	.p2align	2
.LBB82_108:
	movw	r0, :lower16:.L.str.45
	movt	r0, :upper16:.L.str.45
	bl	credits_private_canvas60_style
	orr	r1, r0, #62
	orr	r2, r0, #32
	orr	r0, r0, #1073741824
	orr	r0, r0, #95
	strd	r1, r2, [r9]
	strd	r0, r2, [r9, #8]
.LBB82_109:
	add	sp, #4
	pop.w	{r4, r5, r6, r7, r8, r9, pc}
	.p2align	2
.LBB82_110:
	movw	r0, :lower16:.L.str.45
	movt	r0, :upper16:.L.str.45
	add.w	r8, r4, #24
	bl	credits_private_canvas60_style
	movw	r4, :lower16:.L.str.178
	movt	r4, :upper16:.L.str.178
	movs	r1, #11
	movs	r3, #32
	movs	r6, #45
	b	.LBB82_114
	.p2align	2
.LBB82_111:                             @   in Loop: Header=BB82_114 Depth=1
	adds	r1, #1
.LBB82_112:                             @   in Loop: Header=BB82_114 Depth=1
	movs	r7, #32
.LBB82_113:                             @   in Loop: Header=BB82_114 Depth=1
	ldrb	r6, [r4]
	mov	r3, r7
	cmp	r6, #0
	beq	.LBB82_109
.LBB82_114:                             @ =>This Inner Loop Header: Depth=1
	sub.w	r2, r6, #194
	cmp	r2, #29
	add.w	r2, r4, #1
	bhi	.LBB82_117
@ %bb.115:                              @   in Loop: Header=BB82_114 Depth=1
	ldrsb.w	r2, [r2]
	cmn.w	r2, #65
	bgt.w	.LBB82_149
@ %bb.116:                              @   in Loop: Header=BB82_114 Depth=1
	and	r2, r2, #63
	bfi	r2, r6, #6, #5
	adds	r4, #2
	mov	r6, r2
	b	.LBB82_118
	.p2align	2
.LBB82_117:                             @   in Loop: Header=BB82_114 Depth=1
	sxtb	r7, r6
	cmp.w	r7, #-1
	mov	r4, r2
	ble.w	.LBB82_149
.LBB82_118:                             @   in Loop: Header=BB82_114 Depth=1
	cmp	r6, #13
	beq	.LBB82_112
@ %bb.119:                              @   in Loop: Header=BB82_114 Depth=1
	cmp	r6, #10
	beq	.LBB82_111
@ %bb.120:                              @   in Loop: Header=BB82_114 Depth=1
	cmp	r3, #59
	add.w	r7, r3, #1
	it	ls
	cmpls	r1, #20
	blo	.LBB82_122
@ %bb.121:                              @   in Loop: Header=BB82_114 Depth=1
	ldr.w	r2, [r9, #236]
	adds	r2, #1
	str.w	r2, [r9, #236]
	b	.LBB82_113
	.p2align	2
.LBB82_122:                             @   in Loop: Header=BB82_114 Depth=1
	orr.w	r2, r6, r0
	rsb	r6, r1, r1, lsl #4
	add.w	r6, r8, r6, lsl #4
	str.w	r2, [r6, r3, lsl #2]
	b	.LBB82_113
	.p2align	2
.LBB82_123:
	movw	r0, :lower16:.L.str.68
	movt	r0, :upper16:.L.str.68
	adds	r4, #24
	bl	credits_private_canvas60_style
	movw	r5, :lower16:.L.str.183
	movt	r5, :upper16:.L.str.183
	movs	r1, #16
	movs	r3, #44
	movs	r6, #80
	b	.LBB82_127
	.p2align	2
.LBB82_124:                             @   in Loop: Header=BB82_127 Depth=1
	adds	r1, #1
.LBB82_125:                             @   in Loop: Header=BB82_127 Depth=1
	movs	r7, #44
.LBB82_126:                             @   in Loop: Header=BB82_127 Depth=1
	ldrb	r6, [r5]
	mov	r3, r7
	cmp	r6, #0
	beq	.LBB82_109
.LBB82_127:                             @ =>This Inner Loop Header: Depth=1
	sub.w	r2, r6, #194
	cmp	r2, #29
	add.w	r2, r5, #1
	bhi	.LBB82_130
@ %bb.128:                              @   in Loop: Header=BB82_127 Depth=1
	ldrsb.w	r2, [r2]
	cmn.w	r2, #65
	bgt	.LBB82_149
@ %bb.129:                              @   in Loop: Header=BB82_127 Depth=1
	and	r2, r2, #63
	bfi	r2, r6, #6, #5
	adds	r5, #2
	mov	r6, r2
	b	.LBB82_131
	.p2align	2
.LBB82_130:                             @   in Loop: Header=BB82_127 Depth=1
	sxtb	r7, r6
	cmp.w	r7, #-1
	mov	r5, r2
	ble	.LBB82_149
.LBB82_131:                             @   in Loop: Header=BB82_127 Depth=1
	cmp	r6, #13
	beq	.LBB82_125
@ %bb.132:                              @   in Loop: Header=BB82_127 Depth=1
	cmp	r6, #10
	beq	.LBB82_124
@ %bb.133:                              @   in Loop: Header=BB82_127 Depth=1
	cmp	r3, #59
	add.w	r7, r3, #1
	it	ls
	cmpls	r1, #20
	blo	.LBB82_135
@ %bb.134:                              @   in Loop: Header=BB82_127 Depth=1
	ldr.w	r2, [r9, #236]
	adds	r2, #1
	str.w	r2, [r9, #236]
	b	.LBB82_126
	.p2align	2
.LBB82_135:                             @   in Loop: Header=BB82_127 Depth=1
	orr.w	r2, r6, r0
	rsb	r6, r1, r1, lsl #4
	add.w	r6, r4, r6, lsl #4
	str.w	r2, [r6, r3, lsl #2]
	b	.LBB82_126
	.p2align	2
.LBB82_136:
	movw	r0, :lower16:.L.str.45
	movt	r0, :upper16:.L.str.45
	add.w	r8, r4, #24
	bl	credits_private_canvas60_style
	movw	r4, :lower16:.L.str.180
	movt	r4, :upper16:.L.str.180
	movs	r1, #13
	movs	r3, #32
	movs	r6, #45
	b	.LBB82_140
	.p2align	2
.LBB82_137:                             @   in Loop: Header=BB82_140 Depth=1
	adds	r1, #1
.LBB82_138:                             @   in Loop: Header=BB82_140 Depth=1
	movs	r7, #32
.LBB82_139:                             @   in Loop: Header=BB82_140 Depth=1
	ldrb	r6, [r4]
	mov	r3, r7
	cmp	r6, #0
	beq.w	.LBB82_109
.LBB82_140:                             @ =>This Inner Loop Header: Depth=1
	sub.w	r2, r6, #194
	cmp	r2, #29
	add.w	r2, r4, #1
	bhi	.LBB82_143
@ %bb.141:                              @   in Loop: Header=BB82_140 Depth=1
	ldrsb.w	r2, [r2]
	cmn.w	r2, #65
	bgt	.LBB82_149
@ %bb.142:                              @   in Loop: Header=BB82_140 Depth=1
	and	r2, r2, #63
	bfi	r2, r6, #6, #5
	adds	r4, #2
	mov	r6, r2
	b	.LBB82_144
	.p2align	2
.LBB82_143:                             @   in Loop: Header=BB82_140 Depth=1
	sxtb	r7, r6
	cmp.w	r7, #-1
	mov	r4, r2
	ble	.LBB82_149
.LBB82_144:                             @   in Loop: Header=BB82_140 Depth=1
	cmp	r6, #13
	beq	.LBB82_138
@ %bb.145:                              @   in Loop: Header=BB82_140 Depth=1
	cmp	r6, #10
	beq	.LBB82_137
@ %bb.146:                              @   in Loop: Header=BB82_140 Depth=1
	cmp	r3, #59
	add.w	r7, r3, #1
	it	ls
	cmpls	r1, #20
	blo	.LBB82_148
@ %bb.147:                              @   in Loop: Header=BB82_140 Depth=1
	ldr.w	r2, [r9, #236]
	adds	r2, #1
	str.w	r2, [r9, #236]
	b	.LBB82_139
	.p2align	2
.LBB82_148:                             @   in Loop: Header=BB82_140 Depth=1
	orr.w	r2, r6, r0
	rsb	r6, r1, r1, lsl #4
	add.w	r6, r8, r6, lsl #4
	str.w	r2, [r6, r3, lsl #2]
	b	.LBB82_139
	.p2align	2
.LBB82_149:
	movw	r0, :lower16:.L.str.162
	movt	r0, :upper16:.L.str.162
	bl	credits_private_credits_fail
.Lfunc_end82:
	.size	credits_private_scenes60_ui, .Lfunc_end82-credits_private_scenes60_ui
	.cantunwind
	.fnend
                                        @ -- End function
	.p2align	1                               @ -- Begin function credits_private_scenes60_access_ping
	.prefalign	2, .Lfunc_end83, nop
	.type	credits_private_scenes60_access_ping,%function
	.code	16
	.thumb_func
credits_private_scenes60_access_ping:   @ @credits_private_scenes60_access_ping
	.fnstart
@ %bb.0:
	.save	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	push.w	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	.pad	#76
	sub	sp, #76
	mov	r5, r0
	movw	r0, #10100
	add.w	r8, r5, r0
	ldr	r0, [r5, r0]
	ldr.w	r10, [r8, #4]
	movw	r1, #4828
	add.w	r9, r5, r1
	cmp	r0, #7
	add.w	r11, r10, #1
	bgt	.LBB83_16
@ %bb.1:
	movw	r2, :lower16:.L.str.195
	adds	r7, r0, #1
	movt	r2, :upper16:.L.str.195
	add	r0, sp, #12
	movs	r1, #64
	mov	r3, r11
	str	r7, [sp]
	bl	snprintf
	cmp.w	r10, #17
	bgt.w	.LBB83_31
@ %bb.2:
	movw	r0, :lower16:.L.str.50
	movt	r0, :upper16:.L.str.50
	bl	credits_private_canvas60_style
	ldrb.w	r4, [sp, #12]
	cmp	r4, #0
	beq.w	.LBB83_31
@ %bb.3:
	movw	r1, #43691
	movt	r1, #10922
	smmul	r1, r10, r1
	add.w	r1, r1, r1, lsr #31
	add.w	r2, r1, r1, lsl #1
	sub.w	r2, r10, r2, lsl #1
	add.w	r2, r2, r2, lsl #2
	movs	r3, #2
	add.w	r7, r3, r2, lsl #1
	lsls	r1, r1, #2
	add.w	r12, r5, #24
	adds	r3, r1, #1
	add	r6, sp, #12
	mov	r1, r7
	b	.LBB83_7
	.p2align	2
.LBB83_4:                               @   in Loop: Header=BB83_7 Depth=1
	adds	r3, #1
.LBB83_5:                               @   in Loop: Header=BB83_7 Depth=1
	mov	r2, r7
.LBB83_6:                               @   in Loop: Header=BB83_7 Depth=1
	ldrb	r4, [r6]
	mov	r1, r2
	cmp	r4, #0
	beq.w	.LBB83_31
.LBB83_7:                               @ =>This Inner Loop Header: Depth=1
	sub.w	r2, r4, #194
	cmp	r2, #29
	add.w	r2, r6, #1
	bhi	.LBB83_10
@ %bb.8:                                @   in Loop: Header=BB83_7 Depth=1
	ldrsb.w	r2, [r2]
	cmn.w	r2, #65
	bgt.w	.LBB83_49
@ %bb.9:                                @   in Loop: Header=BB83_7 Depth=1
	and	r2, r2, #63
	bfi	r2, r4, #6, #5
	adds	r6, #2
	mov	r4, r2
	b	.LBB83_11
	.p2align	2
.LBB83_10:                              @   in Loop: Header=BB83_7 Depth=1
	sxtb	r6, r4
	cmp.w	r6, #-1
	mov	r6, r2
	ble.w	.LBB83_49
.LBB83_11:                              @   in Loop: Header=BB83_7 Depth=1
	cmp	r4, #13
	beq	.LBB83_5
@ %bb.12:                               @   in Loop: Header=BB83_7 Depth=1
	cmp	r4, #10
	beq	.LBB83_4
@ %bb.13:                               @   in Loop: Header=BB83_7 Depth=1
	cmp	r1, #59
	add.w	r2, r1, #1
	it	ls
	cmpls	r3, #20
	blo	.LBB83_15
@ %bb.14:                               @   in Loop: Header=BB83_7 Depth=1
	ldr.w	r1, [r9]
	adds	r1, #1
	str.w	r1, [r9]
	b	.LBB83_6
	.p2align	2
.LBB83_15:                              @   in Loop: Header=BB83_7 Depth=1
	rsb	r5, r3, r3, lsl #4
	orrs	r4, r0
	add.w	r5, r12, r5, lsl #4
	str.w	r4, [r5, r1, lsl #2]
	b	.LBB83_6
	.p2align	2
.LBB83_16:
	movw	r2, :lower16:.L.str.196
	movt	r2, :upper16:.L.str.196
	add	r0, sp, #12
	movs	r1, #64
	mov	r3, r11
	bl	snprintf
	cmp.w	r10, #18
	bge	.LBB83_32
@ %bb.17:
	add.w	r0, r5, #24
	str	r0, [sp, #8]                    @ 4-byte Spill
	movw	r0, :lower16:.L.str.46
	movt	r0, :upper16:.L.str.46
	bl	credits_private_canvas60_style
	ldrb.w	r5, [sp, #12]
	cmp	r5, #0
	beq	.LBB83_33
@ %bb.18:
	movw	r1, #43691
	movt	r1, #10922
	smmul	r1, r10, r1
	add.w	r1, r1, r1, lsr #31
	add.w	r2, r1, r1, lsl #1
	sub.w	r2, r10, r2, lsl #1
	add.w	r2, r2, r2, lsl #2
	movs	r3, #2
	add.w	r12, r3, r2, lsl #1
	lsls	r1, r1, #2
	ldr	r7, [sp, #8]                    @ 4-byte Reload
	adds	r2, r1, #1
	add	r6, sp, #12
	mov	r1, r12
	b	.LBB83_22
	.p2align	2
.LBB83_19:                              @   in Loop: Header=BB83_22 Depth=1
	adds	r2, #1
.LBB83_20:                              @   in Loop: Header=BB83_22 Depth=1
	mov	r4, r12
.LBB83_21:                              @   in Loop: Header=BB83_22 Depth=1
	ldrb	r5, [r6]
	mov	r1, r4
	cmp	r5, #0
	beq	.LBB83_33
.LBB83_22:                              @ =>This Inner Loop Header: Depth=1
	sub.w	r3, r5, #194
	cmp	r3, #29
	add.w	r3, r6, #1
	bhi	.LBB83_25
@ %bb.23:                               @   in Loop: Header=BB83_22 Depth=1
	ldrsb.w	r3, [r3]
	cmn.w	r3, #65
	bgt.w	.LBB83_49
@ %bb.24:                               @   in Loop: Header=BB83_22 Depth=1
	and	r3, r3, #63
	bfi	r3, r5, #6, #5
	adds	r6, #2
	mov	r5, r3
	b	.LBB83_26
	.p2align	2
.LBB83_25:                              @   in Loop: Header=BB83_22 Depth=1
	sxtb	r6, r5
	cmp.w	r6, #-1
	mov	r6, r3
	ble.w	.LBB83_49
.LBB83_26:                              @   in Loop: Header=BB83_22 Depth=1
	cmp	r5, #13
	beq	.LBB83_20
@ %bb.27:                               @   in Loop: Header=BB83_22 Depth=1
	cmp	r5, #10
	beq	.LBB83_19
@ %bb.28:                               @   in Loop: Header=BB83_22 Depth=1
	cmp	r1, #59
	add.w	r4, r1, #1
	it	ls
	cmpls	r2, #20
	blo	.LBB83_30
@ %bb.29:                               @   in Loop: Header=BB83_22 Depth=1
	ldr.w	r1, [r9]
	adds	r1, #1
	str.w	r1, [r9]
	b	.LBB83_21
	.p2align	2
.LBB83_30:                              @   in Loop: Header=BB83_22 Depth=1
	orr.w	r3, r5, r0
	rsb	r5, r2, r2, lsl #4
	add.w	r5, r7, r5, lsl #4
	str.w	r3, [r5, r1, lsl #2]
	b	.LBB83_21
	.p2align	2
.LBB83_31:
	ldr.w	r0, [r8]
	adds	r0, #1
	str.w	r0, [r8]
	add	sp, #76
	pop.w	{r4, r5, r6, r7, r8, r9, r10, r11, pc}
	.p2align	2
.LBB83_32:
	movw	r2, :lower16:.L.str.197
	add.w	r3, r10, #2
	movt	r2, :upper16:.L.str.197
	add	r0, sp, #12
	movs	r1, #64
	bl	snprintf
	b	.LBB83_48
	.p2align	2
.LBB83_33:
	movw	r2, :lower16:.L.str.197
	add.w	r3, r10, #2
	movt	r2, :upper16:.L.str.197
	add	r0, sp, #12
	movs	r1, #64
	bl	snprintf
	cmp.w	r10, #17
	beq	.LBB83_48
@ %bb.34:
	movw	r0, :lower16:.L.str.50
	movt	r0, :upper16:.L.str.50
	bl	credits_private_canvas60_style
	ldrb.w	r6, [sp, #12]
	cmp	r6, #0
	beq	.LBB83_48
@ %bb.35:
	movw	r1, #43691
	movt	r1, #10922
	smmul	r1, r11, r1
	add.w	r1, r1, r1, lsr #31
	add.w	r2, r1, r1, lsl #1
	sub.w	r2, r11, r2, lsl #1
	add.w	r2, r2, r2, lsl #2
	movs	r3, #2
	add.w	r12, r3, r2, lsl #1
	lsls	r1, r1, #2
	ldr	r7, [sp, #8]                    @ 4-byte Reload
	adds	r2, r1, #1
	add	r4, sp, #12
	mov	r1, r12
	b	.LBB83_39
	.p2align	2
.LBB83_36:                              @   in Loop: Header=BB83_39 Depth=1
	adds	r2, #1
.LBB83_37:                              @   in Loop: Header=BB83_39 Depth=1
	mov	r5, r12
.LBB83_38:                              @   in Loop: Header=BB83_39 Depth=1
	ldrb	r6, [r4]
	mov	r1, r5
	cbz	r6, .LBB83_48
.LBB83_39:                              @ =>This Inner Loop Header: Depth=1
	sub.w	r3, r6, #194
	cmp	r3, #29
	add.w	r3, r4, #1
	bhi	.LBB83_42
@ %bb.40:                               @   in Loop: Header=BB83_39 Depth=1
	ldrsb.w	r3, [r3]
	cmn.w	r3, #65
	bgt	.LBB83_49
@ %bb.41:                               @   in Loop: Header=BB83_39 Depth=1
	and	r3, r3, #63
	bfi	r3, r6, #6, #5
	adds	r4, #2
	mov	r6, r3
	b	.LBB83_43
	.p2align	2
.LBB83_42:                              @   in Loop: Header=BB83_39 Depth=1
	sxtb	r5, r6
	cmp.w	r5, #-1
	mov	r4, r3
	ble	.LBB83_49
.LBB83_43:                              @   in Loop: Header=BB83_39 Depth=1
	cmp	r6, #13
	beq	.LBB83_37
@ %bb.44:                               @   in Loop: Header=BB83_39 Depth=1
	cmp	r6, #10
	beq	.LBB83_36
@ %bb.45:                               @   in Loop: Header=BB83_39 Depth=1
	cmp	r1, #59
	add.w	r5, r1, #1
	it	ls
	cmpls	r2, #20
	blo	.LBB83_47
@ %bb.46:                               @   in Loop: Header=BB83_39 Depth=1
	ldr.w	r1, [r9]
	adds	r1, #1
	str.w	r1, [r9]
	b	.LBB83_38
	.p2align	2
.LBB83_47:                              @   in Loop: Header=BB83_39 Depth=1
	orr.w	r3, r6, r0
	rsb	r6, r2, r2, lsl #4
	add.w	r6, r7, r6, lsl #4
	str.w	r3, [r6, r1, lsl #2]
	b	.LBB83_38
	.p2align	2
.LBB83_48:
	ldr.w	r1, [r8, #4]
	movs	r0, #1
	str.w	r0, [r8]
	adds	r0, r1, #1
	str.w	r0, [r8, #4]
	add	sp, #76
	pop.w	{r4, r5, r6, r7, r8, r9, r10, r11, pc}
	.p2align	2
.LBB83_49:
	movw	r0, :lower16:.L.str.162
	movt	r0, :upper16:.L.str.162
	bl	credits_private_credits_fail
.Lfunc_end83:
	.size	credits_private_scenes60_access_ping, .Lfunc_end83-credits_private_scenes60_access_ping
	.cantunwind
	.fnend
                                        @ -- End function
	.p2align	1                               @ -- Begin function credits_private_scenes60_access_tile
	.prefalign	2, .Lfunc_end84, nop
	.type	credits_private_scenes60_access_tile,%function
	.code	16
	.thumb_func
credits_private_scenes60_access_tile:   @ @credits_private_scenes60_access_tile
	.fnstart
@ %bb.0:
	.save	{r4, r5, r6, r7, lr}
	push	{r4, r5, r6, r7, lr}
	.pad	#4
	sub	sp, #4
	cmp	r1, #17
	bgt	.LBB84_15
@ %bb.1:
	mov	r5, r0
	mov	r0, r3
	mov	r6, r2
	mov	r4, r1
	bl	credits_private_canvas60_style
	ldrb	r2, [r6]
	cmp	r2, #0
	beq	.LBB84_15
@ %bb.2:
	movw	r1, #43691
	movt	r1, #10922
	smmul	r1, r4, r1
	add.w	r1, r1, r1, lsr #31
	add.w	r3, r1, r1, lsl #1
	sub.w	r3, r4, r3, lsl #1
	add.w	r3, r3, r3, lsl #2
	movs	r7, #2
	lsls	r1, r1, #2
	add.w	r7, r7, r3, lsl #1
	adds	r3, r1, #1
	movw	r1, #4828
	add.w	r12, r5, #24
	add.w	lr, r5, r1
	mov	r1, r7
	b	.LBB84_6
	.p2align	2
.LBB84_3:                               @   in Loop: Header=BB84_6 Depth=1
	adds	r3, #1
.LBB84_4:                               @   in Loop: Header=BB84_6 Depth=1
	mov	r5, r7
.LBB84_5:                               @   in Loop: Header=BB84_6 Depth=1
	ldrb	r2, [r6]
	mov	r1, r5
	cbz	r2, .LBB84_15
.LBB84_6:                               @ =>This Inner Loop Header: Depth=1
	sub.w	r4, r2, #194
	cmp	r4, #29
	add.w	r4, r6, #1
	bhi	.LBB84_9
@ %bb.7:                                @   in Loop: Header=BB84_6 Depth=1
	ldrsb.w	r4, [r4]
	cmn.w	r4, #65
	bgt	.LBB84_16
@ %bb.8:                                @   in Loop: Header=BB84_6 Depth=1
	and	r4, r4, #63
	bfi	r4, r2, #6, #5
	adds	r6, #2
	mov	r2, r4
	b	.LBB84_10
	.p2align	2
.LBB84_9:                               @   in Loop: Header=BB84_6 Depth=1
	sxtb	r5, r2
	cmp.w	r5, #-1
	mov	r6, r4
	ble	.LBB84_16
.LBB84_10:                              @   in Loop: Header=BB84_6 Depth=1
	cmp	r2, #13
	beq	.LBB84_4
@ %bb.11:                               @   in Loop: Header=BB84_6 Depth=1
	cmp	r2, #10
	beq	.LBB84_3
@ %bb.12:                               @   in Loop: Header=BB84_6 Depth=1
	cmp	r1, #59
	add.w	r5, r1, #1
	it	ls
	cmpls	r3, #20
	blo	.LBB84_14
@ %bb.13:                               @   in Loop: Header=BB84_6 Depth=1
	ldr.w	r1, [lr]
	adds	r1, #1
	str.w	r1, [lr]
	b	.LBB84_5
	.p2align	2
.LBB84_14:                              @   in Loop: Header=BB84_6 Depth=1
	rsb	r4, r3, r3, lsl #4
	orrs	r2, r0
	add.w	r4, r12, r4, lsl #4
	str.w	r2, [r4, r1, lsl #2]
	b	.LBB84_5
	.p2align	2
.LBB84_15:
	add	sp, #4
	pop	{r4, r5, r6, r7, pc}
	.p2align	2
.LBB84_16:
	movw	r0, :lower16:.L.str.162
	movt	r0, :upper16:.L.str.162
	bl	credits_private_credits_fail
.Lfunc_end84:
	.size	credits_private_scenes60_access_tile, .Lfunc_end84-credits_private_scenes60_access_tile
	.cantunwind
	.fnend
                                        @ -- End function
	.p2align	1                               @ -- Begin function credits_private_text60_emit_words
	.prefalign	2, .Lfunc_end85, nop
	.type	credits_private_text60_emit_words,%function
	.code	16
	.thumb_func
credits_private_text60_emit_words:      @ @credits_private_text60_emit_words
	.fnstart
@ %bb.0:
	.save	{r4, r5, r6, r7, r8, r9, r10, lr}
	push.w	{r4, r5, r6, r7, r8, r9, r10, lr}
	mov	lr, r2
	movw	r7, #10128
	adds	r4, r0, r7
	ldr.w	r6, [lr, #4]
	ldr	r5, [r4, #4]
	ldr	r2, [sp, #32]
	add.w	r12, r6, #64
	cmp	r12, r5
	bls	.LBB85_7
@ %bb.1:
	cmp	r5, #0
	bne.w	.LBB85_32
@ %bb.2:
	ldr	r5, [r4]
	cmp	r5, #0
	bne.w	.LBB85_32
@ %bb.3:
	ldr.w	r8, [r0, #12]
	cmp.w	r8, #0
	beq	.LBB85_31
@ %bb.4:
	ldrd	r7, r5, [r0, #16]
	adds	r5, #3
	bic	r9, r5, #3
	subs.w	r5, r7, r9
	blo	.LBB85_31
@ %bb.5:
	add.w	r7, r6, r12, lsr #1
	adds	r7, #96
	cmp	r7, r5
	bhi	.LBB85_31
@ %bb.6:
	ldrd	r5, r10, [r0]
	add.w	r12, r9, r7
	add	r5, r7
	str.w	r12, [r0, #20]
	cmp	r5, r10
	str	r5, [r0]
	it	hi
	strhi	r5, [r0, #4]
	ldr	r5, [r0, #8]
	add.w	r12, r8, r9
	adds	r5, #1
	str	r5, [r0, #8]
	strd	r12, r7, [r4]
	cmp	r6, #1
	mov.w	r8, #0
	bge	.LBB85_8
	b	.LBB85_26
	.p2align	2
.LBB85_7:
	ldr.w	r12, [r4]
	cmp	r6, #1
	mov.w	r8, #0
	blt	.LBB85_26
.LBB85_8:
	cmp	r3, #1
	mov.w	r5, #0
	blt	.LBB85_27
@ %bb.9:
	movs	r0, #0
	movs	r7, #0
	.p2align	2
.LBB85_10:                              @ =>This Inner Loop Header: Depth=1
	ldr.w	r4, [lr]
	ldrb	r4, [r4, r7]
	cmp	r4, #126
	beq	.LBB85_13
@ %bb.11:                               @   in Loop: Header=BB85_10 Depth=1
	cmp	r4, #35
	bne	.LBB85_14
@ %bb.12:                               @   in Loop: Header=BB85_10 Depth=1
	adds	r0, #1
.LBB85_13:                              @   in Loop: Header=BB85_10 Depth=1
	adds	r7, #1
	cmp	r7, r6
	blt	.LBB85_15
	b	.LBB85_16
	.p2align	2
.LBB85_14:                              @   in Loop: Header=BB85_10 Depth=1
	strb.w	r4, [r12, r5]
	ldr.w	r6, [lr, #4]
	adds	r5, #1
	adds	r7, #1
	cmp	r7, r6
	bge	.LBB85_16
.LBB85_15:                              @   in Loop: Header=BB85_10 Depth=1
	cmp	r0, r3
	blt	.LBB85_10
.LBB85_16:
	cbz	r5, .LBB85_26
@ %bb.17:
	sub.w	r0, r12, #2
.LBB85_18:                              @ =>This Inner Loop Header: Depth=1
	adds	r3, r0, r5
	ldrb	r7, [r3, #1]
	cmp	r7, #32
	bne	.LBB85_27
@ %bb.19:                               @   in Loop: Header=BB85_18 Depth=1
	cmp	r5, #1
	beq	.LBB85_26
@ %bb.20:                               @   in Loop: Header=BB85_18 Depth=1
	ldrb	r7, [r0, r5]
	cmp	r7, #32
	bne	.LBB85_28
@ %bb.21:                               @   in Loop: Header=BB85_18 Depth=1
	cmp	r5, #2
	beq	.LBB85_26
@ %bb.22:                               @   in Loop: Header=BB85_18 Depth=1
	ldrb	r7, [r3, #-1]
	cmp	r7, #32
	bne	.LBB85_29
@ %bb.23:                               @   in Loop: Header=BB85_18 Depth=1
	cmp	r5, #3
	beq	.LBB85_26
@ %bb.24:                               @   in Loop: Header=BB85_18 Depth=1
	ldrb	r3, [r3, #-2]
	cmp	r3, #32
	bne	.LBB85_30
@ %bb.25:                               @   in Loop: Header=BB85_18 Depth=1
	subs	r5, #4
	bne	.LBB85_18
.LBB85_26:
	movs	r5, #0
.LBB85_27:
	mov	r0, r1
	mov	r1, r12
	movs	r3, #0
	strb.w	r8, [r12, r5]
	pop.w	{r4, r5, r6, r7, r8, r9, r10, lr}
	b	credits_private_canvas60_line
	.p2align	2
.LBB85_28:
	subs	r5, #1
	b	.LBB85_27
	.p2align	2
.LBB85_29:
	subs	r5, #2
	b	.LBB85_27
	.p2align	2
.LBB85_30:
	subs	r5, #3
	b	.LBB85_27
	.p2align	2
.LBB85_31:
	movw	r0, :lower16:.L.str.2
	movt	r0, :upper16:.L.str.2
	bl	credits_private_credits_fail
	.p2align	2
.LBB85_32:
	movw	r0, :lower16:.L.str.1
	movt	r0, :upper16:.L.str.1
	bl	credits_private_credits_fail
.Lfunc_end85:
	.size	credits_private_text60_emit_words, .Lfunc_end85-credits_private_text60_emit_words
	.cantunwind
	.fnend
                                        @ -- End function
	.globl	credits_time_from_counter       @ -- Begin function credits_time_from_counter
	.p2align	1
	.prefalign	2, .Lfunc_end86, nop
	.type	credits_time_from_counter,%function
	.code	16
	.thumb_func
credits_time_from_counter:              @ @credits_time_from_counter
	.fnstart
@ %bb.0:
	.save	{r4, r5, r6, lr}
	push	{r4, r5, r6, lr}
	cbz	r2, .LBB86_3
@ %bb.1:
	movs	r3, #0
	mov	r4, r2
	mov	r5, r0
	bl	__aeabi_uldivmod
	mov	r6, r0
	subs.w	r0, r0, #-2147483648
	sbcs	r0, r1, #0
	bhs	.LBB86_4
@ %bb.2:
	mls	r1, r6, r4, r5
	movs	r0, #0
	mov	r2, r4
	movs	r3, #0
	bl	__aeabi_uldivmod
	add	r1, r6
	pop	{r4, r5, r6, pc}
	.p2align	2
.LBB86_3:
	movw	r0, :lower16:.L.str.70
	movt	r0, :upper16:.L.str.70
	bl	credits_private_credits_fail
	.p2align	2
.LBB86_4:
	movw	r0, :lower16:.L.str.71
	movt	r0, :upper16:.L.str.71
	bl	credits_private_credits_fail
.Lfunc_end86:
	.size	credits_time_from_counter, .Lfunc_end86-credits_time_from_counter
	.cantunwind
	.fnend
                                        @ -- End function
	.globl	credits_animator_init           @ -- Begin function credits_animator_init
	.p2align	1
	.prefalign	2, .Lfunc_end87, nop
	.type	credits_animator_init,%function
	.code	16
	.thumb_func
credits_animator_init:                  @ @credits_animator_init
	.fnstart
@ %bb.0:
	.save	{r4, r5, r6, r7, r8, lr}
	push.w	{r4, r5, r6, r7, r8, lr}
	.pad	#8
	sub	sp, #8
	mov	r4, r0
	cmp	r0, #0
	mov.w	r0, #1
	it	ne
	cmpne	r1, #0
	bne	.LBB87_2
.LBB87_1:
	add	sp, #8
	pop.w	{r4, r5, r6, r7, r8, pc}
	.p2align	2
.LBB87_2:
	ldr	r6, [r1, #8]
	cmp	r6, #1
	blt	.LBB87_1
@ %bb.3:
	cmp	r3, #0
	bmi	.LBB87_1
@ %bb.4:
	cmp	r6, #6
	bhi	.LBB87_1
@ %bb.5:
	ldrd	lr, r5, [r1]
	movw	r0, #34728
	adds	r6, r4, r0
	mov	r0, r4
	mov	r8, r2
	mov	r2, lr
	mov	r7, r3
	mov	r3, r5
	mov	r5, r1
	bl	credits_private_credits_init
	movw	r0, #30544
	ldr	r2, [r5, #8]
	add	r0, r4
	mov	r1, r4
	strd	r8, r7, [sp]
	bl	credits_private_fixed_player_init
	movw	r0, #30616
	add	r0, r4
	mov.w	r1, #4096
	bl	__aeabi_memclr8
	movw	r0, #34712
	ldm.w	r5, {r2, r3, r7}
	ldr	r5, [r5, #12]
	adds	r1, r4, r0
	str	r2, [r4, r0]
	strd	r3, r7, [r1, #4]
	str	r5, [r1, #12]
	movs	r0, #0
	movs	r1, #1
	strd	r0, r0, [r6]
	strd	r0, r1, [r6, #8]
	strd	r1, r0, [r6, #16]
	add	sp, #8
	pop.w	{r4, r5, r6, r7, r8, pc}
.Lfunc_end87:
	.size	credits_animator_init, .Lfunc_end87-credits_animator_init
	.cantunwind
	.fnend
                                        @ -- End function
	.globl	credits_animator_sync           @ -- Begin function credits_animator_sync
	.p2align	1
	.prefalign	2, .Lfunc_end88, nop
	.type	credits_animator_sync,%function
	.code	16
	.thumb_func
credits_animator_sync:                  @ @credits_animator_sync
	.fnstart
@ %bb.0:
	.save	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	push.w	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	.pad	#20
	sub	sp, #20
	mov	r7, r1
	movs	r1, #48
	mov	r9, r3
	mov	r8, r2
	mov	r4, r0
	bl	__aeabi_memclr8
	mvn	r0, #-2147483648
	mov.w	r1, #-1
	strd	r1, r0, [r4, #32]
	cbz	r7, .LBB88_5
@ %bb.1:
	movw	r0, #34724
	adds	r6, r7, r0
	ldr	r0, [r6, #16]
	cbz	r0, .LBB88_5
@ %bb.2:
	movw	r0, #30552
	adds	r5, r7, r0
	ldrd	r0, r2, [r5]
	ldr	r1, [sp, #60]
	strd	r0, r2, [r4, #24]
	ldr	r0, [r6, #24]
	ldr	r2, [r5, #44]
	orrs.w	r3, r1, r9
	str	r0, [r4, #8]
	str	r2, [r4, #16]
	bmi	.LBB88_4
@ %bb.3:
	ldrd	r2, r3, [r5, #8]
	subs.w	r2, r8, r2
	sbcs.w	r2, r9, r3
	bge	.LBB88_6
.LBB88_4:
	movs	r0, #2
	str	r0, [r4]
	add	sp, #20
	pop.w	{r4, r5, r6, r7, r8, r9, r10, r11, pc}
	.p2align	2
.LBB88_5:
	movs	r0, #1
	str	r0, [r4]
	add	sp, #20
	pop.w	{r4, r5, r6, r7, r8, r9, r10, r11, pc}
	.p2align	2
.LBB88_6:
	cbz	r0, .LBB88_8
.LBB88_7:
	add	sp, #20
	pop.w	{r4, r5, r6, r7, r8, r9, r10, r11, pc}
	.p2align	2
.LBB88_8:
	ldrd	r3, r12, [sp, #64]
	ldr.w	lr, [sp, #56]
	movw	r0, #30544
	movw	r2, #6508
	ldrd	r10, r11, [r5, #16]
	add	r0, r7
	str	r3, [sp, #8]
	str	r2, [sp, #16]
	mov	r2, r8
	mov	r3, r9
	strd	lr, r1, [sp]
	str.w	r12, [sp, #12]
	bl	credits_private_fixed_player_sync
	ldrd	r1, r2, [r5, #16]
	eor.w	r2, r2, r11
	eor.w	r1, r1, r10
	orrs	r1, r2
	it	ne
	movne	r1, #1
	str	r1, [r4, #12]
	cbnz	r0, .LBB88_10
@ %bb.9:
	ldr	r0, [r6, #20]
	cbz	r0, .LBB88_11
.LBB88_10:
	movw	r0, #30616
	ldr	r2, [r6]
	add	r0, r7
	add.w	r1, r7, #24
	bl	credits_private_framebuffer_render_grid
	ldrd	r1, r2, [r6, #4]
	str	r0, [r6, #12]
	adds	r0, r1, #1
	adc	r1, r2, #0
	strd	r0, r1, [r6, #4]
	movs	r0, #0
	str	r0, [r6, #20]
	movs	r0, #1
	str	r0, [r4, #4]
.LBB88_11:
	ldrd	r1, r0, [r5]
	ldrd	lr, r12, [r5, #24]
	ldr.w	r10, [r5, #44]
	ldr	r5, [r5, #56]
	subs.w	r3, r1, lr
	sbc.w	r2, r0, r12
	strd	r1, r0, [r4, #24]
	str.w	r10, [r4, #16]
	strd	r3, r2, [r4, #40]
	cbz	r5, .LBB88_16
@ %bb.12:
	movw	r2, #7376
	add	r2, r7
	ldr	r2, [r2]
	movw	r3, #6507
	cmp	r2, r3
	mov.w	r2, #0
	it	gt
	movgt	r2, #1
	str	r2, [r6, #24]
	str	r2, [r4, #8]
	bgt	.LBB88_7
@ %bb.13:
	cmp.w	r10, #0
	bne	.LBB88_7
@ %bb.14:
	subs.w	r1, lr, r1
	sbcs.w	r0, r12, r0
	it	mi
	movmi	r1, #0
	bic.w	r0, r0, r0, asr #31
	mvns	r2, r1
	mvn	r3, #-2147483648
	eors	r3, r0
	subs.w	r2, r8, r2
	sbcs.w	r2, r9, r3
	bge	.LBB88_7
@ %bb.15:
	adds.w	r1, r1, r8
	adc.w	r0, r0, r9
	adds	r1, #1
	adc	r0, r0, #0
	strd	r1, r0, [r4, #32]
	add	sp, #20
	pop.w	{r4, r5, r6, r7, r8, r9, r10, r11, pc}
	.p2align	2
.LBB88_16:
	movs	r0, #1
	str	r0, [r6, #24]
	str	r0, [r4, #8]
	add	sp, #20
	pop.w	{r4, r5, r6, r7, r8, r9, r10, r11, pc}
.Lfunc_end88:
	.size	credits_animator_sync, .Lfunc_end88-credits_animator_sync
	.cantunwind
	.fnend
                                        @ -- End function
	.globl	credits_animator_update         @ -- Begin function credits_animator_update
	.p2align	1
	.prefalign	2, .Lfunc_end89, nop
	.type	credits_animator_update,%function
	.code	16
	.thumb_func
credits_animator_update:                @ @credits_animator_update
	.fnstart
@ %bb.0:
	.save	{r4, r5, r6, r7, r8, lr}
	push.w	{r4, r5, r6, r7, r8, lr}
	.pad	#16
	sub	sp, #16
	cbz	r1, .LBB89_6
@ %bb.1:
	movw	r6, #34740
	add	r6, r1
	ldr	r6, [r6]
	cbz	r6, .LBB89_6
@ %bb.2:
	cmp	r3, #0
	bmi	.LBB89_5
@ %bb.3:
	movw	r6, #30552
	add.w	r12, r1, r6
	ldrd	r5, r6, [r12, #8]
	subs	r4, r2, r5
	sbcs.w	r4, r3, r6
	blt	.LBB89_5
@ %bb.4:
	ldrd	r4, lr, [r12]
	subs.w	r8, r2, r5
	mvn	r7, #-2147483648
	mvn.w	r5, r4
	sbc.w	r6, r3, r6
	eor.w	r7, r7, lr
	subs.w	r5, r5, r8
	sbcs.w	r5, r7, r6
	bge	.LBB89_8
.LBB89_5:
	movs	r1, #2
	b	.LBB89_7
	.p2align	2
.LBB89_6:
	movs	r1, #1
.LBB89_7:
	movs	r2, #0
	str	r1, [r0]
	mvn	r1, #-2147483648
	mov.w	r3, #-1
	str	r2, [r0, #4]
	str	r2, [r0, #8]
	str	r2, [r0, #12]
	str	r2, [r0, #16]
	str	r2, [r0, #20]
	str	r2, [r0, #24]
	str	r2, [r0, #28]
	str	r3, [r0, #32]
	str	r1, [r0, #36]
	str	r2, [r0, #40]
	str	r2, [r0, #44]
	add	sp, #16
	pop.w	{r4, r5, r6, r7, r8, pc}
	.p2align	2
.LBB89_8:
	ldr.w	r7, [r12, #44]
	adds.w	r5, r4, r8
	adc.w	r6, r6, lr
	cmp	r7, #0
	itt	ne
	movne	r5, r4
	movne	r6, lr
	movs	r7, #1
	movs	r4, #0
	strd	r5, r6, [sp]
	strd	r4, r7, [sp, #8]
	bl	credits_animator_sync
	add	sp, #16
	pop.w	{r4, r5, r6, r7, r8, pc}
.Lfunc_end89:
	.size	credits_animator_update, .Lfunc_end89-credits_animator_update
	.cantunwind
	.fnend
                                        @ -- End function
	.globl	credits_animator_frame          @ -- Begin function credits_animator_frame
	.p2align	1
	.prefalign	2, .Lfunc_end90, nop
	.type	credits_animator_frame,%function
	.code	16
	.thumb_func
credits_animator_frame:                 @ @credits_animator_frame
	.fnstart
@ %bb.0:
	movs	r2, #0
	strd	r2, r2, [r0]
	strd	r2, r2, [r0, #8]
	strd	r2, r2, [r0, #16]
	str	r2, [r0, #24]
	str	r2, [r0, #28]
	cbz	r1, .LBB90_3
@ %bb.1:
	movw	r2, #34728
	add	r2, r1
	ldr	r3, [r2, #12]
	cmp	r3, #0
	it	eq
	bxeq	lr
.LBB90_2:
	.save	{r4, r5, r7, lr}
	push	{r4, r5, r7, lr}
	movw	r3, #30616
	add	r1, r3
	ldrd	r2, r3, [r2]
	mov.w	lr, #128
	movs	r4, #32
	mov.w	r5, #4096
	mov.w	r12, #256
	stm.w	r0, {r1, r12, lr}
	strd	r4, r5, [r0, #12]
	strd	r2, r3, [r0, #24]
	pop.w	{r4, r5, r7, lr}
.LBB90_3:
	bx	lr
.Lfunc_end90:
	.size	credits_animator_frame, .Lfunc_end90-credits_animator_frame
	.cantunwind
	.fnend
                                        @ -- End function
	.globl	credits_animator_stats          @ -- Begin function credits_animator_stats
	.p2align	1
	.prefalign	2, .Lfunc_end91, nop
	.type	credits_animator_stats,%function
	.code	16
	.thumb_func
credits_animator_stats:                 @ @credits_animator_stats
	.fnstart
@ %bb.0:
	.save	{r4, r5, r6, r7, lr}
	push	{r4, r5, r6, r7, lr}
	.pad	#4
	sub	sp, #4
	mov	r5, r1
	movs	r1, #36
	mov	r4, r0
	bl	__aeabi_memclr4
	cbz	r5, .LBB91_3
@ %bb.1:
	movw	r0, #34736
	add	r0, r5
	ldr	r1, [r0, #4]
	cbz	r1, .LBB91_3
@ %bb.2:
	movw	r1, #10136
	movw	r2, #4824
	add	r1, r5
	add	r2, r5
	ldr.w	r12, [r5]
	ldrd	r5, r3, [r5, #16]
	ldr	r1, [r1]
	ldrd	lr, r6, [r2]
	ldr	r0, [r0]
	ldr.w	r2, [r2, #2552]
	movw	r7, #34752
	strd	r7, r5, [r4]
	strd	r3, r12, [r4, #8]
	strd	r1, lr, [r4, #16]
	strd	r6, r0, [r4, #24]
	str	r2, [r4, #32]
.LBB91_3:
	add	sp, #4
	pop	{r4, r5, r6, r7, pc}
.Lfunc_end91:
	.size	credits_animator_stats, .Lfunc_end91-credits_animator_stats
	.cantunwind
	.fnend
                                        @ -- End function
	.globl	credits_animator_set_uppercase  @ -- Begin function credits_animator_set_uppercase
	.p2align	1
	.prefalign	2, .Lfunc_end92, nop
	.type	credits_animator_set_uppercase,%function
	.code	16
	.thumb_func
credits_animator_set_uppercase:         @ @credits_animator_set_uppercase
	.fnstart
@ %bb.0:
	cmp	r0, #0
	it	eq
	bxeq	lr
.LBB92_1:
	movw	r2, #34724
	add	r0, r2
	ldr	r2, [r0, #16]
	cbz	r2, .LBB92_3
@ %bb.2:
	ldr	r2, [r0]
	cmp	r1, #0
	it	ne
	movne	r1, #1
	cmp	r2, r1
	ittt	ne
	strne	r1, [r0]
	movne	r1, #1
	strne	r1, [r0, #20]
.LBB92_3:
	bx	lr
.Lfunc_end92:
	.size	credits_animator_set_uppercase, .Lfunc_end92-credits_animator_set_uppercase
	.cantunwind
	.fnend
                                        @ -- End function
	.globl	credits_animator_destroy        @ -- Begin function credits_animator_destroy
	.p2align	1
	.prefalign	2, .Lfunc_end93, nop
	.type	credits_animator_destroy,%function
	.code	16
	.thumb_func
credits_animator_destroy:               @ @credits_animator_destroy
	.fnstart
@ %bb.0:
	cmp	r0, #0
	it	eq
	bxeq	lr
.LBB93_1:
	.save	{r4, r5, r6, lr}
	push	{r4, r5, r6, lr}
	movw	r1, #34740
	adds	r5, r0, r1
	ldr	r1, [r5]
	cbz	r1, .LBB93_3
@ %bb.2:
	movw	r1, #9960
	adds	r6, r0, r1
	movw	r1, #7668
	add	r1, r0
	mov	r4, r0
	mov	r0, r1
	mov	r1, r4
	bl	credits_private_data_destroy
	ldr	r2, [r6, #8]
	ldr	r3, [r6, #24]
	ldr	r0, [r6, #40]
	add	r2, r3
	ldr.w	r12, [r4]
	add	r0, r2
	ldr.w	lr, [r6, #172]
	sub.w	r0, r0, r0, lsl #2
	add.w	r0, r12, r0, lsl #2
	movs	r1, #0
	sub.w	r0, r0, lr
	str	r1, [r6]
	strd	r1, r1, [r6, #4]
	strd	r1, r1, [r6, #16]
	str	r1, [r6, #24]
	strd	r1, r1, [r6, #32]
	str	r1, [r6, #40]
	str	r0, [r4]
	strd	r1, r1, [r6, #168]
	str	r1, [r5]
.LBB93_3:
	pop.w	{r4, r5, r6, lr}
	bx	lr
.Lfunc_end93:
	.size	credits_animator_destroy, .Lfunc_end93-credits_animator_destroy
	.cantunwind
	.fnend
                                        @ -- End function
	.type	.L.str,%object                  @ @.str
	.section	.rodata.str1.1,"aMS",%progbits,1
.L.str:
	.asciz	"credits: %s\n"
	.size	.L.str, 13

	.type	.L.str.1,%object                @ @.str.1
.L.str.1:
	.asciz	"native storage capacity exceeded"
	.size	.L.str.1, 33

	.type	.L.str.2,%object                @ @.str.2
.L.str.2:
	.asciz	"native workspace exhausted"
	.size	.L.str.2, 27

	.type	.L.str.3,%object                @ @.str.3
.L.str.3:
	.asciz	"getrandbits supports 0..64 bits"
	.size	.L.str.3, 32

	.type	.L.str.4,%object                @ @.str.4
.L.str.4:
	.asciz	"random scale range"
	.size	.L.str.4, 19

	.type	.L.str.5,%object                @ @.str.5
.L.str.5:
	.asciz	"empty randrange"
	.size	.L.str.5, 16

	.type	.L.str.6,%object                @ @.str.6
.L.str.6:
	.asciz	"empty randint"
	.size	.L.str.6, 14

	.type	.L.str.7,%object                @ @.str.7
.L.str.7:
	.asciz	"unknown scene"
	.size	.L.str.7, 14

	.type	.L.str.8,%object                @ @.str.8
.L.str.8:
	.asciz	"active scene capacity exceeded"
	.size	.L.str.8, 31

	.type	.L.str.9,%object                @ @.str.9
.L.str.9:
	.asciz	"wipe"
	.size	.L.str.9, 5

	.type	credits_private_data_starts_wipe,%object @ @credits_private_data_starts_wipe
	.section	.rodata,"a",%progbits
	.p2align	2, 0x0
credits_private_data_starts_wipe:
	.zero	4
	.size	credits_private_data_starts_wipe, 4

	.type	.L.str.10,%object               @ @.str.10
	.section	.rodata.str1.1,"aMS",%progbits,1
.L.str.10:
	.asciz	"clear_wipe"
	.size	.L.str.10, 11

	.type	credits_private_data_starts_clear_wipe,%object @ @credits_private_data_starts_clear_wipe
	.section	.rodata,"a",%progbits
	.p2align	2, 0x0
credits_private_data_starts_clear_wipe:
	.zero	4
	.size	credits_private_data_starts_clear_wipe, 4

	.type	.L.str.11,%object               @ @.str.11
	.section	.rodata.str1.1,"aMS",%progbits,1
.L.str.11:
	.asciz	"clear"
	.size	.L.str.11, 6

	.type	credits_private_data_starts_clear,%object @ @credits_private_data_starts_clear
	.section	.rodata,"a",%progbits
	.p2align	2, 0x0
credits_private_data_starts_clear:
	.zero	4
	.size	credits_private_data_starts_clear, 4

	.type	.L.str.12,%object               @ @.str.12
	.section	.rodata.str1.1,"aMS",%progbits,1
.L.str.12:
	.asciz	"ocean_b"
	.size	.L.str.12, 8

	.type	credits_private_data_starts_ocean_b,%object @ @credits_private_data_starts_ocean_b
	.section	.rodata,"a",%progbits
	.p2align	2, 0x0
credits_private_data_starts_ocean_b:
	.zero	8
	.size	credits_private_data_starts_ocean_b, 8

	.type	.L.str.13,%object               @ @.str.13
	.section	.rodata.str1.1,"aMS",%progbits,1
.L.str.13:
	.asciz	"ocean_c"
	.size	.L.str.13, 8

	.type	credits_private_data_starts_ocean_c,%object @ @credits_private_data_starts_ocean_c
	.section	.rodata,"a",%progbits
	.p2align	2, 0x0
credits_private_data_starts_ocean_c:
	.zero	20
	.size	credits_private_data_starts_ocean_c, 20

	.type	.L.str.14,%object               @ @.str.14
	.section	.rodata.str1.1,"aMS",%progbits,1
.L.str.14:
	.asciz	"ocean_d"
	.size	.L.str.14, 8

	.type	credits_private_data_starts_ocean_d,%object @ @credits_private_data_starts_ocean_d
	.section	.rodata,"a",%progbits
	.p2align	2, 0x0
credits_private_data_starts_ocean_d:
	.zero	8
	.size	credits_private_data_starts_ocean_d, 8

	.type	.L.str.15,%object               @ @.str.15
	.section	.rodata.str1.1,"aMS",%progbits,1
.L.str.15:
	.asciz	"typewrite"
	.size	.L.str.15, 10

	.type	credits_private_data_starts_typewrite,%object @ @credits_private_data_starts_typewrite
	.section	.rodata,"a",%progbits
	.p2align	2, 0x0
credits_private_data_starts_typewrite:
	.zero	4
	.size	credits_private_data_starts_typewrite, 4

	.type	.L.str.16,%object               @ @.str.16
	.section	.rodata.str1.1,"aMS",%progbits,1
.L.str.16:
	.asciz	"title"
	.size	.L.str.16, 6

	.type	credits_private_data_starts_title,%object @ @credits_private_data_starts_title
	.section	.rodata,"a",%progbits
	.p2align	2, 0x0
credits_private_data_starts_title:
	.long	64                              @ 0x40
	.long	128                             @ 0x80
	.long	192                             @ 0xc0
	.long	256                             @ 0x100
	.long	320                             @ 0x140
	.long	384                             @ 0x180
	.long	448                             @ 0x1c0
	.long	512                             @ 0x200
	.long	576                             @ 0x240
	.long	640                             @ 0x280
	.long	704                             @ 0x2c0
	.long	768                             @ 0x300
	.size	credits_private_data_starts_title, 48

	.type	.L.str.17,%object               @ @.str.17
	.section	.rodata.str1.1,"aMS",%progbits,1
.L.str.17:
	.asciz	"beats"
	.size	.L.str.17, 6

	.type	credits_private_data_starts_beats,%object @ @credits_private_data_starts_beats
	.section	.rodata,"a",%progbits
	.p2align	2, 0x0
credits_private_data_starts_beats:
	.zero	8
	.size	credits_private_data_starts_beats, 8

	.type	.L.str.18,%object               @ @.str.18
	.section	.rodata.str1.1,"aMS",%progbits,1
.L.str.18:
	.asciz	"beats_lr"
	.size	.L.str.18, 9

	.type	credits_private_data_starts_beats_lr,%object @ @credits_private_data_starts_beats_lr
	.section	.rodata,"a",%progbits
	.p2align	2, 0x0
credits_private_data_starts_beats_lr:
	.zero	8
	.size	credits_private_data_starts_beats_lr, 8

	.type	.L.str.19,%object               @ @.str.19
	.section	.rodata.str1.1,"aMS",%progbits,1
.L.str.19:
	.asciz	"funding"
	.size	.L.str.19, 8

	.type	credits_private_data_starts_funding,%object @ @credits_private_data_starts_funding
	.section	.rodata,"a",%progbits
	.p2align	2, 0x0
credits_private_data_starts_funding:
	.zero	8
	.size	credits_private_data_starts_funding, 8

	.type	.L.str.20,%object               @ @.str.20
	.section	.rodata.str1.1,"aMS",%progbits,1
.L.str.20:
	.asciz	"dates"
	.size	.L.str.20, 6

	.type	credits_private_data_starts_dates,%object @ @credits_private_data_starts_dates
	.section	.rodata,"a",%progbits
	.p2align	2, 0x0
credits_private_data_starts_dates:
	.long	0                               @ 0x0
	.long	512                             @ 0x200
	.long	764                             @ 0x2fc
	.long	772                             @ 0x304
	.long	1024                            @ 0x400
	.size	credits_private_data_starts_dates, 20

	.type	.L.str.21,%object               @ @.str.21
	.section	.rodata.str1.1,"aMS",%progbits,1
.L.str.21:
	.asciz	"weather"
	.size	.L.str.21, 8

	.type	credits_private_data_starts_weather,%object @ @credits_private_data_starts_weather
	.section	.rodata,"a",%progbits
	.p2align	2, 0x0
credits_private_data_starts_weather:
	.long	0                               @ 0x0
	.long	512                             @ 0x200
	.long	764                             @ 0x2fc
	.long	772                             @ 0x304
	.long	1024                            @ 0x400
	.size	credits_private_data_starts_weather, 20

	.type	.L.str.22,%object               @ @.str.22
	.section	.rodata.str1.1,"aMS",%progbits,1
.L.str.22:
	.asciz	"redraw_ui"
	.size	.L.str.22, 10

	.type	credits_private_data_starts_redraw_ui,%object @ @credits_private_data_starts_redraw_ui
	.section	.rodata,"a",%progbits
	.p2align	2, 0x0
credits_private_data_starts_redraw_ui:
	.zero	32
	.size	credits_private_data_starts_redraw_ui, 32

	.type	.L.str.23,%object               @ @.str.23
	.section	.rodata.str1.1,"aMS",%progbits,1
.L.str.23:
	.asciz	"loadingbar"
	.size	.L.str.23, 11

	.type	credits_private_data_starts_loadingbar,%object @ @credits_private_data_starts_loadingbar
	.section	.rodata,"a",%progbits
	.p2align	2, 0x0
credits_private_data_starts_loadingbar:
	.long	0                               @ 0x0
	.long	1                               @ 0x1
	.long	0                               @ 0x0
	.long	240                             @ 0xf0
	.long	0                               @ 0x0
	.long	240                             @ 0xf0
	.long	0                               @ 0x0
	.size	credits_private_data_starts_loadingbar, 28

	.type	.L.str.24,%object               @ @.str.24
	.section	.rodata.str1.1,"aMS",%progbits,1
.L.str.24:
	.asciz	"fastload"
	.size	.L.str.24, 9

	.type	credits_private_data_starts_fastload,%object @ @credits_private_data_starts_fastload
	.section	.rodata,"a",%progbits
	.p2align	2, 0x0
credits_private_data_starts_fastload:
	.long	0                               @ 0x0
	.long	1                               @ 0x1
	.long	0                               @ 0x0
	.long	0                               @ 0x0
	.size	credits_private_data_starts_fastload, 16

	.type	.L.str.25,%object               @ @.str.25
	.section	.rodata.str1.1,"aMS",%progbits,1
.L.str.25:
	.asciz	"error"
	.size	.L.str.25, 6

	.type	credits_private_data_starts_error,%object @ @credits_private_data_starts_error
	.section	.rodata,"a",%progbits
	.p2align	2, 0x0
credits_private_data_starts_error:
	.zero	8
	.size	credits_private_data_starts_error, 8

	.type	.L.str.26,%object               @ @.str.26
	.section	.rodata.str1.1,"aMS",%progbits,1
.L.str.26:
	.asciz	"fundingx2"
	.size	.L.str.26, 10

	.type	credits_private_data_starts_fundingx2,%object @ @credits_private_data_starts_fundingx2
	.section	.rodata,"a",%progbits
	.p2align	2, 0x0
credits_private_data_starts_fundingx2:
	.zero	16
	.size	credits_private_data_starts_fundingx2, 16

	.type	.L.str.27,%object               @ @.str.27
	.section	.rodata.str1.1,"aMS",%progbits,1
.L.str.27:
	.asciz	"accesspoints"
	.size	.L.str.27, 13

	.type	credits_private_data_starts_accesspoints,%object @ @credits_private_data_starts_accesspoints
	.section	.rodata,"a",%progbits
	.p2align	2, 0x0
credits_private_data_starts_accesspoints:
	.long	0                               @ 0x0
	.long	20                              @ 0x14
	.long	0                               @ 0x0
	.long	80                              @ 0x50
	.long	968                             @ 0x3c8
	.size	credits_private_data_starts_accesspoints, 20

	.type	.L.str.28,%object               @ @.str.28
	.section	.rodata.str1.1,"aMS",%progbits,1
.L.str.28:
	.asciz	"fdg_single"
	.size	.L.str.28, 11

	.type	credits_private_data_starts_fdg_single,%object @ @credits_private_data_starts_fdg_single
	.section	.rodata,"a",%progbits
	.p2align	2, 0x0
credits_private_data_starts_fdg_single:
	.zero	8
	.size	credits_private_data_starts_fdg_single, 8

	.type	.L.str.29,%object               @ @.str.29
	.section	.rodata.str1.1,"aMS",%progbits,1
.L.str.29:
	.asciz	"fdg_down"
	.size	.L.str.29, 9

	.type	credits_private_data_starts_fdg_down,%object @ @credits_private_data_starts_fdg_down
	.section	.rodata,"a",%progbits
	.p2align	2, 0x0
credits_private_data_starts_fdg_down:
	.zero	8
	.size	credits_private_data_starts_fdg_down, 8

	.type	.L.str.30,%object               @ @.str.30
	.section	.rodata.str1.1,"aMS",%progbits,1
.L.str.30:
	.asciz	"poweroff"
	.size	.L.str.30, 9

	.type	credits_private_data_starts_poweroff,%object @ @credits_private_data_starts_poweroff
	.section	.rodata,"a",%progbits
	.p2align	2, 0x0
credits_private_data_starts_poweroff:
	.long	3                               @ 0x3
	.long	2                               @ 0x2
	.long	1                               @ 0x1
	.long	0                               @ 0x0
	.size	credits_private_data_starts_poweroff, 16

	.type	credits_private_scene_definitions,%object @ @credits_private_scene_definitions
	.globl	credits_private_scene_definitions
	.p2align	2, 0x0
credits_private_scene_definitions:
	.long	.L.str.9
	.long	1                               @ 0x1
	.long	credits_private_data_starts_wipe
	.long	.L.str.10
	.long	1                               @ 0x1
	.long	credits_private_data_starts_clear_wipe
	.long	.L.str.11
	.long	1                               @ 0x1
	.long	credits_private_data_starts_clear
	.long	.L.str.12
	.long	2                               @ 0x2
	.long	credits_private_data_starts_ocean_b
	.long	.L.str.13
	.long	5                               @ 0x5
	.long	credits_private_data_starts_ocean_c
	.long	.L.str.14
	.long	2                               @ 0x2
	.long	credits_private_data_starts_ocean_d
	.long	.L.str.15
	.long	1                               @ 0x1
	.long	credits_private_data_starts_typewrite
	.long	.L.str.16
	.long	12                              @ 0xc
	.long	credits_private_data_starts_title
	.long	.L.str.17
	.long	2                               @ 0x2
	.long	credits_private_data_starts_beats
	.long	.L.str.18
	.long	2                               @ 0x2
	.long	credits_private_data_starts_beats_lr
	.long	.L.str.19
	.long	2                               @ 0x2
	.long	credits_private_data_starts_funding
	.long	.L.str.20
	.long	5                               @ 0x5
	.long	credits_private_data_starts_dates
	.long	.L.str.21
	.long	5                               @ 0x5
	.long	credits_private_data_starts_weather
	.long	.L.str.22
	.long	8                               @ 0x8
	.long	credits_private_data_starts_redraw_ui
	.long	.L.str.23
	.long	7                               @ 0x7
	.long	credits_private_data_starts_loadingbar
	.long	.L.str.24
	.long	4                               @ 0x4
	.long	credits_private_data_starts_fastload
	.long	.L.str.25
	.long	2                               @ 0x2
	.long	credits_private_data_starts_error
	.long	.L.str.26
	.long	4                               @ 0x4
	.long	credits_private_data_starts_fundingx2
	.long	.L.str.27
	.long	5                               @ 0x5
	.long	credits_private_data_starts_accesspoints
	.long	.L.str.28
	.long	2                               @ 0x2
	.long	credits_private_data_starts_fdg_single
	.long	.L.str.29
	.long	2                               @ 0x2
	.long	credits_private_data_starts_fdg_down
	.long	.L.str.30
	.long	4                               @ 0x4
	.long	credits_private_data_starts_poweroff
	.size	credits_private_scene_definitions, 264

	.type	credits_private_corrupt_text.replacements,%object @ @credits_private_corrupt_text.replacements
	.section	.rodata.str1.1,"aMS",%progbits,1
credits_private_corrupt_text.replacements:
	.asciz	"...  `=/?-$%"
	.size	credits_private_corrupt_text.replacements, 13

	.type	.L.str.31,%object               @ @.str.31
.L.str.31:
	.asciz	"@~\n"
	.size	.L.str.31, 4

	.type	credits_private_data_text_definitions,%object @ @credits_private_data_text_definitions
	.section	.rodata,"a",%progbits
	.p2align	2, 0x0
credits_private_data_text_definitions:
	.long	.L.str.93
	.long	credits_private_data_segments_ocean_b_0
	.long	1                               @ 0x1
	.long	0                               @ 0x0
	.long	1                               @ 0x1
	.long	242                             @ 0xf2
	.long	.L.str.94
	.long	credits_private_data_segments_ocean_b_1
	.long	1                               @ 0x1
	.long	0                               @ 0x0
	.long	1                               @ 0x1
	.long	324                             @ 0x144
	.long	.L.str.95
	.long	credits_private_data_segments_ocean_b_2
	.long	1                               @ 0x1
	.long	0                               @ 0x0
	.long	1                               @ 0x1
	.long	343                             @ 0x157
	.long	.L.str.96
	.long	credits_private_data_segments_ocean_b_3
	.long	1                               @ 0x1
	.long	0                               @ 0x0
	.long	1                               @ 0x1
	.long	137                             @ 0x89
	.long	.L.str.97
	.long	credits_private_data_segments_ocean_c_0
	.long	2                               @ 0x2
	.long	0                               @ 0x0
	.long	1                               @ 0x1
	.long	520                             @ 0x208
	.long	.L.str.98
	.long	credits_private_data_segments_ocean_c_1
	.long	2                               @ 0x2
	.long	0                               @ 0x0
	.long	1                               @ 0x1
	.long	520                             @ 0x208
	.long	.L.str.99
	.long	credits_private_data_segments_ocean_c_2
	.long	2                               @ 0x2
	.long	0                               @ 0x0
	.long	1                               @ 0x1
	.long	520                             @ 0x208
	.long	.L.str.100
	.long	credits_private_data_segments_ocean_c_3
	.long	2                               @ 0x2
	.long	0                               @ 0x0
	.long	1                               @ 0x1
	.long	520                             @ 0x208
	.long	.L.str.101
	.long	credits_private_data_segments_funding_0
	.long	1                               @ 0x1
	.long	1                               @ 0x1
	.long	2                               @ 0x2
	.long	711                             @ 0x2c7
	.long	.L.str.102
	.long	credits_private_data_segments_funding_1
	.long	7                               @ 0x7
	.long	1                               @ 0x1
	.long	1                               @ 0x1
	.long	1818                            @ 0x71a
	.long	.L.str.103
	.long	credits_private_data_segments_funding_2
	.long	1                               @ 0x1
	.long	1                               @ 0x1
	.long	1                               @ 0x1
	.long	395                             @ 0x18b
	.long	.L.str.104
	.long	credits_private_data_segments_fundingx2_0
	.long	1                               @ 0x1
	.long	1                               @ 0x1
	.long	1                               @ 0x1
	.long	1051                            @ 0x41b
	.long	.L.str.105
	.long	credits_private_data_segments_fundingx2_1
	.long	1                               @ 0x1
	.long	1                               @ 0x1
	.long	1                               @ 0x1
	.long	944                             @ 0x3b0
	.long	.L.str.106
	.long	credits_private_data_segments_fundingx2_2
	.long	1                               @ 0x1
	.long	1                               @ 0x1
	.long	1                               @ 0x1
	.long	871                             @ 0x367
	.long	.L.str.107
	.long	credits_private_data_segments_fdg_single_0
	.long	1                               @ 0x1
	.long	1                               @ 0x1
	.long	1                               @ 0x1
	.long	1810                            @ 0x712
	.long	.L.str.108
	.long	credits_private_data_segments_fdg_down_0
	.long	1                               @ 0x1
	.long	1                               @ 0x1
	.long	1                               @ 0x1
	.long	194                             @ 0xc2
	.long	.L.str.109
	.long	credits_private_data_segments_fdg_down_1
	.long	1                               @ 0x1
	.long	1                               @ 0x1
	.long	1                               @ 0x1
	.long	206                             @ 0xce
	.long	.L.str.110
	.long	credits_private_data_segments_fdg_down_2
	.long	1                               @ 0x1
	.long	1                               @ 0x1
	.long	1                               @ 0x1
	.long	206                             @ 0xce
	.size	credits_private_data_text_definitions, 432

	.type	.L.str.32,%object               @ @.str.32
	.section	.rodata.str1.1,"aMS",%progbits,1
.L.str.32:
	.asciz	"generated text size mismatch"
	.size	.L.str.32, 29

	.type	.L.str.33,%object               @ @.str.33
.L.str.33:
	.asciz	"generated line count mismatch"
	.size	.L.str.33, 30

	.type	.L.str.34,%object               @ @.str.34
.L.str.34:
	.asciz	"generator has no typewriter state"
	.size	.L.str.34, 34

	.type	.L.str.35,%object               @ @.str.35
.L.str.35:
	.asciz	"startup jump must be 1..6"
	.size	.L.str.35, 26

	.type	.L.str.36,%object               @ @.str.36
.L.str.36:
	.asciz	"jump only valid before playback"
	.size	.L.str.36, 32

	.type	.L.str.37,%object               @ @.str.37
.L.str.37:
	.asciz	"invalid typewriter state"
	.size	.L.str.37, 25

	.type	.L.str.38,%object               @ @.str.38
.L.str.38:
	.asciz	"[~~CLEAR|"
	.size	.L.str.38, 10

	.type	.L.str.39,%object               @ @.str.39
.L.str.39:
	.asciz	"%d"
	.size	.L.str.39, 3

	.type	.L.str.40,%object               @ @.str.40
.L.str.40:
	.asciz	"invalid word clear"
	.size	.L.str.40, 19

	.type	.L.str.41,%object               @ @.str.41
.L.str.41:
	.asciz	"\033[1m\033[34m"
	.size	.L.str.41, 10

	.type	.L.str.42,%object               @ @.str.42
.L.str.42:
	.asciz	"\033[1m\033[30m"
	.size	.L.str.42, 10

	.type	.L.str.43,%object               @ @.str.43
.L.str.43:
	.asciz	"\033[22m\033[35m"
	.size	.L.str.43, 11

	.type	.L.str.44,%object               @ @.str.44
.L.str.44:
	.asciz	"\033[1m\033[37m"
	.size	.L.str.44, 10

	.type	.L.str.45,%object               @ @.str.45
.L.str.45:
	.asciz	"\033[37m\033[1m"
	.size	.L.str.45, 10

	.type	.L.str.46,%object               @ @.str.46
.L.str.46:
	.asciz	"\033[30m\033[1m"
	.size	.L.str.46, 10

	.type	.L.str.47,%object               @ @.str.47
.L.str.47:
	.asciz	"\033[31m\033[22m"
	.size	.L.str.47, 11

	.type	.L.str.48,%object               @ @.str.48
.L.str.48:
	.asciz	"\033[36m\033[1m"
	.size	.L.str.48, 10

	.type	.L.str.49,%object               @ @.str.49
.L.str.49:
	.asciz	"\033[33m\033[1m"
	.size	.L.str.49, 10

	.type	.L.str.50,%object               @ @.str.50
.L.str.50:
	.asciz	"\033[33m\033[22m"
	.size	.L.str.50, 11

	.type	.L__const.credits_private_weather_init.values,%object @ @__const.credits_private_weather_init.values
	.section	.rodata,"a",%progbits
	.p2align	2, 0x0
.L__const.credits_private_weather_init.values:
	.long	0x3e4fdf3b                      @ float 0.202999994
	.long	0x422c0000                      @ float 43
	.long	0x41500000                      @ float 13
	.long	0x41c80000                      @ float 25
	.long	0x3f28f5c3                      @ float 0.660000026
	.long	6                               @ 0x6
	.long	2                               @ 0x2
	.long	0
	.long	0x3d23d70a                      @ float 0.0399999991
	.long	0x42500000                      @ float 52
	.long	0x41400000                      @ float 12
	.long	0x41c80000                      @ float 25
	.long	0x3dcccccd                      @ float 0.100000001
	.long	7                               @ 0x7
	.long	2                               @ 0x2
	.long	0
	.long	0x3d8f5c29                      @ float 0.0700000003
	.long	0x42400000                      @ float 48
	.long	0x41000000                      @ float 8
	.long	0x41a00000                      @ float 20
	.long	0x3dcccccd                      @ float 0.100000001
	.long	1                               @ 0x1
	.long	200                             @ 0xc8
	.long	0
	.long	0x3d8f5c29                      @ float 0.0700000003
	.long	0x42400000                      @ float 48
	.long	0x41000000                      @ float 8
	.long	0x41a00000                      @ float 20
	.long	0x3dcccccd                      @ float 0.100000001
	.long	1                               @ 0x1
	.long	728                             @ 0x2d8
	.long	0
	.long	0xbf800000                      @ float -1
	.long	0xbf800000                      @ float -1
	.long	0xbf800000                      @ float -1
	.long	0xbf800000                      @ float -1
	.long	0xbf800000                      @ float -1
	.long	4294967295                      @ 0xffffffff
	.long	2                               @ 0x2
	.long	0
	.size	.L__const.credits_private_weather_init.values, 160

	.type	.L.str.51,%object               @ @.str.51
	.section	.rodata.str1.1,"aMS",%progbits,1
.L.str.51:
	.asciz	"Connection lost...      "
	.size	.L.str.51, 25

	.type	.L__const.credits_private_credits_date.lengths,%object @ @__const.credits_private_credits_date.lengths
	.section	.rodata,"a",%progbits
	.p2align	2, 0x0
.L__const.credits_private_credits_date.lengths:
	.long	31                              @ 0x1f
	.long	28                              @ 0x1c
	.long	31                              @ 0x1f
	.long	30                              @ 0x1e
	.long	31                              @ 0x1f
	.long	30                              @ 0x1e
	.long	31                              @ 0x1f
	.long	31                              @ 0x1f
	.long	30                              @ 0x1e
	.long	31                              @ 0x1f
	.long	30                              @ 0x1e
	.long	31                              @ 0x1f
	.size	.L__const.credits_private_credits_date.lengths, 48

	.type	.L.str.52,%object               @ @.str.52
	.section	.rodata.str1.1,"aMS",%progbits,1
.L.str.52:
	.asciz	"%02d.%02d.%04d"
	.size	.L.str.52, 15

	.type	.L.str.53,%object               @ @.str.53
.L.str.53:
	.asciz	"%14s"
	.size	.L.str.53, 5

	.type	.L.str.54,%object               @ @.str.54
.L.str.54:
	.asciz	"\033[31m\033[1m"
	.size	.L.str.54, 10

	.type	.L__const.credits_private_credits_weather.colours,%object @ @__const.credits_private_credits_weather.colours
	.section	.rodata,"a",%progbits
	.p2align	2, 0x0
.L__const.credits_private_credits_weather.colours:
	.long	.L.str.45
	.long	.L.str.48
	.long	.L.str.49
	.long	.L.str.54
	.size	.L__const.credits_private_credits_weather.colours, 16

	.type	.L.str.55,%object               @ @.str.55
	.section	.rodata.str1.1,"aMS",%progbits,1
.L.str.55:
	.asciz	"temperature colour index"
	.size	.L.str.55, 25

	.type	.L.str.56,%object               @ @.str.56
.L.str.56:
	.asciz	"%2d\302\260F  "
	.size	.L.str.56, 9

	.type	.L.str.57,%object               @ @.str.57
.L.str.57:
	.asciz	"N "
	.size	.L.str.57, 3

	.type	.L.str.58,%object               @ @.str.58
.L.str.58:
	.asciz	"NE"
	.size	.L.str.58, 3

	.type	.L.str.59,%object               @ @.str.59
.L.str.59:
	.asciz	"E "
	.size	.L.str.59, 3

	.type	.L.str.60,%object               @ @.str.60
.L.str.60:
	.asciz	"SE"
	.size	.L.str.60, 3

	.type	.L.str.61,%object               @ @.str.61
.L.str.61:
	.asciz	"S "
	.size	.L.str.61, 3

	.type	.L.str.62,%object               @ @.str.62
.L.str.62:
	.asciz	"SW"
	.size	.L.str.62, 3

	.type	.L.str.63,%object               @ @.str.63
.L.str.63:
	.asciz	"W "
	.size	.L.str.63, 3

	.type	.L.str.64,%object               @ @.str.64
.L.str.64:
	.asciz	"NW"
	.size	.L.str.64, 3

	.type	.L__const.credits_private_credits_weather.directions,%object @ @__const.credits_private_credits_weather.directions
	.section	.rodata,"a",%progbits
	.p2align	2, 0x0
.L__const.credits_private_credits_weather.directions:
	.long	.L.str.57
	.long	.L.str.58
	.long	.L.str.59
	.long	.L.str.60
	.long	.L.str.61
	.long	.L.str.62
	.long	.L.str.63
	.long	.L.str.64
	.size	.L__const.credits_private_credits_weather.directions, 32

	.type	.L.str.65,%object               @ @.str.65
	.section	.rodata.str1.1,"aMS",%progbits,1
.L.str.65:
	.asciz	"wind direction index"
	.size	.L.str.65, 21

	.type	.L.str.66,%object               @ @.str.66
.L.str.66:
	.asciz	"Wind %2d mph %s"
	.size	.L.str.66, 16

	.type	.L.str.67,%object               @ @.str.67
	.section	.rodata.str1.4,"aMS",%progbits,1
	.p2align	2, 0x0
.L.str.67:
	.asciz	"Precipitation "
	.size	.L.str.67, 15

	.type	.L.str.68,%object               @ @.str.68
	.section	.rodata.str1.1,"aMS",%progbits,1
.L.str.68:
	.asciz	"\033[34m\033[1m"
	.size	.L.str.68, 10

	.type	.L.str.69,%object               @ @.str.69
.L.str.69:
	.asciz	"%d.%02d"
	.size	.L.str.69, 8

	.type	.L.str.70,%object               @ @.str.70
.L.str.70:
	.asciz	"zero time frequency"
	.size	.L.str.70, 20

	.type	.L.str.71,%object               @ @.str.71
.L.str.71:
	.asciz	"Q32.32 time range"
	.size	.L.str.71, 18

	.type	credits_private_fixed_player_init.amounts,%object @ @credits_private_fixed_player_init.amounts
	.section	.rodata,"a",%progbits
	.p2align	2, 0x0
credits_private_fixed_player_init.amounts:
	.long	0                               @ 0x0
	.long	1000                            @ 0x3e8
	.long	1770                            @ 0x6ea
	.long	3040                            @ 0xbe0
	.long	3780                            @ 0xec4
	.long	5420                            @ 0x152c
	.size	credits_private_fixed_player_init.amounts, 24

	.type	.L.str.72,%object               @ @.str.72
	.section	.rodata.str1.1,"aMS",%progbits,1
.L.str.72:
	.asciz	"negative clock"
	.size	.L.str.72, 15

	.type	.L.str.73,%object               @ @.str.73
.L.str.73:
	.asciz	"negative media clock"
	.size	.L.str.73, 21

	.type	.L.str.74,%object               @ @.str.74
.L.str.74:
	.asciz	"sine degree range"
	.size	.L.str.74, 18

	.type	credits_private_math_lookup_cos_units,%object @ @credits_private_math_lookup_cos_units
	.section	.rodata,"a",%progbits
	.p2align	2, 0x0
credits_private_math_lookup_cos_units:
	.long	0x3f800000                      @ float 1
	.long	0x3f7ff605                      @ float 0.99984771
	.long	0x3f7fd814                      @ float 0.99939084
	.long	0x3f7fa62f                      @ float 0.99862951
	.long	0x3f7f605c                      @ float 0.997564077
	.long	0x3f7f069e                      @ float 0.99619472
	.long	0x3f7e98fd                      @ float 0.994521915
	.long	0x3f7e1781                      @ float 0.992546141
	.long	0x3f7d8235                      @ float 0.990268051
	.long	0x3f7cd925                      @ float 0.987688362
	.long	0x3f7c1c5c                      @ float 0.984807729
	.size	credits_private_math_lookup_cos_units, 44

	.type	credits_private_math_lookup_sin_tens,%object @ @credits_private_math_lookup_sin_tens
	.p2align	2, 0x0
credits_private_math_lookup_sin_tens:
	.long	0x00000000                      @ float 0
	.long	0x3e31d0d4                      @ float 0.173648179
	.long	0x3eaf1d44                      @ float 0.342020154
	.long	0x3f000000                      @ float 0.5
	.long	0x3f248dbb                      @ float 0.642787635
	.long	0x3f441b7d                      @ float 0.766044437
	.long	0x3f5db3d7                      @ float 0.866025388
	.long	0x3f708fb2                      @ float 0.939692616
	.long	0x3f7c1c5c                      @ float 0.984807729
	.long	0x3f800000                      @ float 1
	.size	credits_private_math_lookup_sin_tens, 40

	.type	.L.str.75,%object               @ @.str.75
	.section	.rodata.str1.1,"aMS",%progbits,1
.L.str.75:
	.asciz	"ocean phase exceeds validated lookup range"
	.size	.L.str.75, 43

	.type	credits_private_math_lookup_ocean_height,%object @ @credits_private_math_lookup_ocean_height
	.section	.rodata,"a",%progbits
credits_private_math_lookup_ocean_height:
	.ascii	"\002\002\002\001\001\001\001\001\001\001\001\001\001\001\002\002\002\003\003\004\004\004\004\005\005\004\004\004\004\003\003\002\002\002\001\001\001\001\001\001\001\002\002\002\002\002\002\002\002\002\002\002\002\002\001\001\001\001\001\001\002\002\002\002\003\003\003\003\004\004\004\004\004\003\003\003\003\003\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\003\003\003\003\003\003\003\003\003\003\003\003\003\002\002\002\002\002\002\001\001\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\001\001\001\002\002\002\002\003\003\003\004\004\004\004\004\004\004\004\004\003\003\003\002\002\002\002\001\001\001\001\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\003\003\003\003\003\003\003\003\003\003\003\003\002\002\002\002\002\002\002\002\001\001\001\001\001\001\002\002\002\002\003\003\004\004\004\005\005\005\005\005\005\004\004\003\003\002\001\001\000\000\000\000\000\000\000\000\000\001\001\002\002\003\003\003\003\003\004\003\003\003\003\003\003\003\003\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\003\003\003\003\002\002\002\002\002\002\002\002\002\002\003\003\003\003\003\003\003\003\003\003\003\003\002\002\002\001\001\001\001\000\000\000\000\001\001\001\002\002\002\003\003\003\003\004\004\004\003\003\003\003\003\003\002\002\002\002\002\002\003\003\003\003\003\003\003\003\003\003\003\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\003\003\003\003\003\003\003\003\003\003\002\002\002\002\002\002\002\002\002\001\001\001\001\001\002\002\002\002\002\003\003\003\003\003\003\003\003\003\003\003\003\003\002\002\002\002\002\003\003\003\003\003\003\003\003\003\003\003\003\002\002\001\001\001\000\000\000\000\000\000\000\001\001\002\002\003\003\003\004\004\004\004\004\004\004\004\004\003\003\003\002\002\002\002\001\001\001\001\001\001\001\001\001\001\002\002\002\003\003\003\004\004\004\004\004\004\004\004\004\003\003\003\002\002\002\001\001\001\001\001\001\001\002\002\002\002\002\002\002\002\002\002\002\002\001\001\001\001\001\001\001\002\002\002\003\003\003\004\004\004\004\004\004\004\004\003\003\003\003\002\002\002\002\002\002\001\002\002\002\002\002\002\002\002\002\002\002\003\003\003\003\003\003\003\003\003\003\003\003\003\002\002\002\002\002\001\001\001\001\001\001\002\002\002\002\002\002\002\002\003\002\002\002\002\002\002\002\002\002\002\002\002\002\003\003\003\003\004\004\004\004\004\004\004\003\003\003\002\002\002\002\001\001\001\001\001\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\003\003\003\003\003\003\003\003\003\003\003\003\003\003\002\002\002\002\002\002\002\002\001\001\001\001\001\002\002\002\002\003\003\003\004\004\004\005\005\005\005\005\004\004\003\003\002\002\001\001\000\000\000\000\000\000\000\000\001\001\002\002\003\003\003\003\004\004\004\003\003\003\003\003\003\003\002\002\002\002\002\002\002\002\003\003\003\003\003\003\003\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\003\003\003\003\003\003\003\003\003\003\003\003\003\002\002\002\001\001\001\001\000\000\000\000\000\001\001\001\002\002\003\003\003\004\004\004\004\004\004\004\003\003\003\003\002\002\002\002\002\002\002\002\003\003\003\003\003\003\003\003\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\003\003\003\003\003\003\003\003\003\003\003\003\003\002\002\002\002\002\002\003\003\003\003\003\003\003\003\003\003\003\002\002\002\001\001\000\000\000\000\000\000\000\001\001\001\002\002\003\003\004\004\004\004\004\004\004\004\004\003\003\003\002\002\002\002\001\001\001\001\001\001\001\001\001\002\002\002\002\003\003\003\003\004\004\004\004\004\004\004\003\003\003\003\002\002\002\002\001\001\001\001\001\001\002\002\002\002\002\002\002\002\002\002\002\002\001\001\001\001\001\001\001\002\002\002\003\003\003\004\004\004\004\005\004\004\004\004\003\003\003\002\002\002\001\001\001\001\001\001\001\001\002\002\002\002\002\002\003\003\003\003\003\003\003\003\003\003\003\003\003\003\002\002\002\002\002\001\001\001\001\001\001\001\002\002\002\002\002\002\003\003\003\003\003\003\002\002\002\002\002\002\002\002\002\003\003\003\003\003\004\004\004\004\004\004\003\003\003\003\002\002\002\001\001\001\001\001\001\001\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\003\003\003\003\003\003\003\003\003\003\003\003\003\003\002\002\002\002\002\002\002\002\002\001\001\001\002\002\002\002\002\002\003\003\003\004\004\004\004\004\004\004\004\004\003\003\002\002\001\001\000\000\000\000\000\000\000\000\001\001\002\002\002\003\003\003\004\004\004\004\003\003\003\003\003\003\002\002\002\002\002\003\003\003\003\003\003\003\003\003\003\003\003\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\003\003\003\003\003\003\003\003\003\003\003\003\003\003\002\002\002\001\001\001\000\000\000\000\000\001\001\001\002\002\003\003\004\004\004\004\004\004\004\004\004\004\003\003\003\002\002\002\002\002\002\002\002\002\002\002\003\003\003\003\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\003\003\003\003\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\003\003\003\003\003\003\003\003\003\003\003\003\003\002\002\002\002\002\002\002\003\003\003\003\003\003\003\003\003\002\002\002\001\001\001\000\000\000\000\000\000\001\001\001\002\002\003\003\004\004\004\004\005\004\004\004\004\004\003\003\003\002\002\002\002\001\001\001\001\001\001\001\002\002\002\002\002\002\003\003\003\003\003\003\003\003\003\003\003\003\003\003\002\002\002\002\002\001\001\001\001\002\002\002\002\002\002\002\002\002\002\002\002\002\001\001\001\001\001\001\001\001\002\002\003\003\003\004\004\005\005\005\005\005\004\004\004\003\003\002\002\002\001\001\001\001\001\001\001\001\001\001\002\002\002\002\003\003\003\003\003\003\003\003\003\003\003\003\003\003\002\002\002\002\002\002\001\001\001\001\001\001\002\002\002\002\002\002\003\003\003\003\003\003\003\003\003\002\002\002\002\002\002\002\003\003\003\003\003\003\004\004\004\004\003\003\003\003\002\002\002\001\001\001\001\001\001\001\001\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\003\003\003\003\003\003\003\003\003\003\003\003\003\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\003\003\003\003\004\004\004\004\004\004\004\004\003\003\002\002\002\001\001\000\000\000\000\000\000\000\001\001\001\002\002\003\003\003\004\004\004\004\003\003\003\003\003\003\002\002\002\002\002\003\003\003\003\003\003\003\003\003\003\003\003\002\002\002\002\002\001\001\001\001\001\001\001\002\002\002\002\002\002\003\003\003\003\003\003\003\003\003\003\003\003\003\003\002\002\002\001\001\001\000\000\000\000\000\000\001\001\002\002\003\003\004\004\004\004\005\005\005\004\004\004\003\003\003\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\001\002\002\002\002\002\002\002\002\002\003\003\003\003\003\003\003\003\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\003\003\003\003\003\003\003\003\003\003\003\003\003\002\002\002\002\002\002\002\002\002\002\003\003\003\003\003\003\002\002\002\002\001\001\001\001\000\000\000\000\001\001\001\002\002\003\003\004\004\004\004\005\005\004\004\004\004\003\003\003\002\002\002\002\001\001\001\001\001\002\002\002\002\002\002\002\002\002\003\003\003\003\003\003\003\003\003\003\003\003\003\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\001\001\001\001\001\001\001\002\002\002\003\003\004\004\005\005\005\005\005\005\005\004\004\003\003\002\002\001\001\000\000\000\000\000\001\001\001\001\002\002\002\003\003\003\003\003\003\003\003\003\003\003\003\003\003\002\002\002\002\002\002\002\001\001\001\001\001\002\002\002\002\002\002\003\003\003\003\003\003\003\003\003\003\003\002\002\002\002\002\002\003\003\003\003\003\003\003\003\003\003\003\003\003\002\002\002\001\001\001\001\001\001\001\001\001\002\002\002\002\002\002\003\003\003\002\002\002\002\002\002\002\002\002\002\002\002\003\003\003\003\003\003\003\003\003\003\003\003\003\003\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\003\003\003\003\003\003\003\004\004\004\003\003\003\003\003\002\002\001\001\001\000\000\000\000\000\000\001\001\001\002\002\003\003\003\003\004\004\004\003\003\003\003\003\003\002\002\002\002\002\003\003\003\003\003\003\003\003\003\003\003\003\003\002\002\002\001\001\001\001\001\001\001\001\001\001\002\002\002\002\003\003\003\003\003\004\004\004\004\003\003\003\003\003\002\002\002\001\001\001\001\000\000\000\000\000\001\001\001\002\002\003\003\004\004\005\005\005\005\005\004\004\004\003\003\003\002\002\002\001\001\001\001\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\001\001\001\001\002\002\002\002\002\002\003\003\003\003\003\003\003\003\003\003\003\003\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\003\003\003\003\003\003\003\003\003\003\003\003\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\001\001\001\001\001\001\001\001\001\001\002\002\003\003\003\004\004\004\004\004\004\004\004\004\003\003\003\002\002\002\002\002\001\001\001\002\002\002\002\002\002\002\002\002\002\002\002\002\003\003\003\003\003\003\003\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\001\001\001\001\001\001\001\002\002\002\003\003\004\004\005\005\005\005\005\005\005\004\004\003\003\002\002\001\001\000\000\000\000\000\000\000\001\001\001\002\002\003\003\003\003\003\003\003\003\003\003\003\003\003\003\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\003\003\003\003\003\003\003\003\003\003\003\003\002\002\002\002\002\002\003\003\003\003\003\003\003\003\003\003\003\003\002\002\002\001\001\001\001\001\001\001\001\001\001\002\002\002\002\003\003\003\003\003\003\003\003\002\002\002\002\002\002\002\002\003\003\003\003\003\003\003\003\003\003\003\003\003\003\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\003\003\003\003\003\003\003\003\003\003\003\003\003\003\002\002\002\001\001\001\001\001\001\001\001\001\001\001\002\002\002\003\003\003\003\004\004\003\003\003\003\003\003\002\002\002\002\002\003\003\003\003\003\003\004\004\004\003\003\003\003\002\002\002\001\001\001\000\000\000\000\001\001\001\001\002\002\002\003\003\003\004\004\004\004\004\004\004\003\003\003\003\002\002\002\001\001\001\001\001\000\000\000\001\001\001\001\002\002\003\003\004\004\004\005\005\005\005\004\004\004\003\003\003\002\002\002\001\001\001\001\001\001\002\002\002\002\002\002\002\002\002\002\002\002\002\001\001\001\001\001\001\002\002\002\002\003\003\003\003\003\003\003\003\003\003\003\003\003\003\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\003\003\003\003\003\003\003\003\003\003\003\003\003\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\001\001\001\001\001\001\001\001\002\002\002\003\003\004\004\004\004\004\004\004\004\004\003\003\003\002\002\002\002\002\001\001\001\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\001\001\001\001\001\001\001\002\002\002\003\003\004\004\004\005\005\005\005\005\005\005\004\004\003\002\002\001\001\000\000\000\000\000\000\000\000\001\001\002\002\002\003\003\003\003\003\003\003\003\003\003\003\003\003\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\003\003\003\003\003\003\003\003\003\003\003\002\002\002\002\002\002\003\003\003\003\003\003\003\003\003\003\003\003\002\002\002\002\001\001\001\001\000\000\001\001\001\001\002\002\002\003\003\003\003\003\003\003\003\003\003\003\002\002\002\002\002\002\003\003\003\003\003\003\003\003\003\003\003\003\003\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\003\003\003\003\003\003\003\003\003\003\003\003\002\002\002\002\002\002\001\001\001\001\001\001\001\001\002\002\002\002\003\003\003\003\003\003\003\003\003\003\003\003\003\002\002\002\002\002\003\003\003\003\003\003\004\004\003\003\003\003\002\002\002\001\001\001\000\000\000\000\000\000\001\001\002\002\002\003\003\003\004\004\004\004\004\004\004\004\003\003\003\003\002\002\002\001\001\001\001\001\001\001\001\001\001\001\002\002\003\003\003\004\004\004\005\005\005\004\004\004\004\003\003\002\002\002\001\001\001\001\001\001\001\002\002\002\002\002\002\002\002\002\002\002\002\001\001\001\001\001\001\001\002\002\002\003\003\003\003\003\004\004\004\004\003\003\003\003\003\003\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\003\003\003\003\003\003\003\003\003\003\003\003\003\002\002\002\002\002\002\002\001\001\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\001\001\002\002\002\002\002\003\003\003\004\004\004\004\004\004\004\004\004\003\003\003\002\002\002\002\001\001\001\001\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\003\003\003\003\003\003\003\003\003\003\003\003\002\002\002\002\002\002\002\002\002\001\001\001\001\001\001\002\002\002\003\003\003\004\004\005\005\005\005\005\005\005\004\004\003\002\002\001\001\000\000\000\000\000\000\000\000\001\001\001\002\002\003\003\003\003\004\004\003\003\003\003\003\003\003\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\003\003\003\003\002\002\002\002\002\002\002\002\002\003\003\003\003\003\003\003\003\003\003\003\003\003\002\002\002\001\001\001\000\000\000\000\001\001\001\001\002\002\003\003\003\003\004\004\004\004\003\003\003\003\003\003\002\002\002\002\002\002\003\003\003\003\003\003\003\003\003\003\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\003\003\003\003\003\003\003\003\003\002\002\002\002\002\002\002\002\002\002\001\001\001\001\002\002\002\002\002\003\003\003\003\003\003\003\003\003\003\003\003\003\002\002\002\002\002\002\003\003\003\003\003\003\003\003\003\003\003\002\002\002\001\001\001\000\000\000\000\000\000\001\001\001\002\002\003\003\004\004\004\004\004\004\004\004\004\004\003\003\003\002\002\002\001\001\001\001\001\001\001\001\001\001\002\002\002\002\003\003\004\004\004\004\004\004\004\004\004\004\003\003\002\002\002\001\001\001\001\001\001\001\002\002\002\002\002\002\002\002\002\002\002\002\002\001\001\001\001\001\001\002\002\002\002\003\003\003\004\004\004\004\004\004\004\004\003\003\003\002\002\002\002\002\002\002\001\002\002\002\002\002\002\002\002\002\002\003\003\003\003\003\003\003\003\003\003\003\003\003\002\002\002\002\002\002\001\001\001\001\001\001\002\002\002\002\002\002\002\003\003\002\002\002\002\002\002\002\002\002\002\002\002\003\003\003\003\004\004\004\004\004\004\004\004\003\003\003\002\002\002\002\001\001\001\001\001\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\003\003\003\003\003\003\003\003\003\003\003\003\003\002\002\002\002\002\002\002\002\001\001\001\001\001\001\002\002\002\002\003\003\004\004\004\004\005\005\005\005\004\004\004\003\003\002\001\001\000\000\000\000\000\000\000\000\000\001\001\002\002\003\003\003\003\004\004\004\003\003\003\003\003\003\002\002\002\002\002\002\002\002\003\003\003\003\003\003\003\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\003\003\003\003\003\003\003\003\003\003\003\003\003\002\002\002\001\001\001\000\000\000\000\000\001\001\001\002\002\002\003\003\004\004\004\004\004\004\004\004\003\003\003\003\002\002\002\002\002\002\002\002\003\003\003\003\003\003\003\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\003\003\003\003\003\003\003\003\003\003\003\003\003\002\002\002\002\002\002\003\003\003\003\003\003\003\003\003\003\003\002\002\001\001\001\000\000\000\000\000\000\000\001\001\002\002\003\003\004\004\004\004\004\004\004\004\004\004\003\003\003\002\002\002\002\001\001\001\001\001\001\001\001"
	.size	credits_private_math_lookup_ocean_height, 4096

	.type	.L.str.76,%object               @ @.str.76
	.section	.rodata.str1.1,"aMS",%progbits,1
.L.str.76:
	.asciz	"ocean text lookup range"
	.size	.L.str.76, 24

	.type	credits_private_math_lookup_ocean_text_mask,%object @ @credits_private_math_lookup_ocean_text_mask
	.section	.rodata,"a",%progbits
credits_private_math_lookup_ocean_text_mask:
	.ascii	"\002\001\001\001\001\001\005\001\001\001\003\b\000\001\000\001\001\001\001\000\001\001\003\001\000\001\001\001\001\001\000\001\001\001\005\001\000\001\001\001\001\001\005\001\000\000\001\001\001\001\001\001\001\t\000\000\001\001\001\001\001\001\001\001\001\001\000\003\001\003\000\001\001\001\003\t\003\001\001\001\001\003\t\003\001\000\001\001\003\001\001\001\000\000\000\001\001\001\000\005\001\000\b\003\001\001\001\000\003\001\000\000\001\001\001\t\002\001\001\000\000\002\001\001\001\005\001\001\t\003\000\001\001\001\001\003\001\001\001\001\001\001\000\001\001\000\002\000\001\001\005\001\003\001\001\001\005\001\001\000\001\001\004\000\000\001\001\001\005\001\001\001\001\001\005\001\002\001\001\000\005\000\003\001\001\001\005\000\002\001\001\001\001\001\001\001\001\001\001\001\t\003\001\001\001\001\t\001\001\004\001\003\001\001\000\001\001\000\001\001\000\001\000\t\001\000\005\001\002\001\000\001\001\000\001\003\000\001\000\001\001\000\001\005\000\001\000\001\001\000\001\t\000\001\004\001\001\000\001\001\000\001\b\001\001\004\001\001\001\001\001\001\001\000\001\001\001\001\001\003\001\001\001\003\000\001\001\001\001\t\001\001\004\000\001\001\001\001\001\000\001\000\001\001\000\t\001\001\005\001\001\003\001\001\001\002\001\001\001\001\001\001\000\000\000\001\t\000\001\005\001\001\003\001\001\001\003\001\000\001\001\001\001\001\001\000\001\b\001\001\000\001\t\001\001\005\001\001\003\001\004\000\000\003\001\000\001\003\001\001\001\001\003\001\001\000\000\000\001\001\000\001\001\001\001\001\001\001\001\001\000\001\000\t\001\000\001\001\t\001\001\001\001\t\001\000\001\001\t\001\001\001\001\b\000\001\001\000\t\001\001\001\001\t\001\001\001\000\b\000\001\001\000\001\001\000\001\001\001\001\001\001\001\001\001\001\001\001\001\000\001\000\003\001\000\001\001\002\001\001\001\000\001\003\001\005\001\001\003\001\005\000\t\001\001\001\001\t\000\000\000\001\001\000\001\001\000\001\001\001\000\003\001\001\001\001\001\003\001\005\000\t\001\001\001\001\t\000\001\001\001\001\001\001\001\002\000\001\001\000\001\003\000\004\001\t\000\001\001\001\001\001\001\000\003\001\001\001\001\001\003\001\005\001\t\001\001\001\001\001\000\001\001\003\001\001\005\000\001\001\001\001\001\001\000\001\001\003\001\001\001\000\001\002\001\001\001\t\000\000\000\001\001\001\001\001\000\002\001\001\001\t\001\000\000\003\001\001\005\001\000\002\001\001\001\001\001\000\000\003\001\001\005\001\b\000\001\001\001\001\001\000\000\001\003\001\001\001\b\000\001\001\003\001\000\004\000\t\001\001\001\000\001\001\001\001\001\003\000\001\001\001\001\001\001\000\003\001\001\001\t\001\000\001\003\001\001\005\001\t\001\001\001\003\001\001\005\001\t\001\000\001\003\001\001\005\001\b\001\001\000\000\001\001\004\001\t\000\000\001\001\001\001\004\000\b\001\001\001\001\000\001\005\001\t\001\001\000\003\001\001\005\001\t\001\001\001\003\000\001\005\001\t\001\001\000\003\003\000\000\001\001\001\001\000\001\003\001\001\001\001\000\001\001\001\001\001\001\001\001\001\005\000\t\001\000\000\003\003\000\001\001\000\000\001\001\001\001\000\001\001\001\001\005\001\t\001\001\001\002\003\001\000\000\001\001\000\001\001\000\000\001\001\001\001\004\001\t\001\001\001\001\003\001\001\001\000\001\005\000\b\001\001\001\003\002\001\001\001\001\001\005\001\t\001\001\000\003\003\000\000\001\001\001\001\000\t\001\001\001\003\003\001\001\001\001\000\005\001\b\000\001\001\003\003\000\001\001\001\001\005\001\t\001\001\001\000\003\001\000\000\001\001\005\001\000\001\001\001\001\001\001\001\003\003\001\000\001\001\000\004\001\t\001\001\000\001\001\001\001\003\001\001\000\001\001\001\001\000\t\001\001\001\001\003\001\001\001\001\000\001\001\000\000\001\001\t\001\000\001\001\003\000\001\003\000\000\001\001\001\001\004\001\t\001\001\001\001\001\001\001\003\003\001\000\001\001\001\005\001\001\001\001\001\t\000\001\001\000\002\001\001\003\001\001\001\001\001\000\005\001\000\000\001\001\t\001\001\001\001\001\000\001\003\002\000\001\001\001\001\005\001\001\001\004\001\t\000\000\001\001\001\001\001\003\003\001\000\003\003\000\000\001\001\001\005\001\001\001\005\000\t\001\000\000\t\001\001\001\001\001\001\001\002\003\001\000\000\001\001\001\001\001\001\005\001\000\001\004\001\t\001\001\001\t\001\001\001\001\001\001\000\003\003\001\001\003\003\000\000\001\001\001\001\000\001\001\005\000\001\001\004\000\001\001\001\001\t\001\001\001\b\001\001\001\001\001\001\001\001\001\001\001\003\003\001\000\003\003\001\001\001\001\000\000\001\001\001\001\001\001\001\005\000\001\001\004\001\001\001\005\001\t\001\001\001\t\001\000\001\t\001\000\001\001\000\000\001\001\001\001\001\001\001\001\000\001\002\001\001\003\003\001\001\002\002\001\001\003\003\001\001\003\003\000\001\001\001\001\001\001\001\001\001\000\001\001\001\001\000\001\001\001\000\001\001\000\001\001\005\001\001\001\004\001\001\001\005\000\001\001\005\000\001\001\005\001\001\001\005\001\000\000\005\001\001\001\005\001\001\001\004\001\000\001\005\001\001\001\005\000\000\001\005\001\001\001\005\001\001\000\005\000\001\001\005\000\001\001\004\000\001\001\005\001\001\001\005\001\001\001\004\001\001\001\000\001\001\001\001\001\001\001\001\000\000\001\001\001\001\001\001\001\001\001\001\000\001\001\001\002\003\001\000\002\003\001\001\003\003\000\001\003\003\001\001\003\001\001\000\001\000\001\001\001\000\001\001\000\000\001\001\t\001\001\000\t\001\001\001\t\001\001\001\t\001\004\001\001\001\004\001\001\000\005\001\001\001\001\000\000\001\001\001\001\001\001\003\003\001\001\002\003\001\001\002\001\000\001\001\001\000\001\001\000\000\001\t\001\001\000\b\001\001\001\001\001\005\001\001\001\005\000\001\001\001\000\001\000\001\003\003\000\001\003\002\000\001\001\001\001\000\000\001\001\001\t\001\001\001\t\001\005\000\001\001\005\000\001\000\001\001\001\000\001\003\003\001\001\003\003\001\000\000\001\001\001\t\001\000\001\t\001\005\001\001\001\005\001\001\000\001\001\001\000\001\002\003\001\001\000\001\001\001\001\001\001\001\t\000\001\001\001\001\005\000\000\001\001\001\001\001\000\003\003\001\001\001\001\001\001\001\001\000\001\t\001\005\001\000\001\001\001\000\001\000\003\003\001\000\003\001\001\001\001\001\001\001\b\000\005\001\001\001\000\000\001\001\001\003\003\000\001\001\001\001\001\001\001\001\001\t\001\005\001\001\001\001\000\001\001\001\002\003\000\001\001\001\000\001\b\001\005\001\000\001\001\001\001\001\000\003\003\000\001\001\001\001\001\b\000\001\001\001\001\004\000\001\001\001\003\002\000\001\001\001\001\001\b\001\001\001\001\001\001\001\001\001\001\003\003\001\001\001\001\001\001\t\001\005\001\001\001\001\001\003\001\000\003\001\001\001\t\000\001\001\001\000\005\000\001\001\001\002\003\000\001\001\001\000\001\b\001\005\001\000\001\000\001\003\001\000\001\001\001\001\t\000\005\001\001\001\001\000\001\001\000\003\001\001\001\t\000\001\001\001\001\001\000\001\001\001\003\001\000\001\t\001\001\001\000\000\001\001\001\001\000\002\001\001\001\t\000\000\001\001\001\001\000\002\001\001\001\001\000\000\t\001\005\001\000\000\001\001\003\001\000\000\001\001\001\t\000\004\001\001\001\001\002\002\001\001\001\001\000\000\001\001\001\001\000\000\001\003\001\001\000\b\001\005\001\001\000\000\003\003\001\001\000\000\001\001\001\001\004\001\001\001\001\003\000\001\001\t\001\005\000\001\001\001\003\003\000\001\001\001\001\001\001\001\001\000\003\001\001\001\001\000\001\t\001\005\001\000\001\000\003\001\001\000\t\000\005\001\001\000\001\002\003\001\001\b\001\000\001\001\001\000\001\002\001\001\001\001\001\000\001\001\001\001\003\000\001\001\001\001\001\001\001\001\001\001\001\001\001\001\001\001\t\001\005\001\001\001\001\001\000\001\001\t\001\004\000\001\001\001\001\000\000\001\t\001\005\000\000\001\001\001\001\000\001\t\001\005\001\001\001\001\000\001\001\001\t\001\004\001\000\001\001\001\000\001\000\001\001\001\001\003\000\001\001\001\001\001\001\001\001\001\003\001\001\001\001\001\001\001\001\000\003\003\001\001\b\000\005\001\001\001\000\002\001\001\001\t\000\005\001\001\001\001\003\001\001\000\t\000\005\001\001\000\001\000\001\001\001\001\001\000\003\003\001\001\t\001\005\001\001\001\001\003\000\001\001\t\001\004\000\001\001\001\001\000\000\001\001\001\001\000\003\001\000\t\001\005\001\001\000\001\002\001\001\001\t\001\004\001\003\001\001\001\001\001\001\001\001\001\003\002\001\001\t\001\004\000\001\001\001\001\000\001\001\001\001\001\003\003\001\000\t\000\005\001\001\000\001\000\001\001\001\001\001\001\003\003\001\001\t\001\004\001\001\001\001\000\000\001\001\001\001\000\003\003\000\001\b\001\005\001\000\001\000\001\001\001\001\001\001\001\003\001\001\001\t\000\001\001\003\001\000\000\001\005\001\001\000\001\001\000\001\000\001\001\001\002\003\000\001\t\001\005\001\001\001\001\001\001\001\001\000\001\001\003\001\000\000\001\001\001\003\003\001\001\b\001\004\001\001\001\001\001\001\001\001\001\001\001\001\000\001\001\001\001\000\002\003\001\001\t\001\001\001\002\001\000\t\001\005\001\001\000\001\001\001\001\001\001\000\001\003\001\001\000\000\001\001\003\003\001\001\t\000\001\000\003\001\001\t\001\005\001\001\001\001\001\001\000\001\001\001\001\000\000\001\001\001\001\001\003\001\000\001\000\001\001\003\003\001\001\t\001\001\001\003\000\000\t\001\005\001\002\001\001\b\001\004\001\001\001\001\001\001\001\001\001\001\001\001\000\001\001\001\001\000\003\001\000\001\001\001\001\003\000\001\000\001\001\001\003\001\001\000\001\001\001\003\002\000\001\t\001\001\001\003\001\000\t\000\005\001\003\001\001\t\000\005\001\003\001\000\b\001\005\001\001\001\001\t\000\005\000\001\001\001\001\001\005\000\001\001\001\001\000\004\001\001\001\001\001\001\005\000\001\000\001\001\001\005\001\001\000\001\001\001\005\000\001\001\000\001\000\005\001\001\001\001\000\001\005\001\001\001\001\000\001\005\001\001\000\001\001\000\005\000\001\001\001\001\001\005\001\001\001\001\001\000\004\001\001\001\001\t\001\005\000\001\000\001\t\001\005\001\003\000\001\t\001\005\000\003\001\000\t\000\001\001\003\001\001\t\001\001\003\003\001\000\000\001\001\003\001\001\001\001\000\001\002\001\001\001\001\001\001\002\001\001\001\001\000\001\001\000\001\000\001\001\001\001\001\001\000\001\001\001\001\000\005\001\000\001\000\t\001\005\001\003\001\001\t\001\001\001\002\000\001\001\001\001\003\001\001\000\001\000\001\003\001\001\001\000\000\001\001\001\001\001\001\001\000\001\000\005\001\001\001\001\t\000\005\001\003\001\001\t\001\000\003\000\001\001\001\001\001\003\000\001\001\001\001\000\001\001\000\001\000\001\001\001\001\005\001\002\001\001\t\001\000\003\003\000\001\000\001\001\003\001\001\001\000\001\001\001\001\004\001\001\000\001\b\001\005\001\003\001\001\b\001\001\003\001\001\001\001\000\001\000\001\001\001\001\001\001\000\001\005\001\003\001\001\t\000\001\002\003\001\001\001\001\000\002\001\001\001\001\001\001\001\001\005\001\003\001\001\t\001\000\002\001\001\001\000\001\001\001\001\001\001\001\001\001\t\001\004\001\003\000\001\000\001\001\003\001\001\001\000\001\001\001\001\004\001\001\000\001\b\001\001\003\003\001\000\000\001\001\001\001\001\001\001\001\001\t\001\005\001\003\001\000\001\001\000\003\000\001\001\001\001\001\001\000\005\001\003\001\000\001\001\000\003\000\001\001\001\001\001\000\000\005\001\003\001\001\001\001\001\003\001\001\001\001\001\001\000\001\005\000\003\000\001\001\001\001\003\001\000\001\001\001\001\t\001\005\000\003\001\001\001\001\001\003\000\001\001\000\001\000\t\001\001\001\003\001\000\001\001\001\001\001\005\001\000\001\001\t\001\001\003\001\000\001\001\000\001\000\001\005\001\003\001\001\000\001\001\003\001\001\001\001\000\001\t\001\001\003\003\001\000\001\001\000\001\000\005\001\003\001\001\t\000\001\003\001\001\001\001\001\001\t\001\001\003\003\001\001\000\001\001\000\001\004\001\003\001\001\001\000\000\003\000\001\000\001\001\001\t\001\001\002\001\001\001\001\001\001\001\001\005\001\003\001\001\001\001\000\001\001\004\001\002\001\001\001\001\001\002\000\001\000\001\000\001\t\001\001\003\001\000\001\001\001\001\t\001\001\003\003\001\001\001\001\001\001\000\005\001\002\001\000\001\001\001\001\001\004\001\003\000\001\000\001\001\001\001\005\000\000\001\001\t\000\001\003\001\001\001\001\000\001\t\001\001\003\001\001\001\001\001\001\t\001\001\003\000\001\001\000\001\000\t\001\001\003\001\000\001\001\000\001\b\001\001\003\001\001\000\000\001\000\t\000\001\003\001\001\001\000\000\001\t\001\000\003\001\001\001\001\001\000\t\001\001\003\001\001\001\001\001\001\b\001\001\003\001\001\001\001\001\001\t\001\001\003\001\001\000\001\001\000\t\001\001\003\001\001\001\000\001\001\b\001\000\003\001\001\001\001\000\001\t\000\001\002\001\001\001\001\001\000\t\001\000\003\000\001\001\001\001\001\b\000\001\000\001\004\001\003\001\001\001\000\000\001\000\005\000\003\001\001\001\001\000\000\001\005\001\002\001\001\001\001\001\t\000\001\003\001\000\001\001\001\001\t\001\000\003\001\001\000\001\001\001\t\001\001\000\001\005\001\002\001\001\001\001\001\001\000\005\001\003\001\001\001\001\001\t\001\000\003\001\001\001\001\001\001\t\001\001\002\001\005\001\002\001\001\001\001\001\001\000\005\001\003\000\001\001\001\001\t\001\000\003\001\001\000\001\001\001\t\001\001\000\001\005\001\002\001\001\001\001\001\000\000\001\002\001\000\001\001\001\001\t\000\000\003\000\005\000\003\001\001\001\001\000\000\001\004\001\000\001\001\001\001\001\b\001\001\002\001\004\001\003\001\001\001\000\001\001\000\005\002\001\001\001\001\001\000\t\001\000\003\001\005\001\003\001\001\001\001\001\000\001\001\003\001\001\001\001\001\001\001\001\001\001\000\005\001\003\001\001\001\001\001\t\001\000\003\001\001\000\003\001\001\001\001\000\000\001\000\003\000\001\001\001\001\001\000\000\001\000\001\004\001\003\001\001\001\000\001\t\000\001\002\001\005\001\003\001\000\001\001\000\t\001\001\003\001\001\001\003\001\001\001\001\001\000\001\001\003\001\001\001\001\001\001\001\000\001\001\001\004\003\001\001\001\001\000\001\001\000\001\000\001\005\001\003\001\000\001\001\000\t\001\001\001\001\005\001\003\001\001\001\001\001\b\001\001\001\001\005\001\003\001\001\000\000\001\b\001\000\001\001\005\001\003\000\001\001\000\001\b\001\001\001\001\005\000\003\001\001\001\001\000\t\001\001\001\001\005\001\003\001\001\000\001\001\t\000\001\001\001\005\001\000\001\001\000\001\000\001\001\001\001\001\000\003\001\001\001\001\000\001\001\001\001\001\001\001\003\001\001\000\003\000\001\000\001\001\t\001\001\002\001\005\000\003\000\001\001\001\001\t\001\001\001\001\005\001\002\001\001\001\000\001\001\001\001\001\000\000\003\000\001\000\003\001\001\001\001\000\t\001\000\003\001\004\001\003\001\001\001\001\001\t\001\000\000\001\004\001\000\001\001\001\001\001\000\001\001\000\001\001\003\001\005\001\003\001\001\001\001\001\t\000\001\000\001\004\001\001\001\001\001\000\001\001\000\001\t\001\001\003\001\005\001\003\001\001\001\001\000\t\000\001\000\001\005\003\001\001\000\003\001\000\001\001\001\t\001\001\001\001\005\001\001\001\000\000\001\000\001\000\001\t\001\001\003\000\005\001\003\001\001\000\001\001\001\000\001\001\001\001\003\000\001\001\002\001\000\001\001\001\t\001\001\001\001\001\003\001\000\001\003\001\000\001\001\001\t\001\000\001\001\004\003\001\001\001\003\001\001\001\001\001\t\001\000\000\001\004\003\000\001\001\003\001\001\001\001\001\t\001\001\000\001\001\003\000\001\001\003\001\001\000\001\001\b\001\001\001\001\001\003\001\001\001\003\001\001\000\000\001\000\001\000\001\001\001\003\001\005\001\003\001\001\001\000\001\000\001\000\t\001\001\003\001\004\001\001\001\001\001\000\001\001\001\000\t\001\001\001\001\004\003\001\000\001\003\001\001\001\001\001\001\001\001\001\001\000\002\001\004\001\002\001\001\001\001\001\001\001\001\t\001\000\000\001\004\003\000\001\001\003\001\001\001\001\001\001\001\001\000\001\000\003\000\005\001\001\001\001\000\001\001\001\001\001\b\001\001\001\000\001\003\001\005\001\002\001\001\000\001\001\000\001\001\t\000\001\001\001\005\003\000\001\001\002\001\001\000\001\001\001\000\001\t\001\001\001\000\005\003\000\001\001\002\001\001\001\000\001\001\001\001\t\000\001\001\000\005\003\000\001\001\003\000\001\001\001\001\001\000\001\t\000\001\001\000\005\003\001\000\001\003\001\001\001\000\001\001\000\001\t\000\001\001\001\000\003\001\005\001\003\000\001\001\000\001\001\000\001\t\001\000\001\001\001\003\001\004\001\001\000\001\003\000\001\001\001\000\001\001\001\t\001\000\001\001\005\003\001\000\001\003\001\000\001\001\001\001\001\000\t\001\001\001\001\000\003\000\005\000\001\001\001\003\001\001\001\001\001\001\001\000\t\000\001\000\001\001\003\001\005\001\001\001\001\003\000\000\001\000\001\001\001\001\t\001\001\001\001\001\003\001\004\001\003\000\001\003\000\001\001\001\000\001\001\001\t\001\000\001\001\001\003\001\004\001\001\001\000\003\001\001\001\001\001\001\001\001\t\001\000\001\000\001\002\001\005\001\001\001\001\003\001\001\001\000\001\001\000\001\t\001\001\001\001\000\001\001\005\003\001\004\001\003\001\001\001\000\001\001\001\000\001\001\001\t\001\001\001\001\001\003\000\004\001\000\001\000\003\001\001\001\001\001\001\001\001\001\000\001\t\000\001\001\000\001\003\001\004\001\001\001\001\003\001\001\001\001\001\001\000\001\000\001\000\t\001\001\001\001\001\003\001\005\001\000\001\001\002\001\001\000\001\001\001\000\001\001\001\001\t\001\001\001\001\001\002\000\005\002\001\000\001\003\001\001\001\001\001\001\001\001\000\001\001\t\001\001\000\001\001\001\000\001\003\001\005\001\001\001\001\003\001\000\001\001\000\001\001\000\001\001\001\b\001\001\001\001\001\000\001\005\003\001\005\000\001\000\001\002\001\001\001\001\001\001\001\001\001\001\000\t\001\001\001\001\000\001\000\001\002\001\005\001\001\001\001\003\001\001\001\000\001\001\000\001\001\000\001\t\001\000\t\001\001\001\001\001\003\001\005\003\000\005\001\002\001\001\002\001\001\001\000\001\001\001\001\001\001\001\t\001\001\b\000\001\000\001\001\003\001\005\003\000\005\001\003\001\001\003\001\001\001\001\000\000\001\000\001\001\001\t\001\001\b\001\001\001\001\001\003\001\005\003\001\004\000\001\000\001\003\001\001\001\001\000\001\001\001\001\001\001\001\001\001\t\000\000\t\000\001\001\001\001\003\001\004\003\001\005\001\001\001\001\003\001\001\002\001\001\000\001\001\000\001\001\001\000\001\t\001\001\t\001\001\001\001\001\000\001\001\002\001\005\000\001\001\001\002\001\001\003\001\001\001\001\001\001\001\000\001\001\001\001\001\000\t\000\001\b\001\001\001\001\001\001\001\001\003\001\004\003\001\005\001\001\000\001\002\001\001\001\001\001\001\000\001\001\001\001\001\001\001\t\001\001\b\001\001\000\001\001\000\001\001\003\000\001\003\001\005\003\001\005\001\001\001\000\003\001\001\003\001\000\001\000\001\000\001\001\001\001\000\001\001\001\t\001\001\t\001\001\001\000\000\001\000\001\003\000\005\003\001\004\001\001\005\001\001\001\001\003\001\001\002\001\001\001\001\001\000\001\000\001\000\001\001\001\001\000\001\001\t\001\001\t\001\001\001\001\000\001\001\000\003\001\004\003\000\005\002\001\005\001\001\001\001\003\001\001\003\000\001\001\001\001\000\000\001\000\001\001\000\001\001\001\000\001\t\001\001\t\001\001\t\001\001\000\001\001\001\001\000\000\001\000\003\001\004\003\001\005\000\001\005\001\001\001\001\003\001\001\003\000\001\003\001\001\001\000\001\000\001\001\000\001\001\001\000\001\001\001\001\t\001\001\t\001\001\b\001\001\001\001\001\000\001\000\001\001\000\003\001\001\002\001\005\003\001\005\001\001\005\001\001\000\001\003\001\001\002\000\001\002\001\001\000\001\001\001\000\001\001\001\001\001\001\001\001\001\001\000\001\001\001\001\000\t\001\000\t\001\000\t\000\001\000\001\001\001\001\000\001\001\001\001\001\001\003\001\001\003\000\005\003\001\005\003\000\005\000\001\001\001\001\001\001\002\001\001\003\001\001\003\001\001\003\001\000\001\001\001\001\000\000\001\000\001\001\000\001\000\001\000\001\001\001\001\000\001\001\001\001\t\001\001\t\001\001\b\001\001\t\001\001\000\001\000\001\001\000\001\001\001\000\001\001\001\001\001\003\001\001\003\001\005\003\001\005\003\000\005\003\000\005\001\000\005\000\001\001\001\001\001\001\002\001\001\003\001\001\003\001\001\003\001\000\003\001\001\001\000\001\001\000\001\001\000\001\000\001\000\001\001\001\001\000\001\001\001\001\001\001\001\001\001\001\000\001\001\001\001\000\001\001\000\t\001\000\t\000\001\t\001\001\t\001\000\t\001\001\t\001\001\t\001\001\001\001\001\001\001\001\000\001\001\001\001\001\000\001\000\001\001\000\001\001\001\000\001\001\003\001\000\003\001\001\003\001\001\003\001\005\003\000\005\003\001\005\002\000\005\002\001\005\002\001\004\003\000\005\001\001\005\000\001\005\001\001\005\001\001\001\001\001\001\001\001\001\001\000\001\001\001\001\001\002\001\000\003\001\000\003\001\001\002\001\001\003\001\000\003\001\001\003\001\001\003\001\001\003\000\001\003\001\001\002\001\001\003\001\001\002\001\000\003\001\000\003\001\001\002\001\001\003\001\000\003\001\001\001\001\001\001\001\001\001\000\001\001\001\001\000\001\001\001\001\001\000\001\000\001\001\000\001\000\001\000\001\001\001\001\000\001\001\001\001\001\001\001\001\001\001\001\001\001\001\001\000\001\001\001\001\000\000\001\000\001\001\000\001\000\001\001\001\001\001\001\000\001\001\001\001\000\001\001\001\001\001\001\001\001\001\001\000\001\001\003\001\000\003\001\001\003\001\000\003\000\001\003\000\001\002\001\000\003\001\001\003\000\001\003\001\001\003\001\001\003\001\001\003\001\001\003\001\000\003\001\001\003\000\001\003\001\001\003\000\001\002\001\001\002\001\000\001\000\001\001\001\001\000\001\001\001\001\000\001\005\001\001\005\001\001\005\001\001\005\003\001\005\003\000\005\003\001\005\002\001\005\002\001\005\002\001\004\003\001\000\003\001\001\002\001\001\003\001\000\001\001\001\001\001\001\001\001\001\001\001\001\001\001\001\000\001\001\001\001\000\001\001\001\t\000\000\t\000\001\t\000\001\b\001\001\b\001\001\t\000\001\t\001\001\000\001\001\001\001\001\001\001\001\001\001\001\001\001\001\001\001\001\001\001\001\000\001\001\001\001\000\001\001\000\001\001\000\001\000\001\003\000\001\002\001\000\003\001\001\003\000\001\003\001\001\002\001\001\001\001\001\001\005\001\001\005\001\001\005\003\001\004\003\001\005\003\000\001\003\001\001\002\001\001\000\001\001\000\001\000\001\001\000\001\000\001\001\001\001\t\001\000\t\001\001\t\000\001\t\001\001\001\001\001\001\001\001\001\001\001\001\001\001\001\001\001\001\000\001\001\001\001\000\001\001\001\001\000\002\001\000\003\001\000\003\000\001\003\000\001\000\001\000\001\005\001\001\004\003\001\005\003\000\001\003\001\001\001\001\001\001\001\001\001\001\001\001\001\001\t\001\001\t\000\001\t\001\001\b\001\001\001\001\000\001\001\001\001\001\000\001\000\001\001\000\001\000\001\001\000\001\000\003\000\001\003\001\001\002\001\001\001\001\000\001\005\003\001\004\003\001\005\003\001\001\003\001\001\001\001\001\001\001\001\001\001\001\t\001\000\t\001\001\t\000\001\001\001\001\000\001\001\000\001\001\000\001\000\001\001\000\001\000\001\003\000\001\002\001\001\003\001\001\001\004\001\001\005\003\000\005\003\001\001\002\001\001\001\001\001\001\001\001\t\001\001\t\001\001\t\001\001\001\001\001\001\001\001\001\001\000\001\001\001\001\000\001\001\001\001\002\001\001\003\001\001\000\001\000\001\005\002\001\004\003\001\000\003\000\001\001\000\001\000\001\000\t\001\001\t\000\001\t\001\001\000\001\001\001\001\000\001\001\001\001\000\001\001\001\001\003\001\001\003\001\001\001\005\001\001\005\003\001\005\003\001\001\001\001\001\001\000\001\001\001\001\b\001\001\t\001\000\001\001\001\001\000\001\001\001\001\001\000\001\002\001\001\002\001\000\003\001\000\001\004\003\001\004\003\000\001\003\000\001\001\001\000\001\001\001\t\000\001\t\001\001\000\001\001\001\001\000\001\001\001\001\000\001\003\001\001\003\001\001\001\001\001\001\005\003\001\005\003\001\001\001\001\001\001\001\001\t\001\001\t\001\001\000\001\001\001\001\000\001\001\001\001\000\001\003\001\001\002\001\001\001\005\000\001\005\003\001\000\003\001\000\001\001\000\001\000\001\t\000\001\000\001\001\000\001\000\001\001\000\001\000\001\003\000\001\002\001\001\000\005\000\001\004\003\001\001\003\000\001\001\001\001\b\001\001\t\001\000\001\001\001\001\000\001\001\001\001\000\001\001\003\001\000\003\001\001\001\005\003\001\005\003\001\001\001\001\001\001\001\001\t\001\001\001\001\001\001\001\001\001\001\001\001\001\001\003\001\001\003\001\001\001\005\003\001\005\003\001\000\001\001\001\t\000\001\t\001\001\000\001\001\001\001\000\001\001\001\003\000\001\003\001\001\000\005\001\001\005\002\001\001\001\001\000\001\001\001\t\000\001\001\001\001\000\001\001\000\001\001\000\001\000\003\001\000\001\004\001\001\004\003\000\001\001\000\001\000\001\001\b\001\000\001\001\000\001\000\001\001\000\001\002\001\001\002\001\000\001\005\002\001\004\003\001\000\001\000\001\t\000\001\b\001\001\000\001\000\001\000\001\001\001\001\002\001\001\001\001\000\001\005\003\001\000\001\001\001\001\000\001\t\001\001\000\001\001\001\001\000\001\001\001\003\000\001\003\001\001\000\005\003\001\001\000\001\001\001\001\000\t\001\001\001\000\001\001\001\001\000\001\001\003\001\000\003\001\001\001\004\003\001\001\001\000\001\001\001\001\b\001\001\001\001\000\001\001\001\001\000\001\003\001\001\000\005\003\001\005\002\001\001\001\001\000\t\001\001\001\000\001\001\001\001\000\001\001\003\001\000\003\001\001\001\004\003\001\001\001\000\001\t\001\001\b\001\001\001\001\000\001\001\001\003\000\001\003\001\001\000\005\003\001\001\000\001\001\001\001\000\t\001\001\001\000\001\001\001\001\002\001\001\003\001\000\001\005\003\001\000\001\001\001\t\000\001\t\001\001\000\001\001\001\001\000\003\001\001\003\000\001\001\005\003\000\001\001\001\001\b\001\001\001\001\000\001\001\001\001\000\001\003\001\001\000\005\003\001\001\002\001\001\001\001\000\t\001\001\001\000\001\001\001\001\002\001\001\003\001\000\001\005\003\001\000\001\001\001\t\000\001\001\001\001\000\001\001\001\001\000\003\001\001\001\004\003\001"
	.size	credits_private_math_lookup_ocean_text_mask, 6509

	.type	.L.str.77,%object               @ @.str.77
	.section	.rodata.str1.1,"aMS",%progbits,1
.L.str.77:
	.asciz	"negative access beat"
	.size	.L.str.77, 21

	.type	credits_private_math_lookup_access_limit,%object @ @credits_private_math_lookup_access_limit
	.section	.rodata,"a",%progbits
credits_private_math_lookup_access_limit:
	.ascii	" \037\036\035\033\032\030\026\024\023\021\017\r\013\t\007\005\003"
	.size	credits_private_math_lookup_access_limit, 18

	.type	.L.str.78,%object               @ @.str.78
	.section	.rodata.str1.1,"aMS",%progbits,1
.L.str.78:
	.asciz	"noise beat exceeds validated lookup range"
	.size	.L.str.78, 42

	.type	credits_private_math_lookup_wipe_count,%object @ @credits_private_math_lookup_wipe_count
	.section	.rodata,"a",%progbits
	.p2align	1, 0x0
credits_private_math_lookup_wipe_count:
	.short	0                               @ 0x0
	.short	1                               @ 0x1
	.short	2                               @ 0x2
	.short	4                               @ 0x4
	.short	6                               @ 0x6
	.short	9                               @ 0x9
	.short	12                              @ 0xc
	.short	15                              @ 0xf
	.short	18                              @ 0x12
	.short	21                              @ 0x15
	.short	25                              @ 0x19
	.short	28                              @ 0x1c
	.short	32                              @ 0x20
	.short	36                              @ 0x24
	.short	40                              @ 0x28
	.short	44                              @ 0x2c
	.short	48                              @ 0x30
	.short	52                              @ 0x34
	.short	57                              @ 0x39
	.short	61                              @ 0x3d
	.short	66                              @ 0x42
	.short	70                              @ 0x46
	.short	75                              @ 0x4b
	.short	80                              @ 0x50
	.short	85                              @ 0x55
	.short	90                              @ 0x5a
	.short	95                              @ 0x5f
	.short	100                             @ 0x64
	.short	106                             @ 0x6a
	.short	111                             @ 0x6f
	.short	116                             @ 0x74
	.short	122                             @ 0x7a
	.short	127                             @ 0x7f
	.short	133                             @ 0x85
	.short	139                             @ 0x8b
	.short	145                             @ 0x91
	.short	150                             @ 0x96
	.short	156                             @ 0x9c
	.short	162                             @ 0xa2
	.short	168                             @ 0xa8
	.short	174                             @ 0xae
	.short	181                             @ 0xb5
	.short	187                             @ 0xbb
	.short	193                             @ 0xc1
	.short	199                             @ 0xc7
	.short	206                             @ 0xce
	.short	212                             @ 0xd4
	.short	219                             @ 0xdb
	.short	225                             @ 0xe1
	.short	232                             @ 0xe8
	.short	239                             @ 0xef
	.short	245                             @ 0xf5
	.short	252                             @ 0xfc
	.short	259                             @ 0x103
	.short	266                             @ 0x10a
	.short	273                             @ 0x111
	.short	280                             @ 0x118
	.short	287                             @ 0x11f
	.short	294                             @ 0x126
	.short	301                             @ 0x12d
	.short	308                             @ 0x134
	.size	credits_private_math_lookup_wipe_count, 122

	.type	credits_private_math_lookup_clear_count,%object @ @credits_private_math_lookup_clear_count
	.p2align	1, 0x0
credits_private_math_lookup_clear_count:
	.short	0                               @ 0x0
	.short	1                               @ 0x1
	.short	4                               @ 0x4
	.short	11                              @ 0xb
	.short	21                              @ 0x15
	.short	34                              @ 0x22
	.short	51                              @ 0x33
	.short	72                              @ 0x48
	.short	97                              @ 0x61
	.short	125                             @ 0x7d
	.short	158                             @ 0x9e
	.short	195                             @ 0xc3
	.short	236                             @ 0xec
	.short	282                             @ 0x11a
	.short	332                             @ 0x14c
	.short	386                             @ 0x182
	.short	445                             @ 0x1bd
	.short	509                             @ 0x1fd
	.short	577                             @ 0x241
	.short	650                             @ 0x28a
	.short	728                             @ 0x2d8
	.short	810                             @ 0x32a
	.short	898                             @ 0x382
	.short	990                             @ 0x3de
	.short	1087                            @ 0x43f
	.short	1189                            @ 0x4a5
	.short	1297                            @ 0x511
	.short	1409                            @ 0x581
	.short	1526                            @ 0x5f6
	.short	1649                            @ 0x671
	.short	1776                            @ 0x6f0
	.short	1909                            @ 0x775
	.short	2048                            @ 0x800
	.size	credits_private_math_lookup_clear_count, 66

	.type	.L.str.79,%object               @ @.str.79
	.section	.rodata.str1.1,"aMS",%progbits,1
.L.str.79:
	.asciz	"invalid poweroff phase"
	.size	.L.str.79, 23

	.type	credits_private_math_lookup_poweroff_height,%object @ @credits_private_math_lookup_poweroff_height
	.section	.rodata,"a",%progbits
credits_private_math_lookup_poweroff_height:
	.ascii	"\024\b\004\003\002\001\001\001\001\001"
	.size	credits_private_math_lookup_poweroff_height, 10

	.type	.L.str.80,%object               @ @.str.80
	.section	.rodata.str1.1,"aMS",%progbits,1
.L.str.80:
	.asciz	"invalid SGR"
	.size	.L.str.80, 12

	.type	.L.str.81,%object               @ @.str.81
.L.str.81:
	.asciz	"unsupported SGR"
	.size	.L.str.81, 16

	.type	.L.str.82,%object               @ @.str.82
.L.str.82:
	.asciz	"invalid SGR terminator"
	.size	.L.str.82, 23

	.type	.L.str.83,%object               @ @.str.83
.L.str.83:
	.asciz	"\033[1m\033[31m"
	.size	.L.str.83, 10

	.type	.L.str.84,%object               @ @.str.84
.L.str.84:
	.asciz	"------------------------------------------------------------\n\n\n\n\n\n\n\n  $ "
	.size	.L.str.84, 73

	.type	.L.str.85,%object               @ @.str.85
.L.str.85:
	.asciz	"Automatic diagnosis unsuccessful. Please wait.\n> "
	.size	.L.str.85, 50

	.type	.L.str.86,%object               @ @.str.86
.L.str.86:
	.asciz	"No access points are broadcasting.\nManual search in progress.\nLast search 27.02.2019 (532 days ago)"
	.size	.L.str.86, 100

	.type	.L.str.87,%object               @ @.str.87
.L.str.87:
	.asciz	"  @@@  \nPBS #14\n Active"
	.size	.L.str.87, 24

	.type	.L.str.88,%object               @ @.str.88
.L.str.88:
	.asciz	"\033[32m\033[1m"
	.size	.L.str.88, 10

	.type	.L.str.89,%object               @ @.str.89
.L.str.89:
	.asciz	"---------------------------------------------------------\nSending > "
	.size	.L.str.89, 69

	.type	.L.str.90,%object               @ @.str.90
.L.str.90:
	.asciz	"unknown scene request"
	.size	.L.str.90, 22

	.type	.L.str.91,%object               @ @.str.91
.L.str.91:
	.asciz	"[##CLEAR|"
	.size	.L.str.91, 10

	.type	.L.str.92,%object               @ @.str.92
.L.str.92:
	.asciz	"  "
	.size	.L.str.92, 3

	.type	.L.str.93,%object               @ @.str.93
.L.str.93:
	.asciz	"ocean_b_0"
	.size	.L.str.93, 10

	.type	credits_private_data_segments_ocean_b_0,%object @ @credits_private_data_segments_ocean_b_0
	.section	.rodata,"a",%progbits
	.p2align	2, 0x0
credits_private_data_segments_ocean_b_0:
	.long	.L.str.111
	.long	0                               @ 0x0
	.long	.L.str.112
	.size	credits_private_data_segments_ocean_b_0, 12

	.type	.L.str.94,%object               @ @.str.94
	.section	.rodata.str1.1,"aMS",%progbits,1
.L.str.94:
	.asciz	"ocean_b_1"
	.size	.L.str.94, 10

	.type	credits_private_data_segments_ocean_b_1,%object @ @credits_private_data_segments_ocean_b_1
	.section	.rodata,"a",%progbits
	.p2align	2, 0x0
credits_private_data_segments_ocean_b_1:
	.long	.L.str.113
	.long	0                               @ 0x0
	.long	.L.str.112
	.size	credits_private_data_segments_ocean_b_1, 12

	.type	.L.str.95,%object               @ @.str.95
	.section	.rodata.str1.1,"aMS",%progbits,1
.L.str.95:
	.asciz	"ocean_b_2"
	.size	.L.str.95, 10

	.type	credits_private_data_segments_ocean_b_2,%object @ @credits_private_data_segments_ocean_b_2
	.section	.rodata,"a",%progbits
	.p2align	2, 0x0
credits_private_data_segments_ocean_b_2:
	.long	.L.str.114
	.long	0                               @ 0x0
	.long	.L.str.112
	.size	credits_private_data_segments_ocean_b_2, 12

	.type	.L.str.96,%object               @ @.str.96
	.section	.rodata.str1.1,"aMS",%progbits,1
.L.str.96:
	.asciz	"ocean_b_3"
	.size	.L.str.96, 10

	.type	credits_private_data_segments_ocean_b_3,%object @ @credits_private_data_segments_ocean_b_3
	.section	.rodata,"a",%progbits
	.p2align	2, 0x0
credits_private_data_segments_ocean_b_3:
	.long	.L.str.115
	.long	0                               @ 0x0
	.long	.L.str.112
	.size	credits_private_data_segments_ocean_b_3, 12

	.type	.L.str.97,%object               @ @.str.97
	.section	.rodata.str1.1,"aMS",%progbits,1
.L.str.97:
	.asciz	"ocean_c_0"
	.size	.L.str.97, 10

	.type	credits_private_data_segments_ocean_c_0,%object @ @credits_private_data_segments_ocean_c_0
	.section	.rodata,"a",%progbits
	.p2align	2, 0x0
credits_private_data_segments_ocean_c_0:
	.long	.L.str.116
	.long	0                               @ 0x0
	.long	.L.str.112
	.long	.L.str.117
	.long	800                             @ 0x320
	.long	.L.str.112
	.size	credits_private_data_segments_ocean_c_0, 24

	.type	.L.str.98,%object               @ @.str.98
	.section	.rodata.str1.1,"aMS",%progbits,1
.L.str.98:
	.asciz	"ocean_c_1"
	.size	.L.str.98, 10

	.type	credits_private_data_segments_ocean_c_1,%object @ @credits_private_data_segments_ocean_c_1
	.section	.rodata,"a",%progbits
	.p2align	2, 0x0
credits_private_data_segments_ocean_c_1:
	.long	.L.str.116
	.long	100                             @ 0x64
	.long	.L.str.112
	.long	.L.str.117
	.long	900                             @ 0x384
	.long	.L.str.112
	.size	credits_private_data_segments_ocean_c_1, 24

	.type	.L.str.99,%object               @ @.str.99
	.section	.rodata.str1.1,"aMS",%progbits,1
.L.str.99:
	.asciz	"ocean_c_2"
	.size	.L.str.99, 10

	.type	credits_private_data_segments_ocean_c_2,%object @ @credits_private_data_segments_ocean_c_2
	.section	.rodata,"a",%progbits
	.p2align	2, 0x0
credits_private_data_segments_ocean_c_2:
	.long	.L.str.116
	.long	200                             @ 0xc8
	.long	.L.str.112
	.long	.L.str.117
	.long	1000                            @ 0x3e8
	.long	.L.str.112
	.size	credits_private_data_segments_ocean_c_2, 24

	.type	.L.str.100,%object              @ @.str.100
	.section	.rodata.str1.1,"aMS",%progbits,1
.L.str.100:
	.asciz	"ocean_c_3"
	.size	.L.str.100, 10

	.type	credits_private_data_segments_ocean_c_3,%object @ @credits_private_data_segments_ocean_c_3
	.section	.rodata,"a",%progbits
	.p2align	2, 0x0
credits_private_data_segments_ocean_c_3:
	.long	.L.str.116
	.long	250                             @ 0xfa
	.long	.L.str.112
	.long	.L.str.117
	.long	1000                            @ 0x3e8
	.long	.L.str.112
	.size	credits_private_data_segments_ocean_c_3, 24

	.type	.L.str.101,%object              @ @.str.101
	.section	.rodata.str1.1,"aMS",%progbits,1
.L.str.101:
	.asciz	"funding_0"
	.size	.L.str.101, 10

	.type	credits_private_data_segments_funding_0,%object @ @credits_private_data_segments_funding_0
	.section	.rodata,"a",%progbits
	.p2align	2, 0x0
credits_private_data_segments_funding_0:
	.long	.L.str.118
	.long	0                               @ 0x0
	.long	.L.str.112
	.size	credits_private_data_segments_funding_0, 12

	.type	.L.str.102,%object              @ @.str.102
	.section	.rodata.str1.1,"aMS",%progbits,1
.L.str.102:
	.asciz	"funding_1"
	.size	.L.str.102, 10

	.type	credits_private_data_segments_funding_1,%object @ @credits_private_data_segments_funding_1
	.section	.rodata,"a",%progbits
	.p2align	2, 0x0
credits_private_data_segments_funding_1:
	.long	.L.str.119
	.long	0                               @ 0x0
	.long	.L.str.112
	.long	.L.str.120
	.long	100                             @ 0x64
	.long	.L.str.121
	.long	.L.str.122
	.long	0                               @ 0x0
	.long	.L.str.112
	.long	.L.str.123
	.long	280                             @ 0x118
	.long	.L.str.121
	.long	.L.str.124
	.long	500                             @ 0x1f4
	.long	.L.str.121
	.long	.L.str.125
	.long	650                             @ 0x28a
	.long	.L.str.121
	.long	.L.str.126
	.long	0                               @ 0x0
	.long	.L.str.112
	.size	credits_private_data_segments_funding_1, 84

	.type	.L.str.103,%object              @ @.str.103
	.section	.rodata.str1.1,"aMS",%progbits,1
.L.str.103:
	.asciz	"funding_2"
	.size	.L.str.103, 10

	.type	credits_private_data_segments_funding_2,%object @ @credits_private_data_segments_funding_2
	.section	.rodata,"a",%progbits
	.p2align	2, 0x0
credits_private_data_segments_funding_2:
	.long	.L.str.127
	.long	0                               @ 0x0
	.long	.L.str.112
	.size	credits_private_data_segments_funding_2, 12

	.type	.L.str.104,%object              @ @.str.104
	.section	.rodata.str1.1,"aMS",%progbits,1
.L.str.104:
	.asciz	"fundingx2_0"
	.size	.L.str.104, 12

	.type	credits_private_data_segments_fundingx2_0,%object @ @credits_private_data_segments_fundingx2_0
	.section	.rodata,"a",%progbits
	.p2align	2, 0x0
credits_private_data_segments_fundingx2_0:
	.long	.L.str.128
	.long	0                               @ 0x0
	.long	.L.str.112
	.size	credits_private_data_segments_fundingx2_0, 12

	.type	.L.str.105,%object              @ @.str.105
	.section	.rodata.str1.1,"aMS",%progbits,1
.L.str.105:
	.asciz	"fundingx2_1"
	.size	.L.str.105, 12

	.type	credits_private_data_segments_fundingx2_1,%object @ @credits_private_data_segments_fundingx2_1
	.section	.rodata,"a",%progbits
	.p2align	2, 0x0
credits_private_data_segments_fundingx2_1:
	.long	.L.str.129
	.long	0                               @ 0x0
	.long	.L.str.112
	.size	credits_private_data_segments_fundingx2_1, 12

	.type	.L.str.106,%object              @ @.str.106
	.section	.rodata.str1.1,"aMS",%progbits,1
.L.str.106:
	.asciz	"fundingx2_2"
	.size	.L.str.106, 12

	.type	credits_private_data_segments_fundingx2_2,%object @ @credits_private_data_segments_fundingx2_2
	.section	.rodata,"a",%progbits
	.p2align	2, 0x0
credits_private_data_segments_fundingx2_2:
	.long	.L.str.130
	.long	0                               @ 0x0
	.long	.L.str.112
	.size	credits_private_data_segments_fundingx2_2, 12

	.type	.L.str.107,%object              @ @.str.107
	.section	.rodata.str1.1,"aMS",%progbits,1
.L.str.107:
	.asciz	"fdg_single_0"
	.size	.L.str.107, 13

	.type	credits_private_data_segments_fdg_single_0,%object @ @credits_private_data_segments_fdg_single_0
	.section	.rodata,"a",%progbits
	.p2align	2, 0x0
credits_private_data_segments_fdg_single_0:
	.long	.L.str.131
	.long	0                               @ 0x0
	.long	.L.str.112
	.size	credits_private_data_segments_fdg_single_0, 12

	.type	.L.str.108,%object              @ @.str.108
	.section	.rodata.str1.1,"aMS",%progbits,1
.L.str.108:
	.asciz	"fdg_down_0"
	.size	.L.str.108, 11

	.type	credits_private_data_segments_fdg_down_0,%object @ @credits_private_data_segments_fdg_down_0
	.section	.rodata,"a",%progbits
	.p2align	2, 0x0
credits_private_data_segments_fdg_down_0:
	.long	.L.str.132
	.long	0                               @ 0x0
	.long	.L.str.112
	.size	credits_private_data_segments_fdg_down_0, 12

	.type	.L.str.109,%object              @ @.str.109
	.section	.rodata.str1.1,"aMS",%progbits,1
.L.str.109:
	.asciz	"fdg_down_1"
	.size	.L.str.109, 11

	.type	credits_private_data_segments_fdg_down_1,%object @ @credits_private_data_segments_fdg_down_1
	.section	.rodata,"a",%progbits
	.p2align	2, 0x0
credits_private_data_segments_fdg_down_1:
	.long	.L.str.133
	.long	0                               @ 0x0
	.long	.L.str.112
	.size	credits_private_data_segments_fdg_down_1, 12

	.type	.L.str.110,%object              @ @.str.110
	.section	.rodata.str1.1,"aMS",%progbits,1
.L.str.110:
	.asciz	"fdg_down_2"
	.size	.L.str.110, 11

	.type	credits_private_data_segments_fdg_down_2,%object @ @credits_private_data_segments_fdg_down_2
	.section	.rodata,"a",%progbits
	.p2align	2, 0x0
credits_private_data_segments_fdg_down_2:
	.long	.L.str.134
	.long	0                               @ 0x0
	.long	.L.str.112
	.size	credits_private_data_segments_fdg_down_2, 12

	.type	.L.str.111,%object              @ @.str.111
	.section	.rodata.str1.1,"aMS",%progbits,1
.L.str.111:
	.asciz	"Now for the official national~ weather~ service~ forecast\n~~~~for~~ Eastern Massachusetts~ inside of~~ I-~~~~4~~~~9~~~~~~~5~~,\n~~~~~~~~    including Boston,\n\n~~~~~~~~issued at 7~~~~:2~~1~~~~ PM~~~~, ~~~~~~~~~~~~~~Thursday, October~~ 2~~2~~nd."
	.size	.L.str.111, 243

	.type	.L.str.112,%object              @ @.str.112
.L.str.112:
	.zero	1
	.size	.L.str.112, 1

	.type	.L.str.113,%object              @ @.str.113
.L.str.113:
	.asciz	"Tonight:\n\n~~~~~Mostly cloudy with isolated~ showers~ until~~ mid~~~~night,\n~~~~~~~~~then mostly clear~~ after~~ mid~night.\n~~~~~~~~~Lows in the lower 4~~~~0~~~~s.\n~~~~~~~~~West winds 10~ to~~ 1~~5~~ miles~~ an~~ hour\n~~~~~with~ gusts~~ up~ to~ 2~~~~5~~~~ miles~~ an~~ hour~~.\n~~~~~~~~~~Chance of rain:~~~~ 2~~0~~~~ per~cent."
	.size	.L.str.113, 325

	.type	.L.str.114,%object              @ @.str.114
.L.str.114:
	.asciz	"Friday:\n\n~~Sunny.\n~~~~~~~~~~~~~~~~Lush colour with highs in the low~er 5~~~0~s.\n~~~~~~~~~~Northwest~~ winds~~ 10~~-~1~~5~~ miles~~ an~~ hour\n~~~~with gusts up to~~ 2~~~~5~~~~ miles~~ an~~ hour~~.\n~~~~~~~~~~~~~~~~Friday night,~~ mostly~ clear.\n~~~~~~~~~~~~~~Lows in the mid-3~~~~0~~s.\n~~~~~~~~~~~~~~~~North winds 10-1~~~5~~ miles~~ an~~ hour~~."
	.size	.L.str.114, 344

	.type	.L.str.115,%object              @ @.str.115
.L.str.115:
	.asciz	"Saturday:\n\n~~~~~~~~Partly sunny.\n~~~~~~~~High-@igh-@igh-@igh-@igh-@igh-@igh-@igh-@igh-@igh-@igh-@igh-@igh-@igh-@igh-@igh-@igh-@igh-@igh-i"
	.size	.L.str.115, 138

	.type	.L.str.116,%object              @ @.str.116
.L.str.116:
	.asciz	"Here~ are~ the 7~~~~ P~~~~M~~~~ ob~ser~va~tions for~~ the\n~~~Bos~ton~~ metro~po~li~tan~~~ ar~ea.\n\n~~~~~~~~~~~~~~~At Logan~~~~ Airport,~~~~~~ it was clou~~~~dy.\n~~~~~~~~~~~~~~~The tem~per~a~ture was 6~~~~8~~~~ de~grees,\n~~~~~~~~the dew point,~~ 4~~~~7~~ -\n~~~~~~and~ the~ re~la~tive~~ hu~mi~di~ty,~~~~ 4~~~~6~~~~ per~~cent.\n~~~~~~~~~~~~~~~~The~ wind~ was~ south~~west~ at 1~~~~3~ miles~~~~ an~~~~ ho~ur.\n~~~~~~~~~~~~The~ pres~~sure~~ was~~ 2~~~~9~~~~.~~~~~~~~9~~~~~~9~~~~~~ in~ches and ri~sing.\n~~~~~~~~Elsewher"
	.size	.L.str.116, 511

	.type	.L.str.117,%object              @ @.str.117
.L.str.117:
	.asciz	"rrrrrrrrr\n"
	.size	.L.str.117, 11

	.type	.L.str.118,%object              @ @.str.118
.L.str.118:
	.asciz	"Fun####ding#### for#### this#### pro####gram#### was#### made#### pos####si####ble###~\n  by###\n    by###\n      by###\n        by###\n          by#\nFun#\n   by\n     by\n       by\n         by\nFunding#\n       by\n         by\n           by\n             by\nFunding for\nFunding for thi#i#i#i#i#\nFunding for this pro####gram###\nFunding for this pro####gram###\n                   pro\n                     pro\n                       pro\nFunding for this pro#gram.#~\nFun####ding#### for#\n           by#\n             by#\nFunding made#### pos####si####ble#### by#### view####ers#### like#### you.###~\n####like#### you.##\n####like#### you.##\n####like#### you.##\n####like#### you.##\n####like#### you.##\n####like#### you.\n Fu\n  Fu\n"
	.size	.L.str.118, 712

	.type	.L.str.119,%object              @ @.str.119
.L.str.119:
	.asciz	"Broad####cast####\nBroadcast Cor####por##a####tion.~#####\nCor####po##ra####tion.#####\nCor####po##ra####tion.#####\n Cor###po\n  Cor###po\n    Co\n      Co\nCor####po##ra####tion.#####\nCor####po##ra####tion.#####\nCor####po##ra####tion.#####\n Cor###po\n  Cor###po\n    Co\n      Co\nCor####po##ra###tion.#\n Co\n  Co\nCor####po##ra###tion.#\n Co\n  Co\nCor####po##ra###tion.#\n Co\n  Co\nCor####po##ra###tion.#\n Co\n  Co\nCor####po##ra###tion.#\n Co\n  Co\nCor####po##ra###tion.#\n Co\n  Co\n Cor###po\n  Cor###po\n    Cor###po\n      Cor###po\n...#######\n Cor###po#\n     cor##\n  cor###po#\n    cor###po#\n cor##\n      cor###po#\n  cor###po#\n         cor##\n     cor###po#\n cor##\n   cor##\n     cor##\n       co#\n     co#\n cor###po#\n   cor##\n cor###po#\n   cor###po#\n     cor##\n       cor##\n         cor###po#\n"
	.size	.L.str.119, 771

	.type	.L.str.120,%object              @ @.str.120
.L.str.120:
	.asciz	" cor###po#\n   cor#\n cor###po#\n   cor#\n     cor#\n"
	.size	.L.str.120, 49

	.type	.L.str.121,%object              @ @.str.121
.L.str.121:
	.asciz	"# "
	.size	.L.str.121, 3

	.type	.L.str.122,%object              @ @.str.122
.L.str.122:
	.asciz	" ...#\n"
	.size	.L.str.122, 7

	.type	.L.str.123,%object              @ @.str.123
.L.str.123:
	.asciz	" co#\n  co#\n cor###po#\n   cor##\n     cor###po#\n   cor###po#\n            cor##\n      cor###po#\n"
	.size	.L.str.123, 94

	.type	.L.str.124,%object              @ @.str.124
.L.str.124:
	.asciz	"             cor###po#\n    cor##\n                  cor###po#\n  cor#\n          cor#\n                    cor#\n"
	.size	.L.str.124, 109

	.type	.L.str.125,%object              @ @.str.125
.L.str.125:
	.asciz	" co#\n                co#\n     cor###po#\n                        cor#\n  cor###po#\n           cor###po#\n             cor#\n  cor###po#\n"
	.size	.L.str.125, 133

	.type	.L.str.126,%object              @ @.str.126
.L.str.126:
	.asciz	" ???###p?#\n   ??r#\n           ???###??#\n                       co?#\n                                       ???#\n....#....#....#....#....#....#....#....#...#...#...#...#..#..\n              <##C##O##N##N##E##C##T##I##O##N## ##L##O##S##T##>########################################################################################################################################################################################################################################################################################################################################################################################################################################"
	.size	.L.str.126, 662

	.type	.L.str.127,%object              @ @.str.127
.L.str.127:
	.asciz	"--####--####-- ####-i####-a-####---- ####-up####-o-#\n-n####nu####-l ####fi####nan####cial ####sup####por#\nAn####nu####al ####fi####nan####cial ####sup####por#\nAn####nu####al ####fi####nan####cial ####sup####por#\nAn####nu####al ####fi####nan####cial ####sup####por#\nAn####nu####al ####fi####nan####cial ####sup####por#\nAn####nu####al ####fi####nan####cial ####sup####por#\nAn####nu###\nAn####nu###\n"
	.size	.L.str.127, 396

	.type	.L.str.128,%object              @ @.str.128
.L.str.128:
	.asciz	" By\n  ci\n    po\n      po\n  cor#\n    cor#\n        by#\n          by#\nrr#rr#rr#ro#oo#oo#aa#aa#aa#\n##  wers#\n ble#\n       b\n         b\n           F#\n         f\n       fi\n     i\nna#aa#aa#aa#aa#aa#aa#aa#\n Fun\nFun####ding#\n Fu#\n  Fun#\n fu#\nFun####ding#\n Fu#\n  Fun#\n fu#\nFun####ding#\n Fu#\n  Fun#\n fu#\nFun####ding#\nF\n    Fi\n   Fin\n          Fina\n      Finan\npo\npo\ncor#\nby#\n  por\nPor#tio##\nPor#tio##\nPor#tion# nn#nn#nn\nb\n b\nby###\n---- by###\n-------- by###\n------------ by###\n---------------- by#######\n>>#>>###\nBy#\n  by#\nfi#nan#\n b#\n  b#\n   nc#\n    nc#\nCorr#rr#rr#\nView####ers#### like#### you.#\n      like#### you.#\n    like## you.#\nFun####ding###\nFun####ding###\n  Fun###\n    Fu#\nFun####ding###\n  fu#\n    fu#\n      fu#\n        fu#\n          fu#\nCor####por####a####tion\nThe#### cor####por####a####tion#### for#### pub####lic#### broad####cast####ing#### and#### bi####-an####nual#### fii#ii#i\nof#\nnan#\nfor#\nfin####an####cial#### su#\nfor#### fin####an####cial#### ass#ss#ss\nin#\nview####ers###\nyou#####\n| ########This######## is######## P####B####S!############~\n"
	.size	.L.str.128, 1052

	.type	.L.str.129,%object              @ @.str.129
.L.str.129:
	.asciz	"02.####02.####2019#### Unknown###\n03.####02.####2019#### Unknown###\n04.####02.####2019#### Unknown###\n05.####02.####2019#### Unknown###\n06.####02.####2019#### Unknown###\n07.####02.####2019#### Unknown###\n08.####02.####2019#### Unknown###\n09.####02.####2019#### Unknown###\n10.####02.####2019#### Unknown###\n11.####02.####2019#### Unknown###\n12.####02.####2019#### Unknown###\n13.####02.####2019#### Unknown###\n14.####02.####2019#### Unknown###\n15.####02.####2019#### Unknown###\n16.####02.####2019#### Unknown###\n17.####02.####2019#### Unknown###\n18.####02.####2019#### Unknown###\n19.####02.####2019#### Unknown###\n20.####02.####2019#### Unknown###\n21.####02.####2019#### Unknown###\n22.####02.####2019#### Unknown###\n23.####02.####2019#### Unknown###\n24.####02.####2019#### Unknown###\n25.####02.####2019#### Unknown###\n26.####02.####2019#### Unknown###\n27.####02.####2019#### Unknown###\n| ########This######## is######## P####B####S!############~\n"
	.size	.L.str.129, 945

	.type	.L.str.130,%object              @ @.str.130
.L.str.130:
	.asciz	"S#e#a#r#c#h#i#n#g# #f#o#r# #a#c#c#e#s##s## ##p##o##i##n##t########.########.########.########\nSearching for access point########.########.########.########\nSearching for access point########.########.########.########\nSearching for access point########.########.########.########\nSearching for access point########.########.########.########\nSearching for access point########.########.########.########\nSearching for access point########.########.########.########\nSearching for access point########.########.########.########\nSearching for access point########.########.########.########\nSearching for access point########.########.########.########\nSearching for access point########.########.########.########\nSearching for access point########.########.########.########\nFound:################ P#B#S# #O#f#f#i#c#i#a#l# #1#1#.#### #R#e#s#t#a#r#t#i#n#g#.####.####.####"
	.size	.L.str.130, 872

	.type	.L.str.131,%object              @ @.str.131
.L.str.131:
	.asciz	"########.########.########.########.########.########.########.#######\n########.########.########.########.########.########.########.#######\n########.########.########.########.########.########.########.#######\n########.########.########.########.########.########.########.#######\n########.########.########.########.########.########.########.#######\n########.########.########.########.########.########.########.#######\nFun####ding#### for#### this#### pro####gram#### was#### made#### pos####sible#\n 7 > > > by###\n 7 > > > > by###\n 8 > > > by###\n 8 > > > > by###\n 9 > > > by###\nFun##\n     by\n       by\n         by\n           by\nFunding#\n     by\n       by\n         by\n           by\nfor\nthi#i#i#i\nPro####gram.#\nPro####gram.#\nPro\n  pro\n    pro\n      pro\nPro####gram.###\nFun####ding#### for####\n            by#\n              by#\nFunding for made#### pos####sible#### by#### view####ers#### like#### you.###\nlike#### you.#####\n##like#### you.#####\n##like#### you.#####\n##like#### you.#####\n##like#### you.#####\n##like#### you.###\nFu\n  Fu\nFun####ding#### for#### this#### pro####gram#### was#### made#### pos####sible#### by#\n                                         by###\n                                       by###\n                                     by###\n                                   by#\nFun###\n     by\n       by\n         by\n           by\nFunding#\n     by\n       by\n         by\n           by\nfor\nthi#i#i#i\nPro####gram.###\nPro####gram.###\nPro\n  pro\n    pro\n      pro\nPro####gram.#\nFun####ding#### for####\n            by#\n              by#\nFunding for made#### pos####sible#### by#### view####ers#### like#### you.###\nlike#### you.#####\n##like#### you.#####\n##like#### you.#####\n##like#### you.#####\n##like#### you.#####\n####< RET 200################################################################\n"
	.size	.L.str.131, 1811

	.type	.L.str.132,%object              @ @.str.132
.L.str.132:
	.asciz	"Fun####ding#### for#### this#### pro####gram#### was#\nmade#### made#### made#### made#### made#### made#### made#### made#### made###\npos####sible#### by#### view####ers#### like#### you.#######"
	.size	.L.str.132, 195

	.type	.L.str.133,%object              @ @.str.133
.L.str.133:
	.asciz	"---####----#### ---#### ----#### ---####----#### ---#\n----#### ----#### ----#### ----#### ----#### ----#### ----#### ----#### ----###\n---####-----#### --#### ----####---###### ----######## -##-##-##.#######"
	.size	.L.str.133, 207

	.type	.L.str.134,%object              @ @.str.134
.L.str.134:
	.asciz	"Fun####ding#### for#### this#### pro####gram#### was#\nmade#### made#### made#### made#### made#### made#### made#### made#### made###\npos####sible#### by#### view####ers###### like######## y##o##u##.#######"
	.size	.L.str.134, 207

	.type	credits_private_credits_timeline_events,%object @ @credits_private_credits_timeline_events
	.section	.rodata,"a",%progbits
	.p2align	2, 0x0
credits_private_credits_timeline_events:
	.long	0                               @ 0x0
	.long	0                               @ 0x0
	.long	0                               @ 0x0
	.long	1                               @ 0x1
	.long	58                              @ 0x3a
	.long	0                               @ 0x0
	.long	1                               @ 0x1
	.long	1                               @ 0x1
	.long	60                              @ 0x3c
	.long	0                               @ 0x0
	.long	2                               @ 0x2
	.long	1                               @ 0x1
	.long	60                              @ 0x3c
	.long	1                               @ 0x1
	.long	3                               @ 0x3
	.long	1                               @ 0x1
	.long	310                             @ 0x136
	.long	0                               @ 0x0
	.long	4                               @ 0x4
	.long	1                               @ 0x1
	.long	310                             @ 0x136
	.long	1                               @ 0x1
	.long	5                               @ 0x5
	.long	1                               @ 0x1
	.long	310                             @ 0x136
	.long	2                               @ 0x2
	.long	6                               @ 0x6
	.long	1                               @ 0x1
	.long	312                             @ 0x138
	.long	0                               @ 0x0
	.long	7                               @ 0x7
	.long	1                               @ 0x1
	.long	314                             @ 0x13a
	.long	0                               @ 0x0
	.long	8                               @ 0x8
	.long	1                               @ 0x1
	.long	320                             @ 0x140
	.long	0                               @ 0x0
	.long	9                               @ 0x9
	.long	2                               @ 0x2
	.long	590                             @ 0x24e
	.long	0                               @ 0x0
	.long	11                              @ 0xb
	.long	1                               @ 0x1
	.long	646                             @ 0x286
	.long	0                               @ 0x0
	.long	12                              @ 0xc
	.long	1                               @ 0x1
	.long	652                             @ 0x28c
	.long	0                               @ 0x0
	.long	13                              @ 0xd
	.long	2                               @ 0x2
	.long	656                             @ 0x290
	.long	0                               @ 0x0
	.long	15                              @ 0xf
	.long	1                               @ 0x1
	.long	666                             @ 0x29a
	.long	0                               @ 0x0
	.long	16                              @ 0x10
	.long	1                               @ 0x1
	.long	666                             @ 0x29a
	.long	1                               @ 0x1
	.long	17                              @ 0x11
	.long	1                               @ 0x1
	.long	850                             @ 0x352
	.long	0                               @ 0x0
	.long	18                              @ 0x12
	.long	1                               @ 0x1
	.long	999                             @ 0x3e7
	.long	0                               @ 0x0
	.long	19                              @ 0x13
	.long	1                               @ 0x1
	.long	1000                            @ 0x3e8
	.long	0                               @ 0x0
	.long	20                              @ 0x14
	.long	1                               @ 0x1
	.long	1000                            @ 0x3e8
	.long	1                               @ 0x1
	.long	21                              @ 0x15
	.long	1                               @ 0x1
	.long	1000                            @ 0x3e8
	.long	2                               @ 0x2
	.long	22                              @ 0x16
	.long	2                               @ 0x2
	.long	1044                            @ 0x414
	.long	0                               @ 0x0
	.long	24                              @ 0x18
	.long	1                               @ 0x1
	.long	1048                            @ 0x418
	.long	0                               @ 0x0
	.long	25                              @ 0x19
	.long	1                               @ 0x1
	.long	1052                            @ 0x41c
	.long	0                               @ 0x0
	.long	26                              @ 0x1a
	.long	1                               @ 0x1
	.long	1056                            @ 0x420
	.long	0                               @ 0x0
	.long	27                              @ 0x1b
	.long	1                               @ 0x1
	.long	1060                            @ 0x424
	.long	0                               @ 0x0
	.long	28                              @ 0x1c
	.long	1                               @ 0x1
	.long	1064                            @ 0x428
	.long	0                               @ 0x0
	.long	29                              @ 0x1d
	.long	1                               @ 0x1
	.long	1079                            @ 0x437
	.long	0                               @ 0x0
	.long	30                              @ 0x1e
	.long	1                               @ 0x1
	.long	1080                            @ 0x438
	.long	0                               @ 0x0
	.long	31                              @ 0x1f
	.long	1                               @ 0x1
	.long	1080                            @ 0x438
	.long	1                               @ 0x1
	.long	32                              @ 0x20
	.long	1                               @ 0x1
	.long	1080                            @ 0x438
	.long	2                               @ 0x2
	.long	33                              @ 0x21
	.long	1                               @ 0x1
	.long	1336                            @ 0x538
	.long	0                               @ 0x0
	.long	34                              @ 0x22
	.long	1                               @ 0x1
	.long	1844                            @ 0x734
	.long	0                               @ 0x0
	.long	35                              @ 0x23
	.long	1                               @ 0x1
	.long	1848                            @ 0x738
	.long	0                               @ 0x0
	.long	36                              @ 0x24
	.long	1                               @ 0x1
	.long	1848                            @ 0x738
	.long	1                               @ 0x1
	.long	37                              @ 0x25
	.long	1                               @ 0x1
	.long	1848                            @ 0x738
	.long	2                               @ 0x2
	.long	38                              @ 0x26
	.long	1                               @ 0x1
	.long	1848                            @ 0x738
	.long	3                               @ 0x3
	.long	39                              @ 0x27
	.long	2                               @ 0x2
	.long	1848                            @ 0x738
	.long	4                               @ 0x4
	.long	41                              @ 0x29
	.long	1                               @ 0x1
	.long	2348                            @ 0x92c
	.long	0                               @ 0x0
	.long	42                              @ 0x2a
	.long	1                               @ 0x1
	.long	2348                            @ 0x92c
	.long	1                               @ 0x1
	.long	43                              @ 0x2b
	.long	2                               @ 0x2
	.long	2352                            @ 0x930
	.long	0                               @ 0x0
	.long	45                              @ 0x2d
	.long	3                               @ 0x3
	.long	2976                            @ 0xba0
	.long	0                               @ 0x0
	.long	48                              @ 0x30
	.long	1                               @ 0x1
	.long	2976                            @ 0xba0
	.long	1                               @ 0x1
	.long	49                              @ 0x31
	.long	1                               @ 0x1
	.long	2976                            @ 0xba0
	.long	2                               @ 0x2
	.long	50                              @ 0x32
	.long	1                               @ 0x1
	.long	3007                            @ 0xbbf
	.long	0                               @ 0x0
	.long	51                              @ 0x33
	.long	1                               @ 0x1
	.long	3132                            @ 0xc3c
	.long	0                               @ 0x0
	.long	52                              @ 0x34
	.long	1                               @ 0x1
	.long	3132                            @ 0xc3c
	.long	1                               @ 0x1
	.long	53                              @ 0x35
	.long	1                               @ 0x1
	.long	3376                            @ 0xd30
	.long	0                               @ 0x0
	.long	54                              @ 0x36
	.long	1                               @ 0x1
	.long	3380                            @ 0xd34
	.long	0                               @ 0x0
	.long	55                              @ 0x37
	.long	1                               @ 0x1
	.long	3380                            @ 0xd34
	.long	1                               @ 0x1
	.long	56                              @ 0x38
	.long	1                               @ 0x1
	.long	3388                            @ 0xd3c
	.long	0                               @ 0x0
	.long	57                              @ 0x39
	.long	1                               @ 0x1
	.long	3390                            @ 0xd3e
	.long	0                               @ 0x0
	.long	58                              @ 0x3a
	.long	1                               @ 0x1
	.long	3390                            @ 0xd3e
	.long	1                               @ 0x1
	.long	59                              @ 0x3b
	.long	1                               @ 0x1
	.long	3390                            @ 0xd3e
	.long	2                               @ 0x2
	.long	60                              @ 0x3c
	.long	2                               @ 0x2
	.long	3390                            @ 0xd3e
	.long	3                               @ 0x3
	.long	62                              @ 0x3e
	.long	1                               @ 0x1
	.long	3390                            @ 0xd3e
	.long	4                               @ 0x4
	.long	63                              @ 0x3f
	.long	1                               @ 0x1
	.long	3390                            @ 0xd3e
	.long	5                               @ 0x5
	.long	64                              @ 0x40
	.long	1                               @ 0x1
	.long	3895                            @ 0xf37
	.long	0                               @ 0x0
	.long	65                              @ 0x41
	.long	1                               @ 0x1
	.long	3895                            @ 0xf37
	.long	1                               @ 0x1
	.long	66                              @ 0x42
	.long	1                               @ 0x1
	.long	3896                            @ 0xf38
	.long	0                               @ 0x0
	.long	67                              @ 0x43
	.long	1                               @ 0x1
	.long	3896                            @ 0xf38
	.long	1                               @ 0x1
	.long	68                              @ 0x44
	.long	1                               @ 0x1
	.long	3896                            @ 0xf38
	.long	2                               @ 0x2
	.long	69                              @ 0x45
	.long	1                               @ 0x1
	.long	3896                            @ 0xf38
	.long	3                               @ 0x3
	.long	70                              @ 0x46
	.long	1                               @ 0x1
	.long	3896                            @ 0xf38
	.long	4                               @ 0x4
	.long	71                              @ 0x47
	.long	1                               @ 0x1
	.long	4400                            @ 0x1130
	.long	0                               @ 0x0
	.long	72                              @ 0x48
	.long	1                               @ 0x1
	.long	4401                            @ 0x1131
	.long	0                               @ 0x0
	.long	73                              @ 0x49
	.long	1                               @ 0x1
	.long	4403                            @ 0x1133
	.long	0                               @ 0x0
	.long	74                              @ 0x4a
	.long	1                               @ 0x1
	.long	4405                            @ 0x1135
	.long	0                               @ 0x0
	.long	75                              @ 0x4b
	.long	1                               @ 0x1
	.long	4407                            @ 0x1137
	.long	0                               @ 0x0
	.long	76                              @ 0x4c
	.long	1                               @ 0x1
	.long	4409                            @ 0x1139
	.long	0                               @ 0x0
	.long	77                              @ 0x4d
	.long	1                               @ 0x1
	.long	4411                            @ 0x113b
	.long	0                               @ 0x0
	.long	78                              @ 0x4e
	.long	1                               @ 0x1
	.long	4413                            @ 0x113d
	.long	0                               @ 0x0
	.long	79                              @ 0x4f
	.long	1                               @ 0x1
	.long	4460                            @ 0x116c
	.long	0                               @ 0x0
	.long	80                              @ 0x50
	.long	1                               @ 0x1
	.long	4460                            @ 0x116c
	.long	1                               @ 0x1
	.long	81                              @ 0x51
	.long	1                               @ 0x1
	.long	4534                            @ 0x11b6
	.long	0                               @ 0x0
	.long	82                              @ 0x52
	.long	1                               @ 0x1
	.long	5500                            @ 0x157c
	.long	0                               @ 0x0
	.long	83                              @ 0x53
	.long	1                               @ 0x1
	.long	5500                            @ 0x157c
	.long	1                               @ 0x1
	.long	84                              @ 0x54
	.long	1                               @ 0x1
	.long	5500                            @ 0x157c
	.long	2                               @ 0x2
	.long	85                              @ 0x55
	.long	1                               @ 0x1
	.long	5500                            @ 0x157c
	.long	3                               @ 0x3
	.long	86                              @ 0x56
	.long	1                               @ 0x1
	.long	5788                            @ 0x169c
	.long	0                               @ 0x0
	.long	87                              @ 0x57
	.long	1                               @ 0x1
	.long	5916                            @ 0x171c
	.long	0                               @ 0x0
	.long	88                              @ 0x58
	.long	3                               @ 0x3
	.long	5916                            @ 0x171c
	.long	1                               @ 0x1
	.long	91                              @ 0x5b
	.long	1                               @ 0x1
	.long	6270                            @ 0x187e
	.long	0                               @ 0x0
	.long	92                              @ 0x5c
	.long	1                               @ 0x1
	.long	6508                            @ 0x196c
	.long	0                               @ 0x0
	.long	93                              @ 0x5d
	.long	1                               @ 0x1
	.long	6508                            @ 0x196c
	.long	1                               @ 0x1
	.long	94                              @ 0x5e
	.long	1                               @ 0x1
	.size	credits_private_credits_timeline_events, 1360

	.type	credits_private_credits_event_actions,%object @ @credits_private_credits_event_actions
	.p2align	2, 0x0
credits_private_credits_event_actions:
	.long	0                               @ 0x0
	.long	0                               @ 0x0
	.long	4294967295                      @ 0xffffffff
	.long	0                               @ 0x0
	.long	.L.str.112
	.long	0                               @ 0x0
	.long	2                               @ 0x2
	.long	4294967295                      @ 0xffffffff
	.long	0                               @ 0x0
	.long	.L.str.112
	.long	0                               @ 0x0
	.long	3                               @ 0x3
	.long	4294967295                      @ 0xffffffff
	.long	0                               @ 0x0
	.long	.L.str.112
	.long	5                               @ 0x5
	.long	3                               @ 0x3
	.long	1                               @ 0x1
	.long	0                               @ 0x0
	.long	.L.str.112
	.long	5                               @ 0x5
	.long	3                               @ 0x3
	.long	1                               @ 0x1
	.long	4294967295                      @ 0xffffffff
	.long	.L.str.136
	.long	8                               @ 0x8
	.long	3                               @ 0x3
	.long	0                               @ 0x0
	.long	3                               @ 0x3
	.long	.L.str.112
	.long	9                               @ 0x9
	.long	3                               @ 0x3
	.long	0                               @ 0x0
	.long	0                               @ 0x0
	.long	.L.str.137
	.long	9                               @ 0x9
	.long	3                               @ 0x3
	.long	0                               @ 0x0
	.long	0                               @ 0x0
	.long	.L.str.41
	.long	9                               @ 0x9
	.long	3                               @ 0x3
	.long	0                               @ 0x0
	.long	0                               @ 0x0
	.long	.L.str.137
	.long	5                               @ 0x5
	.long	3                               @ 0x3
	.long	1                               @ 0x1
	.long	1                               @ 0x1
	.long	.L.str.112
	.long	6                               @ 0x6
	.long	3                               @ 0x3
	.long	1                               @ 0x1
	.long	0                               @ 0x0
	.long	.L.str.112
	.long	9                               @ 0x9
	.long	3                               @ 0x3
	.long	0                               @ 0x0
	.long	0                               @ 0x0
	.long	.L.str.42
	.long	5                               @ 0x5
	.long	3                               @ 0x3
	.long	1                               @ 0x1
	.long	4294967295                      @ 0xffffffff
	.long	.L.str.138
	.long	5                               @ 0x5
	.long	3                               @ 0x3
	.long	1                               @ 0x1
	.long	2                               @ 0x2
	.long	.L.str.112
	.long	6                               @ 0x6
	.long	3                               @ 0x3
	.long	1                               @ 0x1
	.long	0                               @ 0x0
	.long	.L.str.112
	.long	9                               @ 0x9
	.long	3                               @ 0x3
	.long	0                               @ 0x0
	.long	0                               @ 0x0
	.long	.L.str.139
	.long	9                               @ 0x9
	.long	3                               @ 0x3
	.long	0                               @ 0x0
	.long	0                               @ 0x0
	.long	.L.str.140
	.long	8                               @ 0x8
	.long	3                               @ 0x3
	.long	0                               @ 0x0
	.long	6                               @ 0x6
	.long	.L.str.112
	.long	9                               @ 0x9
	.long	3                               @ 0x3
	.long	0                               @ 0x0
	.long	0                               @ 0x0
	.long	.L.str.139
	.long	5                               @ 0x5
	.long	3                               @ 0x3
	.long	1                               @ 0x1
	.long	4294967295                      @ 0xffffffff
	.long	.L.str.141
	.long	9                               @ 0x9
	.long	3                               @ 0x3
	.long	0                               @ 0x0
	.long	0                               @ 0x0
	.long	.L.str.42
	.long	8                               @ 0x8
	.long	3                               @ 0x3
	.long	0                               @ 0x0
	.long	13                              @ 0xd
	.long	.L.str.112
	.long	5                               @ 0x5
	.long	3                               @ 0x3
	.long	1                               @ 0x1
	.long	3                               @ 0x3
	.long	.L.str.112
	.long	6                               @ 0x6
	.long	3                               @ 0x3
	.long	1                               @ 0x1
	.long	0                               @ 0x0
	.long	.L.str.112
	.long	8                               @ 0x8
	.long	3                               @ 0x3
	.long	0                               @ 0x0
	.long	102                             @ 0x66
	.long	.L.str.112
	.long	8                               @ 0x8
	.long	3                               @ 0x3
	.long	0                               @ 0x0
	.long	230                             @ 0xe6
	.long	.L.str.112
	.long	8                               @ 0x8
	.long	3                               @ 0x3
	.long	0                               @ 0x0
	.long	500                             @ 0x1f4
	.long	.L.str.112
	.long	8                               @ 0x8
	.long	3                               @ 0x3
	.long	0                               @ 0x0
	.long	760                             @ 0x2f8
	.long	.L.str.112
	.long	8                               @ 0x8
	.long	3                               @ 0x3
	.long	0                               @ 0x0
	.long	1600                            @ 0x640
	.long	.L.str.112
	.long	8                               @ 0x8
	.long	3                               @ 0x3
	.long	0                               @ 0x0
	.long	2500                            @ 0x9c4
	.long	.L.str.112
	.long	0                               @ 0x0
	.long	2                               @ 0x2
	.long	4294967295                      @ 0xffffffff
	.long	0                               @ 0x0
	.long	.L.str.112
	.long	0                               @ 0x0
	.long	8                               @ 0x8
	.long	4294967295                      @ 0xffffffff
	.long	0                               @ 0x0
	.long	.L.str.112
	.long	1                               @ 0x1
	.long	7                               @ 0x7
	.long	4294967295                      @ 0xffffffff
	.long	0                               @ 0x0
	.long	.L.str.112
	.long	0                               @ 0x0
	.long	8                               @ 0x8
	.long	4294967295                      @ 0xffffffff
	.long	0                               @ 0x0
	.long	.L.str.112
	.long	0                               @ 0x0
	.long	9                               @ 0x9
	.long	4294967295                      @ 0xffffffff
	.long	0                               @ 0x0
	.long	.L.str.112
	.long	2                               @ 0x2
	.long	7                               @ 0x7
	.long	4294967295                      @ 0xffffffff
	.long	0                               @ 0x0
	.long	.L.str.112
	.long	0                               @ 0x0
	.long	10                              @ 0xa
	.long	4294967295                      @ 0xffffffff
	.long	0                               @ 0x0
	.long	.L.str.112
	.long	1                               @ 0x1
	.long	11                              @ 0xb
	.long	4294967295                      @ 0xffffffff
	.long	0                               @ 0x0
	.long	.L.str.112
	.long	1                               @ 0x1
	.long	12                              @ 0xc
	.long	4294967295                      @ 0xffffffff
	.long	0                               @ 0x0
	.long	.L.str.112
	.long	3                               @ 0x3
	.long	4294967295                      @ 0xffffffff
	.long	4294967295                      @ 0xffffffff
	.long	0                               @ 0x0
	.long	.L.str.112
	.long	4                               @ 0x4
	.long	4294967295                      @ 0xffffffff
	.long	4294967295                      @ 0xffffffff
	.long	1                               @ 0x1
	.long	.L.str.112
	.long	5                               @ 0x5
	.long	10                              @ 0xa
	.long	0                               @ 0x0
	.long	8                               @ 0x8
	.long	.L.str.112
	.long	5                               @ 0x5
	.long	10                              @ 0xa
	.long	0                               @ 0x0
	.long	4294967294                      @ 0xfffffffe
	.long	.L.str.112
	.long	3                               @ 0x3
	.long	4294967295                      @ 0xffffffff
	.long	4294967295                      @ 0xffffffff
	.long	0                               @ 0x0
	.long	.L.str.112
	.long	4                               @ 0x4
	.long	4294967295                      @ 0xffffffff
	.long	4294967295                      @ 0xffffffff
	.long	1                               @ 0x1
	.long	.L.str.112
	.long	5                               @ 0x5
	.long	10                              @ 0xa
	.long	0                               @ 0x0
	.long	9                               @ 0x9
	.long	.L.str.112
	.long	6                               @ 0x6
	.long	10                              @ 0xa
	.long	0                               @ 0x0
	.long	0                               @ 0x0
	.long	.L.str.112
	.long	7                               @ 0x7
	.long	10                              @ 0xa
	.long	0                               @ 0x0
	.long	0                               @ 0x0
	.long	.L.str.112
	.long	2                               @ 0x2
	.long	11                              @ 0xb
	.long	4294967295                      @ 0xffffffff
	.long	0                               @ 0x0
	.long	.L.str.112
	.long	2                               @ 0x2
	.long	12                              @ 0xc
	.long	4294967295                      @ 0xffffffff
	.long	0                               @ 0x0
	.long	.L.str.112
	.long	0                               @ 0x0
	.long	1                               @ 0x1
	.long	4294967295                      @ 0xffffffff
	.long	0                               @ 0x0
	.long	.L.str.112
	.long	0                               @ 0x0
	.long	2                               @ 0x2
	.long	4294967295                      @ 0xffffffff
	.long	0                               @ 0x0
	.long	.L.str.112
	.long	0                               @ 0x0
	.long	14                              @ 0xe
	.long	4294967295                      @ 0xffffffff
	.long	0                               @ 0x0
	.long	.L.str.112
	.long	5                               @ 0x5
	.long	14                              @ 0xe
	.long	6                               @ 0x6
	.long	10                              @ 0xa
	.long	.L.str.112
	.long	0                               @ 0x0
	.long	5                               @ 0x5
	.long	4294967295                      @ 0xffffffff
	.long	0                               @ 0x0
	.long	.L.str.112
	.long	0                               @ 0x0
	.long	2                               @ 0x2
	.long	4294967295                      @ 0xffffffff
	.long	0                               @ 0x0
	.long	.L.str.112
	.long	0                               @ 0x0
	.long	15                              @ 0xf
	.long	4294967295                      @ 0xffffffff
	.long	0                               @ 0x0
	.long	.L.str.112
	.long	0                               @ 0x0
	.long	2                               @ 0x2
	.long	4294967295                      @ 0xffffffff
	.long	0                               @ 0x0
	.long	.L.str.112
	.long	0                               @ 0x0
	.long	16                              @ 0x10
	.long	4294967295                      @ 0xffffffff
	.long	0                               @ 0x0
	.long	.L.str.112
	.long	1                               @ 0x1
	.long	17                              @ 0x11
	.long	4294967295                      @ 0xffffffff
	.long	0                               @ 0x0
	.long	.L.str.112
	.long	3                               @ 0x3
	.long	4294967295                      @ 0xffffffff
	.long	4294967295                      @ 0xffffffff
	.long	0                               @ 0x0
	.long	.L.str.112
	.long	4                               @ 0x4
	.long	4294967295                      @ 0xffffffff
	.long	4294967295                      @ 0xffffffff
	.long	1                               @ 0x1
	.long	.L.str.112
	.long	5                               @ 0x5
	.long	17                              @ 0x11
	.long	0                               @ 0x0
	.long	11                              @ 0xb
	.long	.L.str.112
	.long	5                               @ 0x5
	.long	17                              @ 0x11
	.long	1                               @ 0x1
	.long	12                              @ 0xc
	.long	.L.str.112
	.long	5                               @ 0x5
	.long	17                              @ 0x11
	.long	3                               @ 0x3
	.long	13                              @ 0xd
	.long	.L.str.112
	.long	2                               @ 0x2
	.long	17                              @ 0x11
	.long	4294967295                      @ 0xffffffff
	.long	0                               @ 0x0
	.long	.L.str.112
	.long	0                               @ 0x0
	.long	2                               @ 0x2
	.long	4294967295                      @ 0xffffffff
	.long	0                               @ 0x0
	.long	.L.str.112
	.long	0                               @ 0x0
	.long	4                               @ 0x4
	.long	4294967295                      @ 0xffffffff
	.long	0                               @ 0x0
	.long	.L.str.112
	.long	5                               @ 0x5
	.long	4                               @ 0x4
	.long	1                               @ 0x1
	.long	4                               @ 0x4
	.long	.L.str.112
	.long	5                               @ 0x5
	.long	4                               @ 0x4
	.long	2                               @ 0x2
	.long	5                               @ 0x5
	.long	.L.str.112
	.long	5                               @ 0x5
	.long	4                               @ 0x4
	.long	3                               @ 0x3
	.long	6                               @ 0x6
	.long	.L.str.112
	.long	5                               @ 0x5
	.long	4                               @ 0x4
	.long	4                               @ 0x4
	.long	7                               @ 0x7
	.long	.L.str.112
	.long	5                               @ 0x5
	.long	4                               @ 0x4
	.long	1                               @ 0x1
	.long	4294967295                      @ 0xffffffff
	.long	.L.str.141
	.long	10                              @ 0xa
	.long	4                               @ 0x4
	.long	0                               @ 0x0
	.long	0                               @ 0x0
	.long	.L.str.112
	.long	10                              @ 0xa
	.long	4                               @ 0x4
	.long	0                               @ 0x0
	.long	0                               @ 0x0
	.long	.L.str.112
	.long	10                              @ 0xa
	.long	4                               @ 0x4
	.long	0                               @ 0x0
	.long	0                               @ 0x0
	.long	.L.str.112
	.long	10                              @ 0xa
	.long	4                               @ 0x4
	.long	0                               @ 0x0
	.long	0                               @ 0x0
	.long	.L.str.112
	.long	10                              @ 0xa
	.long	4                               @ 0x4
	.long	0                               @ 0x0
	.long	0                               @ 0x0
	.long	.L.str.112
	.long	9                               @ 0x9
	.long	4                               @ 0x4
	.long	0                               @ 0x0
	.long	0                               @ 0x0
	.long	.L.str.135
	.long	0                               @ 0x0
	.long	2                               @ 0x2
	.long	4294967295                      @ 0xffffffff
	.long	0                               @ 0x0
	.long	.L.str.112
	.long	0                               @ 0x0
	.long	18                              @ 0x12
	.long	4294967295                      @ 0xffffffff
	.long	0                               @ 0x0
	.long	.L.str.112
	.long	1                               @ 0x1
	.long	19                              @ 0x13
	.long	4294967295                      @ 0xffffffff
	.long	0                               @ 0x0
	.long	.L.str.112
	.long	5                               @ 0x5
	.long	19                              @ 0x13
	.long	1                               @ 0x1
	.long	14                              @ 0xe
	.long	.L.str.112
	.long	2                               @ 0x2
	.long	19                              @ 0x13
	.long	4294967295                      @ 0xffffffff
	.long	0                               @ 0x0
	.long	.L.str.112
	.long	0                               @ 0x0
	.long	2                               @ 0x2
	.long	4294967295                      @ 0xffffffff
	.long	0                               @ 0x0
	.long	.L.str.112
	.long	0                               @ 0x0
	.long	8                               @ 0x8
	.long	4294967295                      @ 0xffffffff
	.long	0                               @ 0x0
	.long	.L.str.112
	.long	1                               @ 0x1
	.long	20                              @ 0x14
	.long	4294967295                      @ 0xffffffff
	.long	0                               @ 0x0
	.long	.L.str.112
	.long	5                               @ 0x5
	.long	20                              @ 0x14
	.long	0                               @ 0x0
	.long	15                              @ 0xf
	.long	.L.str.112
	.long	5                               @ 0x5
	.long	20                              @ 0x14
	.long	0                               @ 0x0
	.long	16                              @ 0x10
	.long	.L.str.112
	.long	7                               @ 0x7
	.long	20                              @ 0x14
	.long	0                               @ 0x0
	.long	0                               @ 0x0
	.long	.L.str.112
	.long	6                               @ 0x6
	.long	20                              @ 0x14
	.long	0                               @ 0x0
	.long	0                               @ 0x0
	.long	.L.str.112
	.long	5                               @ 0x5
	.long	20                              @ 0x14
	.long	1                               @ 0x1
	.long	17                              @ 0x11
	.long	.L.str.112
	.long	0                               @ 0x0
	.long	9                               @ 0x9
	.long	4294967295                      @ 0xffffffff
	.long	0                               @ 0x0
	.long	.L.str.112
	.long	2                               @ 0x2
	.long	20                              @ 0x14
	.long	4294967295                      @ 0xffffffff
	.long	0                               @ 0x0
	.long	.L.str.112
	.long	0                               @ 0x0
	.long	2                               @ 0x2
	.long	4294967295                      @ 0xffffffff
	.long	0                               @ 0x0
	.long	.L.str.112
	.size	credits_private_credits_event_actions, 1900

	.type	credits_private_credits_apply_event.lines,%object @ @credits_private_credits_apply_event.lines
	.data
	.p2align	2, 0x0
credits_private_credits_apply_event.lines:
	.long	.L.str.112
	.long	0                               @ 0x0
	.long	1                               @ 0x1
	.long	.L.str.112
	.long	0                               @ 0x0
	.long	1                               @ 0x1
	.size	credits_private_credits_apply_event.lines, 24

	.type	credits_private_credits_apply_event.empty,%object @ @credits_private_credits_apply_event.empty
	.section	.rodata,"a",%progbits
	.p2align	2, 0x0
credits_private_credits_apply_event.empty:
	.long	.L.str.112
	.long	0                               @ 0x0
	.long	2                               @ 0x2
	.long	1                               @ 0x1
	.long	credits_private_credits_apply_event.lines
	.size	credits_private_credits_apply_event.empty, 20

	.type	.L.str.135,%object              @ @.str.135
	.section	.rodata.str1.1,"aMS",%progbits,1
.L.str.135:
	.asciz	"\033[22m\033[30m"
	.size	.L.str.135, 11

	.type	.L.str.136,%object              @ @.str.136
.L.str.136:
	.asciz	"[##CLEAR|60;6"
	.size	.L.str.136, 14

	.type	.L.str.137,%object              @ @.str.137
.L.str.137:
	.asciz	"\033[22m\033[34m"
	.size	.L.str.137, 11

	.type	.L.str.138,%object              @ @.str.138
.L.str.138:
	.asciz	"[##CLEAR|60;8"
	.size	.L.str.138, 14

	.type	.L.str.139,%object              @ @.str.139
.L.str.139:
	.asciz	"\033[22m\033[33m"
	.size	.L.str.139, 11

	.type	.L.str.140,%object              @ @.str.140
.L.str.140:
	.asciz	"\033[1m\033[33m"
	.size	.L.str.140, 10

	.type	.L.str.141,%object              @ @.str.141
.L.str.141:
	.asciz	"[##CLEAR|60;10"
	.size	.L.str.141, 15

	.type	.L.str.142,%object              @ @.str.142
.L.str.142:
	.asciz	"\033[32m\033[22m"
	.size	.L.str.142, 11

	.type	.L.str.143,%object              @ @.str.143
.L.str.143:
	.asciz	"> "
	.size	.L.str.143, 3

	.type	.L.str.144,%object              @ @.str.144
.L.str.144:
	.asciz	"- "
	.size	.L.str.144, 3

	.type	.L.str.145,%object              @ @.str.145
.L.str.145:
	.asciz	"Blizzard"
	.size	.L.str.145, 9

	.type	.L.str.146,%object              @ @.str.146
.L.str.146:
	.asciz	"Hurricane"
	.size	.L.str.146, 10

	.type	.L.str.147,%object              @ @.str.147
.L.str.147:
	.asciz	"Snowstorm"
	.size	.L.str.147, 10

	.type	.L.str.148,%object              @ @.str.148
.L.str.148:
	.asciz	"Storm"
	.size	.L.str.148, 6

	.type	.L.str.149,%object              @ @.str.149
.L.str.149:
	.asciz	"Snow"
	.size	.L.str.149, 5

	.type	.L.str.150,%object              @ @.str.150
.L.str.150:
	.asciz	"Rain"
	.size	.L.str.150, 5

	.type	.L.str.151,%object              @ @.str.151
.L.str.151:
	.asciz	"Sleet"
	.size	.L.str.151, 6

	.type	.L.str.152,%object              @ @.str.152
.L.str.152:
	.asciz	"Drizzle"
	.size	.L.str.152, 8

	.type	.L.str.153,%object              @ @.str.153
.L.str.153:
	.asciz	"Overcast"
	.size	.L.str.153, 9

	.type	.L.str.154,%object              @ @.str.154
.L.str.154:
	.asciz	"Cloudy"
	.size	.L.str.154, 7

	.type	.L.str.155,%object              @ @.str.155
.L.str.155:
	.asciz	"Partly cloudy"
	.size	.L.str.155, 14

	.type	.L.str.156,%object              @ @.str.156
.L.str.156:
	.asciz	"Sunny"
	.size	.L.str.156, 6

	.type	.L.str.157,%object              @ @.str.157
.L.str.157:
	.asciz	"Partly sunny"
	.size	.L.str.157, 13

	.type	.L.str.158,%object              @ @.str.158
.L.str.158:
	.asciz	"Clear"
	.size	.L.str.158, 6

	.type	credits_private_framebuffer_font,%object @ @credits_private_framebuffer_font
	.section	.rodata,"a",%progbits
	.p2align	1, 0x0
credits_private_framebuffer_font:
	.short	0                               @ 0x0
	.short	9346                            @ 0x2482
	.short	23040                           @ 0x5a00
	.short	21845                           @ 0x5555
	.short	15518                           @ 0x3c9e
	.short	17057                           @ 0x42a1
	.short	10923                           @ 0x2aab
	.short	9216                            @ 0x2400
	.short	10530                           @ 0x2922
	.short	8778                            @ 0x224a
	.short	2728                            @ 0xaa8
	.short	1488                            @ 0x5d0
	.short	18                              @ 0x12
	.short	448                             @ 0x1c0
	.short	4                               @ 0x4
	.short	672                             @ 0x2a0
	.short	15214                           @ 0x3b6e
	.short	11415                           @ 0x2c97
	.short	25575                           @ 0x63e7
	.short	25230                           @ 0x628e
	.short	19401                           @ 0x4bc9
	.short	31182                           @ 0x79ce
	.short	14830                           @ 0x39ee
	.short	29330                           @ 0x7292
	.short	15022                           @ 0x3aae
	.short	15310                           @ 0x3bce
	.short	1040                            @ 0x410
	.short	1042                            @ 0x412
	.short	5393                            @ 0x1511
	.short	3640                            @ 0xe38
	.short	17492                           @ 0x4454
	.short	29314                           @ 0x7282
	.short	29679                           @ 0x73ef
	.short	31725                           @ 0x7bed
	.short	27567                           @ 0x6baf
	.short	31015                           @ 0x7927
	.short	27502                           @ 0x6b6e
	.short	31207                           @ 0x79e7
	.short	31204                           @ 0x79e4
	.short	31087                           @ 0x796f
	.short	23533                           @ 0x5bed
	.short	29847                           @ 0x7497
	.short	12879                           @ 0x324f
	.short	23917                           @ 0x5d6d
	.short	18727                           @ 0x4927
	.short	24557                           @ 0x5fed
	.short	31597                           @ 0x7b6d
	.short	31599                           @ 0x7b6f
	.short	31716                           @ 0x7be4
	.short	31689                           @ 0x7bc9
	.short	31733                           @ 0x7bf5
	.short	31183                           @ 0x79cf
	.short	29842                           @ 0x7492
	.short	23407                           @ 0x5b6f
	.short	23402                           @ 0x5b6a
	.short	23549                           @ 0x5bfd
	.short	23213                           @ 0x5aad
	.short	23186                           @ 0x5a92
	.short	29351                           @ 0x72a7
	.short	26918                           @ 0x6926
	.short	2184                            @ 0x888
	.short	12875                           @ 0x324b
	.short	10752                           @ 0x2a00
	.short	7                               @ 0x7
	.short	8704                            @ 0x2200
	.short	29679                           @ 0x73ef
	.short	18927                           @ 0x49ef
	.short	487                             @ 0x1e7
	.short	5103                            @ 0x13ef
	.short	31719                           @ 0x7be7
	.short	31140                           @ 0x79a4
	.short	31695                           @ 0x7bcf
	.short	18925                           @ 0x49ed
	.short	8338                            @ 0x2092
	.short	8342                            @ 0x2096
	.short	19373                           @ 0x4bad
	.short	9363                            @ 0x2493
	.short	3053                            @ 0xbed
	.short	3949                            @ 0xf6d
	.short	3951                            @ 0xf6f
	.short	3964                            @ 0xf7c
	.short	3961                            @ 0xf79
	.short	2980                            @ 0xba4
	.short	14478                           @ 0x388e
	.short	1491                            @ 0x5d3
	.short	367                             @ 0x16f
	.short	362                             @ 0x16a
	.short	2941                            @ 0xb7d
	.short	2728                            @ 0xaa8
	.short	23503                           @ 0x5bcf
	.short	3751                            @ 0xea7
	.short	5201                            @ 0x1451
	.short	9362                            @ 0x2492
	.short	17684                           @ 0x4514
	.short	992                             @ 0x3e0
	.size	credits_private_framebuffer_font, 190

	.type	.L.str.159,%object              @ @.str.159
	.section	.rodata.str1.1,"aMS",%progbits,1
.L.str.159:
	.asciz	"nonmonotonic fixed clock"
	.size	.L.str.159, 25

	.type	.L.str.160,%object              @ @.str.160
.L.str.160:
	.asciz	"Q32.32 time overflow"
	.size	.L.str.160, 21

	.type	.L.str.161,%object              @ @.str.161
.L.str.161:
	.asciz	"beat range"
	.size	.L.str.161, 11

	.type	.L.str.162,%object              @ @.str.162
.L.str.162:
	.asciz	"unsupported UTF-8"
	.size	.L.str.162, 18

	.type	.L.str.163,%object              @ @.str.163
.L.str.163:
	.asciz	"invalid 60x20 text region"
	.size	.L.str.163, 26

	.type	credits_private_scenes60_noise.chars,%object @ @credits_private_scenes60_noise.chars
	.section	.rodata,"a",%progbits
	.p2align	2, 0x0
credits_private_scenes60_noise.chars:
	.long	.L.str.164
	.long	.L.str.165
	.long	.L.str.92
	.size	credits_private_scenes60_noise.chars, 12

	.type	.L.str.164,%object              @ @.str.164
	.section	.rodata.str1.1,"aMS",%progbits,1
.L.str.164:
	.asciz	"##"
	.size	.L.str.164, 3

	.type	.L.str.165,%object              @ @.str.165
.L.str.165:
	.asciz	"@@"
	.size	.L.str.165, 3

	.type	.L.str.166,%object              @ @.str.166
.L.str.166:
	.asciz	"\033[22m\033[37m"
	.size	.L.str.166, 11

	.type	.L__const.credits_private_scenes60_fatal_error.text,%object @ @__const.credits_private_scenes60_fatal_error.text
	.section	.rodata,"a",%progbits
	.p2align	2, 0x0
.L__const.credits_private_scenes60_fatal_error.text:
	.asciz	"The system has encountered a fatal error. Please wait.\n\n[ERR: 801]\n\n\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000"
	.size	.L__const.credits_private_scenes60_fatal_error.text, 256

	.type	.L.str.167,%object              @ @.str.167
	.section	.rodata.str1.1,"aMS",%progbits,1
.L.str.167:
	.asciz	"%04x%s"
	.size	.L.str.167, 7

	.type	.L.str.168,%object              @ @.str.168
.L.str.168:
	.asciz	" "
	.size	.L.str.168, 2

	.type	.L.str.169,%object              @ @.str.169
.L.str.169:
	.asciz	"\n"
	.size	.L.str.169, 2

	.type	.L.str.170,%object              @ @.str.170
.L.str.170:
	.asciz	"fatal error text capacity"
	.size	.L.str.170, 26

	.type	.L.str.171,%object              @ @.str.171
.L.str.171:
	.asciz	"animation | plaaosert"
	.size	.L.str.171, 22

	.type	.L.str.172,%object              @ @.str.172
.L.str.172:
	.asciz	"bgm       | Frums - Credits"
	.size	.L.str.172, 28

	.type	.L.str.173,%object              @ @.str.173
.L.str.173:
	.asciz	"Modded by StevenArai"
	.size	.L.str.173, 21

	.type	.L.str.174,%object              @ @.str.174
.L.str.174:
	.asciz	"\033[36m\033[22m"
	.size	.L.str.174, 11

	.type	.L.str.175,%object              @ @.str.175
.L.str.175:
	.asciz	"On the GU256X128C-3900 VFD Panel"
	.size	.L.str.175, 33

	.type	.L.str.176,%object              @ @.str.176
.L.str.176:
	.asciz	"------------------------------------------------------------"
	.size	.L.str.176, 61

	.type	.L.str.178,%object              @ @.str.178
.L.str.178:
	.asciz	"----------------------------\n|                          |\n|                          |\n|                          |\n|                          |\n|                          |\n|                          |\n"
	.size	.L.str.178, 204

	.type	.L.str.179,%object              @ @.str.179
.L.str.179:
	.asciz	"22.10.2009"
	.size	.L.str.179, 11

	.type	.L.str.180,%object              @ @.str.180
.L.str.180:
	.asciz	"----------------------------"
	.size	.L.str.180, 29

	.type	.L.str.181,%object              @ @.str.181
.L.str.181:
	.asciz	"43\302\260F      Wind 13 mph W \n                        "
	.size	.L.str.181, 51

	.type	.L.str.182,%object              @ @.str.182
.L.str.182:
	.asciz	"43\302\260F      Wind 13 mph W "
	.size	.L.str.182, 26

	.type	.L.str.183,%object              @ @.str.183
.L.str.183:
	.asciz	"Precipitation \n    20.3%     "
	.size	.L.str.183, 30

	.type	.L.str.184,%object              @ @.str.184
.L.str.184:
	.asciz	"\033[1m\033[32m"
	.size	.L.str.184, 10

	.type	.L.str.185,%object              @ @.str.185
	.section	.rodata.str1.4,"aMS",%progbits,1
	.p2align	2, 0x0
.L.str.185:
	.asciz	"??.??.????"
	.size	.L.str.185, 11

	.type	.L.str.186,%object              @ @.str.186
	.section	.rodata.str1.1,"aMS",%progbits,1
.L.str.186:
	.asciz	"----------------------------------\n|                                |\n----------------------------------"
	.size	.L.str.186, 105

	.type	.L.str.187,%object              @ @.str.187
.L.str.187:
	.asciz	"        Please wait...        \n"
	.size	.L.str.187, 32

	.type	.L.str.188,%object              @ @.str.188
.L.str.188:
	.asciz	"          Loading...          \n"
	.size	.L.str.188, 32

	.type	.L.str.189,%object              @ @.str.189
.L.str.189:
	.asciz	"negative loading progress"
	.size	.L.str.189, 26

	.type	.L.str.191,%object              @ @.str.191
.L.str.191:
	.asciz	"PBS #%02d"
	.size	.L.str.191, 10

	.type	.L.str.194,%object              @ @.str.194
.L.str.194:
	.asciz	"   "
	.size	.L.str.194, 4

	.type	.L.str.195,%object              @ @.str.195
.L.str.195:
	.asciz	"  ###  \nPBS #%02d\nPing  %d"
	.size	.L.str.195, 27

	.type	.L.str.196,%object              @ @.str.196
.L.str.196:
	.asciz	"  ...  \nPBS #%02d\n-------"
	.size	.L.str.196, 26

	.type	.L.str.197,%object              @ @.str.197
.L.str.197:
	.asciz	"  ###  \nPBS #%02d\nPing  1"
	.size	.L.str.197, 26

	.type	.L.str.198,%object              @ @.str.198
.L.str.198:
	.asciz	"poweroff height"
	.size	.L.str.198, 16

	.type	.L.str.199,%object              @ @.str.199
.L.str.199:
	.asciz	"\033[30m\033[22m"
	.size	.L.str.199, 11

	.type	.L.str.200,%object              @ @.str.200
.L.str.200:
	.asciz	"\033[37m\033[22m"
	.size	.L.str.200, 11

	.type	.L__const.credits_private_scenes60_poweroff.colours,%object @ @__const.credits_private_scenes60_poweroff.colours
	.section	.rodata,"a",%progbits
	.p2align	2, 0x0
.L__const.credits_private_scenes60_poweroff.colours:
	.long	.L.str.199
	.long	.L.str.46
	.long	.L.str.200
	.long	.L.str.45
	.size	.L__const.credits_private_scenes60_poweroff.colours, 16

	.ident	"clang version 23.1.2 (https://github.com/llvm/llvm-project.git 85ac560262434c9ccfc0c183ec22d4138ed647fb)"
	.section	".note.GNU-stack","",%progbits
	.addrsig
	.addrsig_sym credits_private_credits_native_scene_due
	.addrsig_sym credits_private_credits_create_generator
	.addrsig_sym credits_private_credits_no_clear
	.addrsig_sym credits_private_credits_request_generator
	.addrsig_sym credits_private_credits_timeline
	.addrsig_sym credits_private_data_starts_wipe
	.addrsig_sym credits_private_data_starts_clear_wipe
	.addrsig_sym credits_private_data_starts_clear
	.addrsig_sym credits_private_data_starts_ocean_b
	.addrsig_sym credits_private_data_starts_ocean_c
	.addrsig_sym credits_private_data_starts_ocean_d
	.addrsig_sym credits_private_data_starts_typewrite
	.addrsig_sym credits_private_data_starts_title
	.addrsig_sym credits_private_data_starts_beats
	.addrsig_sym credits_private_data_starts_beats_lr
	.addrsig_sym credits_private_data_starts_funding
	.addrsig_sym credits_private_data_starts_dates
	.addrsig_sym credits_private_data_starts_weather
	.addrsig_sym credits_private_data_starts_redraw_ui
	.addrsig_sym credits_private_data_starts_loadingbar
	.addrsig_sym credits_private_data_starts_fastload
	.addrsig_sym credits_private_data_starts_error
	.addrsig_sym credits_private_data_starts_fundingx2
	.addrsig_sym credits_private_data_starts_accesspoints
	.addrsig_sym credits_private_data_starts_fdg_single
	.addrsig_sym credits_private_data_starts_fdg_down
	.addrsig_sym credits_private_data_starts_poweroff
	.addrsig_sym credits_private_scene_definitions
	.addrsig_sym credits_private_data_segments_ocean_b_0
	.addrsig_sym credits_private_data_segments_ocean_b_1
	.addrsig_sym credits_private_data_segments_ocean_b_2
	.addrsig_sym credits_private_data_segments_ocean_b_3
	.addrsig_sym credits_private_data_segments_ocean_c_0
	.addrsig_sym credits_private_data_segments_ocean_c_1
	.addrsig_sym credits_private_data_segments_ocean_c_2
	.addrsig_sym credits_private_data_segments_ocean_c_3
	.addrsig_sym credits_private_data_segments_funding_0
	.addrsig_sym credits_private_data_segments_funding_1
	.addrsig_sym credits_private_data_segments_funding_2
	.addrsig_sym credits_private_data_segments_fundingx2_0
	.addrsig_sym credits_private_data_segments_fundingx2_1
	.addrsig_sym credits_private_data_segments_fundingx2_2
	.addrsig_sym credits_private_data_segments_fdg_single_0
	.addrsig_sym credits_private_data_segments_fdg_down_0
	.addrsig_sym credits_private_data_segments_fdg_down_1
	.addrsig_sym credits_private_data_segments_fdg_down_2
	.addrsig_sym credits_private_credits_apply_event.lines
	.addrsig_sym credits_private_credits_apply_event.empty
	.eabi_attribute	30, 2	@ Tag_ABI_optimization_goals
