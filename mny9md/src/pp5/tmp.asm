	# standard Decaf preamble 
	  .text
	  .align 2
	  .globl main
  Student_printDetail:
	# BeginFunc 16
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 16	# decrement sp to make space for locals/temps
	# _tmp0 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -12($fp)	# spill _tmp0 from $t2 to $fp-12
	# PushParam _tmp0
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -12($fp)	# fill _tmp0 to $t0 from $fp-12
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp1 = "\n"
	  .data			# create string constant marked with label
	  _string1: .asciiz "\n"
	  .text
	  la $t2, _string1	# load label
	  sw $t2, -16($fp)	# spill _tmp1 from $t2 to $fp-16
	# PushParam _tmp1
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -16($fp)	# fill _tmp1 to $t0 from $fp-16
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp2 = *(this + 16)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 16($t0) 	# load with offset
	  sw $t2, -20($fp)	# spill _tmp2 from $t2 to $fp-20
	# PushParam _tmp2
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -20($fp)	# fill _tmp2 to $t0 from $fp-20
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp3 = "\n"
	  .data			# create string constant marked with label
	  _string2: .asciiz "\n"
	  .text
	  la $t2, _string2	# load label
	  sw $t2, -24($fp)	# spill _tmp3 from $t2 to $fp-24
	# PushParam _tmp3
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -24($fp)	# fill _tmp3 to $t0 from $fp-24
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  main:
	# BeginFunc 148
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 148	# decrement sp to make space for locals/temps
	# _tmp2 = 10
	  li $t2, 10		# load constant value 10 into $t2
	  sw $t2, -20($fp)	# spill _tmp2 from $t2 to $fp-20
	# _tmp3 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -24($fp)	# spill _tmp3 from $t2 to $fp-24
	# _tmp4 = _tmp2 * _tmp3
	  lw $t0, -20($fp)	# fill _tmp2 to $t0 from $fp-20
	  lw $t1, -24($fp)	# fill _tmp3 to $t1 from $fp-24
	  mul $t2, $t0, $t1	
	  sw $t2, -28($fp)	# spill _tmp4 from $t2 to $fp-28
	# _tmp5 = _tmp4 + _tmp3
	  lw $t0, -28($fp)	# fill _tmp4 to $t0 from $fp-28
	  lw $t1, -24($fp)	# fill _tmp3 to $t1 from $fp-24
	  add $t2, $t0, $t1	
	  sw $t2, -32($fp)	# spill _tmp5 from $t2 to $fp-32
	# PushParam _tmp5
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -32($fp)	# fill _tmp5 to $t0 from $fp-32
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp6 = LCall _Alloc
	  jal _Alloc         	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -36($fp)	# spill _tmp6 from $t2 to $fp-36
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# *(_tmp6) = _tmp2
	  lw $t0, -20($fp)	# fill _tmp2 to $t0 from $fp-20
	  lw $t2, -36($fp)	# fill _tmp6 to $t2 from $fp-36
	  sw $t0, 0($t2) 	# store with offset
	# y = _tmp6
	  lw $t2, -36($fp)	# fill _tmp6 to $t2 from $fp-36
	  sw $t2, 4($gp)	# spill y from $t2 to $gp+4
	# _tmp7 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -40($fp)	# spill _tmp7 from $t2 to $fp-40
	# x = _tmp7
	  lw $t2, -40($fp)	# fill _tmp7 to $t2 from $fp-40
	  sw $t2, 0($gp)	# spill x from $t2 to $gp+0
  loopBegin_0:
	# _tmp8 = 10
	  li $t2, 10		# load constant value 10 into $t2
	  sw $t2, -44($fp)	# spill _tmp8 from $t2 to $fp-44
	# _tmp9 = x < _tmp8
	  lw $t0, 0($gp)	# fill x to $t0 from $gp+0
	  lw $t1, -44($fp)	# fill _tmp8 to $t1 from $fp-44
	  slt $t2, $t0, $t1	
	  sw $t2, -48($fp)	# spill _tmp9 from $t2 to $fp-48
	# IfZ _tmp9 Goto loopEnd_1
	  lw $t0, -48($fp)	# fill _tmp9 to $t0 from $fp-48
	  beqz $t0, loopEnd_1	# branch if _tmp9 is zero 
	# _tmp10 = x * x
	  lw $t0, 0($gp)	# fill x to $t0 from $gp+0
	  lw $t1, 0($gp)	# fill x to $t1 from $gp+0
	  mul $t2, $t0, $t1	
	  sw $t2, -52($fp)	# spill _tmp10 from $t2 to $fp-52
	# _tmp11 = *(y)
	  lw $t0, 4($gp)	# fill y to $t0 from $gp+4
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -56($fp)	# spill _tmp11 from $t2 to $fp-56
	# _tmp12 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -60($fp)	# spill _tmp12 from $t2 to $fp-60
	# _tmp13 = x * _tmp12
	  lw $t0, 0($gp)	# fill x to $t0 from $gp+0
	  lw $t1, -60($fp)	# fill _tmp12 to $t1 from $fp-60
	  mul $t2, $t0, $t1	
	  sw $t2, -64($fp)	# spill _tmp13 from $t2 to $fp-64
	# _tmp14 = y + _tmp13
	  lw $t0, 4($gp)	# fill y to $t0 from $gp+4
	  lw $t1, -64($fp)	# fill _tmp13 to $t1 from $fp-64
	  add $t2, $t0, $t1	
	  sw $t2, -68($fp)	# spill _tmp14 from $t2 to $fp-68
	# _tmp15 = _tmp14 + _tmp12
	  lw $t0, -68($fp)	# fill _tmp14 to $t0 from $fp-68
	  lw $t1, -60($fp)	# fill _tmp12 to $t1 from $fp-60
	  add $t2, $t0, $t1	
	  sw $t2, -72($fp)	# spill _tmp15 from $t2 to $fp-72
	# *(_tmp15) = _tmp10
	  lw $t0, -52($fp)	# fill _tmp10 to $t0 from $fp-52
	  lw $t2, -72($fp)	# fill _tmp15 to $t2 from $fp-72
	  sw $t0, 0($t2) 	# store with offset
	# _tmp16 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -76($fp)	# spill _tmp16 from $t2 to $fp-76
	# _tmp17 = x + _tmp16
	  lw $t0, 0($gp)	# fill x to $t0 from $gp+0
	  lw $t1, -76($fp)	# fill _tmp16 to $t1 from $fp-76
	  add $t2, $t0, $t1	
	  sw $t2, -80($fp)	# spill _tmp17 from $t2 to $fp-80
	# x = _tmp17
	  lw $t2, -80($fp)	# fill _tmp17 to $t2 from $fp-80
	  sw $t2, 0($gp)	# spill x from $t2 to $gp+0
	# Goto loopBegin_0
	  b loopBegin_0		# unconditional branch
  loopEnd_1:
	# _tmp18 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -84($fp)	# spill _tmp18 from $t2 to $fp-84
	# x = _tmp18
	  lw $t2, -84($fp)	# fill _tmp18 to $t2 from $fp-84
	  sw $t2, 0($gp)	# spill x from $t2 to $gp+0
  loopBegin_2:
	# _tmp19 = 10
	  li $t2, 10		# load constant value 10 into $t2
	  sw $t2, -88($fp)	# spill _tmp19 from $t2 to $fp-88
	# _tmp20 = x < _tmp19
	  lw $t0, 0($gp)	# fill x to $t0 from $gp+0
	  lw $t1, -88($fp)	# fill _tmp19 to $t1 from $fp-88
	  slt $t2, $t0, $t1	
	  sw $t2, -92($fp)	# spill _tmp20 from $t2 to $fp-92
	# IfZ _tmp20 Goto loopEnd_3
	  lw $t0, -92($fp)	# fill _tmp20 to $t0 from $fp-92
	  beqz $t0, loopEnd_3	# branch if _tmp20 is zero 
	# _tmp21 = *(y)
	  lw $t0, 4($gp)	# fill y to $t0 from $gp+4
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -96($fp)	# spill _tmp21 from $t2 to $fp-96
	# _tmp22 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -100($fp)	# spill _tmp22 from $t2 to $fp-100
	# _tmp23 = x * _tmp22
	  lw $t0, 0($gp)	# fill x to $t0 from $gp+0
	  lw $t1, -100($fp)	# fill _tmp22 to $t1 from $fp-100
	  mul $t2, $t0, $t1	
	  sw $t2, -104($fp)	# spill _tmp23 from $t2 to $fp-104
	# _tmp24 = y + _tmp23
	  lw $t0, 4($gp)	# fill y to $t0 from $gp+4
	  lw $t1, -104($fp)	# fill _tmp23 to $t1 from $fp-104
	  add $t2, $t0, $t1	
	  sw $t2, -108($fp)	# spill _tmp24 from $t2 to $fp-108
	# _tmp25 = _tmp24 + _tmp22
	  lw $t0, -108($fp)	# fill _tmp24 to $t0 from $fp-108
	  lw $t1, -100($fp)	# fill _tmp22 to $t1 from $fp-100
	  add $t2, $t0, $t1	
	  sw $t2, -112($fp)	# spill _tmp25 from $t2 to $fp-112
	# _tmp26 = *(_tmp25)
	  lw $t0, -112($fp)	# fill _tmp25 to $t0 from $fp-112
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -116($fp)	# spill _tmp26 from $t2 to $fp-116
	# PushParam _tmp26
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -116($fp)	# fill _tmp26 to $t0 from $fp-116
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintInt
	  jal _PrintInt      	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp27 = "\n"
	  .data			# create string constant marked with label
	  _string3: .asciiz "\n"
	  .text
	  la $t2, _string3	# load label
	  sw $t2, -120($fp)	# spill _tmp27 from $t2 to $fp-120
	# PushParam _tmp27
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -120($fp)	# fill _tmp27 to $t0 from $fp-120
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp28 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -124($fp)	# spill _tmp28 from $t2 to $fp-124
	# _tmp29 = x + _tmp28
	  lw $t0, 0($gp)	# fill x to $t0 from $gp+0
	  lw $t1, -124($fp)	# fill _tmp28 to $t1 from $fp-124
	  add $t2, $t0, $t1	
	  sw $t2, -128($fp)	# spill _tmp29 from $t2 to $fp-128
	# x = _tmp29
	  lw $t2, -128($fp)	# fill _tmp29 to $t2 from $fp-128
	  sw $t2, 0($gp)	# spill x from $t2 to $gp+0
	# Goto loopBegin_2
	  b loopBegin_2		# unconditional branch
  loopEnd_3:
	# _tmp30 = "Hello World"
	  .data			# create string constant marked with label
	  _string4: .asciiz "Hello World"
	  .text
	  la $t2, _string4	# load label
	  sw $t2, -132($fp)	# spill _tmp30 from $t2 to $fp-132
	# _tmp31 = "From Charlottesville"
	  .data			# create string constant marked with label
	  _string5: .asciiz "From Charlottesville"
	  .text
	  la $t2, _string5	# load label
	  sw $t2, -136($fp)	# spill _tmp31 from $t2 to $fp-136
	# PushParam _tmp31
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -136($fp)	# fill _tmp31 to $t0 from $fp-136
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam _tmp30
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -132($fp)	# fill _tmp30 to $t0 from $fp-132
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _println
	  jal _println       	# jump to function
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# _tmp32 = LCall _generateNumber
	  jal _generateNumber	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -140($fp)	# spill _tmp32 from $t2 to $fp-140
	# x = _tmp32
	  lw $t2, -140($fp)	# fill _tmp32 to $t2 from $fp-140
	  sw $t2, 0($gp)	# spill x from $t2 to $gp+0
	# _tmp33 = "Number is "
	  .data			# create string constant marked with label
	  _string6: .asciiz "Number is "
	  .text
	  la $t2, _string6	# load label
	  sw $t2, -144($fp)	# spill _tmp33 from $t2 to $fp-144
	# PushParam _tmp33
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -144($fp)	# fill _tmp33 to $t0 from $fp-144
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# PushParam x
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, 0($gp)	# fill x to $t0 from $gp+0
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintInt
	  jal _PrintInt      	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp34 = "\n"
	  .data			# create string constant marked with label
	  _string7: .asciiz "\n"
	  .text
	  la $t2, _string7	# load label
	  sw $t2, -148($fp)	# spill _tmp34 from $t2 to $fp-148
	# PushParam _tmp34
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -148($fp)	# fill _tmp34 to $t0 from $fp-148
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp35 = "Array size is "
	  .data			# create string constant marked with label
	  _string8: .asciiz "Array size is "
	  .text
	  la $t2, _string8	# load label
	  sw $t2, -152($fp)	# spill _tmp35 from $t2 to $fp-152
	# PushParam _tmp35
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -152($fp)	# fill _tmp35 to $t0 from $fp-152
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp36 = *(y)
	  lw $t0, 4($gp)	# fill y to $t0 from $gp+4
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -156($fp)	# spill _tmp36 from $t2 to $fp-156
	# PushParam _tmp36
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -156($fp)	# fill _tmp36 to $t0 from $fp-156
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintInt
	  jal _PrintInt      	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  _println:
	# BeginFunc 8
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 8	# decrement sp to make space for locals/temps
	# PushParam s1
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, 4($fp)	# fill s1 to $t0 from $fp+4
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp0 = "\n"
	  .data			# create string constant marked with label
	  _string9: .asciiz "\n"
	  .text
	  la $t2, _string9	# load label
	  sw $t2, -12($fp)	# spill _tmp0 from $t2 to $fp-12
	# PushParam _tmp0
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -12($fp)	# fill _tmp0 to $t0 from $fp-12
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# PushParam s2
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, 8($fp)	# fill s2 to $t0 from $fp+8
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp1 = "\n"
	  .data			# create string constant marked with label
	  _string10: .asciiz "\n"
	  .text
	  la $t2, _string10	# load label
	  sw $t2, -16($fp)	# spill _tmp1 from $t2 to $fp-16
	# PushParam _tmp1
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -16($fp)	# fill _tmp1 to $t0 from $fp-16
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# Return 
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  _generateNumber:
	# BeginFunc 4
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 4	# decrement sp to make space for locals/temps
	# _tmp0 = LCall _ReadInteger
	  jal _ReadInteger   	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -12($fp)	# spill _tmp0 from $t2 to $fp-12
	# Return _tmp0
	  lw $t2, -12($fp)	# fill _tmp0 to $t2 from $fp-12
	  move $v0, $t2		# assign return value into $v0
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
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
