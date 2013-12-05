	# standard Decaf preamble 
	  .text
	  .align 2
	  .globl main
  Stack_Init:
	# BeginFunc 64
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 64	# decrement sp to make space for locals/temps
	# _tmp0 = 100
	  li $t2, 100		# load constant value 100 into $t2
	  sw $t2, -8($fp)	# spill _tmp0 from $t2 to $fp-8
	# _tmp1 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -12($fp)	# spill _tmp1 from $t2 to $fp-12
	# _tmp2 = _tmp0 < _tmp1
	  lw $t0, -8($fp)	# fill _tmp0 to $t0 from $fp-8
	  lw $t1, -12($fp)	# fill _tmp1 to $t1 from $fp-12
	  slt $t2, $t0, $t1	
	  sw $t2, -16($fp)	# spill _tmp2 from $t2 to $fp-16
	# IfZ _tmp2 Goto allocate_0
	  lw $t0, -16($fp)	# fill _tmp2 to $t0 from $fp-16
	  beqz $t0, allocate_0	# branch if _tmp2 is zero 
	# _tmp3 = "Decaf runtime error: Array size is <= 0\n"
	  .data			# create string constant marked with label
	  _string1: .asciiz "Decaf runtime error: Array size is <= 0\n"
	  .text
	  la $t2, _string1	# load label
	  sw $t2, -20($fp)	# spill _tmp3 from $t2 to $fp-20
	# PushParam _tmp3
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -20($fp)	# fill _tmp3 to $t0 from $fp-20
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  allocate_0:
	# _tmp4 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -24($fp)	# spill _tmp4 from $t2 to $fp-24
	# _tmp5 = _tmp0 * _tmp4
	  lw $t0, -8($fp)	# fill _tmp0 to $t0 from $fp-8
	  lw $t1, -24($fp)	# fill _tmp4 to $t1 from $fp-24
	  mul $t2, $t0, $t1	
	  sw $t2, -28($fp)	# spill _tmp5 from $t2 to $fp-28
	# _tmp6 = _tmp5 + _tmp4
	  lw $t0, -28($fp)	# fill _tmp5 to $t0 from $fp-28
	  lw $t1, -24($fp)	# fill _tmp4 to $t1 from $fp-24
	  add $t2, $t0, $t1	
	  sw $t2, -32($fp)	# spill _tmp6 from $t2 to $fp-32
	# PushParam _tmp6
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -32($fp)	# fill _tmp6 to $t0 from $fp-32
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp7 = LCall _Alloc
	  jal _Alloc         	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -36($fp)	# spill _tmp7 from $t2 to $fp-36
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# *(_tmp7) = _tmp0
	  lw $t0, -8($fp)	# fill _tmp0 to $t0 from $fp-8
	  lw $t2, -36($fp)	# fill _tmp7 to $t2 from $fp-36
	  sw $t0, 0($t2) 	# store with offset
	# _tmp8 = 8
	  li $t2, 8		# load constant value 8 into $t2
	  sw $t2, -40($fp)	# spill _tmp8 from $t2 to $fp-40
	# _tmp9 = this + _tmp8
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t1, -40($fp)	# fill _tmp8 to $t1 from $fp-40
	  add $t2, $t0, $t1	
	  sw $t2, -44($fp)	# spill _tmp9 from $t2 to $fp-44
	# *(_tmp9) = _tmp7
	  lw $t0, -36($fp)	# fill _tmp7 to $t0 from $fp-36
	  lw $t2, -44($fp)	# fill _tmp9 to $t2 from $fp-44
	  sw $t0, 0($t2) 	# store with offset
	# _tmp10 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -48($fp)	# spill _tmp10 from $t2 to $fp-48
	# _tmp11 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -52($fp)	# spill _tmp11 from $t2 to $fp-52
	# _tmp12 = this + _tmp11
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t1, -52($fp)	# fill _tmp11 to $t1 from $fp-52
	  add $t2, $t0, $t1	
	  sw $t2, -56($fp)	# spill _tmp12 from $t2 to $fp-56
	# *(_tmp12) = _tmp10
	  lw $t0, -48($fp)	# fill _tmp10 to $t0 from $fp-48
	  lw $t2, -56($fp)	# fill _tmp12 to $t2 from $fp-56
	  sw $t0, 0($t2) 	# store with offset
	# _tmp13 = 3
	  li $t2, 3		# load constant value 3 into $t2
	  sw $t2, -60($fp)	# spill _tmp13 from $t2 to $fp-60
	# _tmp14 = *(this)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -64($fp)	# spill _tmp14 from $t2 to $fp-64
	# _tmp15 = *(_tmp14 + 4)
	  lw $t0, -64($fp)	# fill _tmp14 to $t0 from $fp-64
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -68($fp)	# spill _tmp15 from $t2 to $fp-68
	# PushParam _tmp13
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -60($fp)	# fill _tmp13 to $t0 from $fp-60
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam this
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  sw $t0, 4($sp)	# copy param value to stack
	# ACall _tmp15
	  lw $t0, -68($fp)	# fill _tmp15 to $t0 from $fp-68
	  jalr $t0            	# jump to function
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  Stack_Push:
	# BeginFunc 76
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 76	# decrement sp to make space for locals/temps
	# _tmp0 = *(this + 8)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 8($t0) 	# load with offset
	  sw $t2, -8($fp)	# spill _tmp0 from $t2 to $fp-8
	# _tmp1 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -12($fp)	# spill _tmp1 from $t2 to $fp-12
	# _tmp2 = *(_tmp0)
	  lw $t0, -8($fp)	# fill _tmp0 to $t0 from $fp-8
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -16($fp)	# spill _tmp2 from $t2 to $fp-16
	# _tmp3 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -20($fp)	# spill _tmp3 from $t2 to $fp-20
	# _tmp4 = _tmp1 < _tmp3
	  lw $t0, -12($fp)	# fill _tmp1 to $t0 from $fp-12
	  lw $t1, -20($fp)	# fill _tmp3 to $t1 from $fp-20
	  slt $t2, $t0, $t1	
	  sw $t2, -24($fp)	# spill _tmp4 from $t2 to $fp-24
	# _tmp5 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -28($fp)	# spill _tmp5 from $t2 to $fp-28
	# _tmp6 = _tmp2 - _tmp5
	  lw $t0, -16($fp)	# fill _tmp2 to $t0 from $fp-16
	  lw $t1, -28($fp)	# fill _tmp5 to $t1 from $fp-28
	  sub $t2, $t0, $t1	
	  sw $t2, -32($fp)	# spill _tmp6 from $t2 to $fp-32
	# _tmp7 = _tmp6 < _tmp1
	  lw $t0, -32($fp)	# fill _tmp6 to $t0 from $fp-32
	  lw $t1, -12($fp)	# fill _tmp1 to $t1 from $fp-12
	  slt $t2, $t0, $t1	
	  sw $t2, -36($fp)	# spill _tmp7 from $t2 to $fp-36
	# _tmp8 = _tmp4 || _tmp7
	  lw $t0, -24($fp)	# fill _tmp4 to $t0 from $fp-24
	  lw $t1, -36($fp)	# fill _tmp7 to $t1 from $fp-36
	  or $t2, $t0, $t1	
	  sw $t2, -40($fp)	# spill _tmp8 from $t2 to $fp-40
	# IfZ _tmp8 Goto arrayAcc_1
	  lw $t0, -40($fp)	# fill _tmp8 to $t0 from $fp-40
	  beqz $t0, arrayAcc_1	# branch if _tmp8 is zero 
	# _tmp9 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string2: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string2	# load label
	  sw $t2, -44($fp)	# spill _tmp9 from $t2 to $fp-44
	# PushParam _tmp9
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -44($fp)	# fill _tmp9 to $t0 from $fp-44
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_1:
	# _tmp10 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -48($fp)	# spill _tmp10 from $t2 to $fp-48
	# _tmp11 = _tmp1 * _tmp10
	  lw $t0, -12($fp)	# fill _tmp1 to $t0 from $fp-12
	  lw $t1, -48($fp)	# fill _tmp10 to $t1 from $fp-48
	  mul $t2, $t0, $t1	
	  sw $t2, -52($fp)	# spill _tmp11 from $t2 to $fp-52
	# _tmp12 = _tmp0 + _tmp11
	  lw $t0, -8($fp)	# fill _tmp0 to $t0 from $fp-8
	  lw $t1, -52($fp)	# fill _tmp11 to $t1 from $fp-52
	  add $t2, $t0, $t1	
	  sw $t2, -56($fp)	# spill _tmp12 from $t2 to $fp-56
	# _tmp13 = _tmp12 + _tmp10
	  lw $t0, -56($fp)	# fill _tmp12 to $t0 from $fp-56
	  lw $t1, -48($fp)	# fill _tmp10 to $t1 from $fp-48
	  add $t2, $t0, $t1	
	  sw $t2, -60($fp)	# spill _tmp13 from $t2 to $fp-60
	# *(_tmp13) = i
	  lw $t0, 8($fp)	# fill i to $t0 from $fp+8
	  lw $t2, -60($fp)	# fill _tmp13 to $t2 from $fp-60
	  sw $t0, 0($t2) 	# store with offset
	# _tmp14 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -64($fp)	# spill _tmp14 from $t2 to $fp-64
	# _tmp15 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -68($fp)	# spill _tmp15 from $t2 to $fp-68
	# _tmp16 = _tmp14 + _tmp15
	  lw $t0, -64($fp)	# fill _tmp14 to $t0 from $fp-64
	  lw $t1, -68($fp)	# fill _tmp15 to $t1 from $fp-68
	  add $t2, $t0, $t1	
	  sw $t2, -72($fp)	# spill _tmp16 from $t2 to $fp-72
	# _tmp17 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -76($fp)	# spill _tmp17 from $t2 to $fp-76
	# _tmp18 = this + _tmp17
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t1, -76($fp)	# fill _tmp17 to $t1 from $fp-76
	  add $t2, $t0, $t1	
	  sw $t2, -80($fp)	# spill _tmp18 from $t2 to $fp-80
	# *(_tmp18) = _tmp16
	  lw $t0, -72($fp)	# fill _tmp16 to $t0 from $fp-72
	  lw $t2, -80($fp)	# fill _tmp18 to $t2 from $fp-80
	  sw $t0, 0($t2) 	# store with offset
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  Stack_Pop:
	# BeginFunc 92
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 92	# decrement sp to make space for locals/temps
	# _tmp1 = *(this + 8)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 8($t0) 	# load with offset
	  sw $t2, -12($fp)	# spill _tmp1 from $t2 to $fp-12
	# _tmp2 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -16($fp)	# spill _tmp2 from $t2 to $fp-16
	# _tmp3 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -20($fp)	# spill _tmp3 from $t2 to $fp-20
	# _tmp4 = _tmp2 - _tmp3
	  lw $t0, -16($fp)	# fill _tmp2 to $t0 from $fp-16
	  lw $t1, -20($fp)	# fill _tmp3 to $t1 from $fp-20
	  sub $t2, $t0, $t1	
	  sw $t2, -24($fp)	# spill _tmp4 from $t2 to $fp-24
	# _tmp5 = *(_tmp1)
	  lw $t0, -12($fp)	# fill _tmp1 to $t0 from $fp-12
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -28($fp)	# spill _tmp5 from $t2 to $fp-28
	# _tmp6 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -32($fp)	# spill _tmp6 from $t2 to $fp-32
	# _tmp7 = _tmp4 < _tmp6
	  lw $t0, -24($fp)	# fill _tmp4 to $t0 from $fp-24
	  lw $t1, -32($fp)	# fill _tmp6 to $t1 from $fp-32
	  slt $t2, $t0, $t1	
	  sw $t2, -36($fp)	# spill _tmp7 from $t2 to $fp-36
	# _tmp8 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -40($fp)	# spill _tmp8 from $t2 to $fp-40
	# _tmp9 = _tmp5 - _tmp8
	  lw $t0, -28($fp)	# fill _tmp5 to $t0 from $fp-28
	  lw $t1, -40($fp)	# fill _tmp8 to $t1 from $fp-40
	  sub $t2, $t0, $t1	
	  sw $t2, -44($fp)	# spill _tmp9 from $t2 to $fp-44
	# _tmp10 = _tmp9 < _tmp4
	  lw $t0, -44($fp)	# fill _tmp9 to $t0 from $fp-44
	  lw $t1, -24($fp)	# fill _tmp4 to $t1 from $fp-24
	  slt $t2, $t0, $t1	
	  sw $t2, -48($fp)	# spill _tmp10 from $t2 to $fp-48
	# _tmp11 = _tmp7 || _tmp10
	  lw $t0, -36($fp)	# fill _tmp7 to $t0 from $fp-36
	  lw $t1, -48($fp)	# fill _tmp10 to $t1 from $fp-48
	  or $t2, $t0, $t1	
	  sw $t2, -52($fp)	# spill _tmp11 from $t2 to $fp-52
	# IfZ _tmp11 Goto arrayAcc_2
	  lw $t0, -52($fp)	# fill _tmp11 to $t0 from $fp-52
	  beqz $t0, arrayAcc_2	# branch if _tmp11 is zero 
	# _tmp12 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string3: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string3	# load label
	  sw $t2, -56($fp)	# spill _tmp12 from $t2 to $fp-56
	# PushParam _tmp12
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -56($fp)	# fill _tmp12 to $t0 from $fp-56
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_2:
	# _tmp13 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -60($fp)	# spill _tmp13 from $t2 to $fp-60
	# _tmp14 = _tmp4 * _tmp13
	  lw $t0, -24($fp)	# fill _tmp4 to $t0 from $fp-24
	  lw $t1, -60($fp)	# fill _tmp13 to $t1 from $fp-60
	  mul $t2, $t0, $t1	
	  sw $t2, -64($fp)	# spill _tmp14 from $t2 to $fp-64
	# _tmp15 = _tmp1 + _tmp14
	  lw $t0, -12($fp)	# fill _tmp1 to $t0 from $fp-12
	  lw $t1, -64($fp)	# fill _tmp14 to $t1 from $fp-64
	  add $t2, $t0, $t1	
	  sw $t2, -68($fp)	# spill _tmp15 from $t2 to $fp-68
	# _tmp16 = _tmp15 + _tmp13
	  lw $t0, -68($fp)	# fill _tmp15 to $t0 from $fp-68
	  lw $t1, -60($fp)	# fill _tmp13 to $t1 from $fp-60
	  add $t2, $t0, $t1	
	  sw $t2, -72($fp)	# spill _tmp16 from $t2 to $fp-72
	# _tmp17 = *(_tmp16)
	  lw $t0, -72($fp)	# fill _tmp16 to $t0 from $fp-72
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -76($fp)	# spill _tmp17 from $t2 to $fp-76
	# val = _tmp17
	  lw $t2, -76($fp)	# fill _tmp17 to $t2 from $fp-76
	  sw $t2, -8($fp)	# spill val from $t2 to $fp-8
	# _tmp18 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -80($fp)	# spill _tmp18 from $t2 to $fp-80
	# _tmp19 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -84($fp)	# spill _tmp19 from $t2 to $fp-84
	# _tmp20 = _tmp18 - _tmp19
	  lw $t0, -80($fp)	# fill _tmp18 to $t0 from $fp-80
	  lw $t1, -84($fp)	# fill _tmp19 to $t1 from $fp-84
	  sub $t2, $t0, $t1	
	  sw $t2, -88($fp)	# spill _tmp20 from $t2 to $fp-88
	# _tmp21 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -92($fp)	# spill _tmp21 from $t2 to $fp-92
	# _tmp22 = this + _tmp21
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t1, -92($fp)	# fill _tmp21 to $t1 from $fp-92
	  add $t2, $t0, $t1	
	  sw $t2, -96($fp)	# spill _tmp22 from $t2 to $fp-96
	# *(_tmp22) = _tmp20
	  lw $t0, -88($fp)	# fill _tmp20 to $t0 from $fp-88
	  lw $t2, -96($fp)	# fill _tmp22 to $t2 from $fp-96
	  sw $t0, 0($t2) 	# store with offset
	# Return val
	  lw $t2, -8($fp)	# fill val to $t2 from $fp-8
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
  Stack_NumElems:
	# BeginFunc 4
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 4	# decrement sp to make space for locals/temps
	# _tmp0 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -8($fp)	# spill _tmp0 from $t2 to $fp-8
	# Return _tmp0
	  lw $t2, -8($fp)	# fill _tmp0 to $t2 from $fp-8
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
	# VTable for class Stack
	  .data
	  .align 2
	  Stack:		# label for class Stack vtable
	  .word Stack_Init
	  .word Stack_Push
	  .word Stack_Pop
	  .word Stack_NumElems
	  .text
  main:
	# BeginFunc 136
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 136	# decrement sp to make space for locals/temps
	# _tmp1 = 12
	  li $t2, 12		# load constant value 12 into $t2
	  sw $t2, -12($fp)	# spill _tmp1 from $t2 to $fp-12
	# PushParam _tmp1
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -12($fp)	# fill _tmp1 to $t0 from $fp-12
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp2 = LCall _Alloc
	  jal _Alloc         	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -16($fp)	# spill _tmp2 from $t2 to $fp-16
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp3 = Stack
	  la $t2, Stack	# load label
	  sw $t2, -20($fp)	# spill _tmp3 from $t2 to $fp-20
	# *(_tmp2) = _tmp3
	  lw $t0, -20($fp)	# fill _tmp3 to $t0 from $fp-20
	  lw $t2, -16($fp)	# fill _tmp2 to $t2 from $fp-16
	  sw $t0, 0($t2) 	# store with offset
	# s = _tmp2
	  lw $t2, -16($fp)	# fill _tmp2 to $t2 from $fp-16
	  sw $t2, -8($fp)	# spill s from $t2 to $fp-8
	# _tmp4 = *(s)
	  lw $t0, -8($fp)	# fill s to $t0 from $fp-8
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -24($fp)	# spill _tmp4 from $t2 to $fp-24
	# _tmp5 = *(_tmp4)
	  lw $t0, -24($fp)	# fill _tmp4 to $t0 from $fp-24
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -28($fp)	# spill _tmp5 from $t2 to $fp-28
	# PushParam s
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -8($fp)	# fill s to $t0 from $fp-8
	  sw $t0, 4($sp)	# copy param value to stack
	# ACall _tmp5
	  lw $t0, -28($fp)	# fill _tmp5 to $t0 from $fp-28
	  jalr $t0            	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp6 = 3
	  li $t2, 3		# load constant value 3 into $t2
	  sw $t2, -32($fp)	# spill _tmp6 from $t2 to $fp-32
	# _tmp7 = *(s)
	  lw $t0, -8($fp)	# fill s to $t0 from $fp-8
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -36($fp)	# spill _tmp7 from $t2 to $fp-36
	# _tmp8 = *(_tmp7 + 4)
	  lw $t0, -36($fp)	# fill _tmp7 to $t0 from $fp-36
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -40($fp)	# spill _tmp8 from $t2 to $fp-40
	# PushParam _tmp6
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -32($fp)	# fill _tmp6 to $t0 from $fp-32
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam s
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -8($fp)	# fill s to $t0 from $fp-8
	  sw $t0, 4($sp)	# copy param value to stack
	# ACall _tmp8
	  lw $t0, -40($fp)	# fill _tmp8 to $t0 from $fp-40
	  jalr $t0            	# jump to function
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# _tmp9 = 7
	  li $t2, 7		# load constant value 7 into $t2
	  sw $t2, -44($fp)	# spill _tmp9 from $t2 to $fp-44
	# _tmp10 = *(s)
	  lw $t0, -8($fp)	# fill s to $t0 from $fp-8
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -48($fp)	# spill _tmp10 from $t2 to $fp-48
	# _tmp11 = *(_tmp10 + 4)
	  lw $t0, -48($fp)	# fill _tmp10 to $t0 from $fp-48
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -52($fp)	# spill _tmp11 from $t2 to $fp-52
	# PushParam _tmp9
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -44($fp)	# fill _tmp9 to $t0 from $fp-44
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam s
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -8($fp)	# fill s to $t0 from $fp-8
	  sw $t0, 4($sp)	# copy param value to stack
	# ACall _tmp11
	  lw $t0, -52($fp)	# fill _tmp11 to $t0 from $fp-52
	  jalr $t0            	# jump to function
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# _tmp12 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -56($fp)	# spill _tmp12 from $t2 to $fp-56
	# _tmp13 = *(s)
	  lw $t0, -8($fp)	# fill s to $t0 from $fp-8
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -60($fp)	# spill _tmp13 from $t2 to $fp-60
	# _tmp14 = *(_tmp13 + 4)
	  lw $t0, -60($fp)	# fill _tmp13 to $t0 from $fp-60
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -64($fp)	# spill _tmp14 from $t2 to $fp-64
	# PushParam _tmp12
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -56($fp)	# fill _tmp12 to $t0 from $fp-56
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam s
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -8($fp)	# fill s to $t0 from $fp-8
	  sw $t0, 4($sp)	# copy param value to stack
	# ACall _tmp14
	  lw $t0, -64($fp)	# fill _tmp14 to $t0 from $fp-64
	  jalr $t0            	# jump to function
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# _tmp15 = *(s)
	  lw $t0, -8($fp)	# fill s to $t0 from $fp-8
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -68($fp)	# spill _tmp15 from $t2 to $fp-68
	# _tmp16 = *(_tmp15 + 12)
	  lw $t0, -68($fp)	# fill _tmp15 to $t0 from $fp-68
	  lw $t2, 12($t0) 	# load with offset
	  sw $t2, -72($fp)	# spill _tmp16 from $t2 to $fp-72
	# PushParam s
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -8($fp)	# fill s to $t0 from $fp-8
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp17 = ACall _tmp16
	  lw $t0, -72($fp)	# fill _tmp16 to $t0 from $fp-72
	  jalr $t0            	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -76($fp)	# spill _tmp17 from $t2 to $fp-76
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# PushParam _tmp17
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -76($fp)	# fill _tmp17 to $t0 from $fp-76
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintInt
	  jal _PrintInt      	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp18 = " "
	  .data			# create string constant marked with label
	  _string4: .asciiz " "
	  .text
	  la $t2, _string4	# load label
	  sw $t2, -80($fp)	# spill _tmp18 from $t2 to $fp-80
	# PushParam _tmp18
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -80($fp)	# fill _tmp18 to $t0 from $fp-80
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp19 = *(s)
	  lw $t0, -8($fp)	# fill s to $t0 from $fp-8
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -84($fp)	# spill _tmp19 from $t2 to $fp-84
	# _tmp20 = *(_tmp19 + 8)
	  lw $t0, -84($fp)	# fill _tmp19 to $t0 from $fp-84
	  lw $t2, 8($t0) 	# load with offset
	  sw $t2, -88($fp)	# spill _tmp20 from $t2 to $fp-88
	# PushParam s
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -8($fp)	# fill s to $t0 from $fp-8
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp21 = ACall _tmp20
	  lw $t0, -88($fp)	# fill _tmp20 to $t0 from $fp-88
	  jalr $t0            	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -92($fp)	# spill _tmp21 from $t2 to $fp-92
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# PushParam _tmp21
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -92($fp)	# fill _tmp21 to $t0 from $fp-92
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintInt
	  jal _PrintInt      	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp22 = " "
	  .data			# create string constant marked with label
	  _string5: .asciiz " "
	  .text
	  la $t2, _string5	# load label
	  sw $t2, -96($fp)	# spill _tmp22 from $t2 to $fp-96
	# PushParam _tmp22
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -96($fp)	# fill _tmp22 to $t0 from $fp-96
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp23 = *(s)
	  lw $t0, -8($fp)	# fill s to $t0 from $fp-8
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -100($fp)	# spill _tmp23 from $t2 to $fp-100
	# _tmp24 = *(_tmp23 + 8)
	  lw $t0, -100($fp)	# fill _tmp23 to $t0 from $fp-100
	  lw $t2, 8($t0) 	# load with offset
	  sw $t2, -104($fp)	# spill _tmp24 from $t2 to $fp-104
	# PushParam s
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -8($fp)	# fill s to $t0 from $fp-8
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp25 = ACall _tmp24
	  lw $t0, -104($fp)	# fill _tmp24 to $t0 from $fp-104
	  jalr $t0            	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -108($fp)	# spill _tmp25 from $t2 to $fp-108
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# PushParam _tmp25
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -108($fp)	# fill _tmp25 to $t0 from $fp-108
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintInt
	  jal _PrintInt      	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp26 = " "
	  .data			# create string constant marked with label
	  _string6: .asciiz " "
	  .text
	  la $t2, _string6	# load label
	  sw $t2, -112($fp)	# spill _tmp26 from $t2 to $fp-112
	# PushParam _tmp26
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -112($fp)	# fill _tmp26 to $t0 from $fp-112
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp27 = *(s)
	  lw $t0, -8($fp)	# fill s to $t0 from $fp-8
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -116($fp)	# spill _tmp27 from $t2 to $fp-116
	# _tmp28 = *(_tmp27 + 8)
	  lw $t0, -116($fp)	# fill _tmp27 to $t0 from $fp-116
	  lw $t2, 8($t0) 	# load with offset
	  sw $t2, -120($fp)	# spill _tmp28 from $t2 to $fp-120
	# PushParam s
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -8($fp)	# fill s to $t0 from $fp-8
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp29 = ACall _tmp28
	  lw $t0, -120($fp)	# fill _tmp28 to $t0 from $fp-120
	  jalr $t0            	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -124($fp)	# spill _tmp29 from $t2 to $fp-124
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# PushParam _tmp29
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -124($fp)	# fill _tmp29 to $t0 from $fp-124
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintInt
	  jal _PrintInt      	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp30 = " "
	  .data			# create string constant marked with label
	  _string7: .asciiz " "
	  .text
	  la $t2, _string7	# load label
	  sw $t2, -128($fp)	# spill _tmp30 from $t2 to $fp-128
	# PushParam _tmp30
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -128($fp)	# fill _tmp30 to $t0 from $fp-128
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp31 = *(s)
	  lw $t0, -8($fp)	# fill s to $t0 from $fp-8
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -132($fp)	# spill _tmp31 from $t2 to $fp-132
	# _tmp32 = *(_tmp31 + 12)
	  lw $t0, -132($fp)	# fill _tmp31 to $t0 from $fp-132
	  lw $t2, 12($t0) 	# load with offset
	  sw $t2, -136($fp)	# spill _tmp32 from $t2 to $fp-136
	# PushParam s
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -8($fp)	# fill s to $t0 from $fp-8
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp33 = ACall _tmp32
	  lw $t0, -136($fp)	# fill _tmp32 to $t0 from $fp-136
	  jalr $t0            	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -140($fp)	# spill _tmp33 from $t2 to $fp-140
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# PushParam _tmp33
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -140($fp)	# fill _tmp33 to $t0 from $fp-140
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
	# allocate space to store memory
	li $a0, 128           # request 128 bytes
	li $v0, 9	      # syscall "sbrk" for memory allocation
	syscall               # do the system call
	# read in the new line
	li $a1, 128	      # size of the buffer
	#la $a0, SPACE        
	move $a0, $v0	      # location of the buffer	
	li $v0, 8 
	syscall

	#la $t1, SPACE  
	move $t1, $a0
bloop4: 
	lb $t5, ($t1) 
	beqz $t5, eloop4	
	addi $t1, 1
	b bloop4
eloop4:
	addi $t1,-1
	li $t6,0
	sb $t6, ($t1)

	#la $v0, SPACE
	move $v0, $a0	      # save buffer location to v0 as return value	
	move $sp, $fp         # pop callee frame off stack
	lw $ra, -4($fp)       # restore saved ra
	lw $fp, 0($fp)        # restore saved fp
	jr $ra
	

	.data
TRUE:.asciiz "true"
FALSE:.asciiz "false"
SPACE:.asciiz "Making Space For Inputed Values Is Fun."
