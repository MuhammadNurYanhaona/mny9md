	# standard Decaf preamble 
	  .text
	  .align 2
	  .globl main
  Random_Init:
	# BeginFunc 8
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 8	# decrement sp to make space for locals/temps
	# _tmp0 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -8($fp)	# spill _tmp0 from $t2 to $fp-8
	# _tmp1 = this + _tmp0
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t1, -8($fp)	# fill _tmp0 to $t1 from $fp-8
	  add $t2, $t0, $t1	
	  sw $t2, -12($fp)	# spill _tmp1 from $t2 to $fp-12
	# *(_tmp1) = seedVal
	  lw $t0, 8($fp)	# fill seedVal to $t0 from $fp+8
	  lw $t2, -12($fp)	# fill _tmp1 to $t2 from $fp-12
	  sw $t0, 0($t2) 	# store with offset
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  Random_GenRandom:
	# BeginFunc 48
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 48	# decrement sp to make space for locals/temps
	# _tmp0 = 15625
	  li $t2, 15625		# load constant value 15625 into $t2
	  sw $t2, -8($fp)	# spill _tmp0 from $t2 to $fp-8
	# _tmp1 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -12($fp)	# spill _tmp1 from $t2 to $fp-12
	# _tmp2 = 10000
	  li $t2, 10000		# load constant value 10000 into $t2
	  sw $t2, -16($fp)	# spill _tmp2 from $t2 to $fp-16
	# _tmp3 = _tmp1 % _tmp2
	  lw $t0, -12($fp)	# fill _tmp1 to $t0 from $fp-12
	  lw $t1, -16($fp)	# fill _tmp2 to $t1 from $fp-16
	  rem $t2, $t0, $t1	
	  sw $t2, -20($fp)	# spill _tmp3 from $t2 to $fp-20
	# _tmp4 = _tmp0 * _tmp3
	  lw $t0, -8($fp)	# fill _tmp0 to $t0 from $fp-8
	  lw $t1, -20($fp)	# fill _tmp3 to $t1 from $fp-20
	  mul $t2, $t0, $t1	
	  sw $t2, -24($fp)	# spill _tmp4 from $t2 to $fp-24
	# _tmp5 = 22221
	  li $t2, 22221		# load constant value 22221 into $t2
	  sw $t2, -28($fp)	# spill _tmp5 from $t2 to $fp-28
	# _tmp6 = _tmp4 + _tmp5
	  lw $t0, -24($fp)	# fill _tmp4 to $t0 from $fp-24
	  lw $t1, -28($fp)	# fill _tmp5 to $t1 from $fp-28
	  add $t2, $t0, $t1	
	  sw $t2, -32($fp)	# spill _tmp6 from $t2 to $fp-32
	# _tmp7 = 65536
	  li $t2, 65536		# load constant value 65536 into $t2
	  sw $t2, -36($fp)	# spill _tmp7 from $t2 to $fp-36
	# _tmp8 = _tmp6 % _tmp7
	  lw $t0, -32($fp)	# fill _tmp6 to $t0 from $fp-32
	  lw $t1, -36($fp)	# fill _tmp7 to $t1 from $fp-36
	  rem $t2, $t0, $t1	
	  sw $t2, -40($fp)	# spill _tmp8 from $t2 to $fp-40
	# _tmp9 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -44($fp)	# spill _tmp9 from $t2 to $fp-44
	# _tmp10 = this + _tmp9
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t1, -44($fp)	# fill _tmp9 to $t1 from $fp-44
	  add $t2, $t0, $t1	
	  sw $t2, -48($fp)	# spill _tmp10 from $t2 to $fp-48
	# *(_tmp10) = _tmp8
	  lw $t0, -40($fp)	# fill _tmp8 to $t0 from $fp-40
	  lw $t2, -48($fp)	# fill _tmp10 to $t2 from $fp-48
	  sw $t0, 0($t2) 	# store with offset
	# _tmp11 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -52($fp)	# spill _tmp11 from $t2 to $fp-52
	# Return _tmp11
	  lw $t2, -52($fp)	# fill _tmp11 to $t2 from $fp-52
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
  Random_RndInt:
	# BeginFunc 16
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 16	# decrement sp to make space for locals/temps
	# _tmp0 = *(this)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -8($fp)	# spill _tmp0 from $t2 to $fp-8
	# _tmp1 = *(_tmp0 + 4)
	  lw $t0, -8($fp)	# fill _tmp0 to $t0 from $fp-8
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -12($fp)	# spill _tmp1 from $t2 to $fp-12
	# PushParam this
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp2 = ACall _tmp1
	  lw $t0, -12($fp)	# fill _tmp1 to $t0 from $fp-12
	  jalr $t0            	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -16($fp)	# spill _tmp2 from $t2 to $fp-16
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp3 = _tmp2 % max
	  lw $t0, -16($fp)	# fill _tmp2 to $t0 from $fp-16
	  lw $t1, 8($fp)	# fill max to $t1 from $fp+8
	  rem $t2, $t0, $t1	
	  sw $t2, -20($fp)	# spill _tmp3 from $t2 to $fp-20
	# Return _tmp3
	  lw $t2, -20($fp)	# fill _tmp3 to $t2 from $fp-20
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
	# VTable for class Random
	  .data
	  .align 2
	  Random:		# label for class Random vtable
	  .word Random_Init
	  .word Random_GenRandom
	  .word Random_RndInt
	  .text
  Deck_Init:
	# BeginFunc 40
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 40	# decrement sp to make space for locals/temps
	# _tmp0 = 52
	  li $t2, 52		# load constant value 52 into $t2
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
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  Deck_Shuffle:
	# BeginFunc 400
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 400	# decrement sp to make space for locals/temps
	# _tmp0 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -8($fp)	# spill _tmp0 from $t2 to $fp-8
	# _tmp1 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -12($fp)	# spill _tmp1 from $t2 to $fp-12
	# _tmp2 = this + _tmp1
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t1, -12($fp)	# fill _tmp1 to $t1 from $fp-12
	  add $t2, $t0, $t1	
	  sw $t2, -16($fp)	# spill _tmp2 from $t2 to $fp-16
	# *(_tmp2) = _tmp0
	  lw $t0, -8($fp)	# fill _tmp0 to $t0 from $fp-8
	  lw $t2, -16($fp)	# fill _tmp2 to $t2 from $fp-16
	  sw $t0, 0($t2) 	# store with offset
  loopBegin_1:
	# _tmp3 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -20($fp)	# spill _tmp3 from $t2 to $fp-20
	# _tmp4 = 52
	  li $t2, 52		# load constant value 52 into $t2
	  sw $t2, -24($fp)	# spill _tmp4 from $t2 to $fp-24
	# _tmp5 = _tmp3 < _tmp4
	  lw $t0, -20($fp)	# fill _tmp3 to $t0 from $fp-20
	  lw $t1, -24($fp)	# fill _tmp4 to $t1 from $fp-24
	  slt $t2, $t0, $t1	
	  sw $t2, -28($fp)	# spill _tmp5 from $t2 to $fp-28
	# IfZ _tmp5 Goto loopEnd_2
	  lw $t0, -28($fp)	# fill _tmp5 to $t0 from $fp-28
	  beqz $t0, loopEnd_2	# branch if _tmp5 is zero 
	# _tmp6 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -32($fp)	# spill _tmp6 from $t2 to $fp-32
	# _tmp7 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -36($fp)	# spill _tmp7 from $t2 to $fp-36
	# _tmp8 = _tmp6 + _tmp7
	  lw $t0, -32($fp)	# fill _tmp6 to $t0 from $fp-32
	  lw $t1, -36($fp)	# fill _tmp7 to $t1 from $fp-36
	  add $t2, $t0, $t1	
	  sw $t2, -40($fp)	# spill _tmp8 from $t2 to $fp-40
	# _tmp9 = 13
	  li $t2, 13		# load constant value 13 into $t2
	  sw $t2, -44($fp)	# spill _tmp9 from $t2 to $fp-44
	# _tmp10 = _tmp8 % _tmp9
	  lw $t0, -40($fp)	# fill _tmp8 to $t0 from $fp-40
	  lw $t1, -44($fp)	# fill _tmp9 to $t1 from $fp-44
	  rem $t2, $t0, $t1	
	  sw $t2, -48($fp)	# spill _tmp10 from $t2 to $fp-48
	# _tmp11 = *(this + 8)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 8($t0) 	# load with offset
	  sw $t2, -52($fp)	# spill _tmp11 from $t2 to $fp-52
	# _tmp12 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -56($fp)	# spill _tmp12 from $t2 to $fp-56
	# _tmp13 = *(_tmp11)
	  lw $t0, -52($fp)	# fill _tmp11 to $t0 from $fp-52
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -60($fp)	# spill _tmp13 from $t2 to $fp-60
	# _tmp14 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -64($fp)	# spill _tmp14 from $t2 to $fp-64
	# _tmp15 = _tmp12 < _tmp14
	  lw $t0, -56($fp)	# fill _tmp12 to $t0 from $fp-56
	  lw $t1, -64($fp)	# fill _tmp14 to $t1 from $fp-64
	  slt $t2, $t0, $t1	
	  sw $t2, -68($fp)	# spill _tmp15 from $t2 to $fp-68
	# _tmp16 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -72($fp)	# spill _tmp16 from $t2 to $fp-72
	# _tmp17 = _tmp13 - _tmp16
	  lw $t0, -60($fp)	# fill _tmp13 to $t0 from $fp-60
	  lw $t1, -72($fp)	# fill _tmp16 to $t1 from $fp-72
	  sub $t2, $t0, $t1	
	  sw $t2, -76($fp)	# spill _tmp17 from $t2 to $fp-76
	# _tmp18 = _tmp17 < _tmp12
	  lw $t0, -76($fp)	# fill _tmp17 to $t0 from $fp-76
	  lw $t1, -56($fp)	# fill _tmp12 to $t1 from $fp-56
	  slt $t2, $t0, $t1	
	  sw $t2, -80($fp)	# spill _tmp18 from $t2 to $fp-80
	# _tmp19 = _tmp15 || _tmp18
	  lw $t0, -68($fp)	# fill _tmp15 to $t0 from $fp-68
	  lw $t1, -80($fp)	# fill _tmp18 to $t1 from $fp-80
	  or $t2, $t0, $t1	
	  sw $t2, -84($fp)	# spill _tmp19 from $t2 to $fp-84
	# IfZ _tmp19 Goto arrayAcc_3
	  lw $t0, -84($fp)	# fill _tmp19 to $t0 from $fp-84
	  beqz $t0, arrayAcc_3	# branch if _tmp19 is zero 
	# _tmp20 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string2: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string2	# load label
	  sw $t2, -88($fp)	# spill _tmp20 from $t2 to $fp-88
	# PushParam _tmp20
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -88($fp)	# fill _tmp20 to $t0 from $fp-88
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_3:
	# _tmp21 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -92($fp)	# spill _tmp21 from $t2 to $fp-92
	# _tmp22 = _tmp12 * _tmp21
	  lw $t0, -56($fp)	# fill _tmp12 to $t0 from $fp-56
	  lw $t1, -92($fp)	# fill _tmp21 to $t1 from $fp-92
	  mul $t2, $t0, $t1	
	  sw $t2, -96($fp)	# spill _tmp22 from $t2 to $fp-96
	# _tmp23 = _tmp11 + _tmp22
	  lw $t0, -52($fp)	# fill _tmp11 to $t0 from $fp-52
	  lw $t1, -96($fp)	# fill _tmp22 to $t1 from $fp-96
	  add $t2, $t0, $t1	
	  sw $t2, -100($fp)	# spill _tmp23 from $t2 to $fp-100
	# _tmp24 = _tmp23 + _tmp21
	  lw $t0, -100($fp)	# fill _tmp23 to $t0 from $fp-100
	  lw $t1, -92($fp)	# fill _tmp21 to $t1 from $fp-92
	  add $t2, $t0, $t1	
	  sw $t2, -104($fp)	# spill _tmp24 from $t2 to $fp-104
	# *(_tmp24) = _tmp10
	  lw $t0, -48($fp)	# fill _tmp10 to $t0 from $fp-48
	  lw $t2, -104($fp)	# fill _tmp24 to $t2 from $fp-104
	  sw $t0, 0($t2) 	# store with offset
	# _tmp25 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -108($fp)	# spill _tmp25 from $t2 to $fp-108
	# _tmp26 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -112($fp)	# spill _tmp26 from $t2 to $fp-112
	# _tmp27 = _tmp25 + _tmp26
	  lw $t0, -108($fp)	# fill _tmp25 to $t0 from $fp-108
	  lw $t1, -112($fp)	# fill _tmp26 to $t1 from $fp-112
	  add $t2, $t0, $t1	
	  sw $t2, -116($fp)	# spill _tmp27 from $t2 to $fp-116
	# _tmp28 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -120($fp)	# spill _tmp28 from $t2 to $fp-120
	# _tmp29 = this + _tmp28
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t1, -120($fp)	# fill _tmp28 to $t1 from $fp-120
	  add $t2, $t0, $t1	
	  sw $t2, -124($fp)	# spill _tmp29 from $t2 to $fp-124
	# *(_tmp29) = _tmp27
	  lw $t0, -116($fp)	# fill _tmp27 to $t0 from $fp-116
	  lw $t2, -124($fp)	# fill _tmp29 to $t2 from $fp-124
	  sw $t0, 0($t2) 	# store with offset
	# Goto loopBegin_1
	  b loopBegin_1		# unconditional branch
  loopEnd_2:
  loopBegin_4:
	# _tmp30 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -128($fp)	# spill _tmp30 from $t2 to $fp-128
	# _tmp31 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -132($fp)	# spill _tmp31 from $t2 to $fp-132
	# _tmp32 = _tmp31 < _tmp30
	  lw $t0, -132($fp)	# fill _tmp31 to $t0 from $fp-132
	  lw $t1, -128($fp)	# fill _tmp30 to $t1 from $fp-128
	  slt $t2, $t0, $t1	
	  sw $t2, -136($fp)	# spill _tmp32 from $t2 to $fp-136
	# IfZ _tmp32 Goto loopEnd_5
	  lw $t0, -136($fp)	# fill _tmp32 to $t0 from $fp-136
	  beqz $t0, loopEnd_5	# branch if _tmp32 is zero 
	# _tmp35 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -148($fp)	# spill _tmp35 from $t2 to $fp-148
	# _tmp36 = *(gRnd)
	  lw $t0, 0($gp)	# fill gRnd to $t0 from $gp+0
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -152($fp)	# spill _tmp36 from $t2 to $fp-152
	# _tmp37 = *(_tmp36 + 8)
	  lw $t0, -152($fp)	# fill _tmp36 to $t0 from $fp-152
	  lw $t2, 8($t0) 	# load with offset
	  sw $t2, -156($fp)	# spill _tmp37 from $t2 to $fp-156
	# PushParam _tmp35
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -148($fp)	# fill _tmp35 to $t0 from $fp-148
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam gRnd
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, 0($gp)	# fill gRnd to $t0 from $gp+0
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp38 = ACall _tmp37
	  lw $t0, -156($fp)	# fill _tmp37 to $t0 from $fp-156
	  jalr $t0            	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -160($fp)	# spill _tmp38 from $t2 to $fp-160
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# r = _tmp38
	  lw $t2, -160($fp)	# fill _tmp38 to $t2 from $fp-160
	  sw $t2, -140($fp)	# spill r from $t2 to $fp-140
	# _tmp39 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -164($fp)	# spill _tmp39 from $t2 to $fp-164
	# _tmp40 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -168($fp)	# spill _tmp40 from $t2 to $fp-168
	# _tmp41 = _tmp39 - _tmp40
	  lw $t0, -164($fp)	# fill _tmp39 to $t0 from $fp-164
	  lw $t1, -168($fp)	# fill _tmp40 to $t1 from $fp-168
	  sub $t2, $t0, $t1	
	  sw $t2, -172($fp)	# spill _tmp41 from $t2 to $fp-172
	# _tmp42 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -176($fp)	# spill _tmp42 from $t2 to $fp-176
	# _tmp43 = this + _tmp42
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t1, -176($fp)	# fill _tmp42 to $t1 from $fp-176
	  add $t2, $t0, $t1	
	  sw $t2, -180($fp)	# spill _tmp43 from $t2 to $fp-180
	# *(_tmp43) = _tmp41
	  lw $t0, -172($fp)	# fill _tmp41 to $t0 from $fp-172
	  lw $t2, -180($fp)	# fill _tmp43 to $t2 from $fp-180
	  sw $t0, 0($t2) 	# store with offset
	# _tmp44 = *(this + 8)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 8($t0) 	# load with offset
	  sw $t2, -184($fp)	# spill _tmp44 from $t2 to $fp-184
	# _tmp45 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -188($fp)	# spill _tmp45 from $t2 to $fp-188
	# _tmp46 = *(_tmp44)
	  lw $t0, -184($fp)	# fill _tmp44 to $t0 from $fp-184
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -192($fp)	# spill _tmp46 from $t2 to $fp-192
	# _tmp47 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -196($fp)	# spill _tmp47 from $t2 to $fp-196
	# _tmp48 = _tmp45 < _tmp47
	  lw $t0, -188($fp)	# fill _tmp45 to $t0 from $fp-188
	  lw $t1, -196($fp)	# fill _tmp47 to $t1 from $fp-196
	  slt $t2, $t0, $t1	
	  sw $t2, -200($fp)	# spill _tmp48 from $t2 to $fp-200
	# _tmp49 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -204($fp)	# spill _tmp49 from $t2 to $fp-204
	# _tmp50 = _tmp46 - _tmp49
	  lw $t0, -192($fp)	# fill _tmp46 to $t0 from $fp-192
	  lw $t1, -204($fp)	# fill _tmp49 to $t1 from $fp-204
	  sub $t2, $t0, $t1	
	  sw $t2, -208($fp)	# spill _tmp50 from $t2 to $fp-208
	# _tmp51 = _tmp50 < _tmp45
	  lw $t0, -208($fp)	# fill _tmp50 to $t0 from $fp-208
	  lw $t1, -188($fp)	# fill _tmp45 to $t1 from $fp-188
	  slt $t2, $t0, $t1	
	  sw $t2, -212($fp)	# spill _tmp51 from $t2 to $fp-212
	# _tmp52 = _tmp48 || _tmp51
	  lw $t0, -200($fp)	# fill _tmp48 to $t0 from $fp-200
	  lw $t1, -212($fp)	# fill _tmp51 to $t1 from $fp-212
	  or $t2, $t0, $t1	
	  sw $t2, -216($fp)	# spill _tmp52 from $t2 to $fp-216
	# IfZ _tmp52 Goto arrayAcc_6
	  lw $t0, -216($fp)	# fill _tmp52 to $t0 from $fp-216
	  beqz $t0, arrayAcc_6	# branch if _tmp52 is zero 
	# _tmp53 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string3: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string3	# load label
	  sw $t2, -220($fp)	# spill _tmp53 from $t2 to $fp-220
	# PushParam _tmp53
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -220($fp)	# fill _tmp53 to $t0 from $fp-220
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_6:
	# _tmp54 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -224($fp)	# spill _tmp54 from $t2 to $fp-224
	# _tmp55 = _tmp45 * _tmp54
	  lw $t0, -188($fp)	# fill _tmp45 to $t0 from $fp-188
	  lw $t1, -224($fp)	# fill _tmp54 to $t1 from $fp-224
	  mul $t2, $t0, $t1	
	  sw $t2, -228($fp)	# spill _tmp55 from $t2 to $fp-228
	# _tmp56 = _tmp44 + _tmp55
	  lw $t0, -184($fp)	# fill _tmp44 to $t0 from $fp-184
	  lw $t1, -228($fp)	# fill _tmp55 to $t1 from $fp-228
	  add $t2, $t0, $t1	
	  sw $t2, -232($fp)	# spill _tmp56 from $t2 to $fp-232
	# _tmp57 = _tmp56 + _tmp54
	  lw $t0, -232($fp)	# fill _tmp56 to $t0 from $fp-232
	  lw $t1, -224($fp)	# fill _tmp54 to $t1 from $fp-224
	  add $t2, $t0, $t1	
	  sw $t2, -236($fp)	# spill _tmp57 from $t2 to $fp-236
	# _tmp58 = *(_tmp57)
	  lw $t0, -236($fp)	# fill _tmp57 to $t0 from $fp-236
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -240($fp)	# spill _tmp58 from $t2 to $fp-240
	# temp = _tmp58
	  lw $t2, -240($fp)	# fill _tmp58 to $t2 from $fp-240
	  sw $t2, -144($fp)	# spill temp from $t2 to $fp-144
	# _tmp59 = *(this + 8)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 8($t0) 	# load with offset
	  sw $t2, -244($fp)	# spill _tmp59 from $t2 to $fp-244
	# _tmp60 = *(_tmp59)
	  lw $t0, -244($fp)	# fill _tmp59 to $t0 from $fp-244
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -248($fp)	# spill _tmp60 from $t2 to $fp-248
	# _tmp61 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -252($fp)	# spill _tmp61 from $t2 to $fp-252
	# _tmp62 = r < _tmp61
	  lw $t0, -140($fp)	# fill r to $t0 from $fp-140
	  lw $t1, -252($fp)	# fill _tmp61 to $t1 from $fp-252
	  slt $t2, $t0, $t1	
	  sw $t2, -256($fp)	# spill _tmp62 from $t2 to $fp-256
	# _tmp63 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -260($fp)	# spill _tmp63 from $t2 to $fp-260
	# _tmp64 = _tmp60 - _tmp63
	  lw $t0, -248($fp)	# fill _tmp60 to $t0 from $fp-248
	  lw $t1, -260($fp)	# fill _tmp63 to $t1 from $fp-260
	  sub $t2, $t0, $t1	
	  sw $t2, -264($fp)	# spill _tmp64 from $t2 to $fp-264
	# _tmp65 = _tmp64 < r
	  lw $t0, -264($fp)	# fill _tmp64 to $t0 from $fp-264
	  lw $t1, -140($fp)	# fill r to $t1 from $fp-140
	  slt $t2, $t0, $t1	
	  sw $t2, -268($fp)	# spill _tmp65 from $t2 to $fp-268
	# _tmp66 = _tmp62 || _tmp65
	  lw $t0, -256($fp)	# fill _tmp62 to $t0 from $fp-256
	  lw $t1, -268($fp)	# fill _tmp65 to $t1 from $fp-268
	  or $t2, $t0, $t1	
	  sw $t2, -272($fp)	# spill _tmp66 from $t2 to $fp-272
	# IfZ _tmp66 Goto arrayAcc_7
	  lw $t0, -272($fp)	# fill _tmp66 to $t0 from $fp-272
	  beqz $t0, arrayAcc_7	# branch if _tmp66 is zero 
	# _tmp67 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string4: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string4	# load label
	  sw $t2, -276($fp)	# spill _tmp67 from $t2 to $fp-276
	# PushParam _tmp67
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -276($fp)	# fill _tmp67 to $t0 from $fp-276
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_7:
	# _tmp68 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -280($fp)	# spill _tmp68 from $t2 to $fp-280
	# _tmp69 = r * _tmp68
	  lw $t0, -140($fp)	# fill r to $t0 from $fp-140
	  lw $t1, -280($fp)	# fill _tmp68 to $t1 from $fp-280
	  mul $t2, $t0, $t1	
	  sw $t2, -284($fp)	# spill _tmp69 from $t2 to $fp-284
	# _tmp70 = _tmp59 + _tmp69
	  lw $t0, -244($fp)	# fill _tmp59 to $t0 from $fp-244
	  lw $t1, -284($fp)	# fill _tmp69 to $t1 from $fp-284
	  add $t2, $t0, $t1	
	  sw $t2, -288($fp)	# spill _tmp70 from $t2 to $fp-288
	# _tmp71 = _tmp70 + _tmp68
	  lw $t0, -288($fp)	# fill _tmp70 to $t0 from $fp-288
	  lw $t1, -280($fp)	# fill _tmp68 to $t1 from $fp-280
	  add $t2, $t0, $t1	
	  sw $t2, -292($fp)	# spill _tmp71 from $t2 to $fp-292
	# _tmp72 = *(_tmp71)
	  lw $t0, -292($fp)	# fill _tmp71 to $t0 from $fp-292
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -296($fp)	# spill _tmp72 from $t2 to $fp-296
	# _tmp73 = *(this + 8)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 8($t0) 	# load with offset
	  sw $t2, -300($fp)	# spill _tmp73 from $t2 to $fp-300
	# _tmp74 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -304($fp)	# spill _tmp74 from $t2 to $fp-304
	# _tmp75 = *(_tmp73)
	  lw $t0, -300($fp)	# fill _tmp73 to $t0 from $fp-300
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -308($fp)	# spill _tmp75 from $t2 to $fp-308
	# _tmp76 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -312($fp)	# spill _tmp76 from $t2 to $fp-312
	# _tmp77 = _tmp74 < _tmp76
	  lw $t0, -304($fp)	# fill _tmp74 to $t0 from $fp-304
	  lw $t1, -312($fp)	# fill _tmp76 to $t1 from $fp-312
	  slt $t2, $t0, $t1	
	  sw $t2, -316($fp)	# spill _tmp77 from $t2 to $fp-316
	# _tmp78 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -320($fp)	# spill _tmp78 from $t2 to $fp-320
	# _tmp79 = _tmp75 - _tmp78
	  lw $t0, -308($fp)	# fill _tmp75 to $t0 from $fp-308
	  lw $t1, -320($fp)	# fill _tmp78 to $t1 from $fp-320
	  sub $t2, $t0, $t1	
	  sw $t2, -324($fp)	# spill _tmp79 from $t2 to $fp-324
	# _tmp80 = _tmp79 < _tmp74
	  lw $t0, -324($fp)	# fill _tmp79 to $t0 from $fp-324
	  lw $t1, -304($fp)	# fill _tmp74 to $t1 from $fp-304
	  slt $t2, $t0, $t1	
	  sw $t2, -328($fp)	# spill _tmp80 from $t2 to $fp-328
	# _tmp81 = _tmp77 || _tmp80
	  lw $t0, -316($fp)	# fill _tmp77 to $t0 from $fp-316
	  lw $t1, -328($fp)	# fill _tmp80 to $t1 from $fp-328
	  or $t2, $t0, $t1	
	  sw $t2, -332($fp)	# spill _tmp81 from $t2 to $fp-332
	# IfZ _tmp81 Goto arrayAcc_8
	  lw $t0, -332($fp)	# fill _tmp81 to $t0 from $fp-332
	  beqz $t0, arrayAcc_8	# branch if _tmp81 is zero 
	# _tmp82 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string5: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string5	# load label
	  sw $t2, -336($fp)	# spill _tmp82 from $t2 to $fp-336
	# PushParam _tmp82
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -336($fp)	# fill _tmp82 to $t0 from $fp-336
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_8:
	# _tmp83 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -340($fp)	# spill _tmp83 from $t2 to $fp-340
	# _tmp84 = _tmp74 * _tmp83
	  lw $t0, -304($fp)	# fill _tmp74 to $t0 from $fp-304
	  lw $t1, -340($fp)	# fill _tmp83 to $t1 from $fp-340
	  mul $t2, $t0, $t1	
	  sw $t2, -344($fp)	# spill _tmp84 from $t2 to $fp-344
	# _tmp85 = _tmp73 + _tmp84
	  lw $t0, -300($fp)	# fill _tmp73 to $t0 from $fp-300
	  lw $t1, -344($fp)	# fill _tmp84 to $t1 from $fp-344
	  add $t2, $t0, $t1	
	  sw $t2, -348($fp)	# spill _tmp85 from $t2 to $fp-348
	# _tmp86 = _tmp85 + _tmp83
	  lw $t0, -348($fp)	# fill _tmp85 to $t0 from $fp-348
	  lw $t1, -340($fp)	# fill _tmp83 to $t1 from $fp-340
	  add $t2, $t0, $t1	
	  sw $t2, -352($fp)	# spill _tmp86 from $t2 to $fp-352
	# *(_tmp86) = _tmp72
	  lw $t0, -296($fp)	# fill _tmp72 to $t0 from $fp-296
	  lw $t2, -352($fp)	# fill _tmp86 to $t2 from $fp-352
	  sw $t0, 0($t2) 	# store with offset
	# _tmp87 = *(this + 8)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 8($t0) 	# load with offset
	  sw $t2, -356($fp)	# spill _tmp87 from $t2 to $fp-356
	# _tmp88 = *(_tmp87)
	  lw $t0, -356($fp)	# fill _tmp87 to $t0 from $fp-356
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -360($fp)	# spill _tmp88 from $t2 to $fp-360
	# _tmp89 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -364($fp)	# spill _tmp89 from $t2 to $fp-364
	# _tmp90 = r < _tmp89
	  lw $t0, -140($fp)	# fill r to $t0 from $fp-140
	  lw $t1, -364($fp)	# fill _tmp89 to $t1 from $fp-364
	  slt $t2, $t0, $t1	
	  sw $t2, -368($fp)	# spill _tmp90 from $t2 to $fp-368
	# _tmp91 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -372($fp)	# spill _tmp91 from $t2 to $fp-372
	# _tmp92 = _tmp88 - _tmp91
	  lw $t0, -360($fp)	# fill _tmp88 to $t0 from $fp-360
	  lw $t1, -372($fp)	# fill _tmp91 to $t1 from $fp-372
	  sub $t2, $t0, $t1	
	  sw $t2, -376($fp)	# spill _tmp92 from $t2 to $fp-376
	# _tmp93 = _tmp92 < r
	  lw $t0, -376($fp)	# fill _tmp92 to $t0 from $fp-376
	  lw $t1, -140($fp)	# fill r to $t1 from $fp-140
	  slt $t2, $t0, $t1	
	  sw $t2, -380($fp)	# spill _tmp93 from $t2 to $fp-380
	# _tmp94 = _tmp90 || _tmp93
	  lw $t0, -368($fp)	# fill _tmp90 to $t0 from $fp-368
	  lw $t1, -380($fp)	# fill _tmp93 to $t1 from $fp-380
	  or $t2, $t0, $t1	
	  sw $t2, -384($fp)	# spill _tmp94 from $t2 to $fp-384
	# IfZ _tmp94 Goto arrayAcc_9
	  lw $t0, -384($fp)	# fill _tmp94 to $t0 from $fp-384
	  beqz $t0, arrayAcc_9	# branch if _tmp94 is zero 
	# _tmp95 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string6: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string6	# load label
	  sw $t2, -388($fp)	# spill _tmp95 from $t2 to $fp-388
	# PushParam _tmp95
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -388($fp)	# fill _tmp95 to $t0 from $fp-388
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_9:
	# _tmp96 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -392($fp)	# spill _tmp96 from $t2 to $fp-392
	# _tmp97 = r * _tmp96
	  lw $t0, -140($fp)	# fill r to $t0 from $fp-140
	  lw $t1, -392($fp)	# fill _tmp96 to $t1 from $fp-392
	  mul $t2, $t0, $t1	
	  sw $t2, -396($fp)	# spill _tmp97 from $t2 to $fp-396
	# _tmp98 = _tmp87 + _tmp97
	  lw $t0, -356($fp)	# fill _tmp87 to $t0 from $fp-356
	  lw $t1, -396($fp)	# fill _tmp97 to $t1 from $fp-396
	  add $t2, $t0, $t1	
	  sw $t2, -400($fp)	# spill _tmp98 from $t2 to $fp-400
	# _tmp99 = _tmp98 + _tmp96
	  lw $t0, -400($fp)	# fill _tmp98 to $t0 from $fp-400
	  lw $t1, -392($fp)	# fill _tmp96 to $t1 from $fp-392
	  add $t2, $t0, $t1	
	  sw $t2, -404($fp)	# spill _tmp99 from $t2 to $fp-404
	# *(_tmp99) = temp
	  lw $t0, -144($fp)	# fill temp to $t0 from $fp-144
	  lw $t2, -404($fp)	# fill _tmp99 to $t2 from $fp-404
	  sw $t0, 0($t2) 	# store with offset
	# Goto loopBegin_4
	  b loopBegin_4		# unconditional branch
  loopEnd_5:
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  Deck_GetCard:
	# BeginFunc 108
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 108	# decrement sp to make space for locals/temps
	# _tmp1 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -12($fp)	# spill _tmp1 from $t2 to $fp-12
	# _tmp2 = 52
	  li $t2, 52		# load constant value 52 into $t2
	  sw $t2, -16($fp)	# spill _tmp2 from $t2 to $fp-16
	# _tmp3 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -20($fp)	# spill _tmp3 from $t2 to $fp-20
	# _tmp4 = _tmp2 - _tmp3
	  lw $t0, -16($fp)	# fill _tmp2 to $t0 from $fp-16
	  lw $t1, -20($fp)	# fill _tmp3 to $t1 from $fp-20
	  sub $t2, $t0, $t1	
	  sw $t2, -24($fp)	# spill _tmp4 from $t2 to $fp-24
	# _tmp5 = _tmp4 < _tmp1
	  lw $t0, -24($fp)	# fill _tmp4 to $t0 from $fp-24
	  lw $t1, -12($fp)	# fill _tmp1 to $t1 from $fp-12
	  slt $t2, $t0, $t1	
	  sw $t2, -28($fp)	# spill _tmp5 from $t2 to $fp-28
	# IfZ _tmp5 Goto else_10
	  lw $t0, -28($fp)	# fill _tmp5 to $t0 from $fp-28
	  beqz $t0, else_10	# branch if _tmp5 is zero 
	# _tmp6 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -32($fp)	# spill _tmp6 from $t2 to $fp-32
	# Return _tmp6
	  lw $t2, -32($fp)	# fill _tmp6 to $t2 from $fp-32
	  move $v0, $t2		# assign return value into $v0
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# Goto endif_11
	  b endif_11		# unconditional branch
  else_10:
  endif_11:
	# _tmp7 = *(this + 8)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 8($t0) 	# load with offset
	  sw $t2, -36($fp)	# spill _tmp7 from $t2 to $fp-36
	# _tmp8 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -40($fp)	# spill _tmp8 from $t2 to $fp-40
	# _tmp9 = *(_tmp7)
	  lw $t0, -36($fp)	# fill _tmp7 to $t0 from $fp-36
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -44($fp)	# spill _tmp9 from $t2 to $fp-44
	# _tmp10 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -48($fp)	# spill _tmp10 from $t2 to $fp-48
	# _tmp11 = _tmp8 < _tmp10
	  lw $t0, -40($fp)	# fill _tmp8 to $t0 from $fp-40
	  lw $t1, -48($fp)	# fill _tmp10 to $t1 from $fp-48
	  slt $t2, $t0, $t1	
	  sw $t2, -52($fp)	# spill _tmp11 from $t2 to $fp-52
	# _tmp12 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -56($fp)	# spill _tmp12 from $t2 to $fp-56
	# _tmp13 = _tmp9 - _tmp12
	  lw $t0, -44($fp)	# fill _tmp9 to $t0 from $fp-44
	  lw $t1, -56($fp)	# fill _tmp12 to $t1 from $fp-56
	  sub $t2, $t0, $t1	
	  sw $t2, -60($fp)	# spill _tmp13 from $t2 to $fp-60
	# _tmp14 = _tmp13 < _tmp8
	  lw $t0, -60($fp)	# fill _tmp13 to $t0 from $fp-60
	  lw $t1, -40($fp)	# fill _tmp8 to $t1 from $fp-40
	  slt $t2, $t0, $t1	
	  sw $t2, -64($fp)	# spill _tmp14 from $t2 to $fp-64
	# _tmp15 = _tmp11 || _tmp14
	  lw $t0, -52($fp)	# fill _tmp11 to $t0 from $fp-52
	  lw $t1, -64($fp)	# fill _tmp14 to $t1 from $fp-64
	  or $t2, $t0, $t1	
	  sw $t2, -68($fp)	# spill _tmp15 from $t2 to $fp-68
	# IfZ _tmp15 Goto arrayAcc_12
	  lw $t0, -68($fp)	# fill _tmp15 to $t0 from $fp-68
	  beqz $t0, arrayAcc_12	# branch if _tmp15 is zero 
	# _tmp16 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string7: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string7	# load label
	  sw $t2, -72($fp)	# spill _tmp16 from $t2 to $fp-72
	# PushParam _tmp16
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -72($fp)	# fill _tmp16 to $t0 from $fp-72
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_12:
	# _tmp17 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -76($fp)	# spill _tmp17 from $t2 to $fp-76
	# _tmp18 = _tmp8 * _tmp17
	  lw $t0, -40($fp)	# fill _tmp8 to $t0 from $fp-40
	  lw $t1, -76($fp)	# fill _tmp17 to $t1 from $fp-76
	  mul $t2, $t0, $t1	
	  sw $t2, -80($fp)	# spill _tmp18 from $t2 to $fp-80
	# _tmp19 = _tmp7 + _tmp18
	  lw $t0, -36($fp)	# fill _tmp7 to $t0 from $fp-36
	  lw $t1, -80($fp)	# fill _tmp18 to $t1 from $fp-80
	  add $t2, $t0, $t1	
	  sw $t2, -84($fp)	# spill _tmp19 from $t2 to $fp-84
	# _tmp20 = _tmp19 + _tmp17
	  lw $t0, -84($fp)	# fill _tmp19 to $t0 from $fp-84
	  lw $t1, -76($fp)	# fill _tmp17 to $t1 from $fp-76
	  add $t2, $t0, $t1	
	  sw $t2, -88($fp)	# spill _tmp20 from $t2 to $fp-88
	# _tmp21 = *(_tmp20)
	  lw $t0, -88($fp)	# fill _tmp20 to $t0 from $fp-88
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -92($fp)	# spill _tmp21 from $t2 to $fp-92
	# result = _tmp21
	  lw $t2, -92($fp)	# fill _tmp21 to $t2 from $fp-92
	  sw $t2, -8($fp)	# spill result from $t2 to $fp-8
	# _tmp22 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -96($fp)	# spill _tmp22 from $t2 to $fp-96
	# _tmp23 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -100($fp)	# spill _tmp23 from $t2 to $fp-100
	# _tmp24 = _tmp22 + _tmp23
	  lw $t0, -96($fp)	# fill _tmp22 to $t0 from $fp-96
	  lw $t1, -100($fp)	# fill _tmp23 to $t1 from $fp-100
	  add $t2, $t0, $t1	
	  sw $t2, -104($fp)	# spill _tmp24 from $t2 to $fp-104
	# _tmp25 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -108($fp)	# spill _tmp25 from $t2 to $fp-108
	# _tmp26 = this + _tmp25
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t1, -108($fp)	# fill _tmp25 to $t1 from $fp-108
	  add $t2, $t0, $t1	
	  sw $t2, -112($fp)	# spill _tmp26 from $t2 to $fp-112
	# *(_tmp26) = _tmp24
	  lw $t0, -104($fp)	# fill _tmp24 to $t0 from $fp-104
	  lw $t2, -112($fp)	# fill _tmp26 to $t2 from $fp-112
	  sw $t0, 0($t2) 	# store with offset
	# Return result
	  lw $t2, -8($fp)	# fill result to $t2 from $fp-8
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
	# VTable for class Deck
	  .data
	  .align 2
	  Deck:		# label for class Deck vtable
	  .word Deck_Init
	  .word Deck_Shuffle
	  .word Deck_GetCard
	  .text
  BJDeck_Init:
	# BeginFunc 192
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 192	# decrement sp to make space for locals/temps
	# _tmp1 = 8
	  li $t2, 8		# load constant value 8 into $t2
	  sw $t2, -12($fp)	# spill _tmp1 from $t2 to $fp-12
	# _tmp2 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -16($fp)	# spill _tmp2 from $t2 to $fp-16
	# _tmp3 = _tmp1 < _tmp2
	  lw $t0, -12($fp)	# fill _tmp1 to $t0 from $fp-12
	  lw $t1, -16($fp)	# fill _tmp2 to $t1 from $fp-16
	  slt $t2, $t0, $t1	
	  sw $t2, -20($fp)	# spill _tmp3 from $t2 to $fp-20
	# IfZ _tmp3 Goto allocate_13
	  lw $t0, -20($fp)	# fill _tmp3 to $t0 from $fp-20
	  beqz $t0, allocate_13	# branch if _tmp3 is zero 
	# _tmp4 = "Decaf runtime error: Array size is <= 0\n"
	  .data			# create string constant marked with label
	  _string8: .asciiz "Decaf runtime error: Array size is <= 0\n"
	  .text
	  la $t2, _string8	# load label
	  sw $t2, -24($fp)	# spill _tmp4 from $t2 to $fp-24
	# PushParam _tmp4
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -24($fp)	# fill _tmp4 to $t0 from $fp-24
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  allocate_13:
	# _tmp5 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -28($fp)	# spill _tmp5 from $t2 to $fp-28
	# _tmp6 = _tmp1 * _tmp5
	  lw $t0, -12($fp)	# fill _tmp1 to $t0 from $fp-12
	  lw $t1, -28($fp)	# fill _tmp5 to $t1 from $fp-28
	  mul $t2, $t0, $t1	
	  sw $t2, -32($fp)	# spill _tmp6 from $t2 to $fp-32
	# _tmp7 = _tmp6 + _tmp5
	  lw $t0, -32($fp)	# fill _tmp6 to $t0 from $fp-32
	  lw $t1, -28($fp)	# fill _tmp5 to $t1 from $fp-28
	  add $t2, $t0, $t1	
	  sw $t2, -36($fp)	# spill _tmp7 from $t2 to $fp-36
	# PushParam _tmp7
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -36($fp)	# fill _tmp7 to $t0 from $fp-36
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp8 = LCall _Alloc
	  jal _Alloc         	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -40($fp)	# spill _tmp8 from $t2 to $fp-40
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# *(_tmp8) = _tmp1
	  lw $t0, -12($fp)	# fill _tmp1 to $t0 from $fp-12
	  lw $t2, -40($fp)	# fill _tmp8 to $t2 from $fp-40
	  sw $t0, 0($t2) 	# store with offset
	# _tmp9 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -44($fp)	# spill _tmp9 from $t2 to $fp-44
	# _tmp10 = this + _tmp9
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t1, -44($fp)	# fill _tmp9 to $t1 from $fp-44
	  add $t2, $t0, $t1	
	  sw $t2, -48($fp)	# spill _tmp10 from $t2 to $fp-48
	# *(_tmp10) = _tmp8
	  lw $t0, -40($fp)	# fill _tmp8 to $t0 from $fp-40
	  lw $t2, -48($fp)	# fill _tmp10 to $t2 from $fp-48
	  sw $t0, 0($t2) 	# store with offset
	# _tmp11 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -52($fp)	# spill _tmp11 from $t2 to $fp-52
	# i = _tmp11
	  lw $t2, -52($fp)	# fill _tmp11 to $t2 from $fp-52
	  sw $t2, -8($fp)	# spill i from $t2 to $fp-8
  loopBegin_14:
	# _tmp12 = 8
	  li $t2, 8		# load constant value 8 into $t2
	  sw $t2, -56($fp)	# spill _tmp12 from $t2 to $fp-56
	# _tmp13 = i < _tmp12
	  lw $t0, -8($fp)	# fill i to $t0 from $fp-8
	  lw $t1, -56($fp)	# fill _tmp12 to $t1 from $fp-56
	  slt $t2, $t0, $t1	
	  sw $t2, -60($fp)	# spill _tmp13 from $t2 to $fp-60
	# IfZ _tmp13 Goto loopEnd_15
	  lw $t0, -60($fp)	# fill _tmp13 to $t0 from $fp-60
	  beqz $t0, loopEnd_15	# branch if _tmp13 is zero 
	# _tmp14 = 12
	  li $t2, 12		# load constant value 12 into $t2
	  sw $t2, -64($fp)	# spill _tmp14 from $t2 to $fp-64
	# PushParam _tmp14
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -64($fp)	# fill _tmp14 to $t0 from $fp-64
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp15 = LCall _Alloc
	  jal _Alloc         	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -68($fp)	# spill _tmp15 from $t2 to $fp-68
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp16 = Deck
	  la $t2, Deck	# load label
	  sw $t2, -72($fp)	# spill _tmp16 from $t2 to $fp-72
	# *(_tmp15) = _tmp16
	  lw $t0, -72($fp)	# fill _tmp16 to $t0 from $fp-72
	  lw $t2, -68($fp)	# fill _tmp15 to $t2 from $fp-68
	  sw $t0, 0($t2) 	# store with offset
	# _tmp17 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -76($fp)	# spill _tmp17 from $t2 to $fp-76
	# _tmp18 = *(_tmp17)
	  lw $t0, -76($fp)	# fill _tmp17 to $t0 from $fp-76
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -80($fp)	# spill _tmp18 from $t2 to $fp-80
	# _tmp19 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -84($fp)	# spill _tmp19 from $t2 to $fp-84
	# _tmp20 = i < _tmp19
	  lw $t0, -8($fp)	# fill i to $t0 from $fp-8
	  lw $t1, -84($fp)	# fill _tmp19 to $t1 from $fp-84
	  slt $t2, $t0, $t1	
	  sw $t2, -88($fp)	# spill _tmp20 from $t2 to $fp-88
	# _tmp21 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -92($fp)	# spill _tmp21 from $t2 to $fp-92
	# _tmp22 = _tmp18 - _tmp21
	  lw $t0, -80($fp)	# fill _tmp18 to $t0 from $fp-80
	  lw $t1, -92($fp)	# fill _tmp21 to $t1 from $fp-92
	  sub $t2, $t0, $t1	
	  sw $t2, -96($fp)	# spill _tmp22 from $t2 to $fp-96
	# _tmp23 = _tmp22 < i
	  lw $t0, -96($fp)	# fill _tmp22 to $t0 from $fp-96
	  lw $t1, -8($fp)	# fill i to $t1 from $fp-8
	  slt $t2, $t0, $t1	
	  sw $t2, -100($fp)	# spill _tmp23 from $t2 to $fp-100
	# _tmp24 = _tmp20 || _tmp23
	  lw $t0, -88($fp)	# fill _tmp20 to $t0 from $fp-88
	  lw $t1, -100($fp)	# fill _tmp23 to $t1 from $fp-100
	  or $t2, $t0, $t1	
	  sw $t2, -104($fp)	# spill _tmp24 from $t2 to $fp-104
	# IfZ _tmp24 Goto arrayAcc_16
	  lw $t0, -104($fp)	# fill _tmp24 to $t0 from $fp-104
	  beqz $t0, arrayAcc_16	# branch if _tmp24 is zero 
	# _tmp25 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string9: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string9	# load label
	  sw $t2, -108($fp)	# spill _tmp25 from $t2 to $fp-108
	# PushParam _tmp25
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -108($fp)	# fill _tmp25 to $t0 from $fp-108
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_16:
	# _tmp26 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -112($fp)	# spill _tmp26 from $t2 to $fp-112
	# _tmp27 = i * _tmp26
	  lw $t0, -8($fp)	# fill i to $t0 from $fp-8
	  lw $t1, -112($fp)	# fill _tmp26 to $t1 from $fp-112
	  mul $t2, $t0, $t1	
	  sw $t2, -116($fp)	# spill _tmp27 from $t2 to $fp-116
	# _tmp28 = _tmp17 + _tmp27
	  lw $t0, -76($fp)	# fill _tmp17 to $t0 from $fp-76
	  lw $t1, -116($fp)	# fill _tmp27 to $t1 from $fp-116
	  add $t2, $t0, $t1	
	  sw $t2, -120($fp)	# spill _tmp28 from $t2 to $fp-120
	# _tmp29 = _tmp28 + _tmp26
	  lw $t0, -120($fp)	# fill _tmp28 to $t0 from $fp-120
	  lw $t1, -112($fp)	# fill _tmp26 to $t1 from $fp-112
	  add $t2, $t0, $t1	
	  sw $t2, -124($fp)	# spill _tmp29 from $t2 to $fp-124
	# *(_tmp29) = _tmp15
	  lw $t0, -68($fp)	# fill _tmp15 to $t0 from $fp-68
	  lw $t2, -124($fp)	# fill _tmp29 to $t2 from $fp-124
	  sw $t0, 0($t2) 	# store with offset
	# _tmp30 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -128($fp)	# spill _tmp30 from $t2 to $fp-128
	# _tmp31 = *(_tmp30)
	  lw $t0, -128($fp)	# fill _tmp30 to $t0 from $fp-128
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -132($fp)	# spill _tmp31 from $t2 to $fp-132
	# _tmp32 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -136($fp)	# spill _tmp32 from $t2 to $fp-136
	# _tmp33 = i < _tmp32
	  lw $t0, -8($fp)	# fill i to $t0 from $fp-8
	  lw $t1, -136($fp)	# fill _tmp32 to $t1 from $fp-136
	  slt $t2, $t0, $t1	
	  sw $t2, -140($fp)	# spill _tmp33 from $t2 to $fp-140
	# _tmp34 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -144($fp)	# spill _tmp34 from $t2 to $fp-144
	# _tmp35 = _tmp31 - _tmp34
	  lw $t0, -132($fp)	# fill _tmp31 to $t0 from $fp-132
	  lw $t1, -144($fp)	# fill _tmp34 to $t1 from $fp-144
	  sub $t2, $t0, $t1	
	  sw $t2, -148($fp)	# spill _tmp35 from $t2 to $fp-148
	# _tmp36 = _tmp35 < i
	  lw $t0, -148($fp)	# fill _tmp35 to $t0 from $fp-148
	  lw $t1, -8($fp)	# fill i to $t1 from $fp-8
	  slt $t2, $t0, $t1	
	  sw $t2, -152($fp)	# spill _tmp36 from $t2 to $fp-152
	# _tmp37 = _tmp33 || _tmp36
	  lw $t0, -140($fp)	# fill _tmp33 to $t0 from $fp-140
	  lw $t1, -152($fp)	# fill _tmp36 to $t1 from $fp-152
	  or $t2, $t0, $t1	
	  sw $t2, -156($fp)	# spill _tmp37 from $t2 to $fp-156
	# IfZ _tmp37 Goto arrayAcc_17
	  lw $t0, -156($fp)	# fill _tmp37 to $t0 from $fp-156
	  beqz $t0, arrayAcc_17	# branch if _tmp37 is zero 
	# _tmp38 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string10: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string10	# load label
	  sw $t2, -160($fp)	# spill _tmp38 from $t2 to $fp-160
	# PushParam _tmp38
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -160($fp)	# fill _tmp38 to $t0 from $fp-160
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_17:
	# _tmp39 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -164($fp)	# spill _tmp39 from $t2 to $fp-164
	# _tmp40 = i * _tmp39
	  lw $t0, -8($fp)	# fill i to $t0 from $fp-8
	  lw $t1, -164($fp)	# fill _tmp39 to $t1 from $fp-164
	  mul $t2, $t0, $t1	
	  sw $t2, -168($fp)	# spill _tmp40 from $t2 to $fp-168
	# _tmp41 = _tmp30 + _tmp40
	  lw $t0, -128($fp)	# fill _tmp30 to $t0 from $fp-128
	  lw $t1, -168($fp)	# fill _tmp40 to $t1 from $fp-168
	  add $t2, $t0, $t1	
	  sw $t2, -172($fp)	# spill _tmp41 from $t2 to $fp-172
	# _tmp42 = _tmp41 + _tmp39
	  lw $t0, -172($fp)	# fill _tmp41 to $t0 from $fp-172
	  lw $t1, -164($fp)	# fill _tmp39 to $t1 from $fp-164
	  add $t2, $t0, $t1	
	  sw $t2, -176($fp)	# spill _tmp42 from $t2 to $fp-176
	# _tmp43 = *(_tmp42)
	  lw $t0, -176($fp)	# fill _tmp42 to $t0 from $fp-176
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -180($fp)	# spill _tmp43 from $t2 to $fp-180
	# _tmp44 = *(_tmp43)
	  lw $t0, -180($fp)	# fill _tmp43 to $t0 from $fp-180
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -184($fp)	# spill _tmp44 from $t2 to $fp-184
	# _tmp45 = *(_tmp44)
	  lw $t0, -184($fp)	# fill _tmp44 to $t0 from $fp-184
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -188($fp)	# spill _tmp45 from $t2 to $fp-188
	# PushParam _tmp43
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -180($fp)	# fill _tmp43 to $t0 from $fp-180
	  sw $t0, 4($sp)	# copy param value to stack
	# ACall _tmp45
	  lw $t0, -188($fp)	# fill _tmp45 to $t0 from $fp-188
	  jalr $t0            	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp46 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -192($fp)	# spill _tmp46 from $t2 to $fp-192
	# _tmp47 = i + _tmp46
	  lw $t0, -8($fp)	# fill i to $t0 from $fp-8
	  lw $t1, -192($fp)	# fill _tmp46 to $t1 from $fp-192
	  add $t2, $t0, $t1	
	  sw $t2, -196($fp)	# spill _tmp47 from $t2 to $fp-196
	# i = _tmp47
	  lw $t2, -196($fp)	# fill _tmp47 to $t2 from $fp-196
	  sw $t2, -8($fp)	# spill i from $t2 to $fp-8
	# Goto loopBegin_14
	  b loopBegin_14		# unconditional branch
  loopEnd_15:
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  BJDeck_DealCard:
	# BeginFunc 180
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 180	# decrement sp to make space for locals/temps
	# _tmp1 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -12($fp)	# spill _tmp1 from $t2 to $fp-12
	# c = _tmp1
	  lw $t2, -12($fp)	# fill _tmp1 to $t2 from $fp-12
	  sw $t2, -8($fp)	# spill c from $t2 to $fp-8
	# _tmp2 = *(this + 8)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 8($t0) 	# load with offset
	  sw $t2, -16($fp)	# spill _tmp2 from $t2 to $fp-16
	# _tmp3 = 8
	  li $t2, 8		# load constant value 8 into $t2
	  sw $t2, -20($fp)	# spill _tmp3 from $t2 to $fp-20
	# _tmp4 = 52
	  li $t2, 52		# load constant value 52 into $t2
	  sw $t2, -24($fp)	# spill _tmp4 from $t2 to $fp-24
	# _tmp5 = _tmp3 * _tmp4
	  lw $t0, -20($fp)	# fill _tmp3 to $t0 from $fp-20
	  lw $t1, -24($fp)	# fill _tmp4 to $t1 from $fp-24
	  mul $t2, $t0, $t1	
	  sw $t2, -28($fp)	# spill _tmp5 from $t2 to $fp-28
	# _tmp6 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -32($fp)	# spill _tmp6 from $t2 to $fp-32
	# _tmp7 = _tmp5 - _tmp6
	  lw $t0, -28($fp)	# fill _tmp5 to $t0 from $fp-28
	  lw $t1, -32($fp)	# fill _tmp6 to $t1 from $fp-32
	  sub $t2, $t0, $t1	
	  sw $t2, -36($fp)	# spill _tmp7 from $t2 to $fp-36
	# _tmp8 = _tmp7 < _tmp2
	  lw $t0, -36($fp)	# fill _tmp7 to $t0 from $fp-36
	  lw $t1, -16($fp)	# fill _tmp2 to $t1 from $fp-16
	  slt $t2, $t0, $t1	
	  sw $t2, -40($fp)	# spill _tmp8 from $t2 to $fp-40
	# IfZ _tmp8 Goto else_18
	  lw $t0, -40($fp)	# fill _tmp8 to $t0 from $fp-40
	  beqz $t0, else_18	# branch if _tmp8 is zero 
	# _tmp9 = 11
	  li $t2, 11		# load constant value 11 into $t2
	  sw $t2, -44($fp)	# spill _tmp9 from $t2 to $fp-44
	# Return _tmp9
	  lw $t2, -44($fp)	# fill _tmp9 to $t2 from $fp-44
	  move $v0, $t2		# assign return value into $v0
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# Goto endif_19
	  b endif_19		# unconditional branch
  else_18:
  endif_19:
  loopBegin_20:
	# _tmp10 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -48($fp)	# spill _tmp10 from $t2 to $fp-48
	# _tmp11 = c == _tmp10
	  lw $t0, -8($fp)	# fill c to $t0 from $fp-8
	  lw $t1, -48($fp)	# fill _tmp10 to $t1 from $fp-48
	  seq $t2, $t0, $t1	
	  sw $t2, -52($fp)	# spill _tmp11 from $t2 to $fp-52
	# IfZ _tmp11 Goto loopEnd_21
	  lw $t0, -52($fp)	# fill _tmp11 to $t0 from $fp-52
	  beqz $t0, loopEnd_21	# branch if _tmp11 is zero 
	# _tmp13 = 8
	  li $t2, 8		# load constant value 8 into $t2
	  sw $t2, -60($fp)	# spill _tmp13 from $t2 to $fp-60
	# _tmp14 = *(gRnd)
	  lw $t0, 0($gp)	# fill gRnd to $t0 from $gp+0
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -64($fp)	# spill _tmp14 from $t2 to $fp-64
	# _tmp15 = *(_tmp14 + 8)
	  lw $t0, -64($fp)	# fill _tmp14 to $t0 from $fp-64
	  lw $t2, 8($t0) 	# load with offset
	  sw $t2, -68($fp)	# spill _tmp15 from $t2 to $fp-68
	# PushParam _tmp13
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -60($fp)	# fill _tmp13 to $t0 from $fp-60
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam gRnd
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, 0($gp)	# fill gRnd to $t0 from $gp+0
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp16 = ACall _tmp15
	  lw $t0, -68($fp)	# fill _tmp15 to $t0 from $fp-68
	  jalr $t0            	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -72($fp)	# spill _tmp16 from $t2 to $fp-72
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# d = _tmp16
	  lw $t2, -72($fp)	# fill _tmp16 to $t2 from $fp-72
	  sw $t2, -56($fp)	# spill d from $t2 to $fp-56
	# _tmp17 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -76($fp)	# spill _tmp17 from $t2 to $fp-76
	# _tmp18 = *(_tmp17)
	  lw $t0, -76($fp)	# fill _tmp17 to $t0 from $fp-76
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -80($fp)	# spill _tmp18 from $t2 to $fp-80
	# _tmp19 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -84($fp)	# spill _tmp19 from $t2 to $fp-84
	# _tmp20 = d < _tmp19
	  lw $t0, -56($fp)	# fill d to $t0 from $fp-56
	  lw $t1, -84($fp)	# fill _tmp19 to $t1 from $fp-84
	  slt $t2, $t0, $t1	
	  sw $t2, -88($fp)	# spill _tmp20 from $t2 to $fp-88
	# _tmp21 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -92($fp)	# spill _tmp21 from $t2 to $fp-92
	# _tmp22 = _tmp18 - _tmp21
	  lw $t0, -80($fp)	# fill _tmp18 to $t0 from $fp-80
	  lw $t1, -92($fp)	# fill _tmp21 to $t1 from $fp-92
	  sub $t2, $t0, $t1	
	  sw $t2, -96($fp)	# spill _tmp22 from $t2 to $fp-96
	# _tmp23 = _tmp22 < d
	  lw $t0, -96($fp)	# fill _tmp22 to $t0 from $fp-96
	  lw $t1, -56($fp)	# fill d to $t1 from $fp-56
	  slt $t2, $t0, $t1	
	  sw $t2, -100($fp)	# spill _tmp23 from $t2 to $fp-100
	# _tmp24 = _tmp20 || _tmp23
	  lw $t0, -88($fp)	# fill _tmp20 to $t0 from $fp-88
	  lw $t1, -100($fp)	# fill _tmp23 to $t1 from $fp-100
	  or $t2, $t0, $t1	
	  sw $t2, -104($fp)	# spill _tmp24 from $t2 to $fp-104
	# IfZ _tmp24 Goto arrayAcc_22
	  lw $t0, -104($fp)	# fill _tmp24 to $t0 from $fp-104
	  beqz $t0, arrayAcc_22	# branch if _tmp24 is zero 
	# _tmp25 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string11: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string11	# load label
	  sw $t2, -108($fp)	# spill _tmp25 from $t2 to $fp-108
	# PushParam _tmp25
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -108($fp)	# fill _tmp25 to $t0 from $fp-108
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_22:
	# _tmp26 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -112($fp)	# spill _tmp26 from $t2 to $fp-112
	# _tmp27 = d * _tmp26
	  lw $t0, -56($fp)	# fill d to $t0 from $fp-56
	  lw $t1, -112($fp)	# fill _tmp26 to $t1 from $fp-112
	  mul $t2, $t0, $t1	
	  sw $t2, -116($fp)	# spill _tmp27 from $t2 to $fp-116
	# _tmp28 = _tmp17 + _tmp27
	  lw $t0, -76($fp)	# fill _tmp17 to $t0 from $fp-76
	  lw $t1, -116($fp)	# fill _tmp27 to $t1 from $fp-116
	  add $t2, $t0, $t1	
	  sw $t2, -120($fp)	# spill _tmp28 from $t2 to $fp-120
	# _tmp29 = _tmp28 + _tmp26
	  lw $t0, -120($fp)	# fill _tmp28 to $t0 from $fp-120
	  lw $t1, -112($fp)	# fill _tmp26 to $t1 from $fp-112
	  add $t2, $t0, $t1	
	  sw $t2, -124($fp)	# spill _tmp29 from $t2 to $fp-124
	# _tmp30 = *(_tmp29)
	  lw $t0, -124($fp)	# fill _tmp29 to $t0 from $fp-124
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -128($fp)	# spill _tmp30 from $t2 to $fp-128
	# _tmp31 = *(_tmp30)
	  lw $t0, -128($fp)	# fill _tmp30 to $t0 from $fp-128
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -132($fp)	# spill _tmp31 from $t2 to $fp-132
	# _tmp32 = *(_tmp31 + 8)
	  lw $t0, -132($fp)	# fill _tmp31 to $t0 from $fp-132
	  lw $t2, 8($t0) 	# load with offset
	  sw $t2, -136($fp)	# spill _tmp32 from $t2 to $fp-136
	# PushParam _tmp30
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -128($fp)	# fill _tmp30 to $t0 from $fp-128
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp33 = ACall _tmp32
	  lw $t0, -136($fp)	# fill _tmp32 to $t0 from $fp-136
	  jalr $t0            	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -140($fp)	# spill _tmp33 from $t2 to $fp-140
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# c = _tmp33
	  lw $t2, -140($fp)	# fill _tmp33 to $t2 from $fp-140
	  sw $t2, -8($fp)	# spill c from $t2 to $fp-8
	# Goto loopBegin_20
	  b loopBegin_20		# unconditional branch
  loopEnd_21:
	# _tmp34 = 10
	  li $t2, 10		# load constant value 10 into $t2
	  sw $t2, -144($fp)	# spill _tmp34 from $t2 to $fp-144
	# _tmp35 = _tmp34 < c
	  lw $t0, -144($fp)	# fill _tmp34 to $t0 from $fp-144
	  lw $t1, -8($fp)	# fill c to $t1 from $fp-8
	  slt $t2, $t0, $t1	
	  sw $t2, -148($fp)	# spill _tmp35 from $t2 to $fp-148
	# IfZ _tmp35 Goto else_23
	  lw $t0, -148($fp)	# fill _tmp35 to $t0 from $fp-148
	  beqz $t0, else_23	# branch if _tmp35 is zero 
	# _tmp36 = 10
	  li $t2, 10		# load constant value 10 into $t2
	  sw $t2, -152($fp)	# spill _tmp36 from $t2 to $fp-152
	# c = _tmp36
	  lw $t2, -152($fp)	# fill _tmp36 to $t2 from $fp-152
	  sw $t2, -8($fp)	# spill c from $t2 to $fp-8
	# Goto endif_24
	  b endif_24		# unconditional branch
  else_23:
	# _tmp37 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -156($fp)	# spill _tmp37 from $t2 to $fp-156
	# _tmp38 = c == _tmp37
	  lw $t0, -8($fp)	# fill c to $t0 from $fp-8
	  lw $t1, -156($fp)	# fill _tmp37 to $t1 from $fp-156
	  seq $t2, $t0, $t1	
	  sw $t2, -160($fp)	# spill _tmp38 from $t2 to $fp-160
	# IfZ _tmp38 Goto else_25
	  lw $t0, -160($fp)	# fill _tmp38 to $t0 from $fp-160
	  beqz $t0, else_25	# branch if _tmp38 is zero 
	# _tmp39 = 11
	  li $t2, 11		# load constant value 11 into $t2
	  sw $t2, -164($fp)	# spill _tmp39 from $t2 to $fp-164
	# c = _tmp39
	  lw $t2, -164($fp)	# fill _tmp39 to $t2 from $fp-164
	  sw $t2, -8($fp)	# spill c from $t2 to $fp-8
	# Goto endif_26
	  b endif_26		# unconditional branch
  else_25:
  endif_26:
  endif_24:
	# _tmp40 = *(this + 8)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 8($t0) 	# load with offset
	  sw $t2, -168($fp)	# spill _tmp40 from $t2 to $fp-168
	# _tmp41 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -172($fp)	# spill _tmp41 from $t2 to $fp-172
	# _tmp42 = _tmp40 + _tmp41
	  lw $t0, -168($fp)	# fill _tmp40 to $t0 from $fp-168
	  lw $t1, -172($fp)	# fill _tmp41 to $t1 from $fp-172
	  add $t2, $t0, $t1	
	  sw $t2, -176($fp)	# spill _tmp42 from $t2 to $fp-176
	# _tmp43 = 8
	  li $t2, 8		# load constant value 8 into $t2
	  sw $t2, -180($fp)	# spill _tmp43 from $t2 to $fp-180
	# _tmp44 = this + _tmp43
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t1, -180($fp)	# fill _tmp43 to $t1 from $fp-180
	  add $t2, $t0, $t1	
	  sw $t2, -184($fp)	# spill _tmp44 from $t2 to $fp-184
	# *(_tmp44) = _tmp42
	  lw $t0, -176($fp)	# fill _tmp42 to $t0 from $fp-176
	  lw $t2, -184($fp)	# fill _tmp44 to $t2 from $fp-184
	  sw $t0, 0($t2) 	# store with offset
	# Return c
	  lw $t2, -8($fp)	# fill c to $t2 from $fp-8
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
  BJDeck_Shuffle:
	# BeginFunc 108
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 108	# decrement sp to make space for locals/temps
	# _tmp1 = "Shuffling..."
	  .data			# create string constant marked with label
	  _string12: .asciiz "Shuffling..."
	  .text
	  la $t2, _string12	# load label
	  sw $t2, -12($fp)	# spill _tmp1 from $t2 to $fp-12
	# PushParam _tmp1
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -12($fp)	# fill _tmp1 to $t0 from $fp-12
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp2 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -16($fp)	# spill _tmp2 from $t2 to $fp-16
	# i = _tmp2
	  lw $t2, -16($fp)	# fill _tmp2 to $t2 from $fp-16
	  sw $t2, -8($fp)	# spill i from $t2 to $fp-8
  loopBegin_27:
	# _tmp3 = 8
	  li $t2, 8		# load constant value 8 into $t2
	  sw $t2, -20($fp)	# spill _tmp3 from $t2 to $fp-20
	# _tmp4 = i < _tmp3
	  lw $t0, -8($fp)	# fill i to $t0 from $fp-8
	  lw $t1, -20($fp)	# fill _tmp3 to $t1 from $fp-20
	  slt $t2, $t0, $t1	
	  sw $t2, -24($fp)	# spill _tmp4 from $t2 to $fp-24
	# IfZ _tmp4 Goto loopEnd_28
	  lw $t0, -24($fp)	# fill _tmp4 to $t0 from $fp-24
	  beqz $t0, loopEnd_28	# branch if _tmp4 is zero 
	# _tmp5 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -28($fp)	# spill _tmp5 from $t2 to $fp-28
	# _tmp6 = *(_tmp5)
	  lw $t0, -28($fp)	# fill _tmp5 to $t0 from $fp-28
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -32($fp)	# spill _tmp6 from $t2 to $fp-32
	# _tmp7 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -36($fp)	# spill _tmp7 from $t2 to $fp-36
	# _tmp8 = i < _tmp7
	  lw $t0, -8($fp)	# fill i to $t0 from $fp-8
	  lw $t1, -36($fp)	# fill _tmp7 to $t1 from $fp-36
	  slt $t2, $t0, $t1	
	  sw $t2, -40($fp)	# spill _tmp8 from $t2 to $fp-40
	# _tmp9 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -44($fp)	# spill _tmp9 from $t2 to $fp-44
	# _tmp10 = _tmp6 - _tmp9
	  lw $t0, -32($fp)	# fill _tmp6 to $t0 from $fp-32
	  lw $t1, -44($fp)	# fill _tmp9 to $t1 from $fp-44
	  sub $t2, $t0, $t1	
	  sw $t2, -48($fp)	# spill _tmp10 from $t2 to $fp-48
	# _tmp11 = _tmp10 < i
	  lw $t0, -48($fp)	# fill _tmp10 to $t0 from $fp-48
	  lw $t1, -8($fp)	# fill i to $t1 from $fp-8
	  slt $t2, $t0, $t1	
	  sw $t2, -52($fp)	# spill _tmp11 from $t2 to $fp-52
	# _tmp12 = _tmp8 || _tmp11
	  lw $t0, -40($fp)	# fill _tmp8 to $t0 from $fp-40
	  lw $t1, -52($fp)	# fill _tmp11 to $t1 from $fp-52
	  or $t2, $t0, $t1	
	  sw $t2, -56($fp)	# spill _tmp12 from $t2 to $fp-56
	# IfZ _tmp12 Goto arrayAcc_29
	  lw $t0, -56($fp)	# fill _tmp12 to $t0 from $fp-56
	  beqz $t0, arrayAcc_29	# branch if _tmp12 is zero 
	# _tmp13 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string13: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string13	# load label
	  sw $t2, -60($fp)	# spill _tmp13 from $t2 to $fp-60
	# PushParam _tmp13
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -60($fp)	# fill _tmp13 to $t0 from $fp-60
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_29:
	# _tmp14 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -64($fp)	# spill _tmp14 from $t2 to $fp-64
	# _tmp15 = i * _tmp14
	  lw $t0, -8($fp)	# fill i to $t0 from $fp-8
	  lw $t1, -64($fp)	# fill _tmp14 to $t1 from $fp-64
	  mul $t2, $t0, $t1	
	  sw $t2, -68($fp)	# spill _tmp15 from $t2 to $fp-68
	# _tmp16 = _tmp5 + _tmp15
	  lw $t0, -28($fp)	# fill _tmp5 to $t0 from $fp-28
	  lw $t1, -68($fp)	# fill _tmp15 to $t1 from $fp-68
	  add $t2, $t0, $t1	
	  sw $t2, -72($fp)	# spill _tmp16 from $t2 to $fp-72
	# _tmp17 = _tmp16 + _tmp14
	  lw $t0, -72($fp)	# fill _tmp16 to $t0 from $fp-72
	  lw $t1, -64($fp)	# fill _tmp14 to $t1 from $fp-64
	  add $t2, $t0, $t1	
	  sw $t2, -76($fp)	# spill _tmp17 from $t2 to $fp-76
	# _tmp18 = *(_tmp17)
	  lw $t0, -76($fp)	# fill _tmp17 to $t0 from $fp-76
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -80($fp)	# spill _tmp18 from $t2 to $fp-80
	# _tmp19 = *(_tmp18)
	  lw $t0, -80($fp)	# fill _tmp18 to $t0 from $fp-80
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -84($fp)	# spill _tmp19 from $t2 to $fp-84
	# _tmp20 = *(_tmp19 + 4)
	  lw $t0, -84($fp)	# fill _tmp19 to $t0 from $fp-84
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -88($fp)	# spill _tmp20 from $t2 to $fp-88
	# PushParam _tmp18
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -80($fp)	# fill _tmp18 to $t0 from $fp-80
	  sw $t0, 4($sp)	# copy param value to stack
	# ACall _tmp20
	  lw $t0, -88($fp)	# fill _tmp20 to $t0 from $fp-88
	  jalr $t0            	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp21 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -92($fp)	# spill _tmp21 from $t2 to $fp-92
	# _tmp22 = i + _tmp21
	  lw $t0, -8($fp)	# fill i to $t0 from $fp-8
	  lw $t1, -92($fp)	# fill _tmp21 to $t1 from $fp-92
	  add $t2, $t0, $t1	
	  sw $t2, -96($fp)	# spill _tmp22 from $t2 to $fp-96
	# i = _tmp22
	  lw $t2, -96($fp)	# fill _tmp22 to $t2 from $fp-96
	  sw $t2, -8($fp)	# spill i from $t2 to $fp-8
	# Goto loopBegin_27
	  b loopBegin_27		# unconditional branch
  loopEnd_28:
	# _tmp23 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -100($fp)	# spill _tmp23 from $t2 to $fp-100
	# _tmp24 = 8
	  li $t2, 8		# load constant value 8 into $t2
	  sw $t2, -104($fp)	# spill _tmp24 from $t2 to $fp-104
	# _tmp25 = this + _tmp24
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t1, -104($fp)	# fill _tmp24 to $t1 from $fp-104
	  add $t2, $t0, $t1	
	  sw $t2, -108($fp)	# spill _tmp25 from $t2 to $fp-108
	# *(_tmp25) = _tmp23
	  lw $t0, -100($fp)	# fill _tmp23 to $t0 from $fp-100
	  lw $t2, -108($fp)	# fill _tmp25 to $t2 from $fp-108
	  sw $t0, 0($t2) 	# store with offset
	# _tmp26 = "done.\n"
	  .data			# create string constant marked with label
	  _string14: .asciiz "done.\n"
	  .text
	  la $t2, _string14	# load label
	  sw $t2, -112($fp)	# spill _tmp26 from $t2 to $fp-112
	# PushParam _tmp26
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -112($fp)	# fill _tmp26 to $t0 from $fp-112
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
  BJDeck_NumCardsRemaining:
	# BeginFunc 20
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 20	# decrement sp to make space for locals/temps
	# _tmp0 = 8
	  li $t2, 8		# load constant value 8 into $t2
	  sw $t2, -8($fp)	# spill _tmp0 from $t2 to $fp-8
	# _tmp1 = 52
	  li $t2, 52		# load constant value 52 into $t2
	  sw $t2, -12($fp)	# spill _tmp1 from $t2 to $fp-12
	# _tmp2 = _tmp0 * _tmp1
	  lw $t0, -8($fp)	# fill _tmp0 to $t0 from $fp-8
	  lw $t1, -12($fp)	# fill _tmp1 to $t1 from $fp-12
	  mul $t2, $t0, $t1	
	  sw $t2, -16($fp)	# spill _tmp2 from $t2 to $fp-16
	# _tmp3 = *(this + 8)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 8($t0) 	# load with offset
	  sw $t2, -20($fp)	# spill _tmp3 from $t2 to $fp-20
	# _tmp4 = _tmp2 - _tmp3
	  lw $t0, -16($fp)	# fill _tmp2 to $t0 from $fp-16
	  lw $t1, -20($fp)	# fill _tmp3 to $t1 from $fp-20
	  sub $t2, $t0, $t1	
	  sw $t2, -24($fp)	# spill _tmp4 from $t2 to $fp-24
	# Return _tmp4
	  lw $t2, -24($fp)	# fill _tmp4 to $t2 from $fp-24
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
	# VTable for class BJDeck
	  .data
	  .align 2
	  BJDeck:		# label for class BJDeck vtable
	  .word BJDeck_Init
	  .word BJDeck_DealCard
	  .word BJDeck_Shuffle
	  .word BJDeck_NumCardsRemaining
	  .text
  Player_Init:
	# BeginFunc 32
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 32	# decrement sp to make space for locals/temps
	# _tmp0 = 1000
	  li $t2, 1000		# load constant value 1000 into $t2
	  sw $t2, -8($fp)	# spill _tmp0 from $t2 to $fp-8
	# _tmp1 = 20
	  li $t2, 20		# load constant value 20 into $t2
	  sw $t2, -12($fp)	# spill _tmp1 from $t2 to $fp-12
	# _tmp2 = this + _tmp1
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t1, -12($fp)	# fill _tmp1 to $t1 from $fp-12
	  add $t2, $t0, $t1	
	  sw $t2, -16($fp)	# spill _tmp2 from $t2 to $fp-16
	# *(_tmp2) = _tmp0
	  lw $t0, -8($fp)	# fill _tmp0 to $t0 from $fp-8
	  lw $t2, -16($fp)	# fill _tmp2 to $t2 from $fp-16
	  sw $t0, 0($t2) 	# store with offset
	# _tmp3 = "What is the name of player #"
	  .data			# create string constant marked with label
	  _string15: .asciiz "What is the name of player #"
	  .text
	  la $t2, _string15	# load label
	  sw $t2, -20($fp)	# spill _tmp3 from $t2 to $fp-20
	# PushParam _tmp3
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -20($fp)	# fill _tmp3 to $t0 from $fp-20
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# PushParam num
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, 8($fp)	# fill num to $t0 from $fp+8
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintInt
	  jal _PrintInt      	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp4 = "? "
	  .data			# create string constant marked with label
	  _string16: .asciiz "? "
	  .text
	  la $t2, _string16	# load label
	  sw $t2, -24($fp)	# spill _tmp4 from $t2 to $fp-24
	# PushParam _tmp4
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -24($fp)	# fill _tmp4 to $t0 from $fp-24
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp5 = LCall _ReadLine
	  jal _ReadLine      	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -28($fp)	# spill _tmp5 from $t2 to $fp-28
	# _tmp6 = 24
	  li $t2, 24		# load constant value 24 into $t2
	  sw $t2, -32($fp)	# spill _tmp6 from $t2 to $fp-32
	# _tmp7 = this + _tmp6
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t1, -32($fp)	# fill _tmp6 to $t1 from $fp-32
	  add $t2, $t0, $t1	
	  sw $t2, -36($fp)	# spill _tmp7 from $t2 to $fp-36
	# *(_tmp7) = _tmp5
	  lw $t0, -28($fp)	# fill _tmp5 to $t0 from $fp-28
	  lw $t2, -36($fp)	# fill _tmp7 to $t2 from $fp-36
	  sw $t0, 0($t2) 	# store with offset
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  Player_Hit:
	# BeginFunc 160
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 160	# decrement sp to make space for locals/temps
	# _tmp1 = *(deck)
	  lw $t0, 8($fp)	# fill deck to $t0 from $fp+8
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -12($fp)	# spill _tmp1 from $t2 to $fp-12
	# _tmp2 = *(_tmp1 + 4)
	  lw $t0, -12($fp)	# fill _tmp1 to $t0 from $fp-12
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -16($fp)	# spill _tmp2 from $t2 to $fp-16
	# PushParam deck
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, 8($fp)	# fill deck to $t0 from $fp+8
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp3 = ACall _tmp2
	  lw $t0, -16($fp)	# fill _tmp2 to $t0 from $fp-16
	  jalr $t0            	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -20($fp)	# spill _tmp3 from $t2 to $fp-20
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# card = _tmp3
	  lw $t2, -20($fp)	# fill _tmp3 to $t2 from $fp-20
	  sw $t2, -8($fp)	# spill card from $t2 to $fp-8
	# _tmp4 = *(this + 24)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 24($t0) 	# load with offset
	  sw $t2, -24($fp)	# spill _tmp4 from $t2 to $fp-24
	# PushParam _tmp4
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -24($fp)	# fill _tmp4 to $t0 from $fp-24
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp5 = " was dealt a "
	  .data			# create string constant marked with label
	  _string17: .asciiz " was dealt a "
	  .text
	  la $t2, _string17	# load label
	  sw $t2, -28($fp)	# spill _tmp5 from $t2 to $fp-28
	# PushParam _tmp5
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -28($fp)	# fill _tmp5 to $t0 from $fp-28
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# PushParam card
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -8($fp)	# fill card to $t0 from $fp-8
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintInt
	  jal _PrintInt      	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp6 = ".\n"
	  .data			# create string constant marked with label
	  _string18: .asciiz ".\n"
	  .text
	  la $t2, _string18	# load label
	  sw $t2, -32($fp)	# spill _tmp6 from $t2 to $fp-32
	# PushParam _tmp6
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -32($fp)	# fill _tmp6 to $t0 from $fp-32
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp7 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -36($fp)	# spill _tmp7 from $t2 to $fp-36
	# _tmp8 = _tmp7 + card
	  lw $t0, -36($fp)	# fill _tmp7 to $t0 from $fp-36
	  lw $t1, -8($fp)	# fill card to $t1 from $fp-8
	  add $t2, $t0, $t1	
	  sw $t2, -40($fp)	# spill _tmp8 from $t2 to $fp-40
	# _tmp9 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -44($fp)	# spill _tmp9 from $t2 to $fp-44
	# _tmp10 = this + _tmp9
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t1, -44($fp)	# fill _tmp9 to $t1 from $fp-44
	  add $t2, $t0, $t1	
	  sw $t2, -48($fp)	# spill _tmp10 from $t2 to $fp-48
	# *(_tmp10) = _tmp8
	  lw $t0, -40($fp)	# fill _tmp8 to $t0 from $fp-40
	  lw $t2, -48($fp)	# fill _tmp10 to $t2 from $fp-48
	  sw $t0, 0($t2) 	# store with offset
	# _tmp11 = *(this + 12)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 12($t0) 	# load with offset
	  sw $t2, -52($fp)	# spill _tmp11 from $t2 to $fp-52
	# _tmp12 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -56($fp)	# spill _tmp12 from $t2 to $fp-56
	# _tmp13 = _tmp11 + _tmp12
	  lw $t0, -52($fp)	# fill _tmp11 to $t0 from $fp-52
	  lw $t1, -56($fp)	# fill _tmp12 to $t1 from $fp-56
	  add $t2, $t0, $t1	
	  sw $t2, -60($fp)	# spill _tmp13 from $t2 to $fp-60
	# _tmp14 = 12
	  li $t2, 12		# load constant value 12 into $t2
	  sw $t2, -64($fp)	# spill _tmp14 from $t2 to $fp-64
	# _tmp15 = this + _tmp14
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t1, -64($fp)	# fill _tmp14 to $t1 from $fp-64
	  add $t2, $t0, $t1	
	  sw $t2, -68($fp)	# spill _tmp15 from $t2 to $fp-68
	# *(_tmp15) = _tmp13
	  lw $t0, -60($fp)	# fill _tmp13 to $t0 from $fp-60
	  lw $t2, -68($fp)	# fill _tmp15 to $t2 from $fp-68
	  sw $t0, 0($t2) 	# store with offset
	# _tmp16 = 11
	  li $t2, 11		# load constant value 11 into $t2
	  sw $t2, -72($fp)	# spill _tmp16 from $t2 to $fp-72
	# _tmp17 = card == _tmp16
	  lw $t0, -8($fp)	# fill card to $t0 from $fp-8
	  lw $t1, -72($fp)	# fill _tmp16 to $t1 from $fp-72
	  seq $t2, $t0, $t1	
	  sw $t2, -76($fp)	# spill _tmp17 from $t2 to $fp-76
	# IfZ _tmp17 Goto else_30
	  lw $t0, -76($fp)	# fill _tmp17 to $t0 from $fp-76
	  beqz $t0, else_30	# branch if _tmp17 is zero 
	# _tmp18 = *(this + 8)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 8($t0) 	# load with offset
	  sw $t2, -80($fp)	# spill _tmp18 from $t2 to $fp-80
	# _tmp19 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -84($fp)	# spill _tmp19 from $t2 to $fp-84
	# _tmp20 = _tmp18 + _tmp19
	  lw $t0, -80($fp)	# fill _tmp18 to $t0 from $fp-80
	  lw $t1, -84($fp)	# fill _tmp19 to $t1 from $fp-84
	  add $t2, $t0, $t1	
	  sw $t2, -88($fp)	# spill _tmp20 from $t2 to $fp-88
	# _tmp21 = 8
	  li $t2, 8		# load constant value 8 into $t2
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
	# Goto endif_31
	  b endif_31		# unconditional branch
  else_30:
  endif_31:
  loopBegin_32:
	# _tmp23 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -100($fp)	# spill _tmp23 from $t2 to $fp-100
	# _tmp24 = 21
	  li $t2, 21		# load constant value 21 into $t2
	  sw $t2, -104($fp)	# spill _tmp24 from $t2 to $fp-104
	# _tmp25 = _tmp24 < _tmp23
	  lw $t0, -104($fp)	# fill _tmp24 to $t0 from $fp-104
	  lw $t1, -100($fp)	# fill _tmp23 to $t1 from $fp-100
	  slt $t2, $t0, $t1	
	  sw $t2, -108($fp)	# spill _tmp25 from $t2 to $fp-108
	# _tmp26 = *(this + 8)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 8($t0) 	# load with offset
	  sw $t2, -112($fp)	# spill _tmp26 from $t2 to $fp-112
	# _tmp27 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -116($fp)	# spill _tmp27 from $t2 to $fp-116
	# _tmp28 = _tmp27 < _tmp26
	  lw $t0, -116($fp)	# fill _tmp27 to $t0 from $fp-116
	  lw $t1, -112($fp)	# fill _tmp26 to $t1 from $fp-112
	  slt $t2, $t0, $t1	
	  sw $t2, -120($fp)	# spill _tmp28 from $t2 to $fp-120
	# _tmp29 = _tmp25 && _tmp28
	  lw $t0, -108($fp)	# fill _tmp25 to $t0 from $fp-108
	  lw $t1, -120($fp)	# fill _tmp28 to $t1 from $fp-120
	  and $t2, $t0, $t1	
	  sw $t2, -124($fp)	# spill _tmp29 from $t2 to $fp-124
	# IfZ _tmp29 Goto loopEnd_33
	  lw $t0, -124($fp)	# fill _tmp29 to $t0 from $fp-124
	  beqz $t0, loopEnd_33	# branch if _tmp29 is zero 
	# _tmp30 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -128($fp)	# spill _tmp30 from $t2 to $fp-128
	# _tmp31 = 10
	  li $t2, 10		# load constant value 10 into $t2
	  sw $t2, -132($fp)	# spill _tmp31 from $t2 to $fp-132
	# _tmp32 = _tmp30 - _tmp31
	  lw $t0, -128($fp)	# fill _tmp30 to $t0 from $fp-128
	  lw $t1, -132($fp)	# fill _tmp31 to $t1 from $fp-132
	  sub $t2, $t0, $t1	
	  sw $t2, -136($fp)	# spill _tmp32 from $t2 to $fp-136
	# _tmp33 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -140($fp)	# spill _tmp33 from $t2 to $fp-140
	# _tmp34 = this + _tmp33
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t1, -140($fp)	# fill _tmp33 to $t1 from $fp-140
	  add $t2, $t0, $t1	
	  sw $t2, -144($fp)	# spill _tmp34 from $t2 to $fp-144
	# *(_tmp34) = _tmp32
	  lw $t0, -136($fp)	# fill _tmp32 to $t0 from $fp-136
	  lw $t2, -144($fp)	# fill _tmp34 to $t2 from $fp-144
	  sw $t0, 0($t2) 	# store with offset
	# _tmp35 = *(this + 8)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 8($t0) 	# load with offset
	  sw $t2, -148($fp)	# spill _tmp35 from $t2 to $fp-148
	# _tmp36 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -152($fp)	# spill _tmp36 from $t2 to $fp-152
	# _tmp37 = _tmp35 - _tmp36
	  lw $t0, -148($fp)	# fill _tmp35 to $t0 from $fp-148
	  lw $t1, -152($fp)	# fill _tmp36 to $t1 from $fp-152
	  sub $t2, $t0, $t1	
	  sw $t2, -156($fp)	# spill _tmp37 from $t2 to $fp-156
	# _tmp38 = 8
	  li $t2, 8		# load constant value 8 into $t2
	  sw $t2, -160($fp)	# spill _tmp38 from $t2 to $fp-160
	# _tmp39 = this + _tmp38
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t1, -160($fp)	# fill _tmp38 to $t1 from $fp-160
	  add $t2, $t0, $t1	
	  sw $t2, -164($fp)	# spill _tmp39 from $t2 to $fp-164
	# *(_tmp39) = _tmp37
	  lw $t0, -156($fp)	# fill _tmp37 to $t0 from $fp-156
	  lw $t2, -164($fp)	# fill _tmp39 to $t2 from $fp-164
	  sw $t0, 0($t2) 	# store with offset
	# Goto loopBegin_32
	  b loopBegin_32		# unconditional branch
  loopEnd_33:
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  Player_DoubleDown:
	# BeginFunc 112
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 112	# decrement sp to make space for locals/temps
	# _tmp1 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -12($fp)	# spill _tmp1 from $t2 to $fp-12
	# _tmp2 = 10
	  li $t2, 10		# load constant value 10 into $t2
	  sw $t2, -16($fp)	# spill _tmp2 from $t2 to $fp-16
	# _tmp3 = _tmp1 == _tmp2
	  lw $t0, -12($fp)	# fill _tmp1 to $t0 from $fp-12
	  lw $t1, -16($fp)	# fill _tmp2 to $t1 from $fp-16
	  seq $t2, $t0, $t1	
	  sw $t2, -20($fp)	# spill _tmp3 from $t2 to $fp-20
	# _tmp4 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -24($fp)	# spill _tmp4 from $t2 to $fp-24
	# _tmp5 = _tmp3 == _tmp4
	  lw $t0, -20($fp)	# fill _tmp3 to $t0 from $fp-20
	  lw $t1, -24($fp)	# fill _tmp4 to $t1 from $fp-24
	  seq $t2, $t0, $t1	
	  sw $t2, -28($fp)	# spill _tmp5 from $t2 to $fp-28
	# _tmp6 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -32($fp)	# spill _tmp6 from $t2 to $fp-32
	# _tmp7 = 11
	  li $t2, 11		# load constant value 11 into $t2
	  sw $t2, -36($fp)	# spill _tmp7 from $t2 to $fp-36
	# _tmp8 = _tmp6 == _tmp7
	  lw $t0, -32($fp)	# fill _tmp6 to $t0 from $fp-32
	  lw $t1, -36($fp)	# fill _tmp7 to $t1 from $fp-36
	  seq $t2, $t0, $t1	
	  sw $t2, -40($fp)	# spill _tmp8 from $t2 to $fp-40
	# _tmp9 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -44($fp)	# spill _tmp9 from $t2 to $fp-44
	# _tmp10 = _tmp8 == _tmp9
	  lw $t0, -40($fp)	# fill _tmp8 to $t0 from $fp-40
	  lw $t1, -44($fp)	# fill _tmp9 to $t1 from $fp-44
	  seq $t2, $t0, $t1	
	  sw $t2, -48($fp)	# spill _tmp10 from $t2 to $fp-48
	# _tmp11 = _tmp5 && _tmp10
	  lw $t0, -28($fp)	# fill _tmp5 to $t0 from $fp-28
	  lw $t1, -48($fp)	# fill _tmp10 to $t1 from $fp-48
	  and $t2, $t0, $t1	
	  sw $t2, -52($fp)	# spill _tmp11 from $t2 to $fp-52
	# IfZ _tmp11 Goto else_34
	  lw $t0, -52($fp)	# fill _tmp11 to $t0 from $fp-52
	  beqz $t0, else_34	# branch if _tmp11 is zero 
	# _tmp12 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -56($fp)	# spill _tmp12 from $t2 to $fp-56
	# Return _tmp12
	  lw $t2, -56($fp)	# fill _tmp12 to $t2 from $fp-56
	  move $v0, $t2		# assign return value into $v0
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# Goto endif_35
	  b endif_35		# unconditional branch
  else_34:
  endif_35:
	# _tmp13 = "Would you like to double down?"
	  .data			# create string constant marked with label
	  _string19: .asciiz "Would you like to double down?"
	  .text
	  la $t2, _string19	# load label
	  sw $t2, -60($fp)	# spill _tmp13 from $t2 to $fp-60
	# PushParam _tmp13
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -60($fp)	# fill _tmp13 to $t0 from $fp-60
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp14 = LCall _GetYesOrNo
	  jal _GetYesOrNo    	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -64($fp)	# spill _tmp14 from $t2 to $fp-64
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# IfZ _tmp14 Goto else_36
	  lw $t0, -64($fp)	# fill _tmp14 to $t0 from $fp-64
	  beqz $t0, else_36	# branch if _tmp14 is zero 
	# _tmp15 = *(this + 16)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 16($t0) 	# load with offset
	  sw $t2, -68($fp)	# spill _tmp15 from $t2 to $fp-68
	# _tmp16 = 2
	  li $t2, 2		# load constant value 2 into $t2
	  sw $t2, -72($fp)	# spill _tmp16 from $t2 to $fp-72
	# _tmp17 = _tmp15 * _tmp16
	  lw $t0, -68($fp)	# fill _tmp15 to $t0 from $fp-68
	  lw $t1, -72($fp)	# fill _tmp16 to $t1 from $fp-72
	  mul $t2, $t0, $t1	
	  sw $t2, -76($fp)	# spill _tmp17 from $t2 to $fp-76
	# _tmp18 = 16
	  li $t2, 16		# load constant value 16 into $t2
	  sw $t2, -80($fp)	# spill _tmp18 from $t2 to $fp-80
	# _tmp19 = this + _tmp18
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t1, -80($fp)	# fill _tmp18 to $t1 from $fp-80
	  add $t2, $t0, $t1	
	  sw $t2, -84($fp)	# spill _tmp19 from $t2 to $fp-84
	# *(_tmp19) = _tmp17
	  lw $t0, -76($fp)	# fill _tmp17 to $t0 from $fp-76
	  lw $t2, -84($fp)	# fill _tmp19 to $t2 from $fp-84
	  sw $t0, 0($t2) 	# store with offset
	# _tmp20 = *(this)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -88($fp)	# spill _tmp20 from $t2 to $fp-88
	# _tmp21 = *(_tmp20 + 4)
	  lw $t0, -88($fp)	# fill _tmp20 to $t0 from $fp-88
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -92($fp)	# spill _tmp21 from $t2 to $fp-92
	# PushParam deck
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, 8($fp)	# fill deck to $t0 from $fp+8
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam this
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  sw $t0, 4($sp)	# copy param value to stack
	# ACall _tmp21
	  lw $t0, -92($fp)	# fill _tmp21 to $t0 from $fp-92
	  jalr $t0            	# jump to function
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# _tmp22 = *(this + 24)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 24($t0) 	# load with offset
	  sw $t2, -96($fp)	# spill _tmp22 from $t2 to $fp-96
	# PushParam _tmp22
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -96($fp)	# fill _tmp22 to $t0 from $fp-96
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp23 = ", your total is "
	  .data			# create string constant marked with label
	  _string20: .asciiz ", your total is "
	  .text
	  la $t2, _string20	# load label
	  sw $t2, -100($fp)	# spill _tmp23 from $t2 to $fp-100
	# PushParam _tmp23
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -100($fp)	# fill _tmp23 to $t0 from $fp-100
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp24 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -104($fp)	# spill _tmp24 from $t2 to $fp-104
	# PushParam _tmp24
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -104($fp)	# fill _tmp24 to $t0 from $fp-104
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintInt
	  jal _PrintInt      	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp25 = ".\n"
	  .data			# create string constant marked with label
	  _string21: .asciiz ".\n"
	  .text
	  la $t2, _string21	# load label
	  sw $t2, -108($fp)	# spill _tmp25 from $t2 to $fp-108
	# PushParam _tmp25
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -108($fp)	# fill _tmp25 to $t0 from $fp-108
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp26 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -112($fp)	# spill _tmp26 from $t2 to $fp-112
	# Return _tmp26
	  lw $t2, -112($fp)	# fill _tmp26 to $t2 from $fp-112
	  move $v0, $t2		# assign return value into $v0
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# Goto endif_37
	  b endif_37		# unconditional branch
  else_36:
  endif_37:
	# _tmp27 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -116($fp)	# spill _tmp27 from $t2 to $fp-116
	# Return _tmp27
	  lw $t2, -116($fp)	# fill _tmp27 to $t2 from $fp-116
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
  Player_TakeTurn:
	# BeginFunc 192
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 192	# decrement sp to make space for locals/temps
	# _tmp1 = "\n"
	  .data			# create string constant marked with label
	  _string22: .asciiz "\n"
	  .text
	  la $t2, _string22	# load label
	  sw $t2, -12($fp)	# spill _tmp1 from $t2 to $fp-12
	# PushParam _tmp1
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -12($fp)	# fill _tmp1 to $t0 from $fp-12
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp2 = *(this + 24)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 24($t0) 	# load with offset
	  sw $t2, -16($fp)	# spill _tmp2 from $t2 to $fp-16
	# PushParam _tmp2
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -16($fp)	# fill _tmp2 to $t0 from $fp-16
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp3 = "'s turn.\n"
	  .data			# create string constant marked with label
	  _string23: .asciiz "'s turn.\n"
	  .text
	  la $t2, _string23	# load label
	  sw $t2, -20($fp)	# spill _tmp3 from $t2 to $fp-20
	# PushParam _tmp3
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -20($fp)	# fill _tmp3 to $t0 from $fp-20
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp4 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -24($fp)	# spill _tmp4 from $t2 to $fp-24
	# _tmp5 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -28($fp)	# spill _tmp5 from $t2 to $fp-28
	# _tmp6 = this + _tmp5
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t1, -28($fp)	# fill _tmp5 to $t1 from $fp-28
	  add $t2, $t0, $t1	
	  sw $t2, -32($fp)	# spill _tmp6 from $t2 to $fp-32
	# *(_tmp6) = _tmp4
	  lw $t0, -24($fp)	# fill _tmp4 to $t0 from $fp-24
	  lw $t2, -32($fp)	# fill _tmp6 to $t2 from $fp-32
	  sw $t0, 0($t2) 	# store with offset
	# _tmp7 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -36($fp)	# spill _tmp7 from $t2 to $fp-36
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
	# _tmp11 = 12
	  li $t2, 12		# load constant value 12 into $t2
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
	# _tmp13 = *(this)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -60($fp)	# spill _tmp13 from $t2 to $fp-60
	# _tmp14 = *(_tmp13 + 4)
	  lw $t0, -60($fp)	# fill _tmp13 to $t0 from $fp-60
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -64($fp)	# spill _tmp14 from $t2 to $fp-64
	# PushParam deck
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, 8($fp)	# fill deck to $t0 from $fp+8
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam this
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  sw $t0, 4($sp)	# copy param value to stack
	# ACall _tmp14
	  lw $t0, -64($fp)	# fill _tmp14 to $t0 from $fp-64
	  jalr $t0            	# jump to function
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# _tmp15 = *(this)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -68($fp)	# spill _tmp15 from $t2 to $fp-68
	# _tmp16 = *(_tmp15 + 4)
	  lw $t0, -68($fp)	# fill _tmp15 to $t0 from $fp-68
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -72($fp)	# spill _tmp16 from $t2 to $fp-72
	# PushParam deck
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, 8($fp)	# fill deck to $t0 from $fp+8
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam this
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  sw $t0, 4($sp)	# copy param value to stack
	# ACall _tmp16
	  lw $t0, -72($fp)	# fill _tmp16 to $t0 from $fp-72
	  jalr $t0            	# jump to function
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# _tmp17 = *(this)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -76($fp)	# spill _tmp17 from $t2 to $fp-76
	# _tmp18 = *(_tmp17 + 8)
	  lw $t0, -76($fp)	# fill _tmp17 to $t0 from $fp-76
	  lw $t2, 8($t0) 	# load with offset
	  sw $t2, -80($fp)	# spill _tmp18 from $t2 to $fp-80
	# PushParam deck
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, 8($fp)	# fill deck to $t0 from $fp+8
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam this
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp19 = ACall _tmp18
	  lw $t0, -80($fp)	# fill _tmp18 to $t0 from $fp-80
	  jalr $t0            	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -84($fp)	# spill _tmp19 from $t2 to $fp-84
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# _tmp20 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -88($fp)	# spill _tmp20 from $t2 to $fp-88
	# _tmp21 = _tmp19 == _tmp20
	  lw $t0, -84($fp)	# fill _tmp19 to $t0 from $fp-84
	  lw $t1, -88($fp)	# fill _tmp20 to $t1 from $fp-88
	  seq $t2, $t0, $t1	
	  sw $t2, -92($fp)	# spill _tmp21 from $t2 to $fp-92
	# IfZ _tmp21 Goto else_38
	  lw $t0, -92($fp)	# fill _tmp21 to $t0 from $fp-92
	  beqz $t0, else_38	# branch if _tmp21 is zero 
	# _tmp22 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -96($fp)	# spill _tmp22 from $t2 to $fp-96
	# stillGoing = _tmp22
	  lw $t2, -96($fp)	# fill _tmp22 to $t2 from $fp-96
	  sw $t2, -8($fp)	# spill stillGoing from $t2 to $fp-8
  loopBegin_40:
	# _tmp23 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -100($fp)	# spill _tmp23 from $t2 to $fp-100
	# _tmp24 = 21
	  li $t2, 21		# load constant value 21 into $t2
	  sw $t2, -104($fp)	# spill _tmp24 from $t2 to $fp-104
	# _tmp25 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -108($fp)	# spill _tmp25 from $t2 to $fp-108
	# _tmp26 = _tmp23 - _tmp25
	  lw $t0, -100($fp)	# fill _tmp23 to $t0 from $fp-100
	  lw $t1, -108($fp)	# fill _tmp25 to $t1 from $fp-108
	  sub $t2, $t0, $t1	
	  sw $t2, -112($fp)	# spill _tmp26 from $t2 to $fp-112
	# _tmp27 = _tmp26 < _tmp24
	  lw $t0, -112($fp)	# fill _tmp26 to $t0 from $fp-112
	  lw $t1, -104($fp)	# fill _tmp24 to $t1 from $fp-104
	  slt $t2, $t0, $t1	
	  sw $t2, -116($fp)	# spill _tmp27 from $t2 to $fp-116
	# _tmp28 = _tmp27 && stillGoing
	  lw $t0, -116($fp)	# fill _tmp27 to $t0 from $fp-116
	  lw $t1, -8($fp)	# fill stillGoing to $t1 from $fp-8
	  and $t2, $t0, $t1	
	  sw $t2, -120($fp)	# spill _tmp28 from $t2 to $fp-120
	# IfZ _tmp28 Goto loopEnd_41
	  lw $t0, -120($fp)	# fill _tmp28 to $t0 from $fp-120
	  beqz $t0, loopEnd_41	# branch if _tmp28 is zero 
	# _tmp29 = *(this + 24)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 24($t0) 	# load with offset
	  sw $t2, -124($fp)	# spill _tmp29 from $t2 to $fp-124
	# PushParam _tmp29
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -124($fp)	# fill _tmp29 to $t0 from $fp-124
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp30 = ", your total is "
	  .data			# create string constant marked with label
	  _string24: .asciiz ", your total is "
	  .text
	  la $t2, _string24	# load label
	  sw $t2, -128($fp)	# spill _tmp30 from $t2 to $fp-128
	# PushParam _tmp30
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -128($fp)	# fill _tmp30 to $t0 from $fp-128
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp31 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -132($fp)	# spill _tmp31 from $t2 to $fp-132
	# PushParam _tmp31
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -132($fp)	# fill _tmp31 to $t0 from $fp-132
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintInt
	  jal _PrintInt      	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp32 = ".\n"
	  .data			# create string constant marked with label
	  _string25: .asciiz ".\n"
	  .text
	  la $t2, _string25	# load label
	  sw $t2, -136($fp)	# spill _tmp32 from $t2 to $fp-136
	# PushParam _tmp32
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -136($fp)	# fill _tmp32 to $t0 from $fp-136
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp33 = "Would you like a hit?"
	  .data			# create string constant marked with label
	  _string26: .asciiz "Would you like a hit?"
	  .text
	  la $t2, _string26	# load label
	  sw $t2, -140($fp)	# spill _tmp33 from $t2 to $fp-140
	# PushParam _tmp33
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -140($fp)	# fill _tmp33 to $t0 from $fp-140
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp34 = LCall _GetYesOrNo
	  jal _GetYesOrNo    	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -144($fp)	# spill _tmp34 from $t2 to $fp-144
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# stillGoing = _tmp34
	  lw $t2, -144($fp)	# fill _tmp34 to $t2 from $fp-144
	  sw $t2, -8($fp)	# spill stillGoing from $t2 to $fp-8
	# IfZ stillGoing Goto else_42
	  lw $t0, -8($fp)	# fill stillGoing to $t0 from $fp-8
	  beqz $t0, else_42	# branch if stillGoing is zero 
	# _tmp35 = *(this)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -148($fp)	# spill _tmp35 from $t2 to $fp-148
	# _tmp36 = *(_tmp35 + 4)
	  lw $t0, -148($fp)	# fill _tmp35 to $t0 from $fp-148
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -152($fp)	# spill _tmp36 from $t2 to $fp-152
	# PushParam deck
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, 8($fp)	# fill deck to $t0 from $fp+8
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam this
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  sw $t0, 4($sp)	# copy param value to stack
	# ACall _tmp36
	  lw $t0, -152($fp)	# fill _tmp36 to $t0 from $fp-152
	  jalr $t0            	# jump to function
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# Goto endif_43
	  b endif_43		# unconditional branch
  else_42:
  endif_43:
	# Goto loopBegin_40
	  b loopBegin_40		# unconditional branch
  loopEnd_41:
	# Goto endif_39
	  b endif_39		# unconditional branch
  else_38:
  endif_39:
	# _tmp37 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -156($fp)	# spill _tmp37 from $t2 to $fp-156
	# _tmp38 = 21
	  li $t2, 21		# load constant value 21 into $t2
	  sw $t2, -160($fp)	# spill _tmp38 from $t2 to $fp-160
	# _tmp39 = _tmp38 < _tmp37
	  lw $t0, -160($fp)	# fill _tmp38 to $t0 from $fp-160
	  lw $t1, -156($fp)	# fill _tmp37 to $t1 from $fp-156
	  slt $t2, $t0, $t1	
	  sw $t2, -164($fp)	# spill _tmp39 from $t2 to $fp-164
	# IfZ _tmp39 Goto else_44
	  lw $t0, -164($fp)	# fill _tmp39 to $t0 from $fp-164
	  beqz $t0, else_44	# branch if _tmp39 is zero 
	# _tmp40 = *(this + 24)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 24($t0) 	# load with offset
	  sw $t2, -168($fp)	# spill _tmp40 from $t2 to $fp-168
	# PushParam _tmp40
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -168($fp)	# fill _tmp40 to $t0 from $fp-168
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp41 = " busts with the big "
	  .data			# create string constant marked with label
	  _string27: .asciiz " busts with the big "
	  .text
	  la $t2, _string27	# load label
	  sw $t2, -172($fp)	# spill _tmp41 from $t2 to $fp-172
	# PushParam _tmp41
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -172($fp)	# fill _tmp41 to $t0 from $fp-172
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp42 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -176($fp)	# spill _tmp42 from $t2 to $fp-176
	# PushParam _tmp42
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -176($fp)	# fill _tmp42 to $t0 from $fp-176
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintInt
	  jal _PrintInt      	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp43 = "!\n"
	  .data			# create string constant marked with label
	  _string28: .asciiz "!\n"
	  .text
	  la $t2, _string28	# load label
	  sw $t2, -180($fp)	# spill _tmp43 from $t2 to $fp-180
	# PushParam _tmp43
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -180($fp)	# fill _tmp43 to $t0 from $fp-180
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# Goto endif_45
	  b endif_45		# unconditional branch
  else_44:
	# _tmp44 = *(this + 24)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 24($t0) 	# load with offset
	  sw $t2, -184($fp)	# spill _tmp44 from $t2 to $fp-184
	# PushParam _tmp44
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -184($fp)	# fill _tmp44 to $t0 from $fp-184
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp45 = " stays at "
	  .data			# create string constant marked with label
	  _string29: .asciiz " stays at "
	  .text
	  la $t2, _string29	# load label
	  sw $t2, -188($fp)	# spill _tmp45 from $t2 to $fp-188
	# PushParam _tmp45
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -188($fp)	# fill _tmp45 to $t0 from $fp-188
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp46 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -192($fp)	# spill _tmp46 from $t2 to $fp-192
	# PushParam _tmp46
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -192($fp)	# fill _tmp46 to $t0 from $fp-192
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintInt
	  jal _PrintInt      	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp47 = ".\n"
	  .data			# create string constant marked with label
	  _string30: .asciiz ".\n"
	  .text
	  la $t2, _string30	# load label
	  sw $t2, -196($fp)	# spill _tmp47 from $t2 to $fp-196
	# PushParam _tmp47
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -196($fp)	# fill _tmp47 to $t0 from $fp-196
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
  endif_45:
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  Player_HasMoney:
	# BeginFunc 12
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 12	# decrement sp to make space for locals/temps
	# _tmp0 = *(this + 20)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 20($t0) 	# load with offset
	  sw $t2, -8($fp)	# spill _tmp0 from $t2 to $fp-8
	# _tmp1 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -12($fp)	# spill _tmp1 from $t2 to $fp-12
	# _tmp2 = _tmp1 < _tmp0
	  lw $t0, -12($fp)	# fill _tmp1 to $t0 from $fp-12
	  lw $t1, -8($fp)	# fill _tmp0 to $t1 from $fp-8
	  slt $t2, $t0, $t1	
	  sw $t2, -16($fp)	# spill _tmp2 from $t2 to $fp-16
	# Return _tmp2
	  lw $t2, -16($fp)	# fill _tmp2 to $t2 from $fp-16
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
  Player_PrintMoney:
	# BeginFunc 16
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 16	# decrement sp to make space for locals/temps
	# _tmp0 = *(this + 24)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 24($t0) 	# load with offset
	  sw $t2, -8($fp)	# spill _tmp0 from $t2 to $fp-8
	# PushParam _tmp0
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -8($fp)	# fill _tmp0 to $t0 from $fp-8
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp1 = ", you have $"
	  .data			# create string constant marked with label
	  _string31: .asciiz ", you have $"
	  .text
	  la $t2, _string31	# load label
	  sw $t2, -12($fp)	# spill _tmp1 from $t2 to $fp-12
	# PushParam _tmp1
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -12($fp)	# fill _tmp1 to $t0 from $fp-12
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp2 = *(this + 20)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 20($t0) 	# load with offset
	  sw $t2, -16($fp)	# spill _tmp2 from $t2 to $fp-16
	# PushParam _tmp2
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -16($fp)	# fill _tmp2 to $t0 from $fp-16
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintInt
	  jal _PrintInt      	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp3 = ".\n"
	  .data			# create string constant marked with label
	  _string32: .asciiz ".\n"
	  .text
	  la $t2, _string32	# load label
	  sw $t2, -20($fp)	# spill _tmp3 from $t2 to $fp-20
	# PushParam _tmp3
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -20($fp)	# fill _tmp3 to $t0 from $fp-20
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
  Player_PlaceBet:
	# BeginFunc 72
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 72	# decrement sp to make space for locals/temps
	# _tmp0 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -8($fp)	# spill _tmp0 from $t2 to $fp-8
	# _tmp1 = 16
	  li $t2, 16		# load constant value 16 into $t2
	  sw $t2, -12($fp)	# spill _tmp1 from $t2 to $fp-12
	# _tmp2 = this + _tmp1
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t1, -12($fp)	# fill _tmp1 to $t1 from $fp-12
	  add $t2, $t0, $t1	
	  sw $t2, -16($fp)	# spill _tmp2 from $t2 to $fp-16
	# *(_tmp2) = _tmp0
	  lw $t0, -8($fp)	# fill _tmp0 to $t0 from $fp-8
	  lw $t2, -16($fp)	# fill _tmp2 to $t2 from $fp-16
	  sw $t0, 0($t2) 	# store with offset
	# _tmp3 = *(this)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -20($fp)	# spill _tmp3 from $t2 to $fp-20
	# _tmp4 = *(_tmp3 + 20)
	  lw $t0, -20($fp)	# fill _tmp3 to $t0 from $fp-20
	  lw $t2, 20($t0) 	# load with offset
	  sw $t2, -24($fp)	# spill _tmp4 from $t2 to $fp-24
	# PushParam this
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  sw $t0, 4($sp)	# copy param value to stack
	# ACall _tmp4
	  lw $t0, -24($fp)	# fill _tmp4 to $t0 from $fp-24
	  jalr $t0            	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
  loopBegin_46:
	# _tmp5 = *(this + 16)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 16($t0) 	# load with offset
	  sw $t2, -28($fp)	# spill _tmp5 from $t2 to $fp-28
	# _tmp6 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -32($fp)	# spill _tmp6 from $t2 to $fp-32
	# _tmp7 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -36($fp)	# spill _tmp7 from $t2 to $fp-36
	# _tmp8 = _tmp5 - _tmp7
	  lw $t0, -28($fp)	# fill _tmp5 to $t0 from $fp-28
	  lw $t1, -36($fp)	# fill _tmp7 to $t1 from $fp-36
	  sub $t2, $t0, $t1	
	  sw $t2, -40($fp)	# spill _tmp8 from $t2 to $fp-40
	# _tmp9 = _tmp8 < _tmp6
	  lw $t0, -40($fp)	# fill _tmp8 to $t0 from $fp-40
	  lw $t1, -32($fp)	# fill _tmp6 to $t1 from $fp-32
	  slt $t2, $t0, $t1	
	  sw $t2, -44($fp)	# spill _tmp9 from $t2 to $fp-44
	# _tmp10 = *(this + 16)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 16($t0) 	# load with offset
	  sw $t2, -48($fp)	# spill _tmp10 from $t2 to $fp-48
	# _tmp11 = *(this + 20)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 20($t0) 	# load with offset
	  sw $t2, -52($fp)	# spill _tmp11 from $t2 to $fp-52
	# _tmp12 = _tmp11 < _tmp10
	  lw $t0, -52($fp)	# fill _tmp11 to $t0 from $fp-52
	  lw $t1, -48($fp)	# fill _tmp10 to $t1 from $fp-48
	  slt $t2, $t0, $t1	
	  sw $t2, -56($fp)	# spill _tmp12 from $t2 to $fp-56
	# _tmp13 = _tmp9 || _tmp12
	  lw $t0, -44($fp)	# fill _tmp9 to $t0 from $fp-44
	  lw $t1, -56($fp)	# fill _tmp12 to $t1 from $fp-56
	  or $t2, $t0, $t1	
	  sw $t2, -60($fp)	# spill _tmp13 from $t2 to $fp-60
	# IfZ _tmp13 Goto loopEnd_47
	  lw $t0, -60($fp)	# fill _tmp13 to $t0 from $fp-60
	  beqz $t0, loopEnd_47	# branch if _tmp13 is zero 
	# _tmp14 = "How much would you like to bet? "
	  .data			# create string constant marked with label
	  _string33: .asciiz "How much would you like to bet? "
	  .text
	  la $t2, _string33	# load label
	  sw $t2, -64($fp)	# spill _tmp14 from $t2 to $fp-64
	# PushParam _tmp14
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -64($fp)	# fill _tmp14 to $t0 from $fp-64
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp15 = LCall _ReadInteger
	  jal _ReadInteger   	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -68($fp)	# spill _tmp15 from $t2 to $fp-68
	# _tmp16 = 16
	  li $t2, 16		# load constant value 16 into $t2
	  sw $t2, -72($fp)	# spill _tmp16 from $t2 to $fp-72
	# _tmp17 = this + _tmp16
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t1, -72($fp)	# fill _tmp16 to $t1 from $fp-72
	  add $t2, $t0, $t1	
	  sw $t2, -76($fp)	# spill _tmp17 from $t2 to $fp-76
	# *(_tmp17) = _tmp15
	  lw $t0, -68($fp)	# fill _tmp15 to $t0 from $fp-68
	  lw $t2, -76($fp)	# fill _tmp17 to $t2 from $fp-76
	  sw $t0, 0($t2) 	# store with offset
	# Goto loopBegin_46
	  b loopBegin_46		# unconditional branch
  loopEnd_47:
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  Player_GetTotal:
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
  Player_Resolve:
	# BeginFunc 208
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 208	# decrement sp to make space for locals/temps
	# _tmp2 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -16($fp)	# spill _tmp2 from $t2 to $fp-16
	# win = _tmp2
	  lw $t2, -16($fp)	# fill _tmp2 to $t2 from $fp-16
	  sw $t2, -8($fp)	# spill win from $t2 to $fp-8
	# _tmp3 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -20($fp)	# spill _tmp3 from $t2 to $fp-20
	# lose = _tmp3
	  lw $t2, -20($fp)	# fill _tmp3 to $t2 from $fp-20
	  sw $t2, -12($fp)	# spill lose from $t2 to $fp-12
	# _tmp4 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -24($fp)	# spill _tmp4 from $t2 to $fp-24
	# _tmp5 = 21
	  li $t2, 21		# load constant value 21 into $t2
	  sw $t2, -28($fp)	# spill _tmp5 from $t2 to $fp-28
	# _tmp6 = _tmp4 == _tmp5
	  lw $t0, -24($fp)	# fill _tmp4 to $t0 from $fp-24
	  lw $t1, -28($fp)	# fill _tmp5 to $t1 from $fp-28
	  seq $t2, $t0, $t1	
	  sw $t2, -32($fp)	# spill _tmp6 from $t2 to $fp-32
	# _tmp7 = *(this + 12)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 12($t0) 	# load with offset
	  sw $t2, -36($fp)	# spill _tmp7 from $t2 to $fp-36
	# _tmp8 = 2
	  li $t2, 2		# load constant value 2 into $t2
	  sw $t2, -40($fp)	# spill _tmp8 from $t2 to $fp-40
	# _tmp9 = _tmp7 == _tmp8
	  lw $t0, -36($fp)	# fill _tmp7 to $t0 from $fp-36
	  lw $t1, -40($fp)	# fill _tmp8 to $t1 from $fp-40
	  seq $t2, $t0, $t1	
	  sw $t2, -44($fp)	# spill _tmp9 from $t2 to $fp-44
	# _tmp10 = _tmp6 && _tmp9
	  lw $t0, -32($fp)	# fill _tmp6 to $t0 from $fp-32
	  lw $t1, -44($fp)	# fill _tmp9 to $t1 from $fp-44
	  and $t2, $t0, $t1	
	  sw $t2, -48($fp)	# spill _tmp10 from $t2 to $fp-48
	# IfZ _tmp10 Goto else_48
	  lw $t0, -48($fp)	# fill _tmp10 to $t0 from $fp-48
	  beqz $t0, else_48	# branch if _tmp10 is zero 
	# _tmp11 = 2
	  li $t2, 2		# load constant value 2 into $t2
	  sw $t2, -52($fp)	# spill _tmp11 from $t2 to $fp-52
	# win = _tmp11
	  lw $t2, -52($fp)	# fill _tmp11 to $t2 from $fp-52
	  sw $t2, -8($fp)	# spill win from $t2 to $fp-8
	# Goto endif_49
	  b endif_49		# unconditional branch
  else_48:
	# _tmp12 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -56($fp)	# spill _tmp12 from $t2 to $fp-56
	# _tmp13 = 21
	  li $t2, 21		# load constant value 21 into $t2
	  sw $t2, -60($fp)	# spill _tmp13 from $t2 to $fp-60
	# _tmp14 = _tmp13 < _tmp12
	  lw $t0, -60($fp)	# fill _tmp13 to $t0 from $fp-60
	  lw $t1, -56($fp)	# fill _tmp12 to $t1 from $fp-56
	  slt $t2, $t0, $t1	
	  sw $t2, -64($fp)	# spill _tmp14 from $t2 to $fp-64
	# IfZ _tmp14 Goto else_50
	  lw $t0, -64($fp)	# fill _tmp14 to $t0 from $fp-64
	  beqz $t0, else_50	# branch if _tmp14 is zero 
	# _tmp15 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -68($fp)	# spill _tmp15 from $t2 to $fp-68
	# lose = _tmp15
	  lw $t2, -68($fp)	# fill _tmp15 to $t2 from $fp-68
	  sw $t2, -12($fp)	# spill lose from $t2 to $fp-12
	# Goto endif_51
	  b endif_51		# unconditional branch
  else_50:
	# _tmp16 = 21
	  li $t2, 21		# load constant value 21 into $t2
	  sw $t2, -72($fp)	# spill _tmp16 from $t2 to $fp-72
	# _tmp17 = _tmp16 < dealer
	  lw $t0, -72($fp)	# fill _tmp16 to $t0 from $fp-72
	  lw $t1, 8($fp)	# fill dealer to $t1 from $fp+8
	  slt $t2, $t0, $t1	
	  sw $t2, -76($fp)	# spill _tmp17 from $t2 to $fp-76
	# IfZ _tmp17 Goto else_52
	  lw $t0, -76($fp)	# fill _tmp17 to $t0 from $fp-76
	  beqz $t0, else_52	# branch if _tmp17 is zero 
	# _tmp18 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -80($fp)	# spill _tmp18 from $t2 to $fp-80
	# win = _tmp18
	  lw $t2, -80($fp)	# fill _tmp18 to $t2 from $fp-80
	  sw $t2, -8($fp)	# spill win from $t2 to $fp-8
	# Goto endif_53
	  b endif_53		# unconditional branch
  else_52:
	# _tmp19 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -84($fp)	# spill _tmp19 from $t2 to $fp-84
	# _tmp20 = dealer < _tmp19
	  lw $t0, 8($fp)	# fill dealer to $t0 from $fp+8
	  lw $t1, -84($fp)	# fill _tmp19 to $t1 from $fp-84
	  slt $t2, $t0, $t1	
	  sw $t2, -88($fp)	# spill _tmp20 from $t2 to $fp-88
	# IfZ _tmp20 Goto else_54
	  lw $t0, -88($fp)	# fill _tmp20 to $t0 from $fp-88
	  beqz $t0, else_54	# branch if _tmp20 is zero 
	# _tmp21 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -92($fp)	# spill _tmp21 from $t2 to $fp-92
	# win = _tmp21
	  lw $t2, -92($fp)	# fill _tmp21 to $t2 from $fp-92
	  sw $t2, -8($fp)	# spill win from $t2 to $fp-8
	# Goto endif_55
	  b endif_55		# unconditional branch
  else_54:
	# _tmp22 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -96($fp)	# spill _tmp22 from $t2 to $fp-96
	# _tmp23 = _tmp22 < dealer
	  lw $t0, -96($fp)	# fill _tmp22 to $t0 from $fp-96
	  lw $t1, 8($fp)	# fill dealer to $t1 from $fp+8
	  slt $t2, $t0, $t1	
	  sw $t2, -100($fp)	# spill _tmp23 from $t2 to $fp-100
	# IfZ _tmp23 Goto else_56
	  lw $t0, -100($fp)	# fill _tmp23 to $t0 from $fp-100
	  beqz $t0, else_56	# branch if _tmp23 is zero 
	# _tmp24 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -104($fp)	# spill _tmp24 from $t2 to $fp-104
	# lose = _tmp24
	  lw $t2, -104($fp)	# fill _tmp24 to $t2 from $fp-104
	  sw $t2, -12($fp)	# spill lose from $t2 to $fp-12
	# Goto endif_57
	  b endif_57		# unconditional branch
  else_56:
  endif_57:
  endif_55:
  endif_53:
  endif_51:
  endif_49:
	# _tmp25 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -108($fp)	# spill _tmp25 from $t2 to $fp-108
	# _tmp26 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -112($fp)	# spill _tmp26 from $t2 to $fp-112
	# _tmp27 = _tmp25 - _tmp26
	  lw $t0, -108($fp)	# fill _tmp25 to $t0 from $fp-108
	  lw $t1, -112($fp)	# fill _tmp26 to $t1 from $fp-112
	  sub $t2, $t0, $t1	
	  sw $t2, -116($fp)	# spill _tmp27 from $t2 to $fp-116
	# _tmp28 = _tmp27 < win
	  lw $t0, -116($fp)	# fill _tmp27 to $t0 from $fp-116
	  lw $t1, -8($fp)	# fill win to $t1 from $fp-8
	  slt $t2, $t0, $t1	
	  sw $t2, -120($fp)	# spill _tmp28 from $t2 to $fp-120
	# IfZ _tmp28 Goto else_58
	  lw $t0, -120($fp)	# fill _tmp28 to $t0 from $fp-120
	  beqz $t0, else_58	# branch if _tmp28 is zero 
	# _tmp29 = *(this + 24)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 24($t0) 	# load with offset
	  sw $t2, -124($fp)	# spill _tmp29 from $t2 to $fp-124
	# PushParam _tmp29
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -124($fp)	# fill _tmp29 to $t0 from $fp-124
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp30 = ", you won $"
	  .data			# create string constant marked with label
	  _string34: .asciiz ", you won $"
	  .text
	  la $t2, _string34	# load label
	  sw $t2, -128($fp)	# spill _tmp30 from $t2 to $fp-128
	# PushParam _tmp30
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -128($fp)	# fill _tmp30 to $t0 from $fp-128
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp31 = *(this + 16)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 16($t0) 	# load with offset
	  sw $t2, -132($fp)	# spill _tmp31 from $t2 to $fp-132
	# PushParam _tmp31
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -132($fp)	# fill _tmp31 to $t0 from $fp-132
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintInt
	  jal _PrintInt      	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp32 = ".\n"
	  .data			# create string constant marked with label
	  _string35: .asciiz ".\n"
	  .text
	  la $t2, _string35	# load label
	  sw $t2, -136($fp)	# spill _tmp32 from $t2 to $fp-136
	# PushParam _tmp32
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -136($fp)	# fill _tmp32 to $t0 from $fp-136
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# Goto endif_59
	  b endif_59		# unconditional branch
  else_58:
	# _tmp33 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -140($fp)	# spill _tmp33 from $t2 to $fp-140
	# _tmp34 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -144($fp)	# spill _tmp34 from $t2 to $fp-144
	# _tmp35 = _tmp33 - _tmp34
	  lw $t0, -140($fp)	# fill _tmp33 to $t0 from $fp-140
	  lw $t1, -144($fp)	# fill _tmp34 to $t1 from $fp-144
	  sub $t2, $t0, $t1	
	  sw $t2, -148($fp)	# spill _tmp35 from $t2 to $fp-148
	# _tmp36 = _tmp35 < lose
	  lw $t0, -148($fp)	# fill _tmp35 to $t0 from $fp-148
	  lw $t1, -12($fp)	# fill lose to $t1 from $fp-12
	  slt $t2, $t0, $t1	
	  sw $t2, -152($fp)	# spill _tmp36 from $t2 to $fp-152
	# IfZ _tmp36 Goto else_60
	  lw $t0, -152($fp)	# fill _tmp36 to $t0 from $fp-152
	  beqz $t0, else_60	# branch if _tmp36 is zero 
	# _tmp37 = *(this + 24)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 24($t0) 	# load with offset
	  sw $t2, -156($fp)	# spill _tmp37 from $t2 to $fp-156
	# PushParam _tmp37
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -156($fp)	# fill _tmp37 to $t0 from $fp-156
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp38 = ", you lost $"
	  .data			# create string constant marked with label
	  _string36: .asciiz ", you lost $"
	  .text
	  la $t2, _string36	# load label
	  sw $t2, -160($fp)	# spill _tmp38 from $t2 to $fp-160
	# PushParam _tmp38
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -160($fp)	# fill _tmp38 to $t0 from $fp-160
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp39 = *(this + 16)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 16($t0) 	# load with offset
	  sw $t2, -164($fp)	# spill _tmp39 from $t2 to $fp-164
	# PushParam _tmp39
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -164($fp)	# fill _tmp39 to $t0 from $fp-164
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintInt
	  jal _PrintInt      	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp40 = ".\n"
	  .data			# create string constant marked with label
	  _string37: .asciiz ".\n"
	  .text
	  la $t2, _string37	# load label
	  sw $t2, -168($fp)	# spill _tmp40 from $t2 to $fp-168
	# PushParam _tmp40
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -168($fp)	# fill _tmp40 to $t0 from $fp-168
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# Goto endif_61
	  b endif_61		# unconditional branch
  else_60:
	# _tmp41 = *(this + 24)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 24($t0) 	# load with offset
	  sw $t2, -172($fp)	# spill _tmp41 from $t2 to $fp-172
	# PushParam _tmp41
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -172($fp)	# fill _tmp41 to $t0 from $fp-172
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp42 = ", you push!\n"
	  .data			# create string constant marked with label
	  _string38: .asciiz ", you push!\n"
	  .text
	  la $t2, _string38	# load label
	  sw $t2, -176($fp)	# spill _tmp42 from $t2 to $fp-176
	# PushParam _tmp42
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -176($fp)	# fill _tmp42 to $t0 from $fp-176
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
  endif_61:
  endif_59:
	# _tmp43 = *(this + 16)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 16($t0) 	# load with offset
	  sw $t2, -180($fp)	# spill _tmp43 from $t2 to $fp-180
	# _tmp44 = win * _tmp43
	  lw $t0, -8($fp)	# fill win to $t0 from $fp-8
	  lw $t1, -180($fp)	# fill _tmp43 to $t1 from $fp-180
	  mul $t2, $t0, $t1	
	  sw $t2, -184($fp)	# spill _tmp44 from $t2 to $fp-184
	# win = _tmp44
	  lw $t2, -184($fp)	# fill _tmp44 to $t2 from $fp-184
	  sw $t2, -8($fp)	# spill win from $t2 to $fp-8
	# _tmp45 = *(this + 16)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 16($t0) 	# load with offset
	  sw $t2, -188($fp)	# spill _tmp45 from $t2 to $fp-188
	# _tmp46 = lose * _tmp45
	  lw $t0, -12($fp)	# fill lose to $t0 from $fp-12
	  lw $t1, -188($fp)	# fill _tmp45 to $t1 from $fp-188
	  mul $t2, $t0, $t1	
	  sw $t2, -192($fp)	# spill _tmp46 from $t2 to $fp-192
	# lose = _tmp46
	  lw $t2, -192($fp)	# fill _tmp46 to $t2 from $fp-192
	  sw $t2, -12($fp)	# spill lose from $t2 to $fp-12
	# _tmp47 = *(this + 20)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 20($t0) 	# load with offset
	  sw $t2, -196($fp)	# spill _tmp47 from $t2 to $fp-196
	# _tmp48 = _tmp47 + win
	  lw $t0, -196($fp)	# fill _tmp47 to $t0 from $fp-196
	  lw $t1, -8($fp)	# fill win to $t1 from $fp-8
	  add $t2, $t0, $t1	
	  sw $t2, -200($fp)	# spill _tmp48 from $t2 to $fp-200
	# _tmp49 = _tmp48 - lose
	  lw $t0, -200($fp)	# fill _tmp48 to $t0 from $fp-200
	  lw $t1, -12($fp)	# fill lose to $t1 from $fp-12
	  sub $t2, $t0, $t1	
	  sw $t2, -204($fp)	# spill _tmp49 from $t2 to $fp-204
	# _tmp50 = 20
	  li $t2, 20		# load constant value 20 into $t2
	  sw $t2, -208($fp)	# spill _tmp50 from $t2 to $fp-208
	# _tmp51 = this + _tmp50
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t1, -208($fp)	# fill _tmp50 to $t1 from $fp-208
	  add $t2, $t0, $t1	
	  sw $t2, -212($fp)	# spill _tmp51 from $t2 to $fp-212
	# *(_tmp51) = _tmp49
	  lw $t0, -204($fp)	# fill _tmp49 to $t0 from $fp-204
	  lw $t2, -212($fp)	# fill _tmp51 to $t2 from $fp-212
	  sw $t0, 0($t2) 	# store with offset
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# VTable for class Player
	  .data
	  .align 2
	  Player:		# label for class Player vtable
	  .word Player_Init
	  .word Player_Hit
	  .word Player_DoubleDown
	  .word Player_TakeTurn
	  .word Player_HasMoney
	  .word Player_PrintMoney
	  .word Player_PlaceBet
	  .word Player_GetTotal
	  .word Player_Resolve
	  .text
  Dealer_Init:
	# BeginFunc 48
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 48	# decrement sp to make space for locals/temps
	# _tmp0 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -8($fp)	# spill _tmp0 from $t2 to $fp-8
	# _tmp1 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -12($fp)	# spill _tmp1 from $t2 to $fp-12
	# _tmp2 = this + _tmp1
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t1, -12($fp)	# fill _tmp1 to $t1 from $fp-12
	  add $t2, $t0, $t1	
	  sw $t2, -16($fp)	# spill _tmp2 from $t2 to $fp-16
	# *(_tmp2) = _tmp0
	  lw $t0, -8($fp)	# fill _tmp0 to $t0 from $fp-8
	  lw $t2, -16($fp)	# fill _tmp2 to $t2 from $fp-16
	  sw $t0, 0($t2) 	# store with offset
	# _tmp3 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -20($fp)	# spill _tmp3 from $t2 to $fp-20
	# _tmp4 = 8
	  li $t2, 8		# load constant value 8 into $t2
	  sw $t2, -24($fp)	# spill _tmp4 from $t2 to $fp-24
	# _tmp5 = this + _tmp4
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t1, -24($fp)	# fill _tmp4 to $t1 from $fp-24
	  add $t2, $t0, $t1	
	  sw $t2, -28($fp)	# spill _tmp5 from $t2 to $fp-28
	# *(_tmp5) = _tmp3
	  lw $t0, -20($fp)	# fill _tmp3 to $t0 from $fp-20
	  lw $t2, -28($fp)	# fill _tmp5 to $t2 from $fp-28
	  sw $t0, 0($t2) 	# store with offset
	# _tmp6 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -32($fp)	# spill _tmp6 from $t2 to $fp-32
	# _tmp7 = 12
	  li $t2, 12		# load constant value 12 into $t2
	  sw $t2, -36($fp)	# spill _tmp7 from $t2 to $fp-36
	# _tmp8 = this + _tmp7
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t1, -36($fp)	# fill _tmp7 to $t1 from $fp-36
	  add $t2, $t0, $t1	
	  sw $t2, -40($fp)	# spill _tmp8 from $t2 to $fp-40
	# *(_tmp8) = _tmp6
	  lw $t0, -32($fp)	# fill _tmp6 to $t0 from $fp-32
	  lw $t2, -40($fp)	# fill _tmp8 to $t2 from $fp-40
	  sw $t0, 0($t2) 	# store with offset
	# _tmp9 = "Dealer"
	  .data			# create string constant marked with label
	  _string39: .asciiz "Dealer"
	  .text
	  la $t2, _string39	# load label
	  sw $t2, -44($fp)	# spill _tmp9 from $t2 to $fp-44
	# _tmp10 = 24
	  li $t2, 24		# load constant value 24 into $t2
	  sw $t2, -48($fp)	# spill _tmp10 from $t2 to $fp-48
	# _tmp11 = this + _tmp10
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t1, -48($fp)	# fill _tmp10 to $t1 from $fp-48
	  add $t2, $t0, $t1	
	  sw $t2, -52($fp)	# spill _tmp11 from $t2 to $fp-52
	# *(_tmp11) = _tmp9
	  lw $t0, -44($fp)	# fill _tmp9 to $t0 from $fp-44
	  lw $t2, -52($fp)	# fill _tmp11 to $t2 from $fp-52
	  sw $t0, 0($t2) 	# store with offset
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  Dealer_TakeTurn:
	# BeginFunc 84
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 84	# decrement sp to make space for locals/temps
	# _tmp0 = "\n"
	  .data			# create string constant marked with label
	  _string40: .asciiz "\n"
	  .text
	  la $t2, _string40	# load label
	  sw $t2, -8($fp)	# spill _tmp0 from $t2 to $fp-8
	# PushParam _tmp0
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -8($fp)	# fill _tmp0 to $t0 from $fp-8
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp1 = *(this + 24)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 24($t0) 	# load with offset
	  sw $t2, -12($fp)	# spill _tmp1 from $t2 to $fp-12
	# PushParam _tmp1
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -12($fp)	# fill _tmp1 to $t0 from $fp-12
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp2 = "'s turn.\n"
	  .data			# create string constant marked with label
	  _string41: .asciiz "'s turn.\n"
	  .text
	  la $t2, _string41	# load label
	  sw $t2, -16($fp)	# spill _tmp2 from $t2 to $fp-16
	# PushParam _tmp2
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -16($fp)	# fill _tmp2 to $t0 from $fp-16
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
  loopBegin_62:
	# _tmp3 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -20($fp)	# spill _tmp3 from $t2 to $fp-20
	# _tmp4 = 16
	  li $t2, 16		# load constant value 16 into $t2
	  sw $t2, -24($fp)	# spill _tmp4 from $t2 to $fp-24
	# _tmp5 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -28($fp)	# spill _tmp5 from $t2 to $fp-28
	# _tmp6 = _tmp3 - _tmp5
	  lw $t0, -20($fp)	# fill _tmp3 to $t0 from $fp-20
	  lw $t1, -28($fp)	# fill _tmp5 to $t1 from $fp-28
	  sub $t2, $t0, $t1	
	  sw $t2, -32($fp)	# spill _tmp6 from $t2 to $fp-32
	# _tmp7 = _tmp6 < _tmp4
	  lw $t0, -32($fp)	# fill _tmp6 to $t0 from $fp-32
	  lw $t1, -24($fp)	# fill _tmp4 to $t1 from $fp-24
	  slt $t2, $t0, $t1	
	  sw $t2, -36($fp)	# spill _tmp7 from $t2 to $fp-36
	# IfZ _tmp7 Goto loopEnd_63
	  lw $t0, -36($fp)	# fill _tmp7 to $t0 from $fp-36
	  beqz $t0, loopEnd_63	# branch if _tmp7 is zero 
	# _tmp8 = *(this)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -40($fp)	# spill _tmp8 from $t2 to $fp-40
	# _tmp9 = *(_tmp8 + 4)
	  lw $t0, -40($fp)	# fill _tmp8 to $t0 from $fp-40
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -44($fp)	# spill _tmp9 from $t2 to $fp-44
	# PushParam deck
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, 8($fp)	# fill deck to $t0 from $fp+8
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam this
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  sw $t0, 4($sp)	# copy param value to stack
	# ACall _tmp9
	  lw $t0, -44($fp)	# fill _tmp9 to $t0 from $fp-44
	  jalr $t0            	# jump to function
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# Goto loopBegin_62
	  b loopBegin_62		# unconditional branch
  loopEnd_63:
	# _tmp10 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -48($fp)	# spill _tmp10 from $t2 to $fp-48
	# _tmp11 = 21
	  li $t2, 21		# load constant value 21 into $t2
	  sw $t2, -52($fp)	# spill _tmp11 from $t2 to $fp-52
	# _tmp12 = _tmp11 < _tmp10
	  lw $t0, -52($fp)	# fill _tmp11 to $t0 from $fp-52
	  lw $t1, -48($fp)	# fill _tmp10 to $t1 from $fp-48
	  slt $t2, $t0, $t1	
	  sw $t2, -56($fp)	# spill _tmp12 from $t2 to $fp-56
	# IfZ _tmp12 Goto else_64
	  lw $t0, -56($fp)	# fill _tmp12 to $t0 from $fp-56
	  beqz $t0, else_64	# branch if _tmp12 is zero 
	# _tmp13 = *(this + 24)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 24($t0) 	# load with offset
	  sw $t2, -60($fp)	# spill _tmp13 from $t2 to $fp-60
	# PushParam _tmp13
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -60($fp)	# fill _tmp13 to $t0 from $fp-60
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp14 = " busts with the big "
	  .data			# create string constant marked with label
	  _string42: .asciiz " busts with the big "
	  .text
	  la $t2, _string42	# load label
	  sw $t2, -64($fp)	# spill _tmp14 from $t2 to $fp-64
	# PushParam _tmp14
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -64($fp)	# fill _tmp14 to $t0 from $fp-64
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp15 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -68($fp)	# spill _tmp15 from $t2 to $fp-68
	# PushParam _tmp15
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -68($fp)	# fill _tmp15 to $t0 from $fp-68
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintInt
	  jal _PrintInt      	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp16 = "!\n"
	  .data			# create string constant marked with label
	  _string43: .asciiz "!\n"
	  .text
	  la $t2, _string43	# load label
	  sw $t2, -72($fp)	# spill _tmp16 from $t2 to $fp-72
	# PushParam _tmp16
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -72($fp)	# fill _tmp16 to $t0 from $fp-72
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# Goto endif_65
	  b endif_65		# unconditional branch
  else_64:
	# _tmp17 = *(this + 24)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 24($t0) 	# load with offset
	  sw $t2, -76($fp)	# spill _tmp17 from $t2 to $fp-76
	# PushParam _tmp17
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -76($fp)	# fill _tmp17 to $t0 from $fp-76
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp18 = " stays at "
	  .data			# create string constant marked with label
	  _string44: .asciiz " stays at "
	  .text
	  la $t2, _string44	# load label
	  sw $t2, -80($fp)	# spill _tmp18 from $t2 to $fp-80
	# PushParam _tmp18
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -80($fp)	# fill _tmp18 to $t0 from $fp-80
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp19 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -84($fp)	# spill _tmp19 from $t2 to $fp-84
	# PushParam _tmp19
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -84($fp)	# fill _tmp19 to $t0 from $fp-84
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintInt
	  jal _PrintInt      	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp20 = ".\n"
	  .data			# create string constant marked with label
	  _string45: .asciiz ".\n"
	  .text
	  la $t2, _string45	# load label
	  sw $t2, -88($fp)	# spill _tmp20 from $t2 to $fp-88
	# PushParam _tmp20
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -88($fp)	# fill _tmp20 to $t0 from $fp-88
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
  endif_65:
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# VTable for class Dealer
	  .data
	  .align 2
	  Dealer:		# label for class Dealer vtable
	  .word Dealer_Init
	  .word Player_Hit
	  .word Player_DoubleDown
	  .word Dealer_TakeTurn
	  .word Player_HasMoney
	  .word Player_PrintMoney
	  .word Player_PlaceBet
	  .word Player_GetTotal
	  .word Player_Resolve
	  .text
  House_SetupGame:
	# BeginFunc 100
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 100	# decrement sp to make space for locals/temps
	# _tmp0 = "\nWelcome to CS143 BlackJack!\n"
	  .data			# create string constant marked with label
	  _string46: .asciiz "\nWelcome to CS143 BlackJack!\n"
	  .text
	  la $t2, _string46	# load label
	  sw $t2, -8($fp)	# spill _tmp0 from $t2 to $fp-8
	# PushParam _tmp0
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -8($fp)	# fill _tmp0 to $t0 from $fp-8
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp1 = "---------------------------\n"
	  .data			# create string constant marked with label
	  _string47: .asciiz "---------------------------\n"
	  .text
	  la $t2, _string47	# load label
	  sw $t2, -12($fp)	# spill _tmp1 from $t2 to $fp-12
	# PushParam _tmp1
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -12($fp)	# fill _tmp1 to $t0 from $fp-12
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp2 = 8
	  li $t2, 8		# load constant value 8 into $t2
	  sw $t2, -16($fp)	# spill _tmp2 from $t2 to $fp-16
	# PushParam _tmp2
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -16($fp)	# fill _tmp2 to $t0 from $fp-16
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp3 = LCall _Alloc
	  jal _Alloc         	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -20($fp)	# spill _tmp3 from $t2 to $fp-20
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp4 = Random
	  la $t2, Random	# load label
	  sw $t2, -24($fp)	# spill _tmp4 from $t2 to $fp-24
	# *(_tmp3) = _tmp4
	  lw $t0, -24($fp)	# fill _tmp4 to $t0 from $fp-24
	  lw $t2, -20($fp)	# fill _tmp3 to $t2 from $fp-20
	  sw $t0, 0($t2) 	# store with offset
	# gRnd = _tmp3
	  lw $t2, -20($fp)	# fill _tmp3 to $t2 from $fp-20
	  sw $t2, 0($gp)	# spill gRnd from $t2 to $gp+0
	# _tmp5 = "Please enter a random number seed: "
	  .data			# create string constant marked with label
	  _string48: .asciiz "Please enter a random number seed: "
	  .text
	  la $t2, _string48	# load label
	  sw $t2, -28($fp)	# spill _tmp5 from $t2 to $fp-28
	# PushParam _tmp5
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -28($fp)	# fill _tmp5 to $t0 from $fp-28
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp6 = LCall _ReadInteger
	  jal _ReadInteger   	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -32($fp)	# spill _tmp6 from $t2 to $fp-32
	# _tmp7 = *(gRnd)
	  lw $t0, 0($gp)	# fill gRnd to $t0 from $gp+0
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -36($fp)	# spill _tmp7 from $t2 to $fp-36
	# _tmp8 = *(_tmp7)
	  lw $t0, -36($fp)	# fill _tmp7 to $t0 from $fp-36
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -40($fp)	# spill _tmp8 from $t2 to $fp-40
	# PushParam _tmp6
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -32($fp)	# fill _tmp6 to $t0 from $fp-32
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam gRnd
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, 0($gp)	# fill gRnd to $t0 from $gp+0
	  sw $t0, 4($sp)	# copy param value to stack
	# ACall _tmp8
	  lw $t0, -40($fp)	# fill _tmp8 to $t0 from $fp-40
	  jalr $t0            	# jump to function
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# _tmp9 = 12
	  li $t2, 12		# load constant value 12 into $t2
	  sw $t2, -44($fp)	# spill _tmp9 from $t2 to $fp-44
	# PushParam _tmp9
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -44($fp)	# fill _tmp9 to $t0 from $fp-44
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp10 = LCall _Alloc
	  jal _Alloc         	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -48($fp)	# spill _tmp10 from $t2 to $fp-48
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp11 = BJDeck
	  la $t2, BJDeck	# load label
	  sw $t2, -52($fp)	# spill _tmp11 from $t2 to $fp-52
	# *(_tmp10) = _tmp11
	  lw $t0, -52($fp)	# fill _tmp11 to $t0 from $fp-52
	  lw $t2, -48($fp)	# fill _tmp10 to $t2 from $fp-48
	  sw $t0, 0($t2) 	# store with offset
	# _tmp12 = 12
	  li $t2, 12		# load constant value 12 into $t2
	  sw $t2, -56($fp)	# spill _tmp12 from $t2 to $fp-56
	# _tmp13 = this + _tmp12
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t1, -56($fp)	# fill _tmp12 to $t1 from $fp-56
	  add $t2, $t0, $t1	
	  sw $t2, -60($fp)	# spill _tmp13 from $t2 to $fp-60
	# *(_tmp13) = _tmp10
	  lw $t0, -48($fp)	# fill _tmp10 to $t0 from $fp-48
	  lw $t2, -60($fp)	# fill _tmp13 to $t2 from $fp-60
	  sw $t0, 0($t2) 	# store with offset
	# _tmp14 = 28
	  li $t2, 28		# load constant value 28 into $t2
	  sw $t2, -64($fp)	# spill _tmp14 from $t2 to $fp-64
	# PushParam _tmp14
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -64($fp)	# fill _tmp14 to $t0 from $fp-64
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp15 = LCall _Alloc
	  jal _Alloc         	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -68($fp)	# spill _tmp15 from $t2 to $fp-68
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp16 = Dealer
	  la $t2, Dealer	# load label
	  sw $t2, -72($fp)	# spill _tmp16 from $t2 to $fp-72
	# *(_tmp15) = _tmp16
	  lw $t0, -72($fp)	# fill _tmp16 to $t0 from $fp-72
	  lw $t2, -68($fp)	# fill _tmp15 to $t2 from $fp-68
	  sw $t0, 0($t2) 	# store with offset
	# _tmp17 = 8
	  li $t2, 8		# load constant value 8 into $t2
	  sw $t2, -76($fp)	# spill _tmp17 from $t2 to $fp-76
	# _tmp18 = this + _tmp17
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t1, -76($fp)	# fill _tmp17 to $t1 from $fp-76
	  add $t2, $t0, $t1	
	  sw $t2, -80($fp)	# spill _tmp18 from $t2 to $fp-80
	# *(_tmp18) = _tmp15
	  lw $t0, -68($fp)	# fill _tmp15 to $t0 from $fp-68
	  lw $t2, -80($fp)	# fill _tmp18 to $t2 from $fp-80
	  sw $t0, 0($t2) 	# store with offset
	# _tmp19 = *(this + 12)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 12($t0) 	# load with offset
	  sw $t2, -84($fp)	# spill _tmp19 from $t2 to $fp-84
	# _tmp20 = *(_tmp19)
	  lw $t0, -84($fp)	# fill _tmp19 to $t0 from $fp-84
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -88($fp)	# spill _tmp20 from $t2 to $fp-88
	# _tmp21 = *(_tmp20)
	  lw $t0, -88($fp)	# fill _tmp20 to $t0 from $fp-88
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -92($fp)	# spill _tmp21 from $t2 to $fp-92
	# PushParam _tmp19
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -84($fp)	# fill _tmp19 to $t0 from $fp-84
	  sw $t0, 4($sp)	# copy param value to stack
	# ACall _tmp21
	  lw $t0, -92($fp)	# fill _tmp21 to $t0 from $fp-92
	  jalr $t0            	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp22 = *(this + 12)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 12($t0) 	# load with offset
	  sw $t2, -96($fp)	# spill _tmp22 from $t2 to $fp-96
	# _tmp23 = *(_tmp22)
	  lw $t0, -96($fp)	# fill _tmp22 to $t0 from $fp-96
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -100($fp)	# spill _tmp23 from $t2 to $fp-100
	# _tmp24 = *(_tmp23 + 8)
	  lw $t0, -100($fp)	# fill _tmp23 to $t0 from $fp-100
	  lw $t2, 8($t0) 	# load with offset
	  sw $t2, -104($fp)	# spill _tmp24 from $t2 to $fp-104
	# PushParam _tmp22
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -96($fp)	# fill _tmp22 to $t0 from $fp-96
	  sw $t0, 4($sp)	# copy param value to stack
	# ACall _tmp24
	  lw $t0, -104($fp)	# fill _tmp24 to $t0 from $fp-104
	  jalr $t0            	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  House_SetupPlayers:
	# BeginFunc 212
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 212	# decrement sp to make space for locals/temps
	# _tmp2 = "How many players do we have today? "
	  .data			# create string constant marked with label
	  _string49: .asciiz "How many players do we have today? "
	  .text
	  la $t2, _string49	# load label
	  sw $t2, -16($fp)	# spill _tmp2 from $t2 to $fp-16
	# PushParam _tmp2
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -16($fp)	# fill _tmp2 to $t0 from $fp-16
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp3 = LCall _ReadInteger
	  jal _ReadInteger   	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -20($fp)	# spill _tmp3 from $t2 to $fp-20
	# numPlayers = _tmp3
	  lw $t2, -20($fp)	# fill _tmp3 to $t2 from $fp-20
	  sw $t2, -12($fp)	# spill numPlayers from $t2 to $fp-12
	# _tmp4 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -24($fp)	# spill _tmp4 from $t2 to $fp-24
	# _tmp5 = numPlayers < _tmp4
	  lw $t0, -12($fp)	# fill numPlayers to $t0 from $fp-12
	  lw $t1, -24($fp)	# fill _tmp4 to $t1 from $fp-24
	  slt $t2, $t0, $t1	
	  sw $t2, -28($fp)	# spill _tmp5 from $t2 to $fp-28
	# IfZ _tmp5 Goto allocate_66
	  lw $t0, -28($fp)	# fill _tmp5 to $t0 from $fp-28
	  beqz $t0, allocate_66	# branch if _tmp5 is zero 
	# _tmp6 = "Decaf runtime error: Array size is <= 0\n"
	  .data			# create string constant marked with label
	  _string50: .asciiz "Decaf runtime error: Array size is <= 0\n"
	  .text
	  la $t2, _string50	# load label
	  sw $t2, -32($fp)	# spill _tmp6 from $t2 to $fp-32
	# PushParam _tmp6
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -32($fp)	# fill _tmp6 to $t0 from $fp-32
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  allocate_66:
	# _tmp7 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -36($fp)	# spill _tmp7 from $t2 to $fp-36
	# _tmp8 = numPlayers * _tmp7
	  lw $t0, -12($fp)	# fill numPlayers to $t0 from $fp-12
	  lw $t1, -36($fp)	# fill _tmp7 to $t1 from $fp-36
	  mul $t2, $t0, $t1	
	  sw $t2, -40($fp)	# spill _tmp8 from $t2 to $fp-40
	# _tmp9 = _tmp8 + _tmp7
	  lw $t0, -40($fp)	# fill _tmp8 to $t0 from $fp-40
	  lw $t1, -36($fp)	# fill _tmp7 to $t1 from $fp-36
	  add $t2, $t0, $t1	
	  sw $t2, -44($fp)	# spill _tmp9 from $t2 to $fp-44
	# PushParam _tmp9
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -44($fp)	# fill _tmp9 to $t0 from $fp-44
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp10 = LCall _Alloc
	  jal _Alloc         	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -48($fp)	# spill _tmp10 from $t2 to $fp-48
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# *(_tmp10) = numPlayers
	  lw $t0, -12($fp)	# fill numPlayers to $t0 from $fp-12
	  lw $t2, -48($fp)	# fill _tmp10 to $t2 from $fp-48
	  sw $t0, 0($t2) 	# store with offset
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
	# _tmp13 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -60($fp)	# spill _tmp13 from $t2 to $fp-60
	# i = _tmp13
	  lw $t2, -60($fp)	# fill _tmp13 to $t2 from $fp-60
	  sw $t2, -8($fp)	# spill i from $t2 to $fp-8
  loopBegin_67:
	# _tmp14 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -64($fp)	# spill _tmp14 from $t2 to $fp-64
	# _tmp15 = *(_tmp14)
	  lw $t0, -64($fp)	# fill _tmp14 to $t0 from $fp-64
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -68($fp)	# spill _tmp15 from $t2 to $fp-68
	# _tmp16 = i < _tmp15
	  lw $t0, -8($fp)	# fill i to $t0 from $fp-8
	  lw $t1, -68($fp)	# fill _tmp15 to $t1 from $fp-68
	  slt $t2, $t0, $t1	
	  sw $t2, -72($fp)	# spill _tmp16 from $t2 to $fp-72
	# IfZ _tmp16 Goto loopEnd_68
	  lw $t0, -72($fp)	# fill _tmp16 to $t0 from $fp-72
	  beqz $t0, loopEnd_68	# branch if _tmp16 is zero 
	# _tmp17 = 28
	  li $t2, 28		# load constant value 28 into $t2
	  sw $t2, -76($fp)	# spill _tmp17 from $t2 to $fp-76
	# PushParam _tmp17
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -76($fp)	# fill _tmp17 to $t0 from $fp-76
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp18 = LCall _Alloc
	  jal _Alloc         	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -80($fp)	# spill _tmp18 from $t2 to $fp-80
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp19 = Player
	  la $t2, Player	# load label
	  sw $t2, -84($fp)	# spill _tmp19 from $t2 to $fp-84
	# *(_tmp18) = _tmp19
	  lw $t0, -84($fp)	# fill _tmp19 to $t0 from $fp-84
	  lw $t2, -80($fp)	# fill _tmp18 to $t2 from $fp-80
	  sw $t0, 0($t2) 	# store with offset
	# _tmp20 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -88($fp)	# spill _tmp20 from $t2 to $fp-88
	# _tmp21 = *(_tmp20)
	  lw $t0, -88($fp)	# fill _tmp20 to $t0 from $fp-88
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -92($fp)	# spill _tmp21 from $t2 to $fp-92
	# _tmp22 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -96($fp)	# spill _tmp22 from $t2 to $fp-96
	# _tmp23 = i < _tmp22
	  lw $t0, -8($fp)	# fill i to $t0 from $fp-8
	  lw $t1, -96($fp)	# fill _tmp22 to $t1 from $fp-96
	  slt $t2, $t0, $t1	
	  sw $t2, -100($fp)	# spill _tmp23 from $t2 to $fp-100
	# _tmp24 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -104($fp)	# spill _tmp24 from $t2 to $fp-104
	# _tmp25 = _tmp21 - _tmp24
	  lw $t0, -92($fp)	# fill _tmp21 to $t0 from $fp-92
	  lw $t1, -104($fp)	# fill _tmp24 to $t1 from $fp-104
	  sub $t2, $t0, $t1	
	  sw $t2, -108($fp)	# spill _tmp25 from $t2 to $fp-108
	# _tmp26 = _tmp25 < i
	  lw $t0, -108($fp)	# fill _tmp25 to $t0 from $fp-108
	  lw $t1, -8($fp)	# fill i to $t1 from $fp-8
	  slt $t2, $t0, $t1	
	  sw $t2, -112($fp)	# spill _tmp26 from $t2 to $fp-112
	# _tmp27 = _tmp23 || _tmp26
	  lw $t0, -100($fp)	# fill _tmp23 to $t0 from $fp-100
	  lw $t1, -112($fp)	# fill _tmp26 to $t1 from $fp-112
	  or $t2, $t0, $t1	
	  sw $t2, -116($fp)	# spill _tmp27 from $t2 to $fp-116
	# IfZ _tmp27 Goto arrayAcc_69
	  lw $t0, -116($fp)	# fill _tmp27 to $t0 from $fp-116
	  beqz $t0, arrayAcc_69	# branch if _tmp27 is zero 
	# _tmp28 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string51: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string51	# load label
	  sw $t2, -120($fp)	# spill _tmp28 from $t2 to $fp-120
	# PushParam _tmp28
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -120($fp)	# fill _tmp28 to $t0 from $fp-120
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_69:
	# _tmp29 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -124($fp)	# spill _tmp29 from $t2 to $fp-124
	# _tmp30 = i * _tmp29
	  lw $t0, -8($fp)	# fill i to $t0 from $fp-8
	  lw $t1, -124($fp)	# fill _tmp29 to $t1 from $fp-124
	  mul $t2, $t0, $t1	
	  sw $t2, -128($fp)	# spill _tmp30 from $t2 to $fp-128
	# _tmp31 = _tmp20 + _tmp30
	  lw $t0, -88($fp)	# fill _tmp20 to $t0 from $fp-88
	  lw $t1, -128($fp)	# fill _tmp30 to $t1 from $fp-128
	  add $t2, $t0, $t1	
	  sw $t2, -132($fp)	# spill _tmp31 from $t2 to $fp-132
	# _tmp32 = _tmp31 + _tmp29
	  lw $t0, -132($fp)	# fill _tmp31 to $t0 from $fp-132
	  lw $t1, -124($fp)	# fill _tmp29 to $t1 from $fp-124
	  add $t2, $t0, $t1	
	  sw $t2, -136($fp)	# spill _tmp32 from $t2 to $fp-136
	# *(_tmp32) = _tmp18
	  lw $t0, -80($fp)	# fill _tmp18 to $t0 from $fp-80
	  lw $t2, -136($fp)	# fill _tmp32 to $t2 from $fp-136
	  sw $t0, 0($t2) 	# store with offset
	# _tmp33 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -140($fp)	# spill _tmp33 from $t2 to $fp-140
	# _tmp34 = *(_tmp33)
	  lw $t0, -140($fp)	# fill _tmp33 to $t0 from $fp-140
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -144($fp)	# spill _tmp34 from $t2 to $fp-144
	# _tmp35 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -148($fp)	# spill _tmp35 from $t2 to $fp-148
	# _tmp36 = i < _tmp35
	  lw $t0, -8($fp)	# fill i to $t0 from $fp-8
	  lw $t1, -148($fp)	# fill _tmp35 to $t1 from $fp-148
	  slt $t2, $t0, $t1	
	  sw $t2, -152($fp)	# spill _tmp36 from $t2 to $fp-152
	# _tmp37 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -156($fp)	# spill _tmp37 from $t2 to $fp-156
	# _tmp38 = _tmp34 - _tmp37
	  lw $t0, -144($fp)	# fill _tmp34 to $t0 from $fp-144
	  lw $t1, -156($fp)	# fill _tmp37 to $t1 from $fp-156
	  sub $t2, $t0, $t1	
	  sw $t2, -160($fp)	# spill _tmp38 from $t2 to $fp-160
	# _tmp39 = _tmp38 < i
	  lw $t0, -160($fp)	# fill _tmp38 to $t0 from $fp-160
	  lw $t1, -8($fp)	# fill i to $t1 from $fp-8
	  slt $t2, $t0, $t1	
	  sw $t2, -164($fp)	# spill _tmp39 from $t2 to $fp-164
	# _tmp40 = _tmp36 || _tmp39
	  lw $t0, -152($fp)	# fill _tmp36 to $t0 from $fp-152
	  lw $t1, -164($fp)	# fill _tmp39 to $t1 from $fp-164
	  or $t2, $t0, $t1	
	  sw $t2, -168($fp)	# spill _tmp40 from $t2 to $fp-168
	# IfZ _tmp40 Goto arrayAcc_70
	  lw $t0, -168($fp)	# fill _tmp40 to $t0 from $fp-168
	  beqz $t0, arrayAcc_70	# branch if _tmp40 is zero 
	# _tmp41 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string52: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string52	# load label
	  sw $t2, -172($fp)	# spill _tmp41 from $t2 to $fp-172
	# PushParam _tmp41
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -172($fp)	# fill _tmp41 to $t0 from $fp-172
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_70:
	# _tmp42 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -176($fp)	# spill _tmp42 from $t2 to $fp-176
	# _tmp43 = i * _tmp42
	  lw $t0, -8($fp)	# fill i to $t0 from $fp-8
	  lw $t1, -176($fp)	# fill _tmp42 to $t1 from $fp-176
	  mul $t2, $t0, $t1	
	  sw $t2, -180($fp)	# spill _tmp43 from $t2 to $fp-180
	# _tmp44 = _tmp33 + _tmp43
	  lw $t0, -140($fp)	# fill _tmp33 to $t0 from $fp-140
	  lw $t1, -180($fp)	# fill _tmp43 to $t1 from $fp-180
	  add $t2, $t0, $t1	
	  sw $t2, -184($fp)	# spill _tmp44 from $t2 to $fp-184
	# _tmp45 = _tmp44 + _tmp42
	  lw $t0, -184($fp)	# fill _tmp44 to $t0 from $fp-184
	  lw $t1, -176($fp)	# fill _tmp42 to $t1 from $fp-176
	  add $t2, $t0, $t1	
	  sw $t2, -188($fp)	# spill _tmp45 from $t2 to $fp-188
	# _tmp46 = *(_tmp45)
	  lw $t0, -188($fp)	# fill _tmp45 to $t0 from $fp-188
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -192($fp)	# spill _tmp46 from $t2 to $fp-192
	# _tmp47 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -196($fp)	# spill _tmp47 from $t2 to $fp-196
	# _tmp48 = i + _tmp47
	  lw $t0, -8($fp)	# fill i to $t0 from $fp-8
	  lw $t1, -196($fp)	# fill _tmp47 to $t1 from $fp-196
	  add $t2, $t0, $t1	
	  sw $t2, -200($fp)	# spill _tmp48 from $t2 to $fp-200
	# _tmp49 = *(_tmp46)
	  lw $t0, -192($fp)	# fill _tmp46 to $t0 from $fp-192
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -204($fp)	# spill _tmp49 from $t2 to $fp-204
	# _tmp50 = *(_tmp49)
	  lw $t0, -204($fp)	# fill _tmp49 to $t0 from $fp-204
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -208($fp)	# spill _tmp50 from $t2 to $fp-208
	# PushParam _tmp48
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -200($fp)	# fill _tmp48 to $t0 from $fp-200
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam _tmp46
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -192($fp)	# fill _tmp46 to $t0 from $fp-192
	  sw $t0, 4($sp)	# copy param value to stack
	# ACall _tmp50
	  lw $t0, -208($fp)	# fill _tmp50 to $t0 from $fp-208
	  jalr $t0            	# jump to function
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# _tmp51 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -212($fp)	# spill _tmp51 from $t2 to $fp-212
	# _tmp52 = i + _tmp51
	  lw $t0, -8($fp)	# fill i to $t0 from $fp-8
	  lw $t1, -212($fp)	# fill _tmp51 to $t1 from $fp-212
	  add $t2, $t0, $t1	
	  sw $t2, -216($fp)	# spill _tmp52 from $t2 to $fp-216
	# i = _tmp52
	  lw $t2, -216($fp)	# fill _tmp52 to $t2 from $fp-216
	  sw $t2, -8($fp)	# spill i from $t2 to $fp-8
	# Goto loopBegin_67
	  b loopBegin_67		# unconditional branch
  loopEnd_68:
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  House_TakeAllBets:
	# BeginFunc 164
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 164	# decrement sp to make space for locals/temps
	# _tmp1 = "\nFirst, let's take bets.\n"
	  .data			# create string constant marked with label
	  _string53: .asciiz "\nFirst, let's take bets.\n"
	  .text
	  la $t2, _string53	# load label
	  sw $t2, -12($fp)	# spill _tmp1 from $t2 to $fp-12
	# PushParam _tmp1
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -12($fp)	# fill _tmp1 to $t0 from $fp-12
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp2 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -16($fp)	# spill _tmp2 from $t2 to $fp-16
	# i = _tmp2
	  lw $t2, -16($fp)	# fill _tmp2 to $t2 from $fp-16
	  sw $t2, -8($fp)	# spill i from $t2 to $fp-8
  loopBegin_71:
	# _tmp3 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -20($fp)	# spill _tmp3 from $t2 to $fp-20
	# _tmp4 = *(_tmp3)
	  lw $t0, -20($fp)	# fill _tmp3 to $t0 from $fp-20
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -24($fp)	# spill _tmp4 from $t2 to $fp-24
	# _tmp5 = i < _tmp4
	  lw $t0, -8($fp)	# fill i to $t0 from $fp-8
	  lw $t1, -24($fp)	# fill _tmp4 to $t1 from $fp-24
	  slt $t2, $t0, $t1	
	  sw $t2, -28($fp)	# spill _tmp5 from $t2 to $fp-28
	# IfZ _tmp5 Goto loopEnd_72
	  lw $t0, -28($fp)	# fill _tmp5 to $t0 from $fp-28
	  beqz $t0, loopEnd_72	# branch if _tmp5 is zero 
	# _tmp6 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -32($fp)	# spill _tmp6 from $t2 to $fp-32
	# _tmp7 = *(_tmp6)
	  lw $t0, -32($fp)	# fill _tmp6 to $t0 from $fp-32
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -36($fp)	# spill _tmp7 from $t2 to $fp-36
	# _tmp8 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -40($fp)	# spill _tmp8 from $t2 to $fp-40
	# _tmp9 = i < _tmp8
	  lw $t0, -8($fp)	# fill i to $t0 from $fp-8
	  lw $t1, -40($fp)	# fill _tmp8 to $t1 from $fp-40
	  slt $t2, $t0, $t1	
	  sw $t2, -44($fp)	# spill _tmp9 from $t2 to $fp-44
	# _tmp10 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -48($fp)	# spill _tmp10 from $t2 to $fp-48
	# _tmp11 = _tmp7 - _tmp10
	  lw $t0, -36($fp)	# fill _tmp7 to $t0 from $fp-36
	  lw $t1, -48($fp)	# fill _tmp10 to $t1 from $fp-48
	  sub $t2, $t0, $t1	
	  sw $t2, -52($fp)	# spill _tmp11 from $t2 to $fp-52
	# _tmp12 = _tmp11 < i
	  lw $t0, -52($fp)	# fill _tmp11 to $t0 from $fp-52
	  lw $t1, -8($fp)	# fill i to $t1 from $fp-8
	  slt $t2, $t0, $t1	
	  sw $t2, -56($fp)	# spill _tmp12 from $t2 to $fp-56
	# _tmp13 = _tmp9 || _tmp12
	  lw $t0, -44($fp)	# fill _tmp9 to $t0 from $fp-44
	  lw $t1, -56($fp)	# fill _tmp12 to $t1 from $fp-56
	  or $t2, $t0, $t1	
	  sw $t2, -60($fp)	# spill _tmp13 from $t2 to $fp-60
	# IfZ _tmp13 Goto arrayAcc_73
	  lw $t0, -60($fp)	# fill _tmp13 to $t0 from $fp-60
	  beqz $t0, arrayAcc_73	# branch if _tmp13 is zero 
	# _tmp14 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string54: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string54	# load label
	  sw $t2, -64($fp)	# spill _tmp14 from $t2 to $fp-64
	# PushParam _tmp14
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -64($fp)	# fill _tmp14 to $t0 from $fp-64
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_73:
	# _tmp15 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -68($fp)	# spill _tmp15 from $t2 to $fp-68
	# _tmp16 = i * _tmp15
	  lw $t0, -8($fp)	# fill i to $t0 from $fp-8
	  lw $t1, -68($fp)	# fill _tmp15 to $t1 from $fp-68
	  mul $t2, $t0, $t1	
	  sw $t2, -72($fp)	# spill _tmp16 from $t2 to $fp-72
	# _tmp17 = _tmp6 + _tmp16
	  lw $t0, -32($fp)	# fill _tmp6 to $t0 from $fp-32
	  lw $t1, -72($fp)	# fill _tmp16 to $t1 from $fp-72
	  add $t2, $t0, $t1	
	  sw $t2, -76($fp)	# spill _tmp17 from $t2 to $fp-76
	# _tmp18 = _tmp17 + _tmp15
	  lw $t0, -76($fp)	# fill _tmp17 to $t0 from $fp-76
	  lw $t1, -68($fp)	# fill _tmp15 to $t1 from $fp-68
	  add $t2, $t0, $t1	
	  sw $t2, -80($fp)	# spill _tmp18 from $t2 to $fp-80
	# _tmp19 = *(_tmp18)
	  lw $t0, -80($fp)	# fill _tmp18 to $t0 from $fp-80
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -84($fp)	# spill _tmp19 from $t2 to $fp-84
	# _tmp20 = *(_tmp19)
	  lw $t0, -84($fp)	# fill _tmp19 to $t0 from $fp-84
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -88($fp)	# spill _tmp20 from $t2 to $fp-88
	# _tmp21 = *(_tmp20 + 16)
	  lw $t0, -88($fp)	# fill _tmp20 to $t0 from $fp-88
	  lw $t2, 16($t0) 	# load with offset
	  sw $t2, -92($fp)	# spill _tmp21 from $t2 to $fp-92
	# PushParam _tmp19
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -84($fp)	# fill _tmp19 to $t0 from $fp-84
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp22 = ACall _tmp21
	  lw $t0, -92($fp)	# fill _tmp21 to $t0 from $fp-92
	  jalr $t0            	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -96($fp)	# spill _tmp22 from $t2 to $fp-96
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# IfZ _tmp22 Goto else_74
	  lw $t0, -96($fp)	# fill _tmp22 to $t0 from $fp-96
	  beqz $t0, else_74	# branch if _tmp22 is zero 
	# _tmp23 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -100($fp)	# spill _tmp23 from $t2 to $fp-100
	# _tmp24 = *(_tmp23)
	  lw $t0, -100($fp)	# fill _tmp23 to $t0 from $fp-100
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -104($fp)	# spill _tmp24 from $t2 to $fp-104
	# _tmp25 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -108($fp)	# spill _tmp25 from $t2 to $fp-108
	# _tmp26 = i < _tmp25
	  lw $t0, -8($fp)	# fill i to $t0 from $fp-8
	  lw $t1, -108($fp)	# fill _tmp25 to $t1 from $fp-108
	  slt $t2, $t0, $t1	
	  sw $t2, -112($fp)	# spill _tmp26 from $t2 to $fp-112
	# _tmp27 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -116($fp)	# spill _tmp27 from $t2 to $fp-116
	# _tmp28 = _tmp24 - _tmp27
	  lw $t0, -104($fp)	# fill _tmp24 to $t0 from $fp-104
	  lw $t1, -116($fp)	# fill _tmp27 to $t1 from $fp-116
	  sub $t2, $t0, $t1	
	  sw $t2, -120($fp)	# spill _tmp28 from $t2 to $fp-120
	# _tmp29 = _tmp28 < i
	  lw $t0, -120($fp)	# fill _tmp28 to $t0 from $fp-120
	  lw $t1, -8($fp)	# fill i to $t1 from $fp-8
	  slt $t2, $t0, $t1	
	  sw $t2, -124($fp)	# spill _tmp29 from $t2 to $fp-124
	# _tmp30 = _tmp26 || _tmp29
	  lw $t0, -112($fp)	# fill _tmp26 to $t0 from $fp-112
	  lw $t1, -124($fp)	# fill _tmp29 to $t1 from $fp-124
	  or $t2, $t0, $t1	
	  sw $t2, -128($fp)	# spill _tmp30 from $t2 to $fp-128
	# IfZ _tmp30 Goto arrayAcc_76
	  lw $t0, -128($fp)	# fill _tmp30 to $t0 from $fp-128
	  beqz $t0, arrayAcc_76	# branch if _tmp30 is zero 
	# _tmp31 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string55: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string55	# load label
	  sw $t2, -132($fp)	# spill _tmp31 from $t2 to $fp-132
	# PushParam _tmp31
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -132($fp)	# fill _tmp31 to $t0 from $fp-132
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_76:
	# _tmp32 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -136($fp)	# spill _tmp32 from $t2 to $fp-136
	# _tmp33 = i * _tmp32
	  lw $t0, -8($fp)	# fill i to $t0 from $fp-8
	  lw $t1, -136($fp)	# fill _tmp32 to $t1 from $fp-136
	  mul $t2, $t0, $t1	
	  sw $t2, -140($fp)	# spill _tmp33 from $t2 to $fp-140
	# _tmp34 = _tmp23 + _tmp33
	  lw $t0, -100($fp)	# fill _tmp23 to $t0 from $fp-100
	  lw $t1, -140($fp)	# fill _tmp33 to $t1 from $fp-140
	  add $t2, $t0, $t1	
	  sw $t2, -144($fp)	# spill _tmp34 from $t2 to $fp-144
	# _tmp35 = _tmp34 + _tmp32
	  lw $t0, -144($fp)	# fill _tmp34 to $t0 from $fp-144
	  lw $t1, -136($fp)	# fill _tmp32 to $t1 from $fp-136
	  add $t2, $t0, $t1	
	  sw $t2, -148($fp)	# spill _tmp35 from $t2 to $fp-148
	# _tmp36 = *(_tmp35)
	  lw $t0, -148($fp)	# fill _tmp35 to $t0 from $fp-148
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -152($fp)	# spill _tmp36 from $t2 to $fp-152
	# _tmp37 = *(_tmp36)
	  lw $t0, -152($fp)	# fill _tmp36 to $t0 from $fp-152
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -156($fp)	# spill _tmp37 from $t2 to $fp-156
	# _tmp38 = *(_tmp37 + 24)
	  lw $t0, -156($fp)	# fill _tmp37 to $t0 from $fp-156
	  lw $t2, 24($t0) 	# load with offset
	  sw $t2, -160($fp)	# spill _tmp38 from $t2 to $fp-160
	# PushParam _tmp36
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -152($fp)	# fill _tmp36 to $t0 from $fp-152
	  sw $t0, 4($sp)	# copy param value to stack
	# ACall _tmp38
	  lw $t0, -160($fp)	# fill _tmp38 to $t0 from $fp-160
	  jalr $t0            	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# Goto endif_75
	  b endif_75		# unconditional branch
  else_74:
  endif_75:
	# _tmp39 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -164($fp)	# spill _tmp39 from $t2 to $fp-164
	# _tmp40 = i + _tmp39
	  lw $t0, -8($fp)	# fill i to $t0 from $fp-8
	  lw $t1, -164($fp)	# fill _tmp39 to $t1 from $fp-164
	  add $t2, $t0, $t1	
	  sw $t2, -168($fp)	# spill _tmp40 from $t2 to $fp-168
	# i = _tmp40
	  lw $t2, -168($fp)	# fill _tmp40 to $t2 from $fp-168
	  sw $t2, -8($fp)	# spill i from $t2 to $fp-8
	# Goto loopBegin_71
	  b loopBegin_71		# unconditional branch
  loopEnd_72:
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  House_TakeAllTurns:
	# BeginFunc 164
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 164	# decrement sp to make space for locals/temps
	# _tmp1 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -12($fp)	# spill _tmp1 from $t2 to $fp-12
	# i = _tmp1
	  lw $t2, -12($fp)	# fill _tmp1 to $t2 from $fp-12
	  sw $t2, -8($fp)	# spill i from $t2 to $fp-8
  loopBegin_77:
	# _tmp2 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -16($fp)	# spill _tmp2 from $t2 to $fp-16
	# _tmp3 = *(_tmp2)
	  lw $t0, -16($fp)	# fill _tmp2 to $t0 from $fp-16
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -20($fp)	# spill _tmp3 from $t2 to $fp-20
	# _tmp4 = i < _tmp3
	  lw $t0, -8($fp)	# fill i to $t0 from $fp-8
	  lw $t1, -20($fp)	# fill _tmp3 to $t1 from $fp-20
	  slt $t2, $t0, $t1	
	  sw $t2, -24($fp)	# spill _tmp4 from $t2 to $fp-24
	# IfZ _tmp4 Goto loopEnd_78
	  lw $t0, -24($fp)	# fill _tmp4 to $t0 from $fp-24
	  beqz $t0, loopEnd_78	# branch if _tmp4 is zero 
	# _tmp5 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -28($fp)	# spill _tmp5 from $t2 to $fp-28
	# _tmp6 = *(_tmp5)
	  lw $t0, -28($fp)	# fill _tmp5 to $t0 from $fp-28
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -32($fp)	# spill _tmp6 from $t2 to $fp-32
	# _tmp7 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -36($fp)	# spill _tmp7 from $t2 to $fp-36
	# _tmp8 = i < _tmp7
	  lw $t0, -8($fp)	# fill i to $t0 from $fp-8
	  lw $t1, -36($fp)	# fill _tmp7 to $t1 from $fp-36
	  slt $t2, $t0, $t1	
	  sw $t2, -40($fp)	# spill _tmp8 from $t2 to $fp-40
	# _tmp9 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -44($fp)	# spill _tmp9 from $t2 to $fp-44
	# _tmp10 = _tmp6 - _tmp9
	  lw $t0, -32($fp)	# fill _tmp6 to $t0 from $fp-32
	  lw $t1, -44($fp)	# fill _tmp9 to $t1 from $fp-44
	  sub $t2, $t0, $t1	
	  sw $t2, -48($fp)	# spill _tmp10 from $t2 to $fp-48
	# _tmp11 = _tmp10 < i
	  lw $t0, -48($fp)	# fill _tmp10 to $t0 from $fp-48
	  lw $t1, -8($fp)	# fill i to $t1 from $fp-8
	  slt $t2, $t0, $t1	
	  sw $t2, -52($fp)	# spill _tmp11 from $t2 to $fp-52
	# _tmp12 = _tmp8 || _tmp11
	  lw $t0, -40($fp)	# fill _tmp8 to $t0 from $fp-40
	  lw $t1, -52($fp)	# fill _tmp11 to $t1 from $fp-52
	  or $t2, $t0, $t1	
	  sw $t2, -56($fp)	# spill _tmp12 from $t2 to $fp-56
	# IfZ _tmp12 Goto arrayAcc_79
	  lw $t0, -56($fp)	# fill _tmp12 to $t0 from $fp-56
	  beqz $t0, arrayAcc_79	# branch if _tmp12 is zero 
	# _tmp13 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string56: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string56	# load label
	  sw $t2, -60($fp)	# spill _tmp13 from $t2 to $fp-60
	# PushParam _tmp13
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -60($fp)	# fill _tmp13 to $t0 from $fp-60
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_79:
	# _tmp14 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -64($fp)	# spill _tmp14 from $t2 to $fp-64
	# _tmp15 = i * _tmp14
	  lw $t0, -8($fp)	# fill i to $t0 from $fp-8
	  lw $t1, -64($fp)	# fill _tmp14 to $t1 from $fp-64
	  mul $t2, $t0, $t1	
	  sw $t2, -68($fp)	# spill _tmp15 from $t2 to $fp-68
	# _tmp16 = _tmp5 + _tmp15
	  lw $t0, -28($fp)	# fill _tmp5 to $t0 from $fp-28
	  lw $t1, -68($fp)	# fill _tmp15 to $t1 from $fp-68
	  add $t2, $t0, $t1	
	  sw $t2, -72($fp)	# spill _tmp16 from $t2 to $fp-72
	# _tmp17 = _tmp16 + _tmp14
	  lw $t0, -72($fp)	# fill _tmp16 to $t0 from $fp-72
	  lw $t1, -64($fp)	# fill _tmp14 to $t1 from $fp-64
	  add $t2, $t0, $t1	
	  sw $t2, -76($fp)	# spill _tmp17 from $t2 to $fp-76
	# _tmp18 = *(_tmp17)
	  lw $t0, -76($fp)	# fill _tmp17 to $t0 from $fp-76
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -80($fp)	# spill _tmp18 from $t2 to $fp-80
	# _tmp19 = *(_tmp18)
	  lw $t0, -80($fp)	# fill _tmp18 to $t0 from $fp-80
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -84($fp)	# spill _tmp19 from $t2 to $fp-84
	# _tmp20 = *(_tmp19 + 16)
	  lw $t0, -84($fp)	# fill _tmp19 to $t0 from $fp-84
	  lw $t2, 16($t0) 	# load with offset
	  sw $t2, -88($fp)	# spill _tmp20 from $t2 to $fp-88
	# PushParam _tmp18
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -80($fp)	# fill _tmp18 to $t0 from $fp-80
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp21 = ACall _tmp20
	  lw $t0, -88($fp)	# fill _tmp20 to $t0 from $fp-88
	  jalr $t0            	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -92($fp)	# spill _tmp21 from $t2 to $fp-92
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# IfZ _tmp21 Goto else_80
	  lw $t0, -92($fp)	# fill _tmp21 to $t0 from $fp-92
	  beqz $t0, else_80	# branch if _tmp21 is zero 
	# _tmp22 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -96($fp)	# spill _tmp22 from $t2 to $fp-96
	# _tmp23 = *(_tmp22)
	  lw $t0, -96($fp)	# fill _tmp22 to $t0 from $fp-96
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -100($fp)	# spill _tmp23 from $t2 to $fp-100
	# _tmp24 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -104($fp)	# spill _tmp24 from $t2 to $fp-104
	# _tmp25 = i < _tmp24
	  lw $t0, -8($fp)	# fill i to $t0 from $fp-8
	  lw $t1, -104($fp)	# fill _tmp24 to $t1 from $fp-104
	  slt $t2, $t0, $t1	
	  sw $t2, -108($fp)	# spill _tmp25 from $t2 to $fp-108
	# _tmp26 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -112($fp)	# spill _tmp26 from $t2 to $fp-112
	# _tmp27 = _tmp23 - _tmp26
	  lw $t0, -100($fp)	# fill _tmp23 to $t0 from $fp-100
	  lw $t1, -112($fp)	# fill _tmp26 to $t1 from $fp-112
	  sub $t2, $t0, $t1	
	  sw $t2, -116($fp)	# spill _tmp27 from $t2 to $fp-116
	# _tmp28 = _tmp27 < i
	  lw $t0, -116($fp)	# fill _tmp27 to $t0 from $fp-116
	  lw $t1, -8($fp)	# fill i to $t1 from $fp-8
	  slt $t2, $t0, $t1	
	  sw $t2, -120($fp)	# spill _tmp28 from $t2 to $fp-120
	# _tmp29 = _tmp25 || _tmp28
	  lw $t0, -108($fp)	# fill _tmp25 to $t0 from $fp-108
	  lw $t1, -120($fp)	# fill _tmp28 to $t1 from $fp-120
	  or $t2, $t0, $t1	
	  sw $t2, -124($fp)	# spill _tmp29 from $t2 to $fp-124
	# IfZ _tmp29 Goto arrayAcc_82
	  lw $t0, -124($fp)	# fill _tmp29 to $t0 from $fp-124
	  beqz $t0, arrayAcc_82	# branch if _tmp29 is zero 
	# _tmp30 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string57: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string57	# load label
	  sw $t2, -128($fp)	# spill _tmp30 from $t2 to $fp-128
	# PushParam _tmp30
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -128($fp)	# fill _tmp30 to $t0 from $fp-128
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_82:
	# _tmp31 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -132($fp)	# spill _tmp31 from $t2 to $fp-132
	# _tmp32 = i * _tmp31
	  lw $t0, -8($fp)	# fill i to $t0 from $fp-8
	  lw $t1, -132($fp)	# fill _tmp31 to $t1 from $fp-132
	  mul $t2, $t0, $t1	
	  sw $t2, -136($fp)	# spill _tmp32 from $t2 to $fp-136
	# _tmp33 = _tmp22 + _tmp32
	  lw $t0, -96($fp)	# fill _tmp22 to $t0 from $fp-96
	  lw $t1, -136($fp)	# fill _tmp32 to $t1 from $fp-136
	  add $t2, $t0, $t1	
	  sw $t2, -140($fp)	# spill _tmp33 from $t2 to $fp-140
	# _tmp34 = _tmp33 + _tmp31
	  lw $t0, -140($fp)	# fill _tmp33 to $t0 from $fp-140
	  lw $t1, -132($fp)	# fill _tmp31 to $t1 from $fp-132
	  add $t2, $t0, $t1	
	  sw $t2, -144($fp)	# spill _tmp34 from $t2 to $fp-144
	# _tmp35 = *(_tmp34)
	  lw $t0, -144($fp)	# fill _tmp34 to $t0 from $fp-144
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -148($fp)	# spill _tmp35 from $t2 to $fp-148
	# _tmp36 = *(this + 12)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 12($t0) 	# load with offset
	  sw $t2, -152($fp)	# spill _tmp36 from $t2 to $fp-152
	# _tmp37 = *(_tmp35)
	  lw $t0, -148($fp)	# fill _tmp35 to $t0 from $fp-148
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -156($fp)	# spill _tmp37 from $t2 to $fp-156
	# _tmp38 = *(_tmp37 + 12)
	  lw $t0, -156($fp)	# fill _tmp37 to $t0 from $fp-156
	  lw $t2, 12($t0) 	# load with offset
	  sw $t2, -160($fp)	# spill _tmp38 from $t2 to $fp-160
	# PushParam _tmp36
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -152($fp)	# fill _tmp36 to $t0 from $fp-152
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam _tmp35
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -148($fp)	# fill _tmp35 to $t0 from $fp-148
	  sw $t0, 4($sp)	# copy param value to stack
	# ACall _tmp38
	  lw $t0, -160($fp)	# fill _tmp38 to $t0 from $fp-160
	  jalr $t0            	# jump to function
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# Goto endif_81
	  b endif_81		# unconditional branch
  else_80:
  endif_81:
	# _tmp39 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -164($fp)	# spill _tmp39 from $t2 to $fp-164
	# _tmp40 = i + _tmp39
	  lw $t0, -8($fp)	# fill i to $t0 from $fp-8
	  lw $t1, -164($fp)	# fill _tmp39 to $t1 from $fp-164
	  add $t2, $t0, $t1	
	  sw $t2, -168($fp)	# spill _tmp40 from $t2 to $fp-168
	# i = _tmp40
	  lw $t2, -168($fp)	# fill _tmp40 to $t2 from $fp-168
	  sw $t2, -8($fp)	# spill i from $t2 to $fp-8
	# Goto loopBegin_77
	  b loopBegin_77		# unconditional branch
  loopEnd_78:
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  House_ResolveAllPlayers:
	# BeginFunc 180
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 180	# decrement sp to make space for locals/temps
	# _tmp1 = "\nTime to resolve bets.\n"
	  .data			# create string constant marked with label
	  _string58: .asciiz "\nTime to resolve bets.\n"
	  .text
	  la $t2, _string58	# load label
	  sw $t2, -12($fp)	# spill _tmp1 from $t2 to $fp-12
	# PushParam _tmp1
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -12($fp)	# fill _tmp1 to $t0 from $fp-12
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp2 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -16($fp)	# spill _tmp2 from $t2 to $fp-16
	# i = _tmp2
	  lw $t2, -16($fp)	# fill _tmp2 to $t2 from $fp-16
	  sw $t2, -8($fp)	# spill i from $t2 to $fp-8
  loopBegin_83:
	# _tmp3 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -20($fp)	# spill _tmp3 from $t2 to $fp-20
	# _tmp4 = *(_tmp3)
	  lw $t0, -20($fp)	# fill _tmp3 to $t0 from $fp-20
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -24($fp)	# spill _tmp4 from $t2 to $fp-24
	# _tmp5 = i < _tmp4
	  lw $t0, -8($fp)	# fill i to $t0 from $fp-8
	  lw $t1, -24($fp)	# fill _tmp4 to $t1 from $fp-24
	  slt $t2, $t0, $t1	
	  sw $t2, -28($fp)	# spill _tmp5 from $t2 to $fp-28
	# IfZ _tmp5 Goto loopEnd_84
	  lw $t0, -28($fp)	# fill _tmp5 to $t0 from $fp-28
	  beqz $t0, loopEnd_84	# branch if _tmp5 is zero 
	# _tmp6 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -32($fp)	# spill _tmp6 from $t2 to $fp-32
	# _tmp7 = *(_tmp6)
	  lw $t0, -32($fp)	# fill _tmp6 to $t0 from $fp-32
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -36($fp)	# spill _tmp7 from $t2 to $fp-36
	# _tmp8 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -40($fp)	# spill _tmp8 from $t2 to $fp-40
	# _tmp9 = i < _tmp8
	  lw $t0, -8($fp)	# fill i to $t0 from $fp-8
	  lw $t1, -40($fp)	# fill _tmp8 to $t1 from $fp-40
	  slt $t2, $t0, $t1	
	  sw $t2, -44($fp)	# spill _tmp9 from $t2 to $fp-44
	# _tmp10 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -48($fp)	# spill _tmp10 from $t2 to $fp-48
	# _tmp11 = _tmp7 - _tmp10
	  lw $t0, -36($fp)	# fill _tmp7 to $t0 from $fp-36
	  lw $t1, -48($fp)	# fill _tmp10 to $t1 from $fp-48
	  sub $t2, $t0, $t1	
	  sw $t2, -52($fp)	# spill _tmp11 from $t2 to $fp-52
	# _tmp12 = _tmp11 < i
	  lw $t0, -52($fp)	# fill _tmp11 to $t0 from $fp-52
	  lw $t1, -8($fp)	# fill i to $t1 from $fp-8
	  slt $t2, $t0, $t1	
	  sw $t2, -56($fp)	# spill _tmp12 from $t2 to $fp-56
	# _tmp13 = _tmp9 || _tmp12
	  lw $t0, -44($fp)	# fill _tmp9 to $t0 from $fp-44
	  lw $t1, -56($fp)	# fill _tmp12 to $t1 from $fp-56
	  or $t2, $t0, $t1	
	  sw $t2, -60($fp)	# spill _tmp13 from $t2 to $fp-60
	# IfZ _tmp13 Goto arrayAcc_85
	  lw $t0, -60($fp)	# fill _tmp13 to $t0 from $fp-60
	  beqz $t0, arrayAcc_85	# branch if _tmp13 is zero 
	# _tmp14 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string59: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string59	# load label
	  sw $t2, -64($fp)	# spill _tmp14 from $t2 to $fp-64
	# PushParam _tmp14
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -64($fp)	# fill _tmp14 to $t0 from $fp-64
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_85:
	# _tmp15 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -68($fp)	# spill _tmp15 from $t2 to $fp-68
	# _tmp16 = i * _tmp15
	  lw $t0, -8($fp)	# fill i to $t0 from $fp-8
	  lw $t1, -68($fp)	# fill _tmp15 to $t1 from $fp-68
	  mul $t2, $t0, $t1	
	  sw $t2, -72($fp)	# spill _tmp16 from $t2 to $fp-72
	# _tmp17 = _tmp6 + _tmp16
	  lw $t0, -32($fp)	# fill _tmp6 to $t0 from $fp-32
	  lw $t1, -72($fp)	# fill _tmp16 to $t1 from $fp-72
	  add $t2, $t0, $t1	
	  sw $t2, -76($fp)	# spill _tmp17 from $t2 to $fp-76
	# _tmp18 = _tmp17 + _tmp15
	  lw $t0, -76($fp)	# fill _tmp17 to $t0 from $fp-76
	  lw $t1, -68($fp)	# fill _tmp15 to $t1 from $fp-68
	  add $t2, $t0, $t1	
	  sw $t2, -80($fp)	# spill _tmp18 from $t2 to $fp-80
	# _tmp19 = *(_tmp18)
	  lw $t0, -80($fp)	# fill _tmp18 to $t0 from $fp-80
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -84($fp)	# spill _tmp19 from $t2 to $fp-84
	# _tmp20 = *(_tmp19)
	  lw $t0, -84($fp)	# fill _tmp19 to $t0 from $fp-84
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -88($fp)	# spill _tmp20 from $t2 to $fp-88
	# _tmp21 = *(_tmp20 + 16)
	  lw $t0, -88($fp)	# fill _tmp20 to $t0 from $fp-88
	  lw $t2, 16($t0) 	# load with offset
	  sw $t2, -92($fp)	# spill _tmp21 from $t2 to $fp-92
	# PushParam _tmp19
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -84($fp)	# fill _tmp19 to $t0 from $fp-84
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp22 = ACall _tmp21
	  lw $t0, -92($fp)	# fill _tmp21 to $t0 from $fp-92
	  jalr $t0            	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -96($fp)	# spill _tmp22 from $t2 to $fp-96
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# IfZ _tmp22 Goto else_86
	  lw $t0, -96($fp)	# fill _tmp22 to $t0 from $fp-96
	  beqz $t0, else_86	# branch if _tmp22 is zero 
	# _tmp23 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -100($fp)	# spill _tmp23 from $t2 to $fp-100
	# _tmp24 = *(_tmp23)
	  lw $t0, -100($fp)	# fill _tmp23 to $t0 from $fp-100
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -104($fp)	# spill _tmp24 from $t2 to $fp-104
	# _tmp25 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -108($fp)	# spill _tmp25 from $t2 to $fp-108
	# _tmp26 = i < _tmp25
	  lw $t0, -8($fp)	# fill i to $t0 from $fp-8
	  lw $t1, -108($fp)	# fill _tmp25 to $t1 from $fp-108
	  slt $t2, $t0, $t1	
	  sw $t2, -112($fp)	# spill _tmp26 from $t2 to $fp-112
	# _tmp27 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -116($fp)	# spill _tmp27 from $t2 to $fp-116
	# _tmp28 = _tmp24 - _tmp27
	  lw $t0, -104($fp)	# fill _tmp24 to $t0 from $fp-104
	  lw $t1, -116($fp)	# fill _tmp27 to $t1 from $fp-116
	  sub $t2, $t0, $t1	
	  sw $t2, -120($fp)	# spill _tmp28 from $t2 to $fp-120
	# _tmp29 = _tmp28 < i
	  lw $t0, -120($fp)	# fill _tmp28 to $t0 from $fp-120
	  lw $t1, -8($fp)	# fill i to $t1 from $fp-8
	  slt $t2, $t0, $t1	
	  sw $t2, -124($fp)	# spill _tmp29 from $t2 to $fp-124
	# _tmp30 = _tmp26 || _tmp29
	  lw $t0, -112($fp)	# fill _tmp26 to $t0 from $fp-112
	  lw $t1, -124($fp)	# fill _tmp29 to $t1 from $fp-124
	  or $t2, $t0, $t1	
	  sw $t2, -128($fp)	# spill _tmp30 from $t2 to $fp-128
	# IfZ _tmp30 Goto arrayAcc_88
	  lw $t0, -128($fp)	# fill _tmp30 to $t0 from $fp-128
	  beqz $t0, arrayAcc_88	# branch if _tmp30 is zero 
	# _tmp31 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string60: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string60	# load label
	  sw $t2, -132($fp)	# spill _tmp31 from $t2 to $fp-132
	# PushParam _tmp31
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -132($fp)	# fill _tmp31 to $t0 from $fp-132
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_88:
	# _tmp32 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -136($fp)	# spill _tmp32 from $t2 to $fp-136
	# _tmp33 = i * _tmp32
	  lw $t0, -8($fp)	# fill i to $t0 from $fp-8
	  lw $t1, -136($fp)	# fill _tmp32 to $t1 from $fp-136
	  mul $t2, $t0, $t1	
	  sw $t2, -140($fp)	# spill _tmp33 from $t2 to $fp-140
	# _tmp34 = _tmp23 + _tmp33
	  lw $t0, -100($fp)	# fill _tmp23 to $t0 from $fp-100
	  lw $t1, -140($fp)	# fill _tmp33 to $t1 from $fp-140
	  add $t2, $t0, $t1	
	  sw $t2, -144($fp)	# spill _tmp34 from $t2 to $fp-144
	# _tmp35 = _tmp34 + _tmp32
	  lw $t0, -144($fp)	# fill _tmp34 to $t0 from $fp-144
	  lw $t1, -136($fp)	# fill _tmp32 to $t1 from $fp-136
	  add $t2, $t0, $t1	
	  sw $t2, -148($fp)	# spill _tmp35 from $t2 to $fp-148
	# _tmp36 = *(_tmp35)
	  lw $t0, -148($fp)	# fill _tmp35 to $t0 from $fp-148
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -152($fp)	# spill _tmp36 from $t2 to $fp-152
	# _tmp37 = *(this + 8)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 8($t0) 	# load with offset
	  sw $t2, -156($fp)	# spill _tmp37 from $t2 to $fp-156
	# _tmp38 = *(_tmp37)
	  lw $t0, -156($fp)	# fill _tmp37 to $t0 from $fp-156
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -160($fp)	# spill _tmp38 from $t2 to $fp-160
	# _tmp39 = *(_tmp38 + 28)
	  lw $t0, -160($fp)	# fill _tmp38 to $t0 from $fp-160
	  lw $t2, 28($t0) 	# load with offset
	  sw $t2, -164($fp)	# spill _tmp39 from $t2 to $fp-164
	# PushParam _tmp37
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -156($fp)	# fill _tmp37 to $t0 from $fp-156
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp40 = ACall _tmp39
	  lw $t0, -164($fp)	# fill _tmp39 to $t0 from $fp-164
	  jalr $t0            	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -168($fp)	# spill _tmp40 from $t2 to $fp-168
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp41 = *(_tmp36)
	  lw $t0, -152($fp)	# fill _tmp36 to $t0 from $fp-152
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -172($fp)	# spill _tmp41 from $t2 to $fp-172
	# _tmp42 = *(_tmp41 + 32)
	  lw $t0, -172($fp)	# fill _tmp41 to $t0 from $fp-172
	  lw $t2, 32($t0) 	# load with offset
	  sw $t2, -176($fp)	# spill _tmp42 from $t2 to $fp-176
	# PushParam _tmp40
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -168($fp)	# fill _tmp40 to $t0 from $fp-168
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam _tmp36
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -152($fp)	# fill _tmp36 to $t0 from $fp-152
	  sw $t0, 4($sp)	# copy param value to stack
	# ACall _tmp42
	  lw $t0, -176($fp)	# fill _tmp42 to $t0 from $fp-176
	  jalr $t0            	# jump to function
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# Goto endif_87
	  b endif_87		# unconditional branch
  else_86:
  endif_87:
	# _tmp43 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -180($fp)	# spill _tmp43 from $t2 to $fp-180
	# _tmp44 = i + _tmp43
	  lw $t0, -8($fp)	# fill i to $t0 from $fp-8
	  lw $t1, -180($fp)	# fill _tmp43 to $t1 from $fp-180
	  add $t2, $t0, $t1	
	  sw $t2, -184($fp)	# spill _tmp44 from $t2 to $fp-184
	# i = _tmp44
	  lw $t2, -184($fp)	# fill _tmp44 to $t2 from $fp-184
	  sw $t2, -8($fp)	# spill i from $t2 to $fp-8
	# Goto loopBegin_83
	  b loopBegin_83		# unconditional branch
  loopEnd_84:
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  House_PrintAllMoney:
	# BeginFunc 92
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 92	# decrement sp to make space for locals/temps
	# _tmp1 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -12($fp)	# spill _tmp1 from $t2 to $fp-12
	# i = _tmp1
	  lw $t2, -12($fp)	# fill _tmp1 to $t2 from $fp-12
	  sw $t2, -8($fp)	# spill i from $t2 to $fp-8
  loopBegin_89:
	# _tmp2 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -16($fp)	# spill _tmp2 from $t2 to $fp-16
	# _tmp3 = *(_tmp2)
	  lw $t0, -16($fp)	# fill _tmp2 to $t0 from $fp-16
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -20($fp)	# spill _tmp3 from $t2 to $fp-20
	# _tmp4 = i < _tmp3
	  lw $t0, -8($fp)	# fill i to $t0 from $fp-8
	  lw $t1, -20($fp)	# fill _tmp3 to $t1 from $fp-20
	  slt $t2, $t0, $t1	
	  sw $t2, -24($fp)	# spill _tmp4 from $t2 to $fp-24
	# IfZ _tmp4 Goto loopEnd_90
	  lw $t0, -24($fp)	# fill _tmp4 to $t0 from $fp-24
	  beqz $t0, loopEnd_90	# branch if _tmp4 is zero 
	# _tmp5 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -28($fp)	# spill _tmp5 from $t2 to $fp-28
	# _tmp6 = *(_tmp5)
	  lw $t0, -28($fp)	# fill _tmp5 to $t0 from $fp-28
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -32($fp)	# spill _tmp6 from $t2 to $fp-32
	# _tmp7 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -36($fp)	# spill _tmp7 from $t2 to $fp-36
	# _tmp8 = i < _tmp7
	  lw $t0, -8($fp)	# fill i to $t0 from $fp-8
	  lw $t1, -36($fp)	# fill _tmp7 to $t1 from $fp-36
	  slt $t2, $t0, $t1	
	  sw $t2, -40($fp)	# spill _tmp8 from $t2 to $fp-40
	# _tmp9 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -44($fp)	# spill _tmp9 from $t2 to $fp-44
	# _tmp10 = _tmp6 - _tmp9
	  lw $t0, -32($fp)	# fill _tmp6 to $t0 from $fp-32
	  lw $t1, -44($fp)	# fill _tmp9 to $t1 from $fp-44
	  sub $t2, $t0, $t1	
	  sw $t2, -48($fp)	# spill _tmp10 from $t2 to $fp-48
	# _tmp11 = _tmp10 < i
	  lw $t0, -48($fp)	# fill _tmp10 to $t0 from $fp-48
	  lw $t1, -8($fp)	# fill i to $t1 from $fp-8
	  slt $t2, $t0, $t1	
	  sw $t2, -52($fp)	# spill _tmp11 from $t2 to $fp-52
	# _tmp12 = _tmp8 || _tmp11
	  lw $t0, -40($fp)	# fill _tmp8 to $t0 from $fp-40
	  lw $t1, -52($fp)	# fill _tmp11 to $t1 from $fp-52
	  or $t2, $t0, $t1	
	  sw $t2, -56($fp)	# spill _tmp12 from $t2 to $fp-56
	# IfZ _tmp12 Goto arrayAcc_91
	  lw $t0, -56($fp)	# fill _tmp12 to $t0 from $fp-56
	  beqz $t0, arrayAcc_91	# branch if _tmp12 is zero 
	# _tmp13 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string61: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string61	# load label
	  sw $t2, -60($fp)	# spill _tmp13 from $t2 to $fp-60
	# PushParam _tmp13
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -60($fp)	# fill _tmp13 to $t0 from $fp-60
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_91:
	# _tmp14 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -64($fp)	# spill _tmp14 from $t2 to $fp-64
	# _tmp15 = i * _tmp14
	  lw $t0, -8($fp)	# fill i to $t0 from $fp-8
	  lw $t1, -64($fp)	# fill _tmp14 to $t1 from $fp-64
	  mul $t2, $t0, $t1	
	  sw $t2, -68($fp)	# spill _tmp15 from $t2 to $fp-68
	# _tmp16 = _tmp5 + _tmp15
	  lw $t0, -28($fp)	# fill _tmp5 to $t0 from $fp-28
	  lw $t1, -68($fp)	# fill _tmp15 to $t1 from $fp-68
	  add $t2, $t0, $t1	
	  sw $t2, -72($fp)	# spill _tmp16 from $t2 to $fp-72
	# _tmp17 = _tmp16 + _tmp14
	  lw $t0, -72($fp)	# fill _tmp16 to $t0 from $fp-72
	  lw $t1, -64($fp)	# fill _tmp14 to $t1 from $fp-64
	  add $t2, $t0, $t1	
	  sw $t2, -76($fp)	# spill _tmp17 from $t2 to $fp-76
	# _tmp18 = *(_tmp17)
	  lw $t0, -76($fp)	# fill _tmp17 to $t0 from $fp-76
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -80($fp)	# spill _tmp18 from $t2 to $fp-80
	# _tmp19 = *(_tmp18)
	  lw $t0, -80($fp)	# fill _tmp18 to $t0 from $fp-80
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -84($fp)	# spill _tmp19 from $t2 to $fp-84
	# _tmp20 = *(_tmp19 + 20)
	  lw $t0, -84($fp)	# fill _tmp19 to $t0 from $fp-84
	  lw $t2, 20($t0) 	# load with offset
	  sw $t2, -88($fp)	# spill _tmp20 from $t2 to $fp-88
	# PushParam _tmp18
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -80($fp)	# fill _tmp18 to $t0 from $fp-80
	  sw $t0, 4($sp)	# copy param value to stack
	# ACall _tmp20
	  lw $t0, -88($fp)	# fill _tmp20 to $t0 from $fp-88
	  jalr $t0            	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp21 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -92($fp)	# spill _tmp21 from $t2 to $fp-92
	# _tmp22 = i + _tmp21
	  lw $t0, -8($fp)	# fill i to $t0 from $fp-8
	  lw $t1, -92($fp)	# fill _tmp21 to $t1 from $fp-92
	  add $t2, $t0, $t1	
	  sw $t2, -96($fp)	# spill _tmp22 from $t2 to $fp-96
	# i = _tmp22
	  lw $t2, -96($fp)	# fill _tmp22 to $t2 from $fp-96
	  sw $t2, -8($fp)	# spill i from $t2 to $fp-8
	# Goto loopBegin_89
	  b loopBegin_89		# unconditional branch
  loopEnd_90:
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  House_PlayOneGame:
	# BeginFunc 112
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 112	# decrement sp to make space for locals/temps
	# _tmp0 = *(this + 12)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 12($t0) 	# load with offset
	  sw $t2, -8($fp)	# spill _tmp0 from $t2 to $fp-8
	# _tmp1 = *(_tmp0)
	  lw $t0, -8($fp)	# fill _tmp0 to $t0 from $fp-8
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -12($fp)	# spill _tmp1 from $t2 to $fp-12
	# _tmp2 = *(_tmp1 + 12)
	  lw $t0, -12($fp)	# fill _tmp1 to $t0 from $fp-12
	  lw $t2, 12($t0) 	# load with offset
	  sw $t2, -16($fp)	# spill _tmp2 from $t2 to $fp-16
	# PushParam _tmp0
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -8($fp)	# fill _tmp0 to $t0 from $fp-8
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp3 = ACall _tmp2
	  lw $t0, -16($fp)	# fill _tmp2 to $t0 from $fp-16
	  jalr $t0            	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -20($fp)	# spill _tmp3 from $t2 to $fp-20
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp4 = 26
	  li $t2, 26		# load constant value 26 into $t2
	  sw $t2, -24($fp)	# spill _tmp4 from $t2 to $fp-24
	# _tmp5 = _tmp3 < _tmp4
	  lw $t0, -20($fp)	# fill _tmp3 to $t0 from $fp-20
	  lw $t1, -24($fp)	# fill _tmp4 to $t1 from $fp-24
	  slt $t2, $t0, $t1	
	  sw $t2, -28($fp)	# spill _tmp5 from $t2 to $fp-28
	# IfZ _tmp5 Goto else_92
	  lw $t0, -28($fp)	# fill _tmp5 to $t0 from $fp-28
	  beqz $t0, else_92	# branch if _tmp5 is zero 
	# _tmp6 = *(this + 12)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 12($t0) 	# load with offset
	  sw $t2, -32($fp)	# spill _tmp6 from $t2 to $fp-32
	# _tmp7 = *(_tmp6)
	  lw $t0, -32($fp)	# fill _tmp6 to $t0 from $fp-32
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -36($fp)	# spill _tmp7 from $t2 to $fp-36
	# _tmp8 = *(_tmp7 + 8)
	  lw $t0, -36($fp)	# fill _tmp7 to $t0 from $fp-36
	  lw $t2, 8($t0) 	# load with offset
	  sw $t2, -40($fp)	# spill _tmp8 from $t2 to $fp-40
	# PushParam _tmp6
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -32($fp)	# fill _tmp6 to $t0 from $fp-32
	  sw $t0, 4($sp)	# copy param value to stack
	# ACall _tmp8
	  lw $t0, -40($fp)	# fill _tmp8 to $t0 from $fp-40
	  jalr $t0            	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# Goto endif_93
	  b endif_93		# unconditional branch
  else_92:
  endif_93:
	# _tmp9 = *(this)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -44($fp)	# spill _tmp9 from $t2 to $fp-44
	# _tmp10 = *(_tmp9 + 8)
	  lw $t0, -44($fp)	# fill _tmp9 to $t0 from $fp-44
	  lw $t2, 8($t0) 	# load with offset
	  sw $t2, -48($fp)	# spill _tmp10 from $t2 to $fp-48
	# PushParam this
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  sw $t0, 4($sp)	# copy param value to stack
	# ACall _tmp10
	  lw $t0, -48($fp)	# fill _tmp10 to $t0 from $fp-48
	  jalr $t0            	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp11 = "\nDealer starts. "
	  .data			# create string constant marked with label
	  _string62: .asciiz "\nDealer starts. "
	  .text
	  la $t2, _string62	# load label
	  sw $t2, -52($fp)	# spill _tmp11 from $t2 to $fp-52
	# PushParam _tmp11
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -52($fp)	# fill _tmp11 to $t0 from $fp-52
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp12 = *(this + 8)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 8($t0) 	# load with offset
	  sw $t2, -56($fp)	# spill _tmp12 from $t2 to $fp-56
	# _tmp13 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -60($fp)	# spill _tmp13 from $t2 to $fp-60
	# _tmp14 = *(_tmp12)
	  lw $t0, -56($fp)	# fill _tmp12 to $t0 from $fp-56
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -64($fp)	# spill _tmp14 from $t2 to $fp-64
	# _tmp15 = *(_tmp14)
	  lw $t0, -64($fp)	# fill _tmp14 to $t0 from $fp-64
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -68($fp)	# spill _tmp15 from $t2 to $fp-68
	# PushParam _tmp13
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -60($fp)	# fill _tmp13 to $t0 from $fp-60
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam _tmp12
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -56($fp)	# fill _tmp12 to $t0 from $fp-56
	  sw $t0, 4($sp)	# copy param value to stack
	# ACall _tmp15
	  lw $t0, -68($fp)	# fill _tmp15 to $t0 from $fp-68
	  jalr $t0            	# jump to function
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# _tmp16 = *(this + 8)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 8($t0) 	# load with offset
	  sw $t2, -72($fp)	# spill _tmp16 from $t2 to $fp-72
	# _tmp17 = *(this + 12)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 12($t0) 	# load with offset
	  sw $t2, -76($fp)	# spill _tmp17 from $t2 to $fp-76
	# _tmp18 = *(_tmp16)
	  lw $t0, -72($fp)	# fill _tmp16 to $t0 from $fp-72
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -80($fp)	# spill _tmp18 from $t2 to $fp-80
	# _tmp19 = *(_tmp18 + 4)
	  lw $t0, -80($fp)	# fill _tmp18 to $t0 from $fp-80
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -84($fp)	# spill _tmp19 from $t2 to $fp-84
	# PushParam _tmp17
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -76($fp)	# fill _tmp17 to $t0 from $fp-76
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam _tmp16
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -72($fp)	# fill _tmp16 to $t0 from $fp-72
	  sw $t0, 4($sp)	# copy param value to stack
	# ACall _tmp19
	  lw $t0, -84($fp)	# fill _tmp19 to $t0 from $fp-84
	  jalr $t0            	# jump to function
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# _tmp20 = *(this)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -88($fp)	# spill _tmp20 from $t2 to $fp-88
	# _tmp21 = *(_tmp20 + 12)
	  lw $t0, -88($fp)	# fill _tmp20 to $t0 from $fp-88
	  lw $t2, 12($t0) 	# load with offset
	  sw $t2, -92($fp)	# spill _tmp21 from $t2 to $fp-92
	# PushParam this
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  sw $t0, 4($sp)	# copy param value to stack
	# ACall _tmp21
	  lw $t0, -92($fp)	# fill _tmp21 to $t0 from $fp-92
	  jalr $t0            	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp22 = *(this + 8)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 8($t0) 	# load with offset
	  sw $t2, -96($fp)	# spill _tmp22 from $t2 to $fp-96
	# _tmp23 = *(this + 12)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 12($t0) 	# load with offset
	  sw $t2, -100($fp)	# spill _tmp23 from $t2 to $fp-100
	# _tmp24 = *(_tmp22)
	  lw $t0, -96($fp)	# fill _tmp22 to $t0 from $fp-96
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -104($fp)	# spill _tmp24 from $t2 to $fp-104
	# _tmp25 = *(_tmp24 + 12)
	  lw $t0, -104($fp)	# fill _tmp24 to $t0 from $fp-104
	  lw $t2, 12($t0) 	# load with offset
	  sw $t2, -108($fp)	# spill _tmp25 from $t2 to $fp-108
	# PushParam _tmp23
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -100($fp)	# fill _tmp23 to $t0 from $fp-100
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam _tmp22
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -96($fp)	# fill _tmp22 to $t0 from $fp-96
	  sw $t0, 4($sp)	# copy param value to stack
	# ACall _tmp25
	  lw $t0, -108($fp)	# fill _tmp25 to $t0 from $fp-108
	  jalr $t0            	# jump to function
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# _tmp26 = *(this)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -112($fp)	# spill _tmp26 from $t2 to $fp-112
	# _tmp27 = *(_tmp26 + 16)
	  lw $t0, -112($fp)	# fill _tmp26 to $t0 from $fp-112
	  lw $t2, 16($t0) 	# load with offset
	  sw $t2, -116($fp)	# spill _tmp27 from $t2 to $fp-116
	# PushParam this
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  sw $t0, 4($sp)	# copy param value to stack
	# ACall _tmp27
	  lw $t0, -116($fp)	# fill _tmp27 to $t0 from $fp-116
	  jalr $t0            	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# VTable for class House
	  .data
	  .align 2
	  House:		# label for class House vtable
	  .word House_SetupGame
	  .word House_SetupPlayers
	  .word House_TakeAllBets
	  .word House_TakeAllTurns
	  .word House_ResolveAllPlayers
	  .word House_PrintAllMoney
	  .word House_PlayOneGame
	  .text
  _GetYesOrNo:
	# BeginFunc 32
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 32	# decrement sp to make space for locals/temps
	# PushParam prompt
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, 4($fp)	# fill prompt to $t0 from $fp+4
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp1 = " (y/n) "
	  .data			# create string constant marked with label
	  _string63: .asciiz " (y/n) "
	  .text
	  la $t2, _string63	# load label
	  sw $t2, -12($fp)	# spill _tmp1 from $t2 to $fp-12
	# PushParam _tmp1
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -12($fp)	# fill _tmp1 to $t0 from $fp-12
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp2 = LCall _ReadLine
	  jal _ReadLine      	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -16($fp)	# spill _tmp2 from $t2 to $fp-16
	# answer = _tmp2
	  lw $t2, -16($fp)	# fill _tmp2 to $t2 from $fp-16
	  sw $t2, -8($fp)	# spill answer from $t2 to $fp-8
	# _tmp3 = "y"
	  .data			# create string constant marked with label
	  _string64: .asciiz "y"
	  .text
	  la $t2, _string64	# load label
	  sw $t2, -20($fp)	# spill _tmp3 from $t2 to $fp-20
	# PushParam _tmp3
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -20($fp)	# fill _tmp3 to $t0 from $fp-20
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam answer
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -8($fp)	# fill answer to $t0 from $fp-8
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp4 = LCall _StringEqual
	  jal _StringEqual   	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -24($fp)	# spill _tmp4 from $t2 to $fp-24
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# _tmp5 = "Y"
	  .data			# create string constant marked with label
	  _string65: .asciiz "Y"
	  .text
	  la $t2, _string65	# load label
	  sw $t2, -28($fp)	# spill _tmp5 from $t2 to $fp-28
	# PushParam _tmp5
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -28($fp)	# fill _tmp5 to $t0 from $fp-28
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam answer
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -8($fp)	# fill answer to $t0 from $fp-8
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp6 = LCall _StringEqual
	  jal _StringEqual   	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -32($fp)	# spill _tmp6 from $t2 to $fp-32
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# _tmp7 = _tmp4 || _tmp6
	  lw $t0, -24($fp)	# fill _tmp4 to $t0 from $fp-24
	  lw $t1, -32($fp)	# fill _tmp6 to $t1 from $fp-32
	  or $t2, $t0, $t1	
	  sw $t2, -36($fp)	# spill _tmp7 from $t2 to $fp-36
	# Return _tmp7
	  lw $t2, -36($fp)	# fill _tmp7 to $t2 from $fp-36
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
  main:
	# BeginFunc 76
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 76	# decrement sp to make space for locals/temps
	# _tmp2 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -16($fp)	# spill _tmp2 from $t2 to $fp-16
	# keepPlaying = _tmp2
	  lw $t2, -16($fp)	# fill _tmp2 to $t2 from $fp-16
	  sw $t2, -8($fp)	# spill keepPlaying from $t2 to $fp-8
	# _tmp3 = 16
	  li $t2, 16		# load constant value 16 into $t2
	  sw $t2, -20($fp)	# spill _tmp3 from $t2 to $fp-20
	# PushParam _tmp3
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -20($fp)	# fill _tmp3 to $t0 from $fp-20
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp4 = LCall _Alloc
	  jal _Alloc         	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -24($fp)	# spill _tmp4 from $t2 to $fp-24
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp5 = House
	  la $t2, House	# load label
	  sw $t2, -28($fp)	# spill _tmp5 from $t2 to $fp-28
	# *(_tmp4) = _tmp5
	  lw $t0, -28($fp)	# fill _tmp5 to $t0 from $fp-28
	  lw $t2, -24($fp)	# fill _tmp4 to $t2 from $fp-24
	  sw $t0, 0($t2) 	# store with offset
	# house = _tmp4
	  lw $t2, -24($fp)	# fill _tmp4 to $t2 from $fp-24
	  sw $t2, -12($fp)	# spill house from $t2 to $fp-12
	# _tmp6 = *(house)
	  lw $t0, -12($fp)	# fill house to $t0 from $fp-12
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -32($fp)	# spill _tmp6 from $t2 to $fp-32
	# _tmp7 = *(_tmp6)
	  lw $t0, -32($fp)	# fill _tmp6 to $t0 from $fp-32
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -36($fp)	# spill _tmp7 from $t2 to $fp-36
	# PushParam house
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -12($fp)	# fill house to $t0 from $fp-12
	  sw $t0, 4($sp)	# copy param value to stack
	# ACall _tmp7
	  lw $t0, -36($fp)	# fill _tmp7 to $t0 from $fp-36
	  jalr $t0            	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp8 = *(house)
	  lw $t0, -12($fp)	# fill house to $t0 from $fp-12
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -40($fp)	# spill _tmp8 from $t2 to $fp-40
	# _tmp9 = *(_tmp8 + 4)
	  lw $t0, -40($fp)	# fill _tmp8 to $t0 from $fp-40
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -44($fp)	# spill _tmp9 from $t2 to $fp-44
	# PushParam house
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -12($fp)	# fill house to $t0 from $fp-12
	  sw $t0, 4($sp)	# copy param value to stack
	# ACall _tmp9
	  lw $t0, -44($fp)	# fill _tmp9 to $t0 from $fp-44
	  jalr $t0            	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
  loopBegin_94:
	# IfZ keepPlaying Goto loopEnd_95
	  lw $t0, -8($fp)	# fill keepPlaying to $t0 from $fp-8
	  beqz $t0, loopEnd_95	# branch if keepPlaying is zero 
	# _tmp10 = *(house)
	  lw $t0, -12($fp)	# fill house to $t0 from $fp-12
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -48($fp)	# spill _tmp10 from $t2 to $fp-48
	# _tmp11 = *(_tmp10 + 24)
	  lw $t0, -48($fp)	# fill _tmp10 to $t0 from $fp-48
	  lw $t2, 24($t0) 	# load with offset
	  sw $t2, -52($fp)	# spill _tmp11 from $t2 to $fp-52
	# PushParam house
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -12($fp)	# fill house to $t0 from $fp-12
	  sw $t0, 4($sp)	# copy param value to stack
	# ACall _tmp11
	  lw $t0, -52($fp)	# fill _tmp11 to $t0 from $fp-52
	  jalr $t0            	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp12 = "\nDo you want to play another hand?"
	  .data			# create string constant marked with label
	  _string66: .asciiz "\nDo you want to play another hand?"
	  .text
	  la $t2, _string66	# load label
	  sw $t2, -56($fp)	# spill _tmp12 from $t2 to $fp-56
	# PushParam _tmp12
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -56($fp)	# fill _tmp12 to $t0 from $fp-56
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp13 = LCall _GetYesOrNo
	  jal _GetYesOrNo    	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -60($fp)	# spill _tmp13 from $t2 to $fp-60
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# keepPlaying = _tmp13
	  lw $t2, -60($fp)	# fill _tmp13 to $t2 from $fp-60
	  sw $t2, -8($fp)	# spill keepPlaying from $t2 to $fp-8
	# Goto loopBegin_94
	  b loopBegin_94		# unconditional branch
  loopEnd_95:
	# _tmp14 = *(house)
	  lw $t0, -12($fp)	# fill house to $t0 from $fp-12
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -64($fp)	# spill _tmp14 from $t2 to $fp-64
	# _tmp15 = *(_tmp14 + 20)
	  lw $t0, -64($fp)	# fill _tmp14 to $t0 from $fp-64
	  lw $t2, 20($t0) 	# load with offset
	  sw $t2, -68($fp)	# spill _tmp15 from $t2 to $fp-68
	# PushParam house
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -12($fp)	# fill house to $t0 from $fp-12
	  sw $t0, 4($sp)	# copy param value to stack
	# ACall _tmp15
	  lw $t0, -68($fp)	# fill _tmp15 to $t0 from $fp-68
	  jalr $t0            	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp16 = "Thank you for playing...come again soon.\n"
	  .data			# create string constant marked with label
	  _string67: .asciiz "Thank you for playing...come again soon.\n"
	  .text
	  la $t2, _string67	# load label
	  sw $t2, -72($fp)	# spill _tmp16 from $t2 to $fp-72
	# PushParam _tmp16
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -72($fp)	# fill _tmp16 to $t0 from $fp-72
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp17 = "\nCS143 BlackJack Copyright (c) 1999 by Peter Mor..."
	  .data			# create string constant marked with label
	  _string68: .asciiz "\nCS143 BlackJack Copyright (c) 1999 by Peter Mork.\n"
	  .text
	  la $t2, _string68	# load label
	  sw $t2, -76($fp)	# spill _tmp17 from $t2 to $fp-76
	# PushParam _tmp17
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -76($fp)	# fill _tmp17 to $t0 from $fp-76
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp18 = "(2001 mods by jdz)\n"
	  .data			# create string constant marked with label
	  _string69: .asciiz "(2001 mods by jdz)\n"
	  .text
	  la $t2, _string69	# load label
	  sw $t2, -80($fp)	# spill _tmp18 from $t2 to $fp-80
	# PushParam _tmp18
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -80($fp)	# fill _tmp18 to $t0 from $fp-80
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
