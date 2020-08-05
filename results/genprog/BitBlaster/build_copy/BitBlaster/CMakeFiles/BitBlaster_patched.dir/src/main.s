	.text
	.file	"main.c"
	.file	1 "/home/epicosy/thesis/implementation/repair/SecureThemAll2/benchmark/cb-multios" "challenges/BitBlaster/src/main.c"
	.globl	cgc_transmit_all        # -- Begin function cgc_transmit_all
	.p2align	4, 0x90
	.type	cgc_transmit_all,@function
cgc_transmit_all:                       # @cgc_transmit_all
.Lfunc_begin0:
	.loc	1 21 0                  # challenges/BitBlaster/src/main.c:21:0
	.cfi_sections .debug_frame
	.cfi_startproc
# %bb.0:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset %ebp, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register %ebp
	subl	$40, %esp
	movl	16(%ebp), %eax
	movl	12(%ebp), %ecx
	movl	8(%ebp), %edx
.Ltmp0:
	.loc	1 22 14 prologue_end    # challenges/BitBlaster/src/main.c:22:14
	movl	$0, -8(%ebp)
	.loc	1 23 14                 # challenges/BitBlaster/src/main.c:23:14
	movl	$0, -12(%ebp)
	.loc	1 24 7                  # challenges/BitBlaster/src/main.c:24:7
	movl	$0, -16(%ebp)
.Ltmp1:
	.loc	1 25 11                 # challenges/BitBlaster/src/main.c:25:11
	cmpl	$0, 12(%ebp)
.Ltmp2:
	.loc	1 25 7 is_stmt 0        # challenges/BitBlaster/src/main.c:25:7
	jne	.LBB0_2
# %bb.1:
.Ltmp3:
	.loc	1 27 5 is_stmt 1        # challenges/BitBlaster/src/main.c:27:5
	movl	$0, -4(%ebp)
	jmp	.LBB0_9
.Ltmp4:
.LBB0_2:
	.loc	1 30 3                  # challenges/BitBlaster/src/main.c:30:3
	jmp	.LBB0_3
.LBB0_3:                                # =>This Inner Loop Header: Depth=1
.Ltmp5:
	.loc	1 32 24                 # challenges/BitBlaster/src/main.c:32:24
	movl	8(%ebp), %eax
	.loc	1 32 28 is_stmt 0       # challenges/BitBlaster/src/main.c:32:28
	movl	12(%ebp), %ecx
	.loc	1 32 33                 # challenges/BitBlaster/src/main.c:32:33
	movl	16(%ebp), %edx
	.loc	1 32 38                 # challenges/BitBlaster/src/main.c:32:38
	subl	-12(%ebp), %edx
	.loc	1 32 11                 # challenges/BitBlaster/src/main.c:32:11
	movl	%eax, (%esp)
	movl	%ecx, 4(%esp)
	movl	%edx, 8(%esp)
	leal	-8(%ebp), %eax
	movl	%eax, 12(%esp)
	calll	cgc_transmit
	.loc	1 32 9                  # challenges/BitBlaster/src/main.c:32:9
	movl	%eax, -16(%ebp)
.Ltmp6:
	.loc	1 33 15 is_stmt 1       # challenges/BitBlaster/src/main.c:33:15
	cmpl	$0, -16(%ebp)
	.loc	1 33 21 is_stmt 0       # challenges/BitBlaster/src/main.c:33:21
	jne	.LBB0_5
# %bb.4:                                #   in Loop: Header=BB0_3 Depth=1
	.loc	1 33 34                 # challenges/BitBlaster/src/main.c:33:34
	cmpl	$0, -8(%ebp)
.Ltmp7:
	.loc	1 33 10                 # challenges/BitBlaster/src/main.c:33:10
	jne	.LBB0_6
.LBB0_5:
.Ltmp8:
	.loc	1 35 7 is_stmt 1        # challenges/BitBlaster/src/main.c:35:7
	movl	$0, -4(%ebp)
	jmp	.LBB0_9
.Ltmp9:
.LBB0_6:                                #   in Loop: Header=BB0_3 Depth=1
	.loc	1 37 14                 # challenges/BitBlaster/src/main.c:37:14
	movl	-8(%ebp), %eax
	.loc	1 37 11 is_stmt 0       # challenges/BitBlaster/src/main.c:37:11
	addl	-12(%ebp), %eax
	movl	%eax, -12(%ebp)
.Ltmp10:
# %bb.7:                                #   in Loop: Header=BB0_3 Depth=1
	.loc	1 39 10 is_stmt 1       # challenges/BitBlaster/src/main.c:39:10
	movl	-12(%ebp), %eax
	.loc	1 39 16 is_stmt 0       # challenges/BitBlaster/src/main.c:39:16
	cmpl	16(%ebp), %eax
.Ltmp11:
	.loc	1 38 3 is_stmt 1        # challenges/BitBlaster/src/main.c:38:3
	jb	.LBB0_3
.Ltmp12:
# %bb.8:
	.loc	1 41 11                 # challenges/BitBlaster/src/main.c:41:11
	movl	16(%ebp), %eax
	.loc	1 41 3 is_stmt 0        # challenges/BitBlaster/src/main.c:41:3
	movl	%eax, -4(%ebp)
.LBB0_9:
	.loc	1 42 1 is_stmt 1        # challenges/BitBlaster/src/main.c:42:1
	movl	-4(%ebp), %eax
	addl	$40, %esp
	popl	%ebp
	.cfi_def_cfa %esp, 4
	retl
.Ltmp13:
.Lfunc_end0:
	.size	cgc_transmit_all, .Lfunc_end0-cgc_transmit_all
	.cfi_endproc
                                        # -- End function
	.globl	cgc_receive_all         # -- Begin function cgc_receive_all
	.p2align	4, 0x90
	.type	cgc_receive_all,@function
cgc_receive_all:                        # @cgc_receive_all
.Lfunc_begin1:
	.loc	1 45 0                  # challenges/BitBlaster/src/main.c:45:0
	.cfi_startproc
# %bb.0:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset %ebp, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register %ebp
	subl	$40, %esp
	movl	16(%ebp), %eax
	movl	12(%ebp), %ecx
	movl	8(%ebp), %edx
.Ltmp14:
	.loc	1 46 14 prologue_end    # challenges/BitBlaster/src/main.c:46:14
	movl	$0, -8(%ebp)
	.loc	1 47 14                 # challenges/BitBlaster/src/main.c:47:14
	movl	$0, -12(%ebp)
	.loc	1 48 7                  # challenges/BitBlaster/src/main.c:48:7
	movl	$0, -16(%ebp)
.Ltmp15:
	.loc	1 49 11                 # challenges/BitBlaster/src/main.c:49:11
	cmpl	$0, 12(%ebp)
.Ltmp16:
	.loc	1 49 7 is_stmt 0        # challenges/BitBlaster/src/main.c:49:7
	jne	.LBB1_2
# %bb.1:
.Ltmp17:
	.loc	1 51 5 is_stmt 1        # challenges/BitBlaster/src/main.c:51:5
	movl	$0, -4(%ebp)
	jmp	.LBB1_9
.Ltmp18:
.LBB1_2:
	.loc	1 54 3                  # challenges/BitBlaster/src/main.c:54:3
	jmp	.LBB1_3
.LBB1_3:                                # =>This Inner Loop Header: Depth=1
.Ltmp19:
	.loc	1 56 23                 # challenges/BitBlaster/src/main.c:56:23
	movl	8(%ebp), %eax
	.loc	1 56 27 is_stmt 0       # challenges/BitBlaster/src/main.c:56:27
	movl	12(%ebp), %ecx
	.loc	1 56 32                 # challenges/BitBlaster/src/main.c:56:32
	movl	16(%ebp), %edx
	.loc	1 56 36                 # challenges/BitBlaster/src/main.c:56:36
	subl	-12(%ebp), %edx
	.loc	1 56 11                 # challenges/BitBlaster/src/main.c:56:11
	movl	%eax, (%esp)
	movl	%ecx, 4(%esp)
	movl	%edx, 8(%esp)
	leal	-8(%ebp), %eax
	movl	%eax, 12(%esp)
	calll	cgc_receive
	.loc	1 56 9                  # challenges/BitBlaster/src/main.c:56:9
	movl	%eax, -16(%ebp)
.Ltmp20:
	.loc	1 57 15 is_stmt 1       # challenges/BitBlaster/src/main.c:57:15
	cmpl	$0, -16(%ebp)
	.loc	1 57 21 is_stmt 0       # challenges/BitBlaster/src/main.c:57:21
	jne	.LBB1_5
# %bb.4:                                #   in Loop: Header=BB1_3 Depth=1
	.loc	1 57 34                 # challenges/BitBlaster/src/main.c:57:34
	cmpl	$0, -8(%ebp)
.Ltmp21:
	.loc	1 57 10                 # challenges/BitBlaster/src/main.c:57:10
	jne	.LBB1_6
.LBB1_5:
.Ltmp22:
	.loc	1 59 7 is_stmt 1        # challenges/BitBlaster/src/main.c:59:7
	movl	$0, -4(%ebp)
	jmp	.LBB1_9
.Ltmp23:
.LBB1_6:                                #   in Loop: Header=BB1_3 Depth=1
	.loc	1 61 14                 # challenges/BitBlaster/src/main.c:61:14
	movl	-8(%ebp), %eax
	.loc	1 61 11 is_stmt 0       # challenges/BitBlaster/src/main.c:61:11
	addl	-12(%ebp), %eax
	movl	%eax, -12(%ebp)
.Ltmp24:
# %bb.7:                                #   in Loop: Header=BB1_3 Depth=1
	.loc	1 63 10 is_stmt 1       # challenges/BitBlaster/src/main.c:63:10
	movl	-12(%ebp), %eax
	.loc	1 63 16 is_stmt 0       # challenges/BitBlaster/src/main.c:63:16
	cmpl	16(%ebp), %eax
.Ltmp25:
	.loc	1 62 3 is_stmt 1        # challenges/BitBlaster/src/main.c:62:3
	jb	.LBB1_3
.Ltmp26:
# %bb.8:
	.loc	1 65 11                 # challenges/BitBlaster/src/main.c:65:11
	movl	16(%ebp), %eax
	.loc	1 65 3 is_stmt 0        # challenges/BitBlaster/src/main.c:65:3
	movl	%eax, -4(%ebp)
.LBB1_9:
	.loc	1 66 1 is_stmt 1        # challenges/BitBlaster/src/main.c:66:1
	movl	-4(%ebp), %eax
	addl	$40, %esp
	popl	%ebp
	.cfi_def_cfa %esp, 4
	retl
.Ltmp27:
.Lfunc_end1:
	.size	cgc_receive_all, .Lfunc_end1-cgc_receive_all
	.cfi_endproc
                                        # -- End function
	.globl	cgc_rotate_right        # -- Begin function cgc_rotate_right
	.p2align	4, 0x90
	.type	cgc_rotate_right,@function
cgc_rotate_right:                       # @cgc_rotate_right
.Lfunc_begin2:
	.loc	1 71 0                  # challenges/BitBlaster/src/main.c:71:0
	.cfi_startproc
# %bb.0:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset %ebp, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register %ebp
	pushl	%eax
	movl	8(%ebp), %eax
.Ltmp28:
	.loc	1 74 13 prologue_end    # challenges/BitBlaster/src/main.c:74:13
	cmpl	$0, 8(%ebp)
	.loc	1 74 18 is_stmt 0       # challenges/BitBlaster/src/main.c:74:18
	jl	.LBB2_2
# %bb.1:
	.loc	1 74 26                 # challenges/BitBlaster/src/main.c:74:26
	cmpl	$32, 8(%ebp)
.Ltmp29:
	.loc	1 74 8                  # challenges/BitBlaster/src/main.c:74:8
	jl	.LBB2_3
.LBB2_2:
.Ltmp30:
	.loc	1 76 5 is_stmt 1        # challenges/BitBlaster/src/main.c:76:5
	jmp	.LBB2_4
.Ltmp31:
.LBB2_3:
	.loc	1 79 17                 # challenges/BitBlaster/src/main.c:79:17
	movl	8(%ebp), %eax
	.loc	1 79 10 is_stmt 0       # challenges/BitBlaster/src/main.c:79:10
	movl	gBoard(,%eax,4), %eax
	.loc	1 79 22                 # challenges/BitBlaster/src/main.c:79:22
	shrl	$31, %eax
	.loc	1 79 8                  # challenges/BitBlaster/src/main.c:79:8
	movl	%eax, -4(%ebp)
	.loc	1 80 25 is_stmt 1       # challenges/BitBlaster/src/main.c:80:25
	movl	8(%ebp), %eax
	.loc	1 80 18 is_stmt 0       # challenges/BitBlaster/src/main.c:80:18
	movl	gBoard(,%eax,4), %eax
	.loc	1 80 30                 # challenges/BitBlaster/src/main.c:80:30
	shll	$1, %eax
	.loc	1 80 36                 # challenges/BitBlaster/src/main.c:80:36
	orl	-4(%ebp), %eax
	.loc	1 80 10                 # challenges/BitBlaster/src/main.c:80:10
	movl	8(%ebp), %ecx
	.loc	1 80 15                 # challenges/BitBlaster/src/main.c:80:15
	movl	%eax, gBoard(,%ecx,4)
.LBB2_4:
	.loc	1 81 1 is_stmt 1        # challenges/BitBlaster/src/main.c:81:1
	addl	$4, %esp
	popl	%ebp
	.cfi_def_cfa %esp, 4
	retl
.Ltmp32:
.Lfunc_end2:
	.size	cgc_rotate_right, .Lfunc_end2-cgc_rotate_right
	.cfi_endproc
                                        # -- End function
	.globl	cgc_rotate_down         # -- Begin function cgc_rotate_down
	.p2align	4, 0x90
	.type	cgc_rotate_down,@function
cgc_rotate_down:                        # @cgc_rotate_down
.Lfunc_begin3:
	.loc	1 94 0                  # challenges/BitBlaster/src/main.c:94:0
	.cfi_startproc
# %bb.0:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset %ebp, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register %ebp
	subl	$8, %esp
	movl	8(%ebp), %eax
.Ltmp33:
	.loc	1 95 7 prologue_end     # challenges/BitBlaster/src/main.c:95:7
	movl	$0, -4(%ebp)
	.loc	1 96 12                 # challenges/BitBlaster/src/main.c:96:12
	movl	$0, -8(%ebp)
.Ltmp34:
	.loc	1 97 13                 # challenges/BitBlaster/src/main.c:97:13
	cmpl	$0, 8(%ebp)
	.loc	1 97 18 is_stmt 0       # challenges/BitBlaster/src/main.c:97:18
	jl	.LBB3_2
# %bb.1:
	.loc	1 97 26                 # challenges/BitBlaster/src/main.c:97:26
	cmpl	$32, 8(%ebp)
.Ltmp35:
	.loc	1 97 8                  # challenges/BitBlaster/src/main.c:97:8
	jl	.LBB3_3
.LBB3_2:
.Ltmp36:
	.loc	1 99 5 is_stmt 1        # challenges/BitBlaster/src/main.c:99:5
	jmp	.LBB3_8
.Ltmp37:
.LBB3_3:
	.loc	1 102 10                # challenges/BitBlaster/src/main.c:102:10
	movl	gBoard+124, %eax
	.loc	1 102 8 is_stmt 0       # challenges/BitBlaster/src/main.c:102:8
	movl	%eax, -8(%ebp)
.Ltmp38:
	.loc	1 103 10 is_stmt 1      # challenges/BitBlaster/src/main.c:103:10
	movl	$31, -4(%ebp)
.LBB3_4:                                # =>This Inner Loop Header: Depth=1
.Ltmp39:
	.loc	1 103 18 is_stmt 0      # challenges/BitBlaster/src/main.c:103:18
	cmpl	$0, -4(%ebp)
.Ltmp40:
	.loc	1 103 3                 # challenges/BitBlaster/src/main.c:103:3
	jle	.LBB3_7
# %bb.5:                                #   in Loop: Header=BB3_4 Depth=1
.Ltmp41:
	.loc	1 105 25 is_stmt 1      # challenges/BitBlaster/src/main.c:105:25
	movl	-4(%ebp), %eax
	.loc	1 105 18 is_stmt 0      # challenges/BitBlaster/src/main.c:105:18
	movl	gBoard(,%eax,4), %eax
	.loc	1 105 39                # challenges/BitBlaster/src/main.c:105:39
	movl	8(%ebp), %ecx
	.loc	1 105 28                # challenges/BitBlaster/src/main.c:105:28
	andl	neg_mask(,%ecx,4), %eax
	.loc	1 105 55                # challenges/BitBlaster/src/main.c:105:55
	movl	-4(%ebp), %ecx
	.loc	1 105 56                # challenges/BitBlaster/src/main.c:105:56
	subl	$1, %ecx
	.loc	1 105 48                # challenges/BitBlaster/src/main.c:105:48
	movl	gBoard(,%ecx,4), %ecx
	.loc	1 105 67                # challenges/BitBlaster/src/main.c:105:67
	movl	8(%ebp), %edx
	.loc	1 105 60                # challenges/BitBlaster/src/main.c:105:60
	andl	mask(,%edx,4), %ecx
	.loc	1 105 45                # challenges/BitBlaster/src/main.c:105:45
	orl	%ecx, %eax
	.loc	1 105 12                # challenges/BitBlaster/src/main.c:105:12
	movl	-4(%ebp), %ecx
	.loc	1 105 15                # challenges/BitBlaster/src/main.c:105:15
	movl	%eax, gBoard(,%ecx,4)
.Ltmp42:
# %bb.6:                                #   in Loop: Header=BB3_4 Depth=1
	.loc	1 103 24 is_stmt 1      # challenges/BitBlaster/src/main.c:103:24
	movl	-4(%ebp), %eax
	addl	$-1, %eax
	movl	%eax, -4(%ebp)
	.loc	1 103 3 is_stmt 0       # challenges/BitBlaster/src/main.c:103:3
	jmp	.LBB3_4
.Ltmp43:
.LBB3_7:
	.loc	1 108 16 is_stmt 1      # challenges/BitBlaster/src/main.c:108:16
	movl	gBoard, %eax
	.loc	1 108 37 is_stmt 0      # challenges/BitBlaster/src/main.c:108:37
	movl	8(%ebp), %ecx
	.loc	1 108 26                # challenges/BitBlaster/src/main.c:108:26
	andl	neg_mask(,%ecx,4), %eax
	.loc	1 108 46                # challenges/BitBlaster/src/main.c:108:46
	movl	-8(%ebp), %ecx
	.loc	1 108 58                # challenges/BitBlaster/src/main.c:108:58
	movl	8(%ebp), %edx
	.loc	1 108 51                # challenges/BitBlaster/src/main.c:108:51
	andl	mask(,%edx,4), %ecx
	.loc	1 108 43                # challenges/BitBlaster/src/main.c:108:43
	orl	%ecx, %eax
	.loc	1 108 13                # challenges/BitBlaster/src/main.c:108:13
	movl	%eax, gBoard
.LBB3_8:
	.loc	1 109 1 is_stmt 1       # challenges/BitBlaster/src/main.c:109:1
	addl	$8, %esp
	popl	%ebp
	.cfi_def_cfa %esp, 4
	retl
.Ltmp44:
.Lfunc_end3:
	.size	cgc_rotate_down, .Lfunc_end3-cgc_rotate_down
	.cfi_endproc
                                        # -- End function
	.globl	cgc_printBoard          # -- Begin function cgc_printBoard
	.p2align	4, 0x90
	.type	cgc_printBoard,@function
cgc_printBoard:                         # @cgc_printBoard
.Lfunc_begin4:
	.loc	1 112 0                 # challenges/BitBlaster/src/main.c:112:0
	.cfi_startproc
# %bb.0:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset %ebp, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register %ebp
	subl	$1112, %esp             # imm = 0x458
.Ltmp45:
	.loc	1 113 7 prologue_end    # challenges/BitBlaster/src/main.c:113:7
	movl	$0, -4(%ebp)
	.loc	1 114 7                 # challenges/BitBlaster/src/main.c:114:7
	movl	$0, -8(%ebp)
	.loc	1 115 7                 # challenges/BitBlaster/src/main.c:115:7
	movl	$0, -12(%ebp)
.Ltmp46:
	.loc	1 118 10                # challenges/BitBlaster/src/main.c:118:10
	movl	$0, -4(%ebp)
.LBB4_1:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB4_3 Depth 2
.Ltmp47:
	.loc	1 118 17 is_stmt 0      # challenges/BitBlaster/src/main.c:118:17
	cmpl	$32, -4(%ebp)
.Ltmp48:
	.loc	1 118 3                 # challenges/BitBlaster/src/main.c:118:3
	jge	.LBB4_11
# %bb.2:                                #   in Loop: Header=BB4_1 Depth=1
.Ltmp49:
	.loc	1 120 12 is_stmt 1      # challenges/BitBlaster/src/main.c:120:12
	movl	$0, -8(%ebp)
.LBB4_3:                                #   Parent Loop BB4_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
.Ltmp50:
	.loc	1 120 19 is_stmt 0      # challenges/BitBlaster/src/main.c:120:19
	cmpl	$32, -8(%ebp)
.Ltmp51:
	.loc	1 120 5                 # challenges/BitBlaster/src/main.c:120:5
	jge	.LBB4_9
# %bb.4:                                #   in Loop: Header=BB4_3 Depth=2
.Ltmp52:
	.loc	1 122 18 is_stmt 1      # challenges/BitBlaster/src/main.c:122:18
	movl	-4(%ebp), %eax
	.loc	1 122 11 is_stmt 0      # challenges/BitBlaster/src/main.c:122:11
	movl	gBoard(,%eax,4), %eax
	.loc	1 122 28                # challenges/BitBlaster/src/main.c:122:28
	movl	-8(%ebp), %ecx
	.loc	1 122 21                # challenges/BitBlaster/src/main.c:122:21
	andl	mask(,%ecx,4), %eax
	cmpl	$0, %eax
.Ltmp53:
	.loc	1 122 11                # challenges/BitBlaster/src/main.c:122:11
	je	.LBB4_6
# %bb.5:                                #   in Loop: Header=BB4_3 Depth=2
.Ltmp54:
	.loc	1 124 14 is_stmt 1      # challenges/BitBlaster/src/main.c:124:14
	movl	-12(%ebp), %eax
	movl	%eax, %ecx
	addl	$1, %ecx
	movl	%ecx, -12(%ebp)
	.loc	1 124 18 is_stmt 0      # challenges/BitBlaster/src/main.c:124:18
	movb	$49, -1100(%ebp,%eax)
	.loc	1 125 7 is_stmt 1       # challenges/BitBlaster/src/main.c:125:7
	jmp	.LBB4_7
.Ltmp55:
.LBB4_6:                                #   in Loop: Header=BB4_3 Depth=2
	.loc	1 128 14                # challenges/BitBlaster/src/main.c:128:14
	movl	-12(%ebp), %eax
	movl	%eax, %ecx
	addl	$1, %ecx
	movl	%ecx, -12(%ebp)
	.loc	1 128 18 is_stmt 0      # challenges/BitBlaster/src/main.c:128:18
	movb	$46, -1100(%ebp,%eax)
.Ltmp56:
.LBB4_7:                                #   in Loop: Header=BB4_3 Depth=2
	.loc	1 130 5 is_stmt 1       # challenges/BitBlaster/src/main.c:130:5
	jmp	.LBB4_8
.Ltmp57:
.LBB4_8:                                #   in Loop: Header=BB4_3 Depth=2
	.loc	1 120 26                # challenges/BitBlaster/src/main.c:120:26
	movl	-8(%ebp), %eax
	addl	$1, %eax
	movl	%eax, -8(%ebp)
	.loc	1 120 5 is_stmt 0       # challenges/BitBlaster/src/main.c:120:5
	jmp	.LBB4_3
.Ltmp58:
.LBB4_9:                                #   in Loop: Header=BB4_1 Depth=1
	.loc	1 131 10 is_stmt 1      # challenges/BitBlaster/src/main.c:131:10
	movl	-12(%ebp), %eax
	movl	%eax, %ecx
	addl	$1, %ecx
	movl	%ecx, -12(%ebp)
	.loc	1 131 14 is_stmt 0      # challenges/BitBlaster/src/main.c:131:14
	movb	$10, -1100(%ebp,%eax)
.Ltmp59:
# %bb.10:                               #   in Loop: Header=BB4_1 Depth=1
	.loc	1 118 24 is_stmt 1      # challenges/BitBlaster/src/main.c:118:24
	movl	-4(%ebp), %eax
	addl	$1, %eax
	movl	%eax, -4(%ebp)
	.loc	1 118 3 is_stmt 0       # challenges/BitBlaster/src/main.c:118:3
	jmp	.LBB4_1
.Ltmp60:
.LBB4_11:
	.loc	1 0 3                   # challenges/BitBlaster/src/main.c:0:3
	leal	-1100(%ebp), %eax
	.loc	1 133 7 is_stmt 1       # challenges/BitBlaster/src/main.c:133:7
	movl	-12(%ebp), %ecx
	.loc	1 133 10 is_stmt 0      # challenges/BitBlaster/src/main.c:133:10
	movb	$0, -1100(%ebp,%ecx)
	.loc	1 135 28 is_stmt 1      # challenges/BitBlaster/src/main.c:135:28
	movl	-12(%ebp), %ecx
	.loc	1 135 3 is_stmt 0       # challenges/BitBlaster/src/main.c:135:3
	movl	$1, (%esp)
	movl	%eax, 4(%esp)
	movl	%ecx, 8(%esp)
	calll	cgc_transmit_all
	.loc	1 136 1 is_stmt 1       # challenges/BitBlaster/src/main.c:136:1
	addl	$1112, %esp             # imm = 0x458
	popl	%ebp
	.cfi_def_cfa %esp, 4
	retl
.Ltmp61:
.Lfunc_end4:
	.size	cgc_printBoard, .Lfunc_end4-cgc_printBoard
	.cfi_endproc
                                        # -- End function
	.globl	cgc_initBoard           # -- Begin function cgc_initBoard
	.p2align	4, 0x90
	.type	cgc_initBoard,@function
cgc_initBoard:                          # @cgc_initBoard
.Lfunc_begin5:
	.loc	1 139 0                 # challenges/BitBlaster/src/main.c:139:0
	.cfi_startproc
# %bb.0:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset %ebp, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register %ebp
.Ltmp62:
	.loc	1 140 20 prologue_end   # challenges/BitBlaster/src/main.c:140:20
	movl	$-1, gBoard+124
	.loc	1 141 20                # challenges/BitBlaster/src/main.c:141:20
	movl	$-1, gBoard+120
	.loc	1 142 1                 # challenges/BitBlaster/src/main.c:142:1
	popl	%ebp
	.cfi_def_cfa %esp, 4
	retl
.Ltmp63:
.Lfunc_end5:
	.size	cgc_initBoard, .Lfunc_end5-cgc_initBoard
	.cfi_endproc
                                        # -- End function
	.globl	cgc_remove_bits         # -- Begin function cgc_remove_bits
	.p2align	4, 0x90
	.type	cgc_remove_bits,@function
cgc_remove_bits:                        # @cgc_remove_bits
.Lfunc_begin6:
	.loc	1 145 0                 # challenges/BitBlaster/src/main.c:145:0
	.cfi_startproc
# %bb.0:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset %ebp, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register %ebp
.Ltmp64:
	.loc	1 146 10 prologue_end   # challenges/BitBlaster/src/main.c:146:10
	movl	gBoard+124, %eax
	.loc	1 146 25 is_stmt 0      # challenges/BitBlaster/src/main.c:146:25
	andl	$3, %eax
	.loc	1 146 39                # challenges/BitBlaster/src/main.c:146:39
	cmpl	$3, %eax
	.loc	1 146 54                # challenges/BitBlaster/src/main.c:146:54
	jne	.LBB6_3
# %bb.1:
	.loc	1 147 10 is_stmt 1      # challenges/BitBlaster/src/main.c:147:10
	movl	gBoard+120, %eax
	.loc	1 147 25 is_stmt 0      # challenges/BitBlaster/src/main.c:147:25
	andl	$3, %eax
	.loc	1 147 39                # challenges/BitBlaster/src/main.c:147:39
	cmpl	$3, %eax
.Ltmp65:
	.loc	1 146 8 is_stmt 1       # challenges/BitBlaster/src/main.c:146:8
	jne	.LBB6_3
# %bb.2:
.Ltmp66:
	.loc	1 149 20                # challenges/BitBlaster/src/main.c:149:20
	movl	gBoard+124, %eax
	andl	$-4, %eax
	movl	%eax, gBoard+124
	.loc	1 150 20                # challenges/BitBlaster/src/main.c:150:20
	movl	gBoard+120, %eax
	andl	$-4, %eax
	movl	%eax, gBoard+120
.Ltmp67:
.LBB6_3:
	.loc	1 152 1                 # challenges/BitBlaster/src/main.c:152:1
	popl	%ebp
	.cfi_def_cfa %esp, 4
	retl
.Ltmp68:
.Lfunc_end6:
	.size	cgc_remove_bits, .Lfunc_end6-cgc_remove_bits
	.cfi_endproc
                                        # -- End function
	.globl	cgc_makeMove            # -- Begin function cgc_makeMove
	.p2align	4, 0x90
	.type	cgc_makeMove,@function
cgc_makeMove:                           # @cgc_makeMove
.Lfunc_begin7:
	.loc	1 155 0                 # challenges/BitBlaster/src/main.c:155:0
	.cfi_startproc
# %bb.0:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset %ebp, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register %ebp
	subl	$8, %esp
	movb	8(%ebp), %al
.Ltmp69:
	.loc	1 156 7 prologue_end    # challenges/BitBlaster/src/main.c:156:7
	movl	$0, -4(%ebp)
	.loc	1 157 8                 # challenges/BitBlaster/src/main.c:157:8
	movzbl	8(%ebp), %ecx
	.loc	1 157 13 is_stmt 0      # challenges/BitBlaster/src/main.c:157:13
	andl	$31, %ecx
	.loc	1 157 5                 # challenges/BitBlaster/src/main.c:157:5
	movl	%ecx, -4(%ebp)
.Ltmp70:
	.loc	1 159 8 is_stmt 1       # challenges/BitBlaster/src/main.c:159:8
	movzbl	8(%ebp), %ecx
	.loc	1 159 13 is_stmt 0      # challenges/BitBlaster/src/main.c:159:13
	andl	$32, %ecx
	cmpl	$0, %ecx
.Ltmp71:
	.loc	1 159 7                 # challenges/BitBlaster/src/main.c:159:7
	je	.LBB7_2
# %bb.1:
.Ltmp72:
	.loc	1 161 22 is_stmt 1      # challenges/BitBlaster/src/main.c:161:22
	movl	-4(%ebp), %eax
	.loc	1 161 5 is_stmt 0       # challenges/BitBlaster/src/main.c:161:5
	movl	%eax, (%esp)
	calll	cgc_rotate_right
	.loc	1 162 3 is_stmt 1       # challenges/BitBlaster/src/main.c:162:3
	jmp	.LBB7_3
.Ltmp73:
.LBB7_2:
	.loc	1 165 21                # challenges/BitBlaster/src/main.c:165:21
	movl	-4(%ebp), %eax
	.loc	1 165 5 is_stmt 0       # challenges/BitBlaster/src/main.c:165:5
	movl	%eax, (%esp)
	calll	cgc_rotate_down
.Ltmp74:
.LBB7_3:
	.loc	1 168 3 is_stmt 1       # challenges/BitBlaster/src/main.c:168:3
	calll	cgc_remove_bits
	.loc	1 169 1                 # challenges/BitBlaster/src/main.c:169:1
	addl	$8, %esp
	popl	%ebp
	.cfi_def_cfa %esp, 4
	retl
.Ltmp75:
.Lfunc_end7:
	.size	cgc_makeMove, .Lfunc_end7-cgc_makeMove
	.cfi_endproc
                                        # -- End function
	.globl	cgc_isWinner            # -- Begin function cgc_isWinner
	.p2align	4, 0x90
	.type	cgc_isWinner,@function
cgc_isWinner:                           # @cgc_isWinner
.Lfunc_begin8:
	.loc	1 172 0                 # challenges/BitBlaster/src/main.c:172:0
	.cfi_startproc
# %bb.0:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset %ebp, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register %ebp
	subl	$8, %esp
.Ltmp76:
	.loc	1 173 7 prologue_end    # challenges/BitBlaster/src/main.c:173:7
	movl	$0, -8(%ebp)
.Ltmp77:
	.loc	1 174 10                # challenges/BitBlaster/src/main.c:174:10
	movl	$0, -8(%ebp)
.LBB8_1:                                # =>This Inner Loop Header: Depth=1
.Ltmp78:
	.loc	1 174 17 is_stmt 0      # challenges/BitBlaster/src/main.c:174:17
	cmpl	$32, -8(%ebp)
.Ltmp79:
	.loc	1 174 3                 # challenges/BitBlaster/src/main.c:174:3
	jge	.LBB8_6
# %bb.2:                                #   in Loop: Header=BB8_1 Depth=1
.Ltmp80:
	.loc	1 176 16 is_stmt 1      # challenges/BitBlaster/src/main.c:176:16
	movl	-8(%ebp), %eax
	.loc	1 176 19 is_stmt 0      # challenges/BitBlaster/src/main.c:176:19
	cmpl	$0, gBoard(,%eax,4)
.Ltmp81:
	.loc	1 176 9                 # challenges/BitBlaster/src/main.c:176:9
	je	.LBB8_4
# %bb.3:
.Ltmp82:
	.loc	1 178 7 is_stmt 1       # challenges/BitBlaster/src/main.c:178:7
	movl	$0, -4(%ebp)
	jmp	.LBB8_7
.Ltmp83:
.LBB8_4:                                #   in Loop: Header=BB8_1 Depth=1
	.loc	1 180 3                 # challenges/BitBlaster/src/main.c:180:3
	jmp	.LBB8_5
.Ltmp84:
.LBB8_5:                                #   in Loop: Header=BB8_1 Depth=1
	.loc	1 174 24                # challenges/BitBlaster/src/main.c:174:24
	movl	-8(%ebp), %eax
	addl	$1, %eax
	movl	%eax, -8(%ebp)
	.loc	1 174 3 is_stmt 0       # challenges/BitBlaster/src/main.c:174:3
	jmp	.LBB8_1
.Ltmp85:
.LBB8_6:
	.loc	1 181 3 is_stmt 1       # challenges/BitBlaster/src/main.c:181:3
	movl	$1, -4(%ebp)
.LBB8_7:
	.loc	1 182 1                 # challenges/BitBlaster/src/main.c:182:1
	movl	-4(%ebp), %eax
	addl	$8, %esp
	popl	%ebp
	.cfi_def_cfa %esp, 4
	retl
.Ltmp86:
.Lfunc_end8:
	.size	cgc_isWinner, .Lfunc_end8-cgc_isWinner
	.cfi_endproc
                                        # -- End function
	.globl	main                    # -- Begin function main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
.Lfunc_begin9:
	.loc	1 185 0                 # challenges/BitBlaster/src/main.c:185:0
	.cfi_startproc
# %bb.0:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset %ebp, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register %ebp
	subl	$40, %esp
	movl	12(%ebp), %eax
	movl	8(%ebp), %ecx
	movl	$0, -4(%ebp)
	movl	%eax, -12(%ebp)         # 4-byte Spill
	movl	%ecx, -16(%ebp)         # 4-byte Spill
.Ltmp87:
	.loc	1 188 3 prologue_end    # challenges/BitBlaster/src/main.c:188:3
	calll	cgc_initBoard
.LBB9_1:                                # =>This Inner Loop Header: Depth=1
	.loc	1 190 11                # challenges/BitBlaster/src/main.c:190:11
	calll	cgc_isWinner
	.loc	1 190 10 is_stmt 0      # challenges/BitBlaster/src/main.c:190:10
	cmpl	$0, %eax
	setne	%cl
	xorb	$-1, %cl
	.loc	1 190 3                 # challenges/BitBlaster/src/main.c:190:3
	testb	$1, %cl
	jne	.LBB9_2
	jmp	.LBB9_7
.LBB9_2:                                #   in Loop: Header=BB9_1 Depth=1
	.loc	1 0 3                   # challenges/BitBlaster/src/main.c:0:3
	xorl	%eax, %eax
.Ltmp88:
	.loc	1 192 9 is_stmt 1       # challenges/BitBlaster/src/main.c:192:9
	movl	$0, (%esp)
	leal	-5(%ebp), %ecx
	movl	%ecx, 4(%esp)
	movl	$1, 8(%esp)
	movl	%eax, -20(%ebp)         # 4-byte Spill
	calll	cgc_receive_all
	.loc	1 192 38 is_stmt 0      # challenges/BitBlaster/src/main.c:192:38
	cmpl	$1, %eax
.Ltmp89:
	.loc	1 192 9                 # challenges/BitBlaster/src/main.c:192:9
	je	.LBB9_4
# %bb.3:
.Ltmp90:
	.loc	1 194 7 is_stmt 1       # challenges/BitBlaster/src/main.c:194:7
	calll	cgc_printBoard
	.loc	1 195 7                 # challenges/BitBlaster/src/main.c:195:7
	movl	$0, -4(%ebp)
	jmp	.LBB9_8
.Ltmp91:
.LBB9_4:                                #   in Loop: Header=BB9_1 Depth=1
	.loc	1 197 9                 # challenges/BitBlaster/src/main.c:197:9
	movzbl	-5(%ebp), %eax
	.loc	1 197 14 is_stmt 0      # challenges/BitBlaster/src/main.c:197:14
	cmpl	$255, %eax
.Ltmp92:
	.loc	1 197 9                 # challenges/BitBlaster/src/main.c:197:9
	jne	.LBB9_6
# %bb.5:
.Ltmp93:
	.loc	1 199 7 is_stmt 1       # challenges/BitBlaster/src/main.c:199:7
	calll	cgc_printBoard
	.loc	1 200 7                 # challenges/BitBlaster/src/main.c:200:7
	movl	$0, -4(%ebp)
	jmp	.LBB9_8
.Ltmp94:
.LBB9_6:                                #   in Loop: Header=BB9_1 Depth=1
	.loc	1 202 5                 # challenges/BitBlaster/src/main.c:202:5
	movzbl	-5(%ebp), %eax
	movl	%eax, (%esp)
	calll	cgc_makeMove
.Ltmp95:
	.loc	1 190 3                 # challenges/BitBlaster/src/main.c:190:3
	jmp	.LBB9_1
.LBB9_7:
	.loc	1 210 3                 # challenges/BitBlaster/src/main.c:210:3
	movl	$1, (%esp)
	leal	.L.str, %eax
	movl	%eax, 4(%esp)
	movl	$8, 8(%esp)
	calll	cgc_transmit_all
.LBB9_8:
	.loc	1 211 1                 # challenges/BitBlaster/src/main.c:211:1
	movl	-4(%ebp), %eax
	addl	$40, %esp
	popl	%ebp
	.cfi_def_cfa %esp, 4
	retl
.Ltmp96:
.Lfunc_end9:
	.size	main, .Lfunc_end9-main
	.cfi_endproc
                                        # -- End function
	.type	gBoard,@object          # @gBoard
	.comm	gBoard,128,4
	.type	mask,@object            # @mask
	.data
	.globl	mask
	.p2align	2
mask:
	.long	1                       # 0x1
	.long	2                       # 0x2
	.long	4                       # 0x4
	.long	8                       # 0x8
	.long	16                      # 0x10
	.long	32                      # 0x20
	.long	64                      # 0x40
	.long	128                     # 0x80
	.long	256                     # 0x100
	.long	512                     # 0x200
	.long	1024                    # 0x400
	.long	2048                    # 0x800
	.long	4096                    # 0x1000
	.long	8192                    # 0x2000
	.long	16384                   # 0x4000
	.long	32768                   # 0x8000
	.long	65536                   # 0x10000
	.long	131072                  # 0x20000
	.long	262144                  # 0x40000
	.long	524288                  # 0x80000
	.long	1048576                 # 0x100000
	.long	2097152                 # 0x200000
	.long	4194304                 # 0x400000
	.long	8388608                 # 0x800000
	.long	16777216                # 0x1000000
	.long	33554432                # 0x2000000
	.long	67108864                # 0x4000000
	.long	134217728               # 0x8000000
	.long	268435456               # 0x10000000
	.long	536870912               # 0x20000000
	.long	1073741824              # 0x40000000
	.long	2147483648              # 0x80000000
	.size	mask, 128

	.type	neg_mask,@object        # @neg_mask
	.globl	neg_mask
	.p2align	2
neg_mask:
	.long	4294967294              # 0xfffffffe
	.long	4294967293              # 0xfffffffd
	.long	4294967291              # 0xfffffffb
	.long	4294967287              # 0xfffffff7
	.long	4294967279              # 0xffffffef
	.long	4294967263              # 0xffffffdf
	.long	4294967231              # 0xffffffbf
	.long	4294967167              # 0xffffff7f
	.long	4294967039              # 0xfffffeff
	.long	4294966783              # 0xfffffdff
	.long	4294966271              # 0xfffffbff
	.long	4294965247              # 0xfffff7ff
	.long	4294963199              # 0xffffefff
	.long	4294959103              # 0xffffdfff
	.long	4294950911              # 0xffffbfff
	.long	4294934527              # 0xffff7fff
	.long	4294901759              # 0xfffeffff
	.long	4294836223              # 0xfffdffff
	.long	4294705151              # 0xfffbffff
	.long	4294443007              # 0xfff7ffff
	.long	4293918719              # 0xffefffff
	.long	4292870143              # 0xffdfffff
	.long	4290772991              # 0xffbfffff
	.long	4286578687              # 0xff7fffff
	.long	4278190079              # 0xfeffffff
	.long	4261412863              # 0xfdffffff
	.long	4227858431              # 0xfbffffff
	.long	4160749567              # 0xf7ffffff
	.long	4026531839              # 0xefffffff
	.long	3758096383              # 0xdfffffff
	.long	3221225471              # 0xbfffffff
	.long	2147483647              # 0x7fffffff
	.size	neg_mask, 128

	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"You Win\n"
	.size	.L.str, 9

	.file	2 "/home/epicosy/thesis/implementation/repair/SecureThemAll2/benchmark/cb-multios" "include/libcgc.h"
	.section	.debug_str,"MS",@progbits,1
.Linfo_string0:
	.asciz	"clang version 9.0.0-2 (tags/RELEASE_900/final)" # string offset=0
.Linfo_string1:
	.asciz	"CMakeFiles/BitBlaster_patched.dir/src/main.c" # string offset=47
.Linfo_string2:
	.asciz	"/home/epicosy/thesis/implementation/repair/SecureThemAll2/benchmark/cb-multios/build/challenges/BitBlaster" # string offset=92
.Linfo_string3:
	.asciz	"mask"                  # string offset=199
.Linfo_string4:
	.asciz	"unsigned int"          # string offset=204
.Linfo_string5:
	.asciz	"uint32_t"              # string offset=217
.Linfo_string6:
	.asciz	"__ARRAY_SIZE_TYPE__"   # string offset=226
.Linfo_string7:
	.asciz	"neg_mask"              # string offset=246
.Linfo_string8:
	.asciz	"gBoard"                # string offset=255
.Linfo_string9:
	.asciz	"cgc_transmit_all"      # string offset=262
.Linfo_string10:
	.asciz	"long unsigned int"     # string offset=279
.Linfo_string11:
	.asciz	"cgc_size_t"            # string offset=297
.Linfo_string12:
	.asciz	"cgc_receive_all"       # string offset=308
.Linfo_string13:
	.asciz	"cgc_rotate_right"      # string offset=324
.Linfo_string14:
	.asciz	"cgc_rotate_down"       # string offset=341
.Linfo_string15:
	.asciz	"cgc_printBoard"        # string offset=357
.Linfo_string16:
	.asciz	"cgc_initBoard"         # string offset=372
.Linfo_string17:
	.asciz	"cgc_remove_bits"       # string offset=386
.Linfo_string18:
	.asciz	"cgc_makeMove"          # string offset=402
.Linfo_string19:
	.asciz	"cgc_isWinner"          # string offset=415
.Linfo_string20:
	.asciz	"int"                   # string offset=428
.Linfo_string21:
	.asciz	"main"                  # string offset=432
.Linfo_string22:
	.asciz	"fd"                    # string offset=437
.Linfo_string23:
	.asciz	"buf"                   # string offset=440
.Linfo_string24:
	.asciz	"char"                  # string offset=444
.Linfo_string25:
	.asciz	"size"                  # string offset=449
.Linfo_string26:
	.asciz	"rx_bytes"              # string offset=454
.Linfo_string27:
	.asciz	"total"                 # string offset=463
.Linfo_string28:
	.asciz	"ret"                   # string offset=469
.Linfo_string29:
	.asciz	"row"                   # string offset=473
.Linfo_string30:
	.asciz	"temp"                  # string offset=477
.Linfo_string31:
	.asciz	"col"                   # string offset=482
.Linfo_string32:
	.asciz	"i"                     # string offset=486
.Linfo_string33:
	.asciz	"j"                     # string offset=488
.Linfo_string34:
	.asciz	"k"                     # string offset=490
.Linfo_string35:
	.asciz	"move"                  # string offset=492
.Linfo_string36:
	.asciz	"unsigned char"         # string offset=497
.Linfo_string37:
	.asciz	"uint8_t"               # string offset=511
.Linfo_string38:
	.asciz	"cgc_argc"              # string offset=519
.Linfo_string39:
	.asciz	"cgc_argv"              # string offset=528
	.section	.debug_abbrev,"",@progbits
	.byte	1                       # Abbreviation Code
	.byte	17                      # DW_TAG_compile_unit
	.byte	1                       # DW_CHILDREN_yes
	.byte	37                      # DW_AT_producer
	.byte	14                      # DW_FORM_strp
	.byte	19                      # DW_AT_language
	.byte	5                       # DW_FORM_data2
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	16                      # DW_AT_stmt_list
	.byte	23                      # DW_FORM_sec_offset
	.byte	27                      # DW_AT_comp_dir
	.byte	14                      # DW_FORM_strp
	.byte	17                      # DW_AT_low_pc
	.byte	1                       # DW_FORM_addr
	.byte	18                      # DW_AT_high_pc
	.byte	6                       # DW_FORM_data4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	2                       # Abbreviation Code
	.byte	52                      # DW_TAG_variable
	.byte	0                       # DW_CHILDREN_no
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	63                      # DW_AT_external
	.byte	25                      # DW_FORM_flag_present
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	11                      # DW_FORM_data1
	.byte	2                       # DW_AT_location
	.byte	24                      # DW_FORM_exprloc
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	3                       # Abbreviation Code
	.byte	1                       # DW_TAG_array_type
	.byte	1                       # DW_CHILDREN_yes
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	4                       # Abbreviation Code
	.byte	33                      # DW_TAG_subrange_type
	.byte	0                       # DW_CHILDREN_no
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	55                      # DW_AT_count
	.byte	11                      # DW_FORM_data1
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	5                       # Abbreviation Code
	.byte	22                      # DW_TAG_typedef
	.byte	0                       # DW_CHILDREN_no
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	11                      # DW_FORM_data1
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	6                       # Abbreviation Code
	.byte	36                      # DW_TAG_base_type
	.byte	0                       # DW_CHILDREN_no
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	62                      # DW_AT_encoding
	.byte	11                      # DW_FORM_data1
	.byte	11                      # DW_AT_byte_size
	.byte	11                      # DW_FORM_data1
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	7                       # Abbreviation Code
	.byte	36                      # DW_TAG_base_type
	.byte	0                       # DW_CHILDREN_no
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	11                      # DW_AT_byte_size
	.byte	11                      # DW_FORM_data1
	.byte	62                      # DW_AT_encoding
	.byte	11                      # DW_FORM_data1
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	8                       # Abbreviation Code
	.byte	46                      # DW_TAG_subprogram
	.byte	1                       # DW_CHILDREN_yes
	.byte	17                      # DW_AT_low_pc
	.byte	1                       # DW_FORM_addr
	.byte	18                      # DW_AT_high_pc
	.byte	6                       # DW_FORM_data4
	.byte	64                      # DW_AT_frame_base
	.byte	24                      # DW_FORM_exprloc
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	11                      # DW_FORM_data1
	.byte	39                      # DW_AT_prototyped
	.byte	25                      # DW_FORM_flag_present
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	63                      # DW_AT_external
	.byte	25                      # DW_FORM_flag_present
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	9                       # Abbreviation Code
	.byte	5                       # DW_TAG_formal_parameter
	.byte	0                       # DW_CHILDREN_no
	.byte	2                       # DW_AT_location
	.byte	24                      # DW_FORM_exprloc
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	11                      # DW_FORM_data1
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	10                      # Abbreviation Code
	.byte	52                      # DW_TAG_variable
	.byte	0                       # DW_CHILDREN_no
	.byte	2                       # DW_AT_location
	.byte	24                      # DW_FORM_exprloc
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	11                      # DW_FORM_data1
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	11                      # Abbreviation Code
	.byte	46                      # DW_TAG_subprogram
	.byte	1                       # DW_CHILDREN_yes
	.byte	17                      # DW_AT_low_pc
	.byte	1                       # DW_FORM_addr
	.byte	18                      # DW_AT_high_pc
	.byte	6                       # DW_FORM_data4
	.byte	64                      # DW_AT_frame_base
	.byte	24                      # DW_FORM_exprloc
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	11                      # DW_FORM_data1
	.byte	39                      # DW_AT_prototyped
	.byte	25                      # DW_FORM_flag_present
	.byte	63                      # DW_AT_external
	.byte	25                      # DW_FORM_flag_present
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	12                      # Abbreviation Code
	.byte	46                      # DW_TAG_subprogram
	.byte	1                       # DW_CHILDREN_yes
	.byte	17                      # DW_AT_low_pc
	.byte	1                       # DW_FORM_addr
	.byte	18                      # DW_AT_high_pc
	.byte	6                       # DW_FORM_data4
	.byte	64                      # DW_AT_frame_base
	.byte	24                      # DW_FORM_exprloc
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	11                      # DW_FORM_data1
	.byte	63                      # DW_AT_external
	.byte	25                      # DW_FORM_flag_present
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	13                      # Abbreviation Code
	.byte	46                      # DW_TAG_subprogram
	.byte	0                       # DW_CHILDREN_no
	.byte	17                      # DW_AT_low_pc
	.byte	1                       # DW_FORM_addr
	.byte	18                      # DW_AT_high_pc
	.byte	6                       # DW_FORM_data4
	.byte	64                      # DW_AT_frame_base
	.byte	24                      # DW_FORM_exprloc
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	11                      # DW_FORM_data1
	.byte	63                      # DW_AT_external
	.byte	25                      # DW_FORM_flag_present
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	14                      # Abbreviation Code
	.byte	46                      # DW_TAG_subprogram
	.byte	1                       # DW_CHILDREN_yes
	.byte	17                      # DW_AT_low_pc
	.byte	1                       # DW_FORM_addr
	.byte	18                      # DW_AT_high_pc
	.byte	6                       # DW_FORM_data4
	.byte	64                      # DW_AT_frame_base
	.byte	24                      # DW_FORM_exprloc
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	11                      # DW_FORM_data1
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	63                      # DW_AT_external
	.byte	25                      # DW_FORM_flag_present
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	15                      # Abbreviation Code
	.byte	15                      # DW_TAG_pointer_type
	.byte	0                       # DW_CHILDREN_no
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	16                      # Abbreviation Code
	.byte	33                      # DW_TAG_subrange_type
	.byte	0                       # DW_CHILDREN_no
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	55                      # DW_AT_count
	.byte	5                       # DW_FORM_data2
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	0                       # EOM(3)
	.section	.debug_info,"",@progbits
.Lcu_begin0:
	.long	.Ldebug_info_end0-.Ldebug_info_start0 # Length of Unit
.Ldebug_info_start0:
	.short	4                       # DWARF version number
	.long	.debug_abbrev           # Offset Into Abbrev. Section
	.byte	4                       # Address Size (in bytes)
	.byte	1                       # Abbrev [1] 0xb:0x2fa DW_TAG_compile_unit
	.long	.Linfo_string0          # DW_AT_producer
	.short	12                      # DW_AT_language
	.long	.Linfo_string1          # DW_AT_name
	.long	.Lline_table_start0     # DW_AT_stmt_list
	.long	.Linfo_string2          # DW_AT_comp_dir
	.long	.Lfunc_begin0           # DW_AT_low_pc
	.long	.Lfunc_end9-.Lfunc_begin0 # DW_AT_high_pc
	.byte	2                       # Abbrev [2] 0x26:0x11 DW_TAG_variable
	.long	.Linfo_string3          # DW_AT_name
	.long	55                      # DW_AT_type
                                        # DW_AT_external
	.byte	1                       # DW_AT_decl_file
	.byte	83                      # DW_AT_decl_line
	.byte	5                       # DW_AT_location
	.byte	3
	.long	mask
	.byte	3                       # Abbrev [3] 0x37:0xc DW_TAG_array_type
	.long	67                      # DW_AT_type
	.byte	4                       # Abbrev [4] 0x3c:0x6 DW_TAG_subrange_type
	.long	85                      # DW_AT_type
	.byte	32                      # DW_AT_count
	.byte	0                       # End Of Children Mark
	.byte	5                       # Abbrev [5] 0x43:0xb DW_TAG_typedef
	.long	78                      # DW_AT_type
	.long	.Linfo_string5          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	17                      # DW_AT_decl_line
	.byte	6                       # Abbrev [6] 0x4e:0x7 DW_TAG_base_type
	.long	.Linfo_string4          # DW_AT_name
	.byte	7                       # DW_AT_encoding
	.byte	4                       # DW_AT_byte_size
	.byte	7                       # Abbrev [7] 0x55:0x7 DW_TAG_base_type
	.long	.Linfo_string6          # DW_AT_name
	.byte	8                       # DW_AT_byte_size
	.byte	7                       # DW_AT_encoding
	.byte	2                       # Abbrev [2] 0x5c:0x11 DW_TAG_variable
	.long	.Linfo_string7          # DW_AT_name
	.long	55                      # DW_AT_type
                                        # DW_AT_external
	.byte	1                       # DW_AT_decl_file
	.byte	88                      # DW_AT_decl_line
	.byte	5                       # DW_AT_location
	.byte	3
	.long	neg_mask
	.byte	2                       # Abbrev [2] 0x6d:0x11 DW_TAG_variable
	.long	.Linfo_string8          # DW_AT_name
	.long	55                      # DW_AT_type
                                        # DW_AT_external
	.byte	1                       # DW_AT_decl_file
	.byte	68                      # DW_AT_decl_line
	.byte	5                       # DW_AT_location
	.byte	3
	.long	gBoard
	.byte	8                       # Abbrev [8] 0x7e:0x6a DW_TAG_subprogram
	.long	.Lfunc_begin0           # DW_AT_low_pc
	.long	.Lfunc_end0-.Lfunc_begin0 # DW_AT_high_pc
	.byte	1                       # DW_AT_frame_base
	.byte	85
	.long	.Linfo_string9          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	20                      # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	699                     # DW_AT_type
                                        # DW_AT_external
	.byte	9                       # Abbrev [9] 0x93:0xe DW_TAG_formal_parameter
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	8
	.long	.Linfo_string22         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	20                      # DW_AT_decl_line
	.long	717                     # DW_AT_type
	.byte	9                       # Abbrev [9] 0xa1:0xe DW_TAG_formal_parameter
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	12
	.long	.Linfo_string23         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	20                      # DW_AT_decl_line
	.long	724                     # DW_AT_type
	.byte	9                       # Abbrev [9] 0xaf:0xe DW_TAG_formal_parameter
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	16
	.long	.Linfo_string25         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	20                      # DW_AT_decl_line
	.long	699                     # DW_AT_type
	.byte	10                      # Abbrev [10] 0xbd:0xe DW_TAG_variable
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	120
	.long	.Linfo_string26         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	22                      # DW_AT_decl_line
	.long	699                     # DW_AT_type
	.byte	10                      # Abbrev [10] 0xcb:0xe DW_TAG_variable
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	116
	.long	.Linfo_string27         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	23                      # DW_AT_decl_line
	.long	699                     # DW_AT_type
	.byte	10                      # Abbrev [10] 0xd9:0xe DW_TAG_variable
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	112
	.long	.Linfo_string28         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	24                      # DW_AT_decl_line
	.long	717                     # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	8                       # Abbrev [8] 0xe8:0x6a DW_TAG_subprogram
	.long	.Lfunc_begin1           # DW_AT_low_pc
	.long	.Lfunc_end1-.Lfunc_begin1 # DW_AT_high_pc
	.byte	1                       # DW_AT_frame_base
	.byte	85
	.long	.Linfo_string12         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	44                      # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	699                     # DW_AT_type
                                        # DW_AT_external
	.byte	9                       # Abbrev [9] 0xfd:0xe DW_TAG_formal_parameter
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	8
	.long	.Linfo_string22         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	44                      # DW_AT_decl_line
	.long	717                     # DW_AT_type
	.byte	9                       # Abbrev [9] 0x10b:0xe DW_TAG_formal_parameter
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	12
	.long	.Linfo_string23         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	44                      # DW_AT_decl_line
	.long	724                     # DW_AT_type
	.byte	9                       # Abbrev [9] 0x119:0xe DW_TAG_formal_parameter
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	16
	.long	.Linfo_string25         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	44                      # DW_AT_decl_line
	.long	699                     # DW_AT_type
	.byte	10                      # Abbrev [10] 0x127:0xe DW_TAG_variable
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	120
	.long	.Linfo_string26         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	46                      # DW_AT_decl_line
	.long	699                     # DW_AT_type
	.byte	10                      # Abbrev [10] 0x135:0xe DW_TAG_variable
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	116
	.long	.Linfo_string27         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	47                      # DW_AT_decl_line
	.long	699                     # DW_AT_type
	.byte	10                      # Abbrev [10] 0x143:0xe DW_TAG_variable
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	112
	.long	.Linfo_string28         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	48                      # DW_AT_decl_line
	.long	717                     # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	11                      # Abbrev [11] 0x152:0x2e DW_TAG_subprogram
	.long	.Lfunc_begin2           # DW_AT_low_pc
	.long	.Lfunc_end2-.Lfunc_begin2 # DW_AT_high_pc
	.byte	1                       # DW_AT_frame_base
	.byte	85
	.long	.Linfo_string13         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	70                      # DW_AT_decl_line
                                        # DW_AT_prototyped
                                        # DW_AT_external
	.byte	9                       # Abbrev [9] 0x163:0xe DW_TAG_formal_parameter
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	8
	.long	.Linfo_string29         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	70                      # DW_AT_decl_line
	.long	717                     # DW_AT_type
	.byte	10                      # Abbrev [10] 0x171:0xe DW_TAG_variable
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	124
	.long	.Linfo_string30         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	72                      # DW_AT_decl_line
	.long	67                      # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	11                      # Abbrev [11] 0x180:0x3c DW_TAG_subprogram
	.long	.Lfunc_begin3           # DW_AT_low_pc
	.long	.Lfunc_end3-.Lfunc_begin3 # DW_AT_high_pc
	.byte	1                       # DW_AT_frame_base
	.byte	85
	.long	.Linfo_string14         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	93                      # DW_AT_decl_line
                                        # DW_AT_prototyped
                                        # DW_AT_external
	.byte	9                       # Abbrev [9] 0x191:0xe DW_TAG_formal_parameter
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	8
	.long	.Linfo_string31         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	93                      # DW_AT_decl_line
	.long	717                     # DW_AT_type
	.byte	10                      # Abbrev [10] 0x19f:0xe DW_TAG_variable
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	124
	.long	.Linfo_string32         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	95                      # DW_AT_decl_line
	.long	717                     # DW_AT_type
	.byte	10                      # Abbrev [10] 0x1ad:0xe DW_TAG_variable
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	120
	.long	.Linfo_string30         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	96                      # DW_AT_decl_line
	.long	67                      # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	12                      # Abbrev [12] 0x1bc:0x4b DW_TAG_subprogram
	.long	.Lfunc_begin4           # DW_AT_low_pc
	.long	.Lfunc_end4-.Lfunc_begin4 # DW_AT_high_pc
	.byte	1                       # DW_AT_frame_base
	.byte	85
	.long	.Linfo_string15         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	111                     # DW_AT_decl_line
                                        # DW_AT_external
	.byte	10                      # Abbrev [10] 0x1cd:0xe DW_TAG_variable
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	124
	.long	.Linfo_string32         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	113                     # DW_AT_decl_line
	.long	717                     # DW_AT_type
	.byte	10                      # Abbrev [10] 0x1db:0xe DW_TAG_variable
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	120
	.long	.Linfo_string33         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	114                     # DW_AT_decl_line
	.long	717                     # DW_AT_type
	.byte	10                      # Abbrev [10] 0x1e9:0xe DW_TAG_variable
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	116
	.long	.Linfo_string34         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	115                     # DW_AT_decl_line
	.long	717                     # DW_AT_type
	.byte	10                      # Abbrev [10] 0x1f7:0xf DW_TAG_variable
	.byte	3                       # DW_AT_location
	.byte	145
	.ascii	"\264w"
	.long	.Linfo_string23         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	116                     # DW_AT_decl_line
	.long	736                     # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	13                      # Abbrev [13] 0x207:0x11 DW_TAG_subprogram
	.long	.Lfunc_begin5           # DW_AT_low_pc
	.long	.Lfunc_end5-.Lfunc_begin5 # DW_AT_high_pc
	.byte	1                       # DW_AT_frame_base
	.byte	85
	.long	.Linfo_string16         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	138                     # DW_AT_decl_line
                                        # DW_AT_external
	.byte	13                      # Abbrev [13] 0x218:0x11 DW_TAG_subprogram
	.long	.Lfunc_begin6           # DW_AT_low_pc
	.long	.Lfunc_end6-.Lfunc_begin6 # DW_AT_high_pc
	.byte	1                       # DW_AT_frame_base
	.byte	85
	.long	.Linfo_string17         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	144                     # DW_AT_decl_line
                                        # DW_AT_external
	.byte	11                      # Abbrev [11] 0x229:0x2e DW_TAG_subprogram
	.long	.Lfunc_begin7           # DW_AT_low_pc
	.long	.Lfunc_end7-.Lfunc_begin7 # DW_AT_high_pc
	.byte	1                       # DW_AT_frame_base
	.byte	85
	.long	.Linfo_string18         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	154                     # DW_AT_decl_line
                                        # DW_AT_prototyped
                                        # DW_AT_external
	.byte	9                       # Abbrev [9] 0x23a:0xe DW_TAG_formal_parameter
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	8
	.long	.Linfo_string35         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	154                     # DW_AT_decl_line
	.long	749                     # DW_AT_type
	.byte	10                      # Abbrev [10] 0x248:0xe DW_TAG_variable
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	124
	.long	.Linfo_string32         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	156                     # DW_AT_decl_line
	.long	717                     # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	14                      # Abbrev [14] 0x257:0x24 DW_TAG_subprogram
	.long	.Lfunc_begin8           # DW_AT_low_pc
	.long	.Lfunc_end8-.Lfunc_begin8 # DW_AT_high_pc
	.byte	1                       # DW_AT_frame_base
	.byte	85
	.long	.Linfo_string19         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	171                     # DW_AT_decl_line
	.long	717                     # DW_AT_type
                                        # DW_AT_external
	.byte	10                      # Abbrev [10] 0x26c:0xe DW_TAG_variable
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	120
	.long	.Linfo_string32         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	173                     # DW_AT_decl_line
	.long	717                     # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	8                       # Abbrev [8] 0x27b:0x40 DW_TAG_subprogram
	.long	.Lfunc_begin9           # DW_AT_low_pc
	.long	.Lfunc_end9-.Lfunc_begin9 # DW_AT_high_pc
	.byte	1                       # DW_AT_frame_base
	.byte	85
	.long	.Linfo_string21         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	184                     # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	717                     # DW_AT_type
                                        # DW_AT_external
	.byte	9                       # Abbrev [9] 0x290:0xe DW_TAG_formal_parameter
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	8
	.long	.Linfo_string38         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	184                     # DW_AT_decl_line
	.long	717                     # DW_AT_type
	.byte	9                       # Abbrev [9] 0x29e:0xe DW_TAG_formal_parameter
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	12
	.long	.Linfo_string39         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	184                     # DW_AT_decl_line
	.long	767                     # DW_AT_type
	.byte	10                      # Abbrev [10] 0x2ac:0xe DW_TAG_variable
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	123
	.long	.Linfo_string30         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	186                     # DW_AT_decl_line
	.long	749                     # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	5                       # Abbrev [5] 0x2bb:0xb DW_TAG_typedef
	.long	710                     # DW_AT_type
	.long	.Linfo_string11         # DW_AT_name
	.byte	2                       # DW_AT_decl_file
	.byte	19                      # DW_AT_decl_line
	.byte	6                       # Abbrev [6] 0x2c6:0x7 DW_TAG_base_type
	.long	.Linfo_string10         # DW_AT_name
	.byte	7                       # DW_AT_encoding
	.byte	4                       # DW_AT_byte_size
	.byte	6                       # Abbrev [6] 0x2cd:0x7 DW_TAG_base_type
	.long	.Linfo_string20         # DW_AT_name
	.byte	5                       # DW_AT_encoding
	.byte	4                       # DW_AT_byte_size
	.byte	15                      # Abbrev [15] 0x2d4:0x5 DW_TAG_pointer_type
	.long	729                     # DW_AT_type
	.byte	6                       # Abbrev [6] 0x2d9:0x7 DW_TAG_base_type
	.long	.Linfo_string24         # DW_AT_name
	.byte	6                       # DW_AT_encoding
	.byte	1                       # DW_AT_byte_size
	.byte	3                       # Abbrev [3] 0x2e0:0xd DW_TAG_array_type
	.long	729                     # DW_AT_type
	.byte	16                      # Abbrev [16] 0x2e5:0x7 DW_TAG_subrange_type
	.long	85                      # DW_AT_type
	.short	1088                    # DW_AT_count
	.byte	0                       # End Of Children Mark
	.byte	5                       # Abbrev [5] 0x2ed:0xb DW_TAG_typedef
	.long	760                     # DW_AT_type
	.long	.Linfo_string37         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	18                      # DW_AT_decl_line
	.byte	6                       # Abbrev [6] 0x2f8:0x7 DW_TAG_base_type
	.long	.Linfo_string36         # DW_AT_name
	.byte	8                       # DW_AT_encoding
	.byte	1                       # DW_AT_byte_size
	.byte	15                      # Abbrev [15] 0x2ff:0x5 DW_TAG_pointer_type
	.long	724                     # DW_AT_type
	.byte	0                       # End Of Children Mark
.Ldebug_info_end0:
	.section	.debug_macinfo,"",@progbits
	.byte	0                       # End Of Macro List Mark

	.ident	"clang version 9.0.0-2 (tags/RELEASE_900/final)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym cgc_transmit_all
	.addrsig_sym cgc_transmit
	.addrsig_sym cgc_receive_all
	.addrsig_sym cgc_receive
	.addrsig_sym cgc_rotate_right
	.addrsig_sym cgc_rotate_down
	.addrsig_sym cgc_printBoard
	.addrsig_sym cgc_initBoard
	.addrsig_sym cgc_remove_bits
	.addrsig_sym cgc_makeMove
	.addrsig_sym cgc_isWinner
	.addrsig_sym gBoard
	.addrsig_sym mask
	.addrsig_sym neg_mask
	.section	.debug_line,"",@progbits
.Lline_table_start0:
