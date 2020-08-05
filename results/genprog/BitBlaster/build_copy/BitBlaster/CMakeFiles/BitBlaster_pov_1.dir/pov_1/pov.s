	.text
	.file	"pov.c"
	.file	1 "/home/epicosy/thesis/implementation/repair/SecureThemAll2/benchmark/cb-multios" "challenges/BitBlaster/pov_1/pov.c"
	.globl	main                    # -- Begin function main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
.Lfunc_begin0:
	.loc	1 2 0                   # challenges/BitBlaster/pov_1/pov.c:2:0
	.cfi_sections .debug_frame
	.cfi_startproc
# %bb.0:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset %ebp, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register %ebp
	subl	$72, %esp
	movl	12(%ebp), %eax
	movl	8(%ebp), %ecx
	xorl	%edx, %edx
	movl	$0, -4(%ebp)
.Ltmp0:
	.loc	1 3 4 prologue_end      # challenges/BitBlaster/pov_1/pov.c:3:4
	movl	$0, (%esp)
	movl	$0, 4(%esp)
	movl	$0, 8(%esp)
	movl	%eax, -32(%ebp)         # 4-byte Spill
	movl	%ecx, -36(%ebp)         # 4-byte Spill
	movl	%edx, -40(%ebp)         # 4-byte Spill
	calll	cgc_negotiate_type1
# %bb.1:
.Ltmp1:
	.loc	1 32 22                 # challenges/BitBlaster/pov_1/pov.c:32:22
	movl	$0, -8(%ebp)
	.loc	1 33 20                 # challenges/BitBlaster/pov_1/pov.c:33:20
	movl	$0, -12(%ebp)
	.loc	1 34 36                 # challenges/BitBlaster/pov_1/pov.c:34:36
	movl	-8(%ebp), %eax
	.loc	1 34 86 is_stmt 0       # challenges/BitBlaster/pov_1/pov.c:34:86
	movl	main.write_00000_00000_len, %ecx
	.loc	1 34 21                 # challenges/BitBlaster/pov_1/pov.c:34:21
	movl	%eax, (%esp)
	leal	-12(%ebp), %eax
.Ltmp2:
	#DEBUG_VALUE: write_00000_len <- [$eax+0]
	movl	%eax, 4(%esp)
	leal	main.write_00000_00000, %eax
.Ltmp3:
	movl	%eax, 8(%esp)
	movl	%ecx, 12(%esp)
	calll	cgc_append_buf
	.loc	1 34 19                 # challenges/BitBlaster/pov_1/pov.c:34:19
	movl	%eax, -8(%ebp)
.Ltmp4:
	.loc	1 35 27 is_stmt 1       # challenges/BitBlaster/pov_1/pov.c:35:27
	cmpl	$0, -12(%ebp)
.Ltmp5:
	.loc	1 35 11 is_stmt 0       # challenges/BitBlaster/pov_1/pov.c:35:11
	jbe	.LBB0_3
# %bb.2:
.Ltmp6:
	.loc	1 36 30 is_stmt 1       # challenges/BitBlaster/pov_1/pov.c:36:30
	movl	-8(%ebp), %eax
	.loc	1 36 43 is_stmt 0       # challenges/BitBlaster/pov_1/pov.c:36:43
	movl	-12(%ebp), %ecx
	.loc	1 36 10                 # challenges/BitBlaster/pov_1/pov.c:36:10
	movl	$1, (%esp)
	movl	%eax, 4(%esp)
	movl	%ecx, 8(%esp)
	calll	cgc_transmit_all
.Ltmp7:
.LBB0_3:
	.loc	1 38 16 is_stmt 1       # challenges/BitBlaster/pov_1/pov.c:38:16
	movl	-8(%ebp), %eax
	.loc	1 38 7 is_stmt 0        # challenges/BitBlaster/pov_1/pov.c:38:7
	movl	%eax, (%esp)
	calll	cgc_free
.Ltmp8:
# %bb.4:
	.loc	1 40 4 is_stmt 1        # challenges/BitBlaster/pov_1/pov.c:40:4
	jmp	.LBB0_5
.LBB0_5:
	.loc	1 0 4 is_stmt 0         # challenges/BitBlaster/pov_1/pov.c:0:4
	xorl	%eax, %eax
.Ltmp9:
	.loc	1 43 20 is_stmt 1       # challenges/BitBlaster/pov_1/pov.c:43:20
	movl	$0, -24(%ebp)
	.loc	1 47 18                 # challenges/BitBlaster/pov_1/pov.c:47:18
	movl	$0, -16(%ebp)
	.loc	1 48 22                 # challenges/BitBlaster/pov_1/pov.c:48:22
	movl	$0, -20(%ebp)
	.loc	1 49 28                 # challenges/BitBlaster/pov_1/pov.c:49:28
	movl	$0, (%esp)
	leal	-16(%ebp), %ecx
.Ltmp10:
	#DEBUG_VALUE: read_00000 <- [$ecx+0]
	movl	%ecx, 4(%esp)
	leal	-20(%ebp), %ecx
.Ltmp11:
	#DEBUG_VALUE: read_00000_len <- [$ecx+0]
	movl	%ecx, 8(%esp)
	leal	main.read_00000_delim, %ecx
.Ltmp12:
	movl	%ecx, 12(%esp)
	movl	$1, 16(%esp)
	movl	%eax, -44(%ebp)         # 4-byte Spill
	calll	cgc_delimited_read
	.loc	1 49 11 is_stmt 0       # challenges/BitBlaster/pov_1/pov.c:49:11
	movl	%eax, -28(%ebp)
.Ltmp13:
	.loc	1 50 11 is_stmt 1       # challenges/BitBlaster/pov_1/pov.c:50:11
	cmpl	$0, -28(%ebp)
.Ltmp14:
	.loc	1 50 11 is_stmt 0       # challenges/BitBlaster/pov_1/pov.c:50:11
	je	.LBB0_7
# %bb.6:
.Ltmp15:
	.loc	1 50 28                 # challenges/BitBlaster/pov_1/pov.c:50:28
	jmp	.LBB0_7
.Ltmp16:
.LBB0_7:
	.loc	1 54 40 is_stmt 1       # challenges/BitBlaster/pov_1/pov.c:54:40
	movl	-16(%ebp), %eax
	.loc	1 54 51 is_stmt 0       # challenges/BitBlaster/pov_1/pov.c:54:51
	addl	-24(%ebp), %eax
	.loc	1 54 69                 # challenges/BitBlaster/pov_1/pov.c:54:69
	movl	-20(%ebp), %ecx
	.loc	1 54 84                 # challenges/BitBlaster/pov_1/pov.c:54:84
	subl	-24(%ebp), %ecx
	.loc	1 54 25                 # challenges/BitBlaster/pov_1/pov.c:54:25
	movl	%eax, (%esp)
	movl	%ecx, 4(%esp)
	leal	main.match_00000_00000, %eax
	movl	%eax, 8(%esp)
	movl	$8, 12(%esp)
	calll	cgc_data_match
	.loc	1 54 22                 # challenges/BitBlaster/pov_1/pov.c:54:22
	addl	-24(%ebp), %eax
	movl	%eax, -24(%ebp)
	.loc	1 55 16 is_stmt 1       # challenges/BitBlaster/pov_1/pov.c:55:16
	movl	-16(%ebp), %eax
	.loc	1 55 7 is_stmt 0        # challenges/BitBlaster/pov_1/pov.c:55:7
	movl	%eax, (%esp)
	calll	cgc_free
.Ltmp17:
	.loc	1 56 11 is_stmt 1       # challenges/BitBlaster/pov_1/pov.c:56:11
	cmpl	$0, -24(%ebp)
.Ltmp18:
	.loc	1 56 11 is_stmt 0       # challenges/BitBlaster/pov_1/pov.c:56:11
	je	.LBB0_9
# %bb.8:
.Ltmp19:
	.loc	1 56 28                 # challenges/BitBlaster/pov_1/pov.c:56:28
	jmp	.LBB0_9
.Ltmp20:
.LBB0_9:
	.loc	1 57 4 is_stmt 1        # challenges/BitBlaster/pov_1/pov.c:57:4
	jmp	.LBB0_10
.Ltmp21:
.LBB0_10:
	.loc	1 58 1                  # challenges/BitBlaster/pov_1/pov.c:58:1
	movl	-4(%ebp), %eax
	addl	$72, %esp
	popl	%ebp
	.cfi_def_cfa %esp, 4
	retl
.Ltmp22:
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc
                                        # -- End function
	.type	main.write_00000_00000,@object # @main.write_00000_00000
	.data
main.write_00000_00000:
	.asciz	">?>?>?>?>?>?>?>?>?>?>?>?>?>?>?>?>?>?>?>?>?>?>?>?>?>?>?>?>?>?>?>?>?>?>?>?>?>?>?>?>?>?>?>?>?>?>?>?>?>?>?>?>?>?>?>?>?>?>?>?>?>?>?>?>?>?>?>?>?>?>?>?>?>?>?>?>?>?>?>?>?>?>?>?>?>?>?>?>?>?>?>?>?>?>?>?>?>?>?>?>?>?>?>?>?>?>?>?>?>?>?>?>?>?>?>?>?>?>?>?>?>?>?>?>?>?>?>?>?>?>?>?>?>?>?>?>?>?>?>?>?>?>?>?>?>?>?>?>?>?>?>?>?>?>?>?>?>?>?>?>?>?>?>?>?>?>?>?>?>?>?>?>?>?>?>?>?>?>?>?>?>?>?>?>?>?>?>?>?>?"
	.size	main.write_00000_00000, 381

	.type	main.write_00000_00000_len,@object # @main.write_00000_00000_len
	.p2align	2
main.write_00000_00000_len:
	.long	380                     # 0x17c
	.size	main.write_00000_00000_len, 4

	.type	main.read_00000_delim,@object # @main.read_00000_delim
main.read_00000_delim:
	.asciz	"\n"
	.size	main.read_00000_delim, 2

	.type	main.match_00000_00000,@object # @main.match_00000_00000
main.match_00000_00000:
	.asciz	"You Win\n"
	.size	main.match_00000_00000, 9

	.section	.debug_str,"MS",@progbits,1
.Linfo_string0:
	.asciz	"clang version 9.0.0-2 (tags/RELEASE_900/final)" # string offset=0
.Linfo_string1:
	.asciz	"CMakeFiles/BitBlaster_pov_1.dir/pov_1/pov.c" # string offset=47
.Linfo_string2:
	.asciz	"/home/epicosy/thesis/implementation/repair/SecureThemAll2/benchmark/cb-multios/build/challenges/BitBlaster" # string offset=91
.Linfo_string3:
	.asciz	"write_00000_00000"     # string offset=198
.Linfo_string4:
	.asciz	"unsigned char"         # string offset=216
.Linfo_string5:
	.asciz	"__ARRAY_SIZE_TYPE__"   # string offset=230
.Linfo_string6:
	.asciz	"write_00000_00000_len" # string offset=250
.Linfo_string7:
	.asciz	"unsigned int"          # string offset=272
.Linfo_string8:
	.asciz	"read_00000_delim"      # string offset=285
.Linfo_string9:
	.asciz	"match_00000_00000"     # string offset=302
.Linfo_string10:
	.asciz	"main"                  # string offset=320
.Linfo_string11:
	.asciz	"int"                   # string offset=325
.Linfo_string12:
	.asciz	"cgc_argc"              # string offset=329
.Linfo_string13:
	.asciz	"cgc_argv"              # string offset=338
.Linfo_string14:
	.asciz	"char"                  # string offset=347
.Linfo_string15:
	.asciz	"write_00000"           # string offset=352
.Linfo_string16:
	.asciz	"write_00000_len"       # string offset=364
.Linfo_string17:
	.asciz	"read_00000"            # string offset=380
.Linfo_string18:
	.asciz	"read_00000_len"        # string offset=391
.Linfo_string19:
	.asciz	"read_00000_ptr"        # string offset=406
.Linfo_string20:
	.asciz	"read_00000_res"        # string offset=421
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
	.byte	3                       # Abbreviation Code
	.byte	52                      # DW_TAG_variable
	.byte	0                       # DW_CHILDREN_no
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	11                      # DW_FORM_data1
	.byte	2                       # DW_AT_location
	.byte	24                      # DW_FORM_exprloc
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	4                       # Abbreviation Code
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
	.byte	5                       # Abbreviation Code
	.byte	11                      # DW_TAG_lexical_block
	.byte	1                       # DW_CHILDREN_yes
	.byte	17                      # DW_AT_low_pc
	.byte	1                       # DW_FORM_addr
	.byte	18                      # DW_AT_high_pc
	.byte	6                       # DW_FORM_data4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	6                       # Abbreviation Code
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
	.byte	7                       # Abbreviation Code
	.byte	1                       # DW_TAG_array_type
	.byte	1                       # DW_CHILDREN_yes
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	8                       # Abbreviation Code
	.byte	33                      # DW_TAG_subrange_type
	.byte	0                       # DW_CHILDREN_no
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	55                      # DW_AT_count
	.byte	5                       # DW_FORM_data2
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	9                       # Abbreviation Code
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
	.byte	10                      # Abbreviation Code
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
	.byte	11                      # Abbreviation Code
	.byte	33                      # DW_TAG_subrange_type
	.byte	0                       # DW_CHILDREN_no
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	55                      # DW_AT_count
	.byte	11                      # DW_FORM_data1
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	12                      # Abbreviation Code
	.byte	15                      # DW_TAG_pointer_type
	.byte	0                       # DW_CHILDREN_no
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
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
	.byte	1                       # Abbrev [1] 0xb:0x151 DW_TAG_compile_unit
	.long	.Linfo_string0          # DW_AT_producer
	.short	12                      # DW_AT_language
	.long	.Linfo_string1          # DW_AT_name
	.long	.Lline_table_start0     # DW_AT_stmt_list
	.long	.Linfo_string2          # DW_AT_comp_dir
	.long	.Lfunc_begin0           # DW_AT_low_pc
	.long	.Lfunc_end0-.Lfunc_begin0 # DW_AT_high_pc
	.byte	2                       # Abbrev [2] 0x26:0xde DW_TAG_subprogram
	.long	.Lfunc_begin0           # DW_AT_low_pc
	.long	.Lfunc_end0-.Lfunc_begin0 # DW_AT_high_pc
	.byte	1                       # DW_AT_frame_base
	.byte	85
	.long	.Linfo_string10         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	2                       # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	318                     # DW_AT_type
                                        # DW_AT_external
	.byte	3                       # Abbrev [3] 0x3b:0x11 DW_TAG_variable
	.long	.Linfo_string3          # DW_AT_name
	.long	260                     # DW_AT_type
	.byte	1                       # DW_AT_decl_file
	.byte	6                       # DW_AT_decl_line
	.byte	5                       # DW_AT_location
	.byte	3
	.long	main.write_00000_00000
	.byte	3                       # Abbrev [3] 0x4c:0x11 DW_TAG_variable
	.long	.Linfo_string6          # DW_AT_name
	.long	287                     # DW_AT_type
	.byte	1                       # DW_AT_decl_file
	.byte	31                      # DW_AT_decl_line
	.byte	5                       # DW_AT_location
	.byte	3
	.long	main.write_00000_00000_len
	.byte	3                       # Abbrev [3] 0x5d:0x11 DW_TAG_variable
	.long	.Linfo_string8          # DW_AT_name
	.long	294                     # DW_AT_type
	.byte	1                       # DW_AT_decl_file
	.byte	45                      # DW_AT_decl_line
	.byte	5                       # DW_AT_location
	.byte	3
	.long	main.read_00000_delim
	.byte	3                       # Abbrev [3] 0x6e:0x11 DW_TAG_variable
	.long	.Linfo_string9          # DW_AT_name
	.long	306                     # DW_AT_type
	.byte	1                       # DW_AT_decl_file
	.byte	52                      # DW_AT_decl_line
	.byte	5                       # DW_AT_location
	.byte	3
	.long	main.match_00000_00000
	.byte	4                       # Abbrev [4] 0x7f:0xe DW_TAG_formal_parameter
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	8
	.long	.Linfo_string12         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	2                       # DW_AT_decl_line
	.long	318                     # DW_AT_type
	.byte	4                       # Abbrev [4] 0x8d:0xe DW_TAG_formal_parameter
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	12
	.long	.Linfo_string13         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	2                       # DW_AT_decl_line
	.long	325                     # DW_AT_type
	.byte	5                       # Abbrev [5] 0x9b:0x26 DW_TAG_lexical_block
	.long	.Ltmp1                  # DW_AT_low_pc
	.long	.Ltmp8-.Ltmp1           # DW_AT_high_pc
	.byte	6                       # Abbrev [6] 0xa4:0xe DW_TAG_variable
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	120
	.long	.Linfo_string15         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	32                      # DW_AT_decl_line
	.long	342                     # DW_AT_type
	.byte	6                       # Abbrev [6] 0xb2:0xe DW_TAG_variable
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	116
	.long	.Linfo_string16         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	33                      # DW_AT_decl_line
	.long	287                     # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	5                       # Abbrev [5] 0xc1:0x42 DW_TAG_lexical_block
	.long	.Ltmp9                  # DW_AT_low_pc
	.long	.Ltmp21-.Ltmp9          # DW_AT_high_pc
	.byte	6                       # Abbrev [6] 0xca:0xe DW_TAG_variable
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	112
	.long	.Linfo_string17         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	41                      # DW_AT_decl_line
	.long	342                     # DW_AT_type
	.byte	6                       # Abbrev [6] 0xd8:0xe DW_TAG_variable
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	108
	.long	.Linfo_string18         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	42                      # DW_AT_decl_line
	.long	287                     # DW_AT_type
	.byte	6                       # Abbrev [6] 0xe6:0xe DW_TAG_variable
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	104
	.long	.Linfo_string19         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	43                      # DW_AT_decl_line
	.long	287                     # DW_AT_type
	.byte	6                       # Abbrev [6] 0xf4:0xe DW_TAG_variable
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	100
	.long	.Linfo_string20         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	49                      # DW_AT_decl_line
	.long	318                     # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	7                       # Abbrev [7] 0x104:0xd DW_TAG_array_type
	.long	273                     # DW_AT_type
	.byte	8                       # Abbrev [8] 0x109:0x7 DW_TAG_subrange_type
	.long	280                     # DW_AT_type
	.short	381                     # DW_AT_count
	.byte	0                       # End Of Children Mark
	.byte	9                       # Abbrev [9] 0x111:0x7 DW_TAG_base_type
	.long	.Linfo_string4          # DW_AT_name
	.byte	8                       # DW_AT_encoding
	.byte	1                       # DW_AT_byte_size
	.byte	10                      # Abbrev [10] 0x118:0x7 DW_TAG_base_type
	.long	.Linfo_string5          # DW_AT_name
	.byte	8                       # DW_AT_byte_size
	.byte	7                       # DW_AT_encoding
	.byte	9                       # Abbrev [9] 0x11f:0x7 DW_TAG_base_type
	.long	.Linfo_string7          # DW_AT_name
	.byte	7                       # DW_AT_encoding
	.byte	4                       # DW_AT_byte_size
	.byte	7                       # Abbrev [7] 0x126:0xc DW_TAG_array_type
	.long	273                     # DW_AT_type
	.byte	11                      # Abbrev [11] 0x12b:0x6 DW_TAG_subrange_type
	.long	280                     # DW_AT_type
	.byte	2                       # DW_AT_count
	.byte	0                       # End Of Children Mark
	.byte	7                       # Abbrev [7] 0x132:0xc DW_TAG_array_type
	.long	273                     # DW_AT_type
	.byte	11                      # Abbrev [11] 0x137:0x6 DW_TAG_subrange_type
	.long	280                     # DW_AT_type
	.byte	9                       # DW_AT_count
	.byte	0                       # End Of Children Mark
	.byte	9                       # Abbrev [9] 0x13e:0x7 DW_TAG_base_type
	.long	.Linfo_string11         # DW_AT_name
	.byte	5                       # DW_AT_encoding
	.byte	4                       # DW_AT_byte_size
	.byte	12                      # Abbrev [12] 0x145:0x5 DW_TAG_pointer_type
	.long	330                     # DW_AT_type
	.byte	12                      # Abbrev [12] 0x14a:0x5 DW_TAG_pointer_type
	.long	335                     # DW_AT_type
	.byte	9                       # Abbrev [9] 0x14f:0x7 DW_TAG_base_type
	.long	.Linfo_string14         # DW_AT_name
	.byte	6                       # DW_AT_encoding
	.byte	1                       # DW_AT_byte_size
	.byte	12                      # Abbrev [12] 0x156:0x5 DW_TAG_pointer_type
	.long	273                     # DW_AT_type
	.byte	0                       # End Of Children Mark
.Ldebug_info_end0:
	.section	.debug_macinfo,"",@progbits
	.byte	0                       # End Of Macro List Mark

	.ident	"clang version 9.0.0-2 (tags/RELEASE_900/final)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym cgc_negotiate_type1
	.addrsig_sym cgc_append_buf
	.addrsig_sym cgc_transmit_all
	.addrsig_sym cgc_free
	.addrsig_sym cgc_delimited_read
	.addrsig_sym cgc_data_match
	.addrsig_sym main.write_00000_00000
	.addrsig_sym main.write_00000_00000_len
	.addrsig_sym main.read_00000_delim
	.addrsig_sym main.match_00000_00000
	.section	.debug_line,"",@progbits
.Lline_table_start0:
