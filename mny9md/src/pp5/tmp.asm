	# standard Decaf preamble 
	  .text
	  .align 2
	  .globl main
  main:
	# BeginFunc 152
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 152	# decrement sp to make space for locals/temps
	# _tmp5 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -32($fp)	# spill _tmp5 from $t2 to $fp-32
	# _tmp6 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -36($fp)	# spill _tmp6 from $t2 to $fp-36
	# _tmp7 = _tmp5 == _tmp6
	  lw $t0, -32($fp)	# fill _tmp5 to $t0 from $fp-32
	  lw $t1, -36($fp)	# fill _tmp6 to $t1 from $fp-36
	  seq $t2, $t0, $t1	
	  sw $t2, -40($fp)	# spill _tmp7 from $t2 to $fp-40
	# _tmp8 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -44($fp)	# spill _tmp8 from $t2 to $fp-44
	# _tmp9 = _tmp7 == _tmp8
	  lw $t0, -40($fp)	# fill _tmp7 to $t0 from $fp-40
	  lw $t1, -44($fp)	# fill _tmp8 to $t1 from $fp-44
	  seq $t2, $t0, $t1	
	  sw $t2, -48($fp)	# spill _tmp9 from $t2 to $fp-48
	# b = _tmp9
	  lw $t2, -48($fp)	# fill _tmp9 to $t2 from $fp-48
	  sw $t2, 16($gp)	# spill b from $t2 to $gp+16
	# _tmp10 = 100
	  li $t2, 100		# load constant value 100 into $t2
	  sw $t2, -52($fp)	# spill _tmp10 from $t2 to $fp-52
	# a = _tmp10
	  lw $t2, -52($fp)	# fill _tmp10 to $t2 from $fp-52
	  sw $t2, 0($gp)	# spill a from $t2 to $gp+0
	# _tmp11 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -56($fp)	# spill _tmp11 from $t2 to $fp-56
	# a2 = _tmp11
	  lw $t2, -56($fp)	# fill _tmp11 to $t2 from $fp-56
	  sw $t2, 4($gp)	# spill a2 from $t2 to $gp+4
  loopBegin_0:
	# _tmp12 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -60($fp)	# spill _tmp12 from $t2 to $fp-60
	# IfZ _tmp12 Goto loopEnd_1
	  lw $t0, -60($fp)	# fill _tmp12 to $t0 from $fp-60
	  beqz $t0, loopEnd_1	# branch if _tmp12 is zero 
	# _tmp13 = "Another iteration\n"
	  .data			# create string constant marked with label
	  _string1: .asciiz "Another iteration\n"
	  .text
	  la $t2, _string1	# load label
	  sw $t2, -64($fp)	# spill _tmp13 from $t2 to $fp-64
	# PushParam _tmp13
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -64($fp)	# fill _tmp13 to $t0 from $fp-64
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp14 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -68($fp)	# spill _tmp14 from $t2 to $fp-68
	# _tmp15 = a2 + _tmp14
	  lw $t0, 4($gp)	# fill a2 to $t0 from $gp+4
	  lw $t1, -68($fp)	# fill _tmp14 to $t1 from $fp-68
	  add $t2, $t0, $t1	
	  sw $t2, -72($fp)	# spill _tmp15 from $t2 to $fp-72
	# a2 = _tmp15
	  lw $t2, -72($fp)	# fill _tmp15 to $t2 from $fp-72
	  sw $t2, 4($gp)	# spill a2 from $t2 to $gp+4
	# _tmp16 = 5
	  li $t2, 5		# load constant value 5 into $t2
	  sw $t2, -76($fp)	# spill _tmp16 from $t2 to $fp-76
	# _tmp17 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -80($fp)	# spill _tmp17 from $t2 to $fp-80
	# _tmp18 = _tmp16 - _tmp17
	  lw $t0, -76($fp)	# fill _tmp16 to $t0 from $fp-76
	  lw $t1, -80($fp)	# fill _tmp17 to $t1 from $fp-80
	  sub $t2, $t0, $t1	
	  sw $t2, -84($fp)	# spill _tmp18 from $t2 to $fp-84
	# _tmp19 = _tmp18 < a2
	  lw $t0, -84($fp)	# fill _tmp18 to $t0 from $fp-84
	  lw $t1, 4($gp)	# fill a2 to $t1 from $gp+4
	  slt $t2, $t0, $t1	
	  sw $t2, -88($fp)	# spill _tmp19 from $t2 to $fp-88
	# IfZ _tmp19 Goto else_2
	  lw $t0, -88($fp)	# fill _tmp19 to $t0 from $fp-88
	  beqz $t0, else_2	# branch if _tmp19 is zero 
	# Goto loopEnd_1
	  b loopEnd_1		# unconditional branch
	# Goto endif_3
	  b endif_3		# unconditional branch
  else_2:
  endif_3:
	# _tmp20 = "Hmmph\n"
	  .data			# create string constant marked with label
	  _string2: .asciiz "Hmmph\n"
	  .text
	  la $t2, _string2	# load label
	  sw $t2, -92($fp)	# spill _tmp20 from $t2 to $fp-92
	# PushParam _tmp20
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -92($fp)	# fill _tmp20 to $t0 from $fp-92
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# Goto loopBegin_0
	  b loopBegin_0		# unconditional branch
  loopEnd_1:
	# _tmp21 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -96($fp)	# spill _tmp21 from $t2 to $fp-96
	# a2 = _tmp21
	  lw $t2, -96($fp)	# fill _tmp21 to $t2 from $fp-96
	  sw $t2, 4($gp)	# spill a2 from $t2 to $gp+4
  loopBegin_4:
	# _tmp22 = a2 < a
	  lw $t0, 4($gp)	# fill a2 to $t0 from $gp+4
	  lw $t1, 0($gp)	# fill a to $t1 from $gp+0
	  slt $t2, $t0, $t1	
	  sw $t2, -100($fp)	# spill _tmp22 from $t2 to $fp-100
	# IfZ _tmp22 Goto loopEnd_5
	  lw $t0, -100($fp)	# fill _tmp22 to $t0 from $fp-100
	  beqz $t0, loopEnd_5	# branch if _tmp22 is zero 
	# _tmp23 = "A 2 is "
	  .data			# create string constant marked with label
	  _string3: .asciiz "A 2 is "
	  .text
	  la $t2, _string3	# load label
	  sw $t2, -104($fp)	# spill _tmp23 from $t2 to $fp-104
	# PushParam _tmp23
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -104($fp)	# fill _tmp23 to $t0 from $fp-104
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# PushParam a2
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, 4($gp)	# fill a2 to $t0 from $gp+4
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintInt
	  jal _PrintInt      	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp24 = "\n"
	  .data			# create string constant marked with label
	  _string4: .asciiz "\n"
	  .text
	  la $t2, _string4	# load label
	  sw $t2, -108($fp)	# spill _tmp24 from $t2 to $fp-108
	# PushParam _tmp24
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -108($fp)	# fill _tmp24 to $t0 from $fp-108
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp25 = 10
	  li $t2, 10		# load constant value 10 into $t2
	  sw $t2, -112($fp)	# spill _tmp25 from $t2 to $fp-112
	# _tmp26 = a2 + _tmp25
	  lw $t0, 4($gp)	# fill a2 to $t0 from $gp+4
	  lw $t1, -112($fp)	# fill _tmp25 to $t1 from $fp-112
	  add $t2, $t0, $t1	
	  sw $t2, -116($fp)	# spill _tmp26 from $t2 to $fp-116
	# a2 = _tmp26
	  lw $t2, -116($fp)	# fill _tmp26 to $t2 from $fp-116
	  sw $t2, 4($gp)	# spill a2 from $t2 to $gp+4
	# Goto loopBegin_4
	  b loopBegin_4		# unconditional branch
  loopEnd_5:
	# _tmp27 = 100
	  li $t2, 100		# load constant value 100 into $t2
	  sw $t2, -120($fp)	# spill _tmp27 from $t2 to $fp-120
	# _tmp28 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -124($fp)	# spill _tmp28 from $t2 to $fp-124
	# _tmp29 = _tmp27 - _tmp28
	  lw $t0, -120($fp)	# fill _tmp27 to $t0 from $fp-120
	  lw $t1, -124($fp)	# fill _tmp28 to $t1 from $fp-124
	  sub $t2, $t0, $t1	
	  sw $t2, -128($fp)	# spill _tmp29 from $t2 to $fp-128
	# _tmp30 = _tmp29 < a
	  lw $t0, -128($fp)	# fill _tmp29 to $t0 from $fp-128
	  lw $t1, 0($gp)	# fill a to $t1 from $gp+0
	  slt $t2, $t0, $t1	
	  sw $t2, -132($fp)	# spill _tmp30 from $t2 to $fp-132
	# IfZ _tmp30 Goto else_6
	  lw $t0, -132($fp)	# fill _tmp30 to $t0 from $fp-132
	  beqz $t0, else_6	# branch if _tmp30 is zero 
	# _tmp31 = "Hello there\n"
	  .data			# create string constant marked with label
	  _string5: .asciiz "Hello there\n"
	  .text
	  la $t2, _string5	# load label
	  sw $t2, -136($fp)	# spill _tmp31 from $t2 to $fp-136
	# PushParam _tmp31
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -136($fp)	# fill _tmp31 to $t0 from $fp-136
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# Goto endif_7
	  b endif_7		# unconditional branch
  else_6:
  endif_7:
	# _tmp32 = 99
	  li $t2, 99		# load constant value 99 into $t2
	  sw $t2, -140($fp)	# spill _tmp32 from $t2 to $fp-140
	# _tmp33 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -144($fp)	# spill _tmp33 from $t2 to $fp-144
	# _tmp34 = a - _tmp33
	  lw $t0, 0($gp)	# fill a to $t0 from $gp+0
	  lw $t1, -144($fp)	# fill _tmp33 to $t1 from $fp-144
	  sub $t2, $t0, $t1	
	  sw $t2, -148($fp)	# spill _tmp34 from $t2 to $fp-148
	# _tmp35 = _tmp34 < _tmp32
	  lw $t0, -148($fp)	# fill _tmp34 to $t0 from $fp-148
	  lw $t1, -140($fp)	# fill _tmp32 to $t1 from $fp-140
	  slt $t2, $t0, $t1	
	  sw $t2, -152($fp)	# spill _tmp35 from $t2 to $fp-152
	# IfZ _tmp35 Goto else_8
	  lw $t0, -152($fp)	# fill _tmp35 to $t0 from $fp-152
	  beqz $t0, else_8	# branch if _tmp35 is zero 
	# _tmp36 = "working if\n"
	  .data			# create string constant marked with label
	  _string6: .asciiz "working if\n"
	  .text
	  la $t2, _string6	# load label
	  sw $t2, -156($fp)	# spill _tmp36 from $t2 to $fp-156
	# PushParam _tmp36
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -156($fp)	# fill _tmp36 to $t0 from $fp-156
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# Goto endif_9
	  b endif_9		# unconditional branch
  else_8:
	# _tmp37 = "working else\n"
	  .data			# create string constant marked with label
	  _string7: .asciiz "working else\n"
	  .text
	  la $t2, _string7	# load label
	  sw $t2, -160($fp)	# spill _tmp37 from $t2 to $fp-160
	# PushParam _tmp37
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -160($fp)	# fill _tmp37 to $t0 from $fp-160
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
  endif_9:
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
_PrintInt:
        subu $sp, $sp, 8
        sw $fp, 8($sp)
        sw $ra, 4($sp)
        addiu $fp, $sp, 8
        li   $v0, 1
        lw   $a0, 4($fp)
        syscall
        move $sp, $fp
        lw $ra, -4($fp)
        lw $fp, 0($fp)
        jr $ra
                                
_PrintString:
        subu $sp, $sp, 8
        sw $fp, 8($sp)
        sw $ra, 4($sp)
        addiu $fp, $sp, 8
        li   $v0, 4
        lw $a0, 4($fp)
        syscall
        move $sp, $fp
        lw $ra, -4($fp)
        lw $fp, 0($fp)
        jr $ra
        
_PrintBool:
	subu $sp, $sp, 8
	sw $fp, 8($sp)
	sw $ra, 4($sp)
        addiu $fp, $sp, 8
	lw $t1, 4($fp)
	blez $t1, fbr
	li   $v0, 4		# system call for print_str
	la   $a0, TRUE		# address of str to print
	syscall			
	b end
fbr:	li   $v0, 4		# system call for print_str
	la   $a0, FALSE		# address of str to print
	syscall				
end:	move $sp, $fp
	lw $ra, -4($fp)
	lw $fp, 0($fp)
	jr $ra

_Alloc:
        subu $sp, $sp, 8
        sw $fp, 8($sp)
        sw $ra, 4($sp)
        addiu $fp, $sp, 8
        li   $v0, 9
        lw $a0, 4($fp)
	syscall
        move $sp, $fp
        lw $ra, -4($fp)
        lw $fp, 0($fp) 
        jr $ra


_StringEqual:
	subu $sp, $sp, 8      # decrement sp to make space to save ra, fp
	sw $fp, 8($sp)        # save fp
	sw $ra, 4($sp)        # save ra
	addiu $fp, $sp, 8     # set up new fp
	subu $sp, $sp, 4      # decrement sp to make space for locals/temps

	li $v0,0

	#Determine length string 1
	lw $t0, 4($fp)       
	li $t3,0
bloop1: 
	lb $t5, ($t0) 
	beqz $t5, eloop1	
	addi $t0, 1
	addi $t3, 1
	b bloop1
eloop1:

	#Determine length string 2
	lw $t1, 8($fp)
	li $t4,0
bloop2: 
	lb $t5, ($t1) 
	beqz $t5, eloop2	
	addi $t1, 1
	addi $t4, 1
	b bloop2
eloop2:
	bne $t3,$t4,end1       #Check String Lengths Same

	lw $t0, 4($fp)       
	lw $t1, 8($fp)
	li $t3, 0     		
bloop3:	
	lb $t5, ($t0) 
	lb $t6, ($t1) 
	bne $t5, $t6, end1
	addi $t3, 1
	addi $t0, 1
	addi $t1, 1
	bne $t3,$t4,bloop3
eloop3:	li $v0,1

end1:	move $sp, $fp         # pop callee frame off stack
	lw $ra, -4($fp)       # restore saved ra
	lw $fp, 0($fp)        # restore saved fp
	jr $ra                # return from function

_Halt:
        li $v0, 10
        syscall

_ReadInteger:
	subu $sp, $sp, 8      # decrement sp to make space to save ra, fp
	sw $fp, 8($sp)        # save fp
	sw $ra, 4($sp)        # save ra
	addiu $fp, $sp, 8     # set up new fp
	subu $sp, $sp, 4      # decrement sp to make space for locals/temps
	li $v0, 5
	syscall
	move $sp, $fp         # pop callee frame off stack
	lw $ra, -4($fp)       # restore saved ra
	lw $fp, 0($fp)        # restore saved fp
	jr $ra
        

_ReadLine:
	subu $sp, $sp, 8      # decrement sp to make space to save ra, fp
	sw $fp, 8($sp)        # save fp
	sw $ra, 4($sp)        # save ra
	addiu $fp, $sp, 8     # set up new fp
	subu $sp, $sp, 4      # decrement sp to make space for locals/temps
	li $a1, 40
	la $a0, SPACE
	li $v0, 8
	syscall

	la $t1, SPACE
bloop4: 
	lb $t5, ($t1) 
	beqz $t5, eloop4	
	addi $t1, 1
	b bloop4
eloop4:
	addi $t1,-1
	li $t6,0
        sb $t6, ($t1)

	la $v0, SPACE
	move $sp, $fp         # pop callee frame off stack
	lw $ra, -4($fp)       # restore saved ra
	lw $fp, 0($fp)        # restore saved fp
	jr $ra
	

	.data
TRUE:.asciiz "true"
FALSE:.asciiz "false"
SPACE:.asciiz "Making Space For Inputed Values Is Fun."
