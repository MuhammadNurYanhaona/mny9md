	# standard Decaf preamble 
	  .text
	  .align 2
	  .globl main
  rndModule_Init:
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
  rndModule_Random:
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
  rndModule_RndInt:
	# BeginFunc 36
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 36	# decrement sp to make space for locals/temps
	# _tmp1 = *(this)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -12($fp)	# spill _tmp1 from $t2 to $fp-12
	# _tmp2 = *(_tmp1 + 4)
	  lw $t0, -12($fp)	# fill _tmp1 to $t0 from $fp-12
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -16($fp)	# spill _tmp2 from $t2 to $fp-16
	# PushParam this
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp3 = ACall _tmp2
	  lw $t0, -16($fp)	# fill _tmp2 to $t0 from $fp-16
	  jalr $t0            	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -20($fp)	# spill _tmp3 from $t2 to $fp-20
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# randomNum = _tmp3
	  lw $t2, -20($fp)	# fill _tmp3 to $t2 from $fp-20
	  sw $t2, -8($fp)	# spill randomNum from $t2 to $fp-8
	# _tmp4 = max - min
	  lw $t0, 12($fp)	# fill max to $t0 from $fp+12
	  lw $t1, 8($fp)	# fill min to $t1 from $fp+8
	  sub $t2, $t0, $t1	
	  sw $t2, -24($fp)	# spill _tmp4 from $t2 to $fp-24
	# _tmp5 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -28($fp)	# spill _tmp5 from $t2 to $fp-28
	# _tmp6 = _tmp4 + _tmp5
	  lw $t0, -24($fp)	# fill _tmp4 to $t0 from $fp-24
	  lw $t1, -28($fp)	# fill _tmp5 to $t1 from $fp-28
	  add $t2, $t0, $t1	
	  sw $t2, -32($fp)	# spill _tmp6 from $t2 to $fp-32
	# _tmp7 = randomNum % _tmp6
	  lw $t0, -8($fp)	# fill randomNum to $t0 from $fp-8
	  lw $t1, -32($fp)	# fill _tmp6 to $t1 from $fp-32
	  rem $t2, $t0, $t1	
	  sw $t2, -36($fp)	# spill _tmp7 from $t2 to $fp-36
	# _tmp8 = _tmp7 + min
	  lw $t0, -36($fp)	# fill _tmp7 to $t0 from $fp-36
	  lw $t1, 8($fp)	# fill min to $t1 from $fp+8
	  add $t2, $t0, $t1	
	  sw $t2, -40($fp)	# spill _tmp8 from $t2 to $fp-40
	# Return _tmp8
	  lw $t2, -40($fp)	# fill _tmp8 to $t2 from $fp-40
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
	# VTable for class rndModule
	  .data
	  .align 2
	  rndModule:		# label for class rndModule vtable
	  .word rndModule_Init
	  .word rndModule_Random
	  .word rndModule_RndInt
	  .text
  Square_Init:
	# BeginFunc 12
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 12	# decrement sp to make space for locals/temps
	# _tmp0 = 1
	  li $t2, 1		# load constant value 1 into $t2
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
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  Square_PrintSquare:
	# BeginFunc 28
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 28	# decrement sp to make space for locals/temps
	# _tmp0 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -8($fp)	# spill _tmp0 from $t2 to $fp-8
	# _tmp1 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -12($fp)	# spill _tmp1 from $t2 to $fp-12
	# _tmp2 = _tmp0 == _tmp1
	  lw $t0, -8($fp)	# fill _tmp0 to $t0 from $fp-8
	  lw $t1, -12($fp)	# fill _tmp1 to $t1 from $fp-12
	  seq $t2, $t0, $t1	
	  sw $t2, -16($fp)	# spill _tmp2 from $t2 to $fp-16
	# IfZ _tmp2 Goto else_0
	  lw $t0, -16($fp)	# fill _tmp2 to $t0 from $fp-16
	  beqz $t0, else_0	# branch if _tmp2 is zero 
	# _tmp3 = " "
	  .data			# create string constant marked with label
	  _string1: .asciiz " "
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
	# _tmp4 = *(this + 8)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 8($t0) 	# load with offset
	  sw $t2, -24($fp)	# spill _tmp4 from $t2 to $fp-24
	# PushParam _tmp4
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -24($fp)	# fill _tmp4 to $t0 from $fp-24
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp5 = " "
	  .data			# create string constant marked with label
	  _string2: .asciiz " "
	  .text
	  la $t2, _string2	# load label
	  sw $t2, -28($fp)	# spill _tmp5 from $t2 to $fp-28
	# PushParam _tmp5
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -28($fp)	# fill _tmp5 to $t0 from $fp-28
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# Goto endif_1
	  b endif_1		# unconditional branch
  else_0:
	# _tmp6 = "   "
	  .data			# create string constant marked with label
	  _string3: .asciiz "   "
	  .text
	  la $t2, _string3	# load label
	  sw $t2, -32($fp)	# spill _tmp6 from $t2 to $fp-32
	# PushParam _tmp6
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -32($fp)	# fill _tmp6 to $t0 from $fp-32
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
  endif_1:
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  Square_SetIsEmpty:
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
	# *(_tmp1) = isEmpty
	  lw $t0, 8($fp)	# fill isEmpty to $t0 from $fp+8
	  lw $t2, -12($fp)	# fill _tmp1 to $t2 from $fp-12
	  sw $t0, 0($t2) 	# store with offset
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  Square_GetIsEmpty:
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
  Square_SetMark:
	# BeginFunc 8
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 8	# decrement sp to make space for locals/temps
	# _tmp0 = 8
	  li $t2, 8		# load constant value 8 into $t2
	  sw $t2, -8($fp)	# spill _tmp0 from $t2 to $fp-8
	# _tmp1 = this + _tmp0
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t1, -8($fp)	# fill _tmp0 to $t1 from $fp-8
	  add $t2, $t0, $t1	
	  sw $t2, -12($fp)	# spill _tmp1 from $t2 to $fp-12
	# *(_tmp1) = mark
	  lw $t0, 8($fp)	# fill mark to $t0 from $fp+8
	  lw $t2, -12($fp)	# fill _tmp1 to $t2 from $fp-12
	  sw $t0, 0($t2) 	# store with offset
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  Square_IsMarked:
	# BeginFunc 16
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 16	# decrement sp to make space for locals/temps
	# _tmp0 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -8($fp)	# spill _tmp0 from $t2 to $fp-8
	# IfZ _tmp0 Goto else_2
	  lw $t0, -8($fp)	# fill _tmp0 to $t0 from $fp-8
	  beqz $t0, else_2	# branch if _tmp0 is zero 
	# _tmp1 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -12($fp)	# spill _tmp1 from $t2 to $fp-12
	# Return _tmp1
	  lw $t2, -12($fp)	# fill _tmp1 to $t2 from $fp-12
	  move $v0, $t2		# assign return value into $v0
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# Goto endif_3
	  b endif_3		# unconditional branch
  else_2:
	# _tmp2 = *(this + 8)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 8($t0) 	# load with offset
	  sw $t2, -16($fp)	# spill _tmp2 from $t2 to $fp-16
	# PushParam mark
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, 8($fp)	# fill mark to $t0 from $fp+8
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam _tmp2
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -16($fp)	# fill _tmp2 to $t0 from $fp-16
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp3 = LCall _StringEqual
	  jal _StringEqual   	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -20($fp)	# spill _tmp3 from $t2 to $fp-20
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# Return _tmp3
	  lw $t2, -20($fp)	# fill _tmp3 to $t2 from $fp-20
	  move $v0, $t2		# assign return value into $v0
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  endif_3:
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# VTable for class Square
	  .data
	  .align 2
	  Square:		# label for class Square vtable
	  .word Square_Init
	  .word Square_PrintSquare
	  .word Square_SetIsEmpty
	  .word Square_GetIsEmpty
	  .word Square_SetMark
	  .word Square_IsMarked
	  .text
  Player_GetMark:
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
  Player_GetName:
	# BeginFunc 4
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 4	# decrement sp to make space for locals/temps
	# _tmp0 = *(this + 8)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 8($t0) 	# load with offset
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
	# VTable for class Player
	  .data
	  .align 2
	  Player:		# label for class Player vtable
	  .word Player_GetMark
	  .word Player_GetName
	  .text
  Human_Init:
	# BeginFunc 28
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 28	# decrement sp to make space for locals/temps
	# _tmp0 = "X"
	  .data			# create string constant marked with label
	  _string4: .asciiz "X"
	  .text
	  la $t2, _string4	# load label
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
	# _tmp3 = "\nYou're playing against the computer.\nEnter you..."
	  .data			# create string constant marked with label
	  _string5: .asciiz "\nYou're playing against the computer.\nEnter your name: "
	  .text
	  la $t2, _string5	# load label
	  sw $t2, -20($fp)	# spill _tmp3 from $t2 to $fp-20
	# PushParam _tmp3
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -20($fp)	# fill _tmp3 to $t0 from $fp-20
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp4 = LCall _ReadLine
	  jal _ReadLine      	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -24($fp)	# spill _tmp4 from $t2 to $fp-24
	# _tmp5 = 8
	  li $t2, 8		# load constant value 8 into $t2
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
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  Human_GetRow:
	# BeginFunc 80
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 80	# decrement sp to make space for locals/temps
	# _tmp1 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -12($fp)	# spill _tmp1 from $t2 to $fp-12
	# _tmp2 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -16($fp)	# spill _tmp2 from $t2 to $fp-16
	# _tmp3 = _tmp1 - _tmp2
	  lw $t0, -12($fp)	# fill _tmp1 to $t0 from $fp-12
	  lw $t1, -16($fp)	# fill _tmp2 to $t1 from $fp-16
	  sub $t2, $t0, $t1	
	  sw $t2, -20($fp)	# spill _tmp3 from $t2 to $fp-20
	# row = _tmp3
	  lw $t2, -20($fp)	# fill _tmp3 to $t2 from $fp-20
	  sw $t2, -8($fp)	# spill row from $t2 to $fp-8
  loopBegin_4:
	# _tmp4 = 3
	  li $t2, 3		# load constant value 3 into $t2
	  sw $t2, -24($fp)	# spill _tmp4 from $t2 to $fp-24
	# _tmp5 = _tmp4 < row
	  lw $t0, -24($fp)	# fill _tmp4 to $t0 from $fp-24
	  lw $t1, -8($fp)	# fill row to $t1 from $fp-8
	  slt $t2, $t0, $t1	
	  sw $t2, -28($fp)	# spill _tmp5 from $t2 to $fp-28
	# _tmp6 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -32($fp)	# spill _tmp6 from $t2 to $fp-32
	# _tmp7 = row < _tmp6
	  lw $t0, -8($fp)	# fill row to $t0 from $fp-8
	  lw $t1, -32($fp)	# fill _tmp6 to $t1 from $fp-32
	  slt $t2, $t0, $t1	
	  sw $t2, -36($fp)	# spill _tmp7 from $t2 to $fp-36
	# _tmp8 = _tmp5 || _tmp7
	  lw $t0, -28($fp)	# fill _tmp5 to $t0 from $fp-28
	  lw $t1, -36($fp)	# fill _tmp7 to $t1 from $fp-36
	  or $t2, $t0, $t1	
	  sw $t2, -40($fp)	# spill _tmp8 from $t2 to $fp-40
	# IfZ _tmp8 Goto loopEnd_5
	  lw $t0, -40($fp)	# fill _tmp8 to $t0 from $fp-40
	  beqz $t0, loopEnd_5	# branch if _tmp8 is zero 
	# _tmp9 = *(this + 8)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 8($t0) 	# load with offset
	  sw $t2, -44($fp)	# spill _tmp9 from $t2 to $fp-44
	# PushParam _tmp9
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -44($fp)	# fill _tmp9 to $t0 from $fp-44
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp10 = " enter a row between 1 and 3: "
	  .data			# create string constant marked with label
	  _string6: .asciiz " enter a row between 1 and 3: "
	  .text
	  la $t2, _string6	# load label
	  sw $t2, -48($fp)	# spill _tmp10 from $t2 to $fp-48
	# PushParam _tmp10
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -48($fp)	# fill _tmp10 to $t0 from $fp-48
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp11 = LCall _ReadInteger
	  jal _ReadInteger   	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -52($fp)	# spill _tmp11 from $t2 to $fp-52
	# row = _tmp11
	  lw $t2, -52($fp)	# fill _tmp11 to $t2 from $fp-52
	  sw $t2, -8($fp)	# spill row from $t2 to $fp-8
	# _tmp12 = 3
	  li $t2, 3		# load constant value 3 into $t2
	  sw $t2, -56($fp)	# spill _tmp12 from $t2 to $fp-56
	# _tmp13 = _tmp12 < row
	  lw $t0, -56($fp)	# fill _tmp12 to $t0 from $fp-56
	  lw $t1, -8($fp)	# fill row to $t1 from $fp-8
	  slt $t2, $t0, $t1	
	  sw $t2, -60($fp)	# spill _tmp13 from $t2 to $fp-60
	# _tmp14 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -64($fp)	# spill _tmp14 from $t2 to $fp-64
	# _tmp15 = row < _tmp14
	  lw $t0, -8($fp)	# fill row to $t0 from $fp-8
	  lw $t1, -64($fp)	# fill _tmp14 to $t1 from $fp-64
	  slt $t2, $t0, $t1	
	  sw $t2, -68($fp)	# spill _tmp15 from $t2 to $fp-68
	# _tmp16 = _tmp13 || _tmp15
	  lw $t0, -60($fp)	# fill _tmp13 to $t0 from $fp-60
	  lw $t1, -68($fp)	# fill _tmp15 to $t1 from $fp-68
	  or $t2, $t0, $t1	
	  sw $t2, -72($fp)	# spill _tmp16 from $t2 to $fp-72
	# IfZ _tmp16 Goto else_6
	  lw $t0, -72($fp)	# fill _tmp16 to $t0 from $fp-72
	  beqz $t0, else_6	# branch if _tmp16 is zero 
	# _tmp17 = "Error: Pick a row between 1 and 3\n"
	  .data			# create string constant marked with label
	  _string7: .asciiz "Error: Pick a row between 1 and 3\n"
	  .text
	  la $t2, _string7	# load label
	  sw $t2, -76($fp)	# spill _tmp17 from $t2 to $fp-76
	# PushParam _tmp17
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -76($fp)	# fill _tmp17 to $t0 from $fp-76
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# Goto endif_7
	  b endif_7		# unconditional branch
  else_6:
  endif_7:
	# Goto loopBegin_4
	  b loopBegin_4		# unconditional branch
  loopEnd_5:
	# _tmp18 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -80($fp)	# spill _tmp18 from $t2 to $fp-80
	# _tmp19 = row - _tmp18
	  lw $t0, -8($fp)	# fill row to $t0 from $fp-8
	  lw $t1, -80($fp)	# fill _tmp18 to $t1 from $fp-80
	  sub $t2, $t0, $t1	
	  sw $t2, -84($fp)	# spill _tmp19 from $t2 to $fp-84
	# row = _tmp19
	  lw $t2, -84($fp)	# fill _tmp19 to $t2 from $fp-84
	  sw $t2, -8($fp)	# spill row from $t2 to $fp-8
	# Return row
	  lw $t2, -8($fp)	# fill row to $t2 from $fp-8
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
  Human_GetColumn:
	# BeginFunc 80
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 80	# decrement sp to make space for locals/temps
	# _tmp1 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -12($fp)	# spill _tmp1 from $t2 to $fp-12
	# _tmp2 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -16($fp)	# spill _tmp2 from $t2 to $fp-16
	# _tmp3 = _tmp1 - _tmp2
	  lw $t0, -12($fp)	# fill _tmp1 to $t0 from $fp-12
	  lw $t1, -16($fp)	# fill _tmp2 to $t1 from $fp-16
	  sub $t2, $t0, $t1	
	  sw $t2, -20($fp)	# spill _tmp3 from $t2 to $fp-20
	# column = _tmp3
	  lw $t2, -20($fp)	# fill _tmp3 to $t2 from $fp-20
	  sw $t2, -8($fp)	# spill column from $t2 to $fp-8
  loopBegin_8:
	# _tmp4 = 3
	  li $t2, 3		# load constant value 3 into $t2
	  sw $t2, -24($fp)	# spill _tmp4 from $t2 to $fp-24
	# _tmp5 = _tmp4 < column
	  lw $t0, -24($fp)	# fill _tmp4 to $t0 from $fp-24
	  lw $t1, -8($fp)	# fill column to $t1 from $fp-8
	  slt $t2, $t0, $t1	
	  sw $t2, -28($fp)	# spill _tmp5 from $t2 to $fp-28
	# _tmp6 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -32($fp)	# spill _tmp6 from $t2 to $fp-32
	# _tmp7 = column < _tmp6
	  lw $t0, -8($fp)	# fill column to $t0 from $fp-8
	  lw $t1, -32($fp)	# fill _tmp6 to $t1 from $fp-32
	  slt $t2, $t0, $t1	
	  sw $t2, -36($fp)	# spill _tmp7 from $t2 to $fp-36
	# _tmp8 = _tmp5 || _tmp7
	  lw $t0, -28($fp)	# fill _tmp5 to $t0 from $fp-28
	  lw $t1, -36($fp)	# fill _tmp7 to $t1 from $fp-36
	  or $t2, $t0, $t1	
	  sw $t2, -40($fp)	# spill _tmp8 from $t2 to $fp-40
	# IfZ _tmp8 Goto loopEnd_9
	  lw $t0, -40($fp)	# fill _tmp8 to $t0 from $fp-40
	  beqz $t0, loopEnd_9	# branch if _tmp8 is zero 
	# _tmp9 = *(this + 8)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 8($t0) 	# load with offset
	  sw $t2, -44($fp)	# spill _tmp9 from $t2 to $fp-44
	# PushParam _tmp9
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -44($fp)	# fill _tmp9 to $t0 from $fp-44
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp10 = " enter a column between 1 and 3: "
	  .data			# create string constant marked with label
	  _string8: .asciiz " enter a column between 1 and 3: "
	  .text
	  la $t2, _string8	# load label
	  sw $t2, -48($fp)	# spill _tmp10 from $t2 to $fp-48
	# PushParam _tmp10
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -48($fp)	# fill _tmp10 to $t0 from $fp-48
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp11 = LCall _ReadInteger
	  jal _ReadInteger   	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -52($fp)	# spill _tmp11 from $t2 to $fp-52
	# column = _tmp11
	  lw $t2, -52($fp)	# fill _tmp11 to $t2 from $fp-52
	  sw $t2, -8($fp)	# spill column from $t2 to $fp-8
	# _tmp12 = 3
	  li $t2, 3		# load constant value 3 into $t2
	  sw $t2, -56($fp)	# spill _tmp12 from $t2 to $fp-56
	# _tmp13 = _tmp12 < column
	  lw $t0, -56($fp)	# fill _tmp12 to $t0 from $fp-56
	  lw $t1, -8($fp)	# fill column to $t1 from $fp-8
	  slt $t2, $t0, $t1	
	  sw $t2, -60($fp)	# spill _tmp13 from $t2 to $fp-60
	# _tmp14 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -64($fp)	# spill _tmp14 from $t2 to $fp-64
	# _tmp15 = column < _tmp14
	  lw $t0, -8($fp)	# fill column to $t0 from $fp-8
	  lw $t1, -64($fp)	# fill _tmp14 to $t1 from $fp-64
	  slt $t2, $t0, $t1	
	  sw $t2, -68($fp)	# spill _tmp15 from $t2 to $fp-68
	# _tmp16 = _tmp13 || _tmp15
	  lw $t0, -60($fp)	# fill _tmp13 to $t0 from $fp-60
	  lw $t1, -68($fp)	# fill _tmp15 to $t1 from $fp-68
	  or $t2, $t0, $t1	
	  sw $t2, -72($fp)	# spill _tmp16 from $t2 to $fp-72
	# IfZ _tmp16 Goto else_10
	  lw $t0, -72($fp)	# fill _tmp16 to $t0 from $fp-72
	  beqz $t0, else_10	# branch if _tmp16 is zero 
	# _tmp17 = "Error: Pick a column between 1 and 3\n"
	  .data			# create string constant marked with label
	  _string9: .asciiz "Error: Pick a column between 1 and 3\n"
	  .text
	  la $t2, _string9	# load label
	  sw $t2, -76($fp)	# spill _tmp17 from $t2 to $fp-76
	# PushParam _tmp17
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -76($fp)	# fill _tmp17 to $t0 from $fp-76
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# Goto endif_11
	  b endif_11		# unconditional branch
  else_10:
  endif_11:
	# Goto loopBegin_8
	  b loopBegin_8		# unconditional branch
  loopEnd_9:
	# _tmp18 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -80($fp)	# spill _tmp18 from $t2 to $fp-80
	# _tmp19 = column - _tmp18
	  lw $t0, -8($fp)	# fill column to $t0 from $fp-8
	  lw $t1, -80($fp)	# fill _tmp18 to $t1 from $fp-80
	  sub $t2, $t0, $t1	
	  sw $t2, -84($fp)	# spill _tmp19 from $t2 to $fp-84
	# column = _tmp19
	  lw $t2, -84($fp)	# fill _tmp19 to $t2 from $fp-84
	  sw $t2, -8($fp)	# spill column from $t2 to $fp-8
	# Return column
	  lw $t2, -8($fp)	# fill column to $t2 from $fp-8
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
	# VTable for class Human
	  .data
	  .align 2
	  Human:		# label for class Human vtable
	  .word Player_GetMark
	  .word Player_GetName
	  .word Human_Init
	  .word Human_GetRow
	  .word Human_GetColumn
	  .text
  Grid_Init:
	# BeginFunc 424
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 424	# decrement sp to make space for locals/temps
	# _tmp2 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -16($fp)	# spill _tmp2 from $t2 to $fp-16
	# i = _tmp2
	  lw $t2, -16($fp)	# fill _tmp2 to $t2 from $fp-16
	  sw $t2, -8($fp)	# spill i from $t2 to $fp-8
	# _tmp3 = 3
	  li $t2, 3		# load constant value 3 into $t2
	  sw $t2, -20($fp)	# spill _tmp3 from $t2 to $fp-20
	# _tmp4 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -24($fp)	# spill _tmp4 from $t2 to $fp-24
	# _tmp5 = _tmp3 < _tmp4
	  lw $t0, -20($fp)	# fill _tmp3 to $t0 from $fp-20
	  lw $t1, -24($fp)	# fill _tmp4 to $t1 from $fp-24
	  slt $t2, $t0, $t1	
	  sw $t2, -28($fp)	# spill _tmp5 from $t2 to $fp-28
	# IfZ _tmp5 Goto allocate_12
	  lw $t0, -28($fp)	# fill _tmp5 to $t0 from $fp-28
	  beqz $t0, allocate_12	# branch if _tmp5 is zero 
	# _tmp6 = "Decaf runtime error: Array size is <= 0\n"
	  .data			# create string constant marked with label
	  _string10: .asciiz "Decaf runtime error: Array size is <= 0\n"
	  .text
	  la $t2, _string10	# load label
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
  allocate_12:
	# _tmp7 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -36($fp)	# spill _tmp7 from $t2 to $fp-36
	# _tmp8 = _tmp3 * _tmp7
	  lw $t0, -20($fp)	# fill _tmp3 to $t0 from $fp-20
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
	# *(_tmp10) = _tmp3
	  lw $t0, -20($fp)	# fill _tmp3 to $t0 from $fp-20
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
  loopBegin_13:
	# _tmp13 = 3
	  li $t2, 3		# load constant value 3 into $t2
	  sw $t2, -60($fp)	# spill _tmp13 from $t2 to $fp-60
	# _tmp14 = i < _tmp13
	  lw $t0, -8($fp)	# fill i to $t0 from $fp-8
	  lw $t1, -60($fp)	# fill _tmp13 to $t1 from $fp-60
	  slt $t2, $t0, $t1	
	  sw $t2, -64($fp)	# spill _tmp14 from $t2 to $fp-64
	# IfZ _tmp14 Goto loopEnd_14
	  lw $t0, -64($fp)	# fill _tmp14 to $t0 from $fp-64
	  beqz $t0, loopEnd_14	# branch if _tmp14 is zero 
	# _tmp15 = 3
	  li $t2, 3		# load constant value 3 into $t2
	  sw $t2, -68($fp)	# spill _tmp15 from $t2 to $fp-68
	# _tmp16 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -72($fp)	# spill _tmp16 from $t2 to $fp-72
	# _tmp17 = _tmp15 < _tmp16
	  lw $t0, -68($fp)	# fill _tmp15 to $t0 from $fp-68
	  lw $t1, -72($fp)	# fill _tmp16 to $t1 from $fp-72
	  slt $t2, $t0, $t1	
	  sw $t2, -76($fp)	# spill _tmp17 from $t2 to $fp-76
	# IfZ _tmp17 Goto allocate_15
	  lw $t0, -76($fp)	# fill _tmp17 to $t0 from $fp-76
	  beqz $t0, allocate_15	# branch if _tmp17 is zero 
	# _tmp18 = "Decaf runtime error: Array size is <= 0\n"
	  .data			# create string constant marked with label
	  _string11: .asciiz "Decaf runtime error: Array size is <= 0\n"
	  .text
	  la $t2, _string11	# load label
	  sw $t2, -80($fp)	# spill _tmp18 from $t2 to $fp-80
	# PushParam _tmp18
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -80($fp)	# fill _tmp18 to $t0 from $fp-80
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  allocate_15:
	# _tmp19 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -84($fp)	# spill _tmp19 from $t2 to $fp-84
	# _tmp20 = _tmp15 * _tmp19
	  lw $t0, -68($fp)	# fill _tmp15 to $t0 from $fp-68
	  lw $t1, -84($fp)	# fill _tmp19 to $t1 from $fp-84
	  mul $t2, $t0, $t1	
	  sw $t2, -88($fp)	# spill _tmp20 from $t2 to $fp-88
	# _tmp21 = _tmp20 + _tmp19
	  lw $t0, -88($fp)	# fill _tmp20 to $t0 from $fp-88
	  lw $t1, -84($fp)	# fill _tmp19 to $t1 from $fp-84
	  add $t2, $t0, $t1	
	  sw $t2, -92($fp)	# spill _tmp21 from $t2 to $fp-92
	# PushParam _tmp21
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -92($fp)	# fill _tmp21 to $t0 from $fp-92
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp22 = LCall _Alloc
	  jal _Alloc         	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -96($fp)	# spill _tmp22 from $t2 to $fp-96
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# *(_tmp22) = _tmp15
	  lw $t0, -68($fp)	# fill _tmp15 to $t0 from $fp-68
	  lw $t2, -96($fp)	# fill _tmp22 to $t2 from $fp-96
	  sw $t0, 0($t2) 	# store with offset
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
	# IfZ _tmp30 Goto arrayAcc_16
	  lw $t0, -128($fp)	# fill _tmp30 to $t0 from $fp-128
	  beqz $t0, arrayAcc_16	# branch if _tmp30 is zero 
	# _tmp31 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string12: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string12	# load label
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
  arrayAcc_16:
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
	# *(_tmp35) = _tmp22
	  lw $t0, -96($fp)	# fill _tmp22 to $t0 from $fp-96
	  lw $t2, -148($fp)	# fill _tmp35 to $t2 from $fp-148
	  sw $t0, 0($t2) 	# store with offset
	# _tmp36 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -152($fp)	# spill _tmp36 from $t2 to $fp-152
	# _tmp37 = i + _tmp36
	  lw $t0, -8($fp)	# fill i to $t0 from $fp-8
	  lw $t1, -152($fp)	# fill _tmp36 to $t1 from $fp-152
	  add $t2, $t0, $t1	
	  sw $t2, -156($fp)	# spill _tmp37 from $t2 to $fp-156
	# i = _tmp37
	  lw $t2, -156($fp)	# fill _tmp37 to $t2 from $fp-156
	  sw $t2, -8($fp)	# spill i from $t2 to $fp-8
	# Goto loopBegin_13
	  b loopBegin_13		# unconditional branch
  loopEnd_14:
	# _tmp38 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -160($fp)	# spill _tmp38 from $t2 to $fp-160
	# i = _tmp38
	  lw $t2, -160($fp)	# fill _tmp38 to $t2 from $fp-160
	  sw $t2, -8($fp)	# spill i from $t2 to $fp-8
  loopBegin_17:
	# _tmp39 = 3
	  li $t2, 3		# load constant value 3 into $t2
	  sw $t2, -164($fp)	# spill _tmp39 from $t2 to $fp-164
	# _tmp40 = i < _tmp39
	  lw $t0, -8($fp)	# fill i to $t0 from $fp-8
	  lw $t1, -164($fp)	# fill _tmp39 to $t1 from $fp-164
	  slt $t2, $t0, $t1	
	  sw $t2, -168($fp)	# spill _tmp40 from $t2 to $fp-168
	# IfZ _tmp40 Goto loopEnd_18
	  lw $t0, -168($fp)	# fill _tmp40 to $t0 from $fp-168
	  beqz $t0, loopEnd_18	# branch if _tmp40 is zero 
	# _tmp41 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -172($fp)	# spill _tmp41 from $t2 to $fp-172
	# j = _tmp41
	  lw $t2, -172($fp)	# fill _tmp41 to $t2 from $fp-172
	  sw $t2, -12($fp)	# spill j from $t2 to $fp-12
  loopBegin_19:
	# _tmp42 = 3
	  li $t2, 3		# load constant value 3 into $t2
	  sw $t2, -176($fp)	# spill _tmp42 from $t2 to $fp-176
	# _tmp43 = j < _tmp42
	  lw $t0, -12($fp)	# fill j to $t0 from $fp-12
	  lw $t1, -176($fp)	# fill _tmp42 to $t1 from $fp-176
	  slt $t2, $t0, $t1	
	  sw $t2, -180($fp)	# spill _tmp43 from $t2 to $fp-180
	# IfZ _tmp43 Goto loopEnd_20
	  lw $t0, -180($fp)	# fill _tmp43 to $t0 from $fp-180
	  beqz $t0, loopEnd_20	# branch if _tmp43 is zero 
	# _tmp44 = 12
	  li $t2, 12		# load constant value 12 into $t2
	  sw $t2, -184($fp)	# spill _tmp44 from $t2 to $fp-184
	# PushParam _tmp44
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -184($fp)	# fill _tmp44 to $t0 from $fp-184
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp45 = LCall _Alloc
	  jal _Alloc         	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -188($fp)	# spill _tmp45 from $t2 to $fp-188
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp46 = Square
	  la $t2, Square	# load label
	  sw $t2, -192($fp)	# spill _tmp46 from $t2 to $fp-192
	# *(_tmp45) = _tmp46
	  lw $t0, -192($fp)	# fill _tmp46 to $t0 from $fp-192
	  lw $t2, -188($fp)	# fill _tmp45 to $t2 from $fp-188
	  sw $t0, 0($t2) 	# store with offset
	# _tmp47 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -196($fp)	# spill _tmp47 from $t2 to $fp-196
	# _tmp48 = *(_tmp47)
	  lw $t0, -196($fp)	# fill _tmp47 to $t0 from $fp-196
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -200($fp)	# spill _tmp48 from $t2 to $fp-200
	# _tmp49 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -204($fp)	# spill _tmp49 from $t2 to $fp-204
	# _tmp50 = i < _tmp49
	  lw $t0, -8($fp)	# fill i to $t0 from $fp-8
	  lw $t1, -204($fp)	# fill _tmp49 to $t1 from $fp-204
	  slt $t2, $t0, $t1	
	  sw $t2, -208($fp)	# spill _tmp50 from $t2 to $fp-208
	# _tmp51 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -212($fp)	# spill _tmp51 from $t2 to $fp-212
	# _tmp52 = _tmp48 - _tmp51
	  lw $t0, -200($fp)	# fill _tmp48 to $t0 from $fp-200
	  lw $t1, -212($fp)	# fill _tmp51 to $t1 from $fp-212
	  sub $t2, $t0, $t1	
	  sw $t2, -216($fp)	# spill _tmp52 from $t2 to $fp-216
	# _tmp53 = _tmp52 < i
	  lw $t0, -216($fp)	# fill _tmp52 to $t0 from $fp-216
	  lw $t1, -8($fp)	# fill i to $t1 from $fp-8
	  slt $t2, $t0, $t1	
	  sw $t2, -220($fp)	# spill _tmp53 from $t2 to $fp-220
	# _tmp54 = _tmp50 || _tmp53
	  lw $t0, -208($fp)	# fill _tmp50 to $t0 from $fp-208
	  lw $t1, -220($fp)	# fill _tmp53 to $t1 from $fp-220
	  or $t2, $t0, $t1	
	  sw $t2, -224($fp)	# spill _tmp54 from $t2 to $fp-224
	# IfZ _tmp54 Goto arrayAcc_21
	  lw $t0, -224($fp)	# fill _tmp54 to $t0 from $fp-224
	  beqz $t0, arrayAcc_21	# branch if _tmp54 is zero 
	# _tmp55 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string13: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string13	# load label
	  sw $t2, -228($fp)	# spill _tmp55 from $t2 to $fp-228
	# PushParam _tmp55
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -228($fp)	# fill _tmp55 to $t0 from $fp-228
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_21:
	# _tmp56 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -232($fp)	# spill _tmp56 from $t2 to $fp-232
	# _tmp57 = i * _tmp56
	  lw $t0, -8($fp)	# fill i to $t0 from $fp-8
	  lw $t1, -232($fp)	# fill _tmp56 to $t1 from $fp-232
	  mul $t2, $t0, $t1	
	  sw $t2, -236($fp)	# spill _tmp57 from $t2 to $fp-236
	# _tmp58 = _tmp47 + _tmp57
	  lw $t0, -196($fp)	# fill _tmp47 to $t0 from $fp-196
	  lw $t1, -236($fp)	# fill _tmp57 to $t1 from $fp-236
	  add $t2, $t0, $t1	
	  sw $t2, -240($fp)	# spill _tmp58 from $t2 to $fp-240
	# _tmp59 = _tmp58 + _tmp56
	  lw $t0, -240($fp)	# fill _tmp58 to $t0 from $fp-240
	  lw $t1, -232($fp)	# fill _tmp56 to $t1 from $fp-232
	  add $t2, $t0, $t1	
	  sw $t2, -244($fp)	# spill _tmp59 from $t2 to $fp-244
	# _tmp60 = *(_tmp59)
	  lw $t0, -244($fp)	# fill _tmp59 to $t0 from $fp-244
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -248($fp)	# spill _tmp60 from $t2 to $fp-248
	# _tmp61 = *(_tmp60)
	  lw $t0, -248($fp)	# fill _tmp60 to $t0 from $fp-248
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -252($fp)	# spill _tmp61 from $t2 to $fp-252
	# _tmp62 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -256($fp)	# spill _tmp62 from $t2 to $fp-256
	# _tmp63 = j < _tmp62
	  lw $t0, -12($fp)	# fill j to $t0 from $fp-12
	  lw $t1, -256($fp)	# fill _tmp62 to $t1 from $fp-256
	  slt $t2, $t0, $t1	
	  sw $t2, -260($fp)	# spill _tmp63 from $t2 to $fp-260
	# _tmp64 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -264($fp)	# spill _tmp64 from $t2 to $fp-264
	# _tmp65 = _tmp61 - _tmp64
	  lw $t0, -252($fp)	# fill _tmp61 to $t0 from $fp-252
	  lw $t1, -264($fp)	# fill _tmp64 to $t1 from $fp-264
	  sub $t2, $t0, $t1	
	  sw $t2, -268($fp)	# spill _tmp65 from $t2 to $fp-268
	# _tmp66 = _tmp65 < j
	  lw $t0, -268($fp)	# fill _tmp65 to $t0 from $fp-268
	  lw $t1, -12($fp)	# fill j to $t1 from $fp-12
	  slt $t2, $t0, $t1	
	  sw $t2, -272($fp)	# spill _tmp66 from $t2 to $fp-272
	# _tmp67 = _tmp63 || _tmp66
	  lw $t0, -260($fp)	# fill _tmp63 to $t0 from $fp-260
	  lw $t1, -272($fp)	# fill _tmp66 to $t1 from $fp-272
	  or $t2, $t0, $t1	
	  sw $t2, -276($fp)	# spill _tmp67 from $t2 to $fp-276
	# IfZ _tmp67 Goto arrayAcc_22
	  lw $t0, -276($fp)	# fill _tmp67 to $t0 from $fp-276
	  beqz $t0, arrayAcc_22	# branch if _tmp67 is zero 
	# _tmp68 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string14: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string14	# load label
	  sw $t2, -280($fp)	# spill _tmp68 from $t2 to $fp-280
	# PushParam _tmp68
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -280($fp)	# fill _tmp68 to $t0 from $fp-280
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_22:
	# _tmp69 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -284($fp)	# spill _tmp69 from $t2 to $fp-284
	# _tmp70 = j * _tmp69
	  lw $t0, -12($fp)	# fill j to $t0 from $fp-12
	  lw $t1, -284($fp)	# fill _tmp69 to $t1 from $fp-284
	  mul $t2, $t0, $t1	
	  sw $t2, -288($fp)	# spill _tmp70 from $t2 to $fp-288
	# _tmp71 = _tmp60 + _tmp70
	  lw $t0, -248($fp)	# fill _tmp60 to $t0 from $fp-248
	  lw $t1, -288($fp)	# fill _tmp70 to $t1 from $fp-288
	  add $t2, $t0, $t1	
	  sw $t2, -292($fp)	# spill _tmp71 from $t2 to $fp-292
	# _tmp72 = _tmp71 + _tmp69
	  lw $t0, -292($fp)	# fill _tmp71 to $t0 from $fp-292
	  lw $t1, -284($fp)	# fill _tmp69 to $t1 from $fp-284
	  add $t2, $t0, $t1	
	  sw $t2, -296($fp)	# spill _tmp72 from $t2 to $fp-296
	# *(_tmp72) = _tmp45
	  lw $t0, -188($fp)	# fill _tmp45 to $t0 from $fp-188
	  lw $t2, -296($fp)	# fill _tmp72 to $t2 from $fp-296
	  sw $t0, 0($t2) 	# store with offset
	# _tmp73 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -300($fp)	# spill _tmp73 from $t2 to $fp-300
	# _tmp74 = *(_tmp73)
	  lw $t0, -300($fp)	# fill _tmp73 to $t0 from $fp-300
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -304($fp)	# spill _tmp74 from $t2 to $fp-304
	# _tmp75 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -308($fp)	# spill _tmp75 from $t2 to $fp-308
	# _tmp76 = i < _tmp75
	  lw $t0, -8($fp)	# fill i to $t0 from $fp-8
	  lw $t1, -308($fp)	# fill _tmp75 to $t1 from $fp-308
	  slt $t2, $t0, $t1	
	  sw $t2, -312($fp)	# spill _tmp76 from $t2 to $fp-312
	# _tmp77 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -316($fp)	# spill _tmp77 from $t2 to $fp-316
	# _tmp78 = _tmp74 - _tmp77
	  lw $t0, -304($fp)	# fill _tmp74 to $t0 from $fp-304
	  lw $t1, -316($fp)	# fill _tmp77 to $t1 from $fp-316
	  sub $t2, $t0, $t1	
	  sw $t2, -320($fp)	# spill _tmp78 from $t2 to $fp-320
	# _tmp79 = _tmp78 < i
	  lw $t0, -320($fp)	# fill _tmp78 to $t0 from $fp-320
	  lw $t1, -8($fp)	# fill i to $t1 from $fp-8
	  slt $t2, $t0, $t1	
	  sw $t2, -324($fp)	# spill _tmp79 from $t2 to $fp-324
	# _tmp80 = _tmp76 || _tmp79
	  lw $t0, -312($fp)	# fill _tmp76 to $t0 from $fp-312
	  lw $t1, -324($fp)	# fill _tmp79 to $t1 from $fp-324
	  or $t2, $t0, $t1	
	  sw $t2, -328($fp)	# spill _tmp80 from $t2 to $fp-328
	# IfZ _tmp80 Goto arrayAcc_23
	  lw $t0, -328($fp)	# fill _tmp80 to $t0 from $fp-328
	  beqz $t0, arrayAcc_23	# branch if _tmp80 is zero 
	# _tmp81 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string15: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string15	# load label
	  sw $t2, -332($fp)	# spill _tmp81 from $t2 to $fp-332
	# PushParam _tmp81
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -332($fp)	# fill _tmp81 to $t0 from $fp-332
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_23:
	# _tmp82 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -336($fp)	# spill _tmp82 from $t2 to $fp-336
	# _tmp83 = i * _tmp82
	  lw $t0, -8($fp)	# fill i to $t0 from $fp-8
	  lw $t1, -336($fp)	# fill _tmp82 to $t1 from $fp-336
	  mul $t2, $t0, $t1	
	  sw $t2, -340($fp)	# spill _tmp83 from $t2 to $fp-340
	# _tmp84 = _tmp73 + _tmp83
	  lw $t0, -300($fp)	# fill _tmp73 to $t0 from $fp-300
	  lw $t1, -340($fp)	# fill _tmp83 to $t1 from $fp-340
	  add $t2, $t0, $t1	
	  sw $t2, -344($fp)	# spill _tmp84 from $t2 to $fp-344
	# _tmp85 = _tmp84 + _tmp82
	  lw $t0, -344($fp)	# fill _tmp84 to $t0 from $fp-344
	  lw $t1, -336($fp)	# fill _tmp82 to $t1 from $fp-336
	  add $t2, $t0, $t1	
	  sw $t2, -348($fp)	# spill _tmp85 from $t2 to $fp-348
	# _tmp86 = *(_tmp85)
	  lw $t0, -348($fp)	# fill _tmp85 to $t0 from $fp-348
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -352($fp)	# spill _tmp86 from $t2 to $fp-352
	# _tmp87 = *(_tmp86)
	  lw $t0, -352($fp)	# fill _tmp86 to $t0 from $fp-352
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -356($fp)	# spill _tmp87 from $t2 to $fp-356
	# _tmp88 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -360($fp)	# spill _tmp88 from $t2 to $fp-360
	# _tmp89 = j < _tmp88
	  lw $t0, -12($fp)	# fill j to $t0 from $fp-12
	  lw $t1, -360($fp)	# fill _tmp88 to $t1 from $fp-360
	  slt $t2, $t0, $t1	
	  sw $t2, -364($fp)	# spill _tmp89 from $t2 to $fp-364
	# _tmp90 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -368($fp)	# spill _tmp90 from $t2 to $fp-368
	# _tmp91 = _tmp87 - _tmp90
	  lw $t0, -356($fp)	# fill _tmp87 to $t0 from $fp-356
	  lw $t1, -368($fp)	# fill _tmp90 to $t1 from $fp-368
	  sub $t2, $t0, $t1	
	  sw $t2, -372($fp)	# spill _tmp91 from $t2 to $fp-372
	# _tmp92 = _tmp91 < j
	  lw $t0, -372($fp)	# fill _tmp91 to $t0 from $fp-372
	  lw $t1, -12($fp)	# fill j to $t1 from $fp-12
	  slt $t2, $t0, $t1	
	  sw $t2, -376($fp)	# spill _tmp92 from $t2 to $fp-376
	# _tmp93 = _tmp89 || _tmp92
	  lw $t0, -364($fp)	# fill _tmp89 to $t0 from $fp-364
	  lw $t1, -376($fp)	# fill _tmp92 to $t1 from $fp-376
	  or $t2, $t0, $t1	
	  sw $t2, -380($fp)	# spill _tmp93 from $t2 to $fp-380
	# IfZ _tmp93 Goto arrayAcc_24
	  lw $t0, -380($fp)	# fill _tmp93 to $t0 from $fp-380
	  beqz $t0, arrayAcc_24	# branch if _tmp93 is zero 
	# _tmp94 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string16: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string16	# load label
	  sw $t2, -384($fp)	# spill _tmp94 from $t2 to $fp-384
	# PushParam _tmp94
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -384($fp)	# fill _tmp94 to $t0 from $fp-384
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_24:
	# _tmp95 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -388($fp)	# spill _tmp95 from $t2 to $fp-388
	# _tmp96 = j * _tmp95
	  lw $t0, -12($fp)	# fill j to $t0 from $fp-12
	  lw $t1, -388($fp)	# fill _tmp95 to $t1 from $fp-388
	  mul $t2, $t0, $t1	
	  sw $t2, -392($fp)	# spill _tmp96 from $t2 to $fp-392
	# _tmp97 = _tmp86 + _tmp96
	  lw $t0, -352($fp)	# fill _tmp86 to $t0 from $fp-352
	  lw $t1, -392($fp)	# fill _tmp96 to $t1 from $fp-392
	  add $t2, $t0, $t1	
	  sw $t2, -396($fp)	# spill _tmp97 from $t2 to $fp-396
	# _tmp98 = _tmp97 + _tmp95
	  lw $t0, -396($fp)	# fill _tmp97 to $t0 from $fp-396
	  lw $t1, -388($fp)	# fill _tmp95 to $t1 from $fp-388
	  add $t2, $t0, $t1	
	  sw $t2, -400($fp)	# spill _tmp98 from $t2 to $fp-400
	# _tmp99 = *(_tmp98)
	  lw $t0, -400($fp)	# fill _tmp98 to $t0 from $fp-400
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -404($fp)	# spill _tmp99 from $t2 to $fp-404
	# _tmp100 = *(_tmp99)
	  lw $t0, -404($fp)	# fill _tmp99 to $t0 from $fp-404
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -408($fp)	# spill _tmp100 from $t2 to $fp-408
	# _tmp101 = *(_tmp100)
	  lw $t0, -408($fp)	# fill _tmp100 to $t0 from $fp-408
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -412($fp)	# spill _tmp101 from $t2 to $fp-412
	# PushParam _tmp99
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -404($fp)	# fill _tmp99 to $t0 from $fp-404
	  sw $t0, 4($sp)	# copy param value to stack
	# ACall _tmp101
	  lw $t0, -412($fp)	# fill _tmp101 to $t0 from $fp-412
	  jalr $t0            	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp102 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -416($fp)	# spill _tmp102 from $t2 to $fp-416
	# _tmp103 = j + _tmp102
	  lw $t0, -12($fp)	# fill j to $t0 from $fp-12
	  lw $t1, -416($fp)	# fill _tmp102 to $t1 from $fp-416
	  add $t2, $t0, $t1	
	  sw $t2, -420($fp)	# spill _tmp103 from $t2 to $fp-420
	# j = _tmp103
	  lw $t2, -420($fp)	# fill _tmp103 to $t2 from $fp-420
	  sw $t2, -12($fp)	# spill j from $t2 to $fp-12
	# Goto loopBegin_19
	  b loopBegin_19		# unconditional branch
  loopEnd_20:
	# _tmp104 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -424($fp)	# spill _tmp104 from $t2 to $fp-424
	# _tmp105 = i + _tmp104
	  lw $t0, -8($fp)	# fill i to $t0 from $fp-8
	  lw $t1, -424($fp)	# fill _tmp104 to $t1 from $fp-424
	  add $t2, $t0, $t1	
	  sw $t2, -428($fp)	# spill _tmp105 from $t2 to $fp-428
	# i = _tmp105
	  lw $t2, -428($fp)	# fill _tmp105 to $t2 from $fp-428
	  sw $t2, -8($fp)	# spill i from $t2 to $fp-8
	# Goto loopBegin_17
	  b loopBegin_17		# unconditional branch
  loopEnd_18:
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  Grid_Full:
	# BeginFunc 180
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 180	# decrement sp to make space for locals/temps
	# _tmp3 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -20($fp)	# spill _tmp3 from $t2 to $fp-20
	# full = _tmp3
	  lw $t2, -20($fp)	# fill _tmp3 to $t2 from $fp-20
	  sw $t2, -16($fp)	# spill full from $t2 to $fp-16
	# _tmp4 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -24($fp)	# spill _tmp4 from $t2 to $fp-24
	# i = _tmp4
	  lw $t2, -24($fp)	# fill _tmp4 to $t2 from $fp-24
	  sw $t2, -8($fp)	# spill i from $t2 to $fp-8
  loopBegin_25:
	# _tmp5 = 3
	  li $t2, 3		# load constant value 3 into $t2
	  sw $t2, -28($fp)	# spill _tmp5 from $t2 to $fp-28
	# _tmp6 = i < _tmp5
	  lw $t0, -8($fp)	# fill i to $t0 from $fp-8
	  lw $t1, -28($fp)	# fill _tmp5 to $t1 from $fp-28
	  slt $t2, $t0, $t1	
	  sw $t2, -32($fp)	# spill _tmp6 from $t2 to $fp-32
	# IfZ _tmp6 Goto loopEnd_26
	  lw $t0, -32($fp)	# fill _tmp6 to $t0 from $fp-32
	  beqz $t0, loopEnd_26	# branch if _tmp6 is zero 
	# _tmp7 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -36($fp)	# spill _tmp7 from $t2 to $fp-36
	# j = _tmp7
	  lw $t2, -36($fp)	# fill _tmp7 to $t2 from $fp-36
	  sw $t2, -12($fp)	# spill j from $t2 to $fp-12
  loopBegin_27:
	# _tmp8 = 3
	  li $t2, 3		# load constant value 3 into $t2
	  sw $t2, -40($fp)	# spill _tmp8 from $t2 to $fp-40
	# _tmp9 = j < _tmp8
	  lw $t0, -12($fp)	# fill j to $t0 from $fp-12
	  lw $t1, -40($fp)	# fill _tmp8 to $t1 from $fp-40
	  slt $t2, $t0, $t1	
	  sw $t2, -44($fp)	# spill _tmp9 from $t2 to $fp-44
	# IfZ _tmp9 Goto loopEnd_28
	  lw $t0, -44($fp)	# fill _tmp9 to $t0 from $fp-44
	  beqz $t0, loopEnd_28	# branch if _tmp9 is zero 
	# _tmp10 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -48($fp)	# spill _tmp10 from $t2 to $fp-48
	# _tmp11 = *(_tmp10)
	  lw $t0, -48($fp)	# fill _tmp10 to $t0 from $fp-48
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -52($fp)	# spill _tmp11 from $t2 to $fp-52
	# _tmp12 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -56($fp)	# spill _tmp12 from $t2 to $fp-56
	# _tmp13 = i < _tmp12
	  lw $t0, -8($fp)	# fill i to $t0 from $fp-8
	  lw $t1, -56($fp)	# fill _tmp12 to $t1 from $fp-56
	  slt $t2, $t0, $t1	
	  sw $t2, -60($fp)	# spill _tmp13 from $t2 to $fp-60
	# _tmp14 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -64($fp)	# spill _tmp14 from $t2 to $fp-64
	# _tmp15 = _tmp11 - _tmp14
	  lw $t0, -52($fp)	# fill _tmp11 to $t0 from $fp-52
	  lw $t1, -64($fp)	# fill _tmp14 to $t1 from $fp-64
	  sub $t2, $t0, $t1	
	  sw $t2, -68($fp)	# spill _tmp15 from $t2 to $fp-68
	# _tmp16 = _tmp15 < i
	  lw $t0, -68($fp)	# fill _tmp15 to $t0 from $fp-68
	  lw $t1, -8($fp)	# fill i to $t1 from $fp-8
	  slt $t2, $t0, $t1	
	  sw $t2, -72($fp)	# spill _tmp16 from $t2 to $fp-72
	# _tmp17 = _tmp13 || _tmp16
	  lw $t0, -60($fp)	# fill _tmp13 to $t0 from $fp-60
	  lw $t1, -72($fp)	# fill _tmp16 to $t1 from $fp-72
	  or $t2, $t0, $t1	
	  sw $t2, -76($fp)	# spill _tmp17 from $t2 to $fp-76
	# IfZ _tmp17 Goto arrayAcc_29
	  lw $t0, -76($fp)	# fill _tmp17 to $t0 from $fp-76
	  beqz $t0, arrayAcc_29	# branch if _tmp17 is zero 
	# _tmp18 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string17: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string17	# load label
	  sw $t2, -80($fp)	# spill _tmp18 from $t2 to $fp-80
	# PushParam _tmp18
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -80($fp)	# fill _tmp18 to $t0 from $fp-80
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_29:
	# _tmp19 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -84($fp)	# spill _tmp19 from $t2 to $fp-84
	# _tmp20 = i * _tmp19
	  lw $t0, -8($fp)	# fill i to $t0 from $fp-8
	  lw $t1, -84($fp)	# fill _tmp19 to $t1 from $fp-84
	  mul $t2, $t0, $t1	
	  sw $t2, -88($fp)	# spill _tmp20 from $t2 to $fp-88
	# _tmp21 = _tmp10 + _tmp20
	  lw $t0, -48($fp)	# fill _tmp10 to $t0 from $fp-48
	  lw $t1, -88($fp)	# fill _tmp20 to $t1 from $fp-88
	  add $t2, $t0, $t1	
	  sw $t2, -92($fp)	# spill _tmp21 from $t2 to $fp-92
	# _tmp22 = _tmp21 + _tmp19
	  lw $t0, -92($fp)	# fill _tmp21 to $t0 from $fp-92
	  lw $t1, -84($fp)	# fill _tmp19 to $t1 from $fp-84
	  add $t2, $t0, $t1	
	  sw $t2, -96($fp)	# spill _tmp22 from $t2 to $fp-96
	# _tmp23 = *(_tmp22)
	  lw $t0, -96($fp)	# fill _tmp22 to $t0 from $fp-96
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -100($fp)	# spill _tmp23 from $t2 to $fp-100
	# _tmp24 = *(_tmp23)
	  lw $t0, -100($fp)	# fill _tmp23 to $t0 from $fp-100
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -104($fp)	# spill _tmp24 from $t2 to $fp-104
	# _tmp25 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -108($fp)	# spill _tmp25 from $t2 to $fp-108
	# _tmp26 = j < _tmp25
	  lw $t0, -12($fp)	# fill j to $t0 from $fp-12
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
	# _tmp29 = _tmp28 < j
	  lw $t0, -120($fp)	# fill _tmp28 to $t0 from $fp-120
	  lw $t1, -12($fp)	# fill j to $t1 from $fp-12
	  slt $t2, $t0, $t1	
	  sw $t2, -124($fp)	# spill _tmp29 from $t2 to $fp-124
	# _tmp30 = _tmp26 || _tmp29
	  lw $t0, -112($fp)	# fill _tmp26 to $t0 from $fp-112
	  lw $t1, -124($fp)	# fill _tmp29 to $t1 from $fp-124
	  or $t2, $t0, $t1	
	  sw $t2, -128($fp)	# spill _tmp30 from $t2 to $fp-128
	# IfZ _tmp30 Goto arrayAcc_30
	  lw $t0, -128($fp)	# fill _tmp30 to $t0 from $fp-128
	  beqz $t0, arrayAcc_30	# branch if _tmp30 is zero 
	# _tmp31 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string18: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string18	# load label
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
  arrayAcc_30:
	# _tmp32 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -136($fp)	# spill _tmp32 from $t2 to $fp-136
	# _tmp33 = j * _tmp32
	  lw $t0, -12($fp)	# fill j to $t0 from $fp-12
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
	# _tmp38 = *(_tmp37 + 12)
	  lw $t0, -156($fp)	# fill _tmp37 to $t0 from $fp-156
	  lw $t2, 12($t0) 	# load with offset
	  sw $t2, -160($fp)	# spill _tmp38 from $t2 to $fp-160
	# PushParam _tmp36
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -152($fp)	# fill _tmp36 to $t0 from $fp-152
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp39 = ACall _tmp38
	  lw $t0, -160($fp)	# fill _tmp38 to $t0 from $fp-160
	  jalr $t0            	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -164($fp)	# spill _tmp39 from $t2 to $fp-164
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# IfZ _tmp39 Goto else_31
	  lw $t0, -164($fp)	# fill _tmp39 to $t0 from $fp-164
	  beqz $t0, else_31	# branch if _tmp39 is zero 
	# _tmp40 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -168($fp)	# spill _tmp40 from $t2 to $fp-168
	# full = _tmp40
	  lw $t2, -168($fp)	# fill _tmp40 to $t2 from $fp-168
	  sw $t2, -16($fp)	# spill full from $t2 to $fp-16
	# Goto endif_32
	  b endif_32		# unconditional branch
  else_31:
  endif_32:
	# _tmp41 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -172($fp)	# spill _tmp41 from $t2 to $fp-172
	# _tmp42 = j + _tmp41
	  lw $t0, -12($fp)	# fill j to $t0 from $fp-12
	  lw $t1, -172($fp)	# fill _tmp41 to $t1 from $fp-172
	  add $t2, $t0, $t1	
	  sw $t2, -176($fp)	# spill _tmp42 from $t2 to $fp-176
	# j = _tmp42
	  lw $t2, -176($fp)	# fill _tmp42 to $t2 from $fp-176
	  sw $t2, -12($fp)	# spill j from $t2 to $fp-12
	# Goto loopBegin_27
	  b loopBegin_27		# unconditional branch
  loopEnd_28:
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
	# Goto loopBegin_25
	  b loopBegin_25		# unconditional branch
  loopEnd_26:
	# Return full
	  lw $t2, -16($fp)	# fill full to $t2 from $fp-16
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
  Grid_Draw:
	# BeginFunc 208
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 208	# decrement sp to make space for locals/temps
	# _tmp3 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -20($fp)	# spill _tmp3 from $t2 to $fp-20
	# i = _tmp3
	  lw $t2, -20($fp)	# fill _tmp3 to $t2 from $fp-20
	  sw $t2, -8($fp)	# spill i from $t2 to $fp-8
	# _tmp4 = "  1   2   3\n"
	  .data			# create string constant marked with label
	  _string19: .asciiz "  1   2   3\n"
	  .text
	  la $t2, _string19	# load label
	  sw $t2, -24($fp)	# spill _tmp4 from $t2 to $fp-24
	# PushParam _tmp4
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -24($fp)	# fill _tmp4 to $t0 from $fp-24
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
  loopBegin_33:
	# _tmp5 = 3
	  li $t2, 3		# load constant value 3 into $t2
	  sw $t2, -28($fp)	# spill _tmp5 from $t2 to $fp-28
	# _tmp6 = i < _tmp5
	  lw $t0, -8($fp)	# fill i to $t0 from $fp-8
	  lw $t1, -28($fp)	# fill _tmp5 to $t1 from $fp-28
	  slt $t2, $t0, $t1	
	  sw $t2, -32($fp)	# spill _tmp6 from $t2 to $fp-32
	# IfZ _tmp6 Goto loopEnd_34
	  lw $t0, -32($fp)	# fill _tmp6 to $t0 from $fp-32
	  beqz $t0, loopEnd_34	# branch if _tmp6 is zero 
	# _tmp7 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -36($fp)	# spill _tmp7 from $t2 to $fp-36
	# _tmp8 = i + _tmp7
	  lw $t0, -8($fp)	# fill i to $t0 from $fp-8
	  lw $t1, -36($fp)	# fill _tmp7 to $t1 from $fp-36
	  add $t2, $t0, $t1	
	  sw $t2, -40($fp)	# spill _tmp8 from $t2 to $fp-40
	# rowToPrint = _tmp8
	  lw $t2, -40($fp)	# fill _tmp8 to $t2 from $fp-40
	  sw $t2, -16($fp)	# spill rowToPrint from $t2 to $fp-16
	# PushParam rowToPrint
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -16($fp)	# fill rowToPrint to $t0 from $fp-16
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintInt
	  jal _PrintInt      	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp9 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -44($fp)	# spill _tmp9 from $t2 to $fp-44
	# j = _tmp9
	  lw $t2, -44($fp)	# fill _tmp9 to $t2 from $fp-44
	  sw $t2, -12($fp)	# spill j from $t2 to $fp-12
  loopBegin_35:
	# _tmp10 = 3
	  li $t2, 3		# load constant value 3 into $t2
	  sw $t2, -48($fp)	# spill _tmp10 from $t2 to $fp-48
	# _tmp11 = j < _tmp10
	  lw $t0, -12($fp)	# fill j to $t0 from $fp-12
	  lw $t1, -48($fp)	# fill _tmp10 to $t1 from $fp-48
	  slt $t2, $t0, $t1	
	  sw $t2, -52($fp)	# spill _tmp11 from $t2 to $fp-52
	# IfZ _tmp11 Goto loopEnd_36
	  lw $t0, -52($fp)	# fill _tmp11 to $t0 from $fp-52
	  beqz $t0, loopEnd_36	# branch if _tmp11 is zero 
	# _tmp12 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -56($fp)	# spill _tmp12 from $t2 to $fp-56
	# _tmp13 = *(_tmp12)
	  lw $t0, -56($fp)	# fill _tmp12 to $t0 from $fp-56
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -60($fp)	# spill _tmp13 from $t2 to $fp-60
	# _tmp14 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -64($fp)	# spill _tmp14 from $t2 to $fp-64
	# _tmp15 = i < _tmp14
	  lw $t0, -8($fp)	# fill i to $t0 from $fp-8
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
	# _tmp18 = _tmp17 < i
	  lw $t0, -76($fp)	# fill _tmp17 to $t0 from $fp-76
	  lw $t1, -8($fp)	# fill i to $t1 from $fp-8
	  slt $t2, $t0, $t1	
	  sw $t2, -80($fp)	# spill _tmp18 from $t2 to $fp-80
	# _tmp19 = _tmp15 || _tmp18
	  lw $t0, -68($fp)	# fill _tmp15 to $t0 from $fp-68
	  lw $t1, -80($fp)	# fill _tmp18 to $t1 from $fp-80
	  or $t2, $t0, $t1	
	  sw $t2, -84($fp)	# spill _tmp19 from $t2 to $fp-84
	# IfZ _tmp19 Goto arrayAcc_37
	  lw $t0, -84($fp)	# fill _tmp19 to $t0 from $fp-84
	  beqz $t0, arrayAcc_37	# branch if _tmp19 is zero 
	# _tmp20 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string20: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string20	# load label
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
  arrayAcc_37:
	# _tmp21 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -92($fp)	# spill _tmp21 from $t2 to $fp-92
	# _tmp22 = i * _tmp21
	  lw $t0, -8($fp)	# fill i to $t0 from $fp-8
	  lw $t1, -92($fp)	# fill _tmp21 to $t1 from $fp-92
	  mul $t2, $t0, $t1	
	  sw $t2, -96($fp)	# spill _tmp22 from $t2 to $fp-96
	# _tmp23 = _tmp12 + _tmp22
	  lw $t0, -56($fp)	# fill _tmp12 to $t0 from $fp-56
	  lw $t1, -96($fp)	# fill _tmp22 to $t1 from $fp-96
	  add $t2, $t0, $t1	
	  sw $t2, -100($fp)	# spill _tmp23 from $t2 to $fp-100
	# _tmp24 = _tmp23 + _tmp21
	  lw $t0, -100($fp)	# fill _tmp23 to $t0 from $fp-100
	  lw $t1, -92($fp)	# fill _tmp21 to $t1 from $fp-92
	  add $t2, $t0, $t1	
	  sw $t2, -104($fp)	# spill _tmp24 from $t2 to $fp-104
	# _tmp25 = *(_tmp24)
	  lw $t0, -104($fp)	# fill _tmp24 to $t0 from $fp-104
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -108($fp)	# spill _tmp25 from $t2 to $fp-108
	# _tmp26 = *(_tmp25)
	  lw $t0, -108($fp)	# fill _tmp25 to $t0 from $fp-108
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -112($fp)	# spill _tmp26 from $t2 to $fp-112
	# _tmp27 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -116($fp)	# spill _tmp27 from $t2 to $fp-116
	# _tmp28 = j < _tmp27
	  lw $t0, -12($fp)	# fill j to $t0 from $fp-12
	  lw $t1, -116($fp)	# fill _tmp27 to $t1 from $fp-116
	  slt $t2, $t0, $t1	
	  sw $t2, -120($fp)	# spill _tmp28 from $t2 to $fp-120
	# _tmp29 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -124($fp)	# spill _tmp29 from $t2 to $fp-124
	# _tmp30 = _tmp26 - _tmp29
	  lw $t0, -112($fp)	# fill _tmp26 to $t0 from $fp-112
	  lw $t1, -124($fp)	# fill _tmp29 to $t1 from $fp-124
	  sub $t2, $t0, $t1	
	  sw $t2, -128($fp)	# spill _tmp30 from $t2 to $fp-128
	# _tmp31 = _tmp30 < j
	  lw $t0, -128($fp)	# fill _tmp30 to $t0 from $fp-128
	  lw $t1, -12($fp)	# fill j to $t1 from $fp-12
	  slt $t2, $t0, $t1	
	  sw $t2, -132($fp)	# spill _tmp31 from $t2 to $fp-132
	# _tmp32 = _tmp28 || _tmp31
	  lw $t0, -120($fp)	# fill _tmp28 to $t0 from $fp-120
	  lw $t1, -132($fp)	# fill _tmp31 to $t1 from $fp-132
	  or $t2, $t0, $t1	
	  sw $t2, -136($fp)	# spill _tmp32 from $t2 to $fp-136
	# IfZ _tmp32 Goto arrayAcc_38
	  lw $t0, -136($fp)	# fill _tmp32 to $t0 from $fp-136
	  beqz $t0, arrayAcc_38	# branch if _tmp32 is zero 
	# _tmp33 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string21: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string21	# load label
	  sw $t2, -140($fp)	# spill _tmp33 from $t2 to $fp-140
	# PushParam _tmp33
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -140($fp)	# fill _tmp33 to $t0 from $fp-140
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_38:
	# _tmp34 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -144($fp)	# spill _tmp34 from $t2 to $fp-144
	# _tmp35 = j * _tmp34
	  lw $t0, -12($fp)	# fill j to $t0 from $fp-12
	  lw $t1, -144($fp)	# fill _tmp34 to $t1 from $fp-144
	  mul $t2, $t0, $t1	
	  sw $t2, -148($fp)	# spill _tmp35 from $t2 to $fp-148
	# _tmp36 = _tmp25 + _tmp35
	  lw $t0, -108($fp)	# fill _tmp25 to $t0 from $fp-108
	  lw $t1, -148($fp)	# fill _tmp35 to $t1 from $fp-148
	  add $t2, $t0, $t1	
	  sw $t2, -152($fp)	# spill _tmp36 from $t2 to $fp-152
	# _tmp37 = _tmp36 + _tmp34
	  lw $t0, -152($fp)	# fill _tmp36 to $t0 from $fp-152
	  lw $t1, -144($fp)	# fill _tmp34 to $t1 from $fp-144
	  add $t2, $t0, $t1	
	  sw $t2, -156($fp)	# spill _tmp37 from $t2 to $fp-156
	# _tmp38 = *(_tmp37)
	  lw $t0, -156($fp)	# fill _tmp37 to $t0 from $fp-156
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -160($fp)	# spill _tmp38 from $t2 to $fp-160
	# _tmp39 = *(_tmp38)
	  lw $t0, -160($fp)	# fill _tmp38 to $t0 from $fp-160
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -164($fp)	# spill _tmp39 from $t2 to $fp-164
	# _tmp40 = *(_tmp39 + 4)
	  lw $t0, -164($fp)	# fill _tmp39 to $t0 from $fp-164
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -168($fp)	# spill _tmp40 from $t2 to $fp-168
	# PushParam _tmp38
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -160($fp)	# fill _tmp38 to $t0 from $fp-160
	  sw $t0, 4($sp)	# copy param value to stack
	# ACall _tmp40
	  lw $t0, -168($fp)	# fill _tmp40 to $t0 from $fp-168
	  jalr $t0            	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp41 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -172($fp)	# spill _tmp41 from $t2 to $fp-172
	# _tmp42 = j + _tmp41
	  lw $t0, -12($fp)	# fill j to $t0 from $fp-12
	  lw $t1, -172($fp)	# fill _tmp41 to $t1 from $fp-172
	  add $t2, $t0, $t1	
	  sw $t2, -176($fp)	# spill _tmp42 from $t2 to $fp-176
	# j = _tmp42
	  lw $t2, -176($fp)	# fill _tmp42 to $t2 from $fp-176
	  sw $t2, -12($fp)	# spill j from $t2 to $fp-12
	# _tmp43 = 3
	  li $t2, 3		# load constant value 3 into $t2
	  sw $t2, -180($fp)	# spill _tmp43 from $t2 to $fp-180
	# _tmp44 = j < _tmp43
	  lw $t0, -12($fp)	# fill j to $t0 from $fp-12
	  lw $t1, -180($fp)	# fill _tmp43 to $t1 from $fp-180
	  slt $t2, $t0, $t1	
	  sw $t2, -184($fp)	# spill _tmp44 from $t2 to $fp-184
	# IfZ _tmp44 Goto else_39
	  lw $t0, -184($fp)	# fill _tmp44 to $t0 from $fp-184
	  beqz $t0, else_39	# branch if _tmp44 is zero 
	# _tmp45 = "|"
	  .data			# create string constant marked with label
	  _string22: .asciiz "|"
	  .text
	  la $t2, _string22	# load label
	  sw $t2, -188($fp)	# spill _tmp45 from $t2 to $fp-188
	# PushParam _tmp45
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -188($fp)	# fill _tmp45 to $t0 from $fp-188
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# Goto endif_40
	  b endif_40		# unconditional branch
  else_39:
  endif_40:
	# Goto loopBegin_35
	  b loopBegin_35		# unconditional branch
  loopEnd_36:
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
	# _tmp48 = "\n"
	  .data			# create string constant marked with label
	  _string23: .asciiz "\n"
	  .text
	  la $t2, _string23	# load label
	  sw $t2, -200($fp)	# spill _tmp48 from $t2 to $fp-200
	# PushParam _tmp48
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -200($fp)	# fill _tmp48 to $t0 from $fp-200
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp49 = 3
	  li $t2, 3		# load constant value 3 into $t2
	  sw $t2, -204($fp)	# spill _tmp49 from $t2 to $fp-204
	# _tmp50 = i < _tmp49
	  lw $t0, -8($fp)	# fill i to $t0 from $fp-8
	  lw $t1, -204($fp)	# fill _tmp49 to $t1 from $fp-204
	  slt $t2, $t0, $t1	
	  sw $t2, -208($fp)	# spill _tmp50 from $t2 to $fp-208
	# IfZ _tmp50 Goto else_41
	  lw $t0, -208($fp)	# fill _tmp50 to $t0 from $fp-208
	  beqz $t0, else_41	# branch if _tmp50 is zero 
	# _tmp51 = " ---+---+---\n"
	  .data			# create string constant marked with label
	  _string24: .asciiz " ---+---+---\n"
	  .text
	  la $t2, _string24	# load label
	  sw $t2, -212($fp)	# spill _tmp51 from $t2 to $fp-212
	# PushParam _tmp51
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -212($fp)	# fill _tmp51 to $t0 from $fp-212
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# Goto endif_42
	  b endif_42		# unconditional branch
  else_41:
  endif_42:
	# Goto loopBegin_33
	  b loopBegin_33		# unconditional branch
  loopEnd_34:
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  Grid_Update:
	# BeginFunc 244
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 244	# decrement sp to make space for locals/temps
	# _tmp0 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -8($fp)	# spill _tmp0 from $t2 to $fp-8
	# _tmp1 = *(_tmp0)
	  lw $t0, -8($fp)	# fill _tmp0 to $t0 from $fp-8
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -12($fp)	# spill _tmp1 from $t2 to $fp-12
	# _tmp2 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -16($fp)	# spill _tmp2 from $t2 to $fp-16
	# _tmp3 = row < _tmp2
	  lw $t0, 8($fp)	# fill row to $t0 from $fp+8
	  lw $t1, -16($fp)	# fill _tmp2 to $t1 from $fp-16
	  slt $t2, $t0, $t1	
	  sw $t2, -20($fp)	# spill _tmp3 from $t2 to $fp-20
	# _tmp4 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -24($fp)	# spill _tmp4 from $t2 to $fp-24
	# _tmp5 = _tmp1 - _tmp4
	  lw $t0, -12($fp)	# fill _tmp1 to $t0 from $fp-12
	  lw $t1, -24($fp)	# fill _tmp4 to $t1 from $fp-24
	  sub $t2, $t0, $t1	
	  sw $t2, -28($fp)	# spill _tmp5 from $t2 to $fp-28
	# _tmp6 = _tmp5 < row
	  lw $t0, -28($fp)	# fill _tmp5 to $t0 from $fp-28
	  lw $t1, 8($fp)	# fill row to $t1 from $fp+8
	  slt $t2, $t0, $t1	
	  sw $t2, -32($fp)	# spill _tmp6 from $t2 to $fp-32
	# _tmp7 = _tmp3 || _tmp6
	  lw $t0, -20($fp)	# fill _tmp3 to $t0 from $fp-20
	  lw $t1, -32($fp)	# fill _tmp6 to $t1 from $fp-32
	  or $t2, $t0, $t1	
	  sw $t2, -36($fp)	# spill _tmp7 from $t2 to $fp-36
	# IfZ _tmp7 Goto arrayAcc_43
	  lw $t0, -36($fp)	# fill _tmp7 to $t0 from $fp-36
	  beqz $t0, arrayAcc_43	# branch if _tmp7 is zero 
	# _tmp8 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string25: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string25	# load label
	  sw $t2, -40($fp)	# spill _tmp8 from $t2 to $fp-40
	# PushParam _tmp8
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -40($fp)	# fill _tmp8 to $t0 from $fp-40
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_43:
	# _tmp9 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -44($fp)	# spill _tmp9 from $t2 to $fp-44
	# _tmp10 = row * _tmp9
	  lw $t0, 8($fp)	# fill row to $t0 from $fp+8
	  lw $t1, -44($fp)	# fill _tmp9 to $t1 from $fp-44
	  mul $t2, $t0, $t1	
	  sw $t2, -48($fp)	# spill _tmp10 from $t2 to $fp-48
	# _tmp11 = _tmp0 + _tmp10
	  lw $t0, -8($fp)	# fill _tmp0 to $t0 from $fp-8
	  lw $t1, -48($fp)	# fill _tmp10 to $t1 from $fp-48
	  add $t2, $t0, $t1	
	  sw $t2, -52($fp)	# spill _tmp11 from $t2 to $fp-52
	# _tmp12 = _tmp11 + _tmp9
	  lw $t0, -52($fp)	# fill _tmp11 to $t0 from $fp-52
	  lw $t1, -44($fp)	# fill _tmp9 to $t1 from $fp-44
	  add $t2, $t0, $t1	
	  sw $t2, -56($fp)	# spill _tmp12 from $t2 to $fp-56
	# _tmp13 = *(_tmp12)
	  lw $t0, -56($fp)	# fill _tmp12 to $t0 from $fp-56
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -60($fp)	# spill _tmp13 from $t2 to $fp-60
	# _tmp14 = *(_tmp13)
	  lw $t0, -60($fp)	# fill _tmp13 to $t0 from $fp-60
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -64($fp)	# spill _tmp14 from $t2 to $fp-64
	# _tmp15 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -68($fp)	# spill _tmp15 from $t2 to $fp-68
	# _tmp16 = column < _tmp15
	  lw $t0, 12($fp)	# fill column to $t0 from $fp+12
	  lw $t1, -68($fp)	# fill _tmp15 to $t1 from $fp-68
	  slt $t2, $t0, $t1	
	  sw $t2, -72($fp)	# spill _tmp16 from $t2 to $fp-72
	# _tmp17 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -76($fp)	# spill _tmp17 from $t2 to $fp-76
	# _tmp18 = _tmp14 - _tmp17
	  lw $t0, -64($fp)	# fill _tmp14 to $t0 from $fp-64
	  lw $t1, -76($fp)	# fill _tmp17 to $t1 from $fp-76
	  sub $t2, $t0, $t1	
	  sw $t2, -80($fp)	# spill _tmp18 from $t2 to $fp-80
	# _tmp19 = _tmp18 < column
	  lw $t0, -80($fp)	# fill _tmp18 to $t0 from $fp-80
	  lw $t1, 12($fp)	# fill column to $t1 from $fp+12
	  slt $t2, $t0, $t1	
	  sw $t2, -84($fp)	# spill _tmp19 from $t2 to $fp-84
	# _tmp20 = _tmp16 || _tmp19
	  lw $t0, -72($fp)	# fill _tmp16 to $t0 from $fp-72
	  lw $t1, -84($fp)	# fill _tmp19 to $t1 from $fp-84
	  or $t2, $t0, $t1	
	  sw $t2, -88($fp)	# spill _tmp20 from $t2 to $fp-88
	# IfZ _tmp20 Goto arrayAcc_44
	  lw $t0, -88($fp)	# fill _tmp20 to $t0 from $fp-88
	  beqz $t0, arrayAcc_44	# branch if _tmp20 is zero 
	# _tmp21 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string26: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string26	# load label
	  sw $t2, -92($fp)	# spill _tmp21 from $t2 to $fp-92
	# PushParam _tmp21
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -92($fp)	# fill _tmp21 to $t0 from $fp-92
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_44:
	# _tmp22 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -96($fp)	# spill _tmp22 from $t2 to $fp-96
	# _tmp23 = column * _tmp22
	  lw $t0, 12($fp)	# fill column to $t0 from $fp+12
	  lw $t1, -96($fp)	# fill _tmp22 to $t1 from $fp-96
	  mul $t2, $t0, $t1	
	  sw $t2, -100($fp)	# spill _tmp23 from $t2 to $fp-100
	# _tmp24 = _tmp13 + _tmp23
	  lw $t0, -60($fp)	# fill _tmp13 to $t0 from $fp-60
	  lw $t1, -100($fp)	# fill _tmp23 to $t1 from $fp-100
	  add $t2, $t0, $t1	
	  sw $t2, -104($fp)	# spill _tmp24 from $t2 to $fp-104
	# _tmp25 = _tmp24 + _tmp22
	  lw $t0, -104($fp)	# fill _tmp24 to $t0 from $fp-104
	  lw $t1, -96($fp)	# fill _tmp22 to $t1 from $fp-96
	  add $t2, $t0, $t1	
	  sw $t2, -108($fp)	# spill _tmp25 from $t2 to $fp-108
	# _tmp26 = *(_tmp25)
	  lw $t0, -108($fp)	# fill _tmp25 to $t0 from $fp-108
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -112($fp)	# spill _tmp26 from $t2 to $fp-112
	# _tmp27 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -116($fp)	# spill _tmp27 from $t2 to $fp-116
	# _tmp28 = *(_tmp26)
	  lw $t0, -112($fp)	# fill _tmp26 to $t0 from $fp-112
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -120($fp)	# spill _tmp28 from $t2 to $fp-120
	# _tmp29 = *(_tmp28 + 8)
	  lw $t0, -120($fp)	# fill _tmp28 to $t0 from $fp-120
	  lw $t2, 8($t0) 	# load with offset
	  sw $t2, -124($fp)	# spill _tmp29 from $t2 to $fp-124
	# PushParam _tmp27
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -116($fp)	# fill _tmp27 to $t0 from $fp-116
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam _tmp26
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -112($fp)	# fill _tmp26 to $t0 from $fp-112
	  sw $t0, 4($sp)	# copy param value to stack
	# ACall _tmp29
	  lw $t0, -124($fp)	# fill _tmp29 to $t0 from $fp-124
	  jalr $t0            	# jump to function
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
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
	# _tmp33 = row < _tmp32
	  lw $t0, 8($fp)	# fill row to $t0 from $fp+8
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
	# _tmp36 = _tmp35 < row
	  lw $t0, -148($fp)	# fill _tmp35 to $t0 from $fp-148
	  lw $t1, 8($fp)	# fill row to $t1 from $fp+8
	  slt $t2, $t0, $t1	
	  sw $t2, -152($fp)	# spill _tmp36 from $t2 to $fp-152
	# _tmp37 = _tmp33 || _tmp36
	  lw $t0, -140($fp)	# fill _tmp33 to $t0 from $fp-140
	  lw $t1, -152($fp)	# fill _tmp36 to $t1 from $fp-152
	  or $t2, $t0, $t1	
	  sw $t2, -156($fp)	# spill _tmp37 from $t2 to $fp-156
	# IfZ _tmp37 Goto arrayAcc_45
	  lw $t0, -156($fp)	# fill _tmp37 to $t0 from $fp-156
	  beqz $t0, arrayAcc_45	# branch if _tmp37 is zero 
	# _tmp38 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string27: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string27	# load label
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
  arrayAcc_45:
	# _tmp39 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -164($fp)	# spill _tmp39 from $t2 to $fp-164
	# _tmp40 = row * _tmp39
	  lw $t0, 8($fp)	# fill row to $t0 from $fp+8
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
	# _tmp45 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -188($fp)	# spill _tmp45 from $t2 to $fp-188
	# _tmp46 = column < _tmp45
	  lw $t0, 12($fp)	# fill column to $t0 from $fp+12
	  lw $t1, -188($fp)	# fill _tmp45 to $t1 from $fp-188
	  slt $t2, $t0, $t1	
	  sw $t2, -192($fp)	# spill _tmp46 from $t2 to $fp-192
	# _tmp47 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -196($fp)	# spill _tmp47 from $t2 to $fp-196
	# _tmp48 = _tmp44 - _tmp47
	  lw $t0, -184($fp)	# fill _tmp44 to $t0 from $fp-184
	  lw $t1, -196($fp)	# fill _tmp47 to $t1 from $fp-196
	  sub $t2, $t0, $t1	
	  sw $t2, -200($fp)	# spill _tmp48 from $t2 to $fp-200
	# _tmp49 = _tmp48 < column
	  lw $t0, -200($fp)	# fill _tmp48 to $t0 from $fp-200
	  lw $t1, 12($fp)	# fill column to $t1 from $fp+12
	  slt $t2, $t0, $t1	
	  sw $t2, -204($fp)	# spill _tmp49 from $t2 to $fp-204
	# _tmp50 = _tmp46 || _tmp49
	  lw $t0, -192($fp)	# fill _tmp46 to $t0 from $fp-192
	  lw $t1, -204($fp)	# fill _tmp49 to $t1 from $fp-204
	  or $t2, $t0, $t1	
	  sw $t2, -208($fp)	# spill _tmp50 from $t2 to $fp-208
	# IfZ _tmp50 Goto arrayAcc_46
	  lw $t0, -208($fp)	# fill _tmp50 to $t0 from $fp-208
	  beqz $t0, arrayAcc_46	# branch if _tmp50 is zero 
	# _tmp51 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string28: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string28	# load label
	  sw $t2, -212($fp)	# spill _tmp51 from $t2 to $fp-212
	# PushParam _tmp51
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -212($fp)	# fill _tmp51 to $t0 from $fp-212
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_46:
	# _tmp52 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -216($fp)	# spill _tmp52 from $t2 to $fp-216
	# _tmp53 = column * _tmp52
	  lw $t0, 12($fp)	# fill column to $t0 from $fp+12
	  lw $t1, -216($fp)	# fill _tmp52 to $t1 from $fp-216
	  mul $t2, $t0, $t1	
	  sw $t2, -220($fp)	# spill _tmp53 from $t2 to $fp-220
	# _tmp54 = _tmp43 + _tmp53
	  lw $t0, -180($fp)	# fill _tmp43 to $t0 from $fp-180
	  lw $t1, -220($fp)	# fill _tmp53 to $t1 from $fp-220
	  add $t2, $t0, $t1	
	  sw $t2, -224($fp)	# spill _tmp54 from $t2 to $fp-224
	# _tmp55 = _tmp54 + _tmp52
	  lw $t0, -224($fp)	# fill _tmp54 to $t0 from $fp-224
	  lw $t1, -216($fp)	# fill _tmp52 to $t1 from $fp-216
	  add $t2, $t0, $t1	
	  sw $t2, -228($fp)	# spill _tmp55 from $t2 to $fp-228
	# _tmp56 = *(_tmp55)
	  lw $t0, -228($fp)	# fill _tmp55 to $t0 from $fp-228
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -232($fp)	# spill _tmp56 from $t2 to $fp-232
	# _tmp57 = *(_tmp56)
	  lw $t0, -232($fp)	# fill _tmp56 to $t0 from $fp-232
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -236($fp)	# spill _tmp57 from $t2 to $fp-236
	# _tmp58 = *(_tmp57 + 16)
	  lw $t0, -236($fp)	# fill _tmp57 to $t0 from $fp-236
	  lw $t2, 16($t0) 	# load with offset
	  sw $t2, -240($fp)	# spill _tmp58 from $t2 to $fp-240
	# PushParam mark
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, 16($fp)	# fill mark to $t0 from $fp+16
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam _tmp56
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -232($fp)	# fill _tmp56 to $t0 from $fp-232
	  sw $t0, 4($sp)	# copy param value to stack
	# ACall _tmp58
	  lw $t0, -240($fp)	# fill _tmp58 to $t0 from $fp-240
	  jalr $t0            	# jump to function
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# _tmp59 = *(this)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -244($fp)	# spill _tmp59 from $t2 to $fp-244
	# _tmp60 = *(_tmp59 + 8)
	  lw $t0, -244($fp)	# fill _tmp59 to $t0 from $fp-244
	  lw $t2, 8($t0) 	# load with offset
	  sw $t2, -248($fp)	# spill _tmp60 from $t2 to $fp-248
	# PushParam this
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  sw $t0, 4($sp)	# copy param value to stack
	# ACall _tmp60
	  lw $t0, -248($fp)	# fill _tmp60 to $t0 from $fp-248
	  jalr $t0            	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  Grid_IsMoveLegal:
	# BeginFunc 120
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 120	# decrement sp to make space for locals/temps
	# _tmp0 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -8($fp)	# spill _tmp0 from $t2 to $fp-8
	# _tmp1 = *(_tmp0)
	  lw $t0, -8($fp)	# fill _tmp0 to $t0 from $fp-8
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -12($fp)	# spill _tmp1 from $t2 to $fp-12
	# _tmp2 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -16($fp)	# spill _tmp2 from $t2 to $fp-16
	# _tmp3 = row < _tmp2
	  lw $t0, 8($fp)	# fill row to $t0 from $fp+8
	  lw $t1, -16($fp)	# fill _tmp2 to $t1 from $fp-16
	  slt $t2, $t0, $t1	
	  sw $t2, -20($fp)	# spill _tmp3 from $t2 to $fp-20
	# _tmp4 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -24($fp)	# spill _tmp4 from $t2 to $fp-24
	# _tmp5 = _tmp1 - _tmp4
	  lw $t0, -12($fp)	# fill _tmp1 to $t0 from $fp-12
	  lw $t1, -24($fp)	# fill _tmp4 to $t1 from $fp-24
	  sub $t2, $t0, $t1	
	  sw $t2, -28($fp)	# spill _tmp5 from $t2 to $fp-28
	# _tmp6 = _tmp5 < row
	  lw $t0, -28($fp)	# fill _tmp5 to $t0 from $fp-28
	  lw $t1, 8($fp)	# fill row to $t1 from $fp+8
	  slt $t2, $t0, $t1	
	  sw $t2, -32($fp)	# spill _tmp6 from $t2 to $fp-32
	# _tmp7 = _tmp3 || _tmp6
	  lw $t0, -20($fp)	# fill _tmp3 to $t0 from $fp-20
	  lw $t1, -32($fp)	# fill _tmp6 to $t1 from $fp-32
	  or $t2, $t0, $t1	
	  sw $t2, -36($fp)	# spill _tmp7 from $t2 to $fp-36
	# IfZ _tmp7 Goto arrayAcc_47
	  lw $t0, -36($fp)	# fill _tmp7 to $t0 from $fp-36
	  beqz $t0, arrayAcc_47	# branch if _tmp7 is zero 
	# _tmp8 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string29: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string29	# load label
	  sw $t2, -40($fp)	# spill _tmp8 from $t2 to $fp-40
	# PushParam _tmp8
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -40($fp)	# fill _tmp8 to $t0 from $fp-40
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_47:
	# _tmp9 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -44($fp)	# spill _tmp9 from $t2 to $fp-44
	# _tmp10 = row * _tmp9
	  lw $t0, 8($fp)	# fill row to $t0 from $fp+8
	  lw $t1, -44($fp)	# fill _tmp9 to $t1 from $fp-44
	  mul $t2, $t0, $t1	
	  sw $t2, -48($fp)	# spill _tmp10 from $t2 to $fp-48
	# _tmp11 = _tmp0 + _tmp10
	  lw $t0, -8($fp)	# fill _tmp0 to $t0 from $fp-8
	  lw $t1, -48($fp)	# fill _tmp10 to $t1 from $fp-48
	  add $t2, $t0, $t1	
	  sw $t2, -52($fp)	# spill _tmp11 from $t2 to $fp-52
	# _tmp12 = _tmp11 + _tmp9
	  lw $t0, -52($fp)	# fill _tmp11 to $t0 from $fp-52
	  lw $t1, -44($fp)	# fill _tmp9 to $t1 from $fp-44
	  add $t2, $t0, $t1	
	  sw $t2, -56($fp)	# spill _tmp12 from $t2 to $fp-56
	# _tmp13 = *(_tmp12)
	  lw $t0, -56($fp)	# fill _tmp12 to $t0 from $fp-56
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -60($fp)	# spill _tmp13 from $t2 to $fp-60
	# _tmp14 = *(_tmp13)
	  lw $t0, -60($fp)	# fill _tmp13 to $t0 from $fp-60
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -64($fp)	# spill _tmp14 from $t2 to $fp-64
	# _tmp15 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -68($fp)	# spill _tmp15 from $t2 to $fp-68
	# _tmp16 = column < _tmp15
	  lw $t0, 12($fp)	# fill column to $t0 from $fp+12
	  lw $t1, -68($fp)	# fill _tmp15 to $t1 from $fp-68
	  slt $t2, $t0, $t1	
	  sw $t2, -72($fp)	# spill _tmp16 from $t2 to $fp-72
	# _tmp17 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -76($fp)	# spill _tmp17 from $t2 to $fp-76
	# _tmp18 = _tmp14 - _tmp17
	  lw $t0, -64($fp)	# fill _tmp14 to $t0 from $fp-64
	  lw $t1, -76($fp)	# fill _tmp17 to $t1 from $fp-76
	  sub $t2, $t0, $t1	
	  sw $t2, -80($fp)	# spill _tmp18 from $t2 to $fp-80
	# _tmp19 = _tmp18 < column
	  lw $t0, -80($fp)	# fill _tmp18 to $t0 from $fp-80
	  lw $t1, 12($fp)	# fill column to $t1 from $fp+12
	  slt $t2, $t0, $t1	
	  sw $t2, -84($fp)	# spill _tmp19 from $t2 to $fp-84
	# _tmp20 = _tmp16 || _tmp19
	  lw $t0, -72($fp)	# fill _tmp16 to $t0 from $fp-72
	  lw $t1, -84($fp)	# fill _tmp19 to $t1 from $fp-84
	  or $t2, $t0, $t1	
	  sw $t2, -88($fp)	# spill _tmp20 from $t2 to $fp-88
	# IfZ _tmp20 Goto arrayAcc_48
	  lw $t0, -88($fp)	# fill _tmp20 to $t0 from $fp-88
	  beqz $t0, arrayAcc_48	# branch if _tmp20 is zero 
	# _tmp21 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string30: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string30	# load label
	  sw $t2, -92($fp)	# spill _tmp21 from $t2 to $fp-92
	# PushParam _tmp21
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -92($fp)	# fill _tmp21 to $t0 from $fp-92
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_48:
	# _tmp22 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -96($fp)	# spill _tmp22 from $t2 to $fp-96
	# _tmp23 = column * _tmp22
	  lw $t0, 12($fp)	# fill column to $t0 from $fp+12
	  lw $t1, -96($fp)	# fill _tmp22 to $t1 from $fp-96
	  mul $t2, $t0, $t1	
	  sw $t2, -100($fp)	# spill _tmp23 from $t2 to $fp-100
	# _tmp24 = _tmp13 + _tmp23
	  lw $t0, -60($fp)	# fill _tmp13 to $t0 from $fp-60
	  lw $t1, -100($fp)	# fill _tmp23 to $t1 from $fp-100
	  add $t2, $t0, $t1	
	  sw $t2, -104($fp)	# spill _tmp24 from $t2 to $fp-104
	# _tmp25 = _tmp24 + _tmp22
	  lw $t0, -104($fp)	# fill _tmp24 to $t0 from $fp-104
	  lw $t1, -96($fp)	# fill _tmp22 to $t1 from $fp-96
	  add $t2, $t0, $t1	
	  sw $t2, -108($fp)	# spill _tmp25 from $t2 to $fp-108
	# _tmp26 = *(_tmp25)
	  lw $t0, -108($fp)	# fill _tmp25 to $t0 from $fp-108
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -112($fp)	# spill _tmp26 from $t2 to $fp-112
	# _tmp27 = *(_tmp26)
	  lw $t0, -112($fp)	# fill _tmp26 to $t0 from $fp-112
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -116($fp)	# spill _tmp27 from $t2 to $fp-116
	# _tmp28 = *(_tmp27 + 12)
	  lw $t0, -116($fp)	# fill _tmp27 to $t0 from $fp-116
	  lw $t2, 12($t0) 	# load with offset
	  sw $t2, -120($fp)	# spill _tmp28 from $t2 to $fp-120
	# PushParam _tmp26
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -112($fp)	# fill _tmp26 to $t0 from $fp-112
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp29 = ACall _tmp28
	  lw $t0, -120($fp)	# fill _tmp28 to $t0 from $fp-120
	  jalr $t0            	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -124($fp)	# spill _tmp29 from $t2 to $fp-124
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# Return _tmp29
	  lw $t2, -124($fp)	# fill _tmp29 to $t2 from $fp-124
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
  Grid_GameNotWon:
	# BeginFunc 3188
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 3188	# decrement sp to make space for locals/temps
	# _tmp1 = *(p)
	  lw $t0, 8($fp)	# fill p to $t0 from $fp+8
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -12($fp)	# spill _tmp1 from $t2 to $fp-12
	# _tmp2 = *(_tmp1)
	  lw $t0, -12($fp)	# fill _tmp1 to $t0 from $fp-12
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -16($fp)	# spill _tmp2 from $t2 to $fp-16
	# PushParam p
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, 8($fp)	# fill p to $t0 from $fp+8
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp3 = ACall _tmp2
	  lw $t0, -16($fp)	# fill _tmp2 to $t0 from $fp-16
	  jalr $t0            	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -20($fp)	# spill _tmp3 from $t2 to $fp-20
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# mark = _tmp3
	  lw $t2, -20($fp)	# fill _tmp3 to $t2 from $fp-20
	  sw $t2, -8($fp)	# spill mark from $t2 to $fp-8
	# _tmp4 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -24($fp)	# spill _tmp4 from $t2 to $fp-24
	# _tmp5 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -28($fp)	# spill _tmp5 from $t2 to $fp-28
	# _tmp6 = *(_tmp4)
	  lw $t0, -24($fp)	# fill _tmp4 to $t0 from $fp-24
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -32($fp)	# spill _tmp6 from $t2 to $fp-32
	# _tmp7 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -36($fp)	# spill _tmp7 from $t2 to $fp-36
	# _tmp8 = _tmp5 < _tmp7
	  lw $t0, -28($fp)	# fill _tmp5 to $t0 from $fp-28
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
	# _tmp11 = _tmp10 < _tmp5
	  lw $t0, -48($fp)	# fill _tmp10 to $t0 from $fp-48
	  lw $t1, -28($fp)	# fill _tmp5 to $t1 from $fp-28
	  slt $t2, $t0, $t1	
	  sw $t2, -52($fp)	# spill _tmp11 from $t2 to $fp-52
	# _tmp12 = _tmp8 || _tmp11
	  lw $t0, -40($fp)	# fill _tmp8 to $t0 from $fp-40
	  lw $t1, -52($fp)	# fill _tmp11 to $t1 from $fp-52
	  or $t2, $t0, $t1	
	  sw $t2, -56($fp)	# spill _tmp12 from $t2 to $fp-56
	# IfZ _tmp12 Goto arrayAcc_49
	  lw $t0, -56($fp)	# fill _tmp12 to $t0 from $fp-56
	  beqz $t0, arrayAcc_49	# branch if _tmp12 is zero 
	# _tmp13 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string31: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string31	# load label
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
  arrayAcc_49:
	# _tmp14 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -64($fp)	# spill _tmp14 from $t2 to $fp-64
	# _tmp15 = _tmp5 * _tmp14
	  lw $t0, -28($fp)	# fill _tmp5 to $t0 from $fp-28
	  lw $t1, -64($fp)	# fill _tmp14 to $t1 from $fp-64
	  mul $t2, $t0, $t1	
	  sw $t2, -68($fp)	# spill _tmp15 from $t2 to $fp-68
	# _tmp16 = _tmp4 + _tmp15
	  lw $t0, -24($fp)	# fill _tmp4 to $t0 from $fp-24
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
	# _tmp19 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -84($fp)	# spill _tmp19 from $t2 to $fp-84
	# _tmp20 = *(_tmp18)
	  lw $t0, -80($fp)	# fill _tmp18 to $t0 from $fp-80
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -88($fp)	# spill _tmp20 from $t2 to $fp-88
	# _tmp21 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -92($fp)	# spill _tmp21 from $t2 to $fp-92
	# _tmp22 = _tmp19 < _tmp21
	  lw $t0, -84($fp)	# fill _tmp19 to $t0 from $fp-84
	  lw $t1, -92($fp)	# fill _tmp21 to $t1 from $fp-92
	  slt $t2, $t0, $t1	
	  sw $t2, -96($fp)	# spill _tmp22 from $t2 to $fp-96
	# _tmp23 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -100($fp)	# spill _tmp23 from $t2 to $fp-100
	# _tmp24 = _tmp20 - _tmp23
	  lw $t0, -88($fp)	# fill _tmp20 to $t0 from $fp-88
	  lw $t1, -100($fp)	# fill _tmp23 to $t1 from $fp-100
	  sub $t2, $t0, $t1	
	  sw $t2, -104($fp)	# spill _tmp24 from $t2 to $fp-104
	# _tmp25 = _tmp24 < _tmp19
	  lw $t0, -104($fp)	# fill _tmp24 to $t0 from $fp-104
	  lw $t1, -84($fp)	# fill _tmp19 to $t1 from $fp-84
	  slt $t2, $t0, $t1	
	  sw $t2, -108($fp)	# spill _tmp25 from $t2 to $fp-108
	# _tmp26 = _tmp22 || _tmp25
	  lw $t0, -96($fp)	# fill _tmp22 to $t0 from $fp-96
	  lw $t1, -108($fp)	# fill _tmp25 to $t1 from $fp-108
	  or $t2, $t0, $t1	
	  sw $t2, -112($fp)	# spill _tmp26 from $t2 to $fp-112
	# IfZ _tmp26 Goto arrayAcc_50
	  lw $t0, -112($fp)	# fill _tmp26 to $t0 from $fp-112
	  beqz $t0, arrayAcc_50	# branch if _tmp26 is zero 
	# _tmp27 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string32: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string32	# load label
	  sw $t2, -116($fp)	# spill _tmp27 from $t2 to $fp-116
	# PushParam _tmp27
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -116($fp)	# fill _tmp27 to $t0 from $fp-116
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_50:
	# _tmp28 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -120($fp)	# spill _tmp28 from $t2 to $fp-120
	# _tmp29 = _tmp19 * _tmp28
	  lw $t0, -84($fp)	# fill _tmp19 to $t0 from $fp-84
	  lw $t1, -120($fp)	# fill _tmp28 to $t1 from $fp-120
	  mul $t2, $t0, $t1	
	  sw $t2, -124($fp)	# spill _tmp29 from $t2 to $fp-124
	# _tmp30 = _tmp18 + _tmp29
	  lw $t0, -80($fp)	# fill _tmp18 to $t0 from $fp-80
	  lw $t1, -124($fp)	# fill _tmp29 to $t1 from $fp-124
	  add $t2, $t0, $t1	
	  sw $t2, -128($fp)	# spill _tmp30 from $t2 to $fp-128
	# _tmp31 = _tmp30 + _tmp28
	  lw $t0, -128($fp)	# fill _tmp30 to $t0 from $fp-128
	  lw $t1, -120($fp)	# fill _tmp28 to $t1 from $fp-120
	  add $t2, $t0, $t1	
	  sw $t2, -132($fp)	# spill _tmp31 from $t2 to $fp-132
	# _tmp32 = *(_tmp31)
	  lw $t0, -132($fp)	# fill _tmp31 to $t0 from $fp-132
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -136($fp)	# spill _tmp32 from $t2 to $fp-136
	# _tmp33 = *(_tmp32)
	  lw $t0, -136($fp)	# fill _tmp32 to $t0 from $fp-136
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -140($fp)	# spill _tmp33 from $t2 to $fp-140
	# _tmp34 = *(_tmp33 + 20)
	  lw $t0, -140($fp)	# fill _tmp33 to $t0 from $fp-140
	  lw $t2, 20($t0) 	# load with offset
	  sw $t2, -144($fp)	# spill _tmp34 from $t2 to $fp-144
	# PushParam mark
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -8($fp)	# fill mark to $t0 from $fp-8
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam _tmp32
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -136($fp)	# fill _tmp32 to $t0 from $fp-136
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp35 = ACall _tmp34
	  lw $t0, -144($fp)	# fill _tmp34 to $t0 from $fp-144
	  jalr $t0            	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -148($fp)	# spill _tmp35 from $t2 to $fp-148
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# _tmp36 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -152($fp)	# spill _tmp36 from $t2 to $fp-152
	# _tmp37 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -156($fp)	# spill _tmp37 from $t2 to $fp-156
	# _tmp38 = *(_tmp36)
	  lw $t0, -152($fp)	# fill _tmp36 to $t0 from $fp-152
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -160($fp)	# spill _tmp38 from $t2 to $fp-160
	# _tmp39 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -164($fp)	# spill _tmp39 from $t2 to $fp-164
	# _tmp40 = _tmp37 < _tmp39
	  lw $t0, -156($fp)	# fill _tmp37 to $t0 from $fp-156
	  lw $t1, -164($fp)	# fill _tmp39 to $t1 from $fp-164
	  slt $t2, $t0, $t1	
	  sw $t2, -168($fp)	# spill _tmp40 from $t2 to $fp-168
	# _tmp41 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -172($fp)	# spill _tmp41 from $t2 to $fp-172
	# _tmp42 = _tmp38 - _tmp41
	  lw $t0, -160($fp)	# fill _tmp38 to $t0 from $fp-160
	  lw $t1, -172($fp)	# fill _tmp41 to $t1 from $fp-172
	  sub $t2, $t0, $t1	
	  sw $t2, -176($fp)	# spill _tmp42 from $t2 to $fp-176
	# _tmp43 = _tmp42 < _tmp37
	  lw $t0, -176($fp)	# fill _tmp42 to $t0 from $fp-176
	  lw $t1, -156($fp)	# fill _tmp37 to $t1 from $fp-156
	  slt $t2, $t0, $t1	
	  sw $t2, -180($fp)	# spill _tmp43 from $t2 to $fp-180
	# _tmp44 = _tmp40 || _tmp43
	  lw $t0, -168($fp)	# fill _tmp40 to $t0 from $fp-168
	  lw $t1, -180($fp)	# fill _tmp43 to $t1 from $fp-180
	  or $t2, $t0, $t1	
	  sw $t2, -184($fp)	# spill _tmp44 from $t2 to $fp-184
	# IfZ _tmp44 Goto arrayAcc_51
	  lw $t0, -184($fp)	# fill _tmp44 to $t0 from $fp-184
	  beqz $t0, arrayAcc_51	# branch if _tmp44 is zero 
	# _tmp45 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string33: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string33	# load label
	  sw $t2, -188($fp)	# spill _tmp45 from $t2 to $fp-188
	# PushParam _tmp45
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -188($fp)	# fill _tmp45 to $t0 from $fp-188
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_51:
	# _tmp46 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -192($fp)	# spill _tmp46 from $t2 to $fp-192
	# _tmp47 = _tmp37 * _tmp46
	  lw $t0, -156($fp)	# fill _tmp37 to $t0 from $fp-156
	  lw $t1, -192($fp)	# fill _tmp46 to $t1 from $fp-192
	  mul $t2, $t0, $t1	
	  sw $t2, -196($fp)	# spill _tmp47 from $t2 to $fp-196
	# _tmp48 = _tmp36 + _tmp47
	  lw $t0, -152($fp)	# fill _tmp36 to $t0 from $fp-152
	  lw $t1, -196($fp)	# fill _tmp47 to $t1 from $fp-196
	  add $t2, $t0, $t1	
	  sw $t2, -200($fp)	# spill _tmp48 from $t2 to $fp-200
	# _tmp49 = _tmp48 + _tmp46
	  lw $t0, -200($fp)	# fill _tmp48 to $t0 from $fp-200
	  lw $t1, -192($fp)	# fill _tmp46 to $t1 from $fp-192
	  add $t2, $t0, $t1	
	  sw $t2, -204($fp)	# spill _tmp49 from $t2 to $fp-204
	# _tmp50 = *(_tmp49)
	  lw $t0, -204($fp)	# fill _tmp49 to $t0 from $fp-204
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -208($fp)	# spill _tmp50 from $t2 to $fp-208
	# _tmp51 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -212($fp)	# spill _tmp51 from $t2 to $fp-212
	# _tmp52 = *(_tmp50)
	  lw $t0, -208($fp)	# fill _tmp50 to $t0 from $fp-208
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -216($fp)	# spill _tmp52 from $t2 to $fp-216
	# _tmp53 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -220($fp)	# spill _tmp53 from $t2 to $fp-220
	# _tmp54 = _tmp51 < _tmp53
	  lw $t0, -212($fp)	# fill _tmp51 to $t0 from $fp-212
	  lw $t1, -220($fp)	# fill _tmp53 to $t1 from $fp-220
	  slt $t2, $t0, $t1	
	  sw $t2, -224($fp)	# spill _tmp54 from $t2 to $fp-224
	# _tmp55 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -228($fp)	# spill _tmp55 from $t2 to $fp-228
	# _tmp56 = _tmp52 - _tmp55
	  lw $t0, -216($fp)	# fill _tmp52 to $t0 from $fp-216
	  lw $t1, -228($fp)	# fill _tmp55 to $t1 from $fp-228
	  sub $t2, $t0, $t1	
	  sw $t2, -232($fp)	# spill _tmp56 from $t2 to $fp-232
	# _tmp57 = _tmp56 < _tmp51
	  lw $t0, -232($fp)	# fill _tmp56 to $t0 from $fp-232
	  lw $t1, -212($fp)	# fill _tmp51 to $t1 from $fp-212
	  slt $t2, $t0, $t1	
	  sw $t2, -236($fp)	# spill _tmp57 from $t2 to $fp-236
	# _tmp58 = _tmp54 || _tmp57
	  lw $t0, -224($fp)	# fill _tmp54 to $t0 from $fp-224
	  lw $t1, -236($fp)	# fill _tmp57 to $t1 from $fp-236
	  or $t2, $t0, $t1	
	  sw $t2, -240($fp)	# spill _tmp58 from $t2 to $fp-240
	# IfZ _tmp58 Goto arrayAcc_52
	  lw $t0, -240($fp)	# fill _tmp58 to $t0 from $fp-240
	  beqz $t0, arrayAcc_52	# branch if _tmp58 is zero 
	# _tmp59 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string34: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string34	# load label
	  sw $t2, -244($fp)	# spill _tmp59 from $t2 to $fp-244
	# PushParam _tmp59
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -244($fp)	# fill _tmp59 to $t0 from $fp-244
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_52:
	# _tmp60 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -248($fp)	# spill _tmp60 from $t2 to $fp-248
	# _tmp61 = _tmp51 * _tmp60
	  lw $t0, -212($fp)	# fill _tmp51 to $t0 from $fp-212
	  lw $t1, -248($fp)	# fill _tmp60 to $t1 from $fp-248
	  mul $t2, $t0, $t1	
	  sw $t2, -252($fp)	# spill _tmp61 from $t2 to $fp-252
	# _tmp62 = _tmp50 + _tmp61
	  lw $t0, -208($fp)	# fill _tmp50 to $t0 from $fp-208
	  lw $t1, -252($fp)	# fill _tmp61 to $t1 from $fp-252
	  add $t2, $t0, $t1	
	  sw $t2, -256($fp)	# spill _tmp62 from $t2 to $fp-256
	# _tmp63 = _tmp62 + _tmp60
	  lw $t0, -256($fp)	# fill _tmp62 to $t0 from $fp-256
	  lw $t1, -248($fp)	# fill _tmp60 to $t1 from $fp-248
	  add $t2, $t0, $t1	
	  sw $t2, -260($fp)	# spill _tmp63 from $t2 to $fp-260
	# _tmp64 = *(_tmp63)
	  lw $t0, -260($fp)	# fill _tmp63 to $t0 from $fp-260
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -264($fp)	# spill _tmp64 from $t2 to $fp-264
	# _tmp65 = *(_tmp64)
	  lw $t0, -264($fp)	# fill _tmp64 to $t0 from $fp-264
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -268($fp)	# spill _tmp65 from $t2 to $fp-268
	# _tmp66 = *(_tmp65 + 20)
	  lw $t0, -268($fp)	# fill _tmp65 to $t0 from $fp-268
	  lw $t2, 20($t0) 	# load with offset
	  sw $t2, -272($fp)	# spill _tmp66 from $t2 to $fp-272
	# PushParam mark
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -8($fp)	# fill mark to $t0 from $fp-8
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam _tmp64
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -264($fp)	# fill _tmp64 to $t0 from $fp-264
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp67 = ACall _tmp66
	  lw $t0, -272($fp)	# fill _tmp66 to $t0 from $fp-272
	  jalr $t0            	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -276($fp)	# spill _tmp67 from $t2 to $fp-276
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# _tmp68 = _tmp35 && _tmp67
	  lw $t0, -148($fp)	# fill _tmp35 to $t0 from $fp-148
	  lw $t1, -276($fp)	# fill _tmp67 to $t1 from $fp-276
	  and $t2, $t0, $t1	
	  sw $t2, -280($fp)	# spill _tmp68 from $t2 to $fp-280
	# _tmp69 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -284($fp)	# spill _tmp69 from $t2 to $fp-284
	# _tmp70 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -288($fp)	# spill _tmp70 from $t2 to $fp-288
	# _tmp71 = *(_tmp69)
	  lw $t0, -284($fp)	# fill _tmp69 to $t0 from $fp-284
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -292($fp)	# spill _tmp71 from $t2 to $fp-292
	# _tmp72 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -296($fp)	# spill _tmp72 from $t2 to $fp-296
	# _tmp73 = _tmp70 < _tmp72
	  lw $t0, -288($fp)	# fill _tmp70 to $t0 from $fp-288
	  lw $t1, -296($fp)	# fill _tmp72 to $t1 from $fp-296
	  slt $t2, $t0, $t1	
	  sw $t2, -300($fp)	# spill _tmp73 from $t2 to $fp-300
	# _tmp74 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -304($fp)	# spill _tmp74 from $t2 to $fp-304
	# _tmp75 = _tmp71 - _tmp74
	  lw $t0, -292($fp)	# fill _tmp71 to $t0 from $fp-292
	  lw $t1, -304($fp)	# fill _tmp74 to $t1 from $fp-304
	  sub $t2, $t0, $t1	
	  sw $t2, -308($fp)	# spill _tmp75 from $t2 to $fp-308
	# _tmp76 = _tmp75 < _tmp70
	  lw $t0, -308($fp)	# fill _tmp75 to $t0 from $fp-308
	  lw $t1, -288($fp)	# fill _tmp70 to $t1 from $fp-288
	  slt $t2, $t0, $t1	
	  sw $t2, -312($fp)	# spill _tmp76 from $t2 to $fp-312
	# _tmp77 = _tmp73 || _tmp76
	  lw $t0, -300($fp)	# fill _tmp73 to $t0 from $fp-300
	  lw $t1, -312($fp)	# fill _tmp76 to $t1 from $fp-312
	  or $t2, $t0, $t1	
	  sw $t2, -316($fp)	# spill _tmp77 from $t2 to $fp-316
	# IfZ _tmp77 Goto arrayAcc_53
	  lw $t0, -316($fp)	# fill _tmp77 to $t0 from $fp-316
	  beqz $t0, arrayAcc_53	# branch if _tmp77 is zero 
	# _tmp78 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string35: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string35	# load label
	  sw $t2, -320($fp)	# spill _tmp78 from $t2 to $fp-320
	# PushParam _tmp78
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -320($fp)	# fill _tmp78 to $t0 from $fp-320
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_53:
	# _tmp79 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -324($fp)	# spill _tmp79 from $t2 to $fp-324
	# _tmp80 = _tmp70 * _tmp79
	  lw $t0, -288($fp)	# fill _tmp70 to $t0 from $fp-288
	  lw $t1, -324($fp)	# fill _tmp79 to $t1 from $fp-324
	  mul $t2, $t0, $t1	
	  sw $t2, -328($fp)	# spill _tmp80 from $t2 to $fp-328
	# _tmp81 = _tmp69 + _tmp80
	  lw $t0, -284($fp)	# fill _tmp69 to $t0 from $fp-284
	  lw $t1, -328($fp)	# fill _tmp80 to $t1 from $fp-328
	  add $t2, $t0, $t1	
	  sw $t2, -332($fp)	# spill _tmp81 from $t2 to $fp-332
	# _tmp82 = _tmp81 + _tmp79
	  lw $t0, -332($fp)	# fill _tmp81 to $t0 from $fp-332
	  lw $t1, -324($fp)	# fill _tmp79 to $t1 from $fp-324
	  add $t2, $t0, $t1	
	  sw $t2, -336($fp)	# spill _tmp82 from $t2 to $fp-336
	# _tmp83 = *(_tmp82)
	  lw $t0, -336($fp)	# fill _tmp82 to $t0 from $fp-336
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -340($fp)	# spill _tmp83 from $t2 to $fp-340
	# _tmp84 = 2
	  li $t2, 2		# load constant value 2 into $t2
	  sw $t2, -344($fp)	# spill _tmp84 from $t2 to $fp-344
	# _tmp85 = *(_tmp83)
	  lw $t0, -340($fp)	# fill _tmp83 to $t0 from $fp-340
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -348($fp)	# spill _tmp85 from $t2 to $fp-348
	# _tmp86 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -352($fp)	# spill _tmp86 from $t2 to $fp-352
	# _tmp87 = _tmp84 < _tmp86
	  lw $t0, -344($fp)	# fill _tmp84 to $t0 from $fp-344
	  lw $t1, -352($fp)	# fill _tmp86 to $t1 from $fp-352
	  slt $t2, $t0, $t1	
	  sw $t2, -356($fp)	# spill _tmp87 from $t2 to $fp-356
	# _tmp88 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -360($fp)	# spill _tmp88 from $t2 to $fp-360
	# _tmp89 = _tmp85 - _tmp88
	  lw $t0, -348($fp)	# fill _tmp85 to $t0 from $fp-348
	  lw $t1, -360($fp)	# fill _tmp88 to $t1 from $fp-360
	  sub $t2, $t0, $t1	
	  sw $t2, -364($fp)	# spill _tmp89 from $t2 to $fp-364
	# _tmp90 = _tmp89 < _tmp84
	  lw $t0, -364($fp)	# fill _tmp89 to $t0 from $fp-364
	  lw $t1, -344($fp)	# fill _tmp84 to $t1 from $fp-344
	  slt $t2, $t0, $t1	
	  sw $t2, -368($fp)	# spill _tmp90 from $t2 to $fp-368
	# _tmp91 = _tmp87 || _tmp90
	  lw $t0, -356($fp)	# fill _tmp87 to $t0 from $fp-356
	  lw $t1, -368($fp)	# fill _tmp90 to $t1 from $fp-368
	  or $t2, $t0, $t1	
	  sw $t2, -372($fp)	# spill _tmp91 from $t2 to $fp-372
	# IfZ _tmp91 Goto arrayAcc_54
	  lw $t0, -372($fp)	# fill _tmp91 to $t0 from $fp-372
	  beqz $t0, arrayAcc_54	# branch if _tmp91 is zero 
	# _tmp92 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string36: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string36	# load label
	  sw $t2, -376($fp)	# spill _tmp92 from $t2 to $fp-376
	# PushParam _tmp92
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -376($fp)	# fill _tmp92 to $t0 from $fp-376
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_54:
	# _tmp93 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -380($fp)	# spill _tmp93 from $t2 to $fp-380
	# _tmp94 = _tmp84 * _tmp93
	  lw $t0, -344($fp)	# fill _tmp84 to $t0 from $fp-344
	  lw $t1, -380($fp)	# fill _tmp93 to $t1 from $fp-380
	  mul $t2, $t0, $t1	
	  sw $t2, -384($fp)	# spill _tmp94 from $t2 to $fp-384
	# _tmp95 = _tmp83 + _tmp94
	  lw $t0, -340($fp)	# fill _tmp83 to $t0 from $fp-340
	  lw $t1, -384($fp)	# fill _tmp94 to $t1 from $fp-384
	  add $t2, $t0, $t1	
	  sw $t2, -388($fp)	# spill _tmp95 from $t2 to $fp-388
	# _tmp96 = _tmp95 + _tmp93
	  lw $t0, -388($fp)	# fill _tmp95 to $t0 from $fp-388
	  lw $t1, -380($fp)	# fill _tmp93 to $t1 from $fp-380
	  add $t2, $t0, $t1	
	  sw $t2, -392($fp)	# spill _tmp96 from $t2 to $fp-392
	# _tmp97 = *(_tmp96)
	  lw $t0, -392($fp)	# fill _tmp96 to $t0 from $fp-392
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -396($fp)	# spill _tmp97 from $t2 to $fp-396
	# _tmp98 = *(_tmp97)
	  lw $t0, -396($fp)	# fill _tmp97 to $t0 from $fp-396
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -400($fp)	# spill _tmp98 from $t2 to $fp-400
	# _tmp99 = *(_tmp98 + 20)
	  lw $t0, -400($fp)	# fill _tmp98 to $t0 from $fp-400
	  lw $t2, 20($t0) 	# load with offset
	  sw $t2, -404($fp)	# spill _tmp99 from $t2 to $fp-404
	# PushParam mark
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -8($fp)	# fill mark to $t0 from $fp-8
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam _tmp97
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -396($fp)	# fill _tmp97 to $t0 from $fp-396
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp100 = ACall _tmp99
	  lw $t0, -404($fp)	# fill _tmp99 to $t0 from $fp-404
	  jalr $t0            	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -408($fp)	# spill _tmp100 from $t2 to $fp-408
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# _tmp101 = _tmp68 && _tmp100
	  lw $t0, -280($fp)	# fill _tmp68 to $t0 from $fp-280
	  lw $t1, -408($fp)	# fill _tmp100 to $t1 from $fp-408
	  and $t2, $t0, $t1	
	  sw $t2, -412($fp)	# spill _tmp101 from $t2 to $fp-412
	# IfZ _tmp101 Goto else_55
	  lw $t0, -412($fp)	# fill _tmp101 to $t0 from $fp-412
	  beqz $t0, else_55	# branch if _tmp101 is zero 
	# _tmp102 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -416($fp)	# spill _tmp102 from $t2 to $fp-416
	# Return _tmp102
	  lw $t2, -416($fp)	# fill _tmp102 to $t2 from $fp-416
	  move $v0, $t2		# assign return value into $v0
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# Goto endif_56
	  b endif_56		# unconditional branch
  else_55:
	# _tmp103 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -420($fp)	# spill _tmp103 from $t2 to $fp-420
	# _tmp104 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -424($fp)	# spill _tmp104 from $t2 to $fp-424
	# _tmp105 = *(_tmp103)
	  lw $t0, -420($fp)	# fill _tmp103 to $t0 from $fp-420
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -428($fp)	# spill _tmp105 from $t2 to $fp-428
	# _tmp106 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -432($fp)	# spill _tmp106 from $t2 to $fp-432
	# _tmp107 = _tmp104 < _tmp106
	  lw $t0, -424($fp)	# fill _tmp104 to $t0 from $fp-424
	  lw $t1, -432($fp)	# fill _tmp106 to $t1 from $fp-432
	  slt $t2, $t0, $t1	
	  sw $t2, -436($fp)	# spill _tmp107 from $t2 to $fp-436
	# _tmp108 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -440($fp)	# spill _tmp108 from $t2 to $fp-440
	# _tmp109 = _tmp105 - _tmp108
	  lw $t0, -428($fp)	# fill _tmp105 to $t0 from $fp-428
	  lw $t1, -440($fp)	# fill _tmp108 to $t1 from $fp-440
	  sub $t2, $t0, $t1	
	  sw $t2, -444($fp)	# spill _tmp109 from $t2 to $fp-444
	# _tmp110 = _tmp109 < _tmp104
	  lw $t0, -444($fp)	# fill _tmp109 to $t0 from $fp-444
	  lw $t1, -424($fp)	# fill _tmp104 to $t1 from $fp-424
	  slt $t2, $t0, $t1	
	  sw $t2, -448($fp)	# spill _tmp110 from $t2 to $fp-448
	# _tmp111 = _tmp107 || _tmp110
	  lw $t0, -436($fp)	# fill _tmp107 to $t0 from $fp-436
	  lw $t1, -448($fp)	# fill _tmp110 to $t1 from $fp-448
	  or $t2, $t0, $t1	
	  sw $t2, -452($fp)	# spill _tmp111 from $t2 to $fp-452
	# IfZ _tmp111 Goto arrayAcc_57
	  lw $t0, -452($fp)	# fill _tmp111 to $t0 from $fp-452
	  beqz $t0, arrayAcc_57	# branch if _tmp111 is zero 
	# _tmp112 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string37: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string37	# load label
	  sw $t2, -456($fp)	# spill _tmp112 from $t2 to $fp-456
	# PushParam _tmp112
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -456($fp)	# fill _tmp112 to $t0 from $fp-456
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_57:
	# _tmp113 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -460($fp)	# spill _tmp113 from $t2 to $fp-460
	# _tmp114 = _tmp104 * _tmp113
	  lw $t0, -424($fp)	# fill _tmp104 to $t0 from $fp-424
	  lw $t1, -460($fp)	# fill _tmp113 to $t1 from $fp-460
	  mul $t2, $t0, $t1	
	  sw $t2, -464($fp)	# spill _tmp114 from $t2 to $fp-464
	# _tmp115 = _tmp103 + _tmp114
	  lw $t0, -420($fp)	# fill _tmp103 to $t0 from $fp-420
	  lw $t1, -464($fp)	# fill _tmp114 to $t1 from $fp-464
	  add $t2, $t0, $t1	
	  sw $t2, -468($fp)	# spill _tmp115 from $t2 to $fp-468
	# _tmp116 = _tmp115 + _tmp113
	  lw $t0, -468($fp)	# fill _tmp115 to $t0 from $fp-468
	  lw $t1, -460($fp)	# fill _tmp113 to $t1 from $fp-460
	  add $t2, $t0, $t1	
	  sw $t2, -472($fp)	# spill _tmp116 from $t2 to $fp-472
	# _tmp117 = *(_tmp116)
	  lw $t0, -472($fp)	# fill _tmp116 to $t0 from $fp-472
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -476($fp)	# spill _tmp117 from $t2 to $fp-476
	# _tmp118 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -480($fp)	# spill _tmp118 from $t2 to $fp-480
	# _tmp119 = *(_tmp117)
	  lw $t0, -476($fp)	# fill _tmp117 to $t0 from $fp-476
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -484($fp)	# spill _tmp119 from $t2 to $fp-484
	# _tmp120 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -488($fp)	# spill _tmp120 from $t2 to $fp-488
	# _tmp121 = _tmp118 < _tmp120
	  lw $t0, -480($fp)	# fill _tmp118 to $t0 from $fp-480
	  lw $t1, -488($fp)	# fill _tmp120 to $t1 from $fp-488
	  slt $t2, $t0, $t1	
	  sw $t2, -492($fp)	# spill _tmp121 from $t2 to $fp-492
	# _tmp122 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -496($fp)	# spill _tmp122 from $t2 to $fp-496
	# _tmp123 = _tmp119 - _tmp122
	  lw $t0, -484($fp)	# fill _tmp119 to $t0 from $fp-484
	  lw $t1, -496($fp)	# fill _tmp122 to $t1 from $fp-496
	  sub $t2, $t0, $t1	
	  sw $t2, -500($fp)	# spill _tmp123 from $t2 to $fp-500
	# _tmp124 = _tmp123 < _tmp118
	  lw $t0, -500($fp)	# fill _tmp123 to $t0 from $fp-500
	  lw $t1, -480($fp)	# fill _tmp118 to $t1 from $fp-480
	  slt $t2, $t0, $t1	
	  sw $t2, -504($fp)	# spill _tmp124 from $t2 to $fp-504
	# _tmp125 = _tmp121 || _tmp124
	  lw $t0, -492($fp)	# fill _tmp121 to $t0 from $fp-492
	  lw $t1, -504($fp)	# fill _tmp124 to $t1 from $fp-504
	  or $t2, $t0, $t1	
	  sw $t2, -508($fp)	# spill _tmp125 from $t2 to $fp-508
	# IfZ _tmp125 Goto arrayAcc_58
	  lw $t0, -508($fp)	# fill _tmp125 to $t0 from $fp-508
	  beqz $t0, arrayAcc_58	# branch if _tmp125 is zero 
	# _tmp126 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string38: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string38	# load label
	  sw $t2, -512($fp)	# spill _tmp126 from $t2 to $fp-512
	# PushParam _tmp126
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -512($fp)	# fill _tmp126 to $t0 from $fp-512
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_58:
	# _tmp127 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -516($fp)	# spill _tmp127 from $t2 to $fp-516
	# _tmp128 = _tmp118 * _tmp127
	  lw $t0, -480($fp)	# fill _tmp118 to $t0 from $fp-480
	  lw $t1, -516($fp)	# fill _tmp127 to $t1 from $fp-516
	  mul $t2, $t0, $t1	
	  sw $t2, -520($fp)	# spill _tmp128 from $t2 to $fp-520
	# _tmp129 = _tmp117 + _tmp128
	  lw $t0, -476($fp)	# fill _tmp117 to $t0 from $fp-476
	  lw $t1, -520($fp)	# fill _tmp128 to $t1 from $fp-520
	  add $t2, $t0, $t1	
	  sw $t2, -524($fp)	# spill _tmp129 from $t2 to $fp-524
	# _tmp130 = _tmp129 + _tmp127
	  lw $t0, -524($fp)	# fill _tmp129 to $t0 from $fp-524
	  lw $t1, -516($fp)	# fill _tmp127 to $t1 from $fp-516
	  add $t2, $t0, $t1	
	  sw $t2, -528($fp)	# spill _tmp130 from $t2 to $fp-528
	# _tmp131 = *(_tmp130)
	  lw $t0, -528($fp)	# fill _tmp130 to $t0 from $fp-528
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -532($fp)	# spill _tmp131 from $t2 to $fp-532
	# _tmp132 = *(_tmp131)
	  lw $t0, -532($fp)	# fill _tmp131 to $t0 from $fp-532
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -536($fp)	# spill _tmp132 from $t2 to $fp-536
	# _tmp133 = *(_tmp132 + 20)
	  lw $t0, -536($fp)	# fill _tmp132 to $t0 from $fp-536
	  lw $t2, 20($t0) 	# load with offset
	  sw $t2, -540($fp)	# spill _tmp133 from $t2 to $fp-540
	# PushParam mark
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -8($fp)	# fill mark to $t0 from $fp-8
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam _tmp131
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -532($fp)	# fill _tmp131 to $t0 from $fp-532
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp134 = ACall _tmp133
	  lw $t0, -540($fp)	# fill _tmp133 to $t0 from $fp-540
	  jalr $t0            	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -544($fp)	# spill _tmp134 from $t2 to $fp-544
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# _tmp135 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -548($fp)	# spill _tmp135 from $t2 to $fp-548
	# _tmp136 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -552($fp)	# spill _tmp136 from $t2 to $fp-552
	# _tmp137 = *(_tmp135)
	  lw $t0, -548($fp)	# fill _tmp135 to $t0 from $fp-548
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -556($fp)	# spill _tmp137 from $t2 to $fp-556
	# _tmp138 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -560($fp)	# spill _tmp138 from $t2 to $fp-560
	# _tmp139 = _tmp136 < _tmp138
	  lw $t0, -552($fp)	# fill _tmp136 to $t0 from $fp-552
	  lw $t1, -560($fp)	# fill _tmp138 to $t1 from $fp-560
	  slt $t2, $t0, $t1	
	  sw $t2, -564($fp)	# spill _tmp139 from $t2 to $fp-564
	# _tmp140 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -568($fp)	# spill _tmp140 from $t2 to $fp-568
	# _tmp141 = _tmp137 - _tmp140
	  lw $t0, -556($fp)	# fill _tmp137 to $t0 from $fp-556
	  lw $t1, -568($fp)	# fill _tmp140 to $t1 from $fp-568
	  sub $t2, $t0, $t1	
	  sw $t2, -572($fp)	# spill _tmp141 from $t2 to $fp-572
	# _tmp142 = _tmp141 < _tmp136
	  lw $t0, -572($fp)	# fill _tmp141 to $t0 from $fp-572
	  lw $t1, -552($fp)	# fill _tmp136 to $t1 from $fp-552
	  slt $t2, $t0, $t1	
	  sw $t2, -576($fp)	# spill _tmp142 from $t2 to $fp-576
	# _tmp143 = _tmp139 || _tmp142
	  lw $t0, -564($fp)	# fill _tmp139 to $t0 from $fp-564
	  lw $t1, -576($fp)	# fill _tmp142 to $t1 from $fp-576
	  or $t2, $t0, $t1	
	  sw $t2, -580($fp)	# spill _tmp143 from $t2 to $fp-580
	# IfZ _tmp143 Goto arrayAcc_59
	  lw $t0, -580($fp)	# fill _tmp143 to $t0 from $fp-580
	  beqz $t0, arrayAcc_59	# branch if _tmp143 is zero 
	# _tmp144 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string39: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string39	# load label
	  sw $t2, -584($fp)	# spill _tmp144 from $t2 to $fp-584
	# PushParam _tmp144
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -584($fp)	# fill _tmp144 to $t0 from $fp-584
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_59:
	# _tmp145 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -588($fp)	# spill _tmp145 from $t2 to $fp-588
	# _tmp146 = _tmp136 * _tmp145
	  lw $t0, -552($fp)	# fill _tmp136 to $t0 from $fp-552
	  lw $t1, -588($fp)	# fill _tmp145 to $t1 from $fp-588
	  mul $t2, $t0, $t1	
	  sw $t2, -592($fp)	# spill _tmp146 from $t2 to $fp-592
	# _tmp147 = _tmp135 + _tmp146
	  lw $t0, -548($fp)	# fill _tmp135 to $t0 from $fp-548
	  lw $t1, -592($fp)	# fill _tmp146 to $t1 from $fp-592
	  add $t2, $t0, $t1	
	  sw $t2, -596($fp)	# spill _tmp147 from $t2 to $fp-596
	# _tmp148 = _tmp147 + _tmp145
	  lw $t0, -596($fp)	# fill _tmp147 to $t0 from $fp-596
	  lw $t1, -588($fp)	# fill _tmp145 to $t1 from $fp-588
	  add $t2, $t0, $t1	
	  sw $t2, -600($fp)	# spill _tmp148 from $t2 to $fp-600
	# _tmp149 = *(_tmp148)
	  lw $t0, -600($fp)	# fill _tmp148 to $t0 from $fp-600
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -604($fp)	# spill _tmp149 from $t2 to $fp-604
	# _tmp150 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -608($fp)	# spill _tmp150 from $t2 to $fp-608
	# _tmp151 = *(_tmp149)
	  lw $t0, -604($fp)	# fill _tmp149 to $t0 from $fp-604
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -612($fp)	# spill _tmp151 from $t2 to $fp-612
	# _tmp152 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -616($fp)	# spill _tmp152 from $t2 to $fp-616
	# _tmp153 = _tmp150 < _tmp152
	  lw $t0, -608($fp)	# fill _tmp150 to $t0 from $fp-608
	  lw $t1, -616($fp)	# fill _tmp152 to $t1 from $fp-616
	  slt $t2, $t0, $t1	
	  sw $t2, -620($fp)	# spill _tmp153 from $t2 to $fp-620
	# _tmp154 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -624($fp)	# spill _tmp154 from $t2 to $fp-624
	# _tmp155 = _tmp151 - _tmp154
	  lw $t0, -612($fp)	# fill _tmp151 to $t0 from $fp-612
	  lw $t1, -624($fp)	# fill _tmp154 to $t1 from $fp-624
	  sub $t2, $t0, $t1	
	  sw $t2, -628($fp)	# spill _tmp155 from $t2 to $fp-628
	# _tmp156 = _tmp155 < _tmp150
	  lw $t0, -628($fp)	# fill _tmp155 to $t0 from $fp-628
	  lw $t1, -608($fp)	# fill _tmp150 to $t1 from $fp-608
	  slt $t2, $t0, $t1	
	  sw $t2, -632($fp)	# spill _tmp156 from $t2 to $fp-632
	# _tmp157 = _tmp153 || _tmp156
	  lw $t0, -620($fp)	# fill _tmp153 to $t0 from $fp-620
	  lw $t1, -632($fp)	# fill _tmp156 to $t1 from $fp-632
	  or $t2, $t0, $t1	
	  sw $t2, -636($fp)	# spill _tmp157 from $t2 to $fp-636
	# IfZ _tmp157 Goto arrayAcc_60
	  lw $t0, -636($fp)	# fill _tmp157 to $t0 from $fp-636
	  beqz $t0, arrayAcc_60	# branch if _tmp157 is zero 
	# _tmp158 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string40: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string40	# load label
	  sw $t2, -640($fp)	# spill _tmp158 from $t2 to $fp-640
	# PushParam _tmp158
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -640($fp)	# fill _tmp158 to $t0 from $fp-640
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_60:
	# _tmp159 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -644($fp)	# spill _tmp159 from $t2 to $fp-644
	# _tmp160 = _tmp150 * _tmp159
	  lw $t0, -608($fp)	# fill _tmp150 to $t0 from $fp-608
	  lw $t1, -644($fp)	# fill _tmp159 to $t1 from $fp-644
	  mul $t2, $t0, $t1	
	  sw $t2, -648($fp)	# spill _tmp160 from $t2 to $fp-648
	# _tmp161 = _tmp149 + _tmp160
	  lw $t0, -604($fp)	# fill _tmp149 to $t0 from $fp-604
	  lw $t1, -648($fp)	# fill _tmp160 to $t1 from $fp-648
	  add $t2, $t0, $t1	
	  sw $t2, -652($fp)	# spill _tmp161 from $t2 to $fp-652
	# _tmp162 = _tmp161 + _tmp159
	  lw $t0, -652($fp)	# fill _tmp161 to $t0 from $fp-652
	  lw $t1, -644($fp)	# fill _tmp159 to $t1 from $fp-644
	  add $t2, $t0, $t1	
	  sw $t2, -656($fp)	# spill _tmp162 from $t2 to $fp-656
	# _tmp163 = *(_tmp162)
	  lw $t0, -656($fp)	# fill _tmp162 to $t0 from $fp-656
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -660($fp)	# spill _tmp163 from $t2 to $fp-660
	# _tmp164 = *(_tmp163)
	  lw $t0, -660($fp)	# fill _tmp163 to $t0 from $fp-660
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -664($fp)	# spill _tmp164 from $t2 to $fp-664
	# _tmp165 = *(_tmp164 + 20)
	  lw $t0, -664($fp)	# fill _tmp164 to $t0 from $fp-664
	  lw $t2, 20($t0) 	# load with offset
	  sw $t2, -668($fp)	# spill _tmp165 from $t2 to $fp-668
	# PushParam mark
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -8($fp)	# fill mark to $t0 from $fp-8
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam _tmp163
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -660($fp)	# fill _tmp163 to $t0 from $fp-660
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp166 = ACall _tmp165
	  lw $t0, -668($fp)	# fill _tmp165 to $t0 from $fp-668
	  jalr $t0            	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -672($fp)	# spill _tmp166 from $t2 to $fp-672
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# _tmp167 = _tmp134 && _tmp166
	  lw $t0, -544($fp)	# fill _tmp134 to $t0 from $fp-544
	  lw $t1, -672($fp)	# fill _tmp166 to $t1 from $fp-672
	  and $t2, $t0, $t1	
	  sw $t2, -676($fp)	# spill _tmp167 from $t2 to $fp-676
	# _tmp168 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -680($fp)	# spill _tmp168 from $t2 to $fp-680
	# _tmp169 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -684($fp)	# spill _tmp169 from $t2 to $fp-684
	# _tmp170 = *(_tmp168)
	  lw $t0, -680($fp)	# fill _tmp168 to $t0 from $fp-680
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -688($fp)	# spill _tmp170 from $t2 to $fp-688
	# _tmp171 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -692($fp)	# spill _tmp171 from $t2 to $fp-692
	# _tmp172 = _tmp169 < _tmp171
	  lw $t0, -684($fp)	# fill _tmp169 to $t0 from $fp-684
	  lw $t1, -692($fp)	# fill _tmp171 to $t1 from $fp-692
	  slt $t2, $t0, $t1	
	  sw $t2, -696($fp)	# spill _tmp172 from $t2 to $fp-696
	# _tmp173 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -700($fp)	# spill _tmp173 from $t2 to $fp-700
	# _tmp174 = _tmp170 - _tmp173
	  lw $t0, -688($fp)	# fill _tmp170 to $t0 from $fp-688
	  lw $t1, -700($fp)	# fill _tmp173 to $t1 from $fp-700
	  sub $t2, $t0, $t1	
	  sw $t2, -704($fp)	# spill _tmp174 from $t2 to $fp-704
	# _tmp175 = _tmp174 < _tmp169
	  lw $t0, -704($fp)	# fill _tmp174 to $t0 from $fp-704
	  lw $t1, -684($fp)	# fill _tmp169 to $t1 from $fp-684
	  slt $t2, $t0, $t1	
	  sw $t2, -708($fp)	# spill _tmp175 from $t2 to $fp-708
	# _tmp176 = _tmp172 || _tmp175
	  lw $t0, -696($fp)	# fill _tmp172 to $t0 from $fp-696
	  lw $t1, -708($fp)	# fill _tmp175 to $t1 from $fp-708
	  or $t2, $t0, $t1	
	  sw $t2, -712($fp)	# spill _tmp176 from $t2 to $fp-712
	# IfZ _tmp176 Goto arrayAcc_61
	  lw $t0, -712($fp)	# fill _tmp176 to $t0 from $fp-712
	  beqz $t0, arrayAcc_61	# branch if _tmp176 is zero 
	# _tmp177 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string41: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string41	# load label
	  sw $t2, -716($fp)	# spill _tmp177 from $t2 to $fp-716
	# PushParam _tmp177
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -716($fp)	# fill _tmp177 to $t0 from $fp-716
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_61:
	# _tmp178 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -720($fp)	# spill _tmp178 from $t2 to $fp-720
	# _tmp179 = _tmp169 * _tmp178
	  lw $t0, -684($fp)	# fill _tmp169 to $t0 from $fp-684
	  lw $t1, -720($fp)	# fill _tmp178 to $t1 from $fp-720
	  mul $t2, $t0, $t1	
	  sw $t2, -724($fp)	# spill _tmp179 from $t2 to $fp-724
	# _tmp180 = _tmp168 + _tmp179
	  lw $t0, -680($fp)	# fill _tmp168 to $t0 from $fp-680
	  lw $t1, -724($fp)	# fill _tmp179 to $t1 from $fp-724
	  add $t2, $t0, $t1	
	  sw $t2, -728($fp)	# spill _tmp180 from $t2 to $fp-728
	# _tmp181 = _tmp180 + _tmp178
	  lw $t0, -728($fp)	# fill _tmp180 to $t0 from $fp-728
	  lw $t1, -720($fp)	# fill _tmp178 to $t1 from $fp-720
	  add $t2, $t0, $t1	
	  sw $t2, -732($fp)	# spill _tmp181 from $t2 to $fp-732
	# _tmp182 = *(_tmp181)
	  lw $t0, -732($fp)	# fill _tmp181 to $t0 from $fp-732
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -736($fp)	# spill _tmp182 from $t2 to $fp-736
	# _tmp183 = 2
	  li $t2, 2		# load constant value 2 into $t2
	  sw $t2, -740($fp)	# spill _tmp183 from $t2 to $fp-740
	# _tmp184 = *(_tmp182)
	  lw $t0, -736($fp)	# fill _tmp182 to $t0 from $fp-736
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -744($fp)	# spill _tmp184 from $t2 to $fp-744
	# _tmp185 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -748($fp)	# spill _tmp185 from $t2 to $fp-748
	# _tmp186 = _tmp183 < _tmp185
	  lw $t0, -740($fp)	# fill _tmp183 to $t0 from $fp-740
	  lw $t1, -748($fp)	# fill _tmp185 to $t1 from $fp-748
	  slt $t2, $t0, $t1	
	  sw $t2, -752($fp)	# spill _tmp186 from $t2 to $fp-752
	# _tmp187 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -756($fp)	# spill _tmp187 from $t2 to $fp-756
	# _tmp188 = _tmp184 - _tmp187
	  lw $t0, -744($fp)	# fill _tmp184 to $t0 from $fp-744
	  lw $t1, -756($fp)	# fill _tmp187 to $t1 from $fp-756
	  sub $t2, $t0, $t1	
	  sw $t2, -760($fp)	# spill _tmp188 from $t2 to $fp-760
	# _tmp189 = _tmp188 < _tmp183
	  lw $t0, -760($fp)	# fill _tmp188 to $t0 from $fp-760
	  lw $t1, -740($fp)	# fill _tmp183 to $t1 from $fp-740
	  slt $t2, $t0, $t1	
	  sw $t2, -764($fp)	# spill _tmp189 from $t2 to $fp-764
	# _tmp190 = _tmp186 || _tmp189
	  lw $t0, -752($fp)	# fill _tmp186 to $t0 from $fp-752
	  lw $t1, -764($fp)	# fill _tmp189 to $t1 from $fp-764
	  or $t2, $t0, $t1	
	  sw $t2, -768($fp)	# spill _tmp190 from $t2 to $fp-768
	# IfZ _tmp190 Goto arrayAcc_62
	  lw $t0, -768($fp)	# fill _tmp190 to $t0 from $fp-768
	  beqz $t0, arrayAcc_62	# branch if _tmp190 is zero 
	# _tmp191 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string42: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string42	# load label
	  sw $t2, -772($fp)	# spill _tmp191 from $t2 to $fp-772
	# PushParam _tmp191
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -772($fp)	# fill _tmp191 to $t0 from $fp-772
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_62:
	# _tmp192 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -776($fp)	# spill _tmp192 from $t2 to $fp-776
	# _tmp193 = _tmp183 * _tmp192
	  lw $t0, -740($fp)	# fill _tmp183 to $t0 from $fp-740
	  lw $t1, -776($fp)	# fill _tmp192 to $t1 from $fp-776
	  mul $t2, $t0, $t1	
	  sw $t2, -780($fp)	# spill _tmp193 from $t2 to $fp-780
	# _tmp194 = _tmp182 + _tmp193
	  lw $t0, -736($fp)	# fill _tmp182 to $t0 from $fp-736
	  lw $t1, -780($fp)	# fill _tmp193 to $t1 from $fp-780
	  add $t2, $t0, $t1	
	  sw $t2, -784($fp)	# spill _tmp194 from $t2 to $fp-784
	# _tmp195 = _tmp194 + _tmp192
	  lw $t0, -784($fp)	# fill _tmp194 to $t0 from $fp-784
	  lw $t1, -776($fp)	# fill _tmp192 to $t1 from $fp-776
	  add $t2, $t0, $t1	
	  sw $t2, -788($fp)	# spill _tmp195 from $t2 to $fp-788
	# _tmp196 = *(_tmp195)
	  lw $t0, -788($fp)	# fill _tmp195 to $t0 from $fp-788
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -792($fp)	# spill _tmp196 from $t2 to $fp-792
	# _tmp197 = *(_tmp196)
	  lw $t0, -792($fp)	# fill _tmp196 to $t0 from $fp-792
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -796($fp)	# spill _tmp197 from $t2 to $fp-796
	# _tmp198 = *(_tmp197 + 20)
	  lw $t0, -796($fp)	# fill _tmp197 to $t0 from $fp-796
	  lw $t2, 20($t0) 	# load with offset
	  sw $t2, -800($fp)	# spill _tmp198 from $t2 to $fp-800
	# PushParam mark
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -8($fp)	# fill mark to $t0 from $fp-8
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam _tmp196
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -792($fp)	# fill _tmp196 to $t0 from $fp-792
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp199 = ACall _tmp198
	  lw $t0, -800($fp)	# fill _tmp198 to $t0 from $fp-800
	  jalr $t0            	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -804($fp)	# spill _tmp199 from $t2 to $fp-804
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# _tmp200 = _tmp167 && _tmp199
	  lw $t0, -676($fp)	# fill _tmp167 to $t0 from $fp-676
	  lw $t1, -804($fp)	# fill _tmp199 to $t1 from $fp-804
	  and $t2, $t0, $t1	
	  sw $t2, -808($fp)	# spill _tmp200 from $t2 to $fp-808
	# IfZ _tmp200 Goto else_63
	  lw $t0, -808($fp)	# fill _tmp200 to $t0 from $fp-808
	  beqz $t0, else_63	# branch if _tmp200 is zero 
	# _tmp201 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -812($fp)	# spill _tmp201 from $t2 to $fp-812
	# Return _tmp201
	  lw $t2, -812($fp)	# fill _tmp201 to $t2 from $fp-812
	  move $v0, $t2		# assign return value into $v0
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# Goto endif_64
	  b endif_64		# unconditional branch
  else_63:
	# _tmp202 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -816($fp)	# spill _tmp202 from $t2 to $fp-816
	# _tmp203 = 2
	  li $t2, 2		# load constant value 2 into $t2
	  sw $t2, -820($fp)	# spill _tmp203 from $t2 to $fp-820
	# _tmp204 = *(_tmp202)
	  lw $t0, -816($fp)	# fill _tmp202 to $t0 from $fp-816
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -824($fp)	# spill _tmp204 from $t2 to $fp-824
	# _tmp205 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -828($fp)	# spill _tmp205 from $t2 to $fp-828
	# _tmp206 = _tmp203 < _tmp205
	  lw $t0, -820($fp)	# fill _tmp203 to $t0 from $fp-820
	  lw $t1, -828($fp)	# fill _tmp205 to $t1 from $fp-828
	  slt $t2, $t0, $t1	
	  sw $t2, -832($fp)	# spill _tmp206 from $t2 to $fp-832
	# _tmp207 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -836($fp)	# spill _tmp207 from $t2 to $fp-836
	# _tmp208 = _tmp204 - _tmp207
	  lw $t0, -824($fp)	# fill _tmp204 to $t0 from $fp-824
	  lw $t1, -836($fp)	# fill _tmp207 to $t1 from $fp-836
	  sub $t2, $t0, $t1	
	  sw $t2, -840($fp)	# spill _tmp208 from $t2 to $fp-840
	# _tmp209 = _tmp208 < _tmp203
	  lw $t0, -840($fp)	# fill _tmp208 to $t0 from $fp-840
	  lw $t1, -820($fp)	# fill _tmp203 to $t1 from $fp-820
	  slt $t2, $t0, $t1	
	  sw $t2, -844($fp)	# spill _tmp209 from $t2 to $fp-844
	# _tmp210 = _tmp206 || _tmp209
	  lw $t0, -832($fp)	# fill _tmp206 to $t0 from $fp-832
	  lw $t1, -844($fp)	# fill _tmp209 to $t1 from $fp-844
	  or $t2, $t0, $t1	
	  sw $t2, -848($fp)	# spill _tmp210 from $t2 to $fp-848
	# IfZ _tmp210 Goto arrayAcc_65
	  lw $t0, -848($fp)	# fill _tmp210 to $t0 from $fp-848
	  beqz $t0, arrayAcc_65	# branch if _tmp210 is zero 
	# _tmp211 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string43: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string43	# load label
	  sw $t2, -852($fp)	# spill _tmp211 from $t2 to $fp-852
	# PushParam _tmp211
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -852($fp)	# fill _tmp211 to $t0 from $fp-852
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_65:
	# _tmp212 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -856($fp)	# spill _tmp212 from $t2 to $fp-856
	# _tmp213 = _tmp203 * _tmp212
	  lw $t0, -820($fp)	# fill _tmp203 to $t0 from $fp-820
	  lw $t1, -856($fp)	# fill _tmp212 to $t1 from $fp-856
	  mul $t2, $t0, $t1	
	  sw $t2, -860($fp)	# spill _tmp213 from $t2 to $fp-860
	# _tmp214 = _tmp202 + _tmp213
	  lw $t0, -816($fp)	# fill _tmp202 to $t0 from $fp-816
	  lw $t1, -860($fp)	# fill _tmp213 to $t1 from $fp-860
	  add $t2, $t0, $t1	
	  sw $t2, -864($fp)	# spill _tmp214 from $t2 to $fp-864
	# _tmp215 = _tmp214 + _tmp212
	  lw $t0, -864($fp)	# fill _tmp214 to $t0 from $fp-864
	  lw $t1, -856($fp)	# fill _tmp212 to $t1 from $fp-856
	  add $t2, $t0, $t1	
	  sw $t2, -868($fp)	# spill _tmp215 from $t2 to $fp-868
	# _tmp216 = *(_tmp215)
	  lw $t0, -868($fp)	# fill _tmp215 to $t0 from $fp-868
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -872($fp)	# spill _tmp216 from $t2 to $fp-872
	# _tmp217 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -876($fp)	# spill _tmp217 from $t2 to $fp-876
	# _tmp218 = *(_tmp216)
	  lw $t0, -872($fp)	# fill _tmp216 to $t0 from $fp-872
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -880($fp)	# spill _tmp218 from $t2 to $fp-880
	# _tmp219 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -884($fp)	# spill _tmp219 from $t2 to $fp-884
	# _tmp220 = _tmp217 < _tmp219
	  lw $t0, -876($fp)	# fill _tmp217 to $t0 from $fp-876
	  lw $t1, -884($fp)	# fill _tmp219 to $t1 from $fp-884
	  slt $t2, $t0, $t1	
	  sw $t2, -888($fp)	# spill _tmp220 from $t2 to $fp-888
	# _tmp221 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -892($fp)	# spill _tmp221 from $t2 to $fp-892
	# _tmp222 = _tmp218 - _tmp221
	  lw $t0, -880($fp)	# fill _tmp218 to $t0 from $fp-880
	  lw $t1, -892($fp)	# fill _tmp221 to $t1 from $fp-892
	  sub $t2, $t0, $t1	
	  sw $t2, -896($fp)	# spill _tmp222 from $t2 to $fp-896
	# _tmp223 = _tmp222 < _tmp217
	  lw $t0, -896($fp)	# fill _tmp222 to $t0 from $fp-896
	  lw $t1, -876($fp)	# fill _tmp217 to $t1 from $fp-876
	  slt $t2, $t0, $t1	
	  sw $t2, -900($fp)	# spill _tmp223 from $t2 to $fp-900
	# _tmp224 = _tmp220 || _tmp223
	  lw $t0, -888($fp)	# fill _tmp220 to $t0 from $fp-888
	  lw $t1, -900($fp)	# fill _tmp223 to $t1 from $fp-900
	  or $t2, $t0, $t1	
	  sw $t2, -904($fp)	# spill _tmp224 from $t2 to $fp-904
	# IfZ _tmp224 Goto arrayAcc_66
	  lw $t0, -904($fp)	# fill _tmp224 to $t0 from $fp-904
	  beqz $t0, arrayAcc_66	# branch if _tmp224 is zero 
	# _tmp225 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string44: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string44	# load label
	  sw $t2, -908($fp)	# spill _tmp225 from $t2 to $fp-908
	# PushParam _tmp225
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -908($fp)	# fill _tmp225 to $t0 from $fp-908
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_66:
	# _tmp226 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -912($fp)	# spill _tmp226 from $t2 to $fp-912
	# _tmp227 = _tmp217 * _tmp226
	  lw $t0, -876($fp)	# fill _tmp217 to $t0 from $fp-876
	  lw $t1, -912($fp)	# fill _tmp226 to $t1 from $fp-912
	  mul $t2, $t0, $t1	
	  sw $t2, -916($fp)	# spill _tmp227 from $t2 to $fp-916
	# _tmp228 = _tmp216 + _tmp227
	  lw $t0, -872($fp)	# fill _tmp216 to $t0 from $fp-872
	  lw $t1, -916($fp)	# fill _tmp227 to $t1 from $fp-916
	  add $t2, $t0, $t1	
	  sw $t2, -920($fp)	# spill _tmp228 from $t2 to $fp-920
	# _tmp229 = _tmp228 + _tmp226
	  lw $t0, -920($fp)	# fill _tmp228 to $t0 from $fp-920
	  lw $t1, -912($fp)	# fill _tmp226 to $t1 from $fp-912
	  add $t2, $t0, $t1	
	  sw $t2, -924($fp)	# spill _tmp229 from $t2 to $fp-924
	# _tmp230 = *(_tmp229)
	  lw $t0, -924($fp)	# fill _tmp229 to $t0 from $fp-924
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -928($fp)	# spill _tmp230 from $t2 to $fp-928
	# _tmp231 = *(_tmp230)
	  lw $t0, -928($fp)	# fill _tmp230 to $t0 from $fp-928
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -932($fp)	# spill _tmp231 from $t2 to $fp-932
	# _tmp232 = *(_tmp231 + 20)
	  lw $t0, -932($fp)	# fill _tmp231 to $t0 from $fp-932
	  lw $t2, 20($t0) 	# load with offset
	  sw $t2, -936($fp)	# spill _tmp232 from $t2 to $fp-936
	# PushParam mark
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -8($fp)	# fill mark to $t0 from $fp-8
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam _tmp230
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -928($fp)	# fill _tmp230 to $t0 from $fp-928
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp233 = ACall _tmp232
	  lw $t0, -936($fp)	# fill _tmp232 to $t0 from $fp-936
	  jalr $t0            	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -940($fp)	# spill _tmp233 from $t2 to $fp-940
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# _tmp234 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -944($fp)	# spill _tmp234 from $t2 to $fp-944
	# _tmp235 = 2
	  li $t2, 2		# load constant value 2 into $t2
	  sw $t2, -948($fp)	# spill _tmp235 from $t2 to $fp-948
	# _tmp236 = *(_tmp234)
	  lw $t0, -944($fp)	# fill _tmp234 to $t0 from $fp-944
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -952($fp)	# spill _tmp236 from $t2 to $fp-952
	# _tmp237 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -956($fp)	# spill _tmp237 from $t2 to $fp-956
	# _tmp238 = _tmp235 < _tmp237
	  lw $t0, -948($fp)	# fill _tmp235 to $t0 from $fp-948
	  lw $t1, -956($fp)	# fill _tmp237 to $t1 from $fp-956
	  slt $t2, $t0, $t1	
	  sw $t2, -960($fp)	# spill _tmp238 from $t2 to $fp-960
	# _tmp239 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -964($fp)	# spill _tmp239 from $t2 to $fp-964
	# _tmp240 = _tmp236 - _tmp239
	  lw $t0, -952($fp)	# fill _tmp236 to $t0 from $fp-952
	  lw $t1, -964($fp)	# fill _tmp239 to $t1 from $fp-964
	  sub $t2, $t0, $t1	
	  sw $t2, -968($fp)	# spill _tmp240 from $t2 to $fp-968
	# _tmp241 = _tmp240 < _tmp235
	  lw $t0, -968($fp)	# fill _tmp240 to $t0 from $fp-968
	  lw $t1, -948($fp)	# fill _tmp235 to $t1 from $fp-948
	  slt $t2, $t0, $t1	
	  sw $t2, -972($fp)	# spill _tmp241 from $t2 to $fp-972
	# _tmp242 = _tmp238 || _tmp241
	  lw $t0, -960($fp)	# fill _tmp238 to $t0 from $fp-960
	  lw $t1, -972($fp)	# fill _tmp241 to $t1 from $fp-972
	  or $t2, $t0, $t1	
	  sw $t2, -976($fp)	# spill _tmp242 from $t2 to $fp-976
	# IfZ _tmp242 Goto arrayAcc_67
	  lw $t0, -976($fp)	# fill _tmp242 to $t0 from $fp-976
	  beqz $t0, arrayAcc_67	# branch if _tmp242 is zero 
	# _tmp243 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string45: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string45	# load label
	  sw $t2, -980($fp)	# spill _tmp243 from $t2 to $fp-980
	# PushParam _tmp243
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -980($fp)	# fill _tmp243 to $t0 from $fp-980
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_67:
	# _tmp244 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -984($fp)	# spill _tmp244 from $t2 to $fp-984
	# _tmp245 = _tmp235 * _tmp244
	  lw $t0, -948($fp)	# fill _tmp235 to $t0 from $fp-948
	  lw $t1, -984($fp)	# fill _tmp244 to $t1 from $fp-984
	  mul $t2, $t0, $t1	
	  sw $t2, -988($fp)	# spill _tmp245 from $t2 to $fp-988
	# _tmp246 = _tmp234 + _tmp245
	  lw $t0, -944($fp)	# fill _tmp234 to $t0 from $fp-944
	  lw $t1, -988($fp)	# fill _tmp245 to $t1 from $fp-988
	  add $t2, $t0, $t1	
	  sw $t2, -992($fp)	# spill _tmp246 from $t2 to $fp-992
	# _tmp247 = _tmp246 + _tmp244
	  lw $t0, -992($fp)	# fill _tmp246 to $t0 from $fp-992
	  lw $t1, -984($fp)	# fill _tmp244 to $t1 from $fp-984
	  add $t2, $t0, $t1	
	  sw $t2, -996($fp)	# spill _tmp247 from $t2 to $fp-996
	# _tmp248 = *(_tmp247)
	  lw $t0, -996($fp)	# fill _tmp247 to $t0 from $fp-996
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -1000($fp)	# spill _tmp248 from $t2 to $fp-1000
	# _tmp249 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -1004($fp)	# spill _tmp249 from $t2 to $fp-1004
	# _tmp250 = *(_tmp248)
	  lw $t0, -1000($fp)	# fill _tmp248 to $t0 from $fp-1000
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -1008($fp)	# spill _tmp250 from $t2 to $fp-1008
	# _tmp251 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -1012($fp)	# spill _tmp251 from $t2 to $fp-1012
	# _tmp252 = _tmp249 < _tmp251
	  lw $t0, -1004($fp)	# fill _tmp249 to $t0 from $fp-1004
	  lw $t1, -1012($fp)	# fill _tmp251 to $t1 from $fp-1012
	  slt $t2, $t0, $t1	
	  sw $t2, -1016($fp)	# spill _tmp252 from $t2 to $fp-1016
	# _tmp253 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -1020($fp)	# spill _tmp253 from $t2 to $fp-1020
	# _tmp254 = _tmp250 - _tmp253
	  lw $t0, -1008($fp)	# fill _tmp250 to $t0 from $fp-1008
	  lw $t1, -1020($fp)	# fill _tmp253 to $t1 from $fp-1020
	  sub $t2, $t0, $t1	
	  sw $t2, -1024($fp)	# spill _tmp254 from $t2 to $fp-1024
	# _tmp255 = _tmp254 < _tmp249
	  lw $t0, -1024($fp)	# fill _tmp254 to $t0 from $fp-1024
	  lw $t1, -1004($fp)	# fill _tmp249 to $t1 from $fp-1004
	  slt $t2, $t0, $t1	
	  sw $t2, -1028($fp)	# spill _tmp255 from $t2 to $fp-1028
	# _tmp256 = _tmp252 || _tmp255
	  lw $t0, -1016($fp)	# fill _tmp252 to $t0 from $fp-1016
	  lw $t1, -1028($fp)	# fill _tmp255 to $t1 from $fp-1028
	  or $t2, $t0, $t1	
	  sw $t2, -1032($fp)	# spill _tmp256 from $t2 to $fp-1032
	# IfZ _tmp256 Goto arrayAcc_68
	  lw $t0, -1032($fp)	# fill _tmp256 to $t0 from $fp-1032
	  beqz $t0, arrayAcc_68	# branch if _tmp256 is zero 
	# _tmp257 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string46: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string46	# load label
	  sw $t2, -1036($fp)	# spill _tmp257 from $t2 to $fp-1036
	# PushParam _tmp257
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -1036($fp)	# fill _tmp257 to $t0 from $fp-1036
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_68:
	# _tmp258 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -1040($fp)	# spill _tmp258 from $t2 to $fp-1040
	# _tmp259 = _tmp249 * _tmp258
	  lw $t0, -1004($fp)	# fill _tmp249 to $t0 from $fp-1004
	  lw $t1, -1040($fp)	# fill _tmp258 to $t1 from $fp-1040
	  mul $t2, $t0, $t1	
	  sw $t2, -1044($fp)	# spill _tmp259 from $t2 to $fp-1044
	# _tmp260 = _tmp248 + _tmp259
	  lw $t0, -1000($fp)	# fill _tmp248 to $t0 from $fp-1000
	  lw $t1, -1044($fp)	# fill _tmp259 to $t1 from $fp-1044
	  add $t2, $t0, $t1	
	  sw $t2, -1048($fp)	# spill _tmp260 from $t2 to $fp-1048
	# _tmp261 = _tmp260 + _tmp258
	  lw $t0, -1048($fp)	# fill _tmp260 to $t0 from $fp-1048
	  lw $t1, -1040($fp)	# fill _tmp258 to $t1 from $fp-1040
	  add $t2, $t0, $t1	
	  sw $t2, -1052($fp)	# spill _tmp261 from $t2 to $fp-1052
	# _tmp262 = *(_tmp261)
	  lw $t0, -1052($fp)	# fill _tmp261 to $t0 from $fp-1052
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -1056($fp)	# spill _tmp262 from $t2 to $fp-1056
	# _tmp263 = *(_tmp262)
	  lw $t0, -1056($fp)	# fill _tmp262 to $t0 from $fp-1056
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -1060($fp)	# spill _tmp263 from $t2 to $fp-1060
	# _tmp264 = *(_tmp263 + 20)
	  lw $t0, -1060($fp)	# fill _tmp263 to $t0 from $fp-1060
	  lw $t2, 20($t0) 	# load with offset
	  sw $t2, -1064($fp)	# spill _tmp264 from $t2 to $fp-1064
	# PushParam mark
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -8($fp)	# fill mark to $t0 from $fp-8
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam _tmp262
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -1056($fp)	# fill _tmp262 to $t0 from $fp-1056
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp265 = ACall _tmp264
	  lw $t0, -1064($fp)	# fill _tmp264 to $t0 from $fp-1064
	  jalr $t0            	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -1068($fp)	# spill _tmp265 from $t2 to $fp-1068
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# _tmp266 = _tmp233 && _tmp265
	  lw $t0, -940($fp)	# fill _tmp233 to $t0 from $fp-940
	  lw $t1, -1068($fp)	# fill _tmp265 to $t1 from $fp-1068
	  and $t2, $t0, $t1	
	  sw $t2, -1072($fp)	# spill _tmp266 from $t2 to $fp-1072
	# _tmp267 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -1076($fp)	# spill _tmp267 from $t2 to $fp-1076
	# _tmp268 = 2
	  li $t2, 2		# load constant value 2 into $t2
	  sw $t2, -1080($fp)	# spill _tmp268 from $t2 to $fp-1080
	# _tmp269 = *(_tmp267)
	  lw $t0, -1076($fp)	# fill _tmp267 to $t0 from $fp-1076
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -1084($fp)	# spill _tmp269 from $t2 to $fp-1084
	# _tmp270 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -1088($fp)	# spill _tmp270 from $t2 to $fp-1088
	# _tmp271 = _tmp268 < _tmp270
	  lw $t0, -1080($fp)	# fill _tmp268 to $t0 from $fp-1080
	  lw $t1, -1088($fp)	# fill _tmp270 to $t1 from $fp-1088
	  slt $t2, $t0, $t1	
	  sw $t2, -1092($fp)	# spill _tmp271 from $t2 to $fp-1092
	# _tmp272 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -1096($fp)	# spill _tmp272 from $t2 to $fp-1096
	# _tmp273 = _tmp269 - _tmp272
	  lw $t0, -1084($fp)	# fill _tmp269 to $t0 from $fp-1084
	  lw $t1, -1096($fp)	# fill _tmp272 to $t1 from $fp-1096
	  sub $t2, $t0, $t1	
	  sw $t2, -1100($fp)	# spill _tmp273 from $t2 to $fp-1100
	# _tmp274 = _tmp273 < _tmp268
	  lw $t0, -1100($fp)	# fill _tmp273 to $t0 from $fp-1100
	  lw $t1, -1080($fp)	# fill _tmp268 to $t1 from $fp-1080
	  slt $t2, $t0, $t1	
	  sw $t2, -1104($fp)	# spill _tmp274 from $t2 to $fp-1104
	# _tmp275 = _tmp271 || _tmp274
	  lw $t0, -1092($fp)	# fill _tmp271 to $t0 from $fp-1092
	  lw $t1, -1104($fp)	# fill _tmp274 to $t1 from $fp-1104
	  or $t2, $t0, $t1	
	  sw $t2, -1108($fp)	# spill _tmp275 from $t2 to $fp-1108
	# IfZ _tmp275 Goto arrayAcc_69
	  lw $t0, -1108($fp)	# fill _tmp275 to $t0 from $fp-1108
	  beqz $t0, arrayAcc_69	# branch if _tmp275 is zero 
	# _tmp276 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string47: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string47	# load label
	  sw $t2, -1112($fp)	# spill _tmp276 from $t2 to $fp-1112
	# PushParam _tmp276
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -1112($fp)	# fill _tmp276 to $t0 from $fp-1112
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_69:
	# _tmp277 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -1116($fp)	# spill _tmp277 from $t2 to $fp-1116
	# _tmp278 = _tmp268 * _tmp277
	  lw $t0, -1080($fp)	# fill _tmp268 to $t0 from $fp-1080
	  lw $t1, -1116($fp)	# fill _tmp277 to $t1 from $fp-1116
	  mul $t2, $t0, $t1	
	  sw $t2, -1120($fp)	# spill _tmp278 from $t2 to $fp-1120
	# _tmp279 = _tmp267 + _tmp278
	  lw $t0, -1076($fp)	# fill _tmp267 to $t0 from $fp-1076
	  lw $t1, -1120($fp)	# fill _tmp278 to $t1 from $fp-1120
	  add $t2, $t0, $t1	
	  sw $t2, -1124($fp)	# spill _tmp279 from $t2 to $fp-1124
	# _tmp280 = _tmp279 + _tmp277
	  lw $t0, -1124($fp)	# fill _tmp279 to $t0 from $fp-1124
	  lw $t1, -1116($fp)	# fill _tmp277 to $t1 from $fp-1116
	  add $t2, $t0, $t1	
	  sw $t2, -1128($fp)	# spill _tmp280 from $t2 to $fp-1128
	# _tmp281 = *(_tmp280)
	  lw $t0, -1128($fp)	# fill _tmp280 to $t0 from $fp-1128
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -1132($fp)	# spill _tmp281 from $t2 to $fp-1132
	# _tmp282 = 2
	  li $t2, 2		# load constant value 2 into $t2
	  sw $t2, -1136($fp)	# spill _tmp282 from $t2 to $fp-1136
	# _tmp283 = *(_tmp281)
	  lw $t0, -1132($fp)	# fill _tmp281 to $t0 from $fp-1132
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -1140($fp)	# spill _tmp283 from $t2 to $fp-1140
	# _tmp284 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -1144($fp)	# spill _tmp284 from $t2 to $fp-1144
	# _tmp285 = _tmp282 < _tmp284
	  lw $t0, -1136($fp)	# fill _tmp282 to $t0 from $fp-1136
	  lw $t1, -1144($fp)	# fill _tmp284 to $t1 from $fp-1144
	  slt $t2, $t0, $t1	
	  sw $t2, -1148($fp)	# spill _tmp285 from $t2 to $fp-1148
	# _tmp286 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -1152($fp)	# spill _tmp286 from $t2 to $fp-1152
	# _tmp287 = _tmp283 - _tmp286
	  lw $t0, -1140($fp)	# fill _tmp283 to $t0 from $fp-1140
	  lw $t1, -1152($fp)	# fill _tmp286 to $t1 from $fp-1152
	  sub $t2, $t0, $t1	
	  sw $t2, -1156($fp)	# spill _tmp287 from $t2 to $fp-1156
	# _tmp288 = _tmp287 < _tmp282
	  lw $t0, -1156($fp)	# fill _tmp287 to $t0 from $fp-1156
	  lw $t1, -1136($fp)	# fill _tmp282 to $t1 from $fp-1136
	  slt $t2, $t0, $t1	
	  sw $t2, -1160($fp)	# spill _tmp288 from $t2 to $fp-1160
	# _tmp289 = _tmp285 || _tmp288
	  lw $t0, -1148($fp)	# fill _tmp285 to $t0 from $fp-1148
	  lw $t1, -1160($fp)	# fill _tmp288 to $t1 from $fp-1160
	  or $t2, $t0, $t1	
	  sw $t2, -1164($fp)	# spill _tmp289 from $t2 to $fp-1164
	# IfZ _tmp289 Goto arrayAcc_70
	  lw $t0, -1164($fp)	# fill _tmp289 to $t0 from $fp-1164
	  beqz $t0, arrayAcc_70	# branch if _tmp289 is zero 
	# _tmp290 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string48: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string48	# load label
	  sw $t2, -1168($fp)	# spill _tmp290 from $t2 to $fp-1168
	# PushParam _tmp290
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -1168($fp)	# fill _tmp290 to $t0 from $fp-1168
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_70:
	# _tmp291 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -1172($fp)	# spill _tmp291 from $t2 to $fp-1172
	# _tmp292 = _tmp282 * _tmp291
	  lw $t0, -1136($fp)	# fill _tmp282 to $t0 from $fp-1136
	  lw $t1, -1172($fp)	# fill _tmp291 to $t1 from $fp-1172
	  mul $t2, $t0, $t1	
	  sw $t2, -1176($fp)	# spill _tmp292 from $t2 to $fp-1176
	# _tmp293 = _tmp281 + _tmp292
	  lw $t0, -1132($fp)	# fill _tmp281 to $t0 from $fp-1132
	  lw $t1, -1176($fp)	# fill _tmp292 to $t1 from $fp-1176
	  add $t2, $t0, $t1	
	  sw $t2, -1180($fp)	# spill _tmp293 from $t2 to $fp-1180
	# _tmp294 = _tmp293 + _tmp291
	  lw $t0, -1180($fp)	# fill _tmp293 to $t0 from $fp-1180
	  lw $t1, -1172($fp)	# fill _tmp291 to $t1 from $fp-1172
	  add $t2, $t0, $t1	
	  sw $t2, -1184($fp)	# spill _tmp294 from $t2 to $fp-1184
	# _tmp295 = *(_tmp294)
	  lw $t0, -1184($fp)	# fill _tmp294 to $t0 from $fp-1184
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -1188($fp)	# spill _tmp295 from $t2 to $fp-1188
	# _tmp296 = *(_tmp295)
	  lw $t0, -1188($fp)	# fill _tmp295 to $t0 from $fp-1188
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -1192($fp)	# spill _tmp296 from $t2 to $fp-1192
	# _tmp297 = *(_tmp296 + 20)
	  lw $t0, -1192($fp)	# fill _tmp296 to $t0 from $fp-1192
	  lw $t2, 20($t0) 	# load with offset
	  sw $t2, -1196($fp)	# spill _tmp297 from $t2 to $fp-1196
	# PushParam mark
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -8($fp)	# fill mark to $t0 from $fp-8
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam _tmp295
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -1188($fp)	# fill _tmp295 to $t0 from $fp-1188
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp298 = ACall _tmp297
	  lw $t0, -1196($fp)	# fill _tmp297 to $t0 from $fp-1196
	  jalr $t0            	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -1200($fp)	# spill _tmp298 from $t2 to $fp-1200
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# _tmp299 = _tmp266 && _tmp298
	  lw $t0, -1072($fp)	# fill _tmp266 to $t0 from $fp-1072
	  lw $t1, -1200($fp)	# fill _tmp298 to $t1 from $fp-1200
	  and $t2, $t0, $t1	
	  sw $t2, -1204($fp)	# spill _tmp299 from $t2 to $fp-1204
	# IfZ _tmp299 Goto else_71
	  lw $t0, -1204($fp)	# fill _tmp299 to $t0 from $fp-1204
	  beqz $t0, else_71	# branch if _tmp299 is zero 
	# _tmp300 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -1208($fp)	# spill _tmp300 from $t2 to $fp-1208
	# Return _tmp300
	  lw $t2, -1208($fp)	# fill _tmp300 to $t2 from $fp-1208
	  move $v0, $t2		# assign return value into $v0
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# Goto endif_72
	  b endif_72		# unconditional branch
  else_71:
	# _tmp301 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -1212($fp)	# spill _tmp301 from $t2 to $fp-1212
	# _tmp302 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -1216($fp)	# spill _tmp302 from $t2 to $fp-1216
	# _tmp303 = *(_tmp301)
	  lw $t0, -1212($fp)	# fill _tmp301 to $t0 from $fp-1212
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -1220($fp)	# spill _tmp303 from $t2 to $fp-1220
	# _tmp304 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -1224($fp)	# spill _tmp304 from $t2 to $fp-1224
	# _tmp305 = _tmp302 < _tmp304
	  lw $t0, -1216($fp)	# fill _tmp302 to $t0 from $fp-1216
	  lw $t1, -1224($fp)	# fill _tmp304 to $t1 from $fp-1224
	  slt $t2, $t0, $t1	
	  sw $t2, -1228($fp)	# spill _tmp305 from $t2 to $fp-1228
	# _tmp306 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -1232($fp)	# spill _tmp306 from $t2 to $fp-1232
	# _tmp307 = _tmp303 - _tmp306
	  lw $t0, -1220($fp)	# fill _tmp303 to $t0 from $fp-1220
	  lw $t1, -1232($fp)	# fill _tmp306 to $t1 from $fp-1232
	  sub $t2, $t0, $t1	
	  sw $t2, -1236($fp)	# spill _tmp307 from $t2 to $fp-1236
	# _tmp308 = _tmp307 < _tmp302
	  lw $t0, -1236($fp)	# fill _tmp307 to $t0 from $fp-1236
	  lw $t1, -1216($fp)	# fill _tmp302 to $t1 from $fp-1216
	  slt $t2, $t0, $t1	
	  sw $t2, -1240($fp)	# spill _tmp308 from $t2 to $fp-1240
	# _tmp309 = _tmp305 || _tmp308
	  lw $t0, -1228($fp)	# fill _tmp305 to $t0 from $fp-1228
	  lw $t1, -1240($fp)	# fill _tmp308 to $t1 from $fp-1240
	  or $t2, $t0, $t1	
	  sw $t2, -1244($fp)	# spill _tmp309 from $t2 to $fp-1244
	# IfZ _tmp309 Goto arrayAcc_73
	  lw $t0, -1244($fp)	# fill _tmp309 to $t0 from $fp-1244
	  beqz $t0, arrayAcc_73	# branch if _tmp309 is zero 
	# _tmp310 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string49: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string49	# load label
	  sw $t2, -1248($fp)	# spill _tmp310 from $t2 to $fp-1248
	# PushParam _tmp310
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -1248($fp)	# fill _tmp310 to $t0 from $fp-1248
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_73:
	# _tmp311 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -1252($fp)	# spill _tmp311 from $t2 to $fp-1252
	# _tmp312 = _tmp302 * _tmp311
	  lw $t0, -1216($fp)	# fill _tmp302 to $t0 from $fp-1216
	  lw $t1, -1252($fp)	# fill _tmp311 to $t1 from $fp-1252
	  mul $t2, $t0, $t1	
	  sw $t2, -1256($fp)	# spill _tmp312 from $t2 to $fp-1256
	# _tmp313 = _tmp301 + _tmp312
	  lw $t0, -1212($fp)	# fill _tmp301 to $t0 from $fp-1212
	  lw $t1, -1256($fp)	# fill _tmp312 to $t1 from $fp-1256
	  add $t2, $t0, $t1	
	  sw $t2, -1260($fp)	# spill _tmp313 from $t2 to $fp-1260
	# _tmp314 = _tmp313 + _tmp311
	  lw $t0, -1260($fp)	# fill _tmp313 to $t0 from $fp-1260
	  lw $t1, -1252($fp)	# fill _tmp311 to $t1 from $fp-1252
	  add $t2, $t0, $t1	
	  sw $t2, -1264($fp)	# spill _tmp314 from $t2 to $fp-1264
	# _tmp315 = *(_tmp314)
	  lw $t0, -1264($fp)	# fill _tmp314 to $t0 from $fp-1264
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -1268($fp)	# spill _tmp315 from $t2 to $fp-1268
	# _tmp316 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -1272($fp)	# spill _tmp316 from $t2 to $fp-1272
	# _tmp317 = *(_tmp315)
	  lw $t0, -1268($fp)	# fill _tmp315 to $t0 from $fp-1268
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -1276($fp)	# spill _tmp317 from $t2 to $fp-1276
	# _tmp318 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -1280($fp)	# spill _tmp318 from $t2 to $fp-1280
	# _tmp319 = _tmp316 < _tmp318
	  lw $t0, -1272($fp)	# fill _tmp316 to $t0 from $fp-1272
	  lw $t1, -1280($fp)	# fill _tmp318 to $t1 from $fp-1280
	  slt $t2, $t0, $t1	
	  sw $t2, -1284($fp)	# spill _tmp319 from $t2 to $fp-1284
	# _tmp320 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -1288($fp)	# spill _tmp320 from $t2 to $fp-1288
	# _tmp321 = _tmp317 - _tmp320
	  lw $t0, -1276($fp)	# fill _tmp317 to $t0 from $fp-1276
	  lw $t1, -1288($fp)	# fill _tmp320 to $t1 from $fp-1288
	  sub $t2, $t0, $t1	
	  sw $t2, -1292($fp)	# spill _tmp321 from $t2 to $fp-1292
	# _tmp322 = _tmp321 < _tmp316
	  lw $t0, -1292($fp)	# fill _tmp321 to $t0 from $fp-1292
	  lw $t1, -1272($fp)	# fill _tmp316 to $t1 from $fp-1272
	  slt $t2, $t0, $t1	
	  sw $t2, -1296($fp)	# spill _tmp322 from $t2 to $fp-1296
	# _tmp323 = _tmp319 || _tmp322
	  lw $t0, -1284($fp)	# fill _tmp319 to $t0 from $fp-1284
	  lw $t1, -1296($fp)	# fill _tmp322 to $t1 from $fp-1296
	  or $t2, $t0, $t1	
	  sw $t2, -1300($fp)	# spill _tmp323 from $t2 to $fp-1300
	# IfZ _tmp323 Goto arrayAcc_74
	  lw $t0, -1300($fp)	# fill _tmp323 to $t0 from $fp-1300
	  beqz $t0, arrayAcc_74	# branch if _tmp323 is zero 
	# _tmp324 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string50: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string50	# load label
	  sw $t2, -1304($fp)	# spill _tmp324 from $t2 to $fp-1304
	# PushParam _tmp324
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -1304($fp)	# fill _tmp324 to $t0 from $fp-1304
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_74:
	# _tmp325 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -1308($fp)	# spill _tmp325 from $t2 to $fp-1308
	# _tmp326 = _tmp316 * _tmp325
	  lw $t0, -1272($fp)	# fill _tmp316 to $t0 from $fp-1272
	  lw $t1, -1308($fp)	# fill _tmp325 to $t1 from $fp-1308
	  mul $t2, $t0, $t1	
	  sw $t2, -1312($fp)	# spill _tmp326 from $t2 to $fp-1312
	# _tmp327 = _tmp315 + _tmp326
	  lw $t0, -1268($fp)	# fill _tmp315 to $t0 from $fp-1268
	  lw $t1, -1312($fp)	# fill _tmp326 to $t1 from $fp-1312
	  add $t2, $t0, $t1	
	  sw $t2, -1316($fp)	# spill _tmp327 from $t2 to $fp-1316
	# _tmp328 = _tmp327 + _tmp325
	  lw $t0, -1316($fp)	# fill _tmp327 to $t0 from $fp-1316
	  lw $t1, -1308($fp)	# fill _tmp325 to $t1 from $fp-1308
	  add $t2, $t0, $t1	
	  sw $t2, -1320($fp)	# spill _tmp328 from $t2 to $fp-1320
	# _tmp329 = *(_tmp328)
	  lw $t0, -1320($fp)	# fill _tmp328 to $t0 from $fp-1320
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -1324($fp)	# spill _tmp329 from $t2 to $fp-1324
	# _tmp330 = *(_tmp329)
	  lw $t0, -1324($fp)	# fill _tmp329 to $t0 from $fp-1324
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -1328($fp)	# spill _tmp330 from $t2 to $fp-1328
	# _tmp331 = *(_tmp330 + 20)
	  lw $t0, -1328($fp)	# fill _tmp330 to $t0 from $fp-1328
	  lw $t2, 20($t0) 	# load with offset
	  sw $t2, -1332($fp)	# spill _tmp331 from $t2 to $fp-1332
	# PushParam mark
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -8($fp)	# fill mark to $t0 from $fp-8
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam _tmp329
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -1324($fp)	# fill _tmp329 to $t0 from $fp-1324
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp332 = ACall _tmp331
	  lw $t0, -1332($fp)	# fill _tmp331 to $t0 from $fp-1332
	  jalr $t0            	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -1336($fp)	# spill _tmp332 from $t2 to $fp-1336
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# _tmp333 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -1340($fp)	# spill _tmp333 from $t2 to $fp-1340
	# _tmp334 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -1344($fp)	# spill _tmp334 from $t2 to $fp-1344
	# _tmp335 = *(_tmp333)
	  lw $t0, -1340($fp)	# fill _tmp333 to $t0 from $fp-1340
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -1348($fp)	# spill _tmp335 from $t2 to $fp-1348
	# _tmp336 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -1352($fp)	# spill _tmp336 from $t2 to $fp-1352
	# _tmp337 = _tmp334 < _tmp336
	  lw $t0, -1344($fp)	# fill _tmp334 to $t0 from $fp-1344
	  lw $t1, -1352($fp)	# fill _tmp336 to $t1 from $fp-1352
	  slt $t2, $t0, $t1	
	  sw $t2, -1356($fp)	# spill _tmp337 from $t2 to $fp-1356
	# _tmp338 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -1360($fp)	# spill _tmp338 from $t2 to $fp-1360
	# _tmp339 = _tmp335 - _tmp338
	  lw $t0, -1348($fp)	# fill _tmp335 to $t0 from $fp-1348
	  lw $t1, -1360($fp)	# fill _tmp338 to $t1 from $fp-1360
	  sub $t2, $t0, $t1	
	  sw $t2, -1364($fp)	# spill _tmp339 from $t2 to $fp-1364
	# _tmp340 = _tmp339 < _tmp334
	  lw $t0, -1364($fp)	# fill _tmp339 to $t0 from $fp-1364
	  lw $t1, -1344($fp)	# fill _tmp334 to $t1 from $fp-1344
	  slt $t2, $t0, $t1	
	  sw $t2, -1368($fp)	# spill _tmp340 from $t2 to $fp-1368
	# _tmp341 = _tmp337 || _tmp340
	  lw $t0, -1356($fp)	# fill _tmp337 to $t0 from $fp-1356
	  lw $t1, -1368($fp)	# fill _tmp340 to $t1 from $fp-1368
	  or $t2, $t0, $t1	
	  sw $t2, -1372($fp)	# spill _tmp341 from $t2 to $fp-1372
	# IfZ _tmp341 Goto arrayAcc_75
	  lw $t0, -1372($fp)	# fill _tmp341 to $t0 from $fp-1372
	  beqz $t0, arrayAcc_75	# branch if _tmp341 is zero 
	# _tmp342 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string51: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string51	# load label
	  sw $t2, -1376($fp)	# spill _tmp342 from $t2 to $fp-1376
	# PushParam _tmp342
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -1376($fp)	# fill _tmp342 to $t0 from $fp-1376
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_75:
	# _tmp343 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -1380($fp)	# spill _tmp343 from $t2 to $fp-1380
	# _tmp344 = _tmp334 * _tmp343
	  lw $t0, -1344($fp)	# fill _tmp334 to $t0 from $fp-1344
	  lw $t1, -1380($fp)	# fill _tmp343 to $t1 from $fp-1380
	  mul $t2, $t0, $t1	
	  sw $t2, -1384($fp)	# spill _tmp344 from $t2 to $fp-1384
	# _tmp345 = _tmp333 + _tmp344
	  lw $t0, -1340($fp)	# fill _tmp333 to $t0 from $fp-1340
	  lw $t1, -1384($fp)	# fill _tmp344 to $t1 from $fp-1384
	  add $t2, $t0, $t1	
	  sw $t2, -1388($fp)	# spill _tmp345 from $t2 to $fp-1388
	# _tmp346 = _tmp345 + _tmp343
	  lw $t0, -1388($fp)	# fill _tmp345 to $t0 from $fp-1388
	  lw $t1, -1380($fp)	# fill _tmp343 to $t1 from $fp-1380
	  add $t2, $t0, $t1	
	  sw $t2, -1392($fp)	# spill _tmp346 from $t2 to $fp-1392
	# _tmp347 = *(_tmp346)
	  lw $t0, -1392($fp)	# fill _tmp346 to $t0 from $fp-1392
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -1396($fp)	# spill _tmp347 from $t2 to $fp-1396
	# _tmp348 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -1400($fp)	# spill _tmp348 from $t2 to $fp-1400
	# _tmp349 = *(_tmp347)
	  lw $t0, -1396($fp)	# fill _tmp347 to $t0 from $fp-1396
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -1404($fp)	# spill _tmp349 from $t2 to $fp-1404
	# _tmp350 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -1408($fp)	# spill _tmp350 from $t2 to $fp-1408
	# _tmp351 = _tmp348 < _tmp350
	  lw $t0, -1400($fp)	# fill _tmp348 to $t0 from $fp-1400
	  lw $t1, -1408($fp)	# fill _tmp350 to $t1 from $fp-1408
	  slt $t2, $t0, $t1	
	  sw $t2, -1412($fp)	# spill _tmp351 from $t2 to $fp-1412
	# _tmp352 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -1416($fp)	# spill _tmp352 from $t2 to $fp-1416
	# _tmp353 = _tmp349 - _tmp352
	  lw $t0, -1404($fp)	# fill _tmp349 to $t0 from $fp-1404
	  lw $t1, -1416($fp)	# fill _tmp352 to $t1 from $fp-1416
	  sub $t2, $t0, $t1	
	  sw $t2, -1420($fp)	# spill _tmp353 from $t2 to $fp-1420
	# _tmp354 = _tmp353 < _tmp348
	  lw $t0, -1420($fp)	# fill _tmp353 to $t0 from $fp-1420
	  lw $t1, -1400($fp)	# fill _tmp348 to $t1 from $fp-1400
	  slt $t2, $t0, $t1	
	  sw $t2, -1424($fp)	# spill _tmp354 from $t2 to $fp-1424
	# _tmp355 = _tmp351 || _tmp354
	  lw $t0, -1412($fp)	# fill _tmp351 to $t0 from $fp-1412
	  lw $t1, -1424($fp)	# fill _tmp354 to $t1 from $fp-1424
	  or $t2, $t0, $t1	
	  sw $t2, -1428($fp)	# spill _tmp355 from $t2 to $fp-1428
	# IfZ _tmp355 Goto arrayAcc_76
	  lw $t0, -1428($fp)	# fill _tmp355 to $t0 from $fp-1428
	  beqz $t0, arrayAcc_76	# branch if _tmp355 is zero 
	# _tmp356 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string52: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string52	# load label
	  sw $t2, -1432($fp)	# spill _tmp356 from $t2 to $fp-1432
	# PushParam _tmp356
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -1432($fp)	# fill _tmp356 to $t0 from $fp-1432
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_76:
	# _tmp357 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -1436($fp)	# spill _tmp357 from $t2 to $fp-1436
	# _tmp358 = _tmp348 * _tmp357
	  lw $t0, -1400($fp)	# fill _tmp348 to $t0 from $fp-1400
	  lw $t1, -1436($fp)	# fill _tmp357 to $t1 from $fp-1436
	  mul $t2, $t0, $t1	
	  sw $t2, -1440($fp)	# spill _tmp358 from $t2 to $fp-1440
	# _tmp359 = _tmp347 + _tmp358
	  lw $t0, -1396($fp)	# fill _tmp347 to $t0 from $fp-1396
	  lw $t1, -1440($fp)	# fill _tmp358 to $t1 from $fp-1440
	  add $t2, $t0, $t1	
	  sw $t2, -1444($fp)	# spill _tmp359 from $t2 to $fp-1444
	# _tmp360 = _tmp359 + _tmp357
	  lw $t0, -1444($fp)	# fill _tmp359 to $t0 from $fp-1444
	  lw $t1, -1436($fp)	# fill _tmp357 to $t1 from $fp-1436
	  add $t2, $t0, $t1	
	  sw $t2, -1448($fp)	# spill _tmp360 from $t2 to $fp-1448
	# _tmp361 = *(_tmp360)
	  lw $t0, -1448($fp)	# fill _tmp360 to $t0 from $fp-1448
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -1452($fp)	# spill _tmp361 from $t2 to $fp-1452
	# _tmp362 = *(_tmp361)
	  lw $t0, -1452($fp)	# fill _tmp361 to $t0 from $fp-1452
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -1456($fp)	# spill _tmp362 from $t2 to $fp-1456
	# _tmp363 = *(_tmp362 + 20)
	  lw $t0, -1456($fp)	# fill _tmp362 to $t0 from $fp-1456
	  lw $t2, 20($t0) 	# load with offset
	  sw $t2, -1460($fp)	# spill _tmp363 from $t2 to $fp-1460
	# PushParam mark
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -8($fp)	# fill mark to $t0 from $fp-8
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam _tmp361
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -1452($fp)	# fill _tmp361 to $t0 from $fp-1452
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp364 = ACall _tmp363
	  lw $t0, -1460($fp)	# fill _tmp363 to $t0 from $fp-1460
	  jalr $t0            	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -1464($fp)	# spill _tmp364 from $t2 to $fp-1464
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# _tmp365 = _tmp332 && _tmp364
	  lw $t0, -1336($fp)	# fill _tmp332 to $t0 from $fp-1336
	  lw $t1, -1464($fp)	# fill _tmp364 to $t1 from $fp-1464
	  and $t2, $t0, $t1	
	  sw $t2, -1468($fp)	# spill _tmp365 from $t2 to $fp-1468
	# _tmp366 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -1472($fp)	# spill _tmp366 from $t2 to $fp-1472
	# _tmp367 = 2
	  li $t2, 2		# load constant value 2 into $t2
	  sw $t2, -1476($fp)	# spill _tmp367 from $t2 to $fp-1476
	# _tmp368 = *(_tmp366)
	  lw $t0, -1472($fp)	# fill _tmp366 to $t0 from $fp-1472
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -1480($fp)	# spill _tmp368 from $t2 to $fp-1480
	# _tmp369 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -1484($fp)	# spill _tmp369 from $t2 to $fp-1484
	# _tmp370 = _tmp367 < _tmp369
	  lw $t0, -1476($fp)	# fill _tmp367 to $t0 from $fp-1476
	  lw $t1, -1484($fp)	# fill _tmp369 to $t1 from $fp-1484
	  slt $t2, $t0, $t1	
	  sw $t2, -1488($fp)	# spill _tmp370 from $t2 to $fp-1488
	# _tmp371 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -1492($fp)	# spill _tmp371 from $t2 to $fp-1492
	# _tmp372 = _tmp368 - _tmp371
	  lw $t0, -1480($fp)	# fill _tmp368 to $t0 from $fp-1480
	  lw $t1, -1492($fp)	# fill _tmp371 to $t1 from $fp-1492
	  sub $t2, $t0, $t1	
	  sw $t2, -1496($fp)	# spill _tmp372 from $t2 to $fp-1496
	# _tmp373 = _tmp372 < _tmp367
	  lw $t0, -1496($fp)	# fill _tmp372 to $t0 from $fp-1496
	  lw $t1, -1476($fp)	# fill _tmp367 to $t1 from $fp-1476
	  slt $t2, $t0, $t1	
	  sw $t2, -1500($fp)	# spill _tmp373 from $t2 to $fp-1500
	# _tmp374 = _tmp370 || _tmp373
	  lw $t0, -1488($fp)	# fill _tmp370 to $t0 from $fp-1488
	  lw $t1, -1500($fp)	# fill _tmp373 to $t1 from $fp-1500
	  or $t2, $t0, $t1	
	  sw $t2, -1504($fp)	# spill _tmp374 from $t2 to $fp-1504
	# IfZ _tmp374 Goto arrayAcc_77
	  lw $t0, -1504($fp)	# fill _tmp374 to $t0 from $fp-1504
	  beqz $t0, arrayAcc_77	# branch if _tmp374 is zero 
	# _tmp375 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string53: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string53	# load label
	  sw $t2, -1508($fp)	# spill _tmp375 from $t2 to $fp-1508
	# PushParam _tmp375
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -1508($fp)	# fill _tmp375 to $t0 from $fp-1508
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_77:
	# _tmp376 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -1512($fp)	# spill _tmp376 from $t2 to $fp-1512
	# _tmp377 = _tmp367 * _tmp376
	  lw $t0, -1476($fp)	# fill _tmp367 to $t0 from $fp-1476
	  lw $t1, -1512($fp)	# fill _tmp376 to $t1 from $fp-1512
	  mul $t2, $t0, $t1	
	  sw $t2, -1516($fp)	# spill _tmp377 from $t2 to $fp-1516
	# _tmp378 = _tmp366 + _tmp377
	  lw $t0, -1472($fp)	# fill _tmp366 to $t0 from $fp-1472
	  lw $t1, -1516($fp)	# fill _tmp377 to $t1 from $fp-1516
	  add $t2, $t0, $t1	
	  sw $t2, -1520($fp)	# spill _tmp378 from $t2 to $fp-1520
	# _tmp379 = _tmp378 + _tmp376
	  lw $t0, -1520($fp)	# fill _tmp378 to $t0 from $fp-1520
	  lw $t1, -1512($fp)	# fill _tmp376 to $t1 from $fp-1512
	  add $t2, $t0, $t1	
	  sw $t2, -1524($fp)	# spill _tmp379 from $t2 to $fp-1524
	# _tmp380 = *(_tmp379)
	  lw $t0, -1524($fp)	# fill _tmp379 to $t0 from $fp-1524
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -1528($fp)	# spill _tmp380 from $t2 to $fp-1528
	# _tmp381 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -1532($fp)	# spill _tmp381 from $t2 to $fp-1532
	# _tmp382 = *(_tmp380)
	  lw $t0, -1528($fp)	# fill _tmp380 to $t0 from $fp-1528
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -1536($fp)	# spill _tmp382 from $t2 to $fp-1536
	# _tmp383 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -1540($fp)	# spill _tmp383 from $t2 to $fp-1540
	# _tmp384 = _tmp381 < _tmp383
	  lw $t0, -1532($fp)	# fill _tmp381 to $t0 from $fp-1532
	  lw $t1, -1540($fp)	# fill _tmp383 to $t1 from $fp-1540
	  slt $t2, $t0, $t1	
	  sw $t2, -1544($fp)	# spill _tmp384 from $t2 to $fp-1544
	# _tmp385 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -1548($fp)	# spill _tmp385 from $t2 to $fp-1548
	# _tmp386 = _tmp382 - _tmp385
	  lw $t0, -1536($fp)	# fill _tmp382 to $t0 from $fp-1536
	  lw $t1, -1548($fp)	# fill _tmp385 to $t1 from $fp-1548
	  sub $t2, $t0, $t1	
	  sw $t2, -1552($fp)	# spill _tmp386 from $t2 to $fp-1552
	# _tmp387 = _tmp386 < _tmp381
	  lw $t0, -1552($fp)	# fill _tmp386 to $t0 from $fp-1552
	  lw $t1, -1532($fp)	# fill _tmp381 to $t1 from $fp-1532
	  slt $t2, $t0, $t1	
	  sw $t2, -1556($fp)	# spill _tmp387 from $t2 to $fp-1556
	# _tmp388 = _tmp384 || _tmp387
	  lw $t0, -1544($fp)	# fill _tmp384 to $t0 from $fp-1544
	  lw $t1, -1556($fp)	# fill _tmp387 to $t1 from $fp-1556
	  or $t2, $t0, $t1	
	  sw $t2, -1560($fp)	# spill _tmp388 from $t2 to $fp-1560
	# IfZ _tmp388 Goto arrayAcc_78
	  lw $t0, -1560($fp)	# fill _tmp388 to $t0 from $fp-1560
	  beqz $t0, arrayAcc_78	# branch if _tmp388 is zero 
	# _tmp389 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string54: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string54	# load label
	  sw $t2, -1564($fp)	# spill _tmp389 from $t2 to $fp-1564
	# PushParam _tmp389
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -1564($fp)	# fill _tmp389 to $t0 from $fp-1564
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_78:
	# _tmp390 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -1568($fp)	# spill _tmp390 from $t2 to $fp-1568
	# _tmp391 = _tmp381 * _tmp390
	  lw $t0, -1532($fp)	# fill _tmp381 to $t0 from $fp-1532
	  lw $t1, -1568($fp)	# fill _tmp390 to $t1 from $fp-1568
	  mul $t2, $t0, $t1	
	  sw $t2, -1572($fp)	# spill _tmp391 from $t2 to $fp-1572
	# _tmp392 = _tmp380 + _tmp391
	  lw $t0, -1528($fp)	# fill _tmp380 to $t0 from $fp-1528
	  lw $t1, -1572($fp)	# fill _tmp391 to $t1 from $fp-1572
	  add $t2, $t0, $t1	
	  sw $t2, -1576($fp)	# spill _tmp392 from $t2 to $fp-1576
	# _tmp393 = _tmp392 + _tmp390
	  lw $t0, -1576($fp)	# fill _tmp392 to $t0 from $fp-1576
	  lw $t1, -1568($fp)	# fill _tmp390 to $t1 from $fp-1568
	  add $t2, $t0, $t1	
	  sw $t2, -1580($fp)	# spill _tmp393 from $t2 to $fp-1580
	# _tmp394 = *(_tmp393)
	  lw $t0, -1580($fp)	# fill _tmp393 to $t0 from $fp-1580
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -1584($fp)	# spill _tmp394 from $t2 to $fp-1584
	# _tmp395 = *(_tmp394)
	  lw $t0, -1584($fp)	# fill _tmp394 to $t0 from $fp-1584
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -1588($fp)	# spill _tmp395 from $t2 to $fp-1588
	# _tmp396 = *(_tmp395 + 20)
	  lw $t0, -1588($fp)	# fill _tmp395 to $t0 from $fp-1588
	  lw $t2, 20($t0) 	# load with offset
	  sw $t2, -1592($fp)	# spill _tmp396 from $t2 to $fp-1592
	# PushParam mark
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -8($fp)	# fill mark to $t0 from $fp-8
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam _tmp394
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -1584($fp)	# fill _tmp394 to $t0 from $fp-1584
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp397 = ACall _tmp396
	  lw $t0, -1592($fp)	# fill _tmp396 to $t0 from $fp-1592
	  jalr $t0            	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -1596($fp)	# spill _tmp397 from $t2 to $fp-1596
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# _tmp398 = _tmp365 && _tmp397
	  lw $t0, -1468($fp)	# fill _tmp365 to $t0 from $fp-1468
	  lw $t1, -1596($fp)	# fill _tmp397 to $t1 from $fp-1596
	  and $t2, $t0, $t1	
	  sw $t2, -1600($fp)	# spill _tmp398 from $t2 to $fp-1600
	# IfZ _tmp398 Goto else_79
	  lw $t0, -1600($fp)	# fill _tmp398 to $t0 from $fp-1600
	  beqz $t0, else_79	# branch if _tmp398 is zero 
	# _tmp399 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -1604($fp)	# spill _tmp399 from $t2 to $fp-1604
	# Return _tmp399
	  lw $t2, -1604($fp)	# fill _tmp399 to $t2 from $fp-1604
	  move $v0, $t2		# assign return value into $v0
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# Goto endif_80
	  b endif_80		# unconditional branch
  else_79:
  endif_80:
  endif_72:
  endif_64:
  endif_56:
	# _tmp400 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -1608($fp)	# spill _tmp400 from $t2 to $fp-1608
	# _tmp401 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -1612($fp)	# spill _tmp401 from $t2 to $fp-1612
	# _tmp402 = *(_tmp400)
	  lw $t0, -1608($fp)	# fill _tmp400 to $t0 from $fp-1608
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -1616($fp)	# spill _tmp402 from $t2 to $fp-1616
	# _tmp403 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -1620($fp)	# spill _tmp403 from $t2 to $fp-1620
	# _tmp404 = _tmp401 < _tmp403
	  lw $t0, -1612($fp)	# fill _tmp401 to $t0 from $fp-1612
	  lw $t1, -1620($fp)	# fill _tmp403 to $t1 from $fp-1620
	  slt $t2, $t0, $t1	
	  sw $t2, -1624($fp)	# spill _tmp404 from $t2 to $fp-1624
	# _tmp405 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -1628($fp)	# spill _tmp405 from $t2 to $fp-1628
	# _tmp406 = _tmp402 - _tmp405
	  lw $t0, -1616($fp)	# fill _tmp402 to $t0 from $fp-1616
	  lw $t1, -1628($fp)	# fill _tmp405 to $t1 from $fp-1628
	  sub $t2, $t0, $t1	
	  sw $t2, -1632($fp)	# spill _tmp406 from $t2 to $fp-1632
	# _tmp407 = _tmp406 < _tmp401
	  lw $t0, -1632($fp)	# fill _tmp406 to $t0 from $fp-1632
	  lw $t1, -1612($fp)	# fill _tmp401 to $t1 from $fp-1612
	  slt $t2, $t0, $t1	
	  sw $t2, -1636($fp)	# spill _tmp407 from $t2 to $fp-1636
	# _tmp408 = _tmp404 || _tmp407
	  lw $t0, -1624($fp)	# fill _tmp404 to $t0 from $fp-1624
	  lw $t1, -1636($fp)	# fill _tmp407 to $t1 from $fp-1636
	  or $t2, $t0, $t1	
	  sw $t2, -1640($fp)	# spill _tmp408 from $t2 to $fp-1640
	# IfZ _tmp408 Goto arrayAcc_81
	  lw $t0, -1640($fp)	# fill _tmp408 to $t0 from $fp-1640
	  beqz $t0, arrayAcc_81	# branch if _tmp408 is zero 
	# _tmp409 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string55: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string55	# load label
	  sw $t2, -1644($fp)	# spill _tmp409 from $t2 to $fp-1644
	# PushParam _tmp409
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -1644($fp)	# fill _tmp409 to $t0 from $fp-1644
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_81:
	# _tmp410 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -1648($fp)	# spill _tmp410 from $t2 to $fp-1648
	# _tmp411 = _tmp401 * _tmp410
	  lw $t0, -1612($fp)	# fill _tmp401 to $t0 from $fp-1612
	  lw $t1, -1648($fp)	# fill _tmp410 to $t1 from $fp-1648
	  mul $t2, $t0, $t1	
	  sw $t2, -1652($fp)	# spill _tmp411 from $t2 to $fp-1652
	# _tmp412 = _tmp400 + _tmp411
	  lw $t0, -1608($fp)	# fill _tmp400 to $t0 from $fp-1608
	  lw $t1, -1652($fp)	# fill _tmp411 to $t1 from $fp-1652
	  add $t2, $t0, $t1	
	  sw $t2, -1656($fp)	# spill _tmp412 from $t2 to $fp-1656
	# _tmp413 = _tmp412 + _tmp410
	  lw $t0, -1656($fp)	# fill _tmp412 to $t0 from $fp-1656
	  lw $t1, -1648($fp)	# fill _tmp410 to $t1 from $fp-1648
	  add $t2, $t0, $t1	
	  sw $t2, -1660($fp)	# spill _tmp413 from $t2 to $fp-1660
	# _tmp414 = *(_tmp413)
	  lw $t0, -1660($fp)	# fill _tmp413 to $t0 from $fp-1660
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -1664($fp)	# spill _tmp414 from $t2 to $fp-1664
	# _tmp415 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -1668($fp)	# spill _tmp415 from $t2 to $fp-1668
	# _tmp416 = *(_tmp414)
	  lw $t0, -1664($fp)	# fill _tmp414 to $t0 from $fp-1664
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -1672($fp)	# spill _tmp416 from $t2 to $fp-1672
	# _tmp417 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -1676($fp)	# spill _tmp417 from $t2 to $fp-1676
	# _tmp418 = _tmp415 < _tmp417
	  lw $t0, -1668($fp)	# fill _tmp415 to $t0 from $fp-1668
	  lw $t1, -1676($fp)	# fill _tmp417 to $t1 from $fp-1676
	  slt $t2, $t0, $t1	
	  sw $t2, -1680($fp)	# spill _tmp418 from $t2 to $fp-1680
	# _tmp419 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -1684($fp)	# spill _tmp419 from $t2 to $fp-1684
	# _tmp420 = _tmp416 - _tmp419
	  lw $t0, -1672($fp)	# fill _tmp416 to $t0 from $fp-1672
	  lw $t1, -1684($fp)	# fill _tmp419 to $t1 from $fp-1684
	  sub $t2, $t0, $t1	
	  sw $t2, -1688($fp)	# spill _tmp420 from $t2 to $fp-1688
	# _tmp421 = _tmp420 < _tmp415
	  lw $t0, -1688($fp)	# fill _tmp420 to $t0 from $fp-1688
	  lw $t1, -1668($fp)	# fill _tmp415 to $t1 from $fp-1668
	  slt $t2, $t0, $t1	
	  sw $t2, -1692($fp)	# spill _tmp421 from $t2 to $fp-1692
	# _tmp422 = _tmp418 || _tmp421
	  lw $t0, -1680($fp)	# fill _tmp418 to $t0 from $fp-1680
	  lw $t1, -1692($fp)	# fill _tmp421 to $t1 from $fp-1692
	  or $t2, $t0, $t1	
	  sw $t2, -1696($fp)	# spill _tmp422 from $t2 to $fp-1696
	# IfZ _tmp422 Goto arrayAcc_82
	  lw $t0, -1696($fp)	# fill _tmp422 to $t0 from $fp-1696
	  beqz $t0, arrayAcc_82	# branch if _tmp422 is zero 
	# _tmp423 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string56: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string56	# load label
	  sw $t2, -1700($fp)	# spill _tmp423 from $t2 to $fp-1700
	# PushParam _tmp423
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -1700($fp)	# fill _tmp423 to $t0 from $fp-1700
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_82:
	# _tmp424 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -1704($fp)	# spill _tmp424 from $t2 to $fp-1704
	# _tmp425 = _tmp415 * _tmp424
	  lw $t0, -1668($fp)	# fill _tmp415 to $t0 from $fp-1668
	  lw $t1, -1704($fp)	# fill _tmp424 to $t1 from $fp-1704
	  mul $t2, $t0, $t1	
	  sw $t2, -1708($fp)	# spill _tmp425 from $t2 to $fp-1708
	# _tmp426 = _tmp414 + _tmp425
	  lw $t0, -1664($fp)	# fill _tmp414 to $t0 from $fp-1664
	  lw $t1, -1708($fp)	# fill _tmp425 to $t1 from $fp-1708
	  add $t2, $t0, $t1	
	  sw $t2, -1712($fp)	# spill _tmp426 from $t2 to $fp-1712
	# _tmp427 = _tmp426 + _tmp424
	  lw $t0, -1712($fp)	# fill _tmp426 to $t0 from $fp-1712
	  lw $t1, -1704($fp)	# fill _tmp424 to $t1 from $fp-1704
	  add $t2, $t0, $t1	
	  sw $t2, -1716($fp)	# spill _tmp427 from $t2 to $fp-1716
	# _tmp428 = *(_tmp427)
	  lw $t0, -1716($fp)	# fill _tmp427 to $t0 from $fp-1716
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -1720($fp)	# spill _tmp428 from $t2 to $fp-1720
	# _tmp429 = *(_tmp428)
	  lw $t0, -1720($fp)	# fill _tmp428 to $t0 from $fp-1720
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -1724($fp)	# spill _tmp429 from $t2 to $fp-1724
	# _tmp430 = *(_tmp429 + 20)
	  lw $t0, -1724($fp)	# fill _tmp429 to $t0 from $fp-1724
	  lw $t2, 20($t0) 	# load with offset
	  sw $t2, -1728($fp)	# spill _tmp430 from $t2 to $fp-1728
	# PushParam mark
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -8($fp)	# fill mark to $t0 from $fp-8
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam _tmp428
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -1720($fp)	# fill _tmp428 to $t0 from $fp-1720
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp431 = ACall _tmp430
	  lw $t0, -1728($fp)	# fill _tmp430 to $t0 from $fp-1728
	  jalr $t0            	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -1732($fp)	# spill _tmp431 from $t2 to $fp-1732
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# _tmp432 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -1736($fp)	# spill _tmp432 from $t2 to $fp-1736
	# _tmp433 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -1740($fp)	# spill _tmp433 from $t2 to $fp-1740
	# _tmp434 = *(_tmp432)
	  lw $t0, -1736($fp)	# fill _tmp432 to $t0 from $fp-1736
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -1744($fp)	# spill _tmp434 from $t2 to $fp-1744
	# _tmp435 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -1748($fp)	# spill _tmp435 from $t2 to $fp-1748
	# _tmp436 = _tmp433 < _tmp435
	  lw $t0, -1740($fp)	# fill _tmp433 to $t0 from $fp-1740
	  lw $t1, -1748($fp)	# fill _tmp435 to $t1 from $fp-1748
	  slt $t2, $t0, $t1	
	  sw $t2, -1752($fp)	# spill _tmp436 from $t2 to $fp-1752
	# _tmp437 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -1756($fp)	# spill _tmp437 from $t2 to $fp-1756
	# _tmp438 = _tmp434 - _tmp437
	  lw $t0, -1744($fp)	# fill _tmp434 to $t0 from $fp-1744
	  lw $t1, -1756($fp)	# fill _tmp437 to $t1 from $fp-1756
	  sub $t2, $t0, $t1	
	  sw $t2, -1760($fp)	# spill _tmp438 from $t2 to $fp-1760
	# _tmp439 = _tmp438 < _tmp433
	  lw $t0, -1760($fp)	# fill _tmp438 to $t0 from $fp-1760
	  lw $t1, -1740($fp)	# fill _tmp433 to $t1 from $fp-1740
	  slt $t2, $t0, $t1	
	  sw $t2, -1764($fp)	# spill _tmp439 from $t2 to $fp-1764
	# _tmp440 = _tmp436 || _tmp439
	  lw $t0, -1752($fp)	# fill _tmp436 to $t0 from $fp-1752
	  lw $t1, -1764($fp)	# fill _tmp439 to $t1 from $fp-1764
	  or $t2, $t0, $t1	
	  sw $t2, -1768($fp)	# spill _tmp440 from $t2 to $fp-1768
	# IfZ _tmp440 Goto arrayAcc_83
	  lw $t0, -1768($fp)	# fill _tmp440 to $t0 from $fp-1768
	  beqz $t0, arrayAcc_83	# branch if _tmp440 is zero 
	# _tmp441 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string57: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string57	# load label
	  sw $t2, -1772($fp)	# spill _tmp441 from $t2 to $fp-1772
	# PushParam _tmp441
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -1772($fp)	# fill _tmp441 to $t0 from $fp-1772
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_83:
	# _tmp442 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -1776($fp)	# spill _tmp442 from $t2 to $fp-1776
	# _tmp443 = _tmp433 * _tmp442
	  lw $t0, -1740($fp)	# fill _tmp433 to $t0 from $fp-1740
	  lw $t1, -1776($fp)	# fill _tmp442 to $t1 from $fp-1776
	  mul $t2, $t0, $t1	
	  sw $t2, -1780($fp)	# spill _tmp443 from $t2 to $fp-1780
	# _tmp444 = _tmp432 + _tmp443
	  lw $t0, -1736($fp)	# fill _tmp432 to $t0 from $fp-1736
	  lw $t1, -1780($fp)	# fill _tmp443 to $t1 from $fp-1780
	  add $t2, $t0, $t1	
	  sw $t2, -1784($fp)	# spill _tmp444 from $t2 to $fp-1784
	# _tmp445 = _tmp444 + _tmp442
	  lw $t0, -1784($fp)	# fill _tmp444 to $t0 from $fp-1784
	  lw $t1, -1776($fp)	# fill _tmp442 to $t1 from $fp-1776
	  add $t2, $t0, $t1	
	  sw $t2, -1788($fp)	# spill _tmp445 from $t2 to $fp-1788
	# _tmp446 = *(_tmp445)
	  lw $t0, -1788($fp)	# fill _tmp445 to $t0 from $fp-1788
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -1792($fp)	# spill _tmp446 from $t2 to $fp-1792
	# _tmp447 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -1796($fp)	# spill _tmp447 from $t2 to $fp-1796
	# _tmp448 = *(_tmp446)
	  lw $t0, -1792($fp)	# fill _tmp446 to $t0 from $fp-1792
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -1800($fp)	# spill _tmp448 from $t2 to $fp-1800
	# _tmp449 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -1804($fp)	# spill _tmp449 from $t2 to $fp-1804
	# _tmp450 = _tmp447 < _tmp449
	  lw $t0, -1796($fp)	# fill _tmp447 to $t0 from $fp-1796
	  lw $t1, -1804($fp)	# fill _tmp449 to $t1 from $fp-1804
	  slt $t2, $t0, $t1	
	  sw $t2, -1808($fp)	# spill _tmp450 from $t2 to $fp-1808
	# _tmp451 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -1812($fp)	# spill _tmp451 from $t2 to $fp-1812
	# _tmp452 = _tmp448 - _tmp451
	  lw $t0, -1800($fp)	# fill _tmp448 to $t0 from $fp-1800
	  lw $t1, -1812($fp)	# fill _tmp451 to $t1 from $fp-1812
	  sub $t2, $t0, $t1	
	  sw $t2, -1816($fp)	# spill _tmp452 from $t2 to $fp-1816
	# _tmp453 = _tmp452 < _tmp447
	  lw $t0, -1816($fp)	# fill _tmp452 to $t0 from $fp-1816
	  lw $t1, -1796($fp)	# fill _tmp447 to $t1 from $fp-1796
	  slt $t2, $t0, $t1	
	  sw $t2, -1820($fp)	# spill _tmp453 from $t2 to $fp-1820
	# _tmp454 = _tmp450 || _tmp453
	  lw $t0, -1808($fp)	# fill _tmp450 to $t0 from $fp-1808
	  lw $t1, -1820($fp)	# fill _tmp453 to $t1 from $fp-1820
	  or $t2, $t0, $t1	
	  sw $t2, -1824($fp)	# spill _tmp454 from $t2 to $fp-1824
	# IfZ _tmp454 Goto arrayAcc_84
	  lw $t0, -1824($fp)	# fill _tmp454 to $t0 from $fp-1824
	  beqz $t0, arrayAcc_84	# branch if _tmp454 is zero 
	# _tmp455 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string58: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string58	# load label
	  sw $t2, -1828($fp)	# spill _tmp455 from $t2 to $fp-1828
	# PushParam _tmp455
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -1828($fp)	# fill _tmp455 to $t0 from $fp-1828
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_84:
	# _tmp456 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -1832($fp)	# spill _tmp456 from $t2 to $fp-1832
	# _tmp457 = _tmp447 * _tmp456
	  lw $t0, -1796($fp)	# fill _tmp447 to $t0 from $fp-1796
	  lw $t1, -1832($fp)	# fill _tmp456 to $t1 from $fp-1832
	  mul $t2, $t0, $t1	
	  sw $t2, -1836($fp)	# spill _tmp457 from $t2 to $fp-1836
	# _tmp458 = _tmp446 + _tmp457
	  lw $t0, -1792($fp)	# fill _tmp446 to $t0 from $fp-1792
	  lw $t1, -1836($fp)	# fill _tmp457 to $t1 from $fp-1836
	  add $t2, $t0, $t1	
	  sw $t2, -1840($fp)	# spill _tmp458 from $t2 to $fp-1840
	# _tmp459 = _tmp458 + _tmp456
	  lw $t0, -1840($fp)	# fill _tmp458 to $t0 from $fp-1840
	  lw $t1, -1832($fp)	# fill _tmp456 to $t1 from $fp-1832
	  add $t2, $t0, $t1	
	  sw $t2, -1844($fp)	# spill _tmp459 from $t2 to $fp-1844
	# _tmp460 = *(_tmp459)
	  lw $t0, -1844($fp)	# fill _tmp459 to $t0 from $fp-1844
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -1848($fp)	# spill _tmp460 from $t2 to $fp-1848
	# _tmp461 = *(_tmp460)
	  lw $t0, -1848($fp)	# fill _tmp460 to $t0 from $fp-1848
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -1852($fp)	# spill _tmp461 from $t2 to $fp-1852
	# _tmp462 = *(_tmp461 + 20)
	  lw $t0, -1852($fp)	# fill _tmp461 to $t0 from $fp-1852
	  lw $t2, 20($t0) 	# load with offset
	  sw $t2, -1856($fp)	# spill _tmp462 from $t2 to $fp-1856
	# PushParam mark
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -8($fp)	# fill mark to $t0 from $fp-8
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam _tmp460
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -1848($fp)	# fill _tmp460 to $t0 from $fp-1848
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp463 = ACall _tmp462
	  lw $t0, -1856($fp)	# fill _tmp462 to $t0 from $fp-1856
	  jalr $t0            	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -1860($fp)	# spill _tmp463 from $t2 to $fp-1860
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# _tmp464 = _tmp431 && _tmp463
	  lw $t0, -1732($fp)	# fill _tmp431 to $t0 from $fp-1732
	  lw $t1, -1860($fp)	# fill _tmp463 to $t1 from $fp-1860
	  and $t2, $t0, $t1	
	  sw $t2, -1864($fp)	# spill _tmp464 from $t2 to $fp-1864
	# _tmp465 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -1868($fp)	# spill _tmp465 from $t2 to $fp-1868
	# _tmp466 = 2
	  li $t2, 2		# load constant value 2 into $t2
	  sw $t2, -1872($fp)	# spill _tmp466 from $t2 to $fp-1872
	# _tmp467 = *(_tmp465)
	  lw $t0, -1868($fp)	# fill _tmp465 to $t0 from $fp-1868
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -1876($fp)	# spill _tmp467 from $t2 to $fp-1876
	# _tmp468 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -1880($fp)	# spill _tmp468 from $t2 to $fp-1880
	# _tmp469 = _tmp466 < _tmp468
	  lw $t0, -1872($fp)	# fill _tmp466 to $t0 from $fp-1872
	  lw $t1, -1880($fp)	# fill _tmp468 to $t1 from $fp-1880
	  slt $t2, $t0, $t1	
	  sw $t2, -1884($fp)	# spill _tmp469 from $t2 to $fp-1884
	# _tmp470 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -1888($fp)	# spill _tmp470 from $t2 to $fp-1888
	# _tmp471 = _tmp467 - _tmp470
	  lw $t0, -1876($fp)	# fill _tmp467 to $t0 from $fp-1876
	  lw $t1, -1888($fp)	# fill _tmp470 to $t1 from $fp-1888
	  sub $t2, $t0, $t1	
	  sw $t2, -1892($fp)	# spill _tmp471 from $t2 to $fp-1892
	# _tmp472 = _tmp471 < _tmp466
	  lw $t0, -1892($fp)	# fill _tmp471 to $t0 from $fp-1892
	  lw $t1, -1872($fp)	# fill _tmp466 to $t1 from $fp-1872
	  slt $t2, $t0, $t1	
	  sw $t2, -1896($fp)	# spill _tmp472 from $t2 to $fp-1896
	# _tmp473 = _tmp469 || _tmp472
	  lw $t0, -1884($fp)	# fill _tmp469 to $t0 from $fp-1884
	  lw $t1, -1896($fp)	# fill _tmp472 to $t1 from $fp-1896
	  or $t2, $t0, $t1	
	  sw $t2, -1900($fp)	# spill _tmp473 from $t2 to $fp-1900
	# IfZ _tmp473 Goto arrayAcc_85
	  lw $t0, -1900($fp)	# fill _tmp473 to $t0 from $fp-1900
	  beqz $t0, arrayAcc_85	# branch if _tmp473 is zero 
	# _tmp474 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string59: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string59	# load label
	  sw $t2, -1904($fp)	# spill _tmp474 from $t2 to $fp-1904
	# PushParam _tmp474
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -1904($fp)	# fill _tmp474 to $t0 from $fp-1904
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_85:
	# _tmp475 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -1908($fp)	# spill _tmp475 from $t2 to $fp-1908
	# _tmp476 = _tmp466 * _tmp475
	  lw $t0, -1872($fp)	# fill _tmp466 to $t0 from $fp-1872
	  lw $t1, -1908($fp)	# fill _tmp475 to $t1 from $fp-1908
	  mul $t2, $t0, $t1	
	  sw $t2, -1912($fp)	# spill _tmp476 from $t2 to $fp-1912
	# _tmp477 = _tmp465 + _tmp476
	  lw $t0, -1868($fp)	# fill _tmp465 to $t0 from $fp-1868
	  lw $t1, -1912($fp)	# fill _tmp476 to $t1 from $fp-1912
	  add $t2, $t0, $t1	
	  sw $t2, -1916($fp)	# spill _tmp477 from $t2 to $fp-1916
	# _tmp478 = _tmp477 + _tmp475
	  lw $t0, -1916($fp)	# fill _tmp477 to $t0 from $fp-1916
	  lw $t1, -1908($fp)	# fill _tmp475 to $t1 from $fp-1908
	  add $t2, $t0, $t1	
	  sw $t2, -1920($fp)	# spill _tmp478 from $t2 to $fp-1920
	# _tmp479 = *(_tmp478)
	  lw $t0, -1920($fp)	# fill _tmp478 to $t0 from $fp-1920
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -1924($fp)	# spill _tmp479 from $t2 to $fp-1924
	# _tmp480 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -1928($fp)	# spill _tmp480 from $t2 to $fp-1928
	# _tmp481 = *(_tmp479)
	  lw $t0, -1924($fp)	# fill _tmp479 to $t0 from $fp-1924
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -1932($fp)	# spill _tmp481 from $t2 to $fp-1932
	# _tmp482 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -1936($fp)	# spill _tmp482 from $t2 to $fp-1936
	# _tmp483 = _tmp480 < _tmp482
	  lw $t0, -1928($fp)	# fill _tmp480 to $t0 from $fp-1928
	  lw $t1, -1936($fp)	# fill _tmp482 to $t1 from $fp-1936
	  slt $t2, $t0, $t1	
	  sw $t2, -1940($fp)	# spill _tmp483 from $t2 to $fp-1940
	# _tmp484 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -1944($fp)	# spill _tmp484 from $t2 to $fp-1944
	# _tmp485 = _tmp481 - _tmp484
	  lw $t0, -1932($fp)	# fill _tmp481 to $t0 from $fp-1932
	  lw $t1, -1944($fp)	# fill _tmp484 to $t1 from $fp-1944
	  sub $t2, $t0, $t1	
	  sw $t2, -1948($fp)	# spill _tmp485 from $t2 to $fp-1948
	# _tmp486 = _tmp485 < _tmp480
	  lw $t0, -1948($fp)	# fill _tmp485 to $t0 from $fp-1948
	  lw $t1, -1928($fp)	# fill _tmp480 to $t1 from $fp-1928
	  slt $t2, $t0, $t1	
	  sw $t2, -1952($fp)	# spill _tmp486 from $t2 to $fp-1952
	# _tmp487 = _tmp483 || _tmp486
	  lw $t0, -1940($fp)	# fill _tmp483 to $t0 from $fp-1940
	  lw $t1, -1952($fp)	# fill _tmp486 to $t1 from $fp-1952
	  or $t2, $t0, $t1	
	  sw $t2, -1956($fp)	# spill _tmp487 from $t2 to $fp-1956
	# IfZ _tmp487 Goto arrayAcc_86
	  lw $t0, -1956($fp)	# fill _tmp487 to $t0 from $fp-1956
	  beqz $t0, arrayAcc_86	# branch if _tmp487 is zero 
	# _tmp488 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string60: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string60	# load label
	  sw $t2, -1960($fp)	# spill _tmp488 from $t2 to $fp-1960
	# PushParam _tmp488
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -1960($fp)	# fill _tmp488 to $t0 from $fp-1960
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_86:
	# _tmp489 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -1964($fp)	# spill _tmp489 from $t2 to $fp-1964
	# _tmp490 = _tmp480 * _tmp489
	  lw $t0, -1928($fp)	# fill _tmp480 to $t0 from $fp-1928
	  lw $t1, -1964($fp)	# fill _tmp489 to $t1 from $fp-1964
	  mul $t2, $t0, $t1	
	  sw $t2, -1968($fp)	# spill _tmp490 from $t2 to $fp-1968
	# _tmp491 = _tmp479 + _tmp490
	  lw $t0, -1924($fp)	# fill _tmp479 to $t0 from $fp-1924
	  lw $t1, -1968($fp)	# fill _tmp490 to $t1 from $fp-1968
	  add $t2, $t0, $t1	
	  sw $t2, -1972($fp)	# spill _tmp491 from $t2 to $fp-1972
	# _tmp492 = _tmp491 + _tmp489
	  lw $t0, -1972($fp)	# fill _tmp491 to $t0 from $fp-1972
	  lw $t1, -1964($fp)	# fill _tmp489 to $t1 from $fp-1964
	  add $t2, $t0, $t1	
	  sw $t2, -1976($fp)	# spill _tmp492 from $t2 to $fp-1976
	# _tmp493 = *(_tmp492)
	  lw $t0, -1976($fp)	# fill _tmp492 to $t0 from $fp-1976
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -1980($fp)	# spill _tmp493 from $t2 to $fp-1980
	# _tmp494 = *(_tmp493)
	  lw $t0, -1980($fp)	# fill _tmp493 to $t0 from $fp-1980
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -1984($fp)	# spill _tmp494 from $t2 to $fp-1984
	# _tmp495 = *(_tmp494 + 20)
	  lw $t0, -1984($fp)	# fill _tmp494 to $t0 from $fp-1984
	  lw $t2, 20($t0) 	# load with offset
	  sw $t2, -1988($fp)	# spill _tmp495 from $t2 to $fp-1988
	# PushParam mark
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -8($fp)	# fill mark to $t0 from $fp-8
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam _tmp493
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -1980($fp)	# fill _tmp493 to $t0 from $fp-1980
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp496 = ACall _tmp495
	  lw $t0, -1988($fp)	# fill _tmp495 to $t0 from $fp-1988
	  jalr $t0            	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -1992($fp)	# spill _tmp496 from $t2 to $fp-1992
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# _tmp497 = _tmp464 && _tmp496
	  lw $t0, -1864($fp)	# fill _tmp464 to $t0 from $fp-1864
	  lw $t1, -1992($fp)	# fill _tmp496 to $t1 from $fp-1992
	  and $t2, $t0, $t1	
	  sw $t2, -1996($fp)	# spill _tmp497 from $t2 to $fp-1996
	# IfZ _tmp497 Goto else_87
	  lw $t0, -1996($fp)	# fill _tmp497 to $t0 from $fp-1996
	  beqz $t0, else_87	# branch if _tmp497 is zero 
	# _tmp498 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -2000($fp)	# spill _tmp498 from $t2 to $fp-2000
	# Return _tmp498
	  lw $t2, -2000($fp)	# fill _tmp498 to $t2 from $fp-2000
	  move $v0, $t2		# assign return value into $v0
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# Goto endif_88
	  b endif_88		# unconditional branch
  else_87:
  endif_88:
	# _tmp499 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -2004($fp)	# spill _tmp499 from $t2 to $fp-2004
	# _tmp500 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -2008($fp)	# spill _tmp500 from $t2 to $fp-2008
	# _tmp501 = *(_tmp499)
	  lw $t0, -2004($fp)	# fill _tmp499 to $t0 from $fp-2004
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -2012($fp)	# spill _tmp501 from $t2 to $fp-2012
	# _tmp502 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -2016($fp)	# spill _tmp502 from $t2 to $fp-2016
	# _tmp503 = _tmp500 < _tmp502
	  lw $t0, -2008($fp)	# fill _tmp500 to $t0 from $fp-2008
	  lw $t1, -2016($fp)	# fill _tmp502 to $t1 from $fp-2016
	  slt $t2, $t0, $t1	
	  sw $t2, -2020($fp)	# spill _tmp503 from $t2 to $fp-2020
	# _tmp504 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -2024($fp)	# spill _tmp504 from $t2 to $fp-2024
	# _tmp505 = _tmp501 - _tmp504
	  lw $t0, -2012($fp)	# fill _tmp501 to $t0 from $fp-2012
	  lw $t1, -2024($fp)	# fill _tmp504 to $t1 from $fp-2024
	  sub $t2, $t0, $t1	
	  sw $t2, -2028($fp)	# spill _tmp505 from $t2 to $fp-2028
	# _tmp506 = _tmp505 < _tmp500
	  lw $t0, -2028($fp)	# fill _tmp505 to $t0 from $fp-2028
	  lw $t1, -2008($fp)	# fill _tmp500 to $t1 from $fp-2008
	  slt $t2, $t0, $t1	
	  sw $t2, -2032($fp)	# spill _tmp506 from $t2 to $fp-2032
	# _tmp507 = _tmp503 || _tmp506
	  lw $t0, -2020($fp)	# fill _tmp503 to $t0 from $fp-2020
	  lw $t1, -2032($fp)	# fill _tmp506 to $t1 from $fp-2032
	  or $t2, $t0, $t1	
	  sw $t2, -2036($fp)	# spill _tmp507 from $t2 to $fp-2036
	# IfZ _tmp507 Goto arrayAcc_89
	  lw $t0, -2036($fp)	# fill _tmp507 to $t0 from $fp-2036
	  beqz $t0, arrayAcc_89	# branch if _tmp507 is zero 
	# _tmp508 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string61: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string61	# load label
	  sw $t2, -2040($fp)	# spill _tmp508 from $t2 to $fp-2040
	# PushParam _tmp508
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -2040($fp)	# fill _tmp508 to $t0 from $fp-2040
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_89:
	# _tmp509 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -2044($fp)	# spill _tmp509 from $t2 to $fp-2044
	# _tmp510 = _tmp500 * _tmp509
	  lw $t0, -2008($fp)	# fill _tmp500 to $t0 from $fp-2008
	  lw $t1, -2044($fp)	# fill _tmp509 to $t1 from $fp-2044
	  mul $t2, $t0, $t1	
	  sw $t2, -2048($fp)	# spill _tmp510 from $t2 to $fp-2048
	# _tmp511 = _tmp499 + _tmp510
	  lw $t0, -2004($fp)	# fill _tmp499 to $t0 from $fp-2004
	  lw $t1, -2048($fp)	# fill _tmp510 to $t1 from $fp-2048
	  add $t2, $t0, $t1	
	  sw $t2, -2052($fp)	# spill _tmp511 from $t2 to $fp-2052
	# _tmp512 = _tmp511 + _tmp509
	  lw $t0, -2052($fp)	# fill _tmp511 to $t0 from $fp-2052
	  lw $t1, -2044($fp)	# fill _tmp509 to $t1 from $fp-2044
	  add $t2, $t0, $t1	
	  sw $t2, -2056($fp)	# spill _tmp512 from $t2 to $fp-2056
	# _tmp513 = *(_tmp512)
	  lw $t0, -2056($fp)	# fill _tmp512 to $t0 from $fp-2056
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -2060($fp)	# spill _tmp513 from $t2 to $fp-2060
	# _tmp514 = 2
	  li $t2, 2		# load constant value 2 into $t2
	  sw $t2, -2064($fp)	# spill _tmp514 from $t2 to $fp-2064
	# _tmp515 = *(_tmp513)
	  lw $t0, -2060($fp)	# fill _tmp513 to $t0 from $fp-2060
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -2068($fp)	# spill _tmp515 from $t2 to $fp-2068
	# _tmp516 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -2072($fp)	# spill _tmp516 from $t2 to $fp-2072
	# _tmp517 = _tmp514 < _tmp516
	  lw $t0, -2064($fp)	# fill _tmp514 to $t0 from $fp-2064
	  lw $t1, -2072($fp)	# fill _tmp516 to $t1 from $fp-2072
	  slt $t2, $t0, $t1	
	  sw $t2, -2076($fp)	# spill _tmp517 from $t2 to $fp-2076
	# _tmp518 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -2080($fp)	# spill _tmp518 from $t2 to $fp-2080
	# _tmp519 = _tmp515 - _tmp518
	  lw $t0, -2068($fp)	# fill _tmp515 to $t0 from $fp-2068
	  lw $t1, -2080($fp)	# fill _tmp518 to $t1 from $fp-2080
	  sub $t2, $t0, $t1	
	  sw $t2, -2084($fp)	# spill _tmp519 from $t2 to $fp-2084
	# _tmp520 = _tmp519 < _tmp514
	  lw $t0, -2084($fp)	# fill _tmp519 to $t0 from $fp-2084
	  lw $t1, -2064($fp)	# fill _tmp514 to $t1 from $fp-2064
	  slt $t2, $t0, $t1	
	  sw $t2, -2088($fp)	# spill _tmp520 from $t2 to $fp-2088
	# _tmp521 = _tmp517 || _tmp520
	  lw $t0, -2076($fp)	# fill _tmp517 to $t0 from $fp-2076
	  lw $t1, -2088($fp)	# fill _tmp520 to $t1 from $fp-2088
	  or $t2, $t0, $t1	
	  sw $t2, -2092($fp)	# spill _tmp521 from $t2 to $fp-2092
	# IfZ _tmp521 Goto arrayAcc_90
	  lw $t0, -2092($fp)	# fill _tmp521 to $t0 from $fp-2092
	  beqz $t0, arrayAcc_90	# branch if _tmp521 is zero 
	# _tmp522 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string62: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string62	# load label
	  sw $t2, -2096($fp)	# spill _tmp522 from $t2 to $fp-2096
	# PushParam _tmp522
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -2096($fp)	# fill _tmp522 to $t0 from $fp-2096
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_90:
	# _tmp523 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -2100($fp)	# spill _tmp523 from $t2 to $fp-2100
	# _tmp524 = _tmp514 * _tmp523
	  lw $t0, -2064($fp)	# fill _tmp514 to $t0 from $fp-2064
	  lw $t1, -2100($fp)	# fill _tmp523 to $t1 from $fp-2100
	  mul $t2, $t0, $t1	
	  sw $t2, -2104($fp)	# spill _tmp524 from $t2 to $fp-2104
	# _tmp525 = _tmp513 + _tmp524
	  lw $t0, -2060($fp)	# fill _tmp513 to $t0 from $fp-2060
	  lw $t1, -2104($fp)	# fill _tmp524 to $t1 from $fp-2104
	  add $t2, $t0, $t1	
	  sw $t2, -2108($fp)	# spill _tmp525 from $t2 to $fp-2108
	# _tmp526 = _tmp525 + _tmp523
	  lw $t0, -2108($fp)	# fill _tmp525 to $t0 from $fp-2108
	  lw $t1, -2100($fp)	# fill _tmp523 to $t1 from $fp-2100
	  add $t2, $t0, $t1	
	  sw $t2, -2112($fp)	# spill _tmp526 from $t2 to $fp-2112
	# _tmp527 = *(_tmp526)
	  lw $t0, -2112($fp)	# fill _tmp526 to $t0 from $fp-2112
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -2116($fp)	# spill _tmp527 from $t2 to $fp-2116
	# _tmp528 = *(_tmp527)
	  lw $t0, -2116($fp)	# fill _tmp527 to $t0 from $fp-2116
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -2120($fp)	# spill _tmp528 from $t2 to $fp-2120
	# _tmp529 = *(_tmp528 + 20)
	  lw $t0, -2120($fp)	# fill _tmp528 to $t0 from $fp-2120
	  lw $t2, 20($t0) 	# load with offset
	  sw $t2, -2124($fp)	# spill _tmp529 from $t2 to $fp-2124
	# PushParam mark
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -8($fp)	# fill mark to $t0 from $fp-8
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam _tmp527
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -2116($fp)	# fill _tmp527 to $t0 from $fp-2116
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp530 = ACall _tmp529
	  lw $t0, -2124($fp)	# fill _tmp529 to $t0 from $fp-2124
	  jalr $t0            	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -2128($fp)	# spill _tmp530 from $t2 to $fp-2128
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# _tmp531 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -2132($fp)	# spill _tmp531 from $t2 to $fp-2132
	# _tmp532 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -2136($fp)	# spill _tmp532 from $t2 to $fp-2136
	# _tmp533 = *(_tmp531)
	  lw $t0, -2132($fp)	# fill _tmp531 to $t0 from $fp-2132
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -2140($fp)	# spill _tmp533 from $t2 to $fp-2140
	# _tmp534 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -2144($fp)	# spill _tmp534 from $t2 to $fp-2144
	# _tmp535 = _tmp532 < _tmp534
	  lw $t0, -2136($fp)	# fill _tmp532 to $t0 from $fp-2136
	  lw $t1, -2144($fp)	# fill _tmp534 to $t1 from $fp-2144
	  slt $t2, $t0, $t1	
	  sw $t2, -2148($fp)	# spill _tmp535 from $t2 to $fp-2148
	# _tmp536 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -2152($fp)	# spill _tmp536 from $t2 to $fp-2152
	# _tmp537 = _tmp533 - _tmp536
	  lw $t0, -2140($fp)	# fill _tmp533 to $t0 from $fp-2140
	  lw $t1, -2152($fp)	# fill _tmp536 to $t1 from $fp-2152
	  sub $t2, $t0, $t1	
	  sw $t2, -2156($fp)	# spill _tmp537 from $t2 to $fp-2156
	# _tmp538 = _tmp537 < _tmp532
	  lw $t0, -2156($fp)	# fill _tmp537 to $t0 from $fp-2156
	  lw $t1, -2136($fp)	# fill _tmp532 to $t1 from $fp-2136
	  slt $t2, $t0, $t1	
	  sw $t2, -2160($fp)	# spill _tmp538 from $t2 to $fp-2160
	# _tmp539 = _tmp535 || _tmp538
	  lw $t0, -2148($fp)	# fill _tmp535 to $t0 from $fp-2148
	  lw $t1, -2160($fp)	# fill _tmp538 to $t1 from $fp-2160
	  or $t2, $t0, $t1	
	  sw $t2, -2164($fp)	# spill _tmp539 from $t2 to $fp-2164
	# IfZ _tmp539 Goto arrayAcc_91
	  lw $t0, -2164($fp)	# fill _tmp539 to $t0 from $fp-2164
	  beqz $t0, arrayAcc_91	# branch if _tmp539 is zero 
	# _tmp540 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string63: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string63	# load label
	  sw $t2, -2168($fp)	# spill _tmp540 from $t2 to $fp-2168
	# PushParam _tmp540
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -2168($fp)	# fill _tmp540 to $t0 from $fp-2168
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_91:
	# _tmp541 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -2172($fp)	# spill _tmp541 from $t2 to $fp-2172
	# _tmp542 = _tmp532 * _tmp541
	  lw $t0, -2136($fp)	# fill _tmp532 to $t0 from $fp-2136
	  lw $t1, -2172($fp)	# fill _tmp541 to $t1 from $fp-2172
	  mul $t2, $t0, $t1	
	  sw $t2, -2176($fp)	# spill _tmp542 from $t2 to $fp-2176
	# _tmp543 = _tmp531 + _tmp542
	  lw $t0, -2132($fp)	# fill _tmp531 to $t0 from $fp-2132
	  lw $t1, -2176($fp)	# fill _tmp542 to $t1 from $fp-2176
	  add $t2, $t0, $t1	
	  sw $t2, -2180($fp)	# spill _tmp543 from $t2 to $fp-2180
	# _tmp544 = _tmp543 + _tmp541
	  lw $t0, -2180($fp)	# fill _tmp543 to $t0 from $fp-2180
	  lw $t1, -2172($fp)	# fill _tmp541 to $t1 from $fp-2172
	  add $t2, $t0, $t1	
	  sw $t2, -2184($fp)	# spill _tmp544 from $t2 to $fp-2184
	# _tmp545 = *(_tmp544)
	  lw $t0, -2184($fp)	# fill _tmp544 to $t0 from $fp-2184
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -2188($fp)	# spill _tmp545 from $t2 to $fp-2188
	# _tmp546 = 2
	  li $t2, 2		# load constant value 2 into $t2
	  sw $t2, -2192($fp)	# spill _tmp546 from $t2 to $fp-2192
	# _tmp547 = *(_tmp545)
	  lw $t0, -2188($fp)	# fill _tmp545 to $t0 from $fp-2188
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -2196($fp)	# spill _tmp547 from $t2 to $fp-2196
	# _tmp548 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -2200($fp)	# spill _tmp548 from $t2 to $fp-2200
	# _tmp549 = _tmp546 < _tmp548
	  lw $t0, -2192($fp)	# fill _tmp546 to $t0 from $fp-2192
	  lw $t1, -2200($fp)	# fill _tmp548 to $t1 from $fp-2200
	  slt $t2, $t0, $t1	
	  sw $t2, -2204($fp)	# spill _tmp549 from $t2 to $fp-2204
	# _tmp550 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -2208($fp)	# spill _tmp550 from $t2 to $fp-2208
	# _tmp551 = _tmp547 - _tmp550
	  lw $t0, -2196($fp)	# fill _tmp547 to $t0 from $fp-2196
	  lw $t1, -2208($fp)	# fill _tmp550 to $t1 from $fp-2208
	  sub $t2, $t0, $t1	
	  sw $t2, -2212($fp)	# spill _tmp551 from $t2 to $fp-2212
	# _tmp552 = _tmp551 < _tmp546
	  lw $t0, -2212($fp)	# fill _tmp551 to $t0 from $fp-2212
	  lw $t1, -2192($fp)	# fill _tmp546 to $t1 from $fp-2192
	  slt $t2, $t0, $t1	
	  sw $t2, -2216($fp)	# spill _tmp552 from $t2 to $fp-2216
	# _tmp553 = _tmp549 || _tmp552
	  lw $t0, -2204($fp)	# fill _tmp549 to $t0 from $fp-2204
	  lw $t1, -2216($fp)	# fill _tmp552 to $t1 from $fp-2216
	  or $t2, $t0, $t1	
	  sw $t2, -2220($fp)	# spill _tmp553 from $t2 to $fp-2220
	# IfZ _tmp553 Goto arrayAcc_92
	  lw $t0, -2220($fp)	# fill _tmp553 to $t0 from $fp-2220
	  beqz $t0, arrayAcc_92	# branch if _tmp553 is zero 
	# _tmp554 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string64: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string64	# load label
	  sw $t2, -2224($fp)	# spill _tmp554 from $t2 to $fp-2224
	# PushParam _tmp554
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -2224($fp)	# fill _tmp554 to $t0 from $fp-2224
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_92:
	# _tmp555 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -2228($fp)	# spill _tmp555 from $t2 to $fp-2228
	# _tmp556 = _tmp546 * _tmp555
	  lw $t0, -2192($fp)	# fill _tmp546 to $t0 from $fp-2192
	  lw $t1, -2228($fp)	# fill _tmp555 to $t1 from $fp-2228
	  mul $t2, $t0, $t1	
	  sw $t2, -2232($fp)	# spill _tmp556 from $t2 to $fp-2232
	# _tmp557 = _tmp545 + _tmp556
	  lw $t0, -2188($fp)	# fill _tmp545 to $t0 from $fp-2188
	  lw $t1, -2232($fp)	# fill _tmp556 to $t1 from $fp-2232
	  add $t2, $t0, $t1	
	  sw $t2, -2236($fp)	# spill _tmp557 from $t2 to $fp-2236
	# _tmp558 = _tmp557 + _tmp555
	  lw $t0, -2236($fp)	# fill _tmp557 to $t0 from $fp-2236
	  lw $t1, -2228($fp)	# fill _tmp555 to $t1 from $fp-2228
	  add $t2, $t0, $t1	
	  sw $t2, -2240($fp)	# spill _tmp558 from $t2 to $fp-2240
	# _tmp559 = *(_tmp558)
	  lw $t0, -2240($fp)	# fill _tmp558 to $t0 from $fp-2240
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -2244($fp)	# spill _tmp559 from $t2 to $fp-2244
	# _tmp560 = *(_tmp559)
	  lw $t0, -2244($fp)	# fill _tmp559 to $t0 from $fp-2244
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -2248($fp)	# spill _tmp560 from $t2 to $fp-2248
	# _tmp561 = *(_tmp560 + 20)
	  lw $t0, -2248($fp)	# fill _tmp560 to $t0 from $fp-2248
	  lw $t2, 20($t0) 	# load with offset
	  sw $t2, -2252($fp)	# spill _tmp561 from $t2 to $fp-2252
	# PushParam mark
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -8($fp)	# fill mark to $t0 from $fp-8
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam _tmp559
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -2244($fp)	# fill _tmp559 to $t0 from $fp-2244
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp562 = ACall _tmp561
	  lw $t0, -2252($fp)	# fill _tmp561 to $t0 from $fp-2252
	  jalr $t0            	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -2256($fp)	# spill _tmp562 from $t2 to $fp-2256
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# _tmp563 = _tmp530 && _tmp562
	  lw $t0, -2128($fp)	# fill _tmp530 to $t0 from $fp-2128
	  lw $t1, -2256($fp)	# fill _tmp562 to $t1 from $fp-2256
	  and $t2, $t0, $t1	
	  sw $t2, -2260($fp)	# spill _tmp563 from $t2 to $fp-2260
	# _tmp564 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -2264($fp)	# spill _tmp564 from $t2 to $fp-2264
	# _tmp565 = 2
	  li $t2, 2		# load constant value 2 into $t2
	  sw $t2, -2268($fp)	# spill _tmp565 from $t2 to $fp-2268
	# _tmp566 = *(_tmp564)
	  lw $t0, -2264($fp)	# fill _tmp564 to $t0 from $fp-2264
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -2272($fp)	# spill _tmp566 from $t2 to $fp-2272
	# _tmp567 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -2276($fp)	# spill _tmp567 from $t2 to $fp-2276
	# _tmp568 = _tmp565 < _tmp567
	  lw $t0, -2268($fp)	# fill _tmp565 to $t0 from $fp-2268
	  lw $t1, -2276($fp)	# fill _tmp567 to $t1 from $fp-2276
	  slt $t2, $t0, $t1	
	  sw $t2, -2280($fp)	# spill _tmp568 from $t2 to $fp-2280
	# _tmp569 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -2284($fp)	# spill _tmp569 from $t2 to $fp-2284
	# _tmp570 = _tmp566 - _tmp569
	  lw $t0, -2272($fp)	# fill _tmp566 to $t0 from $fp-2272
	  lw $t1, -2284($fp)	# fill _tmp569 to $t1 from $fp-2284
	  sub $t2, $t0, $t1	
	  sw $t2, -2288($fp)	# spill _tmp570 from $t2 to $fp-2288
	# _tmp571 = _tmp570 < _tmp565
	  lw $t0, -2288($fp)	# fill _tmp570 to $t0 from $fp-2288
	  lw $t1, -2268($fp)	# fill _tmp565 to $t1 from $fp-2268
	  slt $t2, $t0, $t1	
	  sw $t2, -2292($fp)	# spill _tmp571 from $t2 to $fp-2292
	# _tmp572 = _tmp568 || _tmp571
	  lw $t0, -2280($fp)	# fill _tmp568 to $t0 from $fp-2280
	  lw $t1, -2292($fp)	# fill _tmp571 to $t1 from $fp-2292
	  or $t2, $t0, $t1	
	  sw $t2, -2296($fp)	# spill _tmp572 from $t2 to $fp-2296
	# IfZ _tmp572 Goto arrayAcc_93
	  lw $t0, -2296($fp)	# fill _tmp572 to $t0 from $fp-2296
	  beqz $t0, arrayAcc_93	# branch if _tmp572 is zero 
	# _tmp573 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string65: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string65	# load label
	  sw $t2, -2300($fp)	# spill _tmp573 from $t2 to $fp-2300
	# PushParam _tmp573
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -2300($fp)	# fill _tmp573 to $t0 from $fp-2300
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_93:
	# _tmp574 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -2304($fp)	# spill _tmp574 from $t2 to $fp-2304
	# _tmp575 = _tmp565 * _tmp574
	  lw $t0, -2268($fp)	# fill _tmp565 to $t0 from $fp-2268
	  lw $t1, -2304($fp)	# fill _tmp574 to $t1 from $fp-2304
	  mul $t2, $t0, $t1	
	  sw $t2, -2308($fp)	# spill _tmp575 from $t2 to $fp-2308
	# _tmp576 = _tmp564 + _tmp575
	  lw $t0, -2264($fp)	# fill _tmp564 to $t0 from $fp-2264
	  lw $t1, -2308($fp)	# fill _tmp575 to $t1 from $fp-2308
	  add $t2, $t0, $t1	
	  sw $t2, -2312($fp)	# spill _tmp576 from $t2 to $fp-2312
	# _tmp577 = _tmp576 + _tmp574
	  lw $t0, -2312($fp)	# fill _tmp576 to $t0 from $fp-2312
	  lw $t1, -2304($fp)	# fill _tmp574 to $t1 from $fp-2304
	  add $t2, $t0, $t1	
	  sw $t2, -2316($fp)	# spill _tmp577 from $t2 to $fp-2316
	# _tmp578 = *(_tmp577)
	  lw $t0, -2316($fp)	# fill _tmp577 to $t0 from $fp-2316
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -2320($fp)	# spill _tmp578 from $t2 to $fp-2320
	# _tmp579 = 2
	  li $t2, 2		# load constant value 2 into $t2
	  sw $t2, -2324($fp)	# spill _tmp579 from $t2 to $fp-2324
	# _tmp580 = *(_tmp578)
	  lw $t0, -2320($fp)	# fill _tmp578 to $t0 from $fp-2320
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -2328($fp)	# spill _tmp580 from $t2 to $fp-2328
	# _tmp581 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -2332($fp)	# spill _tmp581 from $t2 to $fp-2332
	# _tmp582 = _tmp579 < _tmp581
	  lw $t0, -2324($fp)	# fill _tmp579 to $t0 from $fp-2324
	  lw $t1, -2332($fp)	# fill _tmp581 to $t1 from $fp-2332
	  slt $t2, $t0, $t1	
	  sw $t2, -2336($fp)	# spill _tmp582 from $t2 to $fp-2336
	# _tmp583 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -2340($fp)	# spill _tmp583 from $t2 to $fp-2340
	# _tmp584 = _tmp580 - _tmp583
	  lw $t0, -2328($fp)	# fill _tmp580 to $t0 from $fp-2328
	  lw $t1, -2340($fp)	# fill _tmp583 to $t1 from $fp-2340
	  sub $t2, $t0, $t1	
	  sw $t2, -2344($fp)	# spill _tmp584 from $t2 to $fp-2344
	# _tmp585 = _tmp584 < _tmp579
	  lw $t0, -2344($fp)	# fill _tmp584 to $t0 from $fp-2344
	  lw $t1, -2324($fp)	# fill _tmp579 to $t1 from $fp-2324
	  slt $t2, $t0, $t1	
	  sw $t2, -2348($fp)	# spill _tmp585 from $t2 to $fp-2348
	# _tmp586 = _tmp582 || _tmp585
	  lw $t0, -2336($fp)	# fill _tmp582 to $t0 from $fp-2336
	  lw $t1, -2348($fp)	# fill _tmp585 to $t1 from $fp-2348
	  or $t2, $t0, $t1	
	  sw $t2, -2352($fp)	# spill _tmp586 from $t2 to $fp-2352
	# IfZ _tmp586 Goto arrayAcc_94
	  lw $t0, -2352($fp)	# fill _tmp586 to $t0 from $fp-2352
	  beqz $t0, arrayAcc_94	# branch if _tmp586 is zero 
	# _tmp587 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string66: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string66	# load label
	  sw $t2, -2356($fp)	# spill _tmp587 from $t2 to $fp-2356
	# PushParam _tmp587
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -2356($fp)	# fill _tmp587 to $t0 from $fp-2356
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_94:
	# _tmp588 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -2360($fp)	# spill _tmp588 from $t2 to $fp-2360
	# _tmp589 = _tmp579 * _tmp588
	  lw $t0, -2324($fp)	# fill _tmp579 to $t0 from $fp-2324
	  lw $t1, -2360($fp)	# fill _tmp588 to $t1 from $fp-2360
	  mul $t2, $t0, $t1	
	  sw $t2, -2364($fp)	# spill _tmp589 from $t2 to $fp-2364
	# _tmp590 = _tmp578 + _tmp589
	  lw $t0, -2320($fp)	# fill _tmp578 to $t0 from $fp-2320
	  lw $t1, -2364($fp)	# fill _tmp589 to $t1 from $fp-2364
	  add $t2, $t0, $t1	
	  sw $t2, -2368($fp)	# spill _tmp590 from $t2 to $fp-2368
	# _tmp591 = _tmp590 + _tmp588
	  lw $t0, -2368($fp)	# fill _tmp590 to $t0 from $fp-2368
	  lw $t1, -2360($fp)	# fill _tmp588 to $t1 from $fp-2360
	  add $t2, $t0, $t1	
	  sw $t2, -2372($fp)	# spill _tmp591 from $t2 to $fp-2372
	# _tmp592 = *(_tmp591)
	  lw $t0, -2372($fp)	# fill _tmp591 to $t0 from $fp-2372
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -2376($fp)	# spill _tmp592 from $t2 to $fp-2376
	# _tmp593 = *(_tmp592)
	  lw $t0, -2376($fp)	# fill _tmp592 to $t0 from $fp-2376
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -2380($fp)	# spill _tmp593 from $t2 to $fp-2380
	# _tmp594 = *(_tmp593 + 20)
	  lw $t0, -2380($fp)	# fill _tmp593 to $t0 from $fp-2380
	  lw $t2, 20($t0) 	# load with offset
	  sw $t2, -2384($fp)	# spill _tmp594 from $t2 to $fp-2384
	# PushParam mark
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -8($fp)	# fill mark to $t0 from $fp-8
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam _tmp592
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -2376($fp)	# fill _tmp592 to $t0 from $fp-2376
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp595 = ACall _tmp594
	  lw $t0, -2384($fp)	# fill _tmp594 to $t0 from $fp-2384
	  jalr $t0            	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -2388($fp)	# spill _tmp595 from $t2 to $fp-2388
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# _tmp596 = _tmp563 && _tmp595
	  lw $t0, -2260($fp)	# fill _tmp563 to $t0 from $fp-2260
	  lw $t1, -2388($fp)	# fill _tmp595 to $t1 from $fp-2388
	  and $t2, $t0, $t1	
	  sw $t2, -2392($fp)	# spill _tmp596 from $t2 to $fp-2392
	# IfZ _tmp596 Goto else_95
	  lw $t0, -2392($fp)	# fill _tmp596 to $t0 from $fp-2392
	  beqz $t0, else_95	# branch if _tmp596 is zero 
	# _tmp597 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -2396($fp)	# spill _tmp597 from $t2 to $fp-2396
	# Return _tmp597
	  lw $t2, -2396($fp)	# fill _tmp597 to $t2 from $fp-2396
	  move $v0, $t2		# assign return value into $v0
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# Goto endif_96
	  b endif_96		# unconditional branch
  else_95:
  endif_96:
	# _tmp598 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -2400($fp)	# spill _tmp598 from $t2 to $fp-2400
	# _tmp599 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -2404($fp)	# spill _tmp599 from $t2 to $fp-2404
	# _tmp600 = *(_tmp598)
	  lw $t0, -2400($fp)	# fill _tmp598 to $t0 from $fp-2400
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -2408($fp)	# spill _tmp600 from $t2 to $fp-2408
	# _tmp601 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -2412($fp)	# spill _tmp601 from $t2 to $fp-2412
	# _tmp602 = _tmp599 < _tmp601
	  lw $t0, -2404($fp)	# fill _tmp599 to $t0 from $fp-2404
	  lw $t1, -2412($fp)	# fill _tmp601 to $t1 from $fp-2412
	  slt $t2, $t0, $t1	
	  sw $t2, -2416($fp)	# spill _tmp602 from $t2 to $fp-2416
	# _tmp603 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -2420($fp)	# spill _tmp603 from $t2 to $fp-2420
	# _tmp604 = _tmp600 - _tmp603
	  lw $t0, -2408($fp)	# fill _tmp600 to $t0 from $fp-2408
	  lw $t1, -2420($fp)	# fill _tmp603 to $t1 from $fp-2420
	  sub $t2, $t0, $t1	
	  sw $t2, -2424($fp)	# spill _tmp604 from $t2 to $fp-2424
	# _tmp605 = _tmp604 < _tmp599
	  lw $t0, -2424($fp)	# fill _tmp604 to $t0 from $fp-2424
	  lw $t1, -2404($fp)	# fill _tmp599 to $t1 from $fp-2404
	  slt $t2, $t0, $t1	
	  sw $t2, -2428($fp)	# spill _tmp605 from $t2 to $fp-2428
	# _tmp606 = _tmp602 || _tmp605
	  lw $t0, -2416($fp)	# fill _tmp602 to $t0 from $fp-2416
	  lw $t1, -2428($fp)	# fill _tmp605 to $t1 from $fp-2428
	  or $t2, $t0, $t1	
	  sw $t2, -2432($fp)	# spill _tmp606 from $t2 to $fp-2432
	# IfZ _tmp606 Goto arrayAcc_97
	  lw $t0, -2432($fp)	# fill _tmp606 to $t0 from $fp-2432
	  beqz $t0, arrayAcc_97	# branch if _tmp606 is zero 
	# _tmp607 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string67: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string67	# load label
	  sw $t2, -2436($fp)	# spill _tmp607 from $t2 to $fp-2436
	# PushParam _tmp607
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -2436($fp)	# fill _tmp607 to $t0 from $fp-2436
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_97:
	# _tmp608 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -2440($fp)	# spill _tmp608 from $t2 to $fp-2440
	# _tmp609 = _tmp599 * _tmp608
	  lw $t0, -2404($fp)	# fill _tmp599 to $t0 from $fp-2404
	  lw $t1, -2440($fp)	# fill _tmp608 to $t1 from $fp-2440
	  mul $t2, $t0, $t1	
	  sw $t2, -2444($fp)	# spill _tmp609 from $t2 to $fp-2444
	# _tmp610 = _tmp598 + _tmp609
	  lw $t0, -2400($fp)	# fill _tmp598 to $t0 from $fp-2400
	  lw $t1, -2444($fp)	# fill _tmp609 to $t1 from $fp-2444
	  add $t2, $t0, $t1	
	  sw $t2, -2448($fp)	# spill _tmp610 from $t2 to $fp-2448
	# _tmp611 = _tmp610 + _tmp608
	  lw $t0, -2448($fp)	# fill _tmp610 to $t0 from $fp-2448
	  lw $t1, -2440($fp)	# fill _tmp608 to $t1 from $fp-2440
	  add $t2, $t0, $t1	
	  sw $t2, -2452($fp)	# spill _tmp611 from $t2 to $fp-2452
	# _tmp612 = *(_tmp611)
	  lw $t0, -2452($fp)	# fill _tmp611 to $t0 from $fp-2452
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -2456($fp)	# spill _tmp612 from $t2 to $fp-2456
	# _tmp613 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -2460($fp)	# spill _tmp613 from $t2 to $fp-2460
	# _tmp614 = *(_tmp612)
	  lw $t0, -2456($fp)	# fill _tmp612 to $t0 from $fp-2456
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -2464($fp)	# spill _tmp614 from $t2 to $fp-2464
	# _tmp615 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -2468($fp)	# spill _tmp615 from $t2 to $fp-2468
	# _tmp616 = _tmp613 < _tmp615
	  lw $t0, -2460($fp)	# fill _tmp613 to $t0 from $fp-2460
	  lw $t1, -2468($fp)	# fill _tmp615 to $t1 from $fp-2468
	  slt $t2, $t0, $t1	
	  sw $t2, -2472($fp)	# spill _tmp616 from $t2 to $fp-2472
	# _tmp617 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -2476($fp)	# spill _tmp617 from $t2 to $fp-2476
	# _tmp618 = _tmp614 - _tmp617
	  lw $t0, -2464($fp)	# fill _tmp614 to $t0 from $fp-2464
	  lw $t1, -2476($fp)	# fill _tmp617 to $t1 from $fp-2476
	  sub $t2, $t0, $t1	
	  sw $t2, -2480($fp)	# spill _tmp618 from $t2 to $fp-2480
	# _tmp619 = _tmp618 < _tmp613
	  lw $t0, -2480($fp)	# fill _tmp618 to $t0 from $fp-2480
	  lw $t1, -2460($fp)	# fill _tmp613 to $t1 from $fp-2460
	  slt $t2, $t0, $t1	
	  sw $t2, -2484($fp)	# spill _tmp619 from $t2 to $fp-2484
	# _tmp620 = _tmp616 || _tmp619
	  lw $t0, -2472($fp)	# fill _tmp616 to $t0 from $fp-2472
	  lw $t1, -2484($fp)	# fill _tmp619 to $t1 from $fp-2484
	  or $t2, $t0, $t1	
	  sw $t2, -2488($fp)	# spill _tmp620 from $t2 to $fp-2488
	# IfZ _tmp620 Goto arrayAcc_98
	  lw $t0, -2488($fp)	# fill _tmp620 to $t0 from $fp-2488
	  beqz $t0, arrayAcc_98	# branch if _tmp620 is zero 
	# _tmp621 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string68: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string68	# load label
	  sw $t2, -2492($fp)	# spill _tmp621 from $t2 to $fp-2492
	# PushParam _tmp621
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -2492($fp)	# fill _tmp621 to $t0 from $fp-2492
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_98:
	# _tmp622 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -2496($fp)	# spill _tmp622 from $t2 to $fp-2496
	# _tmp623 = _tmp613 * _tmp622
	  lw $t0, -2460($fp)	# fill _tmp613 to $t0 from $fp-2460
	  lw $t1, -2496($fp)	# fill _tmp622 to $t1 from $fp-2496
	  mul $t2, $t0, $t1	
	  sw $t2, -2500($fp)	# spill _tmp623 from $t2 to $fp-2500
	# _tmp624 = _tmp612 + _tmp623
	  lw $t0, -2456($fp)	# fill _tmp612 to $t0 from $fp-2456
	  lw $t1, -2500($fp)	# fill _tmp623 to $t1 from $fp-2500
	  add $t2, $t0, $t1	
	  sw $t2, -2504($fp)	# spill _tmp624 from $t2 to $fp-2504
	# _tmp625 = _tmp624 + _tmp622
	  lw $t0, -2504($fp)	# fill _tmp624 to $t0 from $fp-2504
	  lw $t1, -2496($fp)	# fill _tmp622 to $t1 from $fp-2496
	  add $t2, $t0, $t1	
	  sw $t2, -2508($fp)	# spill _tmp625 from $t2 to $fp-2508
	# _tmp626 = *(_tmp625)
	  lw $t0, -2508($fp)	# fill _tmp625 to $t0 from $fp-2508
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -2512($fp)	# spill _tmp626 from $t2 to $fp-2512
	# _tmp627 = *(_tmp626)
	  lw $t0, -2512($fp)	# fill _tmp626 to $t0 from $fp-2512
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -2516($fp)	# spill _tmp627 from $t2 to $fp-2516
	# _tmp628 = *(_tmp627 + 20)
	  lw $t0, -2516($fp)	# fill _tmp627 to $t0 from $fp-2516
	  lw $t2, 20($t0) 	# load with offset
	  sw $t2, -2520($fp)	# spill _tmp628 from $t2 to $fp-2520
	# PushParam mark
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -8($fp)	# fill mark to $t0 from $fp-8
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam _tmp626
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -2512($fp)	# fill _tmp626 to $t0 from $fp-2512
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp629 = ACall _tmp628
	  lw $t0, -2520($fp)	# fill _tmp628 to $t0 from $fp-2520
	  jalr $t0            	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -2524($fp)	# spill _tmp629 from $t2 to $fp-2524
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# _tmp630 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -2528($fp)	# spill _tmp630 from $t2 to $fp-2528
	# _tmp631 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -2532($fp)	# spill _tmp631 from $t2 to $fp-2532
	# _tmp632 = *(_tmp630)
	  lw $t0, -2528($fp)	# fill _tmp630 to $t0 from $fp-2528
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -2536($fp)	# spill _tmp632 from $t2 to $fp-2536
	# _tmp633 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -2540($fp)	# spill _tmp633 from $t2 to $fp-2540
	# _tmp634 = _tmp631 < _tmp633
	  lw $t0, -2532($fp)	# fill _tmp631 to $t0 from $fp-2532
	  lw $t1, -2540($fp)	# fill _tmp633 to $t1 from $fp-2540
	  slt $t2, $t0, $t1	
	  sw $t2, -2544($fp)	# spill _tmp634 from $t2 to $fp-2544
	# _tmp635 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -2548($fp)	# spill _tmp635 from $t2 to $fp-2548
	# _tmp636 = _tmp632 - _tmp635
	  lw $t0, -2536($fp)	# fill _tmp632 to $t0 from $fp-2536
	  lw $t1, -2548($fp)	# fill _tmp635 to $t1 from $fp-2548
	  sub $t2, $t0, $t1	
	  sw $t2, -2552($fp)	# spill _tmp636 from $t2 to $fp-2552
	# _tmp637 = _tmp636 < _tmp631
	  lw $t0, -2552($fp)	# fill _tmp636 to $t0 from $fp-2552
	  lw $t1, -2532($fp)	# fill _tmp631 to $t1 from $fp-2532
	  slt $t2, $t0, $t1	
	  sw $t2, -2556($fp)	# spill _tmp637 from $t2 to $fp-2556
	# _tmp638 = _tmp634 || _tmp637
	  lw $t0, -2544($fp)	# fill _tmp634 to $t0 from $fp-2544
	  lw $t1, -2556($fp)	# fill _tmp637 to $t1 from $fp-2556
	  or $t2, $t0, $t1	
	  sw $t2, -2560($fp)	# spill _tmp638 from $t2 to $fp-2560
	# IfZ _tmp638 Goto arrayAcc_99
	  lw $t0, -2560($fp)	# fill _tmp638 to $t0 from $fp-2560
	  beqz $t0, arrayAcc_99	# branch if _tmp638 is zero 
	# _tmp639 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string69: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string69	# load label
	  sw $t2, -2564($fp)	# spill _tmp639 from $t2 to $fp-2564
	# PushParam _tmp639
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -2564($fp)	# fill _tmp639 to $t0 from $fp-2564
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_99:
	# _tmp640 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -2568($fp)	# spill _tmp640 from $t2 to $fp-2568
	# _tmp641 = _tmp631 * _tmp640
	  lw $t0, -2532($fp)	# fill _tmp631 to $t0 from $fp-2532
	  lw $t1, -2568($fp)	# fill _tmp640 to $t1 from $fp-2568
	  mul $t2, $t0, $t1	
	  sw $t2, -2572($fp)	# spill _tmp641 from $t2 to $fp-2572
	# _tmp642 = _tmp630 + _tmp641
	  lw $t0, -2528($fp)	# fill _tmp630 to $t0 from $fp-2528
	  lw $t1, -2572($fp)	# fill _tmp641 to $t1 from $fp-2572
	  add $t2, $t0, $t1	
	  sw $t2, -2576($fp)	# spill _tmp642 from $t2 to $fp-2576
	# _tmp643 = _tmp642 + _tmp640
	  lw $t0, -2576($fp)	# fill _tmp642 to $t0 from $fp-2576
	  lw $t1, -2568($fp)	# fill _tmp640 to $t1 from $fp-2568
	  add $t2, $t0, $t1	
	  sw $t2, -2580($fp)	# spill _tmp643 from $t2 to $fp-2580
	# _tmp644 = *(_tmp643)
	  lw $t0, -2580($fp)	# fill _tmp643 to $t0 from $fp-2580
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -2584($fp)	# spill _tmp644 from $t2 to $fp-2584
	# _tmp645 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -2588($fp)	# spill _tmp645 from $t2 to $fp-2588
	# _tmp646 = *(_tmp644)
	  lw $t0, -2584($fp)	# fill _tmp644 to $t0 from $fp-2584
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -2592($fp)	# spill _tmp646 from $t2 to $fp-2592
	# _tmp647 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -2596($fp)	# spill _tmp647 from $t2 to $fp-2596
	# _tmp648 = _tmp645 < _tmp647
	  lw $t0, -2588($fp)	# fill _tmp645 to $t0 from $fp-2588
	  lw $t1, -2596($fp)	# fill _tmp647 to $t1 from $fp-2596
	  slt $t2, $t0, $t1	
	  sw $t2, -2600($fp)	# spill _tmp648 from $t2 to $fp-2600
	# _tmp649 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -2604($fp)	# spill _tmp649 from $t2 to $fp-2604
	# _tmp650 = _tmp646 - _tmp649
	  lw $t0, -2592($fp)	# fill _tmp646 to $t0 from $fp-2592
	  lw $t1, -2604($fp)	# fill _tmp649 to $t1 from $fp-2604
	  sub $t2, $t0, $t1	
	  sw $t2, -2608($fp)	# spill _tmp650 from $t2 to $fp-2608
	# _tmp651 = _tmp650 < _tmp645
	  lw $t0, -2608($fp)	# fill _tmp650 to $t0 from $fp-2608
	  lw $t1, -2588($fp)	# fill _tmp645 to $t1 from $fp-2588
	  slt $t2, $t0, $t1	
	  sw $t2, -2612($fp)	# spill _tmp651 from $t2 to $fp-2612
	# _tmp652 = _tmp648 || _tmp651
	  lw $t0, -2600($fp)	# fill _tmp648 to $t0 from $fp-2600
	  lw $t1, -2612($fp)	# fill _tmp651 to $t1 from $fp-2612
	  or $t2, $t0, $t1	
	  sw $t2, -2616($fp)	# spill _tmp652 from $t2 to $fp-2616
	# IfZ _tmp652 Goto arrayAcc_100
	  lw $t0, -2616($fp)	# fill _tmp652 to $t0 from $fp-2616
	  beqz $t0, arrayAcc_100	# branch if _tmp652 is zero 
	# _tmp653 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string70: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string70	# load label
	  sw $t2, -2620($fp)	# spill _tmp653 from $t2 to $fp-2620
	# PushParam _tmp653
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -2620($fp)	# fill _tmp653 to $t0 from $fp-2620
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_100:
	# _tmp654 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -2624($fp)	# spill _tmp654 from $t2 to $fp-2624
	# _tmp655 = _tmp645 * _tmp654
	  lw $t0, -2588($fp)	# fill _tmp645 to $t0 from $fp-2588
	  lw $t1, -2624($fp)	# fill _tmp654 to $t1 from $fp-2624
	  mul $t2, $t0, $t1	
	  sw $t2, -2628($fp)	# spill _tmp655 from $t2 to $fp-2628
	# _tmp656 = _tmp644 + _tmp655
	  lw $t0, -2584($fp)	# fill _tmp644 to $t0 from $fp-2584
	  lw $t1, -2628($fp)	# fill _tmp655 to $t1 from $fp-2628
	  add $t2, $t0, $t1	
	  sw $t2, -2632($fp)	# spill _tmp656 from $t2 to $fp-2632
	# _tmp657 = _tmp656 + _tmp654
	  lw $t0, -2632($fp)	# fill _tmp656 to $t0 from $fp-2632
	  lw $t1, -2624($fp)	# fill _tmp654 to $t1 from $fp-2624
	  add $t2, $t0, $t1	
	  sw $t2, -2636($fp)	# spill _tmp657 from $t2 to $fp-2636
	# _tmp658 = *(_tmp657)
	  lw $t0, -2636($fp)	# fill _tmp657 to $t0 from $fp-2636
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -2640($fp)	# spill _tmp658 from $t2 to $fp-2640
	# _tmp659 = *(_tmp658)
	  lw $t0, -2640($fp)	# fill _tmp658 to $t0 from $fp-2640
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -2644($fp)	# spill _tmp659 from $t2 to $fp-2644
	# _tmp660 = *(_tmp659 + 20)
	  lw $t0, -2644($fp)	# fill _tmp659 to $t0 from $fp-2644
	  lw $t2, 20($t0) 	# load with offset
	  sw $t2, -2648($fp)	# spill _tmp660 from $t2 to $fp-2648
	# PushParam mark
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -8($fp)	# fill mark to $t0 from $fp-8
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam _tmp658
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -2640($fp)	# fill _tmp658 to $t0 from $fp-2640
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp661 = ACall _tmp660
	  lw $t0, -2648($fp)	# fill _tmp660 to $t0 from $fp-2648
	  jalr $t0            	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -2652($fp)	# spill _tmp661 from $t2 to $fp-2652
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# _tmp662 = _tmp629 && _tmp661
	  lw $t0, -2524($fp)	# fill _tmp629 to $t0 from $fp-2524
	  lw $t1, -2652($fp)	# fill _tmp661 to $t1 from $fp-2652
	  and $t2, $t0, $t1	
	  sw $t2, -2656($fp)	# spill _tmp662 from $t2 to $fp-2656
	# _tmp663 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -2660($fp)	# spill _tmp663 from $t2 to $fp-2660
	# _tmp664 = 2
	  li $t2, 2		# load constant value 2 into $t2
	  sw $t2, -2664($fp)	# spill _tmp664 from $t2 to $fp-2664
	# _tmp665 = *(_tmp663)
	  lw $t0, -2660($fp)	# fill _tmp663 to $t0 from $fp-2660
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -2668($fp)	# spill _tmp665 from $t2 to $fp-2668
	# _tmp666 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -2672($fp)	# spill _tmp666 from $t2 to $fp-2672
	# _tmp667 = _tmp664 < _tmp666
	  lw $t0, -2664($fp)	# fill _tmp664 to $t0 from $fp-2664
	  lw $t1, -2672($fp)	# fill _tmp666 to $t1 from $fp-2672
	  slt $t2, $t0, $t1	
	  sw $t2, -2676($fp)	# spill _tmp667 from $t2 to $fp-2676
	# _tmp668 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -2680($fp)	# spill _tmp668 from $t2 to $fp-2680
	# _tmp669 = _tmp665 - _tmp668
	  lw $t0, -2668($fp)	# fill _tmp665 to $t0 from $fp-2668
	  lw $t1, -2680($fp)	# fill _tmp668 to $t1 from $fp-2680
	  sub $t2, $t0, $t1	
	  sw $t2, -2684($fp)	# spill _tmp669 from $t2 to $fp-2684
	# _tmp670 = _tmp669 < _tmp664
	  lw $t0, -2684($fp)	# fill _tmp669 to $t0 from $fp-2684
	  lw $t1, -2664($fp)	# fill _tmp664 to $t1 from $fp-2664
	  slt $t2, $t0, $t1	
	  sw $t2, -2688($fp)	# spill _tmp670 from $t2 to $fp-2688
	# _tmp671 = _tmp667 || _tmp670
	  lw $t0, -2676($fp)	# fill _tmp667 to $t0 from $fp-2676
	  lw $t1, -2688($fp)	# fill _tmp670 to $t1 from $fp-2688
	  or $t2, $t0, $t1	
	  sw $t2, -2692($fp)	# spill _tmp671 from $t2 to $fp-2692
	# IfZ _tmp671 Goto arrayAcc_101
	  lw $t0, -2692($fp)	# fill _tmp671 to $t0 from $fp-2692
	  beqz $t0, arrayAcc_101	# branch if _tmp671 is zero 
	# _tmp672 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string71: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string71	# load label
	  sw $t2, -2696($fp)	# spill _tmp672 from $t2 to $fp-2696
	# PushParam _tmp672
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -2696($fp)	# fill _tmp672 to $t0 from $fp-2696
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_101:
	# _tmp673 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -2700($fp)	# spill _tmp673 from $t2 to $fp-2700
	# _tmp674 = _tmp664 * _tmp673
	  lw $t0, -2664($fp)	# fill _tmp664 to $t0 from $fp-2664
	  lw $t1, -2700($fp)	# fill _tmp673 to $t1 from $fp-2700
	  mul $t2, $t0, $t1	
	  sw $t2, -2704($fp)	# spill _tmp674 from $t2 to $fp-2704
	# _tmp675 = _tmp663 + _tmp674
	  lw $t0, -2660($fp)	# fill _tmp663 to $t0 from $fp-2660
	  lw $t1, -2704($fp)	# fill _tmp674 to $t1 from $fp-2704
	  add $t2, $t0, $t1	
	  sw $t2, -2708($fp)	# spill _tmp675 from $t2 to $fp-2708
	# _tmp676 = _tmp675 + _tmp673
	  lw $t0, -2708($fp)	# fill _tmp675 to $t0 from $fp-2708
	  lw $t1, -2700($fp)	# fill _tmp673 to $t1 from $fp-2700
	  add $t2, $t0, $t1	
	  sw $t2, -2712($fp)	# spill _tmp676 from $t2 to $fp-2712
	# _tmp677 = *(_tmp676)
	  lw $t0, -2712($fp)	# fill _tmp676 to $t0 from $fp-2712
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -2716($fp)	# spill _tmp677 from $t2 to $fp-2716
	# _tmp678 = 2
	  li $t2, 2		# load constant value 2 into $t2
	  sw $t2, -2720($fp)	# spill _tmp678 from $t2 to $fp-2720
	# _tmp679 = *(_tmp677)
	  lw $t0, -2716($fp)	# fill _tmp677 to $t0 from $fp-2716
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -2724($fp)	# spill _tmp679 from $t2 to $fp-2724
	# _tmp680 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -2728($fp)	# spill _tmp680 from $t2 to $fp-2728
	# _tmp681 = _tmp678 < _tmp680
	  lw $t0, -2720($fp)	# fill _tmp678 to $t0 from $fp-2720
	  lw $t1, -2728($fp)	# fill _tmp680 to $t1 from $fp-2728
	  slt $t2, $t0, $t1	
	  sw $t2, -2732($fp)	# spill _tmp681 from $t2 to $fp-2732
	# _tmp682 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -2736($fp)	# spill _tmp682 from $t2 to $fp-2736
	# _tmp683 = _tmp679 - _tmp682
	  lw $t0, -2724($fp)	# fill _tmp679 to $t0 from $fp-2724
	  lw $t1, -2736($fp)	# fill _tmp682 to $t1 from $fp-2736
	  sub $t2, $t0, $t1	
	  sw $t2, -2740($fp)	# spill _tmp683 from $t2 to $fp-2740
	# _tmp684 = _tmp683 < _tmp678
	  lw $t0, -2740($fp)	# fill _tmp683 to $t0 from $fp-2740
	  lw $t1, -2720($fp)	# fill _tmp678 to $t1 from $fp-2720
	  slt $t2, $t0, $t1	
	  sw $t2, -2744($fp)	# spill _tmp684 from $t2 to $fp-2744
	# _tmp685 = _tmp681 || _tmp684
	  lw $t0, -2732($fp)	# fill _tmp681 to $t0 from $fp-2732
	  lw $t1, -2744($fp)	# fill _tmp684 to $t1 from $fp-2744
	  or $t2, $t0, $t1	
	  sw $t2, -2748($fp)	# spill _tmp685 from $t2 to $fp-2748
	# IfZ _tmp685 Goto arrayAcc_102
	  lw $t0, -2748($fp)	# fill _tmp685 to $t0 from $fp-2748
	  beqz $t0, arrayAcc_102	# branch if _tmp685 is zero 
	# _tmp686 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string72: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string72	# load label
	  sw $t2, -2752($fp)	# spill _tmp686 from $t2 to $fp-2752
	# PushParam _tmp686
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -2752($fp)	# fill _tmp686 to $t0 from $fp-2752
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_102:
	# _tmp687 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -2756($fp)	# spill _tmp687 from $t2 to $fp-2756
	# _tmp688 = _tmp678 * _tmp687
	  lw $t0, -2720($fp)	# fill _tmp678 to $t0 from $fp-2720
	  lw $t1, -2756($fp)	# fill _tmp687 to $t1 from $fp-2756
	  mul $t2, $t0, $t1	
	  sw $t2, -2760($fp)	# spill _tmp688 from $t2 to $fp-2760
	# _tmp689 = _tmp677 + _tmp688
	  lw $t0, -2716($fp)	# fill _tmp677 to $t0 from $fp-2716
	  lw $t1, -2760($fp)	# fill _tmp688 to $t1 from $fp-2760
	  add $t2, $t0, $t1	
	  sw $t2, -2764($fp)	# spill _tmp689 from $t2 to $fp-2764
	# _tmp690 = _tmp689 + _tmp687
	  lw $t0, -2764($fp)	# fill _tmp689 to $t0 from $fp-2764
	  lw $t1, -2756($fp)	# fill _tmp687 to $t1 from $fp-2756
	  add $t2, $t0, $t1	
	  sw $t2, -2768($fp)	# spill _tmp690 from $t2 to $fp-2768
	# _tmp691 = *(_tmp690)
	  lw $t0, -2768($fp)	# fill _tmp690 to $t0 from $fp-2768
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -2772($fp)	# spill _tmp691 from $t2 to $fp-2772
	# _tmp692 = *(_tmp691)
	  lw $t0, -2772($fp)	# fill _tmp691 to $t0 from $fp-2772
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -2776($fp)	# spill _tmp692 from $t2 to $fp-2776
	# _tmp693 = *(_tmp692 + 20)
	  lw $t0, -2776($fp)	# fill _tmp692 to $t0 from $fp-2776
	  lw $t2, 20($t0) 	# load with offset
	  sw $t2, -2780($fp)	# spill _tmp693 from $t2 to $fp-2780
	# PushParam mark
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -8($fp)	# fill mark to $t0 from $fp-8
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam _tmp691
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -2772($fp)	# fill _tmp691 to $t0 from $fp-2772
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp694 = ACall _tmp693
	  lw $t0, -2780($fp)	# fill _tmp693 to $t0 from $fp-2780
	  jalr $t0            	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -2784($fp)	# spill _tmp694 from $t2 to $fp-2784
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# _tmp695 = _tmp662 && _tmp694
	  lw $t0, -2656($fp)	# fill _tmp662 to $t0 from $fp-2656
	  lw $t1, -2784($fp)	# fill _tmp694 to $t1 from $fp-2784
	  and $t2, $t0, $t1	
	  sw $t2, -2788($fp)	# spill _tmp695 from $t2 to $fp-2788
	# IfZ _tmp695 Goto else_103
	  lw $t0, -2788($fp)	# fill _tmp695 to $t0 from $fp-2788
	  beqz $t0, else_103	# branch if _tmp695 is zero 
	# _tmp696 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -2792($fp)	# spill _tmp696 from $t2 to $fp-2792
	# Return _tmp696
	  lw $t2, -2792($fp)	# fill _tmp696 to $t2 from $fp-2792
	  move $v0, $t2		# assign return value into $v0
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# Goto endif_104
	  b endif_104		# unconditional branch
  else_103:
  endif_104:
	# _tmp697 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -2796($fp)	# spill _tmp697 from $t2 to $fp-2796
	# _tmp698 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -2800($fp)	# spill _tmp698 from $t2 to $fp-2800
	# _tmp699 = *(_tmp697)
	  lw $t0, -2796($fp)	# fill _tmp697 to $t0 from $fp-2796
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -2804($fp)	# spill _tmp699 from $t2 to $fp-2804
	# _tmp700 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -2808($fp)	# spill _tmp700 from $t2 to $fp-2808
	# _tmp701 = _tmp698 < _tmp700
	  lw $t0, -2800($fp)	# fill _tmp698 to $t0 from $fp-2800
	  lw $t1, -2808($fp)	# fill _tmp700 to $t1 from $fp-2808
	  slt $t2, $t0, $t1	
	  sw $t2, -2812($fp)	# spill _tmp701 from $t2 to $fp-2812
	# _tmp702 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -2816($fp)	# spill _tmp702 from $t2 to $fp-2816
	# _tmp703 = _tmp699 - _tmp702
	  lw $t0, -2804($fp)	# fill _tmp699 to $t0 from $fp-2804
	  lw $t1, -2816($fp)	# fill _tmp702 to $t1 from $fp-2816
	  sub $t2, $t0, $t1	
	  sw $t2, -2820($fp)	# spill _tmp703 from $t2 to $fp-2820
	# _tmp704 = _tmp703 < _tmp698
	  lw $t0, -2820($fp)	# fill _tmp703 to $t0 from $fp-2820
	  lw $t1, -2800($fp)	# fill _tmp698 to $t1 from $fp-2800
	  slt $t2, $t0, $t1	
	  sw $t2, -2824($fp)	# spill _tmp704 from $t2 to $fp-2824
	# _tmp705 = _tmp701 || _tmp704
	  lw $t0, -2812($fp)	# fill _tmp701 to $t0 from $fp-2812
	  lw $t1, -2824($fp)	# fill _tmp704 to $t1 from $fp-2824
	  or $t2, $t0, $t1	
	  sw $t2, -2828($fp)	# spill _tmp705 from $t2 to $fp-2828
	# IfZ _tmp705 Goto arrayAcc_105
	  lw $t0, -2828($fp)	# fill _tmp705 to $t0 from $fp-2828
	  beqz $t0, arrayAcc_105	# branch if _tmp705 is zero 
	# _tmp706 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string73: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string73	# load label
	  sw $t2, -2832($fp)	# spill _tmp706 from $t2 to $fp-2832
	# PushParam _tmp706
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -2832($fp)	# fill _tmp706 to $t0 from $fp-2832
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_105:
	# _tmp707 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -2836($fp)	# spill _tmp707 from $t2 to $fp-2836
	# _tmp708 = _tmp698 * _tmp707
	  lw $t0, -2800($fp)	# fill _tmp698 to $t0 from $fp-2800
	  lw $t1, -2836($fp)	# fill _tmp707 to $t1 from $fp-2836
	  mul $t2, $t0, $t1	
	  sw $t2, -2840($fp)	# spill _tmp708 from $t2 to $fp-2840
	# _tmp709 = _tmp697 + _tmp708
	  lw $t0, -2796($fp)	# fill _tmp697 to $t0 from $fp-2796
	  lw $t1, -2840($fp)	# fill _tmp708 to $t1 from $fp-2840
	  add $t2, $t0, $t1	
	  sw $t2, -2844($fp)	# spill _tmp709 from $t2 to $fp-2844
	# _tmp710 = _tmp709 + _tmp707
	  lw $t0, -2844($fp)	# fill _tmp709 to $t0 from $fp-2844
	  lw $t1, -2836($fp)	# fill _tmp707 to $t1 from $fp-2836
	  add $t2, $t0, $t1	
	  sw $t2, -2848($fp)	# spill _tmp710 from $t2 to $fp-2848
	# _tmp711 = *(_tmp710)
	  lw $t0, -2848($fp)	# fill _tmp710 to $t0 from $fp-2848
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -2852($fp)	# spill _tmp711 from $t2 to $fp-2852
	# _tmp712 = 2
	  li $t2, 2		# load constant value 2 into $t2
	  sw $t2, -2856($fp)	# spill _tmp712 from $t2 to $fp-2856
	# _tmp713 = *(_tmp711)
	  lw $t0, -2852($fp)	# fill _tmp711 to $t0 from $fp-2852
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -2860($fp)	# spill _tmp713 from $t2 to $fp-2860
	# _tmp714 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -2864($fp)	# spill _tmp714 from $t2 to $fp-2864
	# _tmp715 = _tmp712 < _tmp714
	  lw $t0, -2856($fp)	# fill _tmp712 to $t0 from $fp-2856
	  lw $t1, -2864($fp)	# fill _tmp714 to $t1 from $fp-2864
	  slt $t2, $t0, $t1	
	  sw $t2, -2868($fp)	# spill _tmp715 from $t2 to $fp-2868
	# _tmp716 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -2872($fp)	# spill _tmp716 from $t2 to $fp-2872
	# _tmp717 = _tmp713 - _tmp716
	  lw $t0, -2860($fp)	# fill _tmp713 to $t0 from $fp-2860
	  lw $t1, -2872($fp)	# fill _tmp716 to $t1 from $fp-2872
	  sub $t2, $t0, $t1	
	  sw $t2, -2876($fp)	# spill _tmp717 from $t2 to $fp-2876
	# _tmp718 = _tmp717 < _tmp712
	  lw $t0, -2876($fp)	# fill _tmp717 to $t0 from $fp-2876
	  lw $t1, -2856($fp)	# fill _tmp712 to $t1 from $fp-2856
	  slt $t2, $t0, $t1	
	  sw $t2, -2880($fp)	# spill _tmp718 from $t2 to $fp-2880
	# _tmp719 = _tmp715 || _tmp718
	  lw $t0, -2868($fp)	# fill _tmp715 to $t0 from $fp-2868
	  lw $t1, -2880($fp)	# fill _tmp718 to $t1 from $fp-2880
	  or $t2, $t0, $t1	
	  sw $t2, -2884($fp)	# spill _tmp719 from $t2 to $fp-2884
	# IfZ _tmp719 Goto arrayAcc_106
	  lw $t0, -2884($fp)	# fill _tmp719 to $t0 from $fp-2884
	  beqz $t0, arrayAcc_106	# branch if _tmp719 is zero 
	# _tmp720 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string74: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string74	# load label
	  sw $t2, -2888($fp)	# spill _tmp720 from $t2 to $fp-2888
	# PushParam _tmp720
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -2888($fp)	# fill _tmp720 to $t0 from $fp-2888
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_106:
	# _tmp721 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -2892($fp)	# spill _tmp721 from $t2 to $fp-2892
	# _tmp722 = _tmp712 * _tmp721
	  lw $t0, -2856($fp)	# fill _tmp712 to $t0 from $fp-2856
	  lw $t1, -2892($fp)	# fill _tmp721 to $t1 from $fp-2892
	  mul $t2, $t0, $t1	
	  sw $t2, -2896($fp)	# spill _tmp722 from $t2 to $fp-2896
	# _tmp723 = _tmp711 + _tmp722
	  lw $t0, -2852($fp)	# fill _tmp711 to $t0 from $fp-2852
	  lw $t1, -2896($fp)	# fill _tmp722 to $t1 from $fp-2896
	  add $t2, $t0, $t1	
	  sw $t2, -2900($fp)	# spill _tmp723 from $t2 to $fp-2900
	# _tmp724 = _tmp723 + _tmp721
	  lw $t0, -2900($fp)	# fill _tmp723 to $t0 from $fp-2900
	  lw $t1, -2892($fp)	# fill _tmp721 to $t1 from $fp-2892
	  add $t2, $t0, $t1	
	  sw $t2, -2904($fp)	# spill _tmp724 from $t2 to $fp-2904
	# _tmp725 = *(_tmp724)
	  lw $t0, -2904($fp)	# fill _tmp724 to $t0 from $fp-2904
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -2908($fp)	# spill _tmp725 from $t2 to $fp-2908
	# _tmp726 = *(_tmp725)
	  lw $t0, -2908($fp)	# fill _tmp725 to $t0 from $fp-2908
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -2912($fp)	# spill _tmp726 from $t2 to $fp-2912
	# _tmp727 = *(_tmp726 + 20)
	  lw $t0, -2912($fp)	# fill _tmp726 to $t0 from $fp-2912
	  lw $t2, 20($t0) 	# load with offset
	  sw $t2, -2916($fp)	# spill _tmp727 from $t2 to $fp-2916
	# PushParam mark
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -8($fp)	# fill mark to $t0 from $fp-8
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam _tmp725
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -2908($fp)	# fill _tmp725 to $t0 from $fp-2908
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp728 = ACall _tmp727
	  lw $t0, -2916($fp)	# fill _tmp727 to $t0 from $fp-2916
	  jalr $t0            	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -2920($fp)	# spill _tmp728 from $t2 to $fp-2920
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# _tmp729 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -2924($fp)	# spill _tmp729 from $t2 to $fp-2924
	# _tmp730 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -2928($fp)	# spill _tmp730 from $t2 to $fp-2928
	# _tmp731 = *(_tmp729)
	  lw $t0, -2924($fp)	# fill _tmp729 to $t0 from $fp-2924
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -2932($fp)	# spill _tmp731 from $t2 to $fp-2932
	# _tmp732 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -2936($fp)	# spill _tmp732 from $t2 to $fp-2936
	# _tmp733 = _tmp730 < _tmp732
	  lw $t0, -2928($fp)	# fill _tmp730 to $t0 from $fp-2928
	  lw $t1, -2936($fp)	# fill _tmp732 to $t1 from $fp-2936
	  slt $t2, $t0, $t1	
	  sw $t2, -2940($fp)	# spill _tmp733 from $t2 to $fp-2940
	# _tmp734 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -2944($fp)	# spill _tmp734 from $t2 to $fp-2944
	# _tmp735 = _tmp731 - _tmp734
	  lw $t0, -2932($fp)	# fill _tmp731 to $t0 from $fp-2932
	  lw $t1, -2944($fp)	# fill _tmp734 to $t1 from $fp-2944
	  sub $t2, $t0, $t1	
	  sw $t2, -2948($fp)	# spill _tmp735 from $t2 to $fp-2948
	# _tmp736 = _tmp735 < _tmp730
	  lw $t0, -2948($fp)	# fill _tmp735 to $t0 from $fp-2948
	  lw $t1, -2928($fp)	# fill _tmp730 to $t1 from $fp-2928
	  slt $t2, $t0, $t1	
	  sw $t2, -2952($fp)	# spill _tmp736 from $t2 to $fp-2952
	# _tmp737 = _tmp733 || _tmp736
	  lw $t0, -2940($fp)	# fill _tmp733 to $t0 from $fp-2940
	  lw $t1, -2952($fp)	# fill _tmp736 to $t1 from $fp-2952
	  or $t2, $t0, $t1	
	  sw $t2, -2956($fp)	# spill _tmp737 from $t2 to $fp-2956
	# IfZ _tmp737 Goto arrayAcc_107
	  lw $t0, -2956($fp)	# fill _tmp737 to $t0 from $fp-2956
	  beqz $t0, arrayAcc_107	# branch if _tmp737 is zero 
	# _tmp738 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string75: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string75	# load label
	  sw $t2, -2960($fp)	# spill _tmp738 from $t2 to $fp-2960
	# PushParam _tmp738
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -2960($fp)	# fill _tmp738 to $t0 from $fp-2960
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_107:
	# _tmp739 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -2964($fp)	# spill _tmp739 from $t2 to $fp-2964
	# _tmp740 = _tmp730 * _tmp739
	  lw $t0, -2928($fp)	# fill _tmp730 to $t0 from $fp-2928
	  lw $t1, -2964($fp)	# fill _tmp739 to $t1 from $fp-2964
	  mul $t2, $t0, $t1	
	  sw $t2, -2968($fp)	# spill _tmp740 from $t2 to $fp-2968
	# _tmp741 = _tmp729 + _tmp740
	  lw $t0, -2924($fp)	# fill _tmp729 to $t0 from $fp-2924
	  lw $t1, -2968($fp)	# fill _tmp740 to $t1 from $fp-2968
	  add $t2, $t0, $t1	
	  sw $t2, -2972($fp)	# spill _tmp741 from $t2 to $fp-2972
	# _tmp742 = _tmp741 + _tmp739
	  lw $t0, -2972($fp)	# fill _tmp741 to $t0 from $fp-2972
	  lw $t1, -2964($fp)	# fill _tmp739 to $t1 from $fp-2964
	  add $t2, $t0, $t1	
	  sw $t2, -2976($fp)	# spill _tmp742 from $t2 to $fp-2976
	# _tmp743 = *(_tmp742)
	  lw $t0, -2976($fp)	# fill _tmp742 to $t0 from $fp-2976
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -2980($fp)	# spill _tmp743 from $t2 to $fp-2980
	# _tmp744 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -2984($fp)	# spill _tmp744 from $t2 to $fp-2984
	# _tmp745 = *(_tmp743)
	  lw $t0, -2980($fp)	# fill _tmp743 to $t0 from $fp-2980
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -2988($fp)	# spill _tmp745 from $t2 to $fp-2988
	# _tmp746 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -2992($fp)	# spill _tmp746 from $t2 to $fp-2992
	# _tmp747 = _tmp744 < _tmp746
	  lw $t0, -2984($fp)	# fill _tmp744 to $t0 from $fp-2984
	  lw $t1, -2992($fp)	# fill _tmp746 to $t1 from $fp-2992
	  slt $t2, $t0, $t1	
	  sw $t2, -2996($fp)	# spill _tmp747 from $t2 to $fp-2996
	# _tmp748 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -3000($fp)	# spill _tmp748 from $t2 to $fp-3000
	# _tmp749 = _tmp745 - _tmp748
	  lw $t0, -2988($fp)	# fill _tmp745 to $t0 from $fp-2988
	  lw $t1, -3000($fp)	# fill _tmp748 to $t1 from $fp-3000
	  sub $t2, $t0, $t1	
	  sw $t2, -3004($fp)	# spill _tmp749 from $t2 to $fp-3004
	# _tmp750 = _tmp749 < _tmp744
	  lw $t0, -3004($fp)	# fill _tmp749 to $t0 from $fp-3004
	  lw $t1, -2984($fp)	# fill _tmp744 to $t1 from $fp-2984
	  slt $t2, $t0, $t1	
	  sw $t2, -3008($fp)	# spill _tmp750 from $t2 to $fp-3008
	# _tmp751 = _tmp747 || _tmp750
	  lw $t0, -2996($fp)	# fill _tmp747 to $t0 from $fp-2996
	  lw $t1, -3008($fp)	# fill _tmp750 to $t1 from $fp-3008
	  or $t2, $t0, $t1	
	  sw $t2, -3012($fp)	# spill _tmp751 from $t2 to $fp-3012
	# IfZ _tmp751 Goto arrayAcc_108
	  lw $t0, -3012($fp)	# fill _tmp751 to $t0 from $fp-3012
	  beqz $t0, arrayAcc_108	# branch if _tmp751 is zero 
	# _tmp752 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string76: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string76	# load label
	  sw $t2, -3016($fp)	# spill _tmp752 from $t2 to $fp-3016
	# PushParam _tmp752
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -3016($fp)	# fill _tmp752 to $t0 from $fp-3016
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_108:
	# _tmp753 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -3020($fp)	# spill _tmp753 from $t2 to $fp-3020
	# _tmp754 = _tmp744 * _tmp753
	  lw $t0, -2984($fp)	# fill _tmp744 to $t0 from $fp-2984
	  lw $t1, -3020($fp)	# fill _tmp753 to $t1 from $fp-3020
	  mul $t2, $t0, $t1	
	  sw $t2, -3024($fp)	# spill _tmp754 from $t2 to $fp-3024
	# _tmp755 = _tmp743 + _tmp754
	  lw $t0, -2980($fp)	# fill _tmp743 to $t0 from $fp-2980
	  lw $t1, -3024($fp)	# fill _tmp754 to $t1 from $fp-3024
	  add $t2, $t0, $t1	
	  sw $t2, -3028($fp)	# spill _tmp755 from $t2 to $fp-3028
	# _tmp756 = _tmp755 + _tmp753
	  lw $t0, -3028($fp)	# fill _tmp755 to $t0 from $fp-3028
	  lw $t1, -3020($fp)	# fill _tmp753 to $t1 from $fp-3020
	  add $t2, $t0, $t1	
	  sw $t2, -3032($fp)	# spill _tmp756 from $t2 to $fp-3032
	# _tmp757 = *(_tmp756)
	  lw $t0, -3032($fp)	# fill _tmp756 to $t0 from $fp-3032
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -3036($fp)	# spill _tmp757 from $t2 to $fp-3036
	# _tmp758 = *(_tmp757)
	  lw $t0, -3036($fp)	# fill _tmp757 to $t0 from $fp-3036
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -3040($fp)	# spill _tmp758 from $t2 to $fp-3040
	# _tmp759 = *(_tmp758 + 20)
	  lw $t0, -3040($fp)	# fill _tmp758 to $t0 from $fp-3040
	  lw $t2, 20($t0) 	# load with offset
	  sw $t2, -3044($fp)	# spill _tmp759 from $t2 to $fp-3044
	# PushParam mark
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -8($fp)	# fill mark to $t0 from $fp-8
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam _tmp757
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -3036($fp)	# fill _tmp757 to $t0 from $fp-3036
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp760 = ACall _tmp759
	  lw $t0, -3044($fp)	# fill _tmp759 to $t0 from $fp-3044
	  jalr $t0            	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -3048($fp)	# spill _tmp760 from $t2 to $fp-3048
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# _tmp761 = _tmp728 && _tmp760
	  lw $t0, -2920($fp)	# fill _tmp728 to $t0 from $fp-2920
	  lw $t1, -3048($fp)	# fill _tmp760 to $t1 from $fp-3048
	  and $t2, $t0, $t1	
	  sw $t2, -3052($fp)	# spill _tmp761 from $t2 to $fp-3052
	# _tmp762 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -3056($fp)	# spill _tmp762 from $t2 to $fp-3056
	# _tmp763 = 2
	  li $t2, 2		# load constant value 2 into $t2
	  sw $t2, -3060($fp)	# spill _tmp763 from $t2 to $fp-3060
	# _tmp764 = *(_tmp762)
	  lw $t0, -3056($fp)	# fill _tmp762 to $t0 from $fp-3056
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -3064($fp)	# spill _tmp764 from $t2 to $fp-3064
	# _tmp765 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -3068($fp)	# spill _tmp765 from $t2 to $fp-3068
	# _tmp766 = _tmp763 < _tmp765
	  lw $t0, -3060($fp)	# fill _tmp763 to $t0 from $fp-3060
	  lw $t1, -3068($fp)	# fill _tmp765 to $t1 from $fp-3068
	  slt $t2, $t0, $t1	
	  sw $t2, -3072($fp)	# spill _tmp766 from $t2 to $fp-3072
	# _tmp767 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -3076($fp)	# spill _tmp767 from $t2 to $fp-3076
	# _tmp768 = _tmp764 - _tmp767
	  lw $t0, -3064($fp)	# fill _tmp764 to $t0 from $fp-3064
	  lw $t1, -3076($fp)	# fill _tmp767 to $t1 from $fp-3076
	  sub $t2, $t0, $t1	
	  sw $t2, -3080($fp)	# spill _tmp768 from $t2 to $fp-3080
	# _tmp769 = _tmp768 < _tmp763
	  lw $t0, -3080($fp)	# fill _tmp768 to $t0 from $fp-3080
	  lw $t1, -3060($fp)	# fill _tmp763 to $t1 from $fp-3060
	  slt $t2, $t0, $t1	
	  sw $t2, -3084($fp)	# spill _tmp769 from $t2 to $fp-3084
	# _tmp770 = _tmp766 || _tmp769
	  lw $t0, -3072($fp)	# fill _tmp766 to $t0 from $fp-3072
	  lw $t1, -3084($fp)	# fill _tmp769 to $t1 from $fp-3084
	  or $t2, $t0, $t1	
	  sw $t2, -3088($fp)	# spill _tmp770 from $t2 to $fp-3088
	# IfZ _tmp770 Goto arrayAcc_109
	  lw $t0, -3088($fp)	# fill _tmp770 to $t0 from $fp-3088
	  beqz $t0, arrayAcc_109	# branch if _tmp770 is zero 
	# _tmp771 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string77: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string77	# load label
	  sw $t2, -3092($fp)	# spill _tmp771 from $t2 to $fp-3092
	# PushParam _tmp771
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -3092($fp)	# fill _tmp771 to $t0 from $fp-3092
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_109:
	# _tmp772 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -3096($fp)	# spill _tmp772 from $t2 to $fp-3096
	# _tmp773 = _tmp763 * _tmp772
	  lw $t0, -3060($fp)	# fill _tmp763 to $t0 from $fp-3060
	  lw $t1, -3096($fp)	# fill _tmp772 to $t1 from $fp-3096
	  mul $t2, $t0, $t1	
	  sw $t2, -3100($fp)	# spill _tmp773 from $t2 to $fp-3100
	# _tmp774 = _tmp762 + _tmp773
	  lw $t0, -3056($fp)	# fill _tmp762 to $t0 from $fp-3056
	  lw $t1, -3100($fp)	# fill _tmp773 to $t1 from $fp-3100
	  add $t2, $t0, $t1	
	  sw $t2, -3104($fp)	# spill _tmp774 from $t2 to $fp-3104
	# _tmp775 = _tmp774 + _tmp772
	  lw $t0, -3104($fp)	# fill _tmp774 to $t0 from $fp-3104
	  lw $t1, -3096($fp)	# fill _tmp772 to $t1 from $fp-3096
	  add $t2, $t0, $t1	
	  sw $t2, -3108($fp)	# spill _tmp775 from $t2 to $fp-3108
	# _tmp776 = *(_tmp775)
	  lw $t0, -3108($fp)	# fill _tmp775 to $t0 from $fp-3108
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -3112($fp)	# spill _tmp776 from $t2 to $fp-3112
	# _tmp777 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -3116($fp)	# spill _tmp777 from $t2 to $fp-3116
	# _tmp778 = *(_tmp776)
	  lw $t0, -3112($fp)	# fill _tmp776 to $t0 from $fp-3112
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -3120($fp)	# spill _tmp778 from $t2 to $fp-3120
	# _tmp779 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -3124($fp)	# spill _tmp779 from $t2 to $fp-3124
	# _tmp780 = _tmp777 < _tmp779
	  lw $t0, -3116($fp)	# fill _tmp777 to $t0 from $fp-3116
	  lw $t1, -3124($fp)	# fill _tmp779 to $t1 from $fp-3124
	  slt $t2, $t0, $t1	
	  sw $t2, -3128($fp)	# spill _tmp780 from $t2 to $fp-3128
	# _tmp781 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -3132($fp)	# spill _tmp781 from $t2 to $fp-3132
	# _tmp782 = _tmp778 - _tmp781
	  lw $t0, -3120($fp)	# fill _tmp778 to $t0 from $fp-3120
	  lw $t1, -3132($fp)	# fill _tmp781 to $t1 from $fp-3132
	  sub $t2, $t0, $t1	
	  sw $t2, -3136($fp)	# spill _tmp782 from $t2 to $fp-3136
	# _tmp783 = _tmp782 < _tmp777
	  lw $t0, -3136($fp)	# fill _tmp782 to $t0 from $fp-3136
	  lw $t1, -3116($fp)	# fill _tmp777 to $t1 from $fp-3116
	  slt $t2, $t0, $t1	
	  sw $t2, -3140($fp)	# spill _tmp783 from $t2 to $fp-3140
	# _tmp784 = _tmp780 || _tmp783
	  lw $t0, -3128($fp)	# fill _tmp780 to $t0 from $fp-3128
	  lw $t1, -3140($fp)	# fill _tmp783 to $t1 from $fp-3140
	  or $t2, $t0, $t1	
	  sw $t2, -3144($fp)	# spill _tmp784 from $t2 to $fp-3144
	# IfZ _tmp784 Goto arrayAcc_110
	  lw $t0, -3144($fp)	# fill _tmp784 to $t0 from $fp-3144
	  beqz $t0, arrayAcc_110	# branch if _tmp784 is zero 
	# _tmp785 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string78: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string78	# load label
	  sw $t2, -3148($fp)	# spill _tmp785 from $t2 to $fp-3148
	# PushParam _tmp785
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -3148($fp)	# fill _tmp785 to $t0 from $fp-3148
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_110:
	# _tmp786 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -3152($fp)	# spill _tmp786 from $t2 to $fp-3152
	# _tmp787 = _tmp777 * _tmp786
	  lw $t0, -3116($fp)	# fill _tmp777 to $t0 from $fp-3116
	  lw $t1, -3152($fp)	# fill _tmp786 to $t1 from $fp-3152
	  mul $t2, $t0, $t1	
	  sw $t2, -3156($fp)	# spill _tmp787 from $t2 to $fp-3156
	# _tmp788 = _tmp776 + _tmp787
	  lw $t0, -3112($fp)	# fill _tmp776 to $t0 from $fp-3112
	  lw $t1, -3156($fp)	# fill _tmp787 to $t1 from $fp-3156
	  add $t2, $t0, $t1	
	  sw $t2, -3160($fp)	# spill _tmp788 from $t2 to $fp-3160
	# _tmp789 = _tmp788 + _tmp786
	  lw $t0, -3160($fp)	# fill _tmp788 to $t0 from $fp-3160
	  lw $t1, -3152($fp)	# fill _tmp786 to $t1 from $fp-3152
	  add $t2, $t0, $t1	
	  sw $t2, -3164($fp)	# spill _tmp789 from $t2 to $fp-3164
	# _tmp790 = *(_tmp789)
	  lw $t0, -3164($fp)	# fill _tmp789 to $t0 from $fp-3164
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -3168($fp)	# spill _tmp790 from $t2 to $fp-3168
	# _tmp791 = *(_tmp790)
	  lw $t0, -3168($fp)	# fill _tmp790 to $t0 from $fp-3168
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -3172($fp)	# spill _tmp791 from $t2 to $fp-3172
	# _tmp792 = *(_tmp791 + 20)
	  lw $t0, -3172($fp)	# fill _tmp791 to $t0 from $fp-3172
	  lw $t2, 20($t0) 	# load with offset
	  sw $t2, -3176($fp)	# spill _tmp792 from $t2 to $fp-3176
	# PushParam mark
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -8($fp)	# fill mark to $t0 from $fp-8
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam _tmp790
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -3168($fp)	# fill _tmp790 to $t0 from $fp-3168
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp793 = ACall _tmp792
	  lw $t0, -3176($fp)	# fill _tmp792 to $t0 from $fp-3176
	  jalr $t0            	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -3180($fp)	# spill _tmp793 from $t2 to $fp-3180
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# _tmp794 = _tmp761 && _tmp793
	  lw $t0, -3052($fp)	# fill _tmp761 to $t0 from $fp-3052
	  lw $t1, -3180($fp)	# fill _tmp793 to $t1 from $fp-3180
	  and $t2, $t0, $t1	
	  sw $t2, -3184($fp)	# spill _tmp794 from $t2 to $fp-3184
	# IfZ _tmp794 Goto else_111
	  lw $t0, -3184($fp)	# fill _tmp794 to $t0 from $fp-3184
	  beqz $t0, else_111	# branch if _tmp794 is zero 
	# _tmp795 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -3188($fp)	# spill _tmp795 from $t2 to $fp-3188
	# Return _tmp795
	  lw $t2, -3188($fp)	# fill _tmp795 to $t2 from $fp-3188
	  move $v0, $t2		# assign return value into $v0
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# Goto endif_112
	  b endif_112		# unconditional branch
  else_111:
	# _tmp796 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -3192($fp)	# spill _tmp796 from $t2 to $fp-3192
	# Return _tmp796
	  lw $t2, -3192($fp)	# fill _tmp796 to $t2 from $fp-3192
	  move $v0, $t2		# assign return value into $v0
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  endif_112:
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  Grid_BlockedPlay:
	# BeginFunc 6600
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 6600	# decrement sp to make space for locals/temps
	# _tmp2 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -16($fp)	# spill _tmp2 from $t2 to $fp-16
	# _tmp3 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -20($fp)	# spill _tmp3 from $t2 to $fp-20
	# _tmp4 = _tmp2 - _tmp3
	  lw $t0, -16($fp)	# fill _tmp2 to $t0 from $fp-16
	  lw $t1, -20($fp)	# fill _tmp3 to $t1 from $fp-20
	  sub $t2, $t0, $t1	
	  sw $t2, -24($fp)	# spill _tmp4 from $t2 to $fp-24
	# row = _tmp4
	  lw $t2, -24($fp)	# fill _tmp4 to $t2 from $fp-24
	  sw $t2, -8($fp)	# spill row from $t2 to $fp-8
	# _tmp5 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -28($fp)	# spill _tmp5 from $t2 to $fp-28
	# _tmp6 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -32($fp)	# spill _tmp6 from $t2 to $fp-32
	# _tmp7 = _tmp5 - _tmp6
	  lw $t0, -28($fp)	# fill _tmp5 to $t0 from $fp-28
	  lw $t1, -32($fp)	# fill _tmp6 to $t1 from $fp-32
	  sub $t2, $t0, $t1	
	  sw $t2, -36($fp)	# spill _tmp7 from $t2 to $fp-36
	# column = _tmp7
	  lw $t2, -36($fp)	# fill _tmp7 to $t2 from $fp-36
	  sw $t2, -12($fp)	# spill column from $t2 to $fp-12
	# _tmp8 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -40($fp)	# spill _tmp8 from $t2 to $fp-40
	# _tmp9 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -44($fp)	# spill _tmp9 from $t2 to $fp-44
	# _tmp10 = *(_tmp8)
	  lw $t0, -40($fp)	# fill _tmp8 to $t0 from $fp-40
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -48($fp)	# spill _tmp10 from $t2 to $fp-48
	# _tmp11 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -52($fp)	# spill _tmp11 from $t2 to $fp-52
	# _tmp12 = _tmp9 < _tmp11
	  lw $t0, -44($fp)	# fill _tmp9 to $t0 from $fp-44
	  lw $t1, -52($fp)	# fill _tmp11 to $t1 from $fp-52
	  slt $t2, $t0, $t1	
	  sw $t2, -56($fp)	# spill _tmp12 from $t2 to $fp-56
	# _tmp13 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -60($fp)	# spill _tmp13 from $t2 to $fp-60
	# _tmp14 = _tmp10 - _tmp13
	  lw $t0, -48($fp)	# fill _tmp10 to $t0 from $fp-48
	  lw $t1, -60($fp)	# fill _tmp13 to $t1 from $fp-60
	  sub $t2, $t0, $t1	
	  sw $t2, -64($fp)	# spill _tmp14 from $t2 to $fp-64
	# _tmp15 = _tmp14 < _tmp9
	  lw $t0, -64($fp)	# fill _tmp14 to $t0 from $fp-64
	  lw $t1, -44($fp)	# fill _tmp9 to $t1 from $fp-44
	  slt $t2, $t0, $t1	
	  sw $t2, -68($fp)	# spill _tmp15 from $t2 to $fp-68
	# _tmp16 = _tmp12 || _tmp15
	  lw $t0, -56($fp)	# fill _tmp12 to $t0 from $fp-56
	  lw $t1, -68($fp)	# fill _tmp15 to $t1 from $fp-68
	  or $t2, $t0, $t1	
	  sw $t2, -72($fp)	# spill _tmp16 from $t2 to $fp-72
	# IfZ _tmp16 Goto arrayAcc_113
	  lw $t0, -72($fp)	# fill _tmp16 to $t0 from $fp-72
	  beqz $t0, arrayAcc_113	# branch if _tmp16 is zero 
	# _tmp17 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string79: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string79	# load label
	  sw $t2, -76($fp)	# spill _tmp17 from $t2 to $fp-76
	# PushParam _tmp17
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -76($fp)	# fill _tmp17 to $t0 from $fp-76
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_113:
	# _tmp18 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -80($fp)	# spill _tmp18 from $t2 to $fp-80
	# _tmp19 = _tmp9 * _tmp18
	  lw $t0, -44($fp)	# fill _tmp9 to $t0 from $fp-44
	  lw $t1, -80($fp)	# fill _tmp18 to $t1 from $fp-80
	  mul $t2, $t0, $t1	
	  sw $t2, -84($fp)	# spill _tmp19 from $t2 to $fp-84
	# _tmp20 = _tmp8 + _tmp19
	  lw $t0, -40($fp)	# fill _tmp8 to $t0 from $fp-40
	  lw $t1, -84($fp)	# fill _tmp19 to $t1 from $fp-84
	  add $t2, $t0, $t1	
	  sw $t2, -88($fp)	# spill _tmp20 from $t2 to $fp-88
	# _tmp21 = _tmp20 + _tmp18
	  lw $t0, -88($fp)	# fill _tmp20 to $t0 from $fp-88
	  lw $t1, -80($fp)	# fill _tmp18 to $t1 from $fp-80
	  add $t2, $t0, $t1	
	  sw $t2, -92($fp)	# spill _tmp21 from $t2 to $fp-92
	# _tmp22 = *(_tmp21)
	  lw $t0, -92($fp)	# fill _tmp21 to $t0 from $fp-92
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -96($fp)	# spill _tmp22 from $t2 to $fp-96
	# _tmp23 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -100($fp)	# spill _tmp23 from $t2 to $fp-100
	# _tmp24 = *(_tmp22)
	  lw $t0, -96($fp)	# fill _tmp22 to $t0 from $fp-96
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -104($fp)	# spill _tmp24 from $t2 to $fp-104
	# _tmp25 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -108($fp)	# spill _tmp25 from $t2 to $fp-108
	# _tmp26 = _tmp23 < _tmp25
	  lw $t0, -100($fp)	# fill _tmp23 to $t0 from $fp-100
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
	# _tmp29 = _tmp28 < _tmp23
	  lw $t0, -120($fp)	# fill _tmp28 to $t0 from $fp-120
	  lw $t1, -100($fp)	# fill _tmp23 to $t1 from $fp-100
	  slt $t2, $t0, $t1	
	  sw $t2, -124($fp)	# spill _tmp29 from $t2 to $fp-124
	# _tmp30 = _tmp26 || _tmp29
	  lw $t0, -112($fp)	# fill _tmp26 to $t0 from $fp-112
	  lw $t1, -124($fp)	# fill _tmp29 to $t1 from $fp-124
	  or $t2, $t0, $t1	
	  sw $t2, -128($fp)	# spill _tmp30 from $t2 to $fp-128
	# IfZ _tmp30 Goto arrayAcc_114
	  lw $t0, -128($fp)	# fill _tmp30 to $t0 from $fp-128
	  beqz $t0, arrayAcc_114	# branch if _tmp30 is zero 
	# _tmp31 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string80: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string80	# load label
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
  arrayAcc_114:
	# _tmp32 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -136($fp)	# spill _tmp32 from $t2 to $fp-136
	# _tmp33 = _tmp23 * _tmp32
	  lw $t0, -100($fp)	# fill _tmp23 to $t0 from $fp-100
	  lw $t1, -136($fp)	# fill _tmp32 to $t1 from $fp-136
	  mul $t2, $t0, $t1	
	  sw $t2, -140($fp)	# spill _tmp33 from $t2 to $fp-140
	# _tmp34 = _tmp22 + _tmp33
	  lw $t0, -96($fp)	# fill _tmp22 to $t0 from $fp-96
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
	# _tmp38 = *(_tmp37 + 20)
	  lw $t0, -156($fp)	# fill _tmp37 to $t0 from $fp-156
	  lw $t2, 20($t0) 	# load with offset
	  sw $t2, -160($fp)	# spill _tmp38 from $t2 to $fp-160
	# PushParam enemyMark
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, 8($fp)	# fill enemyMark to $t0 from $fp+8
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam _tmp36
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -152($fp)	# fill _tmp36 to $t0 from $fp-152
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp39 = ACall _tmp38
	  lw $t0, -160($fp)	# fill _tmp38 to $t0 from $fp-160
	  jalr $t0            	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -164($fp)	# spill _tmp39 from $t2 to $fp-164
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# _tmp40 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -168($fp)	# spill _tmp40 from $t2 to $fp-168
	# _tmp41 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -172($fp)	# spill _tmp41 from $t2 to $fp-172
	# _tmp42 = *(_tmp40)
	  lw $t0, -168($fp)	# fill _tmp40 to $t0 from $fp-168
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -176($fp)	# spill _tmp42 from $t2 to $fp-176
	# _tmp43 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -180($fp)	# spill _tmp43 from $t2 to $fp-180
	# _tmp44 = _tmp41 < _tmp43
	  lw $t0, -172($fp)	# fill _tmp41 to $t0 from $fp-172
	  lw $t1, -180($fp)	# fill _tmp43 to $t1 from $fp-180
	  slt $t2, $t0, $t1	
	  sw $t2, -184($fp)	# spill _tmp44 from $t2 to $fp-184
	# _tmp45 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -188($fp)	# spill _tmp45 from $t2 to $fp-188
	# _tmp46 = _tmp42 - _tmp45
	  lw $t0, -176($fp)	# fill _tmp42 to $t0 from $fp-176
	  lw $t1, -188($fp)	# fill _tmp45 to $t1 from $fp-188
	  sub $t2, $t0, $t1	
	  sw $t2, -192($fp)	# spill _tmp46 from $t2 to $fp-192
	# _tmp47 = _tmp46 < _tmp41
	  lw $t0, -192($fp)	# fill _tmp46 to $t0 from $fp-192
	  lw $t1, -172($fp)	# fill _tmp41 to $t1 from $fp-172
	  slt $t2, $t0, $t1	
	  sw $t2, -196($fp)	# spill _tmp47 from $t2 to $fp-196
	# _tmp48 = _tmp44 || _tmp47
	  lw $t0, -184($fp)	# fill _tmp44 to $t0 from $fp-184
	  lw $t1, -196($fp)	# fill _tmp47 to $t1 from $fp-196
	  or $t2, $t0, $t1	
	  sw $t2, -200($fp)	# spill _tmp48 from $t2 to $fp-200
	# IfZ _tmp48 Goto arrayAcc_115
	  lw $t0, -200($fp)	# fill _tmp48 to $t0 from $fp-200
	  beqz $t0, arrayAcc_115	# branch if _tmp48 is zero 
	# _tmp49 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string81: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string81	# load label
	  sw $t2, -204($fp)	# spill _tmp49 from $t2 to $fp-204
	# PushParam _tmp49
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -204($fp)	# fill _tmp49 to $t0 from $fp-204
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_115:
	# _tmp50 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -208($fp)	# spill _tmp50 from $t2 to $fp-208
	# _tmp51 = _tmp41 * _tmp50
	  lw $t0, -172($fp)	# fill _tmp41 to $t0 from $fp-172
	  lw $t1, -208($fp)	# fill _tmp50 to $t1 from $fp-208
	  mul $t2, $t0, $t1	
	  sw $t2, -212($fp)	# spill _tmp51 from $t2 to $fp-212
	# _tmp52 = _tmp40 + _tmp51
	  lw $t0, -168($fp)	# fill _tmp40 to $t0 from $fp-168
	  lw $t1, -212($fp)	# fill _tmp51 to $t1 from $fp-212
	  add $t2, $t0, $t1	
	  sw $t2, -216($fp)	# spill _tmp52 from $t2 to $fp-216
	# _tmp53 = _tmp52 + _tmp50
	  lw $t0, -216($fp)	# fill _tmp52 to $t0 from $fp-216
	  lw $t1, -208($fp)	# fill _tmp50 to $t1 from $fp-208
	  add $t2, $t0, $t1	
	  sw $t2, -220($fp)	# spill _tmp53 from $t2 to $fp-220
	# _tmp54 = *(_tmp53)
	  lw $t0, -220($fp)	# fill _tmp53 to $t0 from $fp-220
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -224($fp)	# spill _tmp54 from $t2 to $fp-224
	# _tmp55 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -228($fp)	# spill _tmp55 from $t2 to $fp-228
	# _tmp56 = *(_tmp54)
	  lw $t0, -224($fp)	# fill _tmp54 to $t0 from $fp-224
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -232($fp)	# spill _tmp56 from $t2 to $fp-232
	# _tmp57 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -236($fp)	# spill _tmp57 from $t2 to $fp-236
	# _tmp58 = _tmp55 < _tmp57
	  lw $t0, -228($fp)	# fill _tmp55 to $t0 from $fp-228
	  lw $t1, -236($fp)	# fill _tmp57 to $t1 from $fp-236
	  slt $t2, $t0, $t1	
	  sw $t2, -240($fp)	# spill _tmp58 from $t2 to $fp-240
	# _tmp59 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -244($fp)	# spill _tmp59 from $t2 to $fp-244
	# _tmp60 = _tmp56 - _tmp59
	  lw $t0, -232($fp)	# fill _tmp56 to $t0 from $fp-232
	  lw $t1, -244($fp)	# fill _tmp59 to $t1 from $fp-244
	  sub $t2, $t0, $t1	
	  sw $t2, -248($fp)	# spill _tmp60 from $t2 to $fp-248
	# _tmp61 = _tmp60 < _tmp55
	  lw $t0, -248($fp)	# fill _tmp60 to $t0 from $fp-248
	  lw $t1, -228($fp)	# fill _tmp55 to $t1 from $fp-228
	  slt $t2, $t0, $t1	
	  sw $t2, -252($fp)	# spill _tmp61 from $t2 to $fp-252
	# _tmp62 = _tmp58 || _tmp61
	  lw $t0, -240($fp)	# fill _tmp58 to $t0 from $fp-240
	  lw $t1, -252($fp)	# fill _tmp61 to $t1 from $fp-252
	  or $t2, $t0, $t1	
	  sw $t2, -256($fp)	# spill _tmp62 from $t2 to $fp-256
	# IfZ _tmp62 Goto arrayAcc_116
	  lw $t0, -256($fp)	# fill _tmp62 to $t0 from $fp-256
	  beqz $t0, arrayAcc_116	# branch if _tmp62 is zero 
	# _tmp63 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string82: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string82	# load label
	  sw $t2, -260($fp)	# spill _tmp63 from $t2 to $fp-260
	# PushParam _tmp63
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -260($fp)	# fill _tmp63 to $t0 from $fp-260
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_116:
	# _tmp64 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -264($fp)	# spill _tmp64 from $t2 to $fp-264
	# _tmp65 = _tmp55 * _tmp64
	  lw $t0, -228($fp)	# fill _tmp55 to $t0 from $fp-228
	  lw $t1, -264($fp)	# fill _tmp64 to $t1 from $fp-264
	  mul $t2, $t0, $t1	
	  sw $t2, -268($fp)	# spill _tmp65 from $t2 to $fp-268
	# _tmp66 = _tmp54 + _tmp65
	  lw $t0, -224($fp)	# fill _tmp54 to $t0 from $fp-224
	  lw $t1, -268($fp)	# fill _tmp65 to $t1 from $fp-268
	  add $t2, $t0, $t1	
	  sw $t2, -272($fp)	# spill _tmp66 from $t2 to $fp-272
	# _tmp67 = _tmp66 + _tmp64
	  lw $t0, -272($fp)	# fill _tmp66 to $t0 from $fp-272
	  lw $t1, -264($fp)	# fill _tmp64 to $t1 from $fp-264
	  add $t2, $t0, $t1	
	  sw $t2, -276($fp)	# spill _tmp67 from $t2 to $fp-276
	# _tmp68 = *(_tmp67)
	  lw $t0, -276($fp)	# fill _tmp67 to $t0 from $fp-276
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -280($fp)	# spill _tmp68 from $t2 to $fp-280
	# _tmp69 = *(_tmp68)
	  lw $t0, -280($fp)	# fill _tmp68 to $t0 from $fp-280
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -284($fp)	# spill _tmp69 from $t2 to $fp-284
	# _tmp70 = *(_tmp69 + 20)
	  lw $t0, -284($fp)	# fill _tmp69 to $t0 from $fp-284
	  lw $t2, 20($t0) 	# load with offset
	  sw $t2, -288($fp)	# spill _tmp70 from $t2 to $fp-288
	# PushParam enemyMark
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, 8($fp)	# fill enemyMark to $t0 from $fp+8
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam _tmp68
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -280($fp)	# fill _tmp68 to $t0 from $fp-280
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp71 = ACall _tmp70
	  lw $t0, -288($fp)	# fill _tmp70 to $t0 from $fp-288
	  jalr $t0            	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -292($fp)	# spill _tmp71 from $t2 to $fp-292
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# _tmp72 = _tmp39 && _tmp71
	  lw $t0, -164($fp)	# fill _tmp39 to $t0 from $fp-164
	  lw $t1, -292($fp)	# fill _tmp71 to $t1 from $fp-292
	  and $t2, $t0, $t1	
	  sw $t2, -296($fp)	# spill _tmp72 from $t2 to $fp-296
	# _tmp73 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -300($fp)	# spill _tmp73 from $t2 to $fp-300
	# _tmp74 = 0
	  li $t2, 0		# load constant value 0 into $t2
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
	# IfZ _tmp81 Goto arrayAcc_117
	  lw $t0, -332($fp)	# fill _tmp81 to $t0 from $fp-332
	  beqz $t0, arrayAcc_117	# branch if _tmp81 is zero 
	# _tmp82 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string83: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string83	# load label
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
  arrayAcc_117:
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
	# _tmp87 = *(_tmp86)
	  lw $t0, -352($fp)	# fill _tmp86 to $t0 from $fp-352
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -356($fp)	# spill _tmp87 from $t2 to $fp-356
	# _tmp88 = 2
	  li $t2, 2		# load constant value 2 into $t2
	  sw $t2, -360($fp)	# spill _tmp88 from $t2 to $fp-360
	# _tmp89 = *(_tmp87)
	  lw $t0, -356($fp)	# fill _tmp87 to $t0 from $fp-356
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -364($fp)	# spill _tmp89 from $t2 to $fp-364
	# _tmp90 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -368($fp)	# spill _tmp90 from $t2 to $fp-368
	# _tmp91 = _tmp88 < _tmp90
	  lw $t0, -360($fp)	# fill _tmp88 to $t0 from $fp-360
	  lw $t1, -368($fp)	# fill _tmp90 to $t1 from $fp-368
	  slt $t2, $t0, $t1	
	  sw $t2, -372($fp)	# spill _tmp91 from $t2 to $fp-372
	# _tmp92 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -376($fp)	# spill _tmp92 from $t2 to $fp-376
	# _tmp93 = _tmp89 - _tmp92
	  lw $t0, -364($fp)	# fill _tmp89 to $t0 from $fp-364
	  lw $t1, -376($fp)	# fill _tmp92 to $t1 from $fp-376
	  sub $t2, $t0, $t1	
	  sw $t2, -380($fp)	# spill _tmp93 from $t2 to $fp-380
	# _tmp94 = _tmp93 < _tmp88
	  lw $t0, -380($fp)	# fill _tmp93 to $t0 from $fp-380
	  lw $t1, -360($fp)	# fill _tmp88 to $t1 from $fp-360
	  slt $t2, $t0, $t1	
	  sw $t2, -384($fp)	# spill _tmp94 from $t2 to $fp-384
	# _tmp95 = _tmp91 || _tmp94
	  lw $t0, -372($fp)	# fill _tmp91 to $t0 from $fp-372
	  lw $t1, -384($fp)	# fill _tmp94 to $t1 from $fp-384
	  or $t2, $t0, $t1	
	  sw $t2, -388($fp)	# spill _tmp95 from $t2 to $fp-388
	# IfZ _tmp95 Goto arrayAcc_118
	  lw $t0, -388($fp)	# fill _tmp95 to $t0 from $fp-388
	  beqz $t0, arrayAcc_118	# branch if _tmp95 is zero 
	# _tmp96 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string84: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string84	# load label
	  sw $t2, -392($fp)	# spill _tmp96 from $t2 to $fp-392
	# PushParam _tmp96
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -392($fp)	# fill _tmp96 to $t0 from $fp-392
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_118:
	# _tmp97 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -396($fp)	# spill _tmp97 from $t2 to $fp-396
	# _tmp98 = _tmp88 * _tmp97
	  lw $t0, -360($fp)	# fill _tmp88 to $t0 from $fp-360
	  lw $t1, -396($fp)	# fill _tmp97 to $t1 from $fp-396
	  mul $t2, $t0, $t1	
	  sw $t2, -400($fp)	# spill _tmp98 from $t2 to $fp-400
	# _tmp99 = _tmp87 + _tmp98
	  lw $t0, -356($fp)	# fill _tmp87 to $t0 from $fp-356
	  lw $t1, -400($fp)	# fill _tmp98 to $t1 from $fp-400
	  add $t2, $t0, $t1	
	  sw $t2, -404($fp)	# spill _tmp99 from $t2 to $fp-404
	# _tmp100 = _tmp99 + _tmp97
	  lw $t0, -404($fp)	# fill _tmp99 to $t0 from $fp-404
	  lw $t1, -396($fp)	# fill _tmp97 to $t1 from $fp-396
	  add $t2, $t0, $t1	
	  sw $t2, -408($fp)	# spill _tmp100 from $t2 to $fp-408
	# _tmp101 = *(_tmp100)
	  lw $t0, -408($fp)	# fill _tmp100 to $t0 from $fp-408
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -412($fp)	# spill _tmp101 from $t2 to $fp-412
	# _tmp102 = *(_tmp101)
	  lw $t0, -412($fp)	# fill _tmp101 to $t0 from $fp-412
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -416($fp)	# spill _tmp102 from $t2 to $fp-416
	# _tmp103 = *(_tmp102 + 20)
	  lw $t0, -416($fp)	# fill _tmp102 to $t0 from $fp-416
	  lw $t2, 20($t0) 	# load with offset
	  sw $t2, -420($fp)	# spill _tmp103 from $t2 to $fp-420
	# PushParam playerMark
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, 12($fp)	# fill playerMark to $t0 from $fp+12
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam _tmp101
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -412($fp)	# fill _tmp101 to $t0 from $fp-412
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp104 = ACall _tmp103
	  lw $t0, -420($fp)	# fill _tmp103 to $t0 from $fp-420
	  jalr $t0            	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -424($fp)	# spill _tmp104 from $t2 to $fp-424
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# _tmp105 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -428($fp)	# spill _tmp105 from $t2 to $fp-428
	# _tmp106 = _tmp104 == _tmp105
	  lw $t0, -424($fp)	# fill _tmp104 to $t0 from $fp-424
	  lw $t1, -428($fp)	# fill _tmp105 to $t1 from $fp-428
	  seq $t2, $t0, $t1	
	  sw $t2, -432($fp)	# spill _tmp106 from $t2 to $fp-432
	# _tmp107 = _tmp72 && _tmp106
	  lw $t0, -296($fp)	# fill _tmp72 to $t0 from $fp-296
	  lw $t1, -432($fp)	# fill _tmp106 to $t1 from $fp-432
	  and $t2, $t0, $t1	
	  sw $t2, -436($fp)	# spill _tmp107 from $t2 to $fp-436
	# IfZ _tmp107 Goto else_119
	  lw $t0, -436($fp)	# fill _tmp107 to $t0 from $fp-436
	  beqz $t0, else_119	# branch if _tmp107 is zero 
	# _tmp108 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -440($fp)	# spill _tmp108 from $t2 to $fp-440
	# row = _tmp108
	  lw $t2, -440($fp)	# fill _tmp108 to $t2 from $fp-440
	  sw $t2, -8($fp)	# spill row from $t2 to $fp-8
	# _tmp109 = 2
	  li $t2, 2		# load constant value 2 into $t2
	  sw $t2, -444($fp)	# spill _tmp109 from $t2 to $fp-444
	# column = _tmp109
	  lw $t2, -444($fp)	# fill _tmp109 to $t2 from $fp-444
	  sw $t2, -12($fp)	# spill column from $t2 to $fp-12
	# Goto endif_120
	  b endif_120		# unconditional branch
  else_119:
	# _tmp110 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -448($fp)	# spill _tmp110 from $t2 to $fp-448
	# _tmp111 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -452($fp)	# spill _tmp111 from $t2 to $fp-452
	# _tmp112 = *(_tmp110)
	  lw $t0, -448($fp)	# fill _tmp110 to $t0 from $fp-448
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -456($fp)	# spill _tmp112 from $t2 to $fp-456
	# _tmp113 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -460($fp)	# spill _tmp113 from $t2 to $fp-460
	# _tmp114 = _tmp111 < _tmp113
	  lw $t0, -452($fp)	# fill _tmp111 to $t0 from $fp-452
	  lw $t1, -460($fp)	# fill _tmp113 to $t1 from $fp-460
	  slt $t2, $t0, $t1	
	  sw $t2, -464($fp)	# spill _tmp114 from $t2 to $fp-464
	# _tmp115 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -468($fp)	# spill _tmp115 from $t2 to $fp-468
	# _tmp116 = _tmp112 - _tmp115
	  lw $t0, -456($fp)	# fill _tmp112 to $t0 from $fp-456
	  lw $t1, -468($fp)	# fill _tmp115 to $t1 from $fp-468
	  sub $t2, $t0, $t1	
	  sw $t2, -472($fp)	# spill _tmp116 from $t2 to $fp-472
	# _tmp117 = _tmp116 < _tmp111
	  lw $t0, -472($fp)	# fill _tmp116 to $t0 from $fp-472
	  lw $t1, -452($fp)	# fill _tmp111 to $t1 from $fp-452
	  slt $t2, $t0, $t1	
	  sw $t2, -476($fp)	# spill _tmp117 from $t2 to $fp-476
	# _tmp118 = _tmp114 || _tmp117
	  lw $t0, -464($fp)	# fill _tmp114 to $t0 from $fp-464
	  lw $t1, -476($fp)	# fill _tmp117 to $t1 from $fp-476
	  or $t2, $t0, $t1	
	  sw $t2, -480($fp)	# spill _tmp118 from $t2 to $fp-480
	# IfZ _tmp118 Goto arrayAcc_121
	  lw $t0, -480($fp)	# fill _tmp118 to $t0 from $fp-480
	  beqz $t0, arrayAcc_121	# branch if _tmp118 is zero 
	# _tmp119 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string85: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string85	# load label
	  sw $t2, -484($fp)	# spill _tmp119 from $t2 to $fp-484
	# PushParam _tmp119
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -484($fp)	# fill _tmp119 to $t0 from $fp-484
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_121:
	# _tmp120 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -488($fp)	# spill _tmp120 from $t2 to $fp-488
	# _tmp121 = _tmp111 * _tmp120
	  lw $t0, -452($fp)	# fill _tmp111 to $t0 from $fp-452
	  lw $t1, -488($fp)	# fill _tmp120 to $t1 from $fp-488
	  mul $t2, $t0, $t1	
	  sw $t2, -492($fp)	# spill _tmp121 from $t2 to $fp-492
	# _tmp122 = _tmp110 + _tmp121
	  lw $t0, -448($fp)	# fill _tmp110 to $t0 from $fp-448
	  lw $t1, -492($fp)	# fill _tmp121 to $t1 from $fp-492
	  add $t2, $t0, $t1	
	  sw $t2, -496($fp)	# spill _tmp122 from $t2 to $fp-496
	# _tmp123 = _tmp122 + _tmp120
	  lw $t0, -496($fp)	# fill _tmp122 to $t0 from $fp-496
	  lw $t1, -488($fp)	# fill _tmp120 to $t1 from $fp-488
	  add $t2, $t0, $t1	
	  sw $t2, -500($fp)	# spill _tmp123 from $t2 to $fp-500
	# _tmp124 = *(_tmp123)
	  lw $t0, -500($fp)	# fill _tmp123 to $t0 from $fp-500
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -504($fp)	# spill _tmp124 from $t2 to $fp-504
	# _tmp125 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -508($fp)	# spill _tmp125 from $t2 to $fp-508
	# _tmp126 = *(_tmp124)
	  lw $t0, -504($fp)	# fill _tmp124 to $t0 from $fp-504
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -512($fp)	# spill _tmp126 from $t2 to $fp-512
	# _tmp127 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -516($fp)	# spill _tmp127 from $t2 to $fp-516
	# _tmp128 = _tmp125 < _tmp127
	  lw $t0, -508($fp)	# fill _tmp125 to $t0 from $fp-508
	  lw $t1, -516($fp)	# fill _tmp127 to $t1 from $fp-516
	  slt $t2, $t0, $t1	
	  sw $t2, -520($fp)	# spill _tmp128 from $t2 to $fp-520
	# _tmp129 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -524($fp)	# spill _tmp129 from $t2 to $fp-524
	# _tmp130 = _tmp126 - _tmp129
	  lw $t0, -512($fp)	# fill _tmp126 to $t0 from $fp-512
	  lw $t1, -524($fp)	# fill _tmp129 to $t1 from $fp-524
	  sub $t2, $t0, $t1	
	  sw $t2, -528($fp)	# spill _tmp130 from $t2 to $fp-528
	# _tmp131 = _tmp130 < _tmp125
	  lw $t0, -528($fp)	# fill _tmp130 to $t0 from $fp-528
	  lw $t1, -508($fp)	# fill _tmp125 to $t1 from $fp-508
	  slt $t2, $t0, $t1	
	  sw $t2, -532($fp)	# spill _tmp131 from $t2 to $fp-532
	# _tmp132 = _tmp128 || _tmp131
	  lw $t0, -520($fp)	# fill _tmp128 to $t0 from $fp-520
	  lw $t1, -532($fp)	# fill _tmp131 to $t1 from $fp-532
	  or $t2, $t0, $t1	
	  sw $t2, -536($fp)	# spill _tmp132 from $t2 to $fp-536
	# IfZ _tmp132 Goto arrayAcc_122
	  lw $t0, -536($fp)	# fill _tmp132 to $t0 from $fp-536
	  beqz $t0, arrayAcc_122	# branch if _tmp132 is zero 
	# _tmp133 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string86: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string86	# load label
	  sw $t2, -540($fp)	# spill _tmp133 from $t2 to $fp-540
	# PushParam _tmp133
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -540($fp)	# fill _tmp133 to $t0 from $fp-540
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_122:
	# _tmp134 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -544($fp)	# spill _tmp134 from $t2 to $fp-544
	# _tmp135 = _tmp125 * _tmp134
	  lw $t0, -508($fp)	# fill _tmp125 to $t0 from $fp-508
	  lw $t1, -544($fp)	# fill _tmp134 to $t1 from $fp-544
	  mul $t2, $t0, $t1	
	  sw $t2, -548($fp)	# spill _tmp135 from $t2 to $fp-548
	# _tmp136 = _tmp124 + _tmp135
	  lw $t0, -504($fp)	# fill _tmp124 to $t0 from $fp-504
	  lw $t1, -548($fp)	# fill _tmp135 to $t1 from $fp-548
	  add $t2, $t0, $t1	
	  sw $t2, -552($fp)	# spill _tmp136 from $t2 to $fp-552
	# _tmp137 = _tmp136 + _tmp134
	  lw $t0, -552($fp)	# fill _tmp136 to $t0 from $fp-552
	  lw $t1, -544($fp)	# fill _tmp134 to $t1 from $fp-544
	  add $t2, $t0, $t1	
	  sw $t2, -556($fp)	# spill _tmp137 from $t2 to $fp-556
	# _tmp138 = *(_tmp137)
	  lw $t0, -556($fp)	# fill _tmp137 to $t0 from $fp-556
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -560($fp)	# spill _tmp138 from $t2 to $fp-560
	# _tmp139 = *(_tmp138)
	  lw $t0, -560($fp)	# fill _tmp138 to $t0 from $fp-560
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -564($fp)	# spill _tmp139 from $t2 to $fp-564
	# _tmp140 = *(_tmp139 + 20)
	  lw $t0, -564($fp)	# fill _tmp139 to $t0 from $fp-564
	  lw $t2, 20($t0) 	# load with offset
	  sw $t2, -568($fp)	# spill _tmp140 from $t2 to $fp-568
	# PushParam enemyMark
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, 8($fp)	# fill enemyMark to $t0 from $fp+8
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam _tmp138
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -560($fp)	# fill _tmp138 to $t0 from $fp-560
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp141 = ACall _tmp140
	  lw $t0, -568($fp)	# fill _tmp140 to $t0 from $fp-568
	  jalr $t0            	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -572($fp)	# spill _tmp141 from $t2 to $fp-572
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# _tmp142 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -576($fp)	# spill _tmp142 from $t2 to $fp-576
	# _tmp143 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -580($fp)	# spill _tmp143 from $t2 to $fp-580
	# _tmp144 = *(_tmp142)
	  lw $t0, -576($fp)	# fill _tmp142 to $t0 from $fp-576
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -584($fp)	# spill _tmp144 from $t2 to $fp-584
	# _tmp145 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -588($fp)	# spill _tmp145 from $t2 to $fp-588
	# _tmp146 = _tmp143 < _tmp145
	  lw $t0, -580($fp)	# fill _tmp143 to $t0 from $fp-580
	  lw $t1, -588($fp)	# fill _tmp145 to $t1 from $fp-588
	  slt $t2, $t0, $t1	
	  sw $t2, -592($fp)	# spill _tmp146 from $t2 to $fp-592
	# _tmp147 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -596($fp)	# spill _tmp147 from $t2 to $fp-596
	# _tmp148 = _tmp144 - _tmp147
	  lw $t0, -584($fp)	# fill _tmp144 to $t0 from $fp-584
	  lw $t1, -596($fp)	# fill _tmp147 to $t1 from $fp-596
	  sub $t2, $t0, $t1	
	  sw $t2, -600($fp)	# spill _tmp148 from $t2 to $fp-600
	# _tmp149 = _tmp148 < _tmp143
	  lw $t0, -600($fp)	# fill _tmp148 to $t0 from $fp-600
	  lw $t1, -580($fp)	# fill _tmp143 to $t1 from $fp-580
	  slt $t2, $t0, $t1	
	  sw $t2, -604($fp)	# spill _tmp149 from $t2 to $fp-604
	# _tmp150 = _tmp146 || _tmp149
	  lw $t0, -592($fp)	# fill _tmp146 to $t0 from $fp-592
	  lw $t1, -604($fp)	# fill _tmp149 to $t1 from $fp-604
	  or $t2, $t0, $t1	
	  sw $t2, -608($fp)	# spill _tmp150 from $t2 to $fp-608
	# IfZ _tmp150 Goto arrayAcc_123
	  lw $t0, -608($fp)	# fill _tmp150 to $t0 from $fp-608
	  beqz $t0, arrayAcc_123	# branch if _tmp150 is zero 
	# _tmp151 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string87: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string87	# load label
	  sw $t2, -612($fp)	# spill _tmp151 from $t2 to $fp-612
	# PushParam _tmp151
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -612($fp)	# fill _tmp151 to $t0 from $fp-612
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_123:
	# _tmp152 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -616($fp)	# spill _tmp152 from $t2 to $fp-616
	# _tmp153 = _tmp143 * _tmp152
	  lw $t0, -580($fp)	# fill _tmp143 to $t0 from $fp-580
	  lw $t1, -616($fp)	# fill _tmp152 to $t1 from $fp-616
	  mul $t2, $t0, $t1	
	  sw $t2, -620($fp)	# spill _tmp153 from $t2 to $fp-620
	# _tmp154 = _tmp142 + _tmp153
	  lw $t0, -576($fp)	# fill _tmp142 to $t0 from $fp-576
	  lw $t1, -620($fp)	# fill _tmp153 to $t1 from $fp-620
	  add $t2, $t0, $t1	
	  sw $t2, -624($fp)	# spill _tmp154 from $t2 to $fp-624
	# _tmp155 = _tmp154 + _tmp152
	  lw $t0, -624($fp)	# fill _tmp154 to $t0 from $fp-624
	  lw $t1, -616($fp)	# fill _tmp152 to $t1 from $fp-616
	  add $t2, $t0, $t1	
	  sw $t2, -628($fp)	# spill _tmp155 from $t2 to $fp-628
	# _tmp156 = *(_tmp155)
	  lw $t0, -628($fp)	# fill _tmp155 to $t0 from $fp-628
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -632($fp)	# spill _tmp156 from $t2 to $fp-632
	# _tmp157 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -636($fp)	# spill _tmp157 from $t2 to $fp-636
	# _tmp158 = *(_tmp156)
	  lw $t0, -632($fp)	# fill _tmp156 to $t0 from $fp-632
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -640($fp)	# spill _tmp158 from $t2 to $fp-640
	# _tmp159 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -644($fp)	# spill _tmp159 from $t2 to $fp-644
	# _tmp160 = _tmp157 < _tmp159
	  lw $t0, -636($fp)	# fill _tmp157 to $t0 from $fp-636
	  lw $t1, -644($fp)	# fill _tmp159 to $t1 from $fp-644
	  slt $t2, $t0, $t1	
	  sw $t2, -648($fp)	# spill _tmp160 from $t2 to $fp-648
	# _tmp161 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -652($fp)	# spill _tmp161 from $t2 to $fp-652
	# _tmp162 = _tmp158 - _tmp161
	  lw $t0, -640($fp)	# fill _tmp158 to $t0 from $fp-640
	  lw $t1, -652($fp)	# fill _tmp161 to $t1 from $fp-652
	  sub $t2, $t0, $t1	
	  sw $t2, -656($fp)	# spill _tmp162 from $t2 to $fp-656
	# _tmp163 = _tmp162 < _tmp157
	  lw $t0, -656($fp)	# fill _tmp162 to $t0 from $fp-656
	  lw $t1, -636($fp)	# fill _tmp157 to $t1 from $fp-636
	  slt $t2, $t0, $t1	
	  sw $t2, -660($fp)	# spill _tmp163 from $t2 to $fp-660
	# _tmp164 = _tmp160 || _tmp163
	  lw $t0, -648($fp)	# fill _tmp160 to $t0 from $fp-648
	  lw $t1, -660($fp)	# fill _tmp163 to $t1 from $fp-660
	  or $t2, $t0, $t1	
	  sw $t2, -664($fp)	# spill _tmp164 from $t2 to $fp-664
	# IfZ _tmp164 Goto arrayAcc_124
	  lw $t0, -664($fp)	# fill _tmp164 to $t0 from $fp-664
	  beqz $t0, arrayAcc_124	# branch if _tmp164 is zero 
	# _tmp165 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string88: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string88	# load label
	  sw $t2, -668($fp)	# spill _tmp165 from $t2 to $fp-668
	# PushParam _tmp165
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -668($fp)	# fill _tmp165 to $t0 from $fp-668
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_124:
	# _tmp166 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -672($fp)	# spill _tmp166 from $t2 to $fp-672
	# _tmp167 = _tmp157 * _tmp166
	  lw $t0, -636($fp)	# fill _tmp157 to $t0 from $fp-636
	  lw $t1, -672($fp)	# fill _tmp166 to $t1 from $fp-672
	  mul $t2, $t0, $t1	
	  sw $t2, -676($fp)	# spill _tmp167 from $t2 to $fp-676
	# _tmp168 = _tmp156 + _tmp167
	  lw $t0, -632($fp)	# fill _tmp156 to $t0 from $fp-632
	  lw $t1, -676($fp)	# fill _tmp167 to $t1 from $fp-676
	  add $t2, $t0, $t1	
	  sw $t2, -680($fp)	# spill _tmp168 from $t2 to $fp-680
	# _tmp169 = _tmp168 + _tmp166
	  lw $t0, -680($fp)	# fill _tmp168 to $t0 from $fp-680
	  lw $t1, -672($fp)	# fill _tmp166 to $t1 from $fp-672
	  add $t2, $t0, $t1	
	  sw $t2, -684($fp)	# spill _tmp169 from $t2 to $fp-684
	# _tmp170 = *(_tmp169)
	  lw $t0, -684($fp)	# fill _tmp169 to $t0 from $fp-684
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -688($fp)	# spill _tmp170 from $t2 to $fp-688
	# _tmp171 = *(_tmp170)
	  lw $t0, -688($fp)	# fill _tmp170 to $t0 from $fp-688
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -692($fp)	# spill _tmp171 from $t2 to $fp-692
	# _tmp172 = *(_tmp171 + 20)
	  lw $t0, -692($fp)	# fill _tmp171 to $t0 from $fp-692
	  lw $t2, 20($t0) 	# load with offset
	  sw $t2, -696($fp)	# spill _tmp172 from $t2 to $fp-696
	# PushParam enemyMark
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, 8($fp)	# fill enemyMark to $t0 from $fp+8
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam _tmp170
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -688($fp)	# fill _tmp170 to $t0 from $fp-688
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp173 = ACall _tmp172
	  lw $t0, -696($fp)	# fill _tmp172 to $t0 from $fp-696
	  jalr $t0            	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -700($fp)	# spill _tmp173 from $t2 to $fp-700
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# _tmp174 = _tmp141 && _tmp173
	  lw $t0, -572($fp)	# fill _tmp141 to $t0 from $fp-572
	  lw $t1, -700($fp)	# fill _tmp173 to $t1 from $fp-700
	  and $t2, $t0, $t1	
	  sw $t2, -704($fp)	# spill _tmp174 from $t2 to $fp-704
	# _tmp175 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -708($fp)	# spill _tmp175 from $t2 to $fp-708
	# _tmp176 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -712($fp)	# spill _tmp176 from $t2 to $fp-712
	# _tmp177 = *(_tmp175)
	  lw $t0, -708($fp)	# fill _tmp175 to $t0 from $fp-708
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -716($fp)	# spill _tmp177 from $t2 to $fp-716
	# _tmp178 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -720($fp)	# spill _tmp178 from $t2 to $fp-720
	# _tmp179 = _tmp176 < _tmp178
	  lw $t0, -712($fp)	# fill _tmp176 to $t0 from $fp-712
	  lw $t1, -720($fp)	# fill _tmp178 to $t1 from $fp-720
	  slt $t2, $t0, $t1	
	  sw $t2, -724($fp)	# spill _tmp179 from $t2 to $fp-724
	# _tmp180 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -728($fp)	# spill _tmp180 from $t2 to $fp-728
	# _tmp181 = _tmp177 - _tmp180
	  lw $t0, -716($fp)	# fill _tmp177 to $t0 from $fp-716
	  lw $t1, -728($fp)	# fill _tmp180 to $t1 from $fp-728
	  sub $t2, $t0, $t1	
	  sw $t2, -732($fp)	# spill _tmp181 from $t2 to $fp-732
	# _tmp182 = _tmp181 < _tmp176
	  lw $t0, -732($fp)	# fill _tmp181 to $t0 from $fp-732
	  lw $t1, -712($fp)	# fill _tmp176 to $t1 from $fp-712
	  slt $t2, $t0, $t1	
	  sw $t2, -736($fp)	# spill _tmp182 from $t2 to $fp-736
	# _tmp183 = _tmp179 || _tmp182
	  lw $t0, -724($fp)	# fill _tmp179 to $t0 from $fp-724
	  lw $t1, -736($fp)	# fill _tmp182 to $t1 from $fp-736
	  or $t2, $t0, $t1	
	  sw $t2, -740($fp)	# spill _tmp183 from $t2 to $fp-740
	# IfZ _tmp183 Goto arrayAcc_125
	  lw $t0, -740($fp)	# fill _tmp183 to $t0 from $fp-740
	  beqz $t0, arrayAcc_125	# branch if _tmp183 is zero 
	# _tmp184 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string89: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string89	# load label
	  sw $t2, -744($fp)	# spill _tmp184 from $t2 to $fp-744
	# PushParam _tmp184
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -744($fp)	# fill _tmp184 to $t0 from $fp-744
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_125:
	# _tmp185 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -748($fp)	# spill _tmp185 from $t2 to $fp-748
	# _tmp186 = _tmp176 * _tmp185
	  lw $t0, -712($fp)	# fill _tmp176 to $t0 from $fp-712
	  lw $t1, -748($fp)	# fill _tmp185 to $t1 from $fp-748
	  mul $t2, $t0, $t1	
	  sw $t2, -752($fp)	# spill _tmp186 from $t2 to $fp-752
	# _tmp187 = _tmp175 + _tmp186
	  lw $t0, -708($fp)	# fill _tmp175 to $t0 from $fp-708
	  lw $t1, -752($fp)	# fill _tmp186 to $t1 from $fp-752
	  add $t2, $t0, $t1	
	  sw $t2, -756($fp)	# spill _tmp187 from $t2 to $fp-756
	# _tmp188 = _tmp187 + _tmp185
	  lw $t0, -756($fp)	# fill _tmp187 to $t0 from $fp-756
	  lw $t1, -748($fp)	# fill _tmp185 to $t1 from $fp-748
	  add $t2, $t0, $t1	
	  sw $t2, -760($fp)	# spill _tmp188 from $t2 to $fp-760
	# _tmp189 = *(_tmp188)
	  lw $t0, -760($fp)	# fill _tmp188 to $t0 from $fp-760
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -764($fp)	# spill _tmp189 from $t2 to $fp-764
	# _tmp190 = 2
	  li $t2, 2		# load constant value 2 into $t2
	  sw $t2, -768($fp)	# spill _tmp190 from $t2 to $fp-768
	# _tmp191 = *(_tmp189)
	  lw $t0, -764($fp)	# fill _tmp189 to $t0 from $fp-764
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -772($fp)	# spill _tmp191 from $t2 to $fp-772
	# _tmp192 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -776($fp)	# spill _tmp192 from $t2 to $fp-776
	# _tmp193 = _tmp190 < _tmp192
	  lw $t0, -768($fp)	# fill _tmp190 to $t0 from $fp-768
	  lw $t1, -776($fp)	# fill _tmp192 to $t1 from $fp-776
	  slt $t2, $t0, $t1	
	  sw $t2, -780($fp)	# spill _tmp193 from $t2 to $fp-780
	# _tmp194 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -784($fp)	# spill _tmp194 from $t2 to $fp-784
	# _tmp195 = _tmp191 - _tmp194
	  lw $t0, -772($fp)	# fill _tmp191 to $t0 from $fp-772
	  lw $t1, -784($fp)	# fill _tmp194 to $t1 from $fp-784
	  sub $t2, $t0, $t1	
	  sw $t2, -788($fp)	# spill _tmp195 from $t2 to $fp-788
	# _tmp196 = _tmp195 < _tmp190
	  lw $t0, -788($fp)	# fill _tmp195 to $t0 from $fp-788
	  lw $t1, -768($fp)	# fill _tmp190 to $t1 from $fp-768
	  slt $t2, $t0, $t1	
	  sw $t2, -792($fp)	# spill _tmp196 from $t2 to $fp-792
	# _tmp197 = _tmp193 || _tmp196
	  lw $t0, -780($fp)	# fill _tmp193 to $t0 from $fp-780
	  lw $t1, -792($fp)	# fill _tmp196 to $t1 from $fp-792
	  or $t2, $t0, $t1	
	  sw $t2, -796($fp)	# spill _tmp197 from $t2 to $fp-796
	# IfZ _tmp197 Goto arrayAcc_126
	  lw $t0, -796($fp)	# fill _tmp197 to $t0 from $fp-796
	  beqz $t0, arrayAcc_126	# branch if _tmp197 is zero 
	# _tmp198 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string90: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string90	# load label
	  sw $t2, -800($fp)	# spill _tmp198 from $t2 to $fp-800
	# PushParam _tmp198
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -800($fp)	# fill _tmp198 to $t0 from $fp-800
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_126:
	# _tmp199 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -804($fp)	# spill _tmp199 from $t2 to $fp-804
	# _tmp200 = _tmp190 * _tmp199
	  lw $t0, -768($fp)	# fill _tmp190 to $t0 from $fp-768
	  lw $t1, -804($fp)	# fill _tmp199 to $t1 from $fp-804
	  mul $t2, $t0, $t1	
	  sw $t2, -808($fp)	# spill _tmp200 from $t2 to $fp-808
	# _tmp201 = _tmp189 + _tmp200
	  lw $t0, -764($fp)	# fill _tmp189 to $t0 from $fp-764
	  lw $t1, -808($fp)	# fill _tmp200 to $t1 from $fp-808
	  add $t2, $t0, $t1	
	  sw $t2, -812($fp)	# spill _tmp201 from $t2 to $fp-812
	# _tmp202 = _tmp201 + _tmp199
	  lw $t0, -812($fp)	# fill _tmp201 to $t0 from $fp-812
	  lw $t1, -804($fp)	# fill _tmp199 to $t1 from $fp-804
	  add $t2, $t0, $t1	
	  sw $t2, -816($fp)	# spill _tmp202 from $t2 to $fp-816
	# _tmp203 = *(_tmp202)
	  lw $t0, -816($fp)	# fill _tmp202 to $t0 from $fp-816
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -820($fp)	# spill _tmp203 from $t2 to $fp-820
	# _tmp204 = *(_tmp203)
	  lw $t0, -820($fp)	# fill _tmp203 to $t0 from $fp-820
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -824($fp)	# spill _tmp204 from $t2 to $fp-824
	# _tmp205 = *(_tmp204 + 20)
	  lw $t0, -824($fp)	# fill _tmp204 to $t0 from $fp-824
	  lw $t2, 20($t0) 	# load with offset
	  sw $t2, -828($fp)	# spill _tmp205 from $t2 to $fp-828
	# PushParam playerMark
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, 12($fp)	# fill playerMark to $t0 from $fp+12
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam _tmp203
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -820($fp)	# fill _tmp203 to $t0 from $fp-820
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp206 = ACall _tmp205
	  lw $t0, -828($fp)	# fill _tmp205 to $t0 from $fp-828
	  jalr $t0            	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -832($fp)	# spill _tmp206 from $t2 to $fp-832
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# _tmp207 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -836($fp)	# spill _tmp207 from $t2 to $fp-836
	# _tmp208 = _tmp206 == _tmp207
	  lw $t0, -832($fp)	# fill _tmp206 to $t0 from $fp-832
	  lw $t1, -836($fp)	# fill _tmp207 to $t1 from $fp-836
	  seq $t2, $t0, $t1	
	  sw $t2, -840($fp)	# spill _tmp208 from $t2 to $fp-840
	# _tmp209 = _tmp174 && _tmp208
	  lw $t0, -704($fp)	# fill _tmp174 to $t0 from $fp-704
	  lw $t1, -840($fp)	# fill _tmp208 to $t1 from $fp-840
	  and $t2, $t0, $t1	
	  sw $t2, -844($fp)	# spill _tmp209 from $t2 to $fp-844
	# IfZ _tmp209 Goto else_127
	  lw $t0, -844($fp)	# fill _tmp209 to $t0 from $fp-844
	  beqz $t0, else_127	# branch if _tmp209 is zero 
	# _tmp210 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -848($fp)	# spill _tmp210 from $t2 to $fp-848
	# row = _tmp210
	  lw $t2, -848($fp)	# fill _tmp210 to $t2 from $fp-848
	  sw $t2, -8($fp)	# spill row from $t2 to $fp-8
	# _tmp211 = 2
	  li $t2, 2		# load constant value 2 into $t2
	  sw $t2, -852($fp)	# spill _tmp211 from $t2 to $fp-852
	# column = _tmp211
	  lw $t2, -852($fp)	# fill _tmp211 to $t2 from $fp-852
	  sw $t2, -12($fp)	# spill column from $t2 to $fp-12
	# Goto endif_128
	  b endif_128		# unconditional branch
  else_127:
	# _tmp212 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -856($fp)	# spill _tmp212 from $t2 to $fp-856
	# _tmp213 = 2
	  li $t2, 2		# load constant value 2 into $t2
	  sw $t2, -860($fp)	# spill _tmp213 from $t2 to $fp-860
	# _tmp214 = *(_tmp212)
	  lw $t0, -856($fp)	# fill _tmp212 to $t0 from $fp-856
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -864($fp)	# spill _tmp214 from $t2 to $fp-864
	# _tmp215 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -868($fp)	# spill _tmp215 from $t2 to $fp-868
	# _tmp216 = _tmp213 < _tmp215
	  lw $t0, -860($fp)	# fill _tmp213 to $t0 from $fp-860
	  lw $t1, -868($fp)	# fill _tmp215 to $t1 from $fp-868
	  slt $t2, $t0, $t1	
	  sw $t2, -872($fp)	# spill _tmp216 from $t2 to $fp-872
	# _tmp217 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -876($fp)	# spill _tmp217 from $t2 to $fp-876
	# _tmp218 = _tmp214 - _tmp217
	  lw $t0, -864($fp)	# fill _tmp214 to $t0 from $fp-864
	  lw $t1, -876($fp)	# fill _tmp217 to $t1 from $fp-876
	  sub $t2, $t0, $t1	
	  sw $t2, -880($fp)	# spill _tmp218 from $t2 to $fp-880
	# _tmp219 = _tmp218 < _tmp213
	  lw $t0, -880($fp)	# fill _tmp218 to $t0 from $fp-880
	  lw $t1, -860($fp)	# fill _tmp213 to $t1 from $fp-860
	  slt $t2, $t0, $t1	
	  sw $t2, -884($fp)	# spill _tmp219 from $t2 to $fp-884
	# _tmp220 = _tmp216 || _tmp219
	  lw $t0, -872($fp)	# fill _tmp216 to $t0 from $fp-872
	  lw $t1, -884($fp)	# fill _tmp219 to $t1 from $fp-884
	  or $t2, $t0, $t1	
	  sw $t2, -888($fp)	# spill _tmp220 from $t2 to $fp-888
	# IfZ _tmp220 Goto arrayAcc_129
	  lw $t0, -888($fp)	# fill _tmp220 to $t0 from $fp-888
	  beqz $t0, arrayAcc_129	# branch if _tmp220 is zero 
	# _tmp221 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string91: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string91	# load label
	  sw $t2, -892($fp)	# spill _tmp221 from $t2 to $fp-892
	# PushParam _tmp221
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -892($fp)	# fill _tmp221 to $t0 from $fp-892
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_129:
	# _tmp222 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -896($fp)	# spill _tmp222 from $t2 to $fp-896
	# _tmp223 = _tmp213 * _tmp222
	  lw $t0, -860($fp)	# fill _tmp213 to $t0 from $fp-860
	  lw $t1, -896($fp)	# fill _tmp222 to $t1 from $fp-896
	  mul $t2, $t0, $t1	
	  sw $t2, -900($fp)	# spill _tmp223 from $t2 to $fp-900
	# _tmp224 = _tmp212 + _tmp223
	  lw $t0, -856($fp)	# fill _tmp212 to $t0 from $fp-856
	  lw $t1, -900($fp)	# fill _tmp223 to $t1 from $fp-900
	  add $t2, $t0, $t1	
	  sw $t2, -904($fp)	# spill _tmp224 from $t2 to $fp-904
	# _tmp225 = _tmp224 + _tmp222
	  lw $t0, -904($fp)	# fill _tmp224 to $t0 from $fp-904
	  lw $t1, -896($fp)	# fill _tmp222 to $t1 from $fp-896
	  add $t2, $t0, $t1	
	  sw $t2, -908($fp)	# spill _tmp225 from $t2 to $fp-908
	# _tmp226 = *(_tmp225)
	  lw $t0, -908($fp)	# fill _tmp225 to $t0 from $fp-908
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -912($fp)	# spill _tmp226 from $t2 to $fp-912
	# _tmp227 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -916($fp)	# spill _tmp227 from $t2 to $fp-916
	# _tmp228 = *(_tmp226)
	  lw $t0, -912($fp)	# fill _tmp226 to $t0 from $fp-912
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -920($fp)	# spill _tmp228 from $t2 to $fp-920
	# _tmp229 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -924($fp)	# spill _tmp229 from $t2 to $fp-924
	# _tmp230 = _tmp227 < _tmp229
	  lw $t0, -916($fp)	# fill _tmp227 to $t0 from $fp-916
	  lw $t1, -924($fp)	# fill _tmp229 to $t1 from $fp-924
	  slt $t2, $t0, $t1	
	  sw $t2, -928($fp)	# spill _tmp230 from $t2 to $fp-928
	# _tmp231 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -932($fp)	# spill _tmp231 from $t2 to $fp-932
	# _tmp232 = _tmp228 - _tmp231
	  lw $t0, -920($fp)	# fill _tmp228 to $t0 from $fp-920
	  lw $t1, -932($fp)	# fill _tmp231 to $t1 from $fp-932
	  sub $t2, $t0, $t1	
	  sw $t2, -936($fp)	# spill _tmp232 from $t2 to $fp-936
	# _tmp233 = _tmp232 < _tmp227
	  lw $t0, -936($fp)	# fill _tmp232 to $t0 from $fp-936
	  lw $t1, -916($fp)	# fill _tmp227 to $t1 from $fp-916
	  slt $t2, $t0, $t1	
	  sw $t2, -940($fp)	# spill _tmp233 from $t2 to $fp-940
	# _tmp234 = _tmp230 || _tmp233
	  lw $t0, -928($fp)	# fill _tmp230 to $t0 from $fp-928
	  lw $t1, -940($fp)	# fill _tmp233 to $t1 from $fp-940
	  or $t2, $t0, $t1	
	  sw $t2, -944($fp)	# spill _tmp234 from $t2 to $fp-944
	# IfZ _tmp234 Goto arrayAcc_130
	  lw $t0, -944($fp)	# fill _tmp234 to $t0 from $fp-944
	  beqz $t0, arrayAcc_130	# branch if _tmp234 is zero 
	# _tmp235 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string92: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string92	# load label
	  sw $t2, -948($fp)	# spill _tmp235 from $t2 to $fp-948
	# PushParam _tmp235
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -948($fp)	# fill _tmp235 to $t0 from $fp-948
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_130:
	# _tmp236 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -952($fp)	# spill _tmp236 from $t2 to $fp-952
	# _tmp237 = _tmp227 * _tmp236
	  lw $t0, -916($fp)	# fill _tmp227 to $t0 from $fp-916
	  lw $t1, -952($fp)	# fill _tmp236 to $t1 from $fp-952
	  mul $t2, $t0, $t1	
	  sw $t2, -956($fp)	# spill _tmp237 from $t2 to $fp-956
	# _tmp238 = _tmp226 + _tmp237
	  lw $t0, -912($fp)	# fill _tmp226 to $t0 from $fp-912
	  lw $t1, -956($fp)	# fill _tmp237 to $t1 from $fp-956
	  add $t2, $t0, $t1	
	  sw $t2, -960($fp)	# spill _tmp238 from $t2 to $fp-960
	# _tmp239 = _tmp238 + _tmp236
	  lw $t0, -960($fp)	# fill _tmp238 to $t0 from $fp-960
	  lw $t1, -952($fp)	# fill _tmp236 to $t1 from $fp-952
	  add $t2, $t0, $t1	
	  sw $t2, -964($fp)	# spill _tmp239 from $t2 to $fp-964
	# _tmp240 = *(_tmp239)
	  lw $t0, -964($fp)	# fill _tmp239 to $t0 from $fp-964
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -968($fp)	# spill _tmp240 from $t2 to $fp-968
	# _tmp241 = *(_tmp240)
	  lw $t0, -968($fp)	# fill _tmp240 to $t0 from $fp-968
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -972($fp)	# spill _tmp241 from $t2 to $fp-972
	# _tmp242 = *(_tmp241 + 20)
	  lw $t0, -972($fp)	# fill _tmp241 to $t0 from $fp-972
	  lw $t2, 20($t0) 	# load with offset
	  sw $t2, -976($fp)	# spill _tmp242 from $t2 to $fp-976
	# PushParam enemyMark
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, 8($fp)	# fill enemyMark to $t0 from $fp+8
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam _tmp240
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -968($fp)	# fill _tmp240 to $t0 from $fp-968
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp243 = ACall _tmp242
	  lw $t0, -976($fp)	# fill _tmp242 to $t0 from $fp-976
	  jalr $t0            	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -980($fp)	# spill _tmp243 from $t2 to $fp-980
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# _tmp244 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -984($fp)	# spill _tmp244 from $t2 to $fp-984
	# _tmp245 = 2
	  li $t2, 2		# load constant value 2 into $t2
	  sw $t2, -988($fp)	# spill _tmp245 from $t2 to $fp-988
	# _tmp246 = *(_tmp244)
	  lw $t0, -984($fp)	# fill _tmp244 to $t0 from $fp-984
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -992($fp)	# spill _tmp246 from $t2 to $fp-992
	# _tmp247 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -996($fp)	# spill _tmp247 from $t2 to $fp-996
	# _tmp248 = _tmp245 < _tmp247
	  lw $t0, -988($fp)	# fill _tmp245 to $t0 from $fp-988
	  lw $t1, -996($fp)	# fill _tmp247 to $t1 from $fp-996
	  slt $t2, $t0, $t1	
	  sw $t2, -1000($fp)	# spill _tmp248 from $t2 to $fp-1000
	# _tmp249 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -1004($fp)	# spill _tmp249 from $t2 to $fp-1004
	# _tmp250 = _tmp246 - _tmp249
	  lw $t0, -992($fp)	# fill _tmp246 to $t0 from $fp-992
	  lw $t1, -1004($fp)	# fill _tmp249 to $t1 from $fp-1004
	  sub $t2, $t0, $t1	
	  sw $t2, -1008($fp)	# spill _tmp250 from $t2 to $fp-1008
	# _tmp251 = _tmp250 < _tmp245
	  lw $t0, -1008($fp)	# fill _tmp250 to $t0 from $fp-1008
	  lw $t1, -988($fp)	# fill _tmp245 to $t1 from $fp-988
	  slt $t2, $t0, $t1	
	  sw $t2, -1012($fp)	# spill _tmp251 from $t2 to $fp-1012
	# _tmp252 = _tmp248 || _tmp251
	  lw $t0, -1000($fp)	# fill _tmp248 to $t0 from $fp-1000
	  lw $t1, -1012($fp)	# fill _tmp251 to $t1 from $fp-1012
	  or $t2, $t0, $t1	
	  sw $t2, -1016($fp)	# spill _tmp252 from $t2 to $fp-1016
	# IfZ _tmp252 Goto arrayAcc_131
	  lw $t0, -1016($fp)	# fill _tmp252 to $t0 from $fp-1016
	  beqz $t0, arrayAcc_131	# branch if _tmp252 is zero 
	# _tmp253 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string93: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string93	# load label
	  sw $t2, -1020($fp)	# spill _tmp253 from $t2 to $fp-1020
	# PushParam _tmp253
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -1020($fp)	# fill _tmp253 to $t0 from $fp-1020
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_131:
	# _tmp254 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -1024($fp)	# spill _tmp254 from $t2 to $fp-1024
	# _tmp255 = _tmp245 * _tmp254
	  lw $t0, -988($fp)	# fill _tmp245 to $t0 from $fp-988
	  lw $t1, -1024($fp)	# fill _tmp254 to $t1 from $fp-1024
	  mul $t2, $t0, $t1	
	  sw $t2, -1028($fp)	# spill _tmp255 from $t2 to $fp-1028
	# _tmp256 = _tmp244 + _tmp255
	  lw $t0, -984($fp)	# fill _tmp244 to $t0 from $fp-984
	  lw $t1, -1028($fp)	# fill _tmp255 to $t1 from $fp-1028
	  add $t2, $t0, $t1	
	  sw $t2, -1032($fp)	# spill _tmp256 from $t2 to $fp-1032
	# _tmp257 = _tmp256 + _tmp254
	  lw $t0, -1032($fp)	# fill _tmp256 to $t0 from $fp-1032
	  lw $t1, -1024($fp)	# fill _tmp254 to $t1 from $fp-1024
	  add $t2, $t0, $t1	
	  sw $t2, -1036($fp)	# spill _tmp257 from $t2 to $fp-1036
	# _tmp258 = *(_tmp257)
	  lw $t0, -1036($fp)	# fill _tmp257 to $t0 from $fp-1036
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -1040($fp)	# spill _tmp258 from $t2 to $fp-1040
	# _tmp259 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -1044($fp)	# spill _tmp259 from $t2 to $fp-1044
	# _tmp260 = *(_tmp258)
	  lw $t0, -1040($fp)	# fill _tmp258 to $t0 from $fp-1040
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -1048($fp)	# spill _tmp260 from $t2 to $fp-1048
	# _tmp261 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -1052($fp)	# spill _tmp261 from $t2 to $fp-1052
	# _tmp262 = _tmp259 < _tmp261
	  lw $t0, -1044($fp)	# fill _tmp259 to $t0 from $fp-1044
	  lw $t1, -1052($fp)	# fill _tmp261 to $t1 from $fp-1052
	  slt $t2, $t0, $t1	
	  sw $t2, -1056($fp)	# spill _tmp262 from $t2 to $fp-1056
	# _tmp263 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -1060($fp)	# spill _tmp263 from $t2 to $fp-1060
	# _tmp264 = _tmp260 - _tmp263
	  lw $t0, -1048($fp)	# fill _tmp260 to $t0 from $fp-1048
	  lw $t1, -1060($fp)	# fill _tmp263 to $t1 from $fp-1060
	  sub $t2, $t0, $t1	
	  sw $t2, -1064($fp)	# spill _tmp264 from $t2 to $fp-1064
	# _tmp265 = _tmp264 < _tmp259
	  lw $t0, -1064($fp)	# fill _tmp264 to $t0 from $fp-1064
	  lw $t1, -1044($fp)	# fill _tmp259 to $t1 from $fp-1044
	  slt $t2, $t0, $t1	
	  sw $t2, -1068($fp)	# spill _tmp265 from $t2 to $fp-1068
	# _tmp266 = _tmp262 || _tmp265
	  lw $t0, -1056($fp)	# fill _tmp262 to $t0 from $fp-1056
	  lw $t1, -1068($fp)	# fill _tmp265 to $t1 from $fp-1068
	  or $t2, $t0, $t1	
	  sw $t2, -1072($fp)	# spill _tmp266 from $t2 to $fp-1072
	# IfZ _tmp266 Goto arrayAcc_132
	  lw $t0, -1072($fp)	# fill _tmp266 to $t0 from $fp-1072
	  beqz $t0, arrayAcc_132	# branch if _tmp266 is zero 
	# _tmp267 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string94: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string94	# load label
	  sw $t2, -1076($fp)	# spill _tmp267 from $t2 to $fp-1076
	# PushParam _tmp267
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -1076($fp)	# fill _tmp267 to $t0 from $fp-1076
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_132:
	# _tmp268 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -1080($fp)	# spill _tmp268 from $t2 to $fp-1080
	# _tmp269 = _tmp259 * _tmp268
	  lw $t0, -1044($fp)	# fill _tmp259 to $t0 from $fp-1044
	  lw $t1, -1080($fp)	# fill _tmp268 to $t1 from $fp-1080
	  mul $t2, $t0, $t1	
	  sw $t2, -1084($fp)	# spill _tmp269 from $t2 to $fp-1084
	# _tmp270 = _tmp258 + _tmp269
	  lw $t0, -1040($fp)	# fill _tmp258 to $t0 from $fp-1040
	  lw $t1, -1084($fp)	# fill _tmp269 to $t1 from $fp-1084
	  add $t2, $t0, $t1	
	  sw $t2, -1088($fp)	# spill _tmp270 from $t2 to $fp-1088
	# _tmp271 = _tmp270 + _tmp268
	  lw $t0, -1088($fp)	# fill _tmp270 to $t0 from $fp-1088
	  lw $t1, -1080($fp)	# fill _tmp268 to $t1 from $fp-1080
	  add $t2, $t0, $t1	
	  sw $t2, -1092($fp)	# spill _tmp271 from $t2 to $fp-1092
	# _tmp272 = *(_tmp271)
	  lw $t0, -1092($fp)	# fill _tmp271 to $t0 from $fp-1092
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -1096($fp)	# spill _tmp272 from $t2 to $fp-1096
	# _tmp273 = *(_tmp272)
	  lw $t0, -1096($fp)	# fill _tmp272 to $t0 from $fp-1096
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -1100($fp)	# spill _tmp273 from $t2 to $fp-1100
	# _tmp274 = *(_tmp273 + 20)
	  lw $t0, -1100($fp)	# fill _tmp273 to $t0 from $fp-1100
	  lw $t2, 20($t0) 	# load with offset
	  sw $t2, -1104($fp)	# spill _tmp274 from $t2 to $fp-1104
	# PushParam enemyMark
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, 8($fp)	# fill enemyMark to $t0 from $fp+8
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam _tmp272
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -1096($fp)	# fill _tmp272 to $t0 from $fp-1096
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp275 = ACall _tmp274
	  lw $t0, -1104($fp)	# fill _tmp274 to $t0 from $fp-1104
	  jalr $t0            	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -1108($fp)	# spill _tmp275 from $t2 to $fp-1108
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# _tmp276 = _tmp243 && _tmp275
	  lw $t0, -980($fp)	# fill _tmp243 to $t0 from $fp-980
	  lw $t1, -1108($fp)	# fill _tmp275 to $t1 from $fp-1108
	  and $t2, $t0, $t1	
	  sw $t2, -1112($fp)	# spill _tmp276 from $t2 to $fp-1112
	# _tmp277 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -1116($fp)	# spill _tmp277 from $t2 to $fp-1116
	# _tmp278 = 2
	  li $t2, 2		# load constant value 2 into $t2
	  sw $t2, -1120($fp)	# spill _tmp278 from $t2 to $fp-1120
	# _tmp279 = *(_tmp277)
	  lw $t0, -1116($fp)	# fill _tmp277 to $t0 from $fp-1116
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -1124($fp)	# spill _tmp279 from $t2 to $fp-1124
	# _tmp280 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -1128($fp)	# spill _tmp280 from $t2 to $fp-1128
	# _tmp281 = _tmp278 < _tmp280
	  lw $t0, -1120($fp)	# fill _tmp278 to $t0 from $fp-1120
	  lw $t1, -1128($fp)	# fill _tmp280 to $t1 from $fp-1128
	  slt $t2, $t0, $t1	
	  sw $t2, -1132($fp)	# spill _tmp281 from $t2 to $fp-1132
	# _tmp282 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -1136($fp)	# spill _tmp282 from $t2 to $fp-1136
	# _tmp283 = _tmp279 - _tmp282
	  lw $t0, -1124($fp)	# fill _tmp279 to $t0 from $fp-1124
	  lw $t1, -1136($fp)	# fill _tmp282 to $t1 from $fp-1136
	  sub $t2, $t0, $t1	
	  sw $t2, -1140($fp)	# spill _tmp283 from $t2 to $fp-1140
	# _tmp284 = _tmp283 < _tmp278
	  lw $t0, -1140($fp)	# fill _tmp283 to $t0 from $fp-1140
	  lw $t1, -1120($fp)	# fill _tmp278 to $t1 from $fp-1120
	  slt $t2, $t0, $t1	
	  sw $t2, -1144($fp)	# spill _tmp284 from $t2 to $fp-1144
	# _tmp285 = _tmp281 || _tmp284
	  lw $t0, -1132($fp)	# fill _tmp281 to $t0 from $fp-1132
	  lw $t1, -1144($fp)	# fill _tmp284 to $t1 from $fp-1144
	  or $t2, $t0, $t1	
	  sw $t2, -1148($fp)	# spill _tmp285 from $t2 to $fp-1148
	# IfZ _tmp285 Goto arrayAcc_133
	  lw $t0, -1148($fp)	# fill _tmp285 to $t0 from $fp-1148
	  beqz $t0, arrayAcc_133	# branch if _tmp285 is zero 
	# _tmp286 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string95: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string95	# load label
	  sw $t2, -1152($fp)	# spill _tmp286 from $t2 to $fp-1152
	# PushParam _tmp286
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -1152($fp)	# fill _tmp286 to $t0 from $fp-1152
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_133:
	# _tmp287 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -1156($fp)	# spill _tmp287 from $t2 to $fp-1156
	# _tmp288 = _tmp278 * _tmp287
	  lw $t0, -1120($fp)	# fill _tmp278 to $t0 from $fp-1120
	  lw $t1, -1156($fp)	# fill _tmp287 to $t1 from $fp-1156
	  mul $t2, $t0, $t1	
	  sw $t2, -1160($fp)	# spill _tmp288 from $t2 to $fp-1160
	# _tmp289 = _tmp277 + _tmp288
	  lw $t0, -1116($fp)	# fill _tmp277 to $t0 from $fp-1116
	  lw $t1, -1160($fp)	# fill _tmp288 to $t1 from $fp-1160
	  add $t2, $t0, $t1	
	  sw $t2, -1164($fp)	# spill _tmp289 from $t2 to $fp-1164
	# _tmp290 = _tmp289 + _tmp287
	  lw $t0, -1164($fp)	# fill _tmp289 to $t0 from $fp-1164
	  lw $t1, -1156($fp)	# fill _tmp287 to $t1 from $fp-1156
	  add $t2, $t0, $t1	
	  sw $t2, -1168($fp)	# spill _tmp290 from $t2 to $fp-1168
	# _tmp291 = *(_tmp290)
	  lw $t0, -1168($fp)	# fill _tmp290 to $t0 from $fp-1168
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -1172($fp)	# spill _tmp291 from $t2 to $fp-1172
	# _tmp292 = 2
	  li $t2, 2		# load constant value 2 into $t2
	  sw $t2, -1176($fp)	# spill _tmp292 from $t2 to $fp-1176
	# _tmp293 = *(_tmp291)
	  lw $t0, -1172($fp)	# fill _tmp291 to $t0 from $fp-1172
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -1180($fp)	# spill _tmp293 from $t2 to $fp-1180
	# _tmp294 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -1184($fp)	# spill _tmp294 from $t2 to $fp-1184
	# _tmp295 = _tmp292 < _tmp294
	  lw $t0, -1176($fp)	# fill _tmp292 to $t0 from $fp-1176
	  lw $t1, -1184($fp)	# fill _tmp294 to $t1 from $fp-1184
	  slt $t2, $t0, $t1	
	  sw $t2, -1188($fp)	# spill _tmp295 from $t2 to $fp-1188
	# _tmp296 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -1192($fp)	# spill _tmp296 from $t2 to $fp-1192
	# _tmp297 = _tmp293 - _tmp296
	  lw $t0, -1180($fp)	# fill _tmp293 to $t0 from $fp-1180
	  lw $t1, -1192($fp)	# fill _tmp296 to $t1 from $fp-1192
	  sub $t2, $t0, $t1	
	  sw $t2, -1196($fp)	# spill _tmp297 from $t2 to $fp-1196
	# _tmp298 = _tmp297 < _tmp292
	  lw $t0, -1196($fp)	# fill _tmp297 to $t0 from $fp-1196
	  lw $t1, -1176($fp)	# fill _tmp292 to $t1 from $fp-1176
	  slt $t2, $t0, $t1	
	  sw $t2, -1200($fp)	# spill _tmp298 from $t2 to $fp-1200
	# _tmp299 = _tmp295 || _tmp298
	  lw $t0, -1188($fp)	# fill _tmp295 to $t0 from $fp-1188
	  lw $t1, -1200($fp)	# fill _tmp298 to $t1 from $fp-1200
	  or $t2, $t0, $t1	
	  sw $t2, -1204($fp)	# spill _tmp299 from $t2 to $fp-1204
	# IfZ _tmp299 Goto arrayAcc_134
	  lw $t0, -1204($fp)	# fill _tmp299 to $t0 from $fp-1204
	  beqz $t0, arrayAcc_134	# branch if _tmp299 is zero 
	# _tmp300 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string96: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string96	# load label
	  sw $t2, -1208($fp)	# spill _tmp300 from $t2 to $fp-1208
	# PushParam _tmp300
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -1208($fp)	# fill _tmp300 to $t0 from $fp-1208
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_134:
	# _tmp301 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -1212($fp)	# spill _tmp301 from $t2 to $fp-1212
	# _tmp302 = _tmp292 * _tmp301
	  lw $t0, -1176($fp)	# fill _tmp292 to $t0 from $fp-1176
	  lw $t1, -1212($fp)	# fill _tmp301 to $t1 from $fp-1212
	  mul $t2, $t0, $t1	
	  sw $t2, -1216($fp)	# spill _tmp302 from $t2 to $fp-1216
	# _tmp303 = _tmp291 + _tmp302
	  lw $t0, -1172($fp)	# fill _tmp291 to $t0 from $fp-1172
	  lw $t1, -1216($fp)	# fill _tmp302 to $t1 from $fp-1216
	  add $t2, $t0, $t1	
	  sw $t2, -1220($fp)	# spill _tmp303 from $t2 to $fp-1220
	# _tmp304 = _tmp303 + _tmp301
	  lw $t0, -1220($fp)	# fill _tmp303 to $t0 from $fp-1220
	  lw $t1, -1212($fp)	# fill _tmp301 to $t1 from $fp-1212
	  add $t2, $t0, $t1	
	  sw $t2, -1224($fp)	# spill _tmp304 from $t2 to $fp-1224
	# _tmp305 = *(_tmp304)
	  lw $t0, -1224($fp)	# fill _tmp304 to $t0 from $fp-1224
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -1228($fp)	# spill _tmp305 from $t2 to $fp-1228
	# _tmp306 = *(_tmp305)
	  lw $t0, -1228($fp)	# fill _tmp305 to $t0 from $fp-1228
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -1232($fp)	# spill _tmp306 from $t2 to $fp-1232
	# _tmp307 = *(_tmp306 + 20)
	  lw $t0, -1232($fp)	# fill _tmp306 to $t0 from $fp-1232
	  lw $t2, 20($t0) 	# load with offset
	  sw $t2, -1236($fp)	# spill _tmp307 from $t2 to $fp-1236
	# PushParam playerMark
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, 12($fp)	# fill playerMark to $t0 from $fp+12
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam _tmp305
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -1228($fp)	# fill _tmp305 to $t0 from $fp-1228
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp308 = ACall _tmp307
	  lw $t0, -1236($fp)	# fill _tmp307 to $t0 from $fp-1236
	  jalr $t0            	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -1240($fp)	# spill _tmp308 from $t2 to $fp-1240
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# _tmp309 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -1244($fp)	# spill _tmp309 from $t2 to $fp-1244
	# _tmp310 = _tmp308 == _tmp309
	  lw $t0, -1240($fp)	# fill _tmp308 to $t0 from $fp-1240
	  lw $t1, -1244($fp)	# fill _tmp309 to $t1 from $fp-1244
	  seq $t2, $t0, $t1	
	  sw $t2, -1248($fp)	# spill _tmp310 from $t2 to $fp-1248
	# _tmp311 = _tmp276 && _tmp310
	  lw $t0, -1112($fp)	# fill _tmp276 to $t0 from $fp-1112
	  lw $t1, -1248($fp)	# fill _tmp310 to $t1 from $fp-1248
	  and $t2, $t0, $t1	
	  sw $t2, -1252($fp)	# spill _tmp311 from $t2 to $fp-1252
	# IfZ _tmp311 Goto else_135
	  lw $t0, -1252($fp)	# fill _tmp311 to $t0 from $fp-1252
	  beqz $t0, else_135	# branch if _tmp311 is zero 
	# _tmp312 = 2
	  li $t2, 2		# load constant value 2 into $t2
	  sw $t2, -1256($fp)	# spill _tmp312 from $t2 to $fp-1256
	# row = _tmp312
	  lw $t2, -1256($fp)	# fill _tmp312 to $t2 from $fp-1256
	  sw $t2, -8($fp)	# spill row from $t2 to $fp-8
	# _tmp313 = 2
	  li $t2, 2		# load constant value 2 into $t2
	  sw $t2, -1260($fp)	# spill _tmp313 from $t2 to $fp-1260
	# column = _tmp313
	  lw $t2, -1260($fp)	# fill _tmp313 to $t2 from $fp-1260
	  sw $t2, -12($fp)	# spill column from $t2 to $fp-12
	# Goto endif_136
	  b endif_136		# unconditional branch
  else_135:
	# _tmp314 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -1264($fp)	# spill _tmp314 from $t2 to $fp-1264
	# _tmp315 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -1268($fp)	# spill _tmp315 from $t2 to $fp-1268
	# _tmp316 = *(_tmp314)
	  lw $t0, -1264($fp)	# fill _tmp314 to $t0 from $fp-1264
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -1272($fp)	# spill _tmp316 from $t2 to $fp-1272
	# _tmp317 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -1276($fp)	# spill _tmp317 from $t2 to $fp-1276
	# _tmp318 = _tmp315 < _tmp317
	  lw $t0, -1268($fp)	# fill _tmp315 to $t0 from $fp-1268
	  lw $t1, -1276($fp)	# fill _tmp317 to $t1 from $fp-1276
	  slt $t2, $t0, $t1	
	  sw $t2, -1280($fp)	# spill _tmp318 from $t2 to $fp-1280
	# _tmp319 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -1284($fp)	# spill _tmp319 from $t2 to $fp-1284
	# _tmp320 = _tmp316 - _tmp319
	  lw $t0, -1272($fp)	# fill _tmp316 to $t0 from $fp-1272
	  lw $t1, -1284($fp)	# fill _tmp319 to $t1 from $fp-1284
	  sub $t2, $t0, $t1	
	  sw $t2, -1288($fp)	# spill _tmp320 from $t2 to $fp-1288
	# _tmp321 = _tmp320 < _tmp315
	  lw $t0, -1288($fp)	# fill _tmp320 to $t0 from $fp-1288
	  lw $t1, -1268($fp)	# fill _tmp315 to $t1 from $fp-1268
	  slt $t2, $t0, $t1	
	  sw $t2, -1292($fp)	# spill _tmp321 from $t2 to $fp-1292
	# _tmp322 = _tmp318 || _tmp321
	  lw $t0, -1280($fp)	# fill _tmp318 to $t0 from $fp-1280
	  lw $t1, -1292($fp)	# fill _tmp321 to $t1 from $fp-1292
	  or $t2, $t0, $t1	
	  sw $t2, -1296($fp)	# spill _tmp322 from $t2 to $fp-1296
	# IfZ _tmp322 Goto arrayAcc_137
	  lw $t0, -1296($fp)	# fill _tmp322 to $t0 from $fp-1296
	  beqz $t0, arrayAcc_137	# branch if _tmp322 is zero 
	# _tmp323 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string97: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string97	# load label
	  sw $t2, -1300($fp)	# spill _tmp323 from $t2 to $fp-1300
	# PushParam _tmp323
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -1300($fp)	# fill _tmp323 to $t0 from $fp-1300
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_137:
	# _tmp324 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -1304($fp)	# spill _tmp324 from $t2 to $fp-1304
	# _tmp325 = _tmp315 * _tmp324
	  lw $t0, -1268($fp)	# fill _tmp315 to $t0 from $fp-1268
	  lw $t1, -1304($fp)	# fill _tmp324 to $t1 from $fp-1304
	  mul $t2, $t0, $t1	
	  sw $t2, -1308($fp)	# spill _tmp325 from $t2 to $fp-1308
	# _tmp326 = _tmp314 + _tmp325
	  lw $t0, -1264($fp)	# fill _tmp314 to $t0 from $fp-1264
	  lw $t1, -1308($fp)	# fill _tmp325 to $t1 from $fp-1308
	  add $t2, $t0, $t1	
	  sw $t2, -1312($fp)	# spill _tmp326 from $t2 to $fp-1312
	# _tmp327 = _tmp326 + _tmp324
	  lw $t0, -1312($fp)	# fill _tmp326 to $t0 from $fp-1312
	  lw $t1, -1304($fp)	# fill _tmp324 to $t1 from $fp-1304
	  add $t2, $t0, $t1	
	  sw $t2, -1316($fp)	# spill _tmp327 from $t2 to $fp-1316
	# _tmp328 = *(_tmp327)
	  lw $t0, -1316($fp)	# fill _tmp327 to $t0 from $fp-1316
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -1320($fp)	# spill _tmp328 from $t2 to $fp-1320
	# _tmp329 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -1324($fp)	# spill _tmp329 from $t2 to $fp-1324
	# _tmp330 = *(_tmp328)
	  lw $t0, -1320($fp)	# fill _tmp328 to $t0 from $fp-1320
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -1328($fp)	# spill _tmp330 from $t2 to $fp-1328
	# _tmp331 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -1332($fp)	# spill _tmp331 from $t2 to $fp-1332
	# _tmp332 = _tmp329 < _tmp331
	  lw $t0, -1324($fp)	# fill _tmp329 to $t0 from $fp-1324
	  lw $t1, -1332($fp)	# fill _tmp331 to $t1 from $fp-1332
	  slt $t2, $t0, $t1	
	  sw $t2, -1336($fp)	# spill _tmp332 from $t2 to $fp-1336
	# _tmp333 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -1340($fp)	# spill _tmp333 from $t2 to $fp-1340
	# _tmp334 = _tmp330 - _tmp333
	  lw $t0, -1328($fp)	# fill _tmp330 to $t0 from $fp-1328
	  lw $t1, -1340($fp)	# fill _tmp333 to $t1 from $fp-1340
	  sub $t2, $t0, $t1	
	  sw $t2, -1344($fp)	# spill _tmp334 from $t2 to $fp-1344
	# _tmp335 = _tmp334 < _tmp329
	  lw $t0, -1344($fp)	# fill _tmp334 to $t0 from $fp-1344
	  lw $t1, -1324($fp)	# fill _tmp329 to $t1 from $fp-1324
	  slt $t2, $t0, $t1	
	  sw $t2, -1348($fp)	# spill _tmp335 from $t2 to $fp-1348
	# _tmp336 = _tmp332 || _tmp335
	  lw $t0, -1336($fp)	# fill _tmp332 to $t0 from $fp-1336
	  lw $t1, -1348($fp)	# fill _tmp335 to $t1 from $fp-1348
	  or $t2, $t0, $t1	
	  sw $t2, -1352($fp)	# spill _tmp336 from $t2 to $fp-1352
	# IfZ _tmp336 Goto arrayAcc_138
	  lw $t0, -1352($fp)	# fill _tmp336 to $t0 from $fp-1352
	  beqz $t0, arrayAcc_138	# branch if _tmp336 is zero 
	# _tmp337 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string98: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string98	# load label
	  sw $t2, -1356($fp)	# spill _tmp337 from $t2 to $fp-1356
	# PushParam _tmp337
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -1356($fp)	# fill _tmp337 to $t0 from $fp-1356
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_138:
	# _tmp338 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -1360($fp)	# spill _tmp338 from $t2 to $fp-1360
	# _tmp339 = _tmp329 * _tmp338
	  lw $t0, -1324($fp)	# fill _tmp329 to $t0 from $fp-1324
	  lw $t1, -1360($fp)	# fill _tmp338 to $t1 from $fp-1360
	  mul $t2, $t0, $t1	
	  sw $t2, -1364($fp)	# spill _tmp339 from $t2 to $fp-1364
	# _tmp340 = _tmp328 + _tmp339
	  lw $t0, -1320($fp)	# fill _tmp328 to $t0 from $fp-1320
	  lw $t1, -1364($fp)	# fill _tmp339 to $t1 from $fp-1364
	  add $t2, $t0, $t1	
	  sw $t2, -1368($fp)	# spill _tmp340 from $t2 to $fp-1368
	# _tmp341 = _tmp340 + _tmp338
	  lw $t0, -1368($fp)	# fill _tmp340 to $t0 from $fp-1368
	  lw $t1, -1360($fp)	# fill _tmp338 to $t1 from $fp-1360
	  add $t2, $t0, $t1	
	  sw $t2, -1372($fp)	# spill _tmp341 from $t2 to $fp-1372
	# _tmp342 = *(_tmp341)
	  lw $t0, -1372($fp)	# fill _tmp341 to $t0 from $fp-1372
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -1376($fp)	# spill _tmp342 from $t2 to $fp-1376
	# _tmp343 = *(_tmp342)
	  lw $t0, -1376($fp)	# fill _tmp342 to $t0 from $fp-1376
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -1380($fp)	# spill _tmp343 from $t2 to $fp-1380
	# _tmp344 = *(_tmp343 + 20)
	  lw $t0, -1380($fp)	# fill _tmp343 to $t0 from $fp-1380
	  lw $t2, 20($t0) 	# load with offset
	  sw $t2, -1384($fp)	# spill _tmp344 from $t2 to $fp-1384
	# PushParam enemyMark
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, 8($fp)	# fill enemyMark to $t0 from $fp+8
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam _tmp342
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -1376($fp)	# fill _tmp342 to $t0 from $fp-1376
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp345 = ACall _tmp344
	  lw $t0, -1384($fp)	# fill _tmp344 to $t0 from $fp-1384
	  jalr $t0            	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -1388($fp)	# spill _tmp345 from $t2 to $fp-1388
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# _tmp346 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -1392($fp)	# spill _tmp346 from $t2 to $fp-1392
	# _tmp347 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -1396($fp)	# spill _tmp347 from $t2 to $fp-1396
	# _tmp348 = *(_tmp346)
	  lw $t0, -1392($fp)	# fill _tmp346 to $t0 from $fp-1392
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -1400($fp)	# spill _tmp348 from $t2 to $fp-1400
	# _tmp349 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -1404($fp)	# spill _tmp349 from $t2 to $fp-1404
	# _tmp350 = _tmp347 < _tmp349
	  lw $t0, -1396($fp)	# fill _tmp347 to $t0 from $fp-1396
	  lw $t1, -1404($fp)	# fill _tmp349 to $t1 from $fp-1404
	  slt $t2, $t0, $t1	
	  sw $t2, -1408($fp)	# spill _tmp350 from $t2 to $fp-1408
	# _tmp351 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -1412($fp)	# spill _tmp351 from $t2 to $fp-1412
	# _tmp352 = _tmp348 - _tmp351
	  lw $t0, -1400($fp)	# fill _tmp348 to $t0 from $fp-1400
	  lw $t1, -1412($fp)	# fill _tmp351 to $t1 from $fp-1412
	  sub $t2, $t0, $t1	
	  sw $t2, -1416($fp)	# spill _tmp352 from $t2 to $fp-1416
	# _tmp353 = _tmp352 < _tmp347
	  lw $t0, -1416($fp)	# fill _tmp352 to $t0 from $fp-1416
	  lw $t1, -1396($fp)	# fill _tmp347 to $t1 from $fp-1396
	  slt $t2, $t0, $t1	
	  sw $t2, -1420($fp)	# spill _tmp353 from $t2 to $fp-1420
	# _tmp354 = _tmp350 || _tmp353
	  lw $t0, -1408($fp)	# fill _tmp350 to $t0 from $fp-1408
	  lw $t1, -1420($fp)	# fill _tmp353 to $t1 from $fp-1420
	  or $t2, $t0, $t1	
	  sw $t2, -1424($fp)	# spill _tmp354 from $t2 to $fp-1424
	# IfZ _tmp354 Goto arrayAcc_139
	  lw $t0, -1424($fp)	# fill _tmp354 to $t0 from $fp-1424
	  beqz $t0, arrayAcc_139	# branch if _tmp354 is zero 
	# _tmp355 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string99: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string99	# load label
	  sw $t2, -1428($fp)	# spill _tmp355 from $t2 to $fp-1428
	# PushParam _tmp355
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -1428($fp)	# fill _tmp355 to $t0 from $fp-1428
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_139:
	# _tmp356 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -1432($fp)	# spill _tmp356 from $t2 to $fp-1432
	# _tmp357 = _tmp347 * _tmp356
	  lw $t0, -1396($fp)	# fill _tmp347 to $t0 from $fp-1396
	  lw $t1, -1432($fp)	# fill _tmp356 to $t1 from $fp-1432
	  mul $t2, $t0, $t1	
	  sw $t2, -1436($fp)	# spill _tmp357 from $t2 to $fp-1436
	# _tmp358 = _tmp346 + _tmp357
	  lw $t0, -1392($fp)	# fill _tmp346 to $t0 from $fp-1392
	  lw $t1, -1436($fp)	# fill _tmp357 to $t1 from $fp-1436
	  add $t2, $t0, $t1	
	  sw $t2, -1440($fp)	# spill _tmp358 from $t2 to $fp-1440
	# _tmp359 = _tmp358 + _tmp356
	  lw $t0, -1440($fp)	# fill _tmp358 to $t0 from $fp-1440
	  lw $t1, -1432($fp)	# fill _tmp356 to $t1 from $fp-1432
	  add $t2, $t0, $t1	
	  sw $t2, -1444($fp)	# spill _tmp359 from $t2 to $fp-1444
	# _tmp360 = *(_tmp359)
	  lw $t0, -1444($fp)	# fill _tmp359 to $t0 from $fp-1444
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -1448($fp)	# spill _tmp360 from $t2 to $fp-1448
	# _tmp361 = 2
	  li $t2, 2		# load constant value 2 into $t2
	  sw $t2, -1452($fp)	# spill _tmp361 from $t2 to $fp-1452
	# _tmp362 = *(_tmp360)
	  lw $t0, -1448($fp)	# fill _tmp360 to $t0 from $fp-1448
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -1456($fp)	# spill _tmp362 from $t2 to $fp-1456
	# _tmp363 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -1460($fp)	# spill _tmp363 from $t2 to $fp-1460
	# _tmp364 = _tmp361 < _tmp363
	  lw $t0, -1452($fp)	# fill _tmp361 to $t0 from $fp-1452
	  lw $t1, -1460($fp)	# fill _tmp363 to $t1 from $fp-1460
	  slt $t2, $t0, $t1	
	  sw $t2, -1464($fp)	# spill _tmp364 from $t2 to $fp-1464
	# _tmp365 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -1468($fp)	# spill _tmp365 from $t2 to $fp-1468
	# _tmp366 = _tmp362 - _tmp365
	  lw $t0, -1456($fp)	# fill _tmp362 to $t0 from $fp-1456
	  lw $t1, -1468($fp)	# fill _tmp365 to $t1 from $fp-1468
	  sub $t2, $t0, $t1	
	  sw $t2, -1472($fp)	# spill _tmp366 from $t2 to $fp-1472
	# _tmp367 = _tmp366 < _tmp361
	  lw $t0, -1472($fp)	# fill _tmp366 to $t0 from $fp-1472
	  lw $t1, -1452($fp)	# fill _tmp361 to $t1 from $fp-1452
	  slt $t2, $t0, $t1	
	  sw $t2, -1476($fp)	# spill _tmp367 from $t2 to $fp-1476
	# _tmp368 = _tmp364 || _tmp367
	  lw $t0, -1464($fp)	# fill _tmp364 to $t0 from $fp-1464
	  lw $t1, -1476($fp)	# fill _tmp367 to $t1 from $fp-1476
	  or $t2, $t0, $t1	
	  sw $t2, -1480($fp)	# spill _tmp368 from $t2 to $fp-1480
	# IfZ _tmp368 Goto arrayAcc_140
	  lw $t0, -1480($fp)	# fill _tmp368 to $t0 from $fp-1480
	  beqz $t0, arrayAcc_140	# branch if _tmp368 is zero 
	# _tmp369 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string100: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string100	# load label
	  sw $t2, -1484($fp)	# spill _tmp369 from $t2 to $fp-1484
	# PushParam _tmp369
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -1484($fp)	# fill _tmp369 to $t0 from $fp-1484
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_140:
	# _tmp370 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -1488($fp)	# spill _tmp370 from $t2 to $fp-1488
	# _tmp371 = _tmp361 * _tmp370
	  lw $t0, -1452($fp)	# fill _tmp361 to $t0 from $fp-1452
	  lw $t1, -1488($fp)	# fill _tmp370 to $t1 from $fp-1488
	  mul $t2, $t0, $t1	
	  sw $t2, -1492($fp)	# spill _tmp371 from $t2 to $fp-1492
	# _tmp372 = _tmp360 + _tmp371
	  lw $t0, -1448($fp)	# fill _tmp360 to $t0 from $fp-1448
	  lw $t1, -1492($fp)	# fill _tmp371 to $t1 from $fp-1492
	  add $t2, $t0, $t1	
	  sw $t2, -1496($fp)	# spill _tmp372 from $t2 to $fp-1496
	# _tmp373 = _tmp372 + _tmp370
	  lw $t0, -1496($fp)	# fill _tmp372 to $t0 from $fp-1496
	  lw $t1, -1488($fp)	# fill _tmp370 to $t1 from $fp-1488
	  add $t2, $t0, $t1	
	  sw $t2, -1500($fp)	# spill _tmp373 from $t2 to $fp-1500
	# _tmp374 = *(_tmp373)
	  lw $t0, -1500($fp)	# fill _tmp373 to $t0 from $fp-1500
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -1504($fp)	# spill _tmp374 from $t2 to $fp-1504
	# _tmp375 = *(_tmp374)
	  lw $t0, -1504($fp)	# fill _tmp374 to $t0 from $fp-1504
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -1508($fp)	# spill _tmp375 from $t2 to $fp-1508
	# _tmp376 = *(_tmp375 + 20)
	  lw $t0, -1508($fp)	# fill _tmp375 to $t0 from $fp-1508
	  lw $t2, 20($t0) 	# load with offset
	  sw $t2, -1512($fp)	# spill _tmp376 from $t2 to $fp-1512
	# PushParam enemyMark
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, 8($fp)	# fill enemyMark to $t0 from $fp+8
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam _tmp374
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -1504($fp)	# fill _tmp374 to $t0 from $fp-1504
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp377 = ACall _tmp376
	  lw $t0, -1512($fp)	# fill _tmp376 to $t0 from $fp-1512
	  jalr $t0            	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -1516($fp)	# spill _tmp377 from $t2 to $fp-1516
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# _tmp378 = _tmp345 && _tmp377
	  lw $t0, -1388($fp)	# fill _tmp345 to $t0 from $fp-1388
	  lw $t1, -1516($fp)	# fill _tmp377 to $t1 from $fp-1516
	  and $t2, $t0, $t1	
	  sw $t2, -1520($fp)	# spill _tmp378 from $t2 to $fp-1520
	# _tmp379 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -1524($fp)	# spill _tmp379 from $t2 to $fp-1524
	# _tmp380 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -1528($fp)	# spill _tmp380 from $t2 to $fp-1528
	# _tmp381 = *(_tmp379)
	  lw $t0, -1524($fp)	# fill _tmp379 to $t0 from $fp-1524
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -1532($fp)	# spill _tmp381 from $t2 to $fp-1532
	# _tmp382 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -1536($fp)	# spill _tmp382 from $t2 to $fp-1536
	# _tmp383 = _tmp380 < _tmp382
	  lw $t0, -1528($fp)	# fill _tmp380 to $t0 from $fp-1528
	  lw $t1, -1536($fp)	# fill _tmp382 to $t1 from $fp-1536
	  slt $t2, $t0, $t1	
	  sw $t2, -1540($fp)	# spill _tmp383 from $t2 to $fp-1540
	# _tmp384 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -1544($fp)	# spill _tmp384 from $t2 to $fp-1544
	# _tmp385 = _tmp381 - _tmp384
	  lw $t0, -1532($fp)	# fill _tmp381 to $t0 from $fp-1532
	  lw $t1, -1544($fp)	# fill _tmp384 to $t1 from $fp-1544
	  sub $t2, $t0, $t1	
	  sw $t2, -1548($fp)	# spill _tmp385 from $t2 to $fp-1548
	# _tmp386 = _tmp385 < _tmp380
	  lw $t0, -1548($fp)	# fill _tmp385 to $t0 from $fp-1548
	  lw $t1, -1528($fp)	# fill _tmp380 to $t1 from $fp-1528
	  slt $t2, $t0, $t1	
	  sw $t2, -1552($fp)	# spill _tmp386 from $t2 to $fp-1552
	# _tmp387 = _tmp383 || _tmp386
	  lw $t0, -1540($fp)	# fill _tmp383 to $t0 from $fp-1540
	  lw $t1, -1552($fp)	# fill _tmp386 to $t1 from $fp-1552
	  or $t2, $t0, $t1	
	  sw $t2, -1556($fp)	# spill _tmp387 from $t2 to $fp-1556
	# IfZ _tmp387 Goto arrayAcc_141
	  lw $t0, -1556($fp)	# fill _tmp387 to $t0 from $fp-1556
	  beqz $t0, arrayAcc_141	# branch if _tmp387 is zero 
	# _tmp388 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string101: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string101	# load label
	  sw $t2, -1560($fp)	# spill _tmp388 from $t2 to $fp-1560
	# PushParam _tmp388
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -1560($fp)	# fill _tmp388 to $t0 from $fp-1560
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_141:
	# _tmp389 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -1564($fp)	# spill _tmp389 from $t2 to $fp-1564
	# _tmp390 = _tmp380 * _tmp389
	  lw $t0, -1528($fp)	# fill _tmp380 to $t0 from $fp-1528
	  lw $t1, -1564($fp)	# fill _tmp389 to $t1 from $fp-1564
	  mul $t2, $t0, $t1	
	  sw $t2, -1568($fp)	# spill _tmp390 from $t2 to $fp-1568
	# _tmp391 = _tmp379 + _tmp390
	  lw $t0, -1524($fp)	# fill _tmp379 to $t0 from $fp-1524
	  lw $t1, -1568($fp)	# fill _tmp390 to $t1 from $fp-1568
	  add $t2, $t0, $t1	
	  sw $t2, -1572($fp)	# spill _tmp391 from $t2 to $fp-1572
	# _tmp392 = _tmp391 + _tmp389
	  lw $t0, -1572($fp)	# fill _tmp391 to $t0 from $fp-1572
	  lw $t1, -1564($fp)	# fill _tmp389 to $t1 from $fp-1564
	  add $t2, $t0, $t1	
	  sw $t2, -1576($fp)	# spill _tmp392 from $t2 to $fp-1576
	# _tmp393 = *(_tmp392)
	  lw $t0, -1576($fp)	# fill _tmp392 to $t0 from $fp-1576
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -1580($fp)	# spill _tmp393 from $t2 to $fp-1580
	# _tmp394 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -1584($fp)	# spill _tmp394 from $t2 to $fp-1584
	# _tmp395 = *(_tmp393)
	  lw $t0, -1580($fp)	# fill _tmp393 to $t0 from $fp-1580
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -1588($fp)	# spill _tmp395 from $t2 to $fp-1588
	# _tmp396 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -1592($fp)	# spill _tmp396 from $t2 to $fp-1592
	# _tmp397 = _tmp394 < _tmp396
	  lw $t0, -1584($fp)	# fill _tmp394 to $t0 from $fp-1584
	  lw $t1, -1592($fp)	# fill _tmp396 to $t1 from $fp-1592
	  slt $t2, $t0, $t1	
	  sw $t2, -1596($fp)	# spill _tmp397 from $t2 to $fp-1596
	# _tmp398 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -1600($fp)	# spill _tmp398 from $t2 to $fp-1600
	# _tmp399 = _tmp395 - _tmp398
	  lw $t0, -1588($fp)	# fill _tmp395 to $t0 from $fp-1588
	  lw $t1, -1600($fp)	# fill _tmp398 to $t1 from $fp-1600
	  sub $t2, $t0, $t1	
	  sw $t2, -1604($fp)	# spill _tmp399 from $t2 to $fp-1604
	# _tmp400 = _tmp399 < _tmp394
	  lw $t0, -1604($fp)	# fill _tmp399 to $t0 from $fp-1604
	  lw $t1, -1584($fp)	# fill _tmp394 to $t1 from $fp-1584
	  slt $t2, $t0, $t1	
	  sw $t2, -1608($fp)	# spill _tmp400 from $t2 to $fp-1608
	# _tmp401 = _tmp397 || _tmp400
	  lw $t0, -1596($fp)	# fill _tmp397 to $t0 from $fp-1596
	  lw $t1, -1608($fp)	# fill _tmp400 to $t1 from $fp-1608
	  or $t2, $t0, $t1	
	  sw $t2, -1612($fp)	# spill _tmp401 from $t2 to $fp-1612
	# IfZ _tmp401 Goto arrayAcc_142
	  lw $t0, -1612($fp)	# fill _tmp401 to $t0 from $fp-1612
	  beqz $t0, arrayAcc_142	# branch if _tmp401 is zero 
	# _tmp402 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string102: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string102	# load label
	  sw $t2, -1616($fp)	# spill _tmp402 from $t2 to $fp-1616
	# PushParam _tmp402
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -1616($fp)	# fill _tmp402 to $t0 from $fp-1616
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_142:
	# _tmp403 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -1620($fp)	# spill _tmp403 from $t2 to $fp-1620
	# _tmp404 = _tmp394 * _tmp403
	  lw $t0, -1584($fp)	# fill _tmp394 to $t0 from $fp-1584
	  lw $t1, -1620($fp)	# fill _tmp403 to $t1 from $fp-1620
	  mul $t2, $t0, $t1	
	  sw $t2, -1624($fp)	# spill _tmp404 from $t2 to $fp-1624
	# _tmp405 = _tmp393 + _tmp404
	  lw $t0, -1580($fp)	# fill _tmp393 to $t0 from $fp-1580
	  lw $t1, -1624($fp)	# fill _tmp404 to $t1 from $fp-1624
	  add $t2, $t0, $t1	
	  sw $t2, -1628($fp)	# spill _tmp405 from $t2 to $fp-1628
	# _tmp406 = _tmp405 + _tmp403
	  lw $t0, -1628($fp)	# fill _tmp405 to $t0 from $fp-1628
	  lw $t1, -1620($fp)	# fill _tmp403 to $t1 from $fp-1620
	  add $t2, $t0, $t1	
	  sw $t2, -1632($fp)	# spill _tmp406 from $t2 to $fp-1632
	# _tmp407 = *(_tmp406)
	  lw $t0, -1632($fp)	# fill _tmp406 to $t0 from $fp-1632
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -1636($fp)	# spill _tmp407 from $t2 to $fp-1636
	# _tmp408 = *(_tmp407)
	  lw $t0, -1636($fp)	# fill _tmp407 to $t0 from $fp-1636
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -1640($fp)	# spill _tmp408 from $t2 to $fp-1640
	# _tmp409 = *(_tmp408 + 20)
	  lw $t0, -1640($fp)	# fill _tmp408 to $t0 from $fp-1640
	  lw $t2, 20($t0) 	# load with offset
	  sw $t2, -1644($fp)	# spill _tmp409 from $t2 to $fp-1644
	# PushParam playerMark
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, 12($fp)	# fill playerMark to $t0 from $fp+12
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam _tmp407
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -1636($fp)	# fill _tmp407 to $t0 from $fp-1636
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp410 = ACall _tmp409
	  lw $t0, -1644($fp)	# fill _tmp409 to $t0 from $fp-1644
	  jalr $t0            	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -1648($fp)	# spill _tmp410 from $t2 to $fp-1648
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# _tmp411 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -1652($fp)	# spill _tmp411 from $t2 to $fp-1652
	# _tmp412 = _tmp410 == _tmp411
	  lw $t0, -1648($fp)	# fill _tmp410 to $t0 from $fp-1648
	  lw $t1, -1652($fp)	# fill _tmp411 to $t1 from $fp-1652
	  seq $t2, $t0, $t1	
	  sw $t2, -1656($fp)	# spill _tmp412 from $t2 to $fp-1656
	# _tmp413 = _tmp378 && _tmp412
	  lw $t0, -1520($fp)	# fill _tmp378 to $t0 from $fp-1520
	  lw $t1, -1656($fp)	# fill _tmp412 to $t1 from $fp-1656
	  and $t2, $t0, $t1	
	  sw $t2, -1660($fp)	# spill _tmp413 from $t2 to $fp-1660
	# IfZ _tmp413 Goto else_143
	  lw $t0, -1660($fp)	# fill _tmp413 to $t0 from $fp-1660
	  beqz $t0, else_143	# branch if _tmp413 is zero 
	# _tmp414 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -1664($fp)	# spill _tmp414 from $t2 to $fp-1664
	# row = _tmp414
	  lw $t2, -1664($fp)	# fill _tmp414 to $t2 from $fp-1664
	  sw $t2, -8($fp)	# spill row from $t2 to $fp-8
	# _tmp415 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -1668($fp)	# spill _tmp415 from $t2 to $fp-1668
	# column = _tmp415
	  lw $t2, -1668($fp)	# fill _tmp415 to $t2 from $fp-1668
	  sw $t2, -12($fp)	# spill column from $t2 to $fp-12
	# Goto endif_144
	  b endif_144		# unconditional branch
  else_143:
	# _tmp416 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -1672($fp)	# spill _tmp416 from $t2 to $fp-1672
	# _tmp417 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -1676($fp)	# spill _tmp417 from $t2 to $fp-1676
	# _tmp418 = *(_tmp416)
	  lw $t0, -1672($fp)	# fill _tmp416 to $t0 from $fp-1672
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -1680($fp)	# spill _tmp418 from $t2 to $fp-1680
	# _tmp419 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -1684($fp)	# spill _tmp419 from $t2 to $fp-1684
	# _tmp420 = _tmp417 < _tmp419
	  lw $t0, -1676($fp)	# fill _tmp417 to $t0 from $fp-1676
	  lw $t1, -1684($fp)	# fill _tmp419 to $t1 from $fp-1684
	  slt $t2, $t0, $t1	
	  sw $t2, -1688($fp)	# spill _tmp420 from $t2 to $fp-1688
	# _tmp421 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -1692($fp)	# spill _tmp421 from $t2 to $fp-1692
	# _tmp422 = _tmp418 - _tmp421
	  lw $t0, -1680($fp)	# fill _tmp418 to $t0 from $fp-1680
	  lw $t1, -1692($fp)	# fill _tmp421 to $t1 from $fp-1692
	  sub $t2, $t0, $t1	
	  sw $t2, -1696($fp)	# spill _tmp422 from $t2 to $fp-1696
	# _tmp423 = _tmp422 < _tmp417
	  lw $t0, -1696($fp)	# fill _tmp422 to $t0 from $fp-1696
	  lw $t1, -1676($fp)	# fill _tmp417 to $t1 from $fp-1676
	  slt $t2, $t0, $t1	
	  sw $t2, -1700($fp)	# spill _tmp423 from $t2 to $fp-1700
	# _tmp424 = _tmp420 || _tmp423
	  lw $t0, -1688($fp)	# fill _tmp420 to $t0 from $fp-1688
	  lw $t1, -1700($fp)	# fill _tmp423 to $t1 from $fp-1700
	  or $t2, $t0, $t1	
	  sw $t2, -1704($fp)	# spill _tmp424 from $t2 to $fp-1704
	# IfZ _tmp424 Goto arrayAcc_145
	  lw $t0, -1704($fp)	# fill _tmp424 to $t0 from $fp-1704
	  beqz $t0, arrayAcc_145	# branch if _tmp424 is zero 
	# _tmp425 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string103: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string103	# load label
	  sw $t2, -1708($fp)	# spill _tmp425 from $t2 to $fp-1708
	# PushParam _tmp425
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -1708($fp)	# fill _tmp425 to $t0 from $fp-1708
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_145:
	# _tmp426 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -1712($fp)	# spill _tmp426 from $t2 to $fp-1712
	# _tmp427 = _tmp417 * _tmp426
	  lw $t0, -1676($fp)	# fill _tmp417 to $t0 from $fp-1676
	  lw $t1, -1712($fp)	# fill _tmp426 to $t1 from $fp-1712
	  mul $t2, $t0, $t1	
	  sw $t2, -1716($fp)	# spill _tmp427 from $t2 to $fp-1716
	# _tmp428 = _tmp416 + _tmp427
	  lw $t0, -1672($fp)	# fill _tmp416 to $t0 from $fp-1672
	  lw $t1, -1716($fp)	# fill _tmp427 to $t1 from $fp-1716
	  add $t2, $t0, $t1	
	  sw $t2, -1720($fp)	# spill _tmp428 from $t2 to $fp-1720
	# _tmp429 = _tmp428 + _tmp426
	  lw $t0, -1720($fp)	# fill _tmp428 to $t0 from $fp-1720
	  lw $t1, -1712($fp)	# fill _tmp426 to $t1 from $fp-1712
	  add $t2, $t0, $t1	
	  sw $t2, -1724($fp)	# spill _tmp429 from $t2 to $fp-1724
	# _tmp430 = *(_tmp429)
	  lw $t0, -1724($fp)	# fill _tmp429 to $t0 from $fp-1724
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -1728($fp)	# spill _tmp430 from $t2 to $fp-1728
	# _tmp431 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -1732($fp)	# spill _tmp431 from $t2 to $fp-1732
	# _tmp432 = *(_tmp430)
	  lw $t0, -1728($fp)	# fill _tmp430 to $t0 from $fp-1728
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -1736($fp)	# spill _tmp432 from $t2 to $fp-1736
	# _tmp433 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -1740($fp)	# spill _tmp433 from $t2 to $fp-1740
	# _tmp434 = _tmp431 < _tmp433
	  lw $t0, -1732($fp)	# fill _tmp431 to $t0 from $fp-1732
	  lw $t1, -1740($fp)	# fill _tmp433 to $t1 from $fp-1740
	  slt $t2, $t0, $t1	
	  sw $t2, -1744($fp)	# spill _tmp434 from $t2 to $fp-1744
	# _tmp435 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -1748($fp)	# spill _tmp435 from $t2 to $fp-1748
	# _tmp436 = _tmp432 - _tmp435
	  lw $t0, -1736($fp)	# fill _tmp432 to $t0 from $fp-1736
	  lw $t1, -1748($fp)	# fill _tmp435 to $t1 from $fp-1748
	  sub $t2, $t0, $t1	
	  sw $t2, -1752($fp)	# spill _tmp436 from $t2 to $fp-1752
	# _tmp437 = _tmp436 < _tmp431
	  lw $t0, -1752($fp)	# fill _tmp436 to $t0 from $fp-1752
	  lw $t1, -1732($fp)	# fill _tmp431 to $t1 from $fp-1732
	  slt $t2, $t0, $t1	
	  sw $t2, -1756($fp)	# spill _tmp437 from $t2 to $fp-1756
	# _tmp438 = _tmp434 || _tmp437
	  lw $t0, -1744($fp)	# fill _tmp434 to $t0 from $fp-1744
	  lw $t1, -1756($fp)	# fill _tmp437 to $t1 from $fp-1756
	  or $t2, $t0, $t1	
	  sw $t2, -1760($fp)	# spill _tmp438 from $t2 to $fp-1760
	# IfZ _tmp438 Goto arrayAcc_146
	  lw $t0, -1760($fp)	# fill _tmp438 to $t0 from $fp-1760
	  beqz $t0, arrayAcc_146	# branch if _tmp438 is zero 
	# _tmp439 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string104: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string104	# load label
	  sw $t2, -1764($fp)	# spill _tmp439 from $t2 to $fp-1764
	# PushParam _tmp439
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -1764($fp)	# fill _tmp439 to $t0 from $fp-1764
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_146:
	# _tmp440 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -1768($fp)	# spill _tmp440 from $t2 to $fp-1768
	# _tmp441 = _tmp431 * _tmp440
	  lw $t0, -1732($fp)	# fill _tmp431 to $t0 from $fp-1732
	  lw $t1, -1768($fp)	# fill _tmp440 to $t1 from $fp-1768
	  mul $t2, $t0, $t1	
	  sw $t2, -1772($fp)	# spill _tmp441 from $t2 to $fp-1772
	# _tmp442 = _tmp430 + _tmp441
	  lw $t0, -1728($fp)	# fill _tmp430 to $t0 from $fp-1728
	  lw $t1, -1772($fp)	# fill _tmp441 to $t1 from $fp-1772
	  add $t2, $t0, $t1	
	  sw $t2, -1776($fp)	# spill _tmp442 from $t2 to $fp-1776
	# _tmp443 = _tmp442 + _tmp440
	  lw $t0, -1776($fp)	# fill _tmp442 to $t0 from $fp-1776
	  lw $t1, -1768($fp)	# fill _tmp440 to $t1 from $fp-1768
	  add $t2, $t0, $t1	
	  sw $t2, -1780($fp)	# spill _tmp443 from $t2 to $fp-1780
	# _tmp444 = *(_tmp443)
	  lw $t0, -1780($fp)	# fill _tmp443 to $t0 from $fp-1780
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -1784($fp)	# spill _tmp444 from $t2 to $fp-1784
	# _tmp445 = *(_tmp444)
	  lw $t0, -1784($fp)	# fill _tmp444 to $t0 from $fp-1784
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -1788($fp)	# spill _tmp445 from $t2 to $fp-1788
	# _tmp446 = *(_tmp445 + 20)
	  lw $t0, -1788($fp)	# fill _tmp445 to $t0 from $fp-1788
	  lw $t2, 20($t0) 	# load with offset
	  sw $t2, -1792($fp)	# spill _tmp446 from $t2 to $fp-1792
	# PushParam enemyMark
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, 8($fp)	# fill enemyMark to $t0 from $fp+8
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam _tmp444
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -1784($fp)	# fill _tmp444 to $t0 from $fp-1784
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp447 = ACall _tmp446
	  lw $t0, -1792($fp)	# fill _tmp446 to $t0 from $fp-1792
	  jalr $t0            	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -1796($fp)	# spill _tmp447 from $t2 to $fp-1796
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# _tmp448 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -1800($fp)	# spill _tmp448 from $t2 to $fp-1800
	# _tmp449 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -1804($fp)	# spill _tmp449 from $t2 to $fp-1804
	# _tmp450 = *(_tmp448)
	  lw $t0, -1800($fp)	# fill _tmp448 to $t0 from $fp-1800
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -1808($fp)	# spill _tmp450 from $t2 to $fp-1808
	# _tmp451 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -1812($fp)	# spill _tmp451 from $t2 to $fp-1812
	# _tmp452 = _tmp449 < _tmp451
	  lw $t0, -1804($fp)	# fill _tmp449 to $t0 from $fp-1804
	  lw $t1, -1812($fp)	# fill _tmp451 to $t1 from $fp-1812
	  slt $t2, $t0, $t1	
	  sw $t2, -1816($fp)	# spill _tmp452 from $t2 to $fp-1816
	# _tmp453 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -1820($fp)	# spill _tmp453 from $t2 to $fp-1820
	# _tmp454 = _tmp450 - _tmp453
	  lw $t0, -1808($fp)	# fill _tmp450 to $t0 from $fp-1808
	  lw $t1, -1820($fp)	# fill _tmp453 to $t1 from $fp-1820
	  sub $t2, $t0, $t1	
	  sw $t2, -1824($fp)	# spill _tmp454 from $t2 to $fp-1824
	# _tmp455 = _tmp454 < _tmp449
	  lw $t0, -1824($fp)	# fill _tmp454 to $t0 from $fp-1824
	  lw $t1, -1804($fp)	# fill _tmp449 to $t1 from $fp-1804
	  slt $t2, $t0, $t1	
	  sw $t2, -1828($fp)	# spill _tmp455 from $t2 to $fp-1828
	# _tmp456 = _tmp452 || _tmp455
	  lw $t0, -1816($fp)	# fill _tmp452 to $t0 from $fp-1816
	  lw $t1, -1828($fp)	# fill _tmp455 to $t1 from $fp-1828
	  or $t2, $t0, $t1	
	  sw $t2, -1832($fp)	# spill _tmp456 from $t2 to $fp-1832
	# IfZ _tmp456 Goto arrayAcc_147
	  lw $t0, -1832($fp)	# fill _tmp456 to $t0 from $fp-1832
	  beqz $t0, arrayAcc_147	# branch if _tmp456 is zero 
	# _tmp457 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string105: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string105	# load label
	  sw $t2, -1836($fp)	# spill _tmp457 from $t2 to $fp-1836
	# PushParam _tmp457
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -1836($fp)	# fill _tmp457 to $t0 from $fp-1836
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_147:
	# _tmp458 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -1840($fp)	# spill _tmp458 from $t2 to $fp-1840
	# _tmp459 = _tmp449 * _tmp458
	  lw $t0, -1804($fp)	# fill _tmp449 to $t0 from $fp-1804
	  lw $t1, -1840($fp)	# fill _tmp458 to $t1 from $fp-1840
	  mul $t2, $t0, $t1	
	  sw $t2, -1844($fp)	# spill _tmp459 from $t2 to $fp-1844
	# _tmp460 = _tmp448 + _tmp459
	  lw $t0, -1800($fp)	# fill _tmp448 to $t0 from $fp-1800
	  lw $t1, -1844($fp)	# fill _tmp459 to $t1 from $fp-1844
	  add $t2, $t0, $t1	
	  sw $t2, -1848($fp)	# spill _tmp460 from $t2 to $fp-1848
	# _tmp461 = _tmp460 + _tmp458
	  lw $t0, -1848($fp)	# fill _tmp460 to $t0 from $fp-1848
	  lw $t1, -1840($fp)	# fill _tmp458 to $t1 from $fp-1840
	  add $t2, $t0, $t1	
	  sw $t2, -1852($fp)	# spill _tmp461 from $t2 to $fp-1852
	# _tmp462 = *(_tmp461)
	  lw $t0, -1852($fp)	# fill _tmp461 to $t0 from $fp-1852
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -1856($fp)	# spill _tmp462 from $t2 to $fp-1856
	# _tmp463 = 2
	  li $t2, 2		# load constant value 2 into $t2
	  sw $t2, -1860($fp)	# spill _tmp463 from $t2 to $fp-1860
	# _tmp464 = *(_tmp462)
	  lw $t0, -1856($fp)	# fill _tmp462 to $t0 from $fp-1856
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -1864($fp)	# spill _tmp464 from $t2 to $fp-1864
	# _tmp465 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -1868($fp)	# spill _tmp465 from $t2 to $fp-1868
	# _tmp466 = _tmp463 < _tmp465
	  lw $t0, -1860($fp)	# fill _tmp463 to $t0 from $fp-1860
	  lw $t1, -1868($fp)	# fill _tmp465 to $t1 from $fp-1868
	  slt $t2, $t0, $t1	
	  sw $t2, -1872($fp)	# spill _tmp466 from $t2 to $fp-1872
	# _tmp467 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -1876($fp)	# spill _tmp467 from $t2 to $fp-1876
	# _tmp468 = _tmp464 - _tmp467
	  lw $t0, -1864($fp)	# fill _tmp464 to $t0 from $fp-1864
	  lw $t1, -1876($fp)	# fill _tmp467 to $t1 from $fp-1876
	  sub $t2, $t0, $t1	
	  sw $t2, -1880($fp)	# spill _tmp468 from $t2 to $fp-1880
	# _tmp469 = _tmp468 < _tmp463
	  lw $t0, -1880($fp)	# fill _tmp468 to $t0 from $fp-1880
	  lw $t1, -1860($fp)	# fill _tmp463 to $t1 from $fp-1860
	  slt $t2, $t0, $t1	
	  sw $t2, -1884($fp)	# spill _tmp469 from $t2 to $fp-1884
	# _tmp470 = _tmp466 || _tmp469
	  lw $t0, -1872($fp)	# fill _tmp466 to $t0 from $fp-1872
	  lw $t1, -1884($fp)	# fill _tmp469 to $t1 from $fp-1884
	  or $t2, $t0, $t1	
	  sw $t2, -1888($fp)	# spill _tmp470 from $t2 to $fp-1888
	# IfZ _tmp470 Goto arrayAcc_148
	  lw $t0, -1888($fp)	# fill _tmp470 to $t0 from $fp-1888
	  beqz $t0, arrayAcc_148	# branch if _tmp470 is zero 
	# _tmp471 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string106: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string106	# load label
	  sw $t2, -1892($fp)	# spill _tmp471 from $t2 to $fp-1892
	# PushParam _tmp471
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -1892($fp)	# fill _tmp471 to $t0 from $fp-1892
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_148:
	# _tmp472 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -1896($fp)	# spill _tmp472 from $t2 to $fp-1896
	# _tmp473 = _tmp463 * _tmp472
	  lw $t0, -1860($fp)	# fill _tmp463 to $t0 from $fp-1860
	  lw $t1, -1896($fp)	# fill _tmp472 to $t1 from $fp-1896
	  mul $t2, $t0, $t1	
	  sw $t2, -1900($fp)	# spill _tmp473 from $t2 to $fp-1900
	# _tmp474 = _tmp462 + _tmp473
	  lw $t0, -1856($fp)	# fill _tmp462 to $t0 from $fp-1856
	  lw $t1, -1900($fp)	# fill _tmp473 to $t1 from $fp-1900
	  add $t2, $t0, $t1	
	  sw $t2, -1904($fp)	# spill _tmp474 from $t2 to $fp-1904
	# _tmp475 = _tmp474 + _tmp472
	  lw $t0, -1904($fp)	# fill _tmp474 to $t0 from $fp-1904
	  lw $t1, -1896($fp)	# fill _tmp472 to $t1 from $fp-1896
	  add $t2, $t0, $t1	
	  sw $t2, -1908($fp)	# spill _tmp475 from $t2 to $fp-1908
	# _tmp476 = *(_tmp475)
	  lw $t0, -1908($fp)	# fill _tmp475 to $t0 from $fp-1908
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -1912($fp)	# spill _tmp476 from $t2 to $fp-1912
	# _tmp477 = *(_tmp476)
	  lw $t0, -1912($fp)	# fill _tmp476 to $t0 from $fp-1912
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -1916($fp)	# spill _tmp477 from $t2 to $fp-1916
	# _tmp478 = *(_tmp477 + 20)
	  lw $t0, -1916($fp)	# fill _tmp477 to $t0 from $fp-1916
	  lw $t2, 20($t0) 	# load with offset
	  sw $t2, -1920($fp)	# spill _tmp478 from $t2 to $fp-1920
	# PushParam enemyMark
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, 8($fp)	# fill enemyMark to $t0 from $fp+8
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam _tmp476
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -1912($fp)	# fill _tmp476 to $t0 from $fp-1912
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp479 = ACall _tmp478
	  lw $t0, -1920($fp)	# fill _tmp478 to $t0 from $fp-1920
	  jalr $t0            	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -1924($fp)	# spill _tmp479 from $t2 to $fp-1924
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# _tmp480 = _tmp447 && _tmp479
	  lw $t0, -1796($fp)	# fill _tmp447 to $t0 from $fp-1796
	  lw $t1, -1924($fp)	# fill _tmp479 to $t1 from $fp-1924
	  and $t2, $t0, $t1	
	  sw $t2, -1928($fp)	# spill _tmp480 from $t2 to $fp-1928
	# _tmp481 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -1932($fp)	# spill _tmp481 from $t2 to $fp-1932
	# _tmp482 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -1936($fp)	# spill _tmp482 from $t2 to $fp-1936
	# _tmp483 = *(_tmp481)
	  lw $t0, -1932($fp)	# fill _tmp481 to $t0 from $fp-1932
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -1940($fp)	# spill _tmp483 from $t2 to $fp-1940
	# _tmp484 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -1944($fp)	# spill _tmp484 from $t2 to $fp-1944
	# _tmp485 = _tmp482 < _tmp484
	  lw $t0, -1936($fp)	# fill _tmp482 to $t0 from $fp-1936
	  lw $t1, -1944($fp)	# fill _tmp484 to $t1 from $fp-1944
	  slt $t2, $t0, $t1	
	  sw $t2, -1948($fp)	# spill _tmp485 from $t2 to $fp-1948
	# _tmp486 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -1952($fp)	# spill _tmp486 from $t2 to $fp-1952
	# _tmp487 = _tmp483 - _tmp486
	  lw $t0, -1940($fp)	# fill _tmp483 to $t0 from $fp-1940
	  lw $t1, -1952($fp)	# fill _tmp486 to $t1 from $fp-1952
	  sub $t2, $t0, $t1	
	  sw $t2, -1956($fp)	# spill _tmp487 from $t2 to $fp-1956
	# _tmp488 = _tmp487 < _tmp482
	  lw $t0, -1956($fp)	# fill _tmp487 to $t0 from $fp-1956
	  lw $t1, -1936($fp)	# fill _tmp482 to $t1 from $fp-1936
	  slt $t2, $t0, $t1	
	  sw $t2, -1960($fp)	# spill _tmp488 from $t2 to $fp-1960
	# _tmp489 = _tmp485 || _tmp488
	  lw $t0, -1948($fp)	# fill _tmp485 to $t0 from $fp-1948
	  lw $t1, -1960($fp)	# fill _tmp488 to $t1 from $fp-1960
	  or $t2, $t0, $t1	
	  sw $t2, -1964($fp)	# spill _tmp489 from $t2 to $fp-1964
	# IfZ _tmp489 Goto arrayAcc_149
	  lw $t0, -1964($fp)	# fill _tmp489 to $t0 from $fp-1964
	  beqz $t0, arrayAcc_149	# branch if _tmp489 is zero 
	# _tmp490 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string107: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string107	# load label
	  sw $t2, -1968($fp)	# spill _tmp490 from $t2 to $fp-1968
	# PushParam _tmp490
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -1968($fp)	# fill _tmp490 to $t0 from $fp-1968
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_149:
	# _tmp491 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -1972($fp)	# spill _tmp491 from $t2 to $fp-1972
	# _tmp492 = _tmp482 * _tmp491
	  lw $t0, -1936($fp)	# fill _tmp482 to $t0 from $fp-1936
	  lw $t1, -1972($fp)	# fill _tmp491 to $t1 from $fp-1972
	  mul $t2, $t0, $t1	
	  sw $t2, -1976($fp)	# spill _tmp492 from $t2 to $fp-1976
	# _tmp493 = _tmp481 + _tmp492
	  lw $t0, -1932($fp)	# fill _tmp481 to $t0 from $fp-1932
	  lw $t1, -1976($fp)	# fill _tmp492 to $t1 from $fp-1976
	  add $t2, $t0, $t1	
	  sw $t2, -1980($fp)	# spill _tmp493 from $t2 to $fp-1980
	# _tmp494 = _tmp493 + _tmp491
	  lw $t0, -1980($fp)	# fill _tmp493 to $t0 from $fp-1980
	  lw $t1, -1972($fp)	# fill _tmp491 to $t1 from $fp-1972
	  add $t2, $t0, $t1	
	  sw $t2, -1984($fp)	# spill _tmp494 from $t2 to $fp-1984
	# _tmp495 = *(_tmp494)
	  lw $t0, -1984($fp)	# fill _tmp494 to $t0 from $fp-1984
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -1988($fp)	# spill _tmp495 from $t2 to $fp-1988
	# _tmp496 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -1992($fp)	# spill _tmp496 from $t2 to $fp-1992
	# _tmp497 = *(_tmp495)
	  lw $t0, -1988($fp)	# fill _tmp495 to $t0 from $fp-1988
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -1996($fp)	# spill _tmp497 from $t2 to $fp-1996
	# _tmp498 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -2000($fp)	# spill _tmp498 from $t2 to $fp-2000
	# _tmp499 = _tmp496 < _tmp498
	  lw $t0, -1992($fp)	# fill _tmp496 to $t0 from $fp-1992
	  lw $t1, -2000($fp)	# fill _tmp498 to $t1 from $fp-2000
	  slt $t2, $t0, $t1	
	  sw $t2, -2004($fp)	# spill _tmp499 from $t2 to $fp-2004
	# _tmp500 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -2008($fp)	# spill _tmp500 from $t2 to $fp-2008
	# _tmp501 = _tmp497 - _tmp500
	  lw $t0, -1996($fp)	# fill _tmp497 to $t0 from $fp-1996
	  lw $t1, -2008($fp)	# fill _tmp500 to $t1 from $fp-2008
	  sub $t2, $t0, $t1	
	  sw $t2, -2012($fp)	# spill _tmp501 from $t2 to $fp-2012
	# _tmp502 = _tmp501 < _tmp496
	  lw $t0, -2012($fp)	# fill _tmp501 to $t0 from $fp-2012
	  lw $t1, -1992($fp)	# fill _tmp496 to $t1 from $fp-1992
	  slt $t2, $t0, $t1	
	  sw $t2, -2016($fp)	# spill _tmp502 from $t2 to $fp-2016
	# _tmp503 = _tmp499 || _tmp502
	  lw $t0, -2004($fp)	# fill _tmp499 to $t0 from $fp-2004
	  lw $t1, -2016($fp)	# fill _tmp502 to $t1 from $fp-2016
	  or $t2, $t0, $t1	
	  sw $t2, -2020($fp)	# spill _tmp503 from $t2 to $fp-2020
	# IfZ _tmp503 Goto arrayAcc_150
	  lw $t0, -2020($fp)	# fill _tmp503 to $t0 from $fp-2020
	  beqz $t0, arrayAcc_150	# branch if _tmp503 is zero 
	# _tmp504 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string108: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string108	# load label
	  sw $t2, -2024($fp)	# spill _tmp504 from $t2 to $fp-2024
	# PushParam _tmp504
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -2024($fp)	# fill _tmp504 to $t0 from $fp-2024
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_150:
	# _tmp505 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -2028($fp)	# spill _tmp505 from $t2 to $fp-2028
	# _tmp506 = _tmp496 * _tmp505
	  lw $t0, -1992($fp)	# fill _tmp496 to $t0 from $fp-1992
	  lw $t1, -2028($fp)	# fill _tmp505 to $t1 from $fp-2028
	  mul $t2, $t0, $t1	
	  sw $t2, -2032($fp)	# spill _tmp506 from $t2 to $fp-2032
	# _tmp507 = _tmp495 + _tmp506
	  lw $t0, -1988($fp)	# fill _tmp495 to $t0 from $fp-1988
	  lw $t1, -2032($fp)	# fill _tmp506 to $t1 from $fp-2032
	  add $t2, $t0, $t1	
	  sw $t2, -2036($fp)	# spill _tmp507 from $t2 to $fp-2036
	# _tmp508 = _tmp507 + _tmp505
	  lw $t0, -2036($fp)	# fill _tmp507 to $t0 from $fp-2036
	  lw $t1, -2028($fp)	# fill _tmp505 to $t1 from $fp-2028
	  add $t2, $t0, $t1	
	  sw $t2, -2040($fp)	# spill _tmp508 from $t2 to $fp-2040
	# _tmp509 = *(_tmp508)
	  lw $t0, -2040($fp)	# fill _tmp508 to $t0 from $fp-2040
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -2044($fp)	# spill _tmp509 from $t2 to $fp-2044
	# _tmp510 = *(_tmp509)
	  lw $t0, -2044($fp)	# fill _tmp509 to $t0 from $fp-2044
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -2048($fp)	# spill _tmp510 from $t2 to $fp-2048
	# _tmp511 = *(_tmp510 + 20)
	  lw $t0, -2048($fp)	# fill _tmp510 to $t0 from $fp-2048
	  lw $t2, 20($t0) 	# load with offset
	  sw $t2, -2052($fp)	# spill _tmp511 from $t2 to $fp-2052
	# PushParam playerMark
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, 12($fp)	# fill playerMark to $t0 from $fp+12
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam _tmp509
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -2044($fp)	# fill _tmp509 to $t0 from $fp-2044
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp512 = ACall _tmp511
	  lw $t0, -2052($fp)	# fill _tmp511 to $t0 from $fp-2052
	  jalr $t0            	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -2056($fp)	# spill _tmp512 from $t2 to $fp-2056
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# _tmp513 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -2060($fp)	# spill _tmp513 from $t2 to $fp-2060
	# _tmp514 = _tmp512 == _tmp513
	  lw $t0, -2056($fp)	# fill _tmp512 to $t0 from $fp-2056
	  lw $t1, -2060($fp)	# fill _tmp513 to $t1 from $fp-2060
	  seq $t2, $t0, $t1	
	  sw $t2, -2064($fp)	# spill _tmp514 from $t2 to $fp-2064
	# _tmp515 = _tmp480 && _tmp514
	  lw $t0, -1928($fp)	# fill _tmp480 to $t0 from $fp-1928
	  lw $t1, -2064($fp)	# fill _tmp514 to $t1 from $fp-2064
	  and $t2, $t0, $t1	
	  sw $t2, -2068($fp)	# spill _tmp515 from $t2 to $fp-2068
	# IfZ _tmp515 Goto else_151
	  lw $t0, -2068($fp)	# fill _tmp515 to $t0 from $fp-2068
	  beqz $t0, else_151	# branch if _tmp515 is zero 
	# _tmp516 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -2072($fp)	# spill _tmp516 from $t2 to $fp-2072
	# row = _tmp516
	  lw $t2, -2072($fp)	# fill _tmp516 to $t2 from $fp-2072
	  sw $t2, -8($fp)	# spill row from $t2 to $fp-8
	# _tmp517 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -2076($fp)	# spill _tmp517 from $t2 to $fp-2076
	# column = _tmp517
	  lw $t2, -2076($fp)	# fill _tmp517 to $t2 from $fp-2076
	  sw $t2, -12($fp)	# spill column from $t2 to $fp-12
	# Goto endif_152
	  b endif_152		# unconditional branch
  else_151:
	# _tmp518 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -2080($fp)	# spill _tmp518 from $t2 to $fp-2080
	# _tmp519 = 2
	  li $t2, 2		# load constant value 2 into $t2
	  sw $t2, -2084($fp)	# spill _tmp519 from $t2 to $fp-2084
	# _tmp520 = *(_tmp518)
	  lw $t0, -2080($fp)	# fill _tmp518 to $t0 from $fp-2080
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -2088($fp)	# spill _tmp520 from $t2 to $fp-2088
	# _tmp521 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -2092($fp)	# spill _tmp521 from $t2 to $fp-2092
	# _tmp522 = _tmp519 < _tmp521
	  lw $t0, -2084($fp)	# fill _tmp519 to $t0 from $fp-2084
	  lw $t1, -2092($fp)	# fill _tmp521 to $t1 from $fp-2092
	  slt $t2, $t0, $t1	
	  sw $t2, -2096($fp)	# spill _tmp522 from $t2 to $fp-2096
	# _tmp523 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -2100($fp)	# spill _tmp523 from $t2 to $fp-2100
	# _tmp524 = _tmp520 - _tmp523
	  lw $t0, -2088($fp)	# fill _tmp520 to $t0 from $fp-2088
	  lw $t1, -2100($fp)	# fill _tmp523 to $t1 from $fp-2100
	  sub $t2, $t0, $t1	
	  sw $t2, -2104($fp)	# spill _tmp524 from $t2 to $fp-2104
	# _tmp525 = _tmp524 < _tmp519
	  lw $t0, -2104($fp)	# fill _tmp524 to $t0 from $fp-2104
	  lw $t1, -2084($fp)	# fill _tmp519 to $t1 from $fp-2084
	  slt $t2, $t0, $t1	
	  sw $t2, -2108($fp)	# spill _tmp525 from $t2 to $fp-2108
	# _tmp526 = _tmp522 || _tmp525
	  lw $t0, -2096($fp)	# fill _tmp522 to $t0 from $fp-2096
	  lw $t1, -2108($fp)	# fill _tmp525 to $t1 from $fp-2108
	  or $t2, $t0, $t1	
	  sw $t2, -2112($fp)	# spill _tmp526 from $t2 to $fp-2112
	# IfZ _tmp526 Goto arrayAcc_153
	  lw $t0, -2112($fp)	# fill _tmp526 to $t0 from $fp-2112
	  beqz $t0, arrayAcc_153	# branch if _tmp526 is zero 
	# _tmp527 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string109: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string109	# load label
	  sw $t2, -2116($fp)	# spill _tmp527 from $t2 to $fp-2116
	# PushParam _tmp527
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -2116($fp)	# fill _tmp527 to $t0 from $fp-2116
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_153:
	# _tmp528 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -2120($fp)	# spill _tmp528 from $t2 to $fp-2120
	# _tmp529 = _tmp519 * _tmp528
	  lw $t0, -2084($fp)	# fill _tmp519 to $t0 from $fp-2084
	  lw $t1, -2120($fp)	# fill _tmp528 to $t1 from $fp-2120
	  mul $t2, $t0, $t1	
	  sw $t2, -2124($fp)	# spill _tmp529 from $t2 to $fp-2124
	# _tmp530 = _tmp518 + _tmp529
	  lw $t0, -2080($fp)	# fill _tmp518 to $t0 from $fp-2080
	  lw $t1, -2124($fp)	# fill _tmp529 to $t1 from $fp-2124
	  add $t2, $t0, $t1	
	  sw $t2, -2128($fp)	# spill _tmp530 from $t2 to $fp-2128
	# _tmp531 = _tmp530 + _tmp528
	  lw $t0, -2128($fp)	# fill _tmp530 to $t0 from $fp-2128
	  lw $t1, -2120($fp)	# fill _tmp528 to $t1 from $fp-2120
	  add $t2, $t0, $t1	
	  sw $t2, -2132($fp)	# spill _tmp531 from $t2 to $fp-2132
	# _tmp532 = *(_tmp531)
	  lw $t0, -2132($fp)	# fill _tmp531 to $t0 from $fp-2132
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -2136($fp)	# spill _tmp532 from $t2 to $fp-2136
	# _tmp533 = 2
	  li $t2, 2		# load constant value 2 into $t2
	  sw $t2, -2140($fp)	# spill _tmp533 from $t2 to $fp-2140
	# _tmp534 = *(_tmp532)
	  lw $t0, -2136($fp)	# fill _tmp532 to $t0 from $fp-2136
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -2144($fp)	# spill _tmp534 from $t2 to $fp-2144
	# _tmp535 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -2148($fp)	# spill _tmp535 from $t2 to $fp-2148
	# _tmp536 = _tmp533 < _tmp535
	  lw $t0, -2140($fp)	# fill _tmp533 to $t0 from $fp-2140
	  lw $t1, -2148($fp)	# fill _tmp535 to $t1 from $fp-2148
	  slt $t2, $t0, $t1	
	  sw $t2, -2152($fp)	# spill _tmp536 from $t2 to $fp-2152
	# _tmp537 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -2156($fp)	# spill _tmp537 from $t2 to $fp-2156
	# _tmp538 = _tmp534 - _tmp537
	  lw $t0, -2144($fp)	# fill _tmp534 to $t0 from $fp-2144
	  lw $t1, -2156($fp)	# fill _tmp537 to $t1 from $fp-2156
	  sub $t2, $t0, $t1	
	  sw $t2, -2160($fp)	# spill _tmp538 from $t2 to $fp-2160
	# _tmp539 = _tmp538 < _tmp533
	  lw $t0, -2160($fp)	# fill _tmp538 to $t0 from $fp-2160
	  lw $t1, -2140($fp)	# fill _tmp533 to $t1 from $fp-2140
	  slt $t2, $t0, $t1	
	  sw $t2, -2164($fp)	# spill _tmp539 from $t2 to $fp-2164
	# _tmp540 = _tmp536 || _tmp539
	  lw $t0, -2152($fp)	# fill _tmp536 to $t0 from $fp-2152
	  lw $t1, -2164($fp)	# fill _tmp539 to $t1 from $fp-2164
	  or $t2, $t0, $t1	
	  sw $t2, -2168($fp)	# spill _tmp540 from $t2 to $fp-2168
	# IfZ _tmp540 Goto arrayAcc_154
	  lw $t0, -2168($fp)	# fill _tmp540 to $t0 from $fp-2168
	  beqz $t0, arrayAcc_154	# branch if _tmp540 is zero 
	# _tmp541 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string110: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string110	# load label
	  sw $t2, -2172($fp)	# spill _tmp541 from $t2 to $fp-2172
	# PushParam _tmp541
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -2172($fp)	# fill _tmp541 to $t0 from $fp-2172
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_154:
	# _tmp542 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -2176($fp)	# spill _tmp542 from $t2 to $fp-2176
	# _tmp543 = _tmp533 * _tmp542
	  lw $t0, -2140($fp)	# fill _tmp533 to $t0 from $fp-2140
	  lw $t1, -2176($fp)	# fill _tmp542 to $t1 from $fp-2176
	  mul $t2, $t0, $t1	
	  sw $t2, -2180($fp)	# spill _tmp543 from $t2 to $fp-2180
	# _tmp544 = _tmp532 + _tmp543
	  lw $t0, -2136($fp)	# fill _tmp532 to $t0 from $fp-2136
	  lw $t1, -2180($fp)	# fill _tmp543 to $t1 from $fp-2180
	  add $t2, $t0, $t1	
	  sw $t2, -2184($fp)	# spill _tmp544 from $t2 to $fp-2184
	# _tmp545 = _tmp544 + _tmp542
	  lw $t0, -2184($fp)	# fill _tmp544 to $t0 from $fp-2184
	  lw $t1, -2176($fp)	# fill _tmp542 to $t1 from $fp-2176
	  add $t2, $t0, $t1	
	  sw $t2, -2188($fp)	# spill _tmp545 from $t2 to $fp-2188
	# _tmp546 = *(_tmp545)
	  lw $t0, -2188($fp)	# fill _tmp545 to $t0 from $fp-2188
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -2192($fp)	# spill _tmp546 from $t2 to $fp-2192
	# _tmp547 = *(_tmp546)
	  lw $t0, -2192($fp)	# fill _tmp546 to $t0 from $fp-2192
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -2196($fp)	# spill _tmp547 from $t2 to $fp-2196
	# _tmp548 = *(_tmp547 + 20)
	  lw $t0, -2196($fp)	# fill _tmp547 to $t0 from $fp-2196
	  lw $t2, 20($t0) 	# load with offset
	  sw $t2, -2200($fp)	# spill _tmp548 from $t2 to $fp-2200
	# PushParam enemyMark
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, 8($fp)	# fill enemyMark to $t0 from $fp+8
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam _tmp546
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -2192($fp)	# fill _tmp546 to $t0 from $fp-2192
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp549 = ACall _tmp548
	  lw $t0, -2200($fp)	# fill _tmp548 to $t0 from $fp-2200
	  jalr $t0            	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -2204($fp)	# spill _tmp549 from $t2 to $fp-2204
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# _tmp550 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -2208($fp)	# spill _tmp550 from $t2 to $fp-2208
	# _tmp551 = 2
	  li $t2, 2		# load constant value 2 into $t2
	  sw $t2, -2212($fp)	# spill _tmp551 from $t2 to $fp-2212
	# _tmp552 = *(_tmp550)
	  lw $t0, -2208($fp)	# fill _tmp550 to $t0 from $fp-2208
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -2216($fp)	# spill _tmp552 from $t2 to $fp-2216
	# _tmp553 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -2220($fp)	# spill _tmp553 from $t2 to $fp-2220
	# _tmp554 = _tmp551 < _tmp553
	  lw $t0, -2212($fp)	# fill _tmp551 to $t0 from $fp-2212
	  lw $t1, -2220($fp)	# fill _tmp553 to $t1 from $fp-2220
	  slt $t2, $t0, $t1	
	  sw $t2, -2224($fp)	# spill _tmp554 from $t2 to $fp-2224
	# _tmp555 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -2228($fp)	# spill _tmp555 from $t2 to $fp-2228
	# _tmp556 = _tmp552 - _tmp555
	  lw $t0, -2216($fp)	# fill _tmp552 to $t0 from $fp-2216
	  lw $t1, -2228($fp)	# fill _tmp555 to $t1 from $fp-2228
	  sub $t2, $t0, $t1	
	  sw $t2, -2232($fp)	# spill _tmp556 from $t2 to $fp-2232
	# _tmp557 = _tmp556 < _tmp551
	  lw $t0, -2232($fp)	# fill _tmp556 to $t0 from $fp-2232
	  lw $t1, -2212($fp)	# fill _tmp551 to $t1 from $fp-2212
	  slt $t2, $t0, $t1	
	  sw $t2, -2236($fp)	# spill _tmp557 from $t2 to $fp-2236
	# _tmp558 = _tmp554 || _tmp557
	  lw $t0, -2224($fp)	# fill _tmp554 to $t0 from $fp-2224
	  lw $t1, -2236($fp)	# fill _tmp557 to $t1 from $fp-2236
	  or $t2, $t0, $t1	
	  sw $t2, -2240($fp)	# spill _tmp558 from $t2 to $fp-2240
	# IfZ _tmp558 Goto arrayAcc_155
	  lw $t0, -2240($fp)	# fill _tmp558 to $t0 from $fp-2240
	  beqz $t0, arrayAcc_155	# branch if _tmp558 is zero 
	# _tmp559 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string111: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string111	# load label
	  sw $t2, -2244($fp)	# spill _tmp559 from $t2 to $fp-2244
	# PushParam _tmp559
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -2244($fp)	# fill _tmp559 to $t0 from $fp-2244
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_155:
	# _tmp560 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -2248($fp)	# spill _tmp560 from $t2 to $fp-2248
	# _tmp561 = _tmp551 * _tmp560
	  lw $t0, -2212($fp)	# fill _tmp551 to $t0 from $fp-2212
	  lw $t1, -2248($fp)	# fill _tmp560 to $t1 from $fp-2248
	  mul $t2, $t0, $t1	
	  sw $t2, -2252($fp)	# spill _tmp561 from $t2 to $fp-2252
	# _tmp562 = _tmp550 + _tmp561
	  lw $t0, -2208($fp)	# fill _tmp550 to $t0 from $fp-2208
	  lw $t1, -2252($fp)	# fill _tmp561 to $t1 from $fp-2252
	  add $t2, $t0, $t1	
	  sw $t2, -2256($fp)	# spill _tmp562 from $t2 to $fp-2256
	# _tmp563 = _tmp562 + _tmp560
	  lw $t0, -2256($fp)	# fill _tmp562 to $t0 from $fp-2256
	  lw $t1, -2248($fp)	# fill _tmp560 to $t1 from $fp-2248
	  add $t2, $t0, $t1	
	  sw $t2, -2260($fp)	# spill _tmp563 from $t2 to $fp-2260
	# _tmp564 = *(_tmp563)
	  lw $t0, -2260($fp)	# fill _tmp563 to $t0 from $fp-2260
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -2264($fp)	# spill _tmp564 from $t2 to $fp-2264
	# _tmp565 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -2268($fp)	# spill _tmp565 from $t2 to $fp-2268
	# _tmp566 = *(_tmp564)
	  lw $t0, -2264($fp)	# fill _tmp564 to $t0 from $fp-2264
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -2272($fp)	# spill _tmp566 from $t2 to $fp-2272
	# _tmp567 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -2276($fp)	# spill _tmp567 from $t2 to $fp-2276
	# _tmp568 = _tmp565 < _tmp567
	  lw $t0, -2268($fp)	# fill _tmp565 to $t0 from $fp-2268
	  lw $t1, -2276($fp)	# fill _tmp567 to $t1 from $fp-2276
	  slt $t2, $t0, $t1	
	  sw $t2, -2280($fp)	# spill _tmp568 from $t2 to $fp-2280
	# _tmp569 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -2284($fp)	# spill _tmp569 from $t2 to $fp-2284
	# _tmp570 = _tmp566 - _tmp569
	  lw $t0, -2272($fp)	# fill _tmp566 to $t0 from $fp-2272
	  lw $t1, -2284($fp)	# fill _tmp569 to $t1 from $fp-2284
	  sub $t2, $t0, $t1	
	  sw $t2, -2288($fp)	# spill _tmp570 from $t2 to $fp-2288
	# _tmp571 = _tmp570 < _tmp565
	  lw $t0, -2288($fp)	# fill _tmp570 to $t0 from $fp-2288
	  lw $t1, -2268($fp)	# fill _tmp565 to $t1 from $fp-2268
	  slt $t2, $t0, $t1	
	  sw $t2, -2292($fp)	# spill _tmp571 from $t2 to $fp-2292
	# _tmp572 = _tmp568 || _tmp571
	  lw $t0, -2280($fp)	# fill _tmp568 to $t0 from $fp-2280
	  lw $t1, -2292($fp)	# fill _tmp571 to $t1 from $fp-2292
	  or $t2, $t0, $t1	
	  sw $t2, -2296($fp)	# spill _tmp572 from $t2 to $fp-2296
	# IfZ _tmp572 Goto arrayAcc_156
	  lw $t0, -2296($fp)	# fill _tmp572 to $t0 from $fp-2296
	  beqz $t0, arrayAcc_156	# branch if _tmp572 is zero 
	# _tmp573 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string112: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string112	# load label
	  sw $t2, -2300($fp)	# spill _tmp573 from $t2 to $fp-2300
	# PushParam _tmp573
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -2300($fp)	# fill _tmp573 to $t0 from $fp-2300
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_156:
	# _tmp574 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -2304($fp)	# spill _tmp574 from $t2 to $fp-2304
	# _tmp575 = _tmp565 * _tmp574
	  lw $t0, -2268($fp)	# fill _tmp565 to $t0 from $fp-2268
	  lw $t1, -2304($fp)	# fill _tmp574 to $t1 from $fp-2304
	  mul $t2, $t0, $t1	
	  sw $t2, -2308($fp)	# spill _tmp575 from $t2 to $fp-2308
	# _tmp576 = _tmp564 + _tmp575
	  lw $t0, -2264($fp)	# fill _tmp564 to $t0 from $fp-2264
	  lw $t1, -2308($fp)	# fill _tmp575 to $t1 from $fp-2308
	  add $t2, $t0, $t1	
	  sw $t2, -2312($fp)	# spill _tmp576 from $t2 to $fp-2312
	# _tmp577 = _tmp576 + _tmp574
	  lw $t0, -2312($fp)	# fill _tmp576 to $t0 from $fp-2312
	  lw $t1, -2304($fp)	# fill _tmp574 to $t1 from $fp-2304
	  add $t2, $t0, $t1	
	  sw $t2, -2316($fp)	# spill _tmp577 from $t2 to $fp-2316
	# _tmp578 = *(_tmp577)
	  lw $t0, -2316($fp)	# fill _tmp577 to $t0 from $fp-2316
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -2320($fp)	# spill _tmp578 from $t2 to $fp-2320
	# _tmp579 = *(_tmp578)
	  lw $t0, -2320($fp)	# fill _tmp578 to $t0 from $fp-2320
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -2324($fp)	# spill _tmp579 from $t2 to $fp-2324
	# _tmp580 = *(_tmp579 + 20)
	  lw $t0, -2324($fp)	# fill _tmp579 to $t0 from $fp-2324
	  lw $t2, 20($t0) 	# load with offset
	  sw $t2, -2328($fp)	# spill _tmp580 from $t2 to $fp-2328
	# PushParam enemyMark
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, 8($fp)	# fill enemyMark to $t0 from $fp+8
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam _tmp578
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -2320($fp)	# fill _tmp578 to $t0 from $fp-2320
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp581 = ACall _tmp580
	  lw $t0, -2328($fp)	# fill _tmp580 to $t0 from $fp-2328
	  jalr $t0            	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -2332($fp)	# spill _tmp581 from $t2 to $fp-2332
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# _tmp582 = _tmp549 && _tmp581
	  lw $t0, -2204($fp)	# fill _tmp549 to $t0 from $fp-2204
	  lw $t1, -2332($fp)	# fill _tmp581 to $t1 from $fp-2332
	  and $t2, $t0, $t1	
	  sw $t2, -2336($fp)	# spill _tmp582 from $t2 to $fp-2336
	# _tmp583 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -2340($fp)	# spill _tmp583 from $t2 to $fp-2340
	# _tmp584 = 2
	  li $t2, 2		# load constant value 2 into $t2
	  sw $t2, -2344($fp)	# spill _tmp584 from $t2 to $fp-2344
	# _tmp585 = *(_tmp583)
	  lw $t0, -2340($fp)	# fill _tmp583 to $t0 from $fp-2340
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -2348($fp)	# spill _tmp585 from $t2 to $fp-2348
	# _tmp586 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -2352($fp)	# spill _tmp586 from $t2 to $fp-2352
	# _tmp587 = _tmp584 < _tmp586
	  lw $t0, -2344($fp)	# fill _tmp584 to $t0 from $fp-2344
	  lw $t1, -2352($fp)	# fill _tmp586 to $t1 from $fp-2352
	  slt $t2, $t0, $t1	
	  sw $t2, -2356($fp)	# spill _tmp587 from $t2 to $fp-2356
	# _tmp588 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -2360($fp)	# spill _tmp588 from $t2 to $fp-2360
	# _tmp589 = _tmp585 - _tmp588
	  lw $t0, -2348($fp)	# fill _tmp585 to $t0 from $fp-2348
	  lw $t1, -2360($fp)	# fill _tmp588 to $t1 from $fp-2360
	  sub $t2, $t0, $t1	
	  sw $t2, -2364($fp)	# spill _tmp589 from $t2 to $fp-2364
	# _tmp590 = _tmp589 < _tmp584
	  lw $t0, -2364($fp)	# fill _tmp589 to $t0 from $fp-2364
	  lw $t1, -2344($fp)	# fill _tmp584 to $t1 from $fp-2344
	  slt $t2, $t0, $t1	
	  sw $t2, -2368($fp)	# spill _tmp590 from $t2 to $fp-2368
	# _tmp591 = _tmp587 || _tmp590
	  lw $t0, -2356($fp)	# fill _tmp587 to $t0 from $fp-2356
	  lw $t1, -2368($fp)	# fill _tmp590 to $t1 from $fp-2368
	  or $t2, $t0, $t1	
	  sw $t2, -2372($fp)	# spill _tmp591 from $t2 to $fp-2372
	# IfZ _tmp591 Goto arrayAcc_157
	  lw $t0, -2372($fp)	# fill _tmp591 to $t0 from $fp-2372
	  beqz $t0, arrayAcc_157	# branch if _tmp591 is zero 
	# _tmp592 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string113: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string113	# load label
	  sw $t2, -2376($fp)	# spill _tmp592 from $t2 to $fp-2376
	# PushParam _tmp592
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -2376($fp)	# fill _tmp592 to $t0 from $fp-2376
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_157:
	# _tmp593 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -2380($fp)	# spill _tmp593 from $t2 to $fp-2380
	# _tmp594 = _tmp584 * _tmp593
	  lw $t0, -2344($fp)	# fill _tmp584 to $t0 from $fp-2344
	  lw $t1, -2380($fp)	# fill _tmp593 to $t1 from $fp-2380
	  mul $t2, $t0, $t1	
	  sw $t2, -2384($fp)	# spill _tmp594 from $t2 to $fp-2384
	# _tmp595 = _tmp583 + _tmp594
	  lw $t0, -2340($fp)	# fill _tmp583 to $t0 from $fp-2340
	  lw $t1, -2384($fp)	# fill _tmp594 to $t1 from $fp-2384
	  add $t2, $t0, $t1	
	  sw $t2, -2388($fp)	# spill _tmp595 from $t2 to $fp-2388
	# _tmp596 = _tmp595 + _tmp593
	  lw $t0, -2388($fp)	# fill _tmp595 to $t0 from $fp-2388
	  lw $t1, -2380($fp)	# fill _tmp593 to $t1 from $fp-2380
	  add $t2, $t0, $t1	
	  sw $t2, -2392($fp)	# spill _tmp596 from $t2 to $fp-2392
	# _tmp597 = *(_tmp596)
	  lw $t0, -2392($fp)	# fill _tmp596 to $t0 from $fp-2392
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -2396($fp)	# spill _tmp597 from $t2 to $fp-2396
	# _tmp598 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -2400($fp)	# spill _tmp598 from $t2 to $fp-2400
	# _tmp599 = *(_tmp597)
	  lw $t0, -2396($fp)	# fill _tmp597 to $t0 from $fp-2396
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -2404($fp)	# spill _tmp599 from $t2 to $fp-2404
	# _tmp600 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -2408($fp)	# spill _tmp600 from $t2 to $fp-2408
	# _tmp601 = _tmp598 < _tmp600
	  lw $t0, -2400($fp)	# fill _tmp598 to $t0 from $fp-2400
	  lw $t1, -2408($fp)	# fill _tmp600 to $t1 from $fp-2408
	  slt $t2, $t0, $t1	
	  sw $t2, -2412($fp)	# spill _tmp601 from $t2 to $fp-2412
	# _tmp602 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -2416($fp)	# spill _tmp602 from $t2 to $fp-2416
	# _tmp603 = _tmp599 - _tmp602
	  lw $t0, -2404($fp)	# fill _tmp599 to $t0 from $fp-2404
	  lw $t1, -2416($fp)	# fill _tmp602 to $t1 from $fp-2416
	  sub $t2, $t0, $t1	
	  sw $t2, -2420($fp)	# spill _tmp603 from $t2 to $fp-2420
	# _tmp604 = _tmp603 < _tmp598
	  lw $t0, -2420($fp)	# fill _tmp603 to $t0 from $fp-2420
	  lw $t1, -2400($fp)	# fill _tmp598 to $t1 from $fp-2400
	  slt $t2, $t0, $t1	
	  sw $t2, -2424($fp)	# spill _tmp604 from $t2 to $fp-2424
	# _tmp605 = _tmp601 || _tmp604
	  lw $t0, -2412($fp)	# fill _tmp601 to $t0 from $fp-2412
	  lw $t1, -2424($fp)	# fill _tmp604 to $t1 from $fp-2424
	  or $t2, $t0, $t1	
	  sw $t2, -2428($fp)	# spill _tmp605 from $t2 to $fp-2428
	# IfZ _tmp605 Goto arrayAcc_158
	  lw $t0, -2428($fp)	# fill _tmp605 to $t0 from $fp-2428
	  beqz $t0, arrayAcc_158	# branch if _tmp605 is zero 
	# _tmp606 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string114: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string114	# load label
	  sw $t2, -2432($fp)	# spill _tmp606 from $t2 to $fp-2432
	# PushParam _tmp606
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -2432($fp)	# fill _tmp606 to $t0 from $fp-2432
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_158:
	# _tmp607 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -2436($fp)	# spill _tmp607 from $t2 to $fp-2436
	# _tmp608 = _tmp598 * _tmp607
	  lw $t0, -2400($fp)	# fill _tmp598 to $t0 from $fp-2400
	  lw $t1, -2436($fp)	# fill _tmp607 to $t1 from $fp-2436
	  mul $t2, $t0, $t1	
	  sw $t2, -2440($fp)	# spill _tmp608 from $t2 to $fp-2440
	# _tmp609 = _tmp597 + _tmp608
	  lw $t0, -2396($fp)	# fill _tmp597 to $t0 from $fp-2396
	  lw $t1, -2440($fp)	# fill _tmp608 to $t1 from $fp-2440
	  add $t2, $t0, $t1	
	  sw $t2, -2444($fp)	# spill _tmp609 from $t2 to $fp-2444
	# _tmp610 = _tmp609 + _tmp607
	  lw $t0, -2444($fp)	# fill _tmp609 to $t0 from $fp-2444
	  lw $t1, -2436($fp)	# fill _tmp607 to $t1 from $fp-2436
	  add $t2, $t0, $t1	
	  sw $t2, -2448($fp)	# spill _tmp610 from $t2 to $fp-2448
	# _tmp611 = *(_tmp610)
	  lw $t0, -2448($fp)	# fill _tmp610 to $t0 from $fp-2448
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -2452($fp)	# spill _tmp611 from $t2 to $fp-2452
	# _tmp612 = *(_tmp611)
	  lw $t0, -2452($fp)	# fill _tmp611 to $t0 from $fp-2452
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -2456($fp)	# spill _tmp612 from $t2 to $fp-2456
	# _tmp613 = *(_tmp612 + 20)
	  lw $t0, -2456($fp)	# fill _tmp612 to $t0 from $fp-2456
	  lw $t2, 20($t0) 	# load with offset
	  sw $t2, -2460($fp)	# spill _tmp613 from $t2 to $fp-2460
	# PushParam playerMark
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, 12($fp)	# fill playerMark to $t0 from $fp+12
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam _tmp611
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -2452($fp)	# fill _tmp611 to $t0 from $fp-2452
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp614 = ACall _tmp613
	  lw $t0, -2460($fp)	# fill _tmp613 to $t0 from $fp-2460
	  jalr $t0            	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -2464($fp)	# spill _tmp614 from $t2 to $fp-2464
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# _tmp615 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -2468($fp)	# spill _tmp615 from $t2 to $fp-2468
	# _tmp616 = _tmp614 == _tmp615
	  lw $t0, -2464($fp)	# fill _tmp614 to $t0 from $fp-2464
	  lw $t1, -2468($fp)	# fill _tmp615 to $t1 from $fp-2468
	  seq $t2, $t0, $t1	
	  sw $t2, -2472($fp)	# spill _tmp616 from $t2 to $fp-2472
	# _tmp617 = _tmp582 && _tmp616
	  lw $t0, -2336($fp)	# fill _tmp582 to $t0 from $fp-2336
	  lw $t1, -2472($fp)	# fill _tmp616 to $t1 from $fp-2472
	  and $t2, $t0, $t1	
	  sw $t2, -2476($fp)	# spill _tmp617 from $t2 to $fp-2476
	# IfZ _tmp617 Goto else_159
	  lw $t0, -2476($fp)	# fill _tmp617 to $t0 from $fp-2476
	  beqz $t0, else_159	# branch if _tmp617 is zero 
	# _tmp618 = 2
	  li $t2, 2		# load constant value 2 into $t2
	  sw $t2, -2480($fp)	# spill _tmp618 from $t2 to $fp-2480
	# row = _tmp618
	  lw $t2, -2480($fp)	# fill _tmp618 to $t2 from $fp-2480
	  sw $t2, -8($fp)	# spill row from $t2 to $fp-8
	# _tmp619 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -2484($fp)	# spill _tmp619 from $t2 to $fp-2484
	# column = _tmp619
	  lw $t2, -2484($fp)	# fill _tmp619 to $t2 from $fp-2484
	  sw $t2, -12($fp)	# spill column from $t2 to $fp-12
	# Goto endif_160
	  b endif_160		# unconditional branch
  else_159:
	# _tmp620 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -2488($fp)	# spill _tmp620 from $t2 to $fp-2488
	# _tmp621 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -2492($fp)	# spill _tmp621 from $t2 to $fp-2492
	# _tmp622 = *(_tmp620)
	  lw $t0, -2488($fp)	# fill _tmp620 to $t0 from $fp-2488
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -2496($fp)	# spill _tmp622 from $t2 to $fp-2496
	# _tmp623 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -2500($fp)	# spill _tmp623 from $t2 to $fp-2500
	# _tmp624 = _tmp621 < _tmp623
	  lw $t0, -2492($fp)	# fill _tmp621 to $t0 from $fp-2492
	  lw $t1, -2500($fp)	# fill _tmp623 to $t1 from $fp-2500
	  slt $t2, $t0, $t1	
	  sw $t2, -2504($fp)	# spill _tmp624 from $t2 to $fp-2504
	# _tmp625 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -2508($fp)	# spill _tmp625 from $t2 to $fp-2508
	# _tmp626 = _tmp622 - _tmp625
	  lw $t0, -2496($fp)	# fill _tmp622 to $t0 from $fp-2496
	  lw $t1, -2508($fp)	# fill _tmp625 to $t1 from $fp-2508
	  sub $t2, $t0, $t1	
	  sw $t2, -2512($fp)	# spill _tmp626 from $t2 to $fp-2512
	# _tmp627 = _tmp626 < _tmp621
	  lw $t0, -2512($fp)	# fill _tmp626 to $t0 from $fp-2512
	  lw $t1, -2492($fp)	# fill _tmp621 to $t1 from $fp-2492
	  slt $t2, $t0, $t1	
	  sw $t2, -2516($fp)	# spill _tmp627 from $t2 to $fp-2516
	# _tmp628 = _tmp624 || _tmp627
	  lw $t0, -2504($fp)	# fill _tmp624 to $t0 from $fp-2504
	  lw $t1, -2516($fp)	# fill _tmp627 to $t1 from $fp-2516
	  or $t2, $t0, $t1	
	  sw $t2, -2520($fp)	# spill _tmp628 from $t2 to $fp-2520
	# IfZ _tmp628 Goto arrayAcc_161
	  lw $t0, -2520($fp)	# fill _tmp628 to $t0 from $fp-2520
	  beqz $t0, arrayAcc_161	# branch if _tmp628 is zero 
	# _tmp629 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string115: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string115	# load label
	  sw $t2, -2524($fp)	# spill _tmp629 from $t2 to $fp-2524
	# PushParam _tmp629
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -2524($fp)	# fill _tmp629 to $t0 from $fp-2524
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_161:
	# _tmp630 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -2528($fp)	# spill _tmp630 from $t2 to $fp-2528
	# _tmp631 = _tmp621 * _tmp630
	  lw $t0, -2492($fp)	# fill _tmp621 to $t0 from $fp-2492
	  lw $t1, -2528($fp)	# fill _tmp630 to $t1 from $fp-2528
	  mul $t2, $t0, $t1	
	  sw $t2, -2532($fp)	# spill _tmp631 from $t2 to $fp-2532
	# _tmp632 = _tmp620 + _tmp631
	  lw $t0, -2488($fp)	# fill _tmp620 to $t0 from $fp-2488
	  lw $t1, -2532($fp)	# fill _tmp631 to $t1 from $fp-2532
	  add $t2, $t0, $t1	
	  sw $t2, -2536($fp)	# spill _tmp632 from $t2 to $fp-2536
	# _tmp633 = _tmp632 + _tmp630
	  lw $t0, -2536($fp)	# fill _tmp632 to $t0 from $fp-2536
	  lw $t1, -2528($fp)	# fill _tmp630 to $t1 from $fp-2528
	  add $t2, $t0, $t1	
	  sw $t2, -2540($fp)	# spill _tmp633 from $t2 to $fp-2540
	# _tmp634 = *(_tmp633)
	  lw $t0, -2540($fp)	# fill _tmp633 to $t0 from $fp-2540
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -2544($fp)	# spill _tmp634 from $t2 to $fp-2544
	# _tmp635 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -2548($fp)	# spill _tmp635 from $t2 to $fp-2548
	# _tmp636 = *(_tmp634)
	  lw $t0, -2544($fp)	# fill _tmp634 to $t0 from $fp-2544
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -2552($fp)	# spill _tmp636 from $t2 to $fp-2552
	# _tmp637 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -2556($fp)	# spill _tmp637 from $t2 to $fp-2556
	# _tmp638 = _tmp635 < _tmp637
	  lw $t0, -2548($fp)	# fill _tmp635 to $t0 from $fp-2548
	  lw $t1, -2556($fp)	# fill _tmp637 to $t1 from $fp-2556
	  slt $t2, $t0, $t1	
	  sw $t2, -2560($fp)	# spill _tmp638 from $t2 to $fp-2560
	# _tmp639 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -2564($fp)	# spill _tmp639 from $t2 to $fp-2564
	# _tmp640 = _tmp636 - _tmp639
	  lw $t0, -2552($fp)	# fill _tmp636 to $t0 from $fp-2552
	  lw $t1, -2564($fp)	# fill _tmp639 to $t1 from $fp-2564
	  sub $t2, $t0, $t1	
	  sw $t2, -2568($fp)	# spill _tmp640 from $t2 to $fp-2568
	# _tmp641 = _tmp640 < _tmp635
	  lw $t0, -2568($fp)	# fill _tmp640 to $t0 from $fp-2568
	  lw $t1, -2548($fp)	# fill _tmp635 to $t1 from $fp-2548
	  slt $t2, $t0, $t1	
	  sw $t2, -2572($fp)	# spill _tmp641 from $t2 to $fp-2572
	# _tmp642 = _tmp638 || _tmp641
	  lw $t0, -2560($fp)	# fill _tmp638 to $t0 from $fp-2560
	  lw $t1, -2572($fp)	# fill _tmp641 to $t1 from $fp-2572
	  or $t2, $t0, $t1	
	  sw $t2, -2576($fp)	# spill _tmp642 from $t2 to $fp-2576
	# IfZ _tmp642 Goto arrayAcc_162
	  lw $t0, -2576($fp)	# fill _tmp642 to $t0 from $fp-2576
	  beqz $t0, arrayAcc_162	# branch if _tmp642 is zero 
	# _tmp643 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string116: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string116	# load label
	  sw $t2, -2580($fp)	# spill _tmp643 from $t2 to $fp-2580
	# PushParam _tmp643
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -2580($fp)	# fill _tmp643 to $t0 from $fp-2580
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_162:
	# _tmp644 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -2584($fp)	# spill _tmp644 from $t2 to $fp-2584
	# _tmp645 = _tmp635 * _tmp644
	  lw $t0, -2548($fp)	# fill _tmp635 to $t0 from $fp-2548
	  lw $t1, -2584($fp)	# fill _tmp644 to $t1 from $fp-2584
	  mul $t2, $t0, $t1	
	  sw $t2, -2588($fp)	# spill _tmp645 from $t2 to $fp-2588
	# _tmp646 = _tmp634 + _tmp645
	  lw $t0, -2544($fp)	# fill _tmp634 to $t0 from $fp-2544
	  lw $t1, -2588($fp)	# fill _tmp645 to $t1 from $fp-2588
	  add $t2, $t0, $t1	
	  sw $t2, -2592($fp)	# spill _tmp646 from $t2 to $fp-2592
	# _tmp647 = _tmp646 + _tmp644
	  lw $t0, -2592($fp)	# fill _tmp646 to $t0 from $fp-2592
	  lw $t1, -2584($fp)	# fill _tmp644 to $t1 from $fp-2584
	  add $t2, $t0, $t1	
	  sw $t2, -2596($fp)	# spill _tmp647 from $t2 to $fp-2596
	# _tmp648 = *(_tmp647)
	  lw $t0, -2596($fp)	# fill _tmp647 to $t0 from $fp-2596
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -2600($fp)	# spill _tmp648 from $t2 to $fp-2600
	# _tmp649 = *(_tmp648)
	  lw $t0, -2600($fp)	# fill _tmp648 to $t0 from $fp-2600
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -2604($fp)	# spill _tmp649 from $t2 to $fp-2604
	# _tmp650 = *(_tmp649 + 20)
	  lw $t0, -2604($fp)	# fill _tmp649 to $t0 from $fp-2604
	  lw $t2, 20($t0) 	# load with offset
	  sw $t2, -2608($fp)	# spill _tmp650 from $t2 to $fp-2608
	# PushParam enemyMark
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, 8($fp)	# fill enemyMark to $t0 from $fp+8
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam _tmp648
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -2600($fp)	# fill _tmp648 to $t0 from $fp-2600
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp651 = ACall _tmp650
	  lw $t0, -2608($fp)	# fill _tmp650 to $t0 from $fp-2608
	  jalr $t0            	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -2612($fp)	# spill _tmp651 from $t2 to $fp-2612
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# _tmp652 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -2616($fp)	# spill _tmp652 from $t2 to $fp-2616
	# _tmp653 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -2620($fp)	# spill _tmp653 from $t2 to $fp-2620
	# _tmp654 = *(_tmp652)
	  lw $t0, -2616($fp)	# fill _tmp652 to $t0 from $fp-2616
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -2624($fp)	# spill _tmp654 from $t2 to $fp-2624
	# _tmp655 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -2628($fp)	# spill _tmp655 from $t2 to $fp-2628
	# _tmp656 = _tmp653 < _tmp655
	  lw $t0, -2620($fp)	# fill _tmp653 to $t0 from $fp-2620
	  lw $t1, -2628($fp)	# fill _tmp655 to $t1 from $fp-2628
	  slt $t2, $t0, $t1	
	  sw $t2, -2632($fp)	# spill _tmp656 from $t2 to $fp-2632
	# _tmp657 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -2636($fp)	# spill _tmp657 from $t2 to $fp-2636
	# _tmp658 = _tmp654 - _tmp657
	  lw $t0, -2624($fp)	# fill _tmp654 to $t0 from $fp-2624
	  lw $t1, -2636($fp)	# fill _tmp657 to $t1 from $fp-2636
	  sub $t2, $t0, $t1	
	  sw $t2, -2640($fp)	# spill _tmp658 from $t2 to $fp-2640
	# _tmp659 = _tmp658 < _tmp653
	  lw $t0, -2640($fp)	# fill _tmp658 to $t0 from $fp-2640
	  lw $t1, -2620($fp)	# fill _tmp653 to $t1 from $fp-2620
	  slt $t2, $t0, $t1	
	  sw $t2, -2644($fp)	# spill _tmp659 from $t2 to $fp-2644
	# _tmp660 = _tmp656 || _tmp659
	  lw $t0, -2632($fp)	# fill _tmp656 to $t0 from $fp-2632
	  lw $t1, -2644($fp)	# fill _tmp659 to $t1 from $fp-2644
	  or $t2, $t0, $t1	
	  sw $t2, -2648($fp)	# spill _tmp660 from $t2 to $fp-2648
	# IfZ _tmp660 Goto arrayAcc_163
	  lw $t0, -2648($fp)	# fill _tmp660 to $t0 from $fp-2648
	  beqz $t0, arrayAcc_163	# branch if _tmp660 is zero 
	# _tmp661 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string117: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string117	# load label
	  sw $t2, -2652($fp)	# spill _tmp661 from $t2 to $fp-2652
	# PushParam _tmp661
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -2652($fp)	# fill _tmp661 to $t0 from $fp-2652
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_163:
	# _tmp662 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -2656($fp)	# spill _tmp662 from $t2 to $fp-2656
	# _tmp663 = _tmp653 * _tmp662
	  lw $t0, -2620($fp)	# fill _tmp653 to $t0 from $fp-2620
	  lw $t1, -2656($fp)	# fill _tmp662 to $t1 from $fp-2656
	  mul $t2, $t0, $t1	
	  sw $t2, -2660($fp)	# spill _tmp663 from $t2 to $fp-2660
	# _tmp664 = _tmp652 + _tmp663
	  lw $t0, -2616($fp)	# fill _tmp652 to $t0 from $fp-2616
	  lw $t1, -2660($fp)	# fill _tmp663 to $t1 from $fp-2660
	  add $t2, $t0, $t1	
	  sw $t2, -2664($fp)	# spill _tmp664 from $t2 to $fp-2664
	# _tmp665 = _tmp664 + _tmp662
	  lw $t0, -2664($fp)	# fill _tmp664 to $t0 from $fp-2664
	  lw $t1, -2656($fp)	# fill _tmp662 to $t1 from $fp-2656
	  add $t2, $t0, $t1	
	  sw $t2, -2668($fp)	# spill _tmp665 from $t2 to $fp-2668
	# _tmp666 = *(_tmp665)
	  lw $t0, -2668($fp)	# fill _tmp665 to $t0 from $fp-2668
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -2672($fp)	# spill _tmp666 from $t2 to $fp-2672
	# _tmp667 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -2676($fp)	# spill _tmp667 from $t2 to $fp-2676
	# _tmp668 = *(_tmp666)
	  lw $t0, -2672($fp)	# fill _tmp666 to $t0 from $fp-2672
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -2680($fp)	# spill _tmp668 from $t2 to $fp-2680
	# _tmp669 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -2684($fp)	# spill _tmp669 from $t2 to $fp-2684
	# _tmp670 = _tmp667 < _tmp669
	  lw $t0, -2676($fp)	# fill _tmp667 to $t0 from $fp-2676
	  lw $t1, -2684($fp)	# fill _tmp669 to $t1 from $fp-2684
	  slt $t2, $t0, $t1	
	  sw $t2, -2688($fp)	# spill _tmp670 from $t2 to $fp-2688
	# _tmp671 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -2692($fp)	# spill _tmp671 from $t2 to $fp-2692
	# _tmp672 = _tmp668 - _tmp671
	  lw $t0, -2680($fp)	# fill _tmp668 to $t0 from $fp-2680
	  lw $t1, -2692($fp)	# fill _tmp671 to $t1 from $fp-2692
	  sub $t2, $t0, $t1	
	  sw $t2, -2696($fp)	# spill _tmp672 from $t2 to $fp-2696
	# _tmp673 = _tmp672 < _tmp667
	  lw $t0, -2696($fp)	# fill _tmp672 to $t0 from $fp-2696
	  lw $t1, -2676($fp)	# fill _tmp667 to $t1 from $fp-2676
	  slt $t2, $t0, $t1	
	  sw $t2, -2700($fp)	# spill _tmp673 from $t2 to $fp-2700
	# _tmp674 = _tmp670 || _tmp673
	  lw $t0, -2688($fp)	# fill _tmp670 to $t0 from $fp-2688
	  lw $t1, -2700($fp)	# fill _tmp673 to $t1 from $fp-2700
	  or $t2, $t0, $t1	
	  sw $t2, -2704($fp)	# spill _tmp674 from $t2 to $fp-2704
	# IfZ _tmp674 Goto arrayAcc_164
	  lw $t0, -2704($fp)	# fill _tmp674 to $t0 from $fp-2704
	  beqz $t0, arrayAcc_164	# branch if _tmp674 is zero 
	# _tmp675 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string118: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string118	# load label
	  sw $t2, -2708($fp)	# spill _tmp675 from $t2 to $fp-2708
	# PushParam _tmp675
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -2708($fp)	# fill _tmp675 to $t0 from $fp-2708
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_164:
	# _tmp676 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -2712($fp)	# spill _tmp676 from $t2 to $fp-2712
	# _tmp677 = _tmp667 * _tmp676
	  lw $t0, -2676($fp)	# fill _tmp667 to $t0 from $fp-2676
	  lw $t1, -2712($fp)	# fill _tmp676 to $t1 from $fp-2712
	  mul $t2, $t0, $t1	
	  sw $t2, -2716($fp)	# spill _tmp677 from $t2 to $fp-2716
	# _tmp678 = _tmp666 + _tmp677
	  lw $t0, -2672($fp)	# fill _tmp666 to $t0 from $fp-2672
	  lw $t1, -2716($fp)	# fill _tmp677 to $t1 from $fp-2716
	  add $t2, $t0, $t1	
	  sw $t2, -2720($fp)	# spill _tmp678 from $t2 to $fp-2720
	# _tmp679 = _tmp678 + _tmp676
	  lw $t0, -2720($fp)	# fill _tmp678 to $t0 from $fp-2720
	  lw $t1, -2712($fp)	# fill _tmp676 to $t1 from $fp-2712
	  add $t2, $t0, $t1	
	  sw $t2, -2724($fp)	# spill _tmp679 from $t2 to $fp-2724
	# _tmp680 = *(_tmp679)
	  lw $t0, -2724($fp)	# fill _tmp679 to $t0 from $fp-2724
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -2728($fp)	# spill _tmp680 from $t2 to $fp-2728
	# _tmp681 = *(_tmp680)
	  lw $t0, -2728($fp)	# fill _tmp680 to $t0 from $fp-2728
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -2732($fp)	# spill _tmp681 from $t2 to $fp-2732
	# _tmp682 = *(_tmp681 + 20)
	  lw $t0, -2732($fp)	# fill _tmp681 to $t0 from $fp-2732
	  lw $t2, 20($t0) 	# load with offset
	  sw $t2, -2736($fp)	# spill _tmp682 from $t2 to $fp-2736
	# PushParam enemyMark
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, 8($fp)	# fill enemyMark to $t0 from $fp+8
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam _tmp680
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -2728($fp)	# fill _tmp680 to $t0 from $fp-2728
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp683 = ACall _tmp682
	  lw $t0, -2736($fp)	# fill _tmp682 to $t0 from $fp-2736
	  jalr $t0            	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -2740($fp)	# spill _tmp683 from $t2 to $fp-2740
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# _tmp684 = _tmp651 && _tmp683
	  lw $t0, -2612($fp)	# fill _tmp651 to $t0 from $fp-2612
	  lw $t1, -2740($fp)	# fill _tmp683 to $t1 from $fp-2740
	  and $t2, $t0, $t1	
	  sw $t2, -2744($fp)	# spill _tmp684 from $t2 to $fp-2744
	# _tmp685 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -2748($fp)	# spill _tmp685 from $t2 to $fp-2748
	# _tmp686 = 2
	  li $t2, 2		# load constant value 2 into $t2
	  sw $t2, -2752($fp)	# spill _tmp686 from $t2 to $fp-2752
	# _tmp687 = *(_tmp685)
	  lw $t0, -2748($fp)	# fill _tmp685 to $t0 from $fp-2748
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -2756($fp)	# spill _tmp687 from $t2 to $fp-2756
	# _tmp688 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -2760($fp)	# spill _tmp688 from $t2 to $fp-2760
	# _tmp689 = _tmp686 < _tmp688
	  lw $t0, -2752($fp)	# fill _tmp686 to $t0 from $fp-2752
	  lw $t1, -2760($fp)	# fill _tmp688 to $t1 from $fp-2760
	  slt $t2, $t0, $t1	
	  sw $t2, -2764($fp)	# spill _tmp689 from $t2 to $fp-2764
	# _tmp690 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -2768($fp)	# spill _tmp690 from $t2 to $fp-2768
	# _tmp691 = _tmp687 - _tmp690
	  lw $t0, -2756($fp)	# fill _tmp687 to $t0 from $fp-2756
	  lw $t1, -2768($fp)	# fill _tmp690 to $t1 from $fp-2768
	  sub $t2, $t0, $t1	
	  sw $t2, -2772($fp)	# spill _tmp691 from $t2 to $fp-2772
	# _tmp692 = _tmp691 < _tmp686
	  lw $t0, -2772($fp)	# fill _tmp691 to $t0 from $fp-2772
	  lw $t1, -2752($fp)	# fill _tmp686 to $t1 from $fp-2752
	  slt $t2, $t0, $t1	
	  sw $t2, -2776($fp)	# spill _tmp692 from $t2 to $fp-2776
	# _tmp693 = _tmp689 || _tmp692
	  lw $t0, -2764($fp)	# fill _tmp689 to $t0 from $fp-2764
	  lw $t1, -2776($fp)	# fill _tmp692 to $t1 from $fp-2776
	  or $t2, $t0, $t1	
	  sw $t2, -2780($fp)	# spill _tmp693 from $t2 to $fp-2780
	# IfZ _tmp693 Goto arrayAcc_165
	  lw $t0, -2780($fp)	# fill _tmp693 to $t0 from $fp-2780
	  beqz $t0, arrayAcc_165	# branch if _tmp693 is zero 
	# _tmp694 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string119: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string119	# load label
	  sw $t2, -2784($fp)	# spill _tmp694 from $t2 to $fp-2784
	# PushParam _tmp694
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -2784($fp)	# fill _tmp694 to $t0 from $fp-2784
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_165:
	# _tmp695 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -2788($fp)	# spill _tmp695 from $t2 to $fp-2788
	# _tmp696 = _tmp686 * _tmp695
	  lw $t0, -2752($fp)	# fill _tmp686 to $t0 from $fp-2752
	  lw $t1, -2788($fp)	# fill _tmp695 to $t1 from $fp-2788
	  mul $t2, $t0, $t1	
	  sw $t2, -2792($fp)	# spill _tmp696 from $t2 to $fp-2792
	# _tmp697 = _tmp685 + _tmp696
	  lw $t0, -2748($fp)	# fill _tmp685 to $t0 from $fp-2748
	  lw $t1, -2792($fp)	# fill _tmp696 to $t1 from $fp-2792
	  add $t2, $t0, $t1	
	  sw $t2, -2796($fp)	# spill _tmp697 from $t2 to $fp-2796
	# _tmp698 = _tmp697 + _tmp695
	  lw $t0, -2796($fp)	# fill _tmp697 to $t0 from $fp-2796
	  lw $t1, -2788($fp)	# fill _tmp695 to $t1 from $fp-2788
	  add $t2, $t0, $t1	
	  sw $t2, -2800($fp)	# spill _tmp698 from $t2 to $fp-2800
	# _tmp699 = *(_tmp698)
	  lw $t0, -2800($fp)	# fill _tmp698 to $t0 from $fp-2800
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -2804($fp)	# spill _tmp699 from $t2 to $fp-2804
	# _tmp700 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -2808($fp)	# spill _tmp700 from $t2 to $fp-2808
	# _tmp701 = *(_tmp699)
	  lw $t0, -2804($fp)	# fill _tmp699 to $t0 from $fp-2804
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -2812($fp)	# spill _tmp701 from $t2 to $fp-2812
	# _tmp702 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -2816($fp)	# spill _tmp702 from $t2 to $fp-2816
	# _tmp703 = _tmp700 < _tmp702
	  lw $t0, -2808($fp)	# fill _tmp700 to $t0 from $fp-2808
	  lw $t1, -2816($fp)	# fill _tmp702 to $t1 from $fp-2816
	  slt $t2, $t0, $t1	
	  sw $t2, -2820($fp)	# spill _tmp703 from $t2 to $fp-2820
	# _tmp704 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -2824($fp)	# spill _tmp704 from $t2 to $fp-2824
	# _tmp705 = _tmp701 - _tmp704
	  lw $t0, -2812($fp)	# fill _tmp701 to $t0 from $fp-2812
	  lw $t1, -2824($fp)	# fill _tmp704 to $t1 from $fp-2824
	  sub $t2, $t0, $t1	
	  sw $t2, -2828($fp)	# spill _tmp705 from $t2 to $fp-2828
	# _tmp706 = _tmp705 < _tmp700
	  lw $t0, -2828($fp)	# fill _tmp705 to $t0 from $fp-2828
	  lw $t1, -2808($fp)	# fill _tmp700 to $t1 from $fp-2808
	  slt $t2, $t0, $t1	
	  sw $t2, -2832($fp)	# spill _tmp706 from $t2 to $fp-2832
	# _tmp707 = _tmp703 || _tmp706
	  lw $t0, -2820($fp)	# fill _tmp703 to $t0 from $fp-2820
	  lw $t1, -2832($fp)	# fill _tmp706 to $t1 from $fp-2832
	  or $t2, $t0, $t1	
	  sw $t2, -2836($fp)	# spill _tmp707 from $t2 to $fp-2836
	# IfZ _tmp707 Goto arrayAcc_166
	  lw $t0, -2836($fp)	# fill _tmp707 to $t0 from $fp-2836
	  beqz $t0, arrayAcc_166	# branch if _tmp707 is zero 
	# _tmp708 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string120: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string120	# load label
	  sw $t2, -2840($fp)	# spill _tmp708 from $t2 to $fp-2840
	# PushParam _tmp708
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -2840($fp)	# fill _tmp708 to $t0 from $fp-2840
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_166:
	# _tmp709 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -2844($fp)	# spill _tmp709 from $t2 to $fp-2844
	# _tmp710 = _tmp700 * _tmp709
	  lw $t0, -2808($fp)	# fill _tmp700 to $t0 from $fp-2808
	  lw $t1, -2844($fp)	# fill _tmp709 to $t1 from $fp-2844
	  mul $t2, $t0, $t1	
	  sw $t2, -2848($fp)	# spill _tmp710 from $t2 to $fp-2848
	# _tmp711 = _tmp699 + _tmp710
	  lw $t0, -2804($fp)	# fill _tmp699 to $t0 from $fp-2804
	  lw $t1, -2848($fp)	# fill _tmp710 to $t1 from $fp-2848
	  add $t2, $t0, $t1	
	  sw $t2, -2852($fp)	# spill _tmp711 from $t2 to $fp-2852
	# _tmp712 = _tmp711 + _tmp709
	  lw $t0, -2852($fp)	# fill _tmp711 to $t0 from $fp-2852
	  lw $t1, -2844($fp)	# fill _tmp709 to $t1 from $fp-2844
	  add $t2, $t0, $t1	
	  sw $t2, -2856($fp)	# spill _tmp712 from $t2 to $fp-2856
	# _tmp713 = *(_tmp712)
	  lw $t0, -2856($fp)	# fill _tmp712 to $t0 from $fp-2856
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -2860($fp)	# spill _tmp713 from $t2 to $fp-2860
	# _tmp714 = *(_tmp713)
	  lw $t0, -2860($fp)	# fill _tmp713 to $t0 from $fp-2860
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -2864($fp)	# spill _tmp714 from $t2 to $fp-2864
	# _tmp715 = *(_tmp714 + 20)
	  lw $t0, -2864($fp)	# fill _tmp714 to $t0 from $fp-2864
	  lw $t2, 20($t0) 	# load with offset
	  sw $t2, -2868($fp)	# spill _tmp715 from $t2 to $fp-2868
	# PushParam playerMark
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, 12($fp)	# fill playerMark to $t0 from $fp+12
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam _tmp713
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -2860($fp)	# fill _tmp713 to $t0 from $fp-2860
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp716 = ACall _tmp715
	  lw $t0, -2868($fp)	# fill _tmp715 to $t0 from $fp-2868
	  jalr $t0            	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -2872($fp)	# spill _tmp716 from $t2 to $fp-2872
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# _tmp717 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -2876($fp)	# spill _tmp717 from $t2 to $fp-2876
	# _tmp718 = _tmp716 == _tmp717
	  lw $t0, -2872($fp)	# fill _tmp716 to $t0 from $fp-2872
	  lw $t1, -2876($fp)	# fill _tmp717 to $t1 from $fp-2876
	  seq $t2, $t0, $t1	
	  sw $t2, -2880($fp)	# spill _tmp718 from $t2 to $fp-2880
	# _tmp719 = _tmp684 && _tmp718
	  lw $t0, -2744($fp)	# fill _tmp684 to $t0 from $fp-2744
	  lw $t1, -2880($fp)	# fill _tmp718 to $t1 from $fp-2880
	  and $t2, $t0, $t1	
	  sw $t2, -2884($fp)	# spill _tmp719 from $t2 to $fp-2884
	# IfZ _tmp719 Goto else_167
	  lw $t0, -2884($fp)	# fill _tmp719 to $t0 from $fp-2884
	  beqz $t0, else_167	# branch if _tmp719 is zero 
	# _tmp720 = 2
	  li $t2, 2		# load constant value 2 into $t2
	  sw $t2, -2888($fp)	# spill _tmp720 from $t2 to $fp-2888
	# row = _tmp720
	  lw $t2, -2888($fp)	# fill _tmp720 to $t2 from $fp-2888
	  sw $t2, -8($fp)	# spill row from $t2 to $fp-8
	# _tmp721 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -2892($fp)	# spill _tmp721 from $t2 to $fp-2892
	# column = _tmp721
	  lw $t2, -2892($fp)	# fill _tmp721 to $t2 from $fp-2892
	  sw $t2, -12($fp)	# spill column from $t2 to $fp-12
	# Goto endif_168
	  b endif_168		# unconditional branch
  else_167:
	# _tmp722 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -2896($fp)	# spill _tmp722 from $t2 to $fp-2896
	# _tmp723 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -2900($fp)	# spill _tmp723 from $t2 to $fp-2900
	# _tmp724 = *(_tmp722)
	  lw $t0, -2896($fp)	# fill _tmp722 to $t0 from $fp-2896
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -2904($fp)	# spill _tmp724 from $t2 to $fp-2904
	# _tmp725 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -2908($fp)	# spill _tmp725 from $t2 to $fp-2908
	# _tmp726 = _tmp723 < _tmp725
	  lw $t0, -2900($fp)	# fill _tmp723 to $t0 from $fp-2900
	  lw $t1, -2908($fp)	# fill _tmp725 to $t1 from $fp-2908
	  slt $t2, $t0, $t1	
	  sw $t2, -2912($fp)	# spill _tmp726 from $t2 to $fp-2912
	# _tmp727 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -2916($fp)	# spill _tmp727 from $t2 to $fp-2916
	# _tmp728 = _tmp724 - _tmp727
	  lw $t0, -2904($fp)	# fill _tmp724 to $t0 from $fp-2904
	  lw $t1, -2916($fp)	# fill _tmp727 to $t1 from $fp-2916
	  sub $t2, $t0, $t1	
	  sw $t2, -2920($fp)	# spill _tmp728 from $t2 to $fp-2920
	# _tmp729 = _tmp728 < _tmp723
	  lw $t0, -2920($fp)	# fill _tmp728 to $t0 from $fp-2920
	  lw $t1, -2900($fp)	# fill _tmp723 to $t1 from $fp-2900
	  slt $t2, $t0, $t1	
	  sw $t2, -2924($fp)	# spill _tmp729 from $t2 to $fp-2924
	# _tmp730 = _tmp726 || _tmp729
	  lw $t0, -2912($fp)	# fill _tmp726 to $t0 from $fp-2912
	  lw $t1, -2924($fp)	# fill _tmp729 to $t1 from $fp-2924
	  or $t2, $t0, $t1	
	  sw $t2, -2928($fp)	# spill _tmp730 from $t2 to $fp-2928
	# IfZ _tmp730 Goto arrayAcc_169
	  lw $t0, -2928($fp)	# fill _tmp730 to $t0 from $fp-2928
	  beqz $t0, arrayAcc_169	# branch if _tmp730 is zero 
	# _tmp731 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string121: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string121	# load label
	  sw $t2, -2932($fp)	# spill _tmp731 from $t2 to $fp-2932
	# PushParam _tmp731
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -2932($fp)	# fill _tmp731 to $t0 from $fp-2932
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_169:
	# _tmp732 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -2936($fp)	# spill _tmp732 from $t2 to $fp-2936
	# _tmp733 = _tmp723 * _tmp732
	  lw $t0, -2900($fp)	# fill _tmp723 to $t0 from $fp-2900
	  lw $t1, -2936($fp)	# fill _tmp732 to $t1 from $fp-2936
	  mul $t2, $t0, $t1	
	  sw $t2, -2940($fp)	# spill _tmp733 from $t2 to $fp-2940
	# _tmp734 = _tmp722 + _tmp733
	  lw $t0, -2896($fp)	# fill _tmp722 to $t0 from $fp-2896
	  lw $t1, -2940($fp)	# fill _tmp733 to $t1 from $fp-2940
	  add $t2, $t0, $t1	
	  sw $t2, -2944($fp)	# spill _tmp734 from $t2 to $fp-2944
	# _tmp735 = _tmp734 + _tmp732
	  lw $t0, -2944($fp)	# fill _tmp734 to $t0 from $fp-2944
	  lw $t1, -2936($fp)	# fill _tmp732 to $t1 from $fp-2936
	  add $t2, $t0, $t1	
	  sw $t2, -2948($fp)	# spill _tmp735 from $t2 to $fp-2948
	# _tmp736 = *(_tmp735)
	  lw $t0, -2948($fp)	# fill _tmp735 to $t0 from $fp-2948
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -2952($fp)	# spill _tmp736 from $t2 to $fp-2952
	# _tmp737 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -2956($fp)	# spill _tmp737 from $t2 to $fp-2956
	# _tmp738 = *(_tmp736)
	  lw $t0, -2952($fp)	# fill _tmp736 to $t0 from $fp-2952
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -2960($fp)	# spill _tmp738 from $t2 to $fp-2960
	# _tmp739 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -2964($fp)	# spill _tmp739 from $t2 to $fp-2964
	# _tmp740 = _tmp737 < _tmp739
	  lw $t0, -2956($fp)	# fill _tmp737 to $t0 from $fp-2956
	  lw $t1, -2964($fp)	# fill _tmp739 to $t1 from $fp-2964
	  slt $t2, $t0, $t1	
	  sw $t2, -2968($fp)	# spill _tmp740 from $t2 to $fp-2968
	# _tmp741 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -2972($fp)	# spill _tmp741 from $t2 to $fp-2972
	# _tmp742 = _tmp738 - _tmp741
	  lw $t0, -2960($fp)	# fill _tmp738 to $t0 from $fp-2960
	  lw $t1, -2972($fp)	# fill _tmp741 to $t1 from $fp-2972
	  sub $t2, $t0, $t1	
	  sw $t2, -2976($fp)	# spill _tmp742 from $t2 to $fp-2976
	# _tmp743 = _tmp742 < _tmp737
	  lw $t0, -2976($fp)	# fill _tmp742 to $t0 from $fp-2976
	  lw $t1, -2956($fp)	# fill _tmp737 to $t1 from $fp-2956
	  slt $t2, $t0, $t1	
	  sw $t2, -2980($fp)	# spill _tmp743 from $t2 to $fp-2980
	# _tmp744 = _tmp740 || _tmp743
	  lw $t0, -2968($fp)	# fill _tmp740 to $t0 from $fp-2968
	  lw $t1, -2980($fp)	# fill _tmp743 to $t1 from $fp-2980
	  or $t2, $t0, $t1	
	  sw $t2, -2984($fp)	# spill _tmp744 from $t2 to $fp-2984
	# IfZ _tmp744 Goto arrayAcc_170
	  lw $t0, -2984($fp)	# fill _tmp744 to $t0 from $fp-2984
	  beqz $t0, arrayAcc_170	# branch if _tmp744 is zero 
	# _tmp745 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string122: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string122	# load label
	  sw $t2, -2988($fp)	# spill _tmp745 from $t2 to $fp-2988
	# PushParam _tmp745
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -2988($fp)	# fill _tmp745 to $t0 from $fp-2988
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_170:
	# _tmp746 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -2992($fp)	# spill _tmp746 from $t2 to $fp-2992
	# _tmp747 = _tmp737 * _tmp746
	  lw $t0, -2956($fp)	# fill _tmp737 to $t0 from $fp-2956
	  lw $t1, -2992($fp)	# fill _tmp746 to $t1 from $fp-2992
	  mul $t2, $t0, $t1	
	  sw $t2, -2996($fp)	# spill _tmp747 from $t2 to $fp-2996
	# _tmp748 = _tmp736 + _tmp747
	  lw $t0, -2952($fp)	# fill _tmp736 to $t0 from $fp-2952
	  lw $t1, -2996($fp)	# fill _tmp747 to $t1 from $fp-2996
	  add $t2, $t0, $t1	
	  sw $t2, -3000($fp)	# spill _tmp748 from $t2 to $fp-3000
	# _tmp749 = _tmp748 + _tmp746
	  lw $t0, -3000($fp)	# fill _tmp748 to $t0 from $fp-3000
	  lw $t1, -2992($fp)	# fill _tmp746 to $t1 from $fp-2992
	  add $t2, $t0, $t1	
	  sw $t2, -3004($fp)	# spill _tmp749 from $t2 to $fp-3004
	# _tmp750 = *(_tmp749)
	  lw $t0, -3004($fp)	# fill _tmp749 to $t0 from $fp-3004
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -3008($fp)	# spill _tmp750 from $t2 to $fp-3008
	# _tmp751 = *(_tmp750)
	  lw $t0, -3008($fp)	# fill _tmp750 to $t0 from $fp-3008
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -3012($fp)	# spill _tmp751 from $t2 to $fp-3012
	# _tmp752 = *(_tmp751 + 20)
	  lw $t0, -3012($fp)	# fill _tmp751 to $t0 from $fp-3012
	  lw $t2, 20($t0) 	# load with offset
	  sw $t2, -3016($fp)	# spill _tmp752 from $t2 to $fp-3016
	# PushParam enemyMark
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, 8($fp)	# fill enemyMark to $t0 from $fp+8
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam _tmp750
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -3008($fp)	# fill _tmp750 to $t0 from $fp-3008
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp753 = ACall _tmp752
	  lw $t0, -3016($fp)	# fill _tmp752 to $t0 from $fp-3016
	  jalr $t0            	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -3020($fp)	# spill _tmp753 from $t2 to $fp-3020
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# _tmp754 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -3024($fp)	# spill _tmp754 from $t2 to $fp-3024
	# _tmp755 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -3028($fp)	# spill _tmp755 from $t2 to $fp-3028
	# _tmp756 = *(_tmp754)
	  lw $t0, -3024($fp)	# fill _tmp754 to $t0 from $fp-3024
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -3032($fp)	# spill _tmp756 from $t2 to $fp-3032
	# _tmp757 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -3036($fp)	# spill _tmp757 from $t2 to $fp-3036
	# _tmp758 = _tmp755 < _tmp757
	  lw $t0, -3028($fp)	# fill _tmp755 to $t0 from $fp-3028
	  lw $t1, -3036($fp)	# fill _tmp757 to $t1 from $fp-3036
	  slt $t2, $t0, $t1	
	  sw $t2, -3040($fp)	# spill _tmp758 from $t2 to $fp-3040
	# _tmp759 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -3044($fp)	# spill _tmp759 from $t2 to $fp-3044
	# _tmp760 = _tmp756 - _tmp759
	  lw $t0, -3032($fp)	# fill _tmp756 to $t0 from $fp-3032
	  lw $t1, -3044($fp)	# fill _tmp759 to $t1 from $fp-3044
	  sub $t2, $t0, $t1	
	  sw $t2, -3048($fp)	# spill _tmp760 from $t2 to $fp-3048
	# _tmp761 = _tmp760 < _tmp755
	  lw $t0, -3048($fp)	# fill _tmp760 to $t0 from $fp-3048
	  lw $t1, -3028($fp)	# fill _tmp755 to $t1 from $fp-3028
	  slt $t2, $t0, $t1	
	  sw $t2, -3052($fp)	# spill _tmp761 from $t2 to $fp-3052
	# _tmp762 = _tmp758 || _tmp761
	  lw $t0, -3040($fp)	# fill _tmp758 to $t0 from $fp-3040
	  lw $t1, -3052($fp)	# fill _tmp761 to $t1 from $fp-3052
	  or $t2, $t0, $t1	
	  sw $t2, -3056($fp)	# spill _tmp762 from $t2 to $fp-3056
	# IfZ _tmp762 Goto arrayAcc_171
	  lw $t0, -3056($fp)	# fill _tmp762 to $t0 from $fp-3056
	  beqz $t0, arrayAcc_171	# branch if _tmp762 is zero 
	# _tmp763 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string123: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string123	# load label
	  sw $t2, -3060($fp)	# spill _tmp763 from $t2 to $fp-3060
	# PushParam _tmp763
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -3060($fp)	# fill _tmp763 to $t0 from $fp-3060
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_171:
	# _tmp764 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -3064($fp)	# spill _tmp764 from $t2 to $fp-3064
	# _tmp765 = _tmp755 * _tmp764
	  lw $t0, -3028($fp)	# fill _tmp755 to $t0 from $fp-3028
	  lw $t1, -3064($fp)	# fill _tmp764 to $t1 from $fp-3064
	  mul $t2, $t0, $t1	
	  sw $t2, -3068($fp)	# spill _tmp765 from $t2 to $fp-3068
	# _tmp766 = _tmp754 + _tmp765
	  lw $t0, -3024($fp)	# fill _tmp754 to $t0 from $fp-3024
	  lw $t1, -3068($fp)	# fill _tmp765 to $t1 from $fp-3068
	  add $t2, $t0, $t1	
	  sw $t2, -3072($fp)	# spill _tmp766 from $t2 to $fp-3072
	# _tmp767 = _tmp766 + _tmp764
	  lw $t0, -3072($fp)	# fill _tmp766 to $t0 from $fp-3072
	  lw $t1, -3064($fp)	# fill _tmp764 to $t1 from $fp-3064
	  add $t2, $t0, $t1	
	  sw $t2, -3076($fp)	# spill _tmp767 from $t2 to $fp-3076
	# _tmp768 = *(_tmp767)
	  lw $t0, -3076($fp)	# fill _tmp767 to $t0 from $fp-3076
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -3080($fp)	# spill _tmp768 from $t2 to $fp-3080
	# _tmp769 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -3084($fp)	# spill _tmp769 from $t2 to $fp-3084
	# _tmp770 = *(_tmp768)
	  lw $t0, -3080($fp)	# fill _tmp768 to $t0 from $fp-3080
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -3088($fp)	# spill _tmp770 from $t2 to $fp-3088
	# _tmp771 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -3092($fp)	# spill _tmp771 from $t2 to $fp-3092
	# _tmp772 = _tmp769 < _tmp771
	  lw $t0, -3084($fp)	# fill _tmp769 to $t0 from $fp-3084
	  lw $t1, -3092($fp)	# fill _tmp771 to $t1 from $fp-3092
	  slt $t2, $t0, $t1	
	  sw $t2, -3096($fp)	# spill _tmp772 from $t2 to $fp-3096
	# _tmp773 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -3100($fp)	# spill _tmp773 from $t2 to $fp-3100
	# _tmp774 = _tmp770 - _tmp773
	  lw $t0, -3088($fp)	# fill _tmp770 to $t0 from $fp-3088
	  lw $t1, -3100($fp)	# fill _tmp773 to $t1 from $fp-3100
	  sub $t2, $t0, $t1	
	  sw $t2, -3104($fp)	# spill _tmp774 from $t2 to $fp-3104
	# _tmp775 = _tmp774 < _tmp769
	  lw $t0, -3104($fp)	# fill _tmp774 to $t0 from $fp-3104
	  lw $t1, -3084($fp)	# fill _tmp769 to $t1 from $fp-3084
	  slt $t2, $t0, $t1	
	  sw $t2, -3108($fp)	# spill _tmp775 from $t2 to $fp-3108
	# _tmp776 = _tmp772 || _tmp775
	  lw $t0, -3096($fp)	# fill _tmp772 to $t0 from $fp-3096
	  lw $t1, -3108($fp)	# fill _tmp775 to $t1 from $fp-3108
	  or $t2, $t0, $t1	
	  sw $t2, -3112($fp)	# spill _tmp776 from $t2 to $fp-3112
	# IfZ _tmp776 Goto arrayAcc_172
	  lw $t0, -3112($fp)	# fill _tmp776 to $t0 from $fp-3112
	  beqz $t0, arrayAcc_172	# branch if _tmp776 is zero 
	# _tmp777 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string124: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string124	# load label
	  sw $t2, -3116($fp)	# spill _tmp777 from $t2 to $fp-3116
	# PushParam _tmp777
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -3116($fp)	# fill _tmp777 to $t0 from $fp-3116
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_172:
	# _tmp778 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -3120($fp)	# spill _tmp778 from $t2 to $fp-3120
	# _tmp779 = _tmp769 * _tmp778
	  lw $t0, -3084($fp)	# fill _tmp769 to $t0 from $fp-3084
	  lw $t1, -3120($fp)	# fill _tmp778 to $t1 from $fp-3120
	  mul $t2, $t0, $t1	
	  sw $t2, -3124($fp)	# spill _tmp779 from $t2 to $fp-3124
	# _tmp780 = _tmp768 + _tmp779
	  lw $t0, -3080($fp)	# fill _tmp768 to $t0 from $fp-3080
	  lw $t1, -3124($fp)	# fill _tmp779 to $t1 from $fp-3124
	  add $t2, $t0, $t1	
	  sw $t2, -3128($fp)	# spill _tmp780 from $t2 to $fp-3128
	# _tmp781 = _tmp780 + _tmp778
	  lw $t0, -3128($fp)	# fill _tmp780 to $t0 from $fp-3128
	  lw $t1, -3120($fp)	# fill _tmp778 to $t1 from $fp-3120
	  add $t2, $t0, $t1	
	  sw $t2, -3132($fp)	# spill _tmp781 from $t2 to $fp-3132
	# _tmp782 = *(_tmp781)
	  lw $t0, -3132($fp)	# fill _tmp781 to $t0 from $fp-3132
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -3136($fp)	# spill _tmp782 from $t2 to $fp-3136
	# _tmp783 = *(_tmp782)
	  lw $t0, -3136($fp)	# fill _tmp782 to $t0 from $fp-3136
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -3140($fp)	# spill _tmp783 from $t2 to $fp-3140
	# _tmp784 = *(_tmp783 + 20)
	  lw $t0, -3140($fp)	# fill _tmp783 to $t0 from $fp-3140
	  lw $t2, 20($t0) 	# load with offset
	  sw $t2, -3144($fp)	# spill _tmp784 from $t2 to $fp-3144
	# PushParam enemyMark
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, 8($fp)	# fill enemyMark to $t0 from $fp+8
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam _tmp782
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -3136($fp)	# fill _tmp782 to $t0 from $fp-3136
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp785 = ACall _tmp784
	  lw $t0, -3144($fp)	# fill _tmp784 to $t0 from $fp-3144
	  jalr $t0            	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -3148($fp)	# spill _tmp785 from $t2 to $fp-3148
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# _tmp786 = _tmp753 && _tmp785
	  lw $t0, -3020($fp)	# fill _tmp753 to $t0 from $fp-3020
	  lw $t1, -3148($fp)	# fill _tmp785 to $t1 from $fp-3148
	  and $t2, $t0, $t1	
	  sw $t2, -3152($fp)	# spill _tmp786 from $t2 to $fp-3152
	# _tmp787 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -3156($fp)	# spill _tmp787 from $t2 to $fp-3156
	# _tmp788 = 2
	  li $t2, 2		# load constant value 2 into $t2
	  sw $t2, -3160($fp)	# spill _tmp788 from $t2 to $fp-3160
	# _tmp789 = *(_tmp787)
	  lw $t0, -3156($fp)	# fill _tmp787 to $t0 from $fp-3156
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -3164($fp)	# spill _tmp789 from $t2 to $fp-3164
	# _tmp790 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -3168($fp)	# spill _tmp790 from $t2 to $fp-3168
	# _tmp791 = _tmp788 < _tmp790
	  lw $t0, -3160($fp)	# fill _tmp788 to $t0 from $fp-3160
	  lw $t1, -3168($fp)	# fill _tmp790 to $t1 from $fp-3168
	  slt $t2, $t0, $t1	
	  sw $t2, -3172($fp)	# spill _tmp791 from $t2 to $fp-3172
	# _tmp792 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -3176($fp)	# spill _tmp792 from $t2 to $fp-3176
	# _tmp793 = _tmp789 - _tmp792
	  lw $t0, -3164($fp)	# fill _tmp789 to $t0 from $fp-3164
	  lw $t1, -3176($fp)	# fill _tmp792 to $t1 from $fp-3176
	  sub $t2, $t0, $t1	
	  sw $t2, -3180($fp)	# spill _tmp793 from $t2 to $fp-3180
	# _tmp794 = _tmp793 < _tmp788
	  lw $t0, -3180($fp)	# fill _tmp793 to $t0 from $fp-3180
	  lw $t1, -3160($fp)	# fill _tmp788 to $t1 from $fp-3160
	  slt $t2, $t0, $t1	
	  sw $t2, -3184($fp)	# spill _tmp794 from $t2 to $fp-3184
	# _tmp795 = _tmp791 || _tmp794
	  lw $t0, -3172($fp)	# fill _tmp791 to $t0 from $fp-3172
	  lw $t1, -3184($fp)	# fill _tmp794 to $t1 from $fp-3184
	  or $t2, $t0, $t1	
	  sw $t2, -3188($fp)	# spill _tmp795 from $t2 to $fp-3188
	# IfZ _tmp795 Goto arrayAcc_173
	  lw $t0, -3188($fp)	# fill _tmp795 to $t0 from $fp-3188
	  beqz $t0, arrayAcc_173	# branch if _tmp795 is zero 
	# _tmp796 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string125: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string125	# load label
	  sw $t2, -3192($fp)	# spill _tmp796 from $t2 to $fp-3192
	# PushParam _tmp796
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -3192($fp)	# fill _tmp796 to $t0 from $fp-3192
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_173:
	# _tmp797 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -3196($fp)	# spill _tmp797 from $t2 to $fp-3196
	# _tmp798 = _tmp788 * _tmp797
	  lw $t0, -3160($fp)	# fill _tmp788 to $t0 from $fp-3160
	  lw $t1, -3196($fp)	# fill _tmp797 to $t1 from $fp-3196
	  mul $t2, $t0, $t1	
	  sw $t2, -3200($fp)	# spill _tmp798 from $t2 to $fp-3200
	# _tmp799 = _tmp787 + _tmp798
	  lw $t0, -3156($fp)	# fill _tmp787 to $t0 from $fp-3156
	  lw $t1, -3200($fp)	# fill _tmp798 to $t1 from $fp-3200
	  add $t2, $t0, $t1	
	  sw $t2, -3204($fp)	# spill _tmp799 from $t2 to $fp-3204
	# _tmp800 = _tmp799 + _tmp797
	  lw $t0, -3204($fp)	# fill _tmp799 to $t0 from $fp-3204
	  lw $t1, -3196($fp)	# fill _tmp797 to $t1 from $fp-3196
	  add $t2, $t0, $t1	
	  sw $t2, -3208($fp)	# spill _tmp800 from $t2 to $fp-3208
	# _tmp801 = *(_tmp800)
	  lw $t0, -3208($fp)	# fill _tmp800 to $t0 from $fp-3208
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -3212($fp)	# spill _tmp801 from $t2 to $fp-3212
	# _tmp802 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -3216($fp)	# spill _tmp802 from $t2 to $fp-3216
	# _tmp803 = *(_tmp801)
	  lw $t0, -3212($fp)	# fill _tmp801 to $t0 from $fp-3212
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -3220($fp)	# spill _tmp803 from $t2 to $fp-3220
	# _tmp804 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -3224($fp)	# spill _tmp804 from $t2 to $fp-3224
	# _tmp805 = _tmp802 < _tmp804
	  lw $t0, -3216($fp)	# fill _tmp802 to $t0 from $fp-3216
	  lw $t1, -3224($fp)	# fill _tmp804 to $t1 from $fp-3224
	  slt $t2, $t0, $t1	
	  sw $t2, -3228($fp)	# spill _tmp805 from $t2 to $fp-3228
	# _tmp806 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -3232($fp)	# spill _tmp806 from $t2 to $fp-3232
	# _tmp807 = _tmp803 - _tmp806
	  lw $t0, -3220($fp)	# fill _tmp803 to $t0 from $fp-3220
	  lw $t1, -3232($fp)	# fill _tmp806 to $t1 from $fp-3232
	  sub $t2, $t0, $t1	
	  sw $t2, -3236($fp)	# spill _tmp807 from $t2 to $fp-3236
	# _tmp808 = _tmp807 < _tmp802
	  lw $t0, -3236($fp)	# fill _tmp807 to $t0 from $fp-3236
	  lw $t1, -3216($fp)	# fill _tmp802 to $t1 from $fp-3216
	  slt $t2, $t0, $t1	
	  sw $t2, -3240($fp)	# spill _tmp808 from $t2 to $fp-3240
	# _tmp809 = _tmp805 || _tmp808
	  lw $t0, -3228($fp)	# fill _tmp805 to $t0 from $fp-3228
	  lw $t1, -3240($fp)	# fill _tmp808 to $t1 from $fp-3240
	  or $t2, $t0, $t1	
	  sw $t2, -3244($fp)	# spill _tmp809 from $t2 to $fp-3244
	# IfZ _tmp809 Goto arrayAcc_174
	  lw $t0, -3244($fp)	# fill _tmp809 to $t0 from $fp-3244
	  beqz $t0, arrayAcc_174	# branch if _tmp809 is zero 
	# _tmp810 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string126: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string126	# load label
	  sw $t2, -3248($fp)	# spill _tmp810 from $t2 to $fp-3248
	# PushParam _tmp810
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -3248($fp)	# fill _tmp810 to $t0 from $fp-3248
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_174:
	# _tmp811 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -3252($fp)	# spill _tmp811 from $t2 to $fp-3252
	# _tmp812 = _tmp802 * _tmp811
	  lw $t0, -3216($fp)	# fill _tmp802 to $t0 from $fp-3216
	  lw $t1, -3252($fp)	# fill _tmp811 to $t1 from $fp-3252
	  mul $t2, $t0, $t1	
	  sw $t2, -3256($fp)	# spill _tmp812 from $t2 to $fp-3256
	# _tmp813 = _tmp801 + _tmp812
	  lw $t0, -3212($fp)	# fill _tmp801 to $t0 from $fp-3212
	  lw $t1, -3256($fp)	# fill _tmp812 to $t1 from $fp-3256
	  add $t2, $t0, $t1	
	  sw $t2, -3260($fp)	# spill _tmp813 from $t2 to $fp-3260
	# _tmp814 = _tmp813 + _tmp811
	  lw $t0, -3260($fp)	# fill _tmp813 to $t0 from $fp-3260
	  lw $t1, -3252($fp)	# fill _tmp811 to $t1 from $fp-3252
	  add $t2, $t0, $t1	
	  sw $t2, -3264($fp)	# spill _tmp814 from $t2 to $fp-3264
	# _tmp815 = *(_tmp814)
	  lw $t0, -3264($fp)	# fill _tmp814 to $t0 from $fp-3264
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -3268($fp)	# spill _tmp815 from $t2 to $fp-3268
	# _tmp816 = *(_tmp815)
	  lw $t0, -3268($fp)	# fill _tmp815 to $t0 from $fp-3268
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -3272($fp)	# spill _tmp816 from $t2 to $fp-3272
	# _tmp817 = *(_tmp816 + 20)
	  lw $t0, -3272($fp)	# fill _tmp816 to $t0 from $fp-3272
	  lw $t2, 20($t0) 	# load with offset
	  sw $t2, -3276($fp)	# spill _tmp817 from $t2 to $fp-3276
	# PushParam playerMark
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, 12($fp)	# fill playerMark to $t0 from $fp+12
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam _tmp815
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -3268($fp)	# fill _tmp815 to $t0 from $fp-3268
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp818 = ACall _tmp817
	  lw $t0, -3276($fp)	# fill _tmp817 to $t0 from $fp-3276
	  jalr $t0            	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -3280($fp)	# spill _tmp818 from $t2 to $fp-3280
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# _tmp819 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -3284($fp)	# spill _tmp819 from $t2 to $fp-3284
	# _tmp820 = _tmp818 == _tmp819
	  lw $t0, -3280($fp)	# fill _tmp818 to $t0 from $fp-3280
	  lw $t1, -3284($fp)	# fill _tmp819 to $t1 from $fp-3284
	  seq $t2, $t0, $t1	
	  sw $t2, -3288($fp)	# spill _tmp820 from $t2 to $fp-3288
	# _tmp821 = _tmp786 && _tmp820
	  lw $t0, -3152($fp)	# fill _tmp786 to $t0 from $fp-3152
	  lw $t1, -3288($fp)	# fill _tmp820 to $t1 from $fp-3288
	  and $t2, $t0, $t1	
	  sw $t2, -3292($fp)	# spill _tmp821 from $t2 to $fp-3292
	# IfZ _tmp821 Goto else_175
	  lw $t0, -3292($fp)	# fill _tmp821 to $t0 from $fp-3292
	  beqz $t0, else_175	# branch if _tmp821 is zero 
	# _tmp822 = 2
	  li $t2, 2		# load constant value 2 into $t2
	  sw $t2, -3296($fp)	# spill _tmp822 from $t2 to $fp-3296
	# row = _tmp822
	  lw $t2, -3296($fp)	# fill _tmp822 to $t2 from $fp-3296
	  sw $t2, -8($fp)	# spill row from $t2 to $fp-8
	# _tmp823 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -3300($fp)	# spill _tmp823 from $t2 to $fp-3300
	# column = _tmp823
	  lw $t2, -3300($fp)	# fill _tmp823 to $t2 from $fp-3300
	  sw $t2, -12($fp)	# spill column from $t2 to $fp-12
	# Goto endif_176
	  b endif_176		# unconditional branch
  else_175:
	# _tmp824 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -3304($fp)	# spill _tmp824 from $t2 to $fp-3304
	# _tmp825 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -3308($fp)	# spill _tmp825 from $t2 to $fp-3308
	# _tmp826 = *(_tmp824)
	  lw $t0, -3304($fp)	# fill _tmp824 to $t0 from $fp-3304
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -3312($fp)	# spill _tmp826 from $t2 to $fp-3312
	# _tmp827 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -3316($fp)	# spill _tmp827 from $t2 to $fp-3316
	# _tmp828 = _tmp825 < _tmp827
	  lw $t0, -3308($fp)	# fill _tmp825 to $t0 from $fp-3308
	  lw $t1, -3316($fp)	# fill _tmp827 to $t1 from $fp-3316
	  slt $t2, $t0, $t1	
	  sw $t2, -3320($fp)	# spill _tmp828 from $t2 to $fp-3320
	# _tmp829 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -3324($fp)	# spill _tmp829 from $t2 to $fp-3324
	# _tmp830 = _tmp826 - _tmp829
	  lw $t0, -3312($fp)	# fill _tmp826 to $t0 from $fp-3312
	  lw $t1, -3324($fp)	# fill _tmp829 to $t1 from $fp-3324
	  sub $t2, $t0, $t1	
	  sw $t2, -3328($fp)	# spill _tmp830 from $t2 to $fp-3328
	# _tmp831 = _tmp830 < _tmp825
	  lw $t0, -3328($fp)	# fill _tmp830 to $t0 from $fp-3328
	  lw $t1, -3308($fp)	# fill _tmp825 to $t1 from $fp-3308
	  slt $t2, $t0, $t1	
	  sw $t2, -3332($fp)	# spill _tmp831 from $t2 to $fp-3332
	# _tmp832 = _tmp828 || _tmp831
	  lw $t0, -3320($fp)	# fill _tmp828 to $t0 from $fp-3320
	  lw $t1, -3332($fp)	# fill _tmp831 to $t1 from $fp-3332
	  or $t2, $t0, $t1	
	  sw $t2, -3336($fp)	# spill _tmp832 from $t2 to $fp-3336
	# IfZ _tmp832 Goto arrayAcc_177
	  lw $t0, -3336($fp)	# fill _tmp832 to $t0 from $fp-3336
	  beqz $t0, arrayAcc_177	# branch if _tmp832 is zero 
	# _tmp833 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string127: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string127	# load label
	  sw $t2, -3340($fp)	# spill _tmp833 from $t2 to $fp-3340
	# PushParam _tmp833
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -3340($fp)	# fill _tmp833 to $t0 from $fp-3340
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_177:
	# _tmp834 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -3344($fp)	# spill _tmp834 from $t2 to $fp-3344
	# _tmp835 = _tmp825 * _tmp834
	  lw $t0, -3308($fp)	# fill _tmp825 to $t0 from $fp-3308
	  lw $t1, -3344($fp)	# fill _tmp834 to $t1 from $fp-3344
	  mul $t2, $t0, $t1	
	  sw $t2, -3348($fp)	# spill _tmp835 from $t2 to $fp-3348
	# _tmp836 = _tmp824 + _tmp835
	  lw $t0, -3304($fp)	# fill _tmp824 to $t0 from $fp-3304
	  lw $t1, -3348($fp)	# fill _tmp835 to $t1 from $fp-3348
	  add $t2, $t0, $t1	
	  sw $t2, -3352($fp)	# spill _tmp836 from $t2 to $fp-3352
	# _tmp837 = _tmp836 + _tmp834
	  lw $t0, -3352($fp)	# fill _tmp836 to $t0 from $fp-3352
	  lw $t1, -3344($fp)	# fill _tmp834 to $t1 from $fp-3344
	  add $t2, $t0, $t1	
	  sw $t2, -3356($fp)	# spill _tmp837 from $t2 to $fp-3356
	# _tmp838 = *(_tmp837)
	  lw $t0, -3356($fp)	# fill _tmp837 to $t0 from $fp-3356
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -3360($fp)	# spill _tmp838 from $t2 to $fp-3360
	# _tmp839 = 2
	  li $t2, 2		# load constant value 2 into $t2
	  sw $t2, -3364($fp)	# spill _tmp839 from $t2 to $fp-3364
	# _tmp840 = *(_tmp838)
	  lw $t0, -3360($fp)	# fill _tmp838 to $t0 from $fp-3360
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -3368($fp)	# spill _tmp840 from $t2 to $fp-3368
	# _tmp841 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -3372($fp)	# spill _tmp841 from $t2 to $fp-3372
	# _tmp842 = _tmp839 < _tmp841
	  lw $t0, -3364($fp)	# fill _tmp839 to $t0 from $fp-3364
	  lw $t1, -3372($fp)	# fill _tmp841 to $t1 from $fp-3372
	  slt $t2, $t0, $t1	
	  sw $t2, -3376($fp)	# spill _tmp842 from $t2 to $fp-3376
	# _tmp843 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -3380($fp)	# spill _tmp843 from $t2 to $fp-3380
	# _tmp844 = _tmp840 - _tmp843
	  lw $t0, -3368($fp)	# fill _tmp840 to $t0 from $fp-3368
	  lw $t1, -3380($fp)	# fill _tmp843 to $t1 from $fp-3380
	  sub $t2, $t0, $t1	
	  sw $t2, -3384($fp)	# spill _tmp844 from $t2 to $fp-3384
	# _tmp845 = _tmp844 < _tmp839
	  lw $t0, -3384($fp)	# fill _tmp844 to $t0 from $fp-3384
	  lw $t1, -3364($fp)	# fill _tmp839 to $t1 from $fp-3364
	  slt $t2, $t0, $t1	
	  sw $t2, -3388($fp)	# spill _tmp845 from $t2 to $fp-3388
	# _tmp846 = _tmp842 || _tmp845
	  lw $t0, -3376($fp)	# fill _tmp842 to $t0 from $fp-3376
	  lw $t1, -3388($fp)	# fill _tmp845 to $t1 from $fp-3388
	  or $t2, $t0, $t1	
	  sw $t2, -3392($fp)	# spill _tmp846 from $t2 to $fp-3392
	# IfZ _tmp846 Goto arrayAcc_178
	  lw $t0, -3392($fp)	# fill _tmp846 to $t0 from $fp-3392
	  beqz $t0, arrayAcc_178	# branch if _tmp846 is zero 
	# _tmp847 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string128: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string128	# load label
	  sw $t2, -3396($fp)	# spill _tmp847 from $t2 to $fp-3396
	# PushParam _tmp847
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -3396($fp)	# fill _tmp847 to $t0 from $fp-3396
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_178:
	# _tmp848 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -3400($fp)	# spill _tmp848 from $t2 to $fp-3400
	# _tmp849 = _tmp839 * _tmp848
	  lw $t0, -3364($fp)	# fill _tmp839 to $t0 from $fp-3364
	  lw $t1, -3400($fp)	# fill _tmp848 to $t1 from $fp-3400
	  mul $t2, $t0, $t1	
	  sw $t2, -3404($fp)	# spill _tmp849 from $t2 to $fp-3404
	# _tmp850 = _tmp838 + _tmp849
	  lw $t0, -3360($fp)	# fill _tmp838 to $t0 from $fp-3360
	  lw $t1, -3404($fp)	# fill _tmp849 to $t1 from $fp-3404
	  add $t2, $t0, $t1	
	  sw $t2, -3408($fp)	# spill _tmp850 from $t2 to $fp-3408
	# _tmp851 = _tmp850 + _tmp848
	  lw $t0, -3408($fp)	# fill _tmp850 to $t0 from $fp-3408
	  lw $t1, -3400($fp)	# fill _tmp848 to $t1 from $fp-3400
	  add $t2, $t0, $t1	
	  sw $t2, -3412($fp)	# spill _tmp851 from $t2 to $fp-3412
	# _tmp852 = *(_tmp851)
	  lw $t0, -3412($fp)	# fill _tmp851 to $t0 from $fp-3412
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -3416($fp)	# spill _tmp852 from $t2 to $fp-3416
	# _tmp853 = *(_tmp852)
	  lw $t0, -3416($fp)	# fill _tmp852 to $t0 from $fp-3416
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -3420($fp)	# spill _tmp853 from $t2 to $fp-3420
	# _tmp854 = *(_tmp853 + 20)
	  lw $t0, -3420($fp)	# fill _tmp853 to $t0 from $fp-3420
	  lw $t2, 20($t0) 	# load with offset
	  sw $t2, -3424($fp)	# spill _tmp854 from $t2 to $fp-3424
	# PushParam enemyMark
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, 8($fp)	# fill enemyMark to $t0 from $fp+8
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam _tmp852
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -3416($fp)	# fill _tmp852 to $t0 from $fp-3416
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp855 = ACall _tmp854
	  lw $t0, -3424($fp)	# fill _tmp854 to $t0 from $fp-3424
	  jalr $t0            	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -3428($fp)	# spill _tmp855 from $t2 to $fp-3428
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# _tmp856 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -3432($fp)	# spill _tmp856 from $t2 to $fp-3432
	# _tmp857 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -3436($fp)	# spill _tmp857 from $t2 to $fp-3436
	# _tmp858 = *(_tmp856)
	  lw $t0, -3432($fp)	# fill _tmp856 to $t0 from $fp-3432
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -3440($fp)	# spill _tmp858 from $t2 to $fp-3440
	# _tmp859 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -3444($fp)	# spill _tmp859 from $t2 to $fp-3444
	# _tmp860 = _tmp857 < _tmp859
	  lw $t0, -3436($fp)	# fill _tmp857 to $t0 from $fp-3436
	  lw $t1, -3444($fp)	# fill _tmp859 to $t1 from $fp-3444
	  slt $t2, $t0, $t1	
	  sw $t2, -3448($fp)	# spill _tmp860 from $t2 to $fp-3448
	# _tmp861 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -3452($fp)	# spill _tmp861 from $t2 to $fp-3452
	# _tmp862 = _tmp858 - _tmp861
	  lw $t0, -3440($fp)	# fill _tmp858 to $t0 from $fp-3440
	  lw $t1, -3452($fp)	# fill _tmp861 to $t1 from $fp-3452
	  sub $t2, $t0, $t1	
	  sw $t2, -3456($fp)	# spill _tmp862 from $t2 to $fp-3456
	# _tmp863 = _tmp862 < _tmp857
	  lw $t0, -3456($fp)	# fill _tmp862 to $t0 from $fp-3456
	  lw $t1, -3436($fp)	# fill _tmp857 to $t1 from $fp-3436
	  slt $t2, $t0, $t1	
	  sw $t2, -3460($fp)	# spill _tmp863 from $t2 to $fp-3460
	# _tmp864 = _tmp860 || _tmp863
	  lw $t0, -3448($fp)	# fill _tmp860 to $t0 from $fp-3448
	  lw $t1, -3460($fp)	# fill _tmp863 to $t1 from $fp-3460
	  or $t2, $t0, $t1	
	  sw $t2, -3464($fp)	# spill _tmp864 from $t2 to $fp-3464
	# IfZ _tmp864 Goto arrayAcc_179
	  lw $t0, -3464($fp)	# fill _tmp864 to $t0 from $fp-3464
	  beqz $t0, arrayAcc_179	# branch if _tmp864 is zero 
	# _tmp865 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string129: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string129	# load label
	  sw $t2, -3468($fp)	# spill _tmp865 from $t2 to $fp-3468
	# PushParam _tmp865
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -3468($fp)	# fill _tmp865 to $t0 from $fp-3468
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_179:
	# _tmp866 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -3472($fp)	# spill _tmp866 from $t2 to $fp-3472
	# _tmp867 = _tmp857 * _tmp866
	  lw $t0, -3436($fp)	# fill _tmp857 to $t0 from $fp-3436
	  lw $t1, -3472($fp)	# fill _tmp866 to $t1 from $fp-3472
	  mul $t2, $t0, $t1	
	  sw $t2, -3476($fp)	# spill _tmp867 from $t2 to $fp-3476
	# _tmp868 = _tmp856 + _tmp867
	  lw $t0, -3432($fp)	# fill _tmp856 to $t0 from $fp-3432
	  lw $t1, -3476($fp)	# fill _tmp867 to $t1 from $fp-3476
	  add $t2, $t0, $t1	
	  sw $t2, -3480($fp)	# spill _tmp868 from $t2 to $fp-3480
	# _tmp869 = _tmp868 + _tmp866
	  lw $t0, -3480($fp)	# fill _tmp868 to $t0 from $fp-3480
	  lw $t1, -3472($fp)	# fill _tmp866 to $t1 from $fp-3472
	  add $t2, $t0, $t1	
	  sw $t2, -3484($fp)	# spill _tmp869 from $t2 to $fp-3484
	# _tmp870 = *(_tmp869)
	  lw $t0, -3484($fp)	# fill _tmp869 to $t0 from $fp-3484
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -3488($fp)	# spill _tmp870 from $t2 to $fp-3488
	# _tmp871 = 2
	  li $t2, 2		# load constant value 2 into $t2
	  sw $t2, -3492($fp)	# spill _tmp871 from $t2 to $fp-3492
	# _tmp872 = *(_tmp870)
	  lw $t0, -3488($fp)	# fill _tmp870 to $t0 from $fp-3488
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -3496($fp)	# spill _tmp872 from $t2 to $fp-3496
	# _tmp873 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -3500($fp)	# spill _tmp873 from $t2 to $fp-3500
	# _tmp874 = _tmp871 < _tmp873
	  lw $t0, -3492($fp)	# fill _tmp871 to $t0 from $fp-3492
	  lw $t1, -3500($fp)	# fill _tmp873 to $t1 from $fp-3500
	  slt $t2, $t0, $t1	
	  sw $t2, -3504($fp)	# spill _tmp874 from $t2 to $fp-3504
	# _tmp875 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -3508($fp)	# spill _tmp875 from $t2 to $fp-3508
	# _tmp876 = _tmp872 - _tmp875
	  lw $t0, -3496($fp)	# fill _tmp872 to $t0 from $fp-3496
	  lw $t1, -3508($fp)	# fill _tmp875 to $t1 from $fp-3508
	  sub $t2, $t0, $t1	
	  sw $t2, -3512($fp)	# spill _tmp876 from $t2 to $fp-3512
	# _tmp877 = _tmp876 < _tmp871
	  lw $t0, -3512($fp)	# fill _tmp876 to $t0 from $fp-3512
	  lw $t1, -3492($fp)	# fill _tmp871 to $t1 from $fp-3492
	  slt $t2, $t0, $t1	
	  sw $t2, -3516($fp)	# spill _tmp877 from $t2 to $fp-3516
	# _tmp878 = _tmp874 || _tmp877
	  lw $t0, -3504($fp)	# fill _tmp874 to $t0 from $fp-3504
	  lw $t1, -3516($fp)	# fill _tmp877 to $t1 from $fp-3516
	  or $t2, $t0, $t1	
	  sw $t2, -3520($fp)	# spill _tmp878 from $t2 to $fp-3520
	# IfZ _tmp878 Goto arrayAcc_180
	  lw $t0, -3520($fp)	# fill _tmp878 to $t0 from $fp-3520
	  beqz $t0, arrayAcc_180	# branch if _tmp878 is zero 
	# _tmp879 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string130: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string130	# load label
	  sw $t2, -3524($fp)	# spill _tmp879 from $t2 to $fp-3524
	# PushParam _tmp879
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -3524($fp)	# fill _tmp879 to $t0 from $fp-3524
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_180:
	# _tmp880 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -3528($fp)	# spill _tmp880 from $t2 to $fp-3528
	# _tmp881 = _tmp871 * _tmp880
	  lw $t0, -3492($fp)	# fill _tmp871 to $t0 from $fp-3492
	  lw $t1, -3528($fp)	# fill _tmp880 to $t1 from $fp-3528
	  mul $t2, $t0, $t1	
	  sw $t2, -3532($fp)	# spill _tmp881 from $t2 to $fp-3532
	# _tmp882 = _tmp870 + _tmp881
	  lw $t0, -3488($fp)	# fill _tmp870 to $t0 from $fp-3488
	  lw $t1, -3532($fp)	# fill _tmp881 to $t1 from $fp-3532
	  add $t2, $t0, $t1	
	  sw $t2, -3536($fp)	# spill _tmp882 from $t2 to $fp-3536
	# _tmp883 = _tmp882 + _tmp880
	  lw $t0, -3536($fp)	# fill _tmp882 to $t0 from $fp-3536
	  lw $t1, -3528($fp)	# fill _tmp880 to $t1 from $fp-3528
	  add $t2, $t0, $t1	
	  sw $t2, -3540($fp)	# spill _tmp883 from $t2 to $fp-3540
	# _tmp884 = *(_tmp883)
	  lw $t0, -3540($fp)	# fill _tmp883 to $t0 from $fp-3540
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -3544($fp)	# spill _tmp884 from $t2 to $fp-3544
	# _tmp885 = *(_tmp884)
	  lw $t0, -3544($fp)	# fill _tmp884 to $t0 from $fp-3544
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -3548($fp)	# spill _tmp885 from $t2 to $fp-3548
	# _tmp886 = *(_tmp885 + 20)
	  lw $t0, -3548($fp)	# fill _tmp885 to $t0 from $fp-3548
	  lw $t2, 20($t0) 	# load with offset
	  sw $t2, -3552($fp)	# spill _tmp886 from $t2 to $fp-3552
	# PushParam enemyMark
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, 8($fp)	# fill enemyMark to $t0 from $fp+8
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam _tmp884
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -3544($fp)	# fill _tmp884 to $t0 from $fp-3544
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp887 = ACall _tmp886
	  lw $t0, -3552($fp)	# fill _tmp886 to $t0 from $fp-3552
	  jalr $t0            	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -3556($fp)	# spill _tmp887 from $t2 to $fp-3556
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# _tmp888 = _tmp855 && _tmp887
	  lw $t0, -3428($fp)	# fill _tmp855 to $t0 from $fp-3428
	  lw $t1, -3556($fp)	# fill _tmp887 to $t1 from $fp-3556
	  and $t2, $t0, $t1	
	  sw $t2, -3560($fp)	# spill _tmp888 from $t2 to $fp-3560
	# _tmp889 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -3564($fp)	# spill _tmp889 from $t2 to $fp-3564
	# _tmp890 = 2
	  li $t2, 2		# load constant value 2 into $t2
	  sw $t2, -3568($fp)	# spill _tmp890 from $t2 to $fp-3568
	# _tmp891 = *(_tmp889)
	  lw $t0, -3564($fp)	# fill _tmp889 to $t0 from $fp-3564
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -3572($fp)	# spill _tmp891 from $t2 to $fp-3572
	# _tmp892 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -3576($fp)	# spill _tmp892 from $t2 to $fp-3576
	# _tmp893 = _tmp890 < _tmp892
	  lw $t0, -3568($fp)	# fill _tmp890 to $t0 from $fp-3568
	  lw $t1, -3576($fp)	# fill _tmp892 to $t1 from $fp-3576
	  slt $t2, $t0, $t1	
	  sw $t2, -3580($fp)	# spill _tmp893 from $t2 to $fp-3580
	# _tmp894 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -3584($fp)	# spill _tmp894 from $t2 to $fp-3584
	# _tmp895 = _tmp891 - _tmp894
	  lw $t0, -3572($fp)	# fill _tmp891 to $t0 from $fp-3572
	  lw $t1, -3584($fp)	# fill _tmp894 to $t1 from $fp-3584
	  sub $t2, $t0, $t1	
	  sw $t2, -3588($fp)	# spill _tmp895 from $t2 to $fp-3588
	# _tmp896 = _tmp895 < _tmp890
	  lw $t0, -3588($fp)	# fill _tmp895 to $t0 from $fp-3588
	  lw $t1, -3568($fp)	# fill _tmp890 to $t1 from $fp-3568
	  slt $t2, $t0, $t1	
	  sw $t2, -3592($fp)	# spill _tmp896 from $t2 to $fp-3592
	# _tmp897 = _tmp893 || _tmp896
	  lw $t0, -3580($fp)	# fill _tmp893 to $t0 from $fp-3580
	  lw $t1, -3592($fp)	# fill _tmp896 to $t1 from $fp-3592
	  or $t2, $t0, $t1	
	  sw $t2, -3596($fp)	# spill _tmp897 from $t2 to $fp-3596
	# IfZ _tmp897 Goto arrayAcc_181
	  lw $t0, -3596($fp)	# fill _tmp897 to $t0 from $fp-3596
	  beqz $t0, arrayAcc_181	# branch if _tmp897 is zero 
	# _tmp898 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string131: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string131	# load label
	  sw $t2, -3600($fp)	# spill _tmp898 from $t2 to $fp-3600
	# PushParam _tmp898
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -3600($fp)	# fill _tmp898 to $t0 from $fp-3600
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_181:
	# _tmp899 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -3604($fp)	# spill _tmp899 from $t2 to $fp-3604
	# _tmp900 = _tmp890 * _tmp899
	  lw $t0, -3568($fp)	# fill _tmp890 to $t0 from $fp-3568
	  lw $t1, -3604($fp)	# fill _tmp899 to $t1 from $fp-3604
	  mul $t2, $t0, $t1	
	  sw $t2, -3608($fp)	# spill _tmp900 from $t2 to $fp-3608
	# _tmp901 = _tmp889 + _tmp900
	  lw $t0, -3564($fp)	# fill _tmp889 to $t0 from $fp-3564
	  lw $t1, -3608($fp)	# fill _tmp900 to $t1 from $fp-3608
	  add $t2, $t0, $t1	
	  sw $t2, -3612($fp)	# spill _tmp901 from $t2 to $fp-3612
	# _tmp902 = _tmp901 + _tmp899
	  lw $t0, -3612($fp)	# fill _tmp901 to $t0 from $fp-3612
	  lw $t1, -3604($fp)	# fill _tmp899 to $t1 from $fp-3604
	  add $t2, $t0, $t1	
	  sw $t2, -3616($fp)	# spill _tmp902 from $t2 to $fp-3616
	# _tmp903 = *(_tmp902)
	  lw $t0, -3616($fp)	# fill _tmp902 to $t0 from $fp-3616
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -3620($fp)	# spill _tmp903 from $t2 to $fp-3620
	# _tmp904 = 2
	  li $t2, 2		# load constant value 2 into $t2
	  sw $t2, -3624($fp)	# spill _tmp904 from $t2 to $fp-3624
	# _tmp905 = *(_tmp903)
	  lw $t0, -3620($fp)	# fill _tmp903 to $t0 from $fp-3620
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -3628($fp)	# spill _tmp905 from $t2 to $fp-3628
	# _tmp906 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -3632($fp)	# spill _tmp906 from $t2 to $fp-3632
	# _tmp907 = _tmp904 < _tmp906
	  lw $t0, -3624($fp)	# fill _tmp904 to $t0 from $fp-3624
	  lw $t1, -3632($fp)	# fill _tmp906 to $t1 from $fp-3632
	  slt $t2, $t0, $t1	
	  sw $t2, -3636($fp)	# spill _tmp907 from $t2 to $fp-3636
	# _tmp908 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -3640($fp)	# spill _tmp908 from $t2 to $fp-3640
	# _tmp909 = _tmp905 - _tmp908
	  lw $t0, -3628($fp)	# fill _tmp905 to $t0 from $fp-3628
	  lw $t1, -3640($fp)	# fill _tmp908 to $t1 from $fp-3640
	  sub $t2, $t0, $t1	
	  sw $t2, -3644($fp)	# spill _tmp909 from $t2 to $fp-3644
	# _tmp910 = _tmp909 < _tmp904
	  lw $t0, -3644($fp)	# fill _tmp909 to $t0 from $fp-3644
	  lw $t1, -3624($fp)	# fill _tmp904 to $t1 from $fp-3624
	  slt $t2, $t0, $t1	
	  sw $t2, -3648($fp)	# spill _tmp910 from $t2 to $fp-3648
	# _tmp911 = _tmp907 || _tmp910
	  lw $t0, -3636($fp)	# fill _tmp907 to $t0 from $fp-3636
	  lw $t1, -3648($fp)	# fill _tmp910 to $t1 from $fp-3648
	  or $t2, $t0, $t1	
	  sw $t2, -3652($fp)	# spill _tmp911 from $t2 to $fp-3652
	# IfZ _tmp911 Goto arrayAcc_182
	  lw $t0, -3652($fp)	# fill _tmp911 to $t0 from $fp-3652
	  beqz $t0, arrayAcc_182	# branch if _tmp911 is zero 
	# _tmp912 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string132: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string132	# load label
	  sw $t2, -3656($fp)	# spill _tmp912 from $t2 to $fp-3656
	# PushParam _tmp912
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -3656($fp)	# fill _tmp912 to $t0 from $fp-3656
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_182:
	# _tmp913 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -3660($fp)	# spill _tmp913 from $t2 to $fp-3660
	# _tmp914 = _tmp904 * _tmp913
	  lw $t0, -3624($fp)	# fill _tmp904 to $t0 from $fp-3624
	  lw $t1, -3660($fp)	# fill _tmp913 to $t1 from $fp-3660
	  mul $t2, $t0, $t1	
	  sw $t2, -3664($fp)	# spill _tmp914 from $t2 to $fp-3664
	# _tmp915 = _tmp903 + _tmp914
	  lw $t0, -3620($fp)	# fill _tmp903 to $t0 from $fp-3620
	  lw $t1, -3664($fp)	# fill _tmp914 to $t1 from $fp-3664
	  add $t2, $t0, $t1	
	  sw $t2, -3668($fp)	# spill _tmp915 from $t2 to $fp-3668
	# _tmp916 = _tmp915 + _tmp913
	  lw $t0, -3668($fp)	# fill _tmp915 to $t0 from $fp-3668
	  lw $t1, -3660($fp)	# fill _tmp913 to $t1 from $fp-3660
	  add $t2, $t0, $t1	
	  sw $t2, -3672($fp)	# spill _tmp916 from $t2 to $fp-3672
	# _tmp917 = *(_tmp916)
	  lw $t0, -3672($fp)	# fill _tmp916 to $t0 from $fp-3672
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -3676($fp)	# spill _tmp917 from $t2 to $fp-3676
	# _tmp918 = *(_tmp917)
	  lw $t0, -3676($fp)	# fill _tmp917 to $t0 from $fp-3676
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -3680($fp)	# spill _tmp918 from $t2 to $fp-3680
	# _tmp919 = *(_tmp918 + 20)
	  lw $t0, -3680($fp)	# fill _tmp918 to $t0 from $fp-3680
	  lw $t2, 20($t0) 	# load with offset
	  sw $t2, -3684($fp)	# spill _tmp919 from $t2 to $fp-3684
	# PushParam playerMark
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, 12($fp)	# fill playerMark to $t0 from $fp+12
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam _tmp917
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -3676($fp)	# fill _tmp917 to $t0 from $fp-3676
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp920 = ACall _tmp919
	  lw $t0, -3684($fp)	# fill _tmp919 to $t0 from $fp-3684
	  jalr $t0            	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -3688($fp)	# spill _tmp920 from $t2 to $fp-3688
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# _tmp921 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -3692($fp)	# spill _tmp921 from $t2 to $fp-3692
	# _tmp922 = _tmp920 == _tmp921
	  lw $t0, -3688($fp)	# fill _tmp920 to $t0 from $fp-3688
	  lw $t1, -3692($fp)	# fill _tmp921 to $t1 from $fp-3692
	  seq $t2, $t0, $t1	
	  sw $t2, -3696($fp)	# spill _tmp922 from $t2 to $fp-3696
	# _tmp923 = _tmp888 && _tmp922
	  lw $t0, -3560($fp)	# fill _tmp888 to $t0 from $fp-3560
	  lw $t1, -3696($fp)	# fill _tmp922 to $t1 from $fp-3696
	  and $t2, $t0, $t1	
	  sw $t2, -3700($fp)	# spill _tmp923 from $t2 to $fp-3700
	# IfZ _tmp923 Goto else_183
	  lw $t0, -3700($fp)	# fill _tmp923 to $t0 from $fp-3700
	  beqz $t0, else_183	# branch if _tmp923 is zero 
	# _tmp924 = 2
	  li $t2, 2		# load constant value 2 into $t2
	  sw $t2, -3704($fp)	# spill _tmp924 from $t2 to $fp-3704
	# row = _tmp924
	  lw $t2, -3704($fp)	# fill _tmp924 to $t2 from $fp-3704
	  sw $t2, -8($fp)	# spill row from $t2 to $fp-8
	# _tmp925 = 2
	  li $t2, 2		# load constant value 2 into $t2
	  sw $t2, -3708($fp)	# spill _tmp925 from $t2 to $fp-3708
	# column = _tmp925
	  lw $t2, -3708($fp)	# fill _tmp925 to $t2 from $fp-3708
	  sw $t2, -12($fp)	# spill column from $t2 to $fp-12
	# Goto endif_184
	  b endif_184		# unconditional branch
  else_183:
	# _tmp926 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -3712($fp)	# spill _tmp926 from $t2 to $fp-3712
	# _tmp927 = 2
	  li $t2, 2		# load constant value 2 into $t2
	  sw $t2, -3716($fp)	# spill _tmp927 from $t2 to $fp-3716
	# _tmp928 = *(_tmp926)
	  lw $t0, -3712($fp)	# fill _tmp926 to $t0 from $fp-3712
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -3720($fp)	# spill _tmp928 from $t2 to $fp-3720
	# _tmp929 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -3724($fp)	# spill _tmp929 from $t2 to $fp-3724
	# _tmp930 = _tmp927 < _tmp929
	  lw $t0, -3716($fp)	# fill _tmp927 to $t0 from $fp-3716
	  lw $t1, -3724($fp)	# fill _tmp929 to $t1 from $fp-3724
	  slt $t2, $t0, $t1	
	  sw $t2, -3728($fp)	# spill _tmp930 from $t2 to $fp-3728
	# _tmp931 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -3732($fp)	# spill _tmp931 from $t2 to $fp-3732
	# _tmp932 = _tmp928 - _tmp931
	  lw $t0, -3720($fp)	# fill _tmp928 to $t0 from $fp-3720
	  lw $t1, -3732($fp)	# fill _tmp931 to $t1 from $fp-3732
	  sub $t2, $t0, $t1	
	  sw $t2, -3736($fp)	# spill _tmp932 from $t2 to $fp-3736
	# _tmp933 = _tmp932 < _tmp927
	  lw $t0, -3736($fp)	# fill _tmp932 to $t0 from $fp-3736
	  lw $t1, -3716($fp)	# fill _tmp927 to $t1 from $fp-3716
	  slt $t2, $t0, $t1	
	  sw $t2, -3740($fp)	# spill _tmp933 from $t2 to $fp-3740
	# _tmp934 = _tmp930 || _tmp933
	  lw $t0, -3728($fp)	# fill _tmp930 to $t0 from $fp-3728
	  lw $t1, -3740($fp)	# fill _tmp933 to $t1 from $fp-3740
	  or $t2, $t0, $t1	
	  sw $t2, -3744($fp)	# spill _tmp934 from $t2 to $fp-3744
	# IfZ _tmp934 Goto arrayAcc_185
	  lw $t0, -3744($fp)	# fill _tmp934 to $t0 from $fp-3744
	  beqz $t0, arrayAcc_185	# branch if _tmp934 is zero 
	# _tmp935 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string133: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string133	# load label
	  sw $t2, -3748($fp)	# spill _tmp935 from $t2 to $fp-3748
	# PushParam _tmp935
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -3748($fp)	# fill _tmp935 to $t0 from $fp-3748
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_185:
	# _tmp936 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -3752($fp)	# spill _tmp936 from $t2 to $fp-3752
	# _tmp937 = _tmp927 * _tmp936
	  lw $t0, -3716($fp)	# fill _tmp927 to $t0 from $fp-3716
	  lw $t1, -3752($fp)	# fill _tmp936 to $t1 from $fp-3752
	  mul $t2, $t0, $t1	
	  sw $t2, -3756($fp)	# spill _tmp937 from $t2 to $fp-3756
	# _tmp938 = _tmp926 + _tmp937
	  lw $t0, -3712($fp)	# fill _tmp926 to $t0 from $fp-3712
	  lw $t1, -3756($fp)	# fill _tmp937 to $t1 from $fp-3756
	  add $t2, $t0, $t1	
	  sw $t2, -3760($fp)	# spill _tmp938 from $t2 to $fp-3760
	# _tmp939 = _tmp938 + _tmp936
	  lw $t0, -3760($fp)	# fill _tmp938 to $t0 from $fp-3760
	  lw $t1, -3752($fp)	# fill _tmp936 to $t1 from $fp-3752
	  add $t2, $t0, $t1	
	  sw $t2, -3764($fp)	# spill _tmp939 from $t2 to $fp-3764
	# _tmp940 = *(_tmp939)
	  lw $t0, -3764($fp)	# fill _tmp939 to $t0 from $fp-3764
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -3768($fp)	# spill _tmp940 from $t2 to $fp-3768
	# _tmp941 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -3772($fp)	# spill _tmp941 from $t2 to $fp-3772
	# _tmp942 = *(_tmp940)
	  lw $t0, -3768($fp)	# fill _tmp940 to $t0 from $fp-3768
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -3776($fp)	# spill _tmp942 from $t2 to $fp-3776
	# _tmp943 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -3780($fp)	# spill _tmp943 from $t2 to $fp-3780
	# _tmp944 = _tmp941 < _tmp943
	  lw $t0, -3772($fp)	# fill _tmp941 to $t0 from $fp-3772
	  lw $t1, -3780($fp)	# fill _tmp943 to $t1 from $fp-3780
	  slt $t2, $t0, $t1	
	  sw $t2, -3784($fp)	# spill _tmp944 from $t2 to $fp-3784
	# _tmp945 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -3788($fp)	# spill _tmp945 from $t2 to $fp-3788
	# _tmp946 = _tmp942 - _tmp945
	  lw $t0, -3776($fp)	# fill _tmp942 to $t0 from $fp-3776
	  lw $t1, -3788($fp)	# fill _tmp945 to $t1 from $fp-3788
	  sub $t2, $t0, $t1	
	  sw $t2, -3792($fp)	# spill _tmp946 from $t2 to $fp-3792
	# _tmp947 = _tmp946 < _tmp941
	  lw $t0, -3792($fp)	# fill _tmp946 to $t0 from $fp-3792
	  lw $t1, -3772($fp)	# fill _tmp941 to $t1 from $fp-3772
	  slt $t2, $t0, $t1	
	  sw $t2, -3796($fp)	# spill _tmp947 from $t2 to $fp-3796
	# _tmp948 = _tmp944 || _tmp947
	  lw $t0, -3784($fp)	# fill _tmp944 to $t0 from $fp-3784
	  lw $t1, -3796($fp)	# fill _tmp947 to $t1 from $fp-3796
	  or $t2, $t0, $t1	
	  sw $t2, -3800($fp)	# spill _tmp948 from $t2 to $fp-3800
	# IfZ _tmp948 Goto arrayAcc_186
	  lw $t0, -3800($fp)	# fill _tmp948 to $t0 from $fp-3800
	  beqz $t0, arrayAcc_186	# branch if _tmp948 is zero 
	# _tmp949 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string134: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string134	# load label
	  sw $t2, -3804($fp)	# spill _tmp949 from $t2 to $fp-3804
	# PushParam _tmp949
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -3804($fp)	# fill _tmp949 to $t0 from $fp-3804
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_186:
	# _tmp950 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -3808($fp)	# spill _tmp950 from $t2 to $fp-3808
	# _tmp951 = _tmp941 * _tmp950
	  lw $t0, -3772($fp)	# fill _tmp941 to $t0 from $fp-3772
	  lw $t1, -3808($fp)	# fill _tmp950 to $t1 from $fp-3808
	  mul $t2, $t0, $t1	
	  sw $t2, -3812($fp)	# spill _tmp951 from $t2 to $fp-3812
	# _tmp952 = _tmp940 + _tmp951
	  lw $t0, -3768($fp)	# fill _tmp940 to $t0 from $fp-3768
	  lw $t1, -3812($fp)	# fill _tmp951 to $t1 from $fp-3812
	  add $t2, $t0, $t1	
	  sw $t2, -3816($fp)	# spill _tmp952 from $t2 to $fp-3816
	# _tmp953 = _tmp952 + _tmp950
	  lw $t0, -3816($fp)	# fill _tmp952 to $t0 from $fp-3816
	  lw $t1, -3808($fp)	# fill _tmp950 to $t1 from $fp-3808
	  add $t2, $t0, $t1	
	  sw $t2, -3820($fp)	# spill _tmp953 from $t2 to $fp-3820
	# _tmp954 = *(_tmp953)
	  lw $t0, -3820($fp)	# fill _tmp953 to $t0 from $fp-3820
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -3824($fp)	# spill _tmp954 from $t2 to $fp-3824
	# _tmp955 = *(_tmp954)
	  lw $t0, -3824($fp)	# fill _tmp954 to $t0 from $fp-3824
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -3828($fp)	# spill _tmp955 from $t2 to $fp-3828
	# _tmp956 = *(_tmp955 + 20)
	  lw $t0, -3828($fp)	# fill _tmp955 to $t0 from $fp-3828
	  lw $t2, 20($t0) 	# load with offset
	  sw $t2, -3832($fp)	# spill _tmp956 from $t2 to $fp-3832
	# PushParam enemyMark
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, 8($fp)	# fill enemyMark to $t0 from $fp+8
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam _tmp954
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -3824($fp)	# fill _tmp954 to $t0 from $fp-3824
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp957 = ACall _tmp956
	  lw $t0, -3832($fp)	# fill _tmp956 to $t0 from $fp-3832
	  jalr $t0            	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -3836($fp)	# spill _tmp957 from $t2 to $fp-3836
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# _tmp958 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -3840($fp)	# spill _tmp958 from $t2 to $fp-3840
	# _tmp959 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -3844($fp)	# spill _tmp959 from $t2 to $fp-3844
	# _tmp960 = *(_tmp958)
	  lw $t0, -3840($fp)	# fill _tmp958 to $t0 from $fp-3840
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -3848($fp)	# spill _tmp960 from $t2 to $fp-3848
	# _tmp961 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -3852($fp)	# spill _tmp961 from $t2 to $fp-3852
	# _tmp962 = _tmp959 < _tmp961
	  lw $t0, -3844($fp)	# fill _tmp959 to $t0 from $fp-3844
	  lw $t1, -3852($fp)	# fill _tmp961 to $t1 from $fp-3852
	  slt $t2, $t0, $t1	
	  sw $t2, -3856($fp)	# spill _tmp962 from $t2 to $fp-3856
	# _tmp963 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -3860($fp)	# spill _tmp963 from $t2 to $fp-3860
	# _tmp964 = _tmp960 - _tmp963
	  lw $t0, -3848($fp)	# fill _tmp960 to $t0 from $fp-3848
	  lw $t1, -3860($fp)	# fill _tmp963 to $t1 from $fp-3860
	  sub $t2, $t0, $t1	
	  sw $t2, -3864($fp)	# spill _tmp964 from $t2 to $fp-3864
	# _tmp965 = _tmp964 < _tmp959
	  lw $t0, -3864($fp)	# fill _tmp964 to $t0 from $fp-3864
	  lw $t1, -3844($fp)	# fill _tmp959 to $t1 from $fp-3844
	  slt $t2, $t0, $t1	
	  sw $t2, -3868($fp)	# spill _tmp965 from $t2 to $fp-3868
	# _tmp966 = _tmp962 || _tmp965
	  lw $t0, -3856($fp)	# fill _tmp962 to $t0 from $fp-3856
	  lw $t1, -3868($fp)	# fill _tmp965 to $t1 from $fp-3868
	  or $t2, $t0, $t1	
	  sw $t2, -3872($fp)	# spill _tmp966 from $t2 to $fp-3872
	# IfZ _tmp966 Goto arrayAcc_187
	  lw $t0, -3872($fp)	# fill _tmp966 to $t0 from $fp-3872
	  beqz $t0, arrayAcc_187	# branch if _tmp966 is zero 
	# _tmp967 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string135: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string135	# load label
	  sw $t2, -3876($fp)	# spill _tmp967 from $t2 to $fp-3876
	# PushParam _tmp967
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -3876($fp)	# fill _tmp967 to $t0 from $fp-3876
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_187:
	# _tmp968 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -3880($fp)	# spill _tmp968 from $t2 to $fp-3880
	# _tmp969 = _tmp959 * _tmp968
	  lw $t0, -3844($fp)	# fill _tmp959 to $t0 from $fp-3844
	  lw $t1, -3880($fp)	# fill _tmp968 to $t1 from $fp-3880
	  mul $t2, $t0, $t1	
	  sw $t2, -3884($fp)	# spill _tmp969 from $t2 to $fp-3884
	# _tmp970 = _tmp958 + _tmp969
	  lw $t0, -3840($fp)	# fill _tmp958 to $t0 from $fp-3840
	  lw $t1, -3884($fp)	# fill _tmp969 to $t1 from $fp-3884
	  add $t2, $t0, $t1	
	  sw $t2, -3888($fp)	# spill _tmp970 from $t2 to $fp-3888
	# _tmp971 = _tmp970 + _tmp968
	  lw $t0, -3888($fp)	# fill _tmp970 to $t0 from $fp-3888
	  lw $t1, -3880($fp)	# fill _tmp968 to $t1 from $fp-3880
	  add $t2, $t0, $t1	
	  sw $t2, -3892($fp)	# spill _tmp971 from $t2 to $fp-3892
	# _tmp972 = *(_tmp971)
	  lw $t0, -3892($fp)	# fill _tmp971 to $t0 from $fp-3892
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -3896($fp)	# spill _tmp972 from $t2 to $fp-3896
	# _tmp973 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -3900($fp)	# spill _tmp973 from $t2 to $fp-3900
	# _tmp974 = *(_tmp972)
	  lw $t0, -3896($fp)	# fill _tmp972 to $t0 from $fp-3896
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -3904($fp)	# spill _tmp974 from $t2 to $fp-3904
	# _tmp975 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -3908($fp)	# spill _tmp975 from $t2 to $fp-3908
	# _tmp976 = _tmp973 < _tmp975
	  lw $t0, -3900($fp)	# fill _tmp973 to $t0 from $fp-3900
	  lw $t1, -3908($fp)	# fill _tmp975 to $t1 from $fp-3908
	  slt $t2, $t0, $t1	
	  sw $t2, -3912($fp)	# spill _tmp976 from $t2 to $fp-3912
	# _tmp977 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -3916($fp)	# spill _tmp977 from $t2 to $fp-3916
	# _tmp978 = _tmp974 - _tmp977
	  lw $t0, -3904($fp)	# fill _tmp974 to $t0 from $fp-3904
	  lw $t1, -3916($fp)	# fill _tmp977 to $t1 from $fp-3916
	  sub $t2, $t0, $t1	
	  sw $t2, -3920($fp)	# spill _tmp978 from $t2 to $fp-3920
	# _tmp979 = _tmp978 < _tmp973
	  lw $t0, -3920($fp)	# fill _tmp978 to $t0 from $fp-3920
	  lw $t1, -3900($fp)	# fill _tmp973 to $t1 from $fp-3900
	  slt $t2, $t0, $t1	
	  sw $t2, -3924($fp)	# spill _tmp979 from $t2 to $fp-3924
	# _tmp980 = _tmp976 || _tmp979
	  lw $t0, -3912($fp)	# fill _tmp976 to $t0 from $fp-3912
	  lw $t1, -3924($fp)	# fill _tmp979 to $t1 from $fp-3924
	  or $t2, $t0, $t1	
	  sw $t2, -3928($fp)	# spill _tmp980 from $t2 to $fp-3928
	# IfZ _tmp980 Goto arrayAcc_188
	  lw $t0, -3928($fp)	# fill _tmp980 to $t0 from $fp-3928
	  beqz $t0, arrayAcc_188	# branch if _tmp980 is zero 
	# _tmp981 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string136: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string136	# load label
	  sw $t2, -3932($fp)	# spill _tmp981 from $t2 to $fp-3932
	# PushParam _tmp981
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -3932($fp)	# fill _tmp981 to $t0 from $fp-3932
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_188:
	# _tmp982 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -3936($fp)	# spill _tmp982 from $t2 to $fp-3936
	# _tmp983 = _tmp973 * _tmp982
	  lw $t0, -3900($fp)	# fill _tmp973 to $t0 from $fp-3900
	  lw $t1, -3936($fp)	# fill _tmp982 to $t1 from $fp-3936
	  mul $t2, $t0, $t1	
	  sw $t2, -3940($fp)	# spill _tmp983 from $t2 to $fp-3940
	# _tmp984 = _tmp972 + _tmp983
	  lw $t0, -3896($fp)	# fill _tmp972 to $t0 from $fp-3896
	  lw $t1, -3940($fp)	# fill _tmp983 to $t1 from $fp-3940
	  add $t2, $t0, $t1	
	  sw $t2, -3944($fp)	# spill _tmp984 from $t2 to $fp-3944
	# _tmp985 = _tmp984 + _tmp982
	  lw $t0, -3944($fp)	# fill _tmp984 to $t0 from $fp-3944
	  lw $t1, -3936($fp)	# fill _tmp982 to $t1 from $fp-3936
	  add $t2, $t0, $t1	
	  sw $t2, -3948($fp)	# spill _tmp985 from $t2 to $fp-3948
	# _tmp986 = *(_tmp985)
	  lw $t0, -3948($fp)	# fill _tmp985 to $t0 from $fp-3948
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -3952($fp)	# spill _tmp986 from $t2 to $fp-3952
	# _tmp987 = *(_tmp986)
	  lw $t0, -3952($fp)	# fill _tmp986 to $t0 from $fp-3952
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -3956($fp)	# spill _tmp987 from $t2 to $fp-3956
	# _tmp988 = *(_tmp987 + 20)
	  lw $t0, -3956($fp)	# fill _tmp987 to $t0 from $fp-3956
	  lw $t2, 20($t0) 	# load with offset
	  sw $t2, -3960($fp)	# spill _tmp988 from $t2 to $fp-3960
	# PushParam enemyMark
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, 8($fp)	# fill enemyMark to $t0 from $fp+8
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam _tmp986
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -3952($fp)	# fill _tmp986 to $t0 from $fp-3952
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp989 = ACall _tmp988
	  lw $t0, -3960($fp)	# fill _tmp988 to $t0 from $fp-3960
	  jalr $t0            	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -3964($fp)	# spill _tmp989 from $t2 to $fp-3964
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# _tmp990 = _tmp957 && _tmp989
	  lw $t0, -3836($fp)	# fill _tmp957 to $t0 from $fp-3836
	  lw $t1, -3964($fp)	# fill _tmp989 to $t1 from $fp-3964
	  and $t2, $t0, $t1	
	  sw $t2, -3968($fp)	# spill _tmp990 from $t2 to $fp-3968
	# _tmp991 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -3972($fp)	# spill _tmp991 from $t2 to $fp-3972
	# _tmp992 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -3976($fp)	# spill _tmp992 from $t2 to $fp-3976
	# _tmp993 = *(_tmp991)
	  lw $t0, -3972($fp)	# fill _tmp991 to $t0 from $fp-3972
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -3980($fp)	# spill _tmp993 from $t2 to $fp-3980
	# _tmp994 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -3984($fp)	# spill _tmp994 from $t2 to $fp-3984
	# _tmp995 = _tmp992 < _tmp994
	  lw $t0, -3976($fp)	# fill _tmp992 to $t0 from $fp-3976
	  lw $t1, -3984($fp)	# fill _tmp994 to $t1 from $fp-3984
	  slt $t2, $t0, $t1	
	  sw $t2, -3988($fp)	# spill _tmp995 from $t2 to $fp-3988
	# _tmp996 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -3992($fp)	# spill _tmp996 from $t2 to $fp-3992
	# _tmp997 = _tmp993 - _tmp996
	  lw $t0, -3980($fp)	# fill _tmp993 to $t0 from $fp-3980
	  lw $t1, -3992($fp)	# fill _tmp996 to $t1 from $fp-3992
	  sub $t2, $t0, $t1	
	  sw $t2, -3996($fp)	# spill _tmp997 from $t2 to $fp-3996
	# _tmp998 = _tmp997 < _tmp992
	  lw $t0, -3996($fp)	# fill _tmp997 to $t0 from $fp-3996
	  lw $t1, -3976($fp)	# fill _tmp992 to $t1 from $fp-3976
	  slt $t2, $t0, $t1	
	  sw $t2, -4000($fp)	# spill _tmp998 from $t2 to $fp-4000
	# _tmp999 = _tmp995 || _tmp998
	  lw $t0, -3988($fp)	# fill _tmp995 to $t0 from $fp-3988
	  lw $t1, -4000($fp)	# fill _tmp998 to $t1 from $fp-4000
	  or $t2, $t0, $t1	
	  sw $t2, -4004($fp)	# spill _tmp999 from $t2 to $fp-4004
	# IfZ _tmp999 Goto arrayAcc_189
	  lw $t0, -4004($fp)	# fill _tmp999 to $t0 from $fp-4004
	  beqz $t0, arrayAcc_189	# branch if _tmp999 is zero 
	# _tmp1000 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string137: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string137	# load label
	  sw $t2, -4008($fp)	# spill _tmp1000 from $t2 to $fp-4008
	# PushParam _tmp1000
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -4008($fp)	# fill _tmp1000 to $t0 from $fp-4008
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_189:
	# _tmp1001 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -4012($fp)	# spill _tmp1001 from $t2 to $fp-4012
	# _tmp1002 = _tmp992 * _tmp1001
	  lw $t0, -3976($fp)	# fill _tmp992 to $t0 from $fp-3976
	  lw $t1, -4012($fp)	# fill _tmp1001 to $t1 from $fp-4012
	  mul $t2, $t0, $t1	
	  sw $t2, -4016($fp)	# spill _tmp1002 from $t2 to $fp-4016
	# _tmp1003 = _tmp991 + _tmp1002
	  lw $t0, -3972($fp)	# fill _tmp991 to $t0 from $fp-3972
	  lw $t1, -4016($fp)	# fill _tmp1002 to $t1 from $fp-4016
	  add $t2, $t0, $t1	
	  sw $t2, -4020($fp)	# spill _tmp1003 from $t2 to $fp-4020
	# _tmp1004 = _tmp1003 + _tmp1001
	  lw $t0, -4020($fp)	# fill _tmp1003 to $t0 from $fp-4020
	  lw $t1, -4012($fp)	# fill _tmp1001 to $t1 from $fp-4012
	  add $t2, $t0, $t1	
	  sw $t2, -4024($fp)	# spill _tmp1004 from $t2 to $fp-4024
	# _tmp1005 = *(_tmp1004)
	  lw $t0, -4024($fp)	# fill _tmp1004 to $t0 from $fp-4024
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -4028($fp)	# spill _tmp1005 from $t2 to $fp-4028
	# _tmp1006 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -4032($fp)	# spill _tmp1006 from $t2 to $fp-4032
	# _tmp1007 = *(_tmp1005)
	  lw $t0, -4028($fp)	# fill _tmp1005 to $t0 from $fp-4028
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -4036($fp)	# spill _tmp1007 from $t2 to $fp-4036
	# _tmp1008 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -4040($fp)	# spill _tmp1008 from $t2 to $fp-4040
	# _tmp1009 = _tmp1006 < _tmp1008
	  lw $t0, -4032($fp)	# fill _tmp1006 to $t0 from $fp-4032
	  lw $t1, -4040($fp)	# fill _tmp1008 to $t1 from $fp-4040
	  slt $t2, $t0, $t1	
	  sw $t2, -4044($fp)	# spill _tmp1009 from $t2 to $fp-4044
	# _tmp1010 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -4048($fp)	# spill _tmp1010 from $t2 to $fp-4048
	# _tmp1011 = _tmp1007 - _tmp1010
	  lw $t0, -4036($fp)	# fill _tmp1007 to $t0 from $fp-4036
	  lw $t1, -4048($fp)	# fill _tmp1010 to $t1 from $fp-4048
	  sub $t2, $t0, $t1	
	  sw $t2, -4052($fp)	# spill _tmp1011 from $t2 to $fp-4052
	# _tmp1012 = _tmp1011 < _tmp1006
	  lw $t0, -4052($fp)	# fill _tmp1011 to $t0 from $fp-4052
	  lw $t1, -4032($fp)	# fill _tmp1006 to $t1 from $fp-4032
	  slt $t2, $t0, $t1	
	  sw $t2, -4056($fp)	# spill _tmp1012 from $t2 to $fp-4056
	# _tmp1013 = _tmp1009 || _tmp1012
	  lw $t0, -4044($fp)	# fill _tmp1009 to $t0 from $fp-4044
	  lw $t1, -4056($fp)	# fill _tmp1012 to $t1 from $fp-4056
	  or $t2, $t0, $t1	
	  sw $t2, -4060($fp)	# spill _tmp1013 from $t2 to $fp-4060
	# IfZ _tmp1013 Goto arrayAcc_190
	  lw $t0, -4060($fp)	# fill _tmp1013 to $t0 from $fp-4060
	  beqz $t0, arrayAcc_190	# branch if _tmp1013 is zero 
	# _tmp1014 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string138: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string138	# load label
	  sw $t2, -4064($fp)	# spill _tmp1014 from $t2 to $fp-4064
	# PushParam _tmp1014
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -4064($fp)	# fill _tmp1014 to $t0 from $fp-4064
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_190:
	# _tmp1015 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -4068($fp)	# spill _tmp1015 from $t2 to $fp-4068
	# _tmp1016 = _tmp1006 * _tmp1015
	  lw $t0, -4032($fp)	# fill _tmp1006 to $t0 from $fp-4032
	  lw $t1, -4068($fp)	# fill _tmp1015 to $t1 from $fp-4068
	  mul $t2, $t0, $t1	
	  sw $t2, -4072($fp)	# spill _tmp1016 from $t2 to $fp-4072
	# _tmp1017 = _tmp1005 + _tmp1016
	  lw $t0, -4028($fp)	# fill _tmp1005 to $t0 from $fp-4028
	  lw $t1, -4072($fp)	# fill _tmp1016 to $t1 from $fp-4072
	  add $t2, $t0, $t1	
	  sw $t2, -4076($fp)	# spill _tmp1017 from $t2 to $fp-4076
	# _tmp1018 = _tmp1017 + _tmp1015
	  lw $t0, -4076($fp)	# fill _tmp1017 to $t0 from $fp-4076
	  lw $t1, -4068($fp)	# fill _tmp1015 to $t1 from $fp-4068
	  add $t2, $t0, $t1	
	  sw $t2, -4080($fp)	# spill _tmp1018 from $t2 to $fp-4080
	# _tmp1019 = *(_tmp1018)
	  lw $t0, -4080($fp)	# fill _tmp1018 to $t0 from $fp-4080
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -4084($fp)	# spill _tmp1019 from $t2 to $fp-4084
	# _tmp1020 = *(_tmp1019)
	  lw $t0, -4084($fp)	# fill _tmp1019 to $t0 from $fp-4084
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -4088($fp)	# spill _tmp1020 from $t2 to $fp-4088
	# _tmp1021 = *(_tmp1020 + 20)
	  lw $t0, -4088($fp)	# fill _tmp1020 to $t0 from $fp-4088
	  lw $t2, 20($t0) 	# load with offset
	  sw $t2, -4092($fp)	# spill _tmp1021 from $t2 to $fp-4092
	# PushParam playerMark
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, 12($fp)	# fill playerMark to $t0 from $fp+12
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam _tmp1019
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -4084($fp)	# fill _tmp1019 to $t0 from $fp-4084
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp1022 = ACall _tmp1021
	  lw $t0, -4092($fp)	# fill _tmp1021 to $t0 from $fp-4092
	  jalr $t0            	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -4096($fp)	# spill _tmp1022 from $t2 to $fp-4096
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# _tmp1023 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -4100($fp)	# spill _tmp1023 from $t2 to $fp-4100
	# _tmp1024 = _tmp1022 == _tmp1023
	  lw $t0, -4096($fp)	# fill _tmp1022 to $t0 from $fp-4096
	  lw $t1, -4100($fp)	# fill _tmp1023 to $t1 from $fp-4100
	  seq $t2, $t0, $t1	
	  sw $t2, -4104($fp)	# spill _tmp1024 from $t2 to $fp-4104
	# _tmp1025 = _tmp990 && _tmp1024
	  lw $t0, -3968($fp)	# fill _tmp990 to $t0 from $fp-3968
	  lw $t1, -4104($fp)	# fill _tmp1024 to $t1 from $fp-4104
	  and $t2, $t0, $t1	
	  sw $t2, -4108($fp)	# spill _tmp1025 from $t2 to $fp-4108
	# IfZ _tmp1025 Goto else_191
	  lw $t0, -4108($fp)	# fill _tmp1025 to $t0 from $fp-4108
	  beqz $t0, else_191	# branch if _tmp1025 is zero 
	# _tmp1026 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -4112($fp)	# spill _tmp1026 from $t2 to $fp-4112
	# row = _tmp1026
	  lw $t2, -4112($fp)	# fill _tmp1026 to $t2 from $fp-4112
	  sw $t2, -8($fp)	# spill row from $t2 to $fp-8
	# _tmp1027 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -4116($fp)	# spill _tmp1027 from $t2 to $fp-4116
	# column = _tmp1027
	  lw $t2, -4116($fp)	# fill _tmp1027 to $t2 from $fp-4116
	  sw $t2, -12($fp)	# spill column from $t2 to $fp-12
	# Goto endif_192
	  b endif_192		# unconditional branch
  else_191:
	# _tmp1028 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -4120($fp)	# spill _tmp1028 from $t2 to $fp-4120
	# _tmp1029 = 2
	  li $t2, 2		# load constant value 2 into $t2
	  sw $t2, -4124($fp)	# spill _tmp1029 from $t2 to $fp-4124
	# _tmp1030 = *(_tmp1028)
	  lw $t0, -4120($fp)	# fill _tmp1028 to $t0 from $fp-4120
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -4128($fp)	# spill _tmp1030 from $t2 to $fp-4128
	# _tmp1031 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -4132($fp)	# spill _tmp1031 from $t2 to $fp-4132
	# _tmp1032 = _tmp1029 < _tmp1031
	  lw $t0, -4124($fp)	# fill _tmp1029 to $t0 from $fp-4124
	  lw $t1, -4132($fp)	# fill _tmp1031 to $t1 from $fp-4132
	  slt $t2, $t0, $t1	
	  sw $t2, -4136($fp)	# spill _tmp1032 from $t2 to $fp-4136
	# _tmp1033 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -4140($fp)	# spill _tmp1033 from $t2 to $fp-4140
	# _tmp1034 = _tmp1030 - _tmp1033
	  lw $t0, -4128($fp)	# fill _tmp1030 to $t0 from $fp-4128
	  lw $t1, -4140($fp)	# fill _tmp1033 to $t1 from $fp-4140
	  sub $t2, $t0, $t1	
	  sw $t2, -4144($fp)	# spill _tmp1034 from $t2 to $fp-4144
	# _tmp1035 = _tmp1034 < _tmp1029
	  lw $t0, -4144($fp)	# fill _tmp1034 to $t0 from $fp-4144
	  lw $t1, -4124($fp)	# fill _tmp1029 to $t1 from $fp-4124
	  slt $t2, $t0, $t1	
	  sw $t2, -4148($fp)	# spill _tmp1035 from $t2 to $fp-4148
	# _tmp1036 = _tmp1032 || _tmp1035
	  lw $t0, -4136($fp)	# fill _tmp1032 to $t0 from $fp-4136
	  lw $t1, -4148($fp)	# fill _tmp1035 to $t1 from $fp-4148
	  or $t2, $t0, $t1	
	  sw $t2, -4152($fp)	# spill _tmp1036 from $t2 to $fp-4152
	# IfZ _tmp1036 Goto arrayAcc_193
	  lw $t0, -4152($fp)	# fill _tmp1036 to $t0 from $fp-4152
	  beqz $t0, arrayAcc_193	# branch if _tmp1036 is zero 
	# _tmp1037 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string139: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string139	# load label
	  sw $t2, -4156($fp)	# spill _tmp1037 from $t2 to $fp-4156
	# PushParam _tmp1037
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -4156($fp)	# fill _tmp1037 to $t0 from $fp-4156
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_193:
	# _tmp1038 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -4160($fp)	# spill _tmp1038 from $t2 to $fp-4160
	# _tmp1039 = _tmp1029 * _tmp1038
	  lw $t0, -4124($fp)	# fill _tmp1029 to $t0 from $fp-4124
	  lw $t1, -4160($fp)	# fill _tmp1038 to $t1 from $fp-4160
	  mul $t2, $t0, $t1	
	  sw $t2, -4164($fp)	# spill _tmp1039 from $t2 to $fp-4164
	# _tmp1040 = _tmp1028 + _tmp1039
	  lw $t0, -4120($fp)	# fill _tmp1028 to $t0 from $fp-4120
	  lw $t1, -4164($fp)	# fill _tmp1039 to $t1 from $fp-4164
	  add $t2, $t0, $t1	
	  sw $t2, -4168($fp)	# spill _tmp1040 from $t2 to $fp-4168
	# _tmp1041 = _tmp1040 + _tmp1038
	  lw $t0, -4168($fp)	# fill _tmp1040 to $t0 from $fp-4168
	  lw $t1, -4160($fp)	# fill _tmp1038 to $t1 from $fp-4160
	  add $t2, $t0, $t1	
	  sw $t2, -4172($fp)	# spill _tmp1041 from $t2 to $fp-4172
	# _tmp1042 = *(_tmp1041)
	  lw $t0, -4172($fp)	# fill _tmp1041 to $t0 from $fp-4172
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -4176($fp)	# spill _tmp1042 from $t2 to $fp-4176
	# _tmp1043 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -4180($fp)	# spill _tmp1043 from $t2 to $fp-4180
	# _tmp1044 = *(_tmp1042)
	  lw $t0, -4176($fp)	# fill _tmp1042 to $t0 from $fp-4176
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -4184($fp)	# spill _tmp1044 from $t2 to $fp-4184
	# _tmp1045 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -4188($fp)	# spill _tmp1045 from $t2 to $fp-4188
	# _tmp1046 = _tmp1043 < _tmp1045
	  lw $t0, -4180($fp)	# fill _tmp1043 to $t0 from $fp-4180
	  lw $t1, -4188($fp)	# fill _tmp1045 to $t1 from $fp-4188
	  slt $t2, $t0, $t1	
	  sw $t2, -4192($fp)	# spill _tmp1046 from $t2 to $fp-4192
	# _tmp1047 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -4196($fp)	# spill _tmp1047 from $t2 to $fp-4196
	# _tmp1048 = _tmp1044 - _tmp1047
	  lw $t0, -4184($fp)	# fill _tmp1044 to $t0 from $fp-4184
	  lw $t1, -4196($fp)	# fill _tmp1047 to $t1 from $fp-4196
	  sub $t2, $t0, $t1	
	  sw $t2, -4200($fp)	# spill _tmp1048 from $t2 to $fp-4200
	# _tmp1049 = _tmp1048 < _tmp1043
	  lw $t0, -4200($fp)	# fill _tmp1048 to $t0 from $fp-4200
	  lw $t1, -4180($fp)	# fill _tmp1043 to $t1 from $fp-4180
	  slt $t2, $t0, $t1	
	  sw $t2, -4204($fp)	# spill _tmp1049 from $t2 to $fp-4204
	# _tmp1050 = _tmp1046 || _tmp1049
	  lw $t0, -4192($fp)	# fill _tmp1046 to $t0 from $fp-4192
	  lw $t1, -4204($fp)	# fill _tmp1049 to $t1 from $fp-4204
	  or $t2, $t0, $t1	
	  sw $t2, -4208($fp)	# spill _tmp1050 from $t2 to $fp-4208
	# IfZ _tmp1050 Goto arrayAcc_194
	  lw $t0, -4208($fp)	# fill _tmp1050 to $t0 from $fp-4208
	  beqz $t0, arrayAcc_194	# branch if _tmp1050 is zero 
	# _tmp1051 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string140: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string140	# load label
	  sw $t2, -4212($fp)	# spill _tmp1051 from $t2 to $fp-4212
	# PushParam _tmp1051
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -4212($fp)	# fill _tmp1051 to $t0 from $fp-4212
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_194:
	# _tmp1052 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -4216($fp)	# spill _tmp1052 from $t2 to $fp-4216
	# _tmp1053 = _tmp1043 * _tmp1052
	  lw $t0, -4180($fp)	# fill _tmp1043 to $t0 from $fp-4180
	  lw $t1, -4216($fp)	# fill _tmp1052 to $t1 from $fp-4216
	  mul $t2, $t0, $t1	
	  sw $t2, -4220($fp)	# spill _tmp1053 from $t2 to $fp-4220
	# _tmp1054 = _tmp1042 + _tmp1053
	  lw $t0, -4176($fp)	# fill _tmp1042 to $t0 from $fp-4176
	  lw $t1, -4220($fp)	# fill _tmp1053 to $t1 from $fp-4220
	  add $t2, $t0, $t1	
	  sw $t2, -4224($fp)	# spill _tmp1054 from $t2 to $fp-4224
	# _tmp1055 = _tmp1054 + _tmp1052
	  lw $t0, -4224($fp)	# fill _tmp1054 to $t0 from $fp-4224
	  lw $t1, -4216($fp)	# fill _tmp1052 to $t1 from $fp-4216
	  add $t2, $t0, $t1	
	  sw $t2, -4228($fp)	# spill _tmp1055 from $t2 to $fp-4228
	# _tmp1056 = *(_tmp1055)
	  lw $t0, -4228($fp)	# fill _tmp1055 to $t0 from $fp-4228
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -4232($fp)	# spill _tmp1056 from $t2 to $fp-4232
	# _tmp1057 = *(_tmp1056)
	  lw $t0, -4232($fp)	# fill _tmp1056 to $t0 from $fp-4232
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -4236($fp)	# spill _tmp1057 from $t2 to $fp-4236
	# _tmp1058 = *(_tmp1057 + 20)
	  lw $t0, -4236($fp)	# fill _tmp1057 to $t0 from $fp-4236
	  lw $t2, 20($t0) 	# load with offset
	  sw $t2, -4240($fp)	# spill _tmp1058 from $t2 to $fp-4240
	# PushParam enemyMark
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, 8($fp)	# fill enemyMark to $t0 from $fp+8
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam _tmp1056
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -4232($fp)	# fill _tmp1056 to $t0 from $fp-4232
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp1059 = ACall _tmp1058
	  lw $t0, -4240($fp)	# fill _tmp1058 to $t0 from $fp-4240
	  jalr $t0            	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -4244($fp)	# spill _tmp1059 from $t2 to $fp-4244
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# _tmp1060 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -4248($fp)	# spill _tmp1060 from $t2 to $fp-4248
	# _tmp1061 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -4252($fp)	# spill _tmp1061 from $t2 to $fp-4252
	# _tmp1062 = *(_tmp1060)
	  lw $t0, -4248($fp)	# fill _tmp1060 to $t0 from $fp-4248
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -4256($fp)	# spill _tmp1062 from $t2 to $fp-4256
	# _tmp1063 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -4260($fp)	# spill _tmp1063 from $t2 to $fp-4260
	# _tmp1064 = _tmp1061 < _tmp1063
	  lw $t0, -4252($fp)	# fill _tmp1061 to $t0 from $fp-4252
	  lw $t1, -4260($fp)	# fill _tmp1063 to $t1 from $fp-4260
	  slt $t2, $t0, $t1	
	  sw $t2, -4264($fp)	# spill _tmp1064 from $t2 to $fp-4264
	# _tmp1065 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -4268($fp)	# spill _tmp1065 from $t2 to $fp-4268
	# _tmp1066 = _tmp1062 - _tmp1065
	  lw $t0, -4256($fp)	# fill _tmp1062 to $t0 from $fp-4256
	  lw $t1, -4268($fp)	# fill _tmp1065 to $t1 from $fp-4268
	  sub $t2, $t0, $t1	
	  sw $t2, -4272($fp)	# spill _tmp1066 from $t2 to $fp-4272
	# _tmp1067 = _tmp1066 < _tmp1061
	  lw $t0, -4272($fp)	# fill _tmp1066 to $t0 from $fp-4272
	  lw $t1, -4252($fp)	# fill _tmp1061 to $t1 from $fp-4252
	  slt $t2, $t0, $t1	
	  sw $t2, -4276($fp)	# spill _tmp1067 from $t2 to $fp-4276
	# _tmp1068 = _tmp1064 || _tmp1067
	  lw $t0, -4264($fp)	# fill _tmp1064 to $t0 from $fp-4264
	  lw $t1, -4276($fp)	# fill _tmp1067 to $t1 from $fp-4276
	  or $t2, $t0, $t1	
	  sw $t2, -4280($fp)	# spill _tmp1068 from $t2 to $fp-4280
	# IfZ _tmp1068 Goto arrayAcc_195
	  lw $t0, -4280($fp)	# fill _tmp1068 to $t0 from $fp-4280
	  beqz $t0, arrayAcc_195	# branch if _tmp1068 is zero 
	# _tmp1069 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string141: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string141	# load label
	  sw $t2, -4284($fp)	# spill _tmp1069 from $t2 to $fp-4284
	# PushParam _tmp1069
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -4284($fp)	# fill _tmp1069 to $t0 from $fp-4284
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_195:
	# _tmp1070 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -4288($fp)	# spill _tmp1070 from $t2 to $fp-4288
	# _tmp1071 = _tmp1061 * _tmp1070
	  lw $t0, -4252($fp)	# fill _tmp1061 to $t0 from $fp-4252
	  lw $t1, -4288($fp)	# fill _tmp1070 to $t1 from $fp-4288
	  mul $t2, $t0, $t1	
	  sw $t2, -4292($fp)	# spill _tmp1071 from $t2 to $fp-4292
	# _tmp1072 = _tmp1060 + _tmp1071
	  lw $t0, -4248($fp)	# fill _tmp1060 to $t0 from $fp-4248
	  lw $t1, -4292($fp)	# fill _tmp1071 to $t1 from $fp-4292
	  add $t2, $t0, $t1	
	  sw $t2, -4296($fp)	# spill _tmp1072 from $t2 to $fp-4296
	# _tmp1073 = _tmp1072 + _tmp1070
	  lw $t0, -4296($fp)	# fill _tmp1072 to $t0 from $fp-4296
	  lw $t1, -4288($fp)	# fill _tmp1070 to $t1 from $fp-4288
	  add $t2, $t0, $t1	
	  sw $t2, -4300($fp)	# spill _tmp1073 from $t2 to $fp-4300
	# _tmp1074 = *(_tmp1073)
	  lw $t0, -4300($fp)	# fill _tmp1073 to $t0 from $fp-4300
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -4304($fp)	# spill _tmp1074 from $t2 to $fp-4304
	# _tmp1075 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -4308($fp)	# spill _tmp1075 from $t2 to $fp-4308
	# _tmp1076 = *(_tmp1074)
	  lw $t0, -4304($fp)	# fill _tmp1074 to $t0 from $fp-4304
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -4312($fp)	# spill _tmp1076 from $t2 to $fp-4312
	# _tmp1077 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -4316($fp)	# spill _tmp1077 from $t2 to $fp-4316
	# _tmp1078 = _tmp1075 < _tmp1077
	  lw $t0, -4308($fp)	# fill _tmp1075 to $t0 from $fp-4308
	  lw $t1, -4316($fp)	# fill _tmp1077 to $t1 from $fp-4316
	  slt $t2, $t0, $t1	
	  sw $t2, -4320($fp)	# spill _tmp1078 from $t2 to $fp-4320
	# _tmp1079 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -4324($fp)	# spill _tmp1079 from $t2 to $fp-4324
	# _tmp1080 = _tmp1076 - _tmp1079
	  lw $t0, -4312($fp)	# fill _tmp1076 to $t0 from $fp-4312
	  lw $t1, -4324($fp)	# fill _tmp1079 to $t1 from $fp-4324
	  sub $t2, $t0, $t1	
	  sw $t2, -4328($fp)	# spill _tmp1080 from $t2 to $fp-4328
	# _tmp1081 = _tmp1080 < _tmp1075
	  lw $t0, -4328($fp)	# fill _tmp1080 to $t0 from $fp-4328
	  lw $t1, -4308($fp)	# fill _tmp1075 to $t1 from $fp-4308
	  slt $t2, $t0, $t1	
	  sw $t2, -4332($fp)	# spill _tmp1081 from $t2 to $fp-4332
	# _tmp1082 = _tmp1078 || _tmp1081
	  lw $t0, -4320($fp)	# fill _tmp1078 to $t0 from $fp-4320
	  lw $t1, -4332($fp)	# fill _tmp1081 to $t1 from $fp-4332
	  or $t2, $t0, $t1	
	  sw $t2, -4336($fp)	# spill _tmp1082 from $t2 to $fp-4336
	# IfZ _tmp1082 Goto arrayAcc_196
	  lw $t0, -4336($fp)	# fill _tmp1082 to $t0 from $fp-4336
	  beqz $t0, arrayAcc_196	# branch if _tmp1082 is zero 
	# _tmp1083 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string142: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string142	# load label
	  sw $t2, -4340($fp)	# spill _tmp1083 from $t2 to $fp-4340
	# PushParam _tmp1083
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -4340($fp)	# fill _tmp1083 to $t0 from $fp-4340
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_196:
	# _tmp1084 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -4344($fp)	# spill _tmp1084 from $t2 to $fp-4344
	# _tmp1085 = _tmp1075 * _tmp1084
	  lw $t0, -4308($fp)	# fill _tmp1075 to $t0 from $fp-4308
	  lw $t1, -4344($fp)	# fill _tmp1084 to $t1 from $fp-4344
	  mul $t2, $t0, $t1	
	  sw $t2, -4348($fp)	# spill _tmp1085 from $t2 to $fp-4348
	# _tmp1086 = _tmp1074 + _tmp1085
	  lw $t0, -4304($fp)	# fill _tmp1074 to $t0 from $fp-4304
	  lw $t1, -4348($fp)	# fill _tmp1085 to $t1 from $fp-4348
	  add $t2, $t0, $t1	
	  sw $t2, -4352($fp)	# spill _tmp1086 from $t2 to $fp-4352
	# _tmp1087 = _tmp1086 + _tmp1084
	  lw $t0, -4352($fp)	# fill _tmp1086 to $t0 from $fp-4352
	  lw $t1, -4344($fp)	# fill _tmp1084 to $t1 from $fp-4344
	  add $t2, $t0, $t1	
	  sw $t2, -4356($fp)	# spill _tmp1087 from $t2 to $fp-4356
	# _tmp1088 = *(_tmp1087)
	  lw $t0, -4356($fp)	# fill _tmp1087 to $t0 from $fp-4356
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -4360($fp)	# spill _tmp1088 from $t2 to $fp-4360
	# _tmp1089 = *(_tmp1088)
	  lw $t0, -4360($fp)	# fill _tmp1088 to $t0 from $fp-4360
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -4364($fp)	# spill _tmp1089 from $t2 to $fp-4364
	# _tmp1090 = *(_tmp1089 + 20)
	  lw $t0, -4364($fp)	# fill _tmp1089 to $t0 from $fp-4364
	  lw $t2, 20($t0) 	# load with offset
	  sw $t2, -4368($fp)	# spill _tmp1090 from $t2 to $fp-4368
	# PushParam enemyMark
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, 8($fp)	# fill enemyMark to $t0 from $fp+8
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam _tmp1088
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -4360($fp)	# fill _tmp1088 to $t0 from $fp-4360
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp1091 = ACall _tmp1090
	  lw $t0, -4368($fp)	# fill _tmp1090 to $t0 from $fp-4368
	  jalr $t0            	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -4372($fp)	# spill _tmp1091 from $t2 to $fp-4372
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# _tmp1092 = _tmp1059 && _tmp1091
	  lw $t0, -4244($fp)	# fill _tmp1059 to $t0 from $fp-4244
	  lw $t1, -4372($fp)	# fill _tmp1091 to $t1 from $fp-4372
	  and $t2, $t0, $t1	
	  sw $t2, -4376($fp)	# spill _tmp1092 from $t2 to $fp-4376
	# _tmp1093 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -4380($fp)	# spill _tmp1093 from $t2 to $fp-4380
	# _tmp1094 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -4384($fp)	# spill _tmp1094 from $t2 to $fp-4384
	# _tmp1095 = *(_tmp1093)
	  lw $t0, -4380($fp)	# fill _tmp1093 to $t0 from $fp-4380
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -4388($fp)	# spill _tmp1095 from $t2 to $fp-4388
	# _tmp1096 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -4392($fp)	# spill _tmp1096 from $t2 to $fp-4392
	# _tmp1097 = _tmp1094 < _tmp1096
	  lw $t0, -4384($fp)	# fill _tmp1094 to $t0 from $fp-4384
	  lw $t1, -4392($fp)	# fill _tmp1096 to $t1 from $fp-4392
	  slt $t2, $t0, $t1	
	  sw $t2, -4396($fp)	# spill _tmp1097 from $t2 to $fp-4396
	# _tmp1098 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -4400($fp)	# spill _tmp1098 from $t2 to $fp-4400
	# _tmp1099 = _tmp1095 - _tmp1098
	  lw $t0, -4388($fp)	# fill _tmp1095 to $t0 from $fp-4388
	  lw $t1, -4400($fp)	# fill _tmp1098 to $t1 from $fp-4400
	  sub $t2, $t0, $t1	
	  sw $t2, -4404($fp)	# spill _tmp1099 from $t2 to $fp-4404
	# _tmp1100 = _tmp1099 < _tmp1094
	  lw $t0, -4404($fp)	# fill _tmp1099 to $t0 from $fp-4404
	  lw $t1, -4384($fp)	# fill _tmp1094 to $t1 from $fp-4384
	  slt $t2, $t0, $t1	
	  sw $t2, -4408($fp)	# spill _tmp1100 from $t2 to $fp-4408
	# _tmp1101 = _tmp1097 || _tmp1100
	  lw $t0, -4396($fp)	# fill _tmp1097 to $t0 from $fp-4396
	  lw $t1, -4408($fp)	# fill _tmp1100 to $t1 from $fp-4408
	  or $t2, $t0, $t1	
	  sw $t2, -4412($fp)	# spill _tmp1101 from $t2 to $fp-4412
	# IfZ _tmp1101 Goto arrayAcc_197
	  lw $t0, -4412($fp)	# fill _tmp1101 to $t0 from $fp-4412
	  beqz $t0, arrayAcc_197	# branch if _tmp1101 is zero 
	# _tmp1102 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string143: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string143	# load label
	  sw $t2, -4416($fp)	# spill _tmp1102 from $t2 to $fp-4416
	# PushParam _tmp1102
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -4416($fp)	# fill _tmp1102 to $t0 from $fp-4416
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_197:
	# _tmp1103 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -4420($fp)	# spill _tmp1103 from $t2 to $fp-4420
	# _tmp1104 = _tmp1094 * _tmp1103
	  lw $t0, -4384($fp)	# fill _tmp1094 to $t0 from $fp-4384
	  lw $t1, -4420($fp)	# fill _tmp1103 to $t1 from $fp-4420
	  mul $t2, $t0, $t1	
	  sw $t2, -4424($fp)	# spill _tmp1104 from $t2 to $fp-4424
	# _tmp1105 = _tmp1093 + _tmp1104
	  lw $t0, -4380($fp)	# fill _tmp1093 to $t0 from $fp-4380
	  lw $t1, -4424($fp)	# fill _tmp1104 to $t1 from $fp-4424
	  add $t2, $t0, $t1	
	  sw $t2, -4428($fp)	# spill _tmp1105 from $t2 to $fp-4428
	# _tmp1106 = _tmp1105 + _tmp1103
	  lw $t0, -4428($fp)	# fill _tmp1105 to $t0 from $fp-4428
	  lw $t1, -4420($fp)	# fill _tmp1103 to $t1 from $fp-4420
	  add $t2, $t0, $t1	
	  sw $t2, -4432($fp)	# spill _tmp1106 from $t2 to $fp-4432
	# _tmp1107 = *(_tmp1106)
	  lw $t0, -4432($fp)	# fill _tmp1106 to $t0 from $fp-4432
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -4436($fp)	# spill _tmp1107 from $t2 to $fp-4436
	# _tmp1108 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -4440($fp)	# spill _tmp1108 from $t2 to $fp-4440
	# _tmp1109 = *(_tmp1107)
	  lw $t0, -4436($fp)	# fill _tmp1107 to $t0 from $fp-4436
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -4444($fp)	# spill _tmp1109 from $t2 to $fp-4444
	# _tmp1110 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -4448($fp)	# spill _tmp1110 from $t2 to $fp-4448
	# _tmp1111 = _tmp1108 < _tmp1110
	  lw $t0, -4440($fp)	# fill _tmp1108 to $t0 from $fp-4440
	  lw $t1, -4448($fp)	# fill _tmp1110 to $t1 from $fp-4448
	  slt $t2, $t0, $t1	
	  sw $t2, -4452($fp)	# spill _tmp1111 from $t2 to $fp-4452
	# _tmp1112 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -4456($fp)	# spill _tmp1112 from $t2 to $fp-4456
	# _tmp1113 = _tmp1109 - _tmp1112
	  lw $t0, -4444($fp)	# fill _tmp1109 to $t0 from $fp-4444
	  lw $t1, -4456($fp)	# fill _tmp1112 to $t1 from $fp-4456
	  sub $t2, $t0, $t1	
	  sw $t2, -4460($fp)	# spill _tmp1113 from $t2 to $fp-4460
	# _tmp1114 = _tmp1113 < _tmp1108
	  lw $t0, -4460($fp)	# fill _tmp1113 to $t0 from $fp-4460
	  lw $t1, -4440($fp)	# fill _tmp1108 to $t1 from $fp-4440
	  slt $t2, $t0, $t1	
	  sw $t2, -4464($fp)	# spill _tmp1114 from $t2 to $fp-4464
	# _tmp1115 = _tmp1111 || _tmp1114
	  lw $t0, -4452($fp)	# fill _tmp1111 to $t0 from $fp-4452
	  lw $t1, -4464($fp)	# fill _tmp1114 to $t1 from $fp-4464
	  or $t2, $t0, $t1	
	  sw $t2, -4468($fp)	# spill _tmp1115 from $t2 to $fp-4468
	# IfZ _tmp1115 Goto arrayAcc_198
	  lw $t0, -4468($fp)	# fill _tmp1115 to $t0 from $fp-4468
	  beqz $t0, arrayAcc_198	# branch if _tmp1115 is zero 
	# _tmp1116 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string144: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string144	# load label
	  sw $t2, -4472($fp)	# spill _tmp1116 from $t2 to $fp-4472
	# PushParam _tmp1116
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -4472($fp)	# fill _tmp1116 to $t0 from $fp-4472
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_198:
	# _tmp1117 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -4476($fp)	# spill _tmp1117 from $t2 to $fp-4476
	# _tmp1118 = _tmp1108 * _tmp1117
	  lw $t0, -4440($fp)	# fill _tmp1108 to $t0 from $fp-4440
	  lw $t1, -4476($fp)	# fill _tmp1117 to $t1 from $fp-4476
	  mul $t2, $t0, $t1	
	  sw $t2, -4480($fp)	# spill _tmp1118 from $t2 to $fp-4480
	# _tmp1119 = _tmp1107 + _tmp1118
	  lw $t0, -4436($fp)	# fill _tmp1107 to $t0 from $fp-4436
	  lw $t1, -4480($fp)	# fill _tmp1118 to $t1 from $fp-4480
	  add $t2, $t0, $t1	
	  sw $t2, -4484($fp)	# spill _tmp1119 from $t2 to $fp-4484
	# _tmp1120 = _tmp1119 + _tmp1117
	  lw $t0, -4484($fp)	# fill _tmp1119 to $t0 from $fp-4484
	  lw $t1, -4476($fp)	# fill _tmp1117 to $t1 from $fp-4476
	  add $t2, $t0, $t1	
	  sw $t2, -4488($fp)	# spill _tmp1120 from $t2 to $fp-4488
	# _tmp1121 = *(_tmp1120)
	  lw $t0, -4488($fp)	# fill _tmp1120 to $t0 from $fp-4488
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -4492($fp)	# spill _tmp1121 from $t2 to $fp-4492
	# _tmp1122 = *(_tmp1121)
	  lw $t0, -4492($fp)	# fill _tmp1121 to $t0 from $fp-4492
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -4496($fp)	# spill _tmp1122 from $t2 to $fp-4496
	# _tmp1123 = *(_tmp1122 + 20)
	  lw $t0, -4496($fp)	# fill _tmp1122 to $t0 from $fp-4496
	  lw $t2, 20($t0) 	# load with offset
	  sw $t2, -4500($fp)	# spill _tmp1123 from $t2 to $fp-4500
	# PushParam playerMark
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, 12($fp)	# fill playerMark to $t0 from $fp+12
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam _tmp1121
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -4492($fp)	# fill _tmp1121 to $t0 from $fp-4492
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp1124 = ACall _tmp1123
	  lw $t0, -4500($fp)	# fill _tmp1123 to $t0 from $fp-4500
	  jalr $t0            	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -4504($fp)	# spill _tmp1124 from $t2 to $fp-4504
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# _tmp1125 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -4508($fp)	# spill _tmp1125 from $t2 to $fp-4508
	# _tmp1126 = _tmp1124 == _tmp1125
	  lw $t0, -4504($fp)	# fill _tmp1124 to $t0 from $fp-4504
	  lw $t1, -4508($fp)	# fill _tmp1125 to $t1 from $fp-4508
	  seq $t2, $t0, $t1	
	  sw $t2, -4512($fp)	# spill _tmp1126 from $t2 to $fp-4512
	# _tmp1127 = _tmp1092 && _tmp1126
	  lw $t0, -4376($fp)	# fill _tmp1092 to $t0 from $fp-4376
	  lw $t1, -4512($fp)	# fill _tmp1126 to $t1 from $fp-4512
	  and $t2, $t0, $t1	
	  sw $t2, -4516($fp)	# spill _tmp1127 from $t2 to $fp-4516
	# IfZ _tmp1127 Goto else_199
	  lw $t0, -4516($fp)	# fill _tmp1127 to $t0 from $fp-4516
	  beqz $t0, else_199	# branch if _tmp1127 is zero 
	# _tmp1128 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -4520($fp)	# spill _tmp1128 from $t2 to $fp-4520
	# row = _tmp1128
	  lw $t2, -4520($fp)	# fill _tmp1128 to $t2 from $fp-4520
	  sw $t2, -8($fp)	# spill row from $t2 to $fp-8
	# _tmp1129 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -4524($fp)	# spill _tmp1129 from $t2 to $fp-4524
	# column = _tmp1129
	  lw $t2, -4524($fp)	# fill _tmp1129 to $t2 from $fp-4524
	  sw $t2, -12($fp)	# spill column from $t2 to $fp-12
	# Goto endif_200
	  b endif_200		# unconditional branch
  else_199:
	# _tmp1130 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -4528($fp)	# spill _tmp1130 from $t2 to $fp-4528
	# _tmp1131 = 2
	  li $t2, 2		# load constant value 2 into $t2
	  sw $t2, -4532($fp)	# spill _tmp1131 from $t2 to $fp-4532
	# _tmp1132 = *(_tmp1130)
	  lw $t0, -4528($fp)	# fill _tmp1130 to $t0 from $fp-4528
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -4536($fp)	# spill _tmp1132 from $t2 to $fp-4536
	# _tmp1133 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -4540($fp)	# spill _tmp1133 from $t2 to $fp-4540
	# _tmp1134 = _tmp1131 < _tmp1133
	  lw $t0, -4532($fp)	# fill _tmp1131 to $t0 from $fp-4532
	  lw $t1, -4540($fp)	# fill _tmp1133 to $t1 from $fp-4540
	  slt $t2, $t0, $t1	
	  sw $t2, -4544($fp)	# spill _tmp1134 from $t2 to $fp-4544
	# _tmp1135 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -4548($fp)	# spill _tmp1135 from $t2 to $fp-4548
	# _tmp1136 = _tmp1132 - _tmp1135
	  lw $t0, -4536($fp)	# fill _tmp1132 to $t0 from $fp-4536
	  lw $t1, -4548($fp)	# fill _tmp1135 to $t1 from $fp-4548
	  sub $t2, $t0, $t1	
	  sw $t2, -4552($fp)	# spill _tmp1136 from $t2 to $fp-4552
	# _tmp1137 = _tmp1136 < _tmp1131
	  lw $t0, -4552($fp)	# fill _tmp1136 to $t0 from $fp-4552
	  lw $t1, -4532($fp)	# fill _tmp1131 to $t1 from $fp-4532
	  slt $t2, $t0, $t1	
	  sw $t2, -4556($fp)	# spill _tmp1137 from $t2 to $fp-4556
	# _tmp1138 = _tmp1134 || _tmp1137
	  lw $t0, -4544($fp)	# fill _tmp1134 to $t0 from $fp-4544
	  lw $t1, -4556($fp)	# fill _tmp1137 to $t1 from $fp-4556
	  or $t2, $t0, $t1	
	  sw $t2, -4560($fp)	# spill _tmp1138 from $t2 to $fp-4560
	# IfZ _tmp1138 Goto arrayAcc_201
	  lw $t0, -4560($fp)	# fill _tmp1138 to $t0 from $fp-4560
	  beqz $t0, arrayAcc_201	# branch if _tmp1138 is zero 
	# _tmp1139 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string145: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string145	# load label
	  sw $t2, -4564($fp)	# spill _tmp1139 from $t2 to $fp-4564
	# PushParam _tmp1139
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -4564($fp)	# fill _tmp1139 to $t0 from $fp-4564
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_201:
	# _tmp1140 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -4568($fp)	# spill _tmp1140 from $t2 to $fp-4568
	# _tmp1141 = _tmp1131 * _tmp1140
	  lw $t0, -4532($fp)	# fill _tmp1131 to $t0 from $fp-4532
	  lw $t1, -4568($fp)	# fill _tmp1140 to $t1 from $fp-4568
	  mul $t2, $t0, $t1	
	  sw $t2, -4572($fp)	# spill _tmp1141 from $t2 to $fp-4572
	# _tmp1142 = _tmp1130 + _tmp1141
	  lw $t0, -4528($fp)	# fill _tmp1130 to $t0 from $fp-4528
	  lw $t1, -4572($fp)	# fill _tmp1141 to $t1 from $fp-4572
	  add $t2, $t0, $t1	
	  sw $t2, -4576($fp)	# spill _tmp1142 from $t2 to $fp-4576
	# _tmp1143 = _tmp1142 + _tmp1140
	  lw $t0, -4576($fp)	# fill _tmp1142 to $t0 from $fp-4576
	  lw $t1, -4568($fp)	# fill _tmp1140 to $t1 from $fp-4568
	  add $t2, $t0, $t1	
	  sw $t2, -4580($fp)	# spill _tmp1143 from $t2 to $fp-4580
	# _tmp1144 = *(_tmp1143)
	  lw $t0, -4580($fp)	# fill _tmp1143 to $t0 from $fp-4580
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -4584($fp)	# spill _tmp1144 from $t2 to $fp-4584
	# _tmp1145 = 2
	  li $t2, 2		# load constant value 2 into $t2
	  sw $t2, -4588($fp)	# spill _tmp1145 from $t2 to $fp-4588
	# _tmp1146 = *(_tmp1144)
	  lw $t0, -4584($fp)	# fill _tmp1144 to $t0 from $fp-4584
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -4592($fp)	# spill _tmp1146 from $t2 to $fp-4592
	# _tmp1147 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -4596($fp)	# spill _tmp1147 from $t2 to $fp-4596
	# _tmp1148 = _tmp1145 < _tmp1147
	  lw $t0, -4588($fp)	# fill _tmp1145 to $t0 from $fp-4588
	  lw $t1, -4596($fp)	# fill _tmp1147 to $t1 from $fp-4596
	  slt $t2, $t0, $t1	
	  sw $t2, -4600($fp)	# spill _tmp1148 from $t2 to $fp-4600
	# _tmp1149 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -4604($fp)	# spill _tmp1149 from $t2 to $fp-4604
	# _tmp1150 = _tmp1146 - _tmp1149
	  lw $t0, -4592($fp)	# fill _tmp1146 to $t0 from $fp-4592
	  lw $t1, -4604($fp)	# fill _tmp1149 to $t1 from $fp-4604
	  sub $t2, $t0, $t1	
	  sw $t2, -4608($fp)	# spill _tmp1150 from $t2 to $fp-4608
	# _tmp1151 = _tmp1150 < _tmp1145
	  lw $t0, -4608($fp)	# fill _tmp1150 to $t0 from $fp-4608
	  lw $t1, -4588($fp)	# fill _tmp1145 to $t1 from $fp-4588
	  slt $t2, $t0, $t1	
	  sw $t2, -4612($fp)	# spill _tmp1151 from $t2 to $fp-4612
	# _tmp1152 = _tmp1148 || _tmp1151
	  lw $t0, -4600($fp)	# fill _tmp1148 to $t0 from $fp-4600
	  lw $t1, -4612($fp)	# fill _tmp1151 to $t1 from $fp-4612
	  or $t2, $t0, $t1	
	  sw $t2, -4616($fp)	# spill _tmp1152 from $t2 to $fp-4616
	# IfZ _tmp1152 Goto arrayAcc_202
	  lw $t0, -4616($fp)	# fill _tmp1152 to $t0 from $fp-4616
	  beqz $t0, arrayAcc_202	# branch if _tmp1152 is zero 
	# _tmp1153 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string146: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string146	# load label
	  sw $t2, -4620($fp)	# spill _tmp1153 from $t2 to $fp-4620
	# PushParam _tmp1153
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -4620($fp)	# fill _tmp1153 to $t0 from $fp-4620
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_202:
	# _tmp1154 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -4624($fp)	# spill _tmp1154 from $t2 to $fp-4624
	# _tmp1155 = _tmp1145 * _tmp1154
	  lw $t0, -4588($fp)	# fill _tmp1145 to $t0 from $fp-4588
	  lw $t1, -4624($fp)	# fill _tmp1154 to $t1 from $fp-4624
	  mul $t2, $t0, $t1	
	  sw $t2, -4628($fp)	# spill _tmp1155 from $t2 to $fp-4628
	# _tmp1156 = _tmp1144 + _tmp1155
	  lw $t0, -4584($fp)	# fill _tmp1144 to $t0 from $fp-4584
	  lw $t1, -4628($fp)	# fill _tmp1155 to $t1 from $fp-4628
	  add $t2, $t0, $t1	
	  sw $t2, -4632($fp)	# spill _tmp1156 from $t2 to $fp-4632
	# _tmp1157 = _tmp1156 + _tmp1154
	  lw $t0, -4632($fp)	# fill _tmp1156 to $t0 from $fp-4632
	  lw $t1, -4624($fp)	# fill _tmp1154 to $t1 from $fp-4624
	  add $t2, $t0, $t1	
	  sw $t2, -4636($fp)	# spill _tmp1157 from $t2 to $fp-4636
	# _tmp1158 = *(_tmp1157)
	  lw $t0, -4636($fp)	# fill _tmp1157 to $t0 from $fp-4636
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -4640($fp)	# spill _tmp1158 from $t2 to $fp-4640
	# _tmp1159 = *(_tmp1158)
	  lw $t0, -4640($fp)	# fill _tmp1158 to $t0 from $fp-4640
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -4644($fp)	# spill _tmp1159 from $t2 to $fp-4644
	# _tmp1160 = *(_tmp1159 + 20)
	  lw $t0, -4644($fp)	# fill _tmp1159 to $t0 from $fp-4644
	  lw $t2, 20($t0) 	# load with offset
	  sw $t2, -4648($fp)	# spill _tmp1160 from $t2 to $fp-4648
	# PushParam enemyMark
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, 8($fp)	# fill enemyMark to $t0 from $fp+8
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam _tmp1158
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -4640($fp)	# fill _tmp1158 to $t0 from $fp-4640
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp1161 = ACall _tmp1160
	  lw $t0, -4648($fp)	# fill _tmp1160 to $t0 from $fp-4648
	  jalr $t0            	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -4652($fp)	# spill _tmp1161 from $t2 to $fp-4652
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# _tmp1162 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -4656($fp)	# spill _tmp1162 from $t2 to $fp-4656
	# _tmp1163 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -4660($fp)	# spill _tmp1163 from $t2 to $fp-4660
	# _tmp1164 = *(_tmp1162)
	  lw $t0, -4656($fp)	# fill _tmp1162 to $t0 from $fp-4656
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -4664($fp)	# spill _tmp1164 from $t2 to $fp-4664
	# _tmp1165 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -4668($fp)	# spill _tmp1165 from $t2 to $fp-4668
	# _tmp1166 = _tmp1163 < _tmp1165
	  lw $t0, -4660($fp)	# fill _tmp1163 to $t0 from $fp-4660
	  lw $t1, -4668($fp)	# fill _tmp1165 to $t1 from $fp-4668
	  slt $t2, $t0, $t1	
	  sw $t2, -4672($fp)	# spill _tmp1166 from $t2 to $fp-4672
	# _tmp1167 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -4676($fp)	# spill _tmp1167 from $t2 to $fp-4676
	# _tmp1168 = _tmp1164 - _tmp1167
	  lw $t0, -4664($fp)	# fill _tmp1164 to $t0 from $fp-4664
	  lw $t1, -4676($fp)	# fill _tmp1167 to $t1 from $fp-4676
	  sub $t2, $t0, $t1	
	  sw $t2, -4680($fp)	# spill _tmp1168 from $t2 to $fp-4680
	# _tmp1169 = _tmp1168 < _tmp1163
	  lw $t0, -4680($fp)	# fill _tmp1168 to $t0 from $fp-4680
	  lw $t1, -4660($fp)	# fill _tmp1163 to $t1 from $fp-4660
	  slt $t2, $t0, $t1	
	  sw $t2, -4684($fp)	# spill _tmp1169 from $t2 to $fp-4684
	# _tmp1170 = _tmp1166 || _tmp1169
	  lw $t0, -4672($fp)	# fill _tmp1166 to $t0 from $fp-4672
	  lw $t1, -4684($fp)	# fill _tmp1169 to $t1 from $fp-4684
	  or $t2, $t0, $t1	
	  sw $t2, -4688($fp)	# spill _tmp1170 from $t2 to $fp-4688
	# IfZ _tmp1170 Goto arrayAcc_203
	  lw $t0, -4688($fp)	# fill _tmp1170 to $t0 from $fp-4688
	  beqz $t0, arrayAcc_203	# branch if _tmp1170 is zero 
	# _tmp1171 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string147: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string147	# load label
	  sw $t2, -4692($fp)	# spill _tmp1171 from $t2 to $fp-4692
	# PushParam _tmp1171
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -4692($fp)	# fill _tmp1171 to $t0 from $fp-4692
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_203:
	# _tmp1172 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -4696($fp)	# spill _tmp1172 from $t2 to $fp-4696
	# _tmp1173 = _tmp1163 * _tmp1172
	  lw $t0, -4660($fp)	# fill _tmp1163 to $t0 from $fp-4660
	  lw $t1, -4696($fp)	# fill _tmp1172 to $t1 from $fp-4696
	  mul $t2, $t0, $t1	
	  sw $t2, -4700($fp)	# spill _tmp1173 from $t2 to $fp-4700
	# _tmp1174 = _tmp1162 + _tmp1173
	  lw $t0, -4656($fp)	# fill _tmp1162 to $t0 from $fp-4656
	  lw $t1, -4700($fp)	# fill _tmp1173 to $t1 from $fp-4700
	  add $t2, $t0, $t1	
	  sw $t2, -4704($fp)	# spill _tmp1174 from $t2 to $fp-4704
	# _tmp1175 = _tmp1174 + _tmp1172
	  lw $t0, -4704($fp)	# fill _tmp1174 to $t0 from $fp-4704
	  lw $t1, -4696($fp)	# fill _tmp1172 to $t1 from $fp-4696
	  add $t2, $t0, $t1	
	  sw $t2, -4708($fp)	# spill _tmp1175 from $t2 to $fp-4708
	# _tmp1176 = *(_tmp1175)
	  lw $t0, -4708($fp)	# fill _tmp1175 to $t0 from $fp-4708
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -4712($fp)	# spill _tmp1176 from $t2 to $fp-4712
	# _tmp1177 = 2
	  li $t2, 2		# load constant value 2 into $t2
	  sw $t2, -4716($fp)	# spill _tmp1177 from $t2 to $fp-4716
	# _tmp1178 = *(_tmp1176)
	  lw $t0, -4712($fp)	# fill _tmp1176 to $t0 from $fp-4712
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -4720($fp)	# spill _tmp1178 from $t2 to $fp-4720
	# _tmp1179 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -4724($fp)	# spill _tmp1179 from $t2 to $fp-4724
	# _tmp1180 = _tmp1177 < _tmp1179
	  lw $t0, -4716($fp)	# fill _tmp1177 to $t0 from $fp-4716
	  lw $t1, -4724($fp)	# fill _tmp1179 to $t1 from $fp-4724
	  slt $t2, $t0, $t1	
	  sw $t2, -4728($fp)	# spill _tmp1180 from $t2 to $fp-4728
	# _tmp1181 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -4732($fp)	# spill _tmp1181 from $t2 to $fp-4732
	# _tmp1182 = _tmp1178 - _tmp1181
	  lw $t0, -4720($fp)	# fill _tmp1178 to $t0 from $fp-4720
	  lw $t1, -4732($fp)	# fill _tmp1181 to $t1 from $fp-4732
	  sub $t2, $t0, $t1	
	  sw $t2, -4736($fp)	# spill _tmp1182 from $t2 to $fp-4736
	# _tmp1183 = _tmp1182 < _tmp1177
	  lw $t0, -4736($fp)	# fill _tmp1182 to $t0 from $fp-4736
	  lw $t1, -4716($fp)	# fill _tmp1177 to $t1 from $fp-4716
	  slt $t2, $t0, $t1	
	  sw $t2, -4740($fp)	# spill _tmp1183 from $t2 to $fp-4740
	# _tmp1184 = _tmp1180 || _tmp1183
	  lw $t0, -4728($fp)	# fill _tmp1180 to $t0 from $fp-4728
	  lw $t1, -4740($fp)	# fill _tmp1183 to $t1 from $fp-4740
	  or $t2, $t0, $t1	
	  sw $t2, -4744($fp)	# spill _tmp1184 from $t2 to $fp-4744
	# IfZ _tmp1184 Goto arrayAcc_204
	  lw $t0, -4744($fp)	# fill _tmp1184 to $t0 from $fp-4744
	  beqz $t0, arrayAcc_204	# branch if _tmp1184 is zero 
	# _tmp1185 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string148: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string148	# load label
	  sw $t2, -4748($fp)	# spill _tmp1185 from $t2 to $fp-4748
	# PushParam _tmp1185
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -4748($fp)	# fill _tmp1185 to $t0 from $fp-4748
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_204:
	# _tmp1186 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -4752($fp)	# spill _tmp1186 from $t2 to $fp-4752
	# _tmp1187 = _tmp1177 * _tmp1186
	  lw $t0, -4716($fp)	# fill _tmp1177 to $t0 from $fp-4716
	  lw $t1, -4752($fp)	# fill _tmp1186 to $t1 from $fp-4752
	  mul $t2, $t0, $t1	
	  sw $t2, -4756($fp)	# spill _tmp1187 from $t2 to $fp-4756
	# _tmp1188 = _tmp1176 + _tmp1187
	  lw $t0, -4712($fp)	# fill _tmp1176 to $t0 from $fp-4712
	  lw $t1, -4756($fp)	# fill _tmp1187 to $t1 from $fp-4756
	  add $t2, $t0, $t1	
	  sw $t2, -4760($fp)	# spill _tmp1188 from $t2 to $fp-4760
	# _tmp1189 = _tmp1188 + _tmp1186
	  lw $t0, -4760($fp)	# fill _tmp1188 to $t0 from $fp-4760
	  lw $t1, -4752($fp)	# fill _tmp1186 to $t1 from $fp-4752
	  add $t2, $t0, $t1	
	  sw $t2, -4764($fp)	# spill _tmp1189 from $t2 to $fp-4764
	# _tmp1190 = *(_tmp1189)
	  lw $t0, -4764($fp)	# fill _tmp1189 to $t0 from $fp-4764
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -4768($fp)	# spill _tmp1190 from $t2 to $fp-4768
	# _tmp1191 = *(_tmp1190)
	  lw $t0, -4768($fp)	# fill _tmp1190 to $t0 from $fp-4768
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -4772($fp)	# spill _tmp1191 from $t2 to $fp-4772
	# _tmp1192 = *(_tmp1191 + 20)
	  lw $t0, -4772($fp)	# fill _tmp1191 to $t0 from $fp-4772
	  lw $t2, 20($t0) 	# load with offset
	  sw $t2, -4776($fp)	# spill _tmp1192 from $t2 to $fp-4776
	# PushParam enemyMark
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, 8($fp)	# fill enemyMark to $t0 from $fp+8
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam _tmp1190
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -4768($fp)	# fill _tmp1190 to $t0 from $fp-4768
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp1193 = ACall _tmp1192
	  lw $t0, -4776($fp)	# fill _tmp1192 to $t0 from $fp-4776
	  jalr $t0            	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -4780($fp)	# spill _tmp1193 from $t2 to $fp-4780
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# _tmp1194 = _tmp1161 && _tmp1193
	  lw $t0, -4652($fp)	# fill _tmp1161 to $t0 from $fp-4652
	  lw $t1, -4780($fp)	# fill _tmp1193 to $t1 from $fp-4780
	  and $t2, $t0, $t1	
	  sw $t2, -4784($fp)	# spill _tmp1194 from $t2 to $fp-4784
	# _tmp1195 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -4788($fp)	# spill _tmp1195 from $t2 to $fp-4788
	# _tmp1196 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -4792($fp)	# spill _tmp1196 from $t2 to $fp-4792
	# _tmp1197 = *(_tmp1195)
	  lw $t0, -4788($fp)	# fill _tmp1195 to $t0 from $fp-4788
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -4796($fp)	# spill _tmp1197 from $t2 to $fp-4796
	# _tmp1198 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -4800($fp)	# spill _tmp1198 from $t2 to $fp-4800
	# _tmp1199 = _tmp1196 < _tmp1198
	  lw $t0, -4792($fp)	# fill _tmp1196 to $t0 from $fp-4792
	  lw $t1, -4800($fp)	# fill _tmp1198 to $t1 from $fp-4800
	  slt $t2, $t0, $t1	
	  sw $t2, -4804($fp)	# spill _tmp1199 from $t2 to $fp-4804
	# _tmp1200 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -4808($fp)	# spill _tmp1200 from $t2 to $fp-4808
	# _tmp1201 = _tmp1197 - _tmp1200
	  lw $t0, -4796($fp)	# fill _tmp1197 to $t0 from $fp-4796
	  lw $t1, -4808($fp)	# fill _tmp1200 to $t1 from $fp-4808
	  sub $t2, $t0, $t1	
	  sw $t2, -4812($fp)	# spill _tmp1201 from $t2 to $fp-4812
	# _tmp1202 = _tmp1201 < _tmp1196
	  lw $t0, -4812($fp)	# fill _tmp1201 to $t0 from $fp-4812
	  lw $t1, -4792($fp)	# fill _tmp1196 to $t1 from $fp-4792
	  slt $t2, $t0, $t1	
	  sw $t2, -4816($fp)	# spill _tmp1202 from $t2 to $fp-4816
	# _tmp1203 = _tmp1199 || _tmp1202
	  lw $t0, -4804($fp)	# fill _tmp1199 to $t0 from $fp-4804
	  lw $t1, -4816($fp)	# fill _tmp1202 to $t1 from $fp-4816
	  or $t2, $t0, $t1	
	  sw $t2, -4820($fp)	# spill _tmp1203 from $t2 to $fp-4820
	# IfZ _tmp1203 Goto arrayAcc_205
	  lw $t0, -4820($fp)	# fill _tmp1203 to $t0 from $fp-4820
	  beqz $t0, arrayAcc_205	# branch if _tmp1203 is zero 
	# _tmp1204 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string149: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string149	# load label
	  sw $t2, -4824($fp)	# spill _tmp1204 from $t2 to $fp-4824
	# PushParam _tmp1204
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -4824($fp)	# fill _tmp1204 to $t0 from $fp-4824
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_205:
	# _tmp1205 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -4828($fp)	# spill _tmp1205 from $t2 to $fp-4828
	# _tmp1206 = _tmp1196 * _tmp1205
	  lw $t0, -4792($fp)	# fill _tmp1196 to $t0 from $fp-4792
	  lw $t1, -4828($fp)	# fill _tmp1205 to $t1 from $fp-4828
	  mul $t2, $t0, $t1	
	  sw $t2, -4832($fp)	# spill _tmp1206 from $t2 to $fp-4832
	# _tmp1207 = _tmp1195 + _tmp1206
	  lw $t0, -4788($fp)	# fill _tmp1195 to $t0 from $fp-4788
	  lw $t1, -4832($fp)	# fill _tmp1206 to $t1 from $fp-4832
	  add $t2, $t0, $t1	
	  sw $t2, -4836($fp)	# spill _tmp1207 from $t2 to $fp-4836
	# _tmp1208 = _tmp1207 + _tmp1205
	  lw $t0, -4836($fp)	# fill _tmp1207 to $t0 from $fp-4836
	  lw $t1, -4828($fp)	# fill _tmp1205 to $t1 from $fp-4828
	  add $t2, $t0, $t1	
	  sw $t2, -4840($fp)	# spill _tmp1208 from $t2 to $fp-4840
	# _tmp1209 = *(_tmp1208)
	  lw $t0, -4840($fp)	# fill _tmp1208 to $t0 from $fp-4840
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -4844($fp)	# spill _tmp1209 from $t2 to $fp-4844
	# _tmp1210 = 2
	  li $t2, 2		# load constant value 2 into $t2
	  sw $t2, -4848($fp)	# spill _tmp1210 from $t2 to $fp-4848
	# _tmp1211 = *(_tmp1209)
	  lw $t0, -4844($fp)	# fill _tmp1209 to $t0 from $fp-4844
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -4852($fp)	# spill _tmp1211 from $t2 to $fp-4852
	# _tmp1212 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -4856($fp)	# spill _tmp1212 from $t2 to $fp-4856
	# _tmp1213 = _tmp1210 < _tmp1212
	  lw $t0, -4848($fp)	# fill _tmp1210 to $t0 from $fp-4848
	  lw $t1, -4856($fp)	# fill _tmp1212 to $t1 from $fp-4856
	  slt $t2, $t0, $t1	
	  sw $t2, -4860($fp)	# spill _tmp1213 from $t2 to $fp-4860
	# _tmp1214 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -4864($fp)	# spill _tmp1214 from $t2 to $fp-4864
	# _tmp1215 = _tmp1211 - _tmp1214
	  lw $t0, -4852($fp)	# fill _tmp1211 to $t0 from $fp-4852
	  lw $t1, -4864($fp)	# fill _tmp1214 to $t1 from $fp-4864
	  sub $t2, $t0, $t1	
	  sw $t2, -4868($fp)	# spill _tmp1215 from $t2 to $fp-4868
	# _tmp1216 = _tmp1215 < _tmp1210
	  lw $t0, -4868($fp)	# fill _tmp1215 to $t0 from $fp-4868
	  lw $t1, -4848($fp)	# fill _tmp1210 to $t1 from $fp-4848
	  slt $t2, $t0, $t1	
	  sw $t2, -4872($fp)	# spill _tmp1216 from $t2 to $fp-4872
	# _tmp1217 = _tmp1213 || _tmp1216
	  lw $t0, -4860($fp)	# fill _tmp1213 to $t0 from $fp-4860
	  lw $t1, -4872($fp)	# fill _tmp1216 to $t1 from $fp-4872
	  or $t2, $t0, $t1	
	  sw $t2, -4876($fp)	# spill _tmp1217 from $t2 to $fp-4876
	# IfZ _tmp1217 Goto arrayAcc_206
	  lw $t0, -4876($fp)	# fill _tmp1217 to $t0 from $fp-4876
	  beqz $t0, arrayAcc_206	# branch if _tmp1217 is zero 
	# _tmp1218 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string150: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string150	# load label
	  sw $t2, -4880($fp)	# spill _tmp1218 from $t2 to $fp-4880
	# PushParam _tmp1218
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -4880($fp)	# fill _tmp1218 to $t0 from $fp-4880
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_206:
	# _tmp1219 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -4884($fp)	# spill _tmp1219 from $t2 to $fp-4884
	# _tmp1220 = _tmp1210 * _tmp1219
	  lw $t0, -4848($fp)	# fill _tmp1210 to $t0 from $fp-4848
	  lw $t1, -4884($fp)	# fill _tmp1219 to $t1 from $fp-4884
	  mul $t2, $t0, $t1	
	  sw $t2, -4888($fp)	# spill _tmp1220 from $t2 to $fp-4888
	# _tmp1221 = _tmp1209 + _tmp1220
	  lw $t0, -4844($fp)	# fill _tmp1209 to $t0 from $fp-4844
	  lw $t1, -4888($fp)	# fill _tmp1220 to $t1 from $fp-4888
	  add $t2, $t0, $t1	
	  sw $t2, -4892($fp)	# spill _tmp1221 from $t2 to $fp-4892
	# _tmp1222 = _tmp1221 + _tmp1219
	  lw $t0, -4892($fp)	# fill _tmp1221 to $t0 from $fp-4892
	  lw $t1, -4884($fp)	# fill _tmp1219 to $t1 from $fp-4884
	  add $t2, $t0, $t1	
	  sw $t2, -4896($fp)	# spill _tmp1222 from $t2 to $fp-4896
	# _tmp1223 = *(_tmp1222)
	  lw $t0, -4896($fp)	# fill _tmp1222 to $t0 from $fp-4896
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -4900($fp)	# spill _tmp1223 from $t2 to $fp-4900
	# _tmp1224 = *(_tmp1223)
	  lw $t0, -4900($fp)	# fill _tmp1223 to $t0 from $fp-4900
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -4904($fp)	# spill _tmp1224 from $t2 to $fp-4904
	# _tmp1225 = *(_tmp1224 + 20)
	  lw $t0, -4904($fp)	# fill _tmp1224 to $t0 from $fp-4904
	  lw $t2, 20($t0) 	# load with offset
	  sw $t2, -4908($fp)	# spill _tmp1225 from $t2 to $fp-4908
	# PushParam playerMark
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, 12($fp)	# fill playerMark to $t0 from $fp+12
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam _tmp1223
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -4900($fp)	# fill _tmp1223 to $t0 from $fp-4900
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp1226 = ACall _tmp1225
	  lw $t0, -4908($fp)	# fill _tmp1225 to $t0 from $fp-4908
	  jalr $t0            	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -4912($fp)	# spill _tmp1226 from $t2 to $fp-4912
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# _tmp1227 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -4916($fp)	# spill _tmp1227 from $t2 to $fp-4916
	# _tmp1228 = _tmp1226 == _tmp1227
	  lw $t0, -4912($fp)	# fill _tmp1226 to $t0 from $fp-4912
	  lw $t1, -4916($fp)	# fill _tmp1227 to $t1 from $fp-4916
	  seq $t2, $t0, $t1	
	  sw $t2, -4920($fp)	# spill _tmp1228 from $t2 to $fp-4920
	# _tmp1229 = _tmp1194 && _tmp1228
	  lw $t0, -4784($fp)	# fill _tmp1194 to $t0 from $fp-4784
	  lw $t1, -4920($fp)	# fill _tmp1228 to $t1 from $fp-4920
	  and $t2, $t0, $t1	
	  sw $t2, -4924($fp)	# spill _tmp1229 from $t2 to $fp-4924
	# IfZ _tmp1229 Goto else_207
	  lw $t0, -4924($fp)	# fill _tmp1229 to $t0 from $fp-4924
	  beqz $t0, else_207	# branch if _tmp1229 is zero 
	# _tmp1230 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -4928($fp)	# spill _tmp1230 from $t2 to $fp-4928
	# row = _tmp1230
	  lw $t2, -4928($fp)	# fill _tmp1230 to $t2 from $fp-4928
	  sw $t2, -8($fp)	# spill row from $t2 to $fp-8
	# _tmp1231 = 2
	  li $t2, 2		# load constant value 2 into $t2
	  sw $t2, -4932($fp)	# spill _tmp1231 from $t2 to $fp-4932
	# column = _tmp1231
	  lw $t2, -4932($fp)	# fill _tmp1231 to $t2 from $fp-4932
	  sw $t2, -12($fp)	# spill column from $t2 to $fp-12
	# Goto endif_208
	  b endif_208		# unconditional branch
  else_207:
	# _tmp1232 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -4936($fp)	# spill _tmp1232 from $t2 to $fp-4936
	# _tmp1233 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -4940($fp)	# spill _tmp1233 from $t2 to $fp-4940
	# _tmp1234 = *(_tmp1232)
	  lw $t0, -4936($fp)	# fill _tmp1232 to $t0 from $fp-4936
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -4944($fp)	# spill _tmp1234 from $t2 to $fp-4944
	# _tmp1235 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -4948($fp)	# spill _tmp1235 from $t2 to $fp-4948
	# _tmp1236 = _tmp1233 < _tmp1235
	  lw $t0, -4940($fp)	# fill _tmp1233 to $t0 from $fp-4940
	  lw $t1, -4948($fp)	# fill _tmp1235 to $t1 from $fp-4948
	  slt $t2, $t0, $t1	
	  sw $t2, -4952($fp)	# spill _tmp1236 from $t2 to $fp-4952
	# _tmp1237 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -4956($fp)	# spill _tmp1237 from $t2 to $fp-4956
	# _tmp1238 = _tmp1234 - _tmp1237
	  lw $t0, -4944($fp)	# fill _tmp1234 to $t0 from $fp-4944
	  lw $t1, -4956($fp)	# fill _tmp1237 to $t1 from $fp-4956
	  sub $t2, $t0, $t1	
	  sw $t2, -4960($fp)	# spill _tmp1238 from $t2 to $fp-4960
	# _tmp1239 = _tmp1238 < _tmp1233
	  lw $t0, -4960($fp)	# fill _tmp1238 to $t0 from $fp-4960
	  lw $t1, -4940($fp)	# fill _tmp1233 to $t1 from $fp-4940
	  slt $t2, $t0, $t1	
	  sw $t2, -4964($fp)	# spill _tmp1239 from $t2 to $fp-4964
	# _tmp1240 = _tmp1236 || _tmp1239
	  lw $t0, -4952($fp)	# fill _tmp1236 to $t0 from $fp-4952
	  lw $t1, -4964($fp)	# fill _tmp1239 to $t1 from $fp-4964
	  or $t2, $t0, $t1	
	  sw $t2, -4968($fp)	# spill _tmp1240 from $t2 to $fp-4968
	# IfZ _tmp1240 Goto arrayAcc_209
	  lw $t0, -4968($fp)	# fill _tmp1240 to $t0 from $fp-4968
	  beqz $t0, arrayAcc_209	# branch if _tmp1240 is zero 
	# _tmp1241 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string151: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string151	# load label
	  sw $t2, -4972($fp)	# spill _tmp1241 from $t2 to $fp-4972
	# PushParam _tmp1241
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -4972($fp)	# fill _tmp1241 to $t0 from $fp-4972
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_209:
	# _tmp1242 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -4976($fp)	# spill _tmp1242 from $t2 to $fp-4976
	# _tmp1243 = _tmp1233 * _tmp1242
	  lw $t0, -4940($fp)	# fill _tmp1233 to $t0 from $fp-4940
	  lw $t1, -4976($fp)	# fill _tmp1242 to $t1 from $fp-4976
	  mul $t2, $t0, $t1	
	  sw $t2, -4980($fp)	# spill _tmp1243 from $t2 to $fp-4980
	# _tmp1244 = _tmp1232 + _tmp1243
	  lw $t0, -4936($fp)	# fill _tmp1232 to $t0 from $fp-4936
	  lw $t1, -4980($fp)	# fill _tmp1243 to $t1 from $fp-4980
	  add $t2, $t0, $t1	
	  sw $t2, -4984($fp)	# spill _tmp1244 from $t2 to $fp-4984
	# _tmp1245 = _tmp1244 + _tmp1242
	  lw $t0, -4984($fp)	# fill _tmp1244 to $t0 from $fp-4984
	  lw $t1, -4976($fp)	# fill _tmp1242 to $t1 from $fp-4976
	  add $t2, $t0, $t1	
	  sw $t2, -4988($fp)	# spill _tmp1245 from $t2 to $fp-4988
	# _tmp1246 = *(_tmp1245)
	  lw $t0, -4988($fp)	# fill _tmp1245 to $t0 from $fp-4988
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -4992($fp)	# spill _tmp1246 from $t2 to $fp-4992
	# _tmp1247 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -4996($fp)	# spill _tmp1247 from $t2 to $fp-4996
	# _tmp1248 = *(_tmp1246)
	  lw $t0, -4992($fp)	# fill _tmp1246 to $t0 from $fp-4992
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -5000($fp)	# spill _tmp1248 from $t2 to $fp-5000
	# _tmp1249 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -5004($fp)	# spill _tmp1249 from $t2 to $fp-5004
	# _tmp1250 = _tmp1247 < _tmp1249
	  lw $t0, -4996($fp)	# fill _tmp1247 to $t0 from $fp-4996
	  lw $t1, -5004($fp)	# fill _tmp1249 to $t1 from $fp-5004
	  slt $t2, $t0, $t1	
	  sw $t2, -5008($fp)	# spill _tmp1250 from $t2 to $fp-5008
	# _tmp1251 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -5012($fp)	# spill _tmp1251 from $t2 to $fp-5012
	# _tmp1252 = _tmp1248 - _tmp1251
	  lw $t0, -5000($fp)	# fill _tmp1248 to $t0 from $fp-5000
	  lw $t1, -5012($fp)	# fill _tmp1251 to $t1 from $fp-5012
	  sub $t2, $t0, $t1	
	  sw $t2, -5016($fp)	# spill _tmp1252 from $t2 to $fp-5016
	# _tmp1253 = _tmp1252 < _tmp1247
	  lw $t0, -5016($fp)	# fill _tmp1252 to $t0 from $fp-5016
	  lw $t1, -4996($fp)	# fill _tmp1247 to $t1 from $fp-4996
	  slt $t2, $t0, $t1	
	  sw $t2, -5020($fp)	# spill _tmp1253 from $t2 to $fp-5020
	# _tmp1254 = _tmp1250 || _tmp1253
	  lw $t0, -5008($fp)	# fill _tmp1250 to $t0 from $fp-5008
	  lw $t1, -5020($fp)	# fill _tmp1253 to $t1 from $fp-5020
	  or $t2, $t0, $t1	
	  sw $t2, -5024($fp)	# spill _tmp1254 from $t2 to $fp-5024
	# IfZ _tmp1254 Goto arrayAcc_210
	  lw $t0, -5024($fp)	# fill _tmp1254 to $t0 from $fp-5024
	  beqz $t0, arrayAcc_210	# branch if _tmp1254 is zero 
	# _tmp1255 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string152: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string152	# load label
	  sw $t2, -5028($fp)	# spill _tmp1255 from $t2 to $fp-5028
	# PushParam _tmp1255
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -5028($fp)	# fill _tmp1255 to $t0 from $fp-5028
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_210:
	# _tmp1256 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -5032($fp)	# spill _tmp1256 from $t2 to $fp-5032
	# _tmp1257 = _tmp1247 * _tmp1256
	  lw $t0, -4996($fp)	# fill _tmp1247 to $t0 from $fp-4996
	  lw $t1, -5032($fp)	# fill _tmp1256 to $t1 from $fp-5032
	  mul $t2, $t0, $t1	
	  sw $t2, -5036($fp)	# spill _tmp1257 from $t2 to $fp-5036
	# _tmp1258 = _tmp1246 + _tmp1257
	  lw $t0, -4992($fp)	# fill _tmp1246 to $t0 from $fp-4992
	  lw $t1, -5036($fp)	# fill _tmp1257 to $t1 from $fp-5036
	  add $t2, $t0, $t1	
	  sw $t2, -5040($fp)	# spill _tmp1258 from $t2 to $fp-5040
	# _tmp1259 = _tmp1258 + _tmp1256
	  lw $t0, -5040($fp)	# fill _tmp1258 to $t0 from $fp-5040
	  lw $t1, -5032($fp)	# fill _tmp1256 to $t1 from $fp-5032
	  add $t2, $t0, $t1	
	  sw $t2, -5044($fp)	# spill _tmp1259 from $t2 to $fp-5044
	# _tmp1260 = *(_tmp1259)
	  lw $t0, -5044($fp)	# fill _tmp1259 to $t0 from $fp-5044
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -5048($fp)	# spill _tmp1260 from $t2 to $fp-5048
	# _tmp1261 = *(_tmp1260)
	  lw $t0, -5048($fp)	# fill _tmp1260 to $t0 from $fp-5048
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -5052($fp)	# spill _tmp1261 from $t2 to $fp-5052
	# _tmp1262 = *(_tmp1261 + 20)
	  lw $t0, -5052($fp)	# fill _tmp1261 to $t0 from $fp-5052
	  lw $t2, 20($t0) 	# load with offset
	  sw $t2, -5056($fp)	# spill _tmp1262 from $t2 to $fp-5056
	# PushParam enemyMark
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, 8($fp)	# fill enemyMark to $t0 from $fp+8
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam _tmp1260
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -5048($fp)	# fill _tmp1260 to $t0 from $fp-5048
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp1263 = ACall _tmp1262
	  lw $t0, -5056($fp)	# fill _tmp1262 to $t0 from $fp-5056
	  jalr $t0            	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -5060($fp)	# spill _tmp1263 from $t2 to $fp-5060
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# _tmp1264 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -5064($fp)	# spill _tmp1264 from $t2 to $fp-5064
	# _tmp1265 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -5068($fp)	# spill _tmp1265 from $t2 to $fp-5068
	# _tmp1266 = *(_tmp1264)
	  lw $t0, -5064($fp)	# fill _tmp1264 to $t0 from $fp-5064
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -5072($fp)	# spill _tmp1266 from $t2 to $fp-5072
	# _tmp1267 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -5076($fp)	# spill _tmp1267 from $t2 to $fp-5076
	# _tmp1268 = _tmp1265 < _tmp1267
	  lw $t0, -5068($fp)	# fill _tmp1265 to $t0 from $fp-5068
	  lw $t1, -5076($fp)	# fill _tmp1267 to $t1 from $fp-5076
	  slt $t2, $t0, $t1	
	  sw $t2, -5080($fp)	# spill _tmp1268 from $t2 to $fp-5080
	# _tmp1269 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -5084($fp)	# spill _tmp1269 from $t2 to $fp-5084
	# _tmp1270 = _tmp1266 - _tmp1269
	  lw $t0, -5072($fp)	# fill _tmp1266 to $t0 from $fp-5072
	  lw $t1, -5084($fp)	# fill _tmp1269 to $t1 from $fp-5084
	  sub $t2, $t0, $t1	
	  sw $t2, -5088($fp)	# spill _tmp1270 from $t2 to $fp-5088
	# _tmp1271 = _tmp1270 < _tmp1265
	  lw $t0, -5088($fp)	# fill _tmp1270 to $t0 from $fp-5088
	  lw $t1, -5068($fp)	# fill _tmp1265 to $t1 from $fp-5068
	  slt $t2, $t0, $t1	
	  sw $t2, -5092($fp)	# spill _tmp1271 from $t2 to $fp-5092
	# _tmp1272 = _tmp1268 || _tmp1271
	  lw $t0, -5080($fp)	# fill _tmp1268 to $t0 from $fp-5080
	  lw $t1, -5092($fp)	# fill _tmp1271 to $t1 from $fp-5092
	  or $t2, $t0, $t1	
	  sw $t2, -5096($fp)	# spill _tmp1272 from $t2 to $fp-5096
	# IfZ _tmp1272 Goto arrayAcc_211
	  lw $t0, -5096($fp)	# fill _tmp1272 to $t0 from $fp-5096
	  beqz $t0, arrayAcc_211	# branch if _tmp1272 is zero 
	# _tmp1273 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string153: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string153	# load label
	  sw $t2, -5100($fp)	# spill _tmp1273 from $t2 to $fp-5100
	# PushParam _tmp1273
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -5100($fp)	# fill _tmp1273 to $t0 from $fp-5100
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_211:
	# _tmp1274 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -5104($fp)	# spill _tmp1274 from $t2 to $fp-5104
	# _tmp1275 = _tmp1265 * _tmp1274
	  lw $t0, -5068($fp)	# fill _tmp1265 to $t0 from $fp-5068
	  lw $t1, -5104($fp)	# fill _tmp1274 to $t1 from $fp-5104
	  mul $t2, $t0, $t1	
	  sw $t2, -5108($fp)	# spill _tmp1275 from $t2 to $fp-5108
	# _tmp1276 = _tmp1264 + _tmp1275
	  lw $t0, -5064($fp)	# fill _tmp1264 to $t0 from $fp-5064
	  lw $t1, -5108($fp)	# fill _tmp1275 to $t1 from $fp-5108
	  add $t2, $t0, $t1	
	  sw $t2, -5112($fp)	# spill _tmp1276 from $t2 to $fp-5112
	# _tmp1277 = _tmp1276 + _tmp1274
	  lw $t0, -5112($fp)	# fill _tmp1276 to $t0 from $fp-5112
	  lw $t1, -5104($fp)	# fill _tmp1274 to $t1 from $fp-5104
	  add $t2, $t0, $t1	
	  sw $t2, -5116($fp)	# spill _tmp1277 from $t2 to $fp-5116
	# _tmp1278 = *(_tmp1277)
	  lw $t0, -5116($fp)	# fill _tmp1277 to $t0 from $fp-5116
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -5120($fp)	# spill _tmp1278 from $t2 to $fp-5120
	# _tmp1279 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -5124($fp)	# spill _tmp1279 from $t2 to $fp-5124
	# _tmp1280 = *(_tmp1278)
	  lw $t0, -5120($fp)	# fill _tmp1278 to $t0 from $fp-5120
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -5128($fp)	# spill _tmp1280 from $t2 to $fp-5128
	# _tmp1281 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -5132($fp)	# spill _tmp1281 from $t2 to $fp-5132
	# _tmp1282 = _tmp1279 < _tmp1281
	  lw $t0, -5124($fp)	# fill _tmp1279 to $t0 from $fp-5124
	  lw $t1, -5132($fp)	# fill _tmp1281 to $t1 from $fp-5132
	  slt $t2, $t0, $t1	
	  sw $t2, -5136($fp)	# spill _tmp1282 from $t2 to $fp-5136
	# _tmp1283 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -5140($fp)	# spill _tmp1283 from $t2 to $fp-5140
	# _tmp1284 = _tmp1280 - _tmp1283
	  lw $t0, -5128($fp)	# fill _tmp1280 to $t0 from $fp-5128
	  lw $t1, -5140($fp)	# fill _tmp1283 to $t1 from $fp-5140
	  sub $t2, $t0, $t1	
	  sw $t2, -5144($fp)	# spill _tmp1284 from $t2 to $fp-5144
	# _tmp1285 = _tmp1284 < _tmp1279
	  lw $t0, -5144($fp)	# fill _tmp1284 to $t0 from $fp-5144
	  lw $t1, -5124($fp)	# fill _tmp1279 to $t1 from $fp-5124
	  slt $t2, $t0, $t1	
	  sw $t2, -5148($fp)	# spill _tmp1285 from $t2 to $fp-5148
	# _tmp1286 = _tmp1282 || _tmp1285
	  lw $t0, -5136($fp)	# fill _tmp1282 to $t0 from $fp-5136
	  lw $t1, -5148($fp)	# fill _tmp1285 to $t1 from $fp-5148
	  or $t2, $t0, $t1	
	  sw $t2, -5152($fp)	# spill _tmp1286 from $t2 to $fp-5152
	# IfZ _tmp1286 Goto arrayAcc_212
	  lw $t0, -5152($fp)	# fill _tmp1286 to $t0 from $fp-5152
	  beqz $t0, arrayAcc_212	# branch if _tmp1286 is zero 
	# _tmp1287 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string154: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string154	# load label
	  sw $t2, -5156($fp)	# spill _tmp1287 from $t2 to $fp-5156
	# PushParam _tmp1287
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -5156($fp)	# fill _tmp1287 to $t0 from $fp-5156
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_212:
	# _tmp1288 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -5160($fp)	# spill _tmp1288 from $t2 to $fp-5160
	# _tmp1289 = _tmp1279 * _tmp1288
	  lw $t0, -5124($fp)	# fill _tmp1279 to $t0 from $fp-5124
	  lw $t1, -5160($fp)	# fill _tmp1288 to $t1 from $fp-5160
	  mul $t2, $t0, $t1	
	  sw $t2, -5164($fp)	# spill _tmp1289 from $t2 to $fp-5164
	# _tmp1290 = _tmp1278 + _tmp1289
	  lw $t0, -5120($fp)	# fill _tmp1278 to $t0 from $fp-5120
	  lw $t1, -5164($fp)	# fill _tmp1289 to $t1 from $fp-5164
	  add $t2, $t0, $t1	
	  sw $t2, -5168($fp)	# spill _tmp1290 from $t2 to $fp-5168
	# _tmp1291 = _tmp1290 + _tmp1288
	  lw $t0, -5168($fp)	# fill _tmp1290 to $t0 from $fp-5168
	  lw $t1, -5160($fp)	# fill _tmp1288 to $t1 from $fp-5160
	  add $t2, $t0, $t1	
	  sw $t2, -5172($fp)	# spill _tmp1291 from $t2 to $fp-5172
	# _tmp1292 = *(_tmp1291)
	  lw $t0, -5172($fp)	# fill _tmp1291 to $t0 from $fp-5172
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -5176($fp)	# spill _tmp1292 from $t2 to $fp-5176
	# _tmp1293 = *(_tmp1292)
	  lw $t0, -5176($fp)	# fill _tmp1292 to $t0 from $fp-5176
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -5180($fp)	# spill _tmp1293 from $t2 to $fp-5180
	# _tmp1294 = *(_tmp1293 + 20)
	  lw $t0, -5180($fp)	# fill _tmp1293 to $t0 from $fp-5180
	  lw $t2, 20($t0) 	# load with offset
	  sw $t2, -5184($fp)	# spill _tmp1294 from $t2 to $fp-5184
	# PushParam enemyMark
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, 8($fp)	# fill enemyMark to $t0 from $fp+8
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam _tmp1292
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -5176($fp)	# fill _tmp1292 to $t0 from $fp-5176
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp1295 = ACall _tmp1294
	  lw $t0, -5184($fp)	# fill _tmp1294 to $t0 from $fp-5184
	  jalr $t0            	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -5188($fp)	# spill _tmp1295 from $t2 to $fp-5188
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# _tmp1296 = _tmp1263 && _tmp1295
	  lw $t0, -5060($fp)	# fill _tmp1263 to $t0 from $fp-5060
	  lw $t1, -5188($fp)	# fill _tmp1295 to $t1 from $fp-5188
	  and $t2, $t0, $t1	
	  sw $t2, -5192($fp)	# spill _tmp1296 from $t2 to $fp-5192
	# _tmp1297 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -5196($fp)	# spill _tmp1297 from $t2 to $fp-5196
	# _tmp1298 = 2
	  li $t2, 2		# load constant value 2 into $t2
	  sw $t2, -5200($fp)	# spill _tmp1298 from $t2 to $fp-5200
	# _tmp1299 = *(_tmp1297)
	  lw $t0, -5196($fp)	# fill _tmp1297 to $t0 from $fp-5196
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -5204($fp)	# spill _tmp1299 from $t2 to $fp-5204
	# _tmp1300 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -5208($fp)	# spill _tmp1300 from $t2 to $fp-5208
	# _tmp1301 = _tmp1298 < _tmp1300
	  lw $t0, -5200($fp)	# fill _tmp1298 to $t0 from $fp-5200
	  lw $t1, -5208($fp)	# fill _tmp1300 to $t1 from $fp-5208
	  slt $t2, $t0, $t1	
	  sw $t2, -5212($fp)	# spill _tmp1301 from $t2 to $fp-5212
	# _tmp1302 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -5216($fp)	# spill _tmp1302 from $t2 to $fp-5216
	# _tmp1303 = _tmp1299 - _tmp1302
	  lw $t0, -5204($fp)	# fill _tmp1299 to $t0 from $fp-5204
	  lw $t1, -5216($fp)	# fill _tmp1302 to $t1 from $fp-5216
	  sub $t2, $t0, $t1	
	  sw $t2, -5220($fp)	# spill _tmp1303 from $t2 to $fp-5220
	# _tmp1304 = _tmp1303 < _tmp1298
	  lw $t0, -5220($fp)	# fill _tmp1303 to $t0 from $fp-5220
	  lw $t1, -5200($fp)	# fill _tmp1298 to $t1 from $fp-5200
	  slt $t2, $t0, $t1	
	  sw $t2, -5224($fp)	# spill _tmp1304 from $t2 to $fp-5224
	# _tmp1305 = _tmp1301 || _tmp1304
	  lw $t0, -5212($fp)	# fill _tmp1301 to $t0 from $fp-5212
	  lw $t1, -5224($fp)	# fill _tmp1304 to $t1 from $fp-5224
	  or $t2, $t0, $t1	
	  sw $t2, -5228($fp)	# spill _tmp1305 from $t2 to $fp-5228
	# IfZ _tmp1305 Goto arrayAcc_213
	  lw $t0, -5228($fp)	# fill _tmp1305 to $t0 from $fp-5228
	  beqz $t0, arrayAcc_213	# branch if _tmp1305 is zero 
	# _tmp1306 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string155: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string155	# load label
	  sw $t2, -5232($fp)	# spill _tmp1306 from $t2 to $fp-5232
	# PushParam _tmp1306
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -5232($fp)	# fill _tmp1306 to $t0 from $fp-5232
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_213:
	# _tmp1307 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -5236($fp)	# spill _tmp1307 from $t2 to $fp-5236
	# _tmp1308 = _tmp1298 * _tmp1307
	  lw $t0, -5200($fp)	# fill _tmp1298 to $t0 from $fp-5200
	  lw $t1, -5236($fp)	# fill _tmp1307 to $t1 from $fp-5236
	  mul $t2, $t0, $t1	
	  sw $t2, -5240($fp)	# spill _tmp1308 from $t2 to $fp-5240
	# _tmp1309 = _tmp1297 + _tmp1308
	  lw $t0, -5196($fp)	# fill _tmp1297 to $t0 from $fp-5196
	  lw $t1, -5240($fp)	# fill _tmp1308 to $t1 from $fp-5240
	  add $t2, $t0, $t1	
	  sw $t2, -5244($fp)	# spill _tmp1309 from $t2 to $fp-5244
	# _tmp1310 = _tmp1309 + _tmp1307
	  lw $t0, -5244($fp)	# fill _tmp1309 to $t0 from $fp-5244
	  lw $t1, -5236($fp)	# fill _tmp1307 to $t1 from $fp-5236
	  add $t2, $t0, $t1	
	  sw $t2, -5248($fp)	# spill _tmp1310 from $t2 to $fp-5248
	# _tmp1311 = *(_tmp1310)
	  lw $t0, -5248($fp)	# fill _tmp1310 to $t0 from $fp-5248
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -5252($fp)	# spill _tmp1311 from $t2 to $fp-5252
	# _tmp1312 = 2
	  li $t2, 2		# load constant value 2 into $t2
	  sw $t2, -5256($fp)	# spill _tmp1312 from $t2 to $fp-5256
	# _tmp1313 = *(_tmp1311)
	  lw $t0, -5252($fp)	# fill _tmp1311 to $t0 from $fp-5252
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -5260($fp)	# spill _tmp1313 from $t2 to $fp-5260
	# _tmp1314 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -5264($fp)	# spill _tmp1314 from $t2 to $fp-5264
	# _tmp1315 = _tmp1312 < _tmp1314
	  lw $t0, -5256($fp)	# fill _tmp1312 to $t0 from $fp-5256
	  lw $t1, -5264($fp)	# fill _tmp1314 to $t1 from $fp-5264
	  slt $t2, $t0, $t1	
	  sw $t2, -5268($fp)	# spill _tmp1315 from $t2 to $fp-5268
	# _tmp1316 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -5272($fp)	# spill _tmp1316 from $t2 to $fp-5272
	# _tmp1317 = _tmp1313 - _tmp1316
	  lw $t0, -5260($fp)	# fill _tmp1313 to $t0 from $fp-5260
	  lw $t1, -5272($fp)	# fill _tmp1316 to $t1 from $fp-5272
	  sub $t2, $t0, $t1	
	  sw $t2, -5276($fp)	# spill _tmp1317 from $t2 to $fp-5276
	# _tmp1318 = _tmp1317 < _tmp1312
	  lw $t0, -5276($fp)	# fill _tmp1317 to $t0 from $fp-5276
	  lw $t1, -5256($fp)	# fill _tmp1312 to $t1 from $fp-5256
	  slt $t2, $t0, $t1	
	  sw $t2, -5280($fp)	# spill _tmp1318 from $t2 to $fp-5280
	# _tmp1319 = _tmp1315 || _tmp1318
	  lw $t0, -5268($fp)	# fill _tmp1315 to $t0 from $fp-5268
	  lw $t1, -5280($fp)	# fill _tmp1318 to $t1 from $fp-5280
	  or $t2, $t0, $t1	
	  sw $t2, -5284($fp)	# spill _tmp1319 from $t2 to $fp-5284
	# IfZ _tmp1319 Goto arrayAcc_214
	  lw $t0, -5284($fp)	# fill _tmp1319 to $t0 from $fp-5284
	  beqz $t0, arrayAcc_214	# branch if _tmp1319 is zero 
	# _tmp1320 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string156: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string156	# load label
	  sw $t2, -5288($fp)	# spill _tmp1320 from $t2 to $fp-5288
	# PushParam _tmp1320
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -5288($fp)	# fill _tmp1320 to $t0 from $fp-5288
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_214:
	# _tmp1321 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -5292($fp)	# spill _tmp1321 from $t2 to $fp-5292
	# _tmp1322 = _tmp1312 * _tmp1321
	  lw $t0, -5256($fp)	# fill _tmp1312 to $t0 from $fp-5256
	  lw $t1, -5292($fp)	# fill _tmp1321 to $t1 from $fp-5292
	  mul $t2, $t0, $t1	
	  sw $t2, -5296($fp)	# spill _tmp1322 from $t2 to $fp-5296
	# _tmp1323 = _tmp1311 + _tmp1322
	  lw $t0, -5252($fp)	# fill _tmp1311 to $t0 from $fp-5252
	  lw $t1, -5296($fp)	# fill _tmp1322 to $t1 from $fp-5296
	  add $t2, $t0, $t1	
	  sw $t2, -5300($fp)	# spill _tmp1323 from $t2 to $fp-5300
	# _tmp1324 = _tmp1323 + _tmp1321
	  lw $t0, -5300($fp)	# fill _tmp1323 to $t0 from $fp-5300
	  lw $t1, -5292($fp)	# fill _tmp1321 to $t1 from $fp-5292
	  add $t2, $t0, $t1	
	  sw $t2, -5304($fp)	# spill _tmp1324 from $t2 to $fp-5304
	# _tmp1325 = *(_tmp1324)
	  lw $t0, -5304($fp)	# fill _tmp1324 to $t0 from $fp-5304
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -5308($fp)	# spill _tmp1325 from $t2 to $fp-5308
	# _tmp1326 = *(_tmp1325)
	  lw $t0, -5308($fp)	# fill _tmp1325 to $t0 from $fp-5308
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -5312($fp)	# spill _tmp1326 from $t2 to $fp-5312
	# _tmp1327 = *(_tmp1326 + 20)
	  lw $t0, -5312($fp)	# fill _tmp1326 to $t0 from $fp-5312
	  lw $t2, 20($t0) 	# load with offset
	  sw $t2, -5316($fp)	# spill _tmp1327 from $t2 to $fp-5316
	# PushParam playerMark
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, 12($fp)	# fill playerMark to $t0 from $fp+12
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam _tmp1325
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -5308($fp)	# fill _tmp1325 to $t0 from $fp-5308
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp1328 = ACall _tmp1327
	  lw $t0, -5316($fp)	# fill _tmp1327 to $t0 from $fp-5316
	  jalr $t0            	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -5320($fp)	# spill _tmp1328 from $t2 to $fp-5320
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# _tmp1329 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -5324($fp)	# spill _tmp1329 from $t2 to $fp-5324
	# _tmp1330 = _tmp1328 == _tmp1329
	  lw $t0, -5320($fp)	# fill _tmp1328 to $t0 from $fp-5320
	  lw $t1, -5324($fp)	# fill _tmp1329 to $t1 from $fp-5324
	  seq $t2, $t0, $t1	
	  sw $t2, -5328($fp)	# spill _tmp1330 from $t2 to $fp-5328
	# _tmp1331 = _tmp1296 && _tmp1330
	  lw $t0, -5192($fp)	# fill _tmp1296 to $t0 from $fp-5192
	  lw $t1, -5328($fp)	# fill _tmp1330 to $t1 from $fp-5328
	  and $t2, $t0, $t1	
	  sw $t2, -5332($fp)	# spill _tmp1331 from $t2 to $fp-5332
	# IfZ _tmp1331 Goto else_215
	  lw $t0, -5332($fp)	# fill _tmp1331 to $t0 from $fp-5332
	  beqz $t0, else_215	# branch if _tmp1331 is zero 
	# _tmp1332 = 2
	  li $t2, 2		# load constant value 2 into $t2
	  sw $t2, -5336($fp)	# spill _tmp1332 from $t2 to $fp-5336
	# row = _tmp1332
	  lw $t2, -5336($fp)	# fill _tmp1332 to $t2 from $fp-5336
	  sw $t2, -8($fp)	# spill row from $t2 to $fp-8
	# _tmp1333 = 2
	  li $t2, 2		# load constant value 2 into $t2
	  sw $t2, -5340($fp)	# spill _tmp1333 from $t2 to $fp-5340
	# column = _tmp1333
	  lw $t2, -5340($fp)	# fill _tmp1333 to $t2 from $fp-5340
	  sw $t2, -12($fp)	# spill column from $t2 to $fp-12
	# Goto endif_216
	  b endif_216		# unconditional branch
  else_215:
	# _tmp1334 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -5344($fp)	# spill _tmp1334 from $t2 to $fp-5344
	# _tmp1335 = 2
	  li $t2, 2		# load constant value 2 into $t2
	  sw $t2, -5348($fp)	# spill _tmp1335 from $t2 to $fp-5348
	# _tmp1336 = *(_tmp1334)
	  lw $t0, -5344($fp)	# fill _tmp1334 to $t0 from $fp-5344
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -5352($fp)	# spill _tmp1336 from $t2 to $fp-5352
	# _tmp1337 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -5356($fp)	# spill _tmp1337 from $t2 to $fp-5356
	# _tmp1338 = _tmp1335 < _tmp1337
	  lw $t0, -5348($fp)	# fill _tmp1335 to $t0 from $fp-5348
	  lw $t1, -5356($fp)	# fill _tmp1337 to $t1 from $fp-5356
	  slt $t2, $t0, $t1	
	  sw $t2, -5360($fp)	# spill _tmp1338 from $t2 to $fp-5360
	# _tmp1339 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -5364($fp)	# spill _tmp1339 from $t2 to $fp-5364
	# _tmp1340 = _tmp1336 - _tmp1339
	  lw $t0, -5352($fp)	# fill _tmp1336 to $t0 from $fp-5352
	  lw $t1, -5364($fp)	# fill _tmp1339 to $t1 from $fp-5364
	  sub $t2, $t0, $t1	
	  sw $t2, -5368($fp)	# spill _tmp1340 from $t2 to $fp-5368
	# _tmp1341 = _tmp1340 < _tmp1335
	  lw $t0, -5368($fp)	# fill _tmp1340 to $t0 from $fp-5368
	  lw $t1, -5348($fp)	# fill _tmp1335 to $t1 from $fp-5348
	  slt $t2, $t0, $t1	
	  sw $t2, -5372($fp)	# spill _tmp1341 from $t2 to $fp-5372
	# _tmp1342 = _tmp1338 || _tmp1341
	  lw $t0, -5360($fp)	# fill _tmp1338 to $t0 from $fp-5360
	  lw $t1, -5372($fp)	# fill _tmp1341 to $t1 from $fp-5372
	  or $t2, $t0, $t1	
	  sw $t2, -5376($fp)	# spill _tmp1342 from $t2 to $fp-5376
	# IfZ _tmp1342 Goto arrayAcc_217
	  lw $t0, -5376($fp)	# fill _tmp1342 to $t0 from $fp-5376
	  beqz $t0, arrayAcc_217	# branch if _tmp1342 is zero 
	# _tmp1343 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string157: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string157	# load label
	  sw $t2, -5380($fp)	# spill _tmp1343 from $t2 to $fp-5380
	# PushParam _tmp1343
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -5380($fp)	# fill _tmp1343 to $t0 from $fp-5380
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_217:
	# _tmp1344 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -5384($fp)	# spill _tmp1344 from $t2 to $fp-5384
	# _tmp1345 = _tmp1335 * _tmp1344
	  lw $t0, -5348($fp)	# fill _tmp1335 to $t0 from $fp-5348
	  lw $t1, -5384($fp)	# fill _tmp1344 to $t1 from $fp-5384
	  mul $t2, $t0, $t1	
	  sw $t2, -5388($fp)	# spill _tmp1345 from $t2 to $fp-5388
	# _tmp1346 = _tmp1334 + _tmp1345
	  lw $t0, -5344($fp)	# fill _tmp1334 to $t0 from $fp-5344
	  lw $t1, -5388($fp)	# fill _tmp1345 to $t1 from $fp-5388
	  add $t2, $t0, $t1	
	  sw $t2, -5392($fp)	# spill _tmp1346 from $t2 to $fp-5392
	# _tmp1347 = _tmp1346 + _tmp1344
	  lw $t0, -5392($fp)	# fill _tmp1346 to $t0 from $fp-5392
	  lw $t1, -5384($fp)	# fill _tmp1344 to $t1 from $fp-5384
	  add $t2, $t0, $t1	
	  sw $t2, -5396($fp)	# spill _tmp1347 from $t2 to $fp-5396
	# _tmp1348 = *(_tmp1347)
	  lw $t0, -5396($fp)	# fill _tmp1347 to $t0 from $fp-5396
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -5400($fp)	# spill _tmp1348 from $t2 to $fp-5400
	# _tmp1349 = 2
	  li $t2, 2		# load constant value 2 into $t2
	  sw $t2, -5404($fp)	# spill _tmp1349 from $t2 to $fp-5404
	# _tmp1350 = *(_tmp1348)
	  lw $t0, -5400($fp)	# fill _tmp1348 to $t0 from $fp-5400
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -5408($fp)	# spill _tmp1350 from $t2 to $fp-5408
	# _tmp1351 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -5412($fp)	# spill _tmp1351 from $t2 to $fp-5412
	# _tmp1352 = _tmp1349 < _tmp1351
	  lw $t0, -5404($fp)	# fill _tmp1349 to $t0 from $fp-5404
	  lw $t1, -5412($fp)	# fill _tmp1351 to $t1 from $fp-5412
	  slt $t2, $t0, $t1	
	  sw $t2, -5416($fp)	# spill _tmp1352 from $t2 to $fp-5416
	# _tmp1353 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -5420($fp)	# spill _tmp1353 from $t2 to $fp-5420
	# _tmp1354 = _tmp1350 - _tmp1353
	  lw $t0, -5408($fp)	# fill _tmp1350 to $t0 from $fp-5408
	  lw $t1, -5420($fp)	# fill _tmp1353 to $t1 from $fp-5420
	  sub $t2, $t0, $t1	
	  sw $t2, -5424($fp)	# spill _tmp1354 from $t2 to $fp-5424
	# _tmp1355 = _tmp1354 < _tmp1349
	  lw $t0, -5424($fp)	# fill _tmp1354 to $t0 from $fp-5424
	  lw $t1, -5404($fp)	# fill _tmp1349 to $t1 from $fp-5404
	  slt $t2, $t0, $t1	
	  sw $t2, -5428($fp)	# spill _tmp1355 from $t2 to $fp-5428
	# _tmp1356 = _tmp1352 || _tmp1355
	  lw $t0, -5416($fp)	# fill _tmp1352 to $t0 from $fp-5416
	  lw $t1, -5428($fp)	# fill _tmp1355 to $t1 from $fp-5428
	  or $t2, $t0, $t1	
	  sw $t2, -5432($fp)	# spill _tmp1356 from $t2 to $fp-5432
	# IfZ _tmp1356 Goto arrayAcc_218
	  lw $t0, -5432($fp)	# fill _tmp1356 to $t0 from $fp-5432
	  beqz $t0, arrayAcc_218	# branch if _tmp1356 is zero 
	# _tmp1357 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string158: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string158	# load label
	  sw $t2, -5436($fp)	# spill _tmp1357 from $t2 to $fp-5436
	# PushParam _tmp1357
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -5436($fp)	# fill _tmp1357 to $t0 from $fp-5436
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_218:
	# _tmp1358 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -5440($fp)	# spill _tmp1358 from $t2 to $fp-5440
	# _tmp1359 = _tmp1349 * _tmp1358
	  lw $t0, -5404($fp)	# fill _tmp1349 to $t0 from $fp-5404
	  lw $t1, -5440($fp)	# fill _tmp1358 to $t1 from $fp-5440
	  mul $t2, $t0, $t1	
	  sw $t2, -5444($fp)	# spill _tmp1359 from $t2 to $fp-5444
	# _tmp1360 = _tmp1348 + _tmp1359
	  lw $t0, -5400($fp)	# fill _tmp1348 to $t0 from $fp-5400
	  lw $t1, -5444($fp)	# fill _tmp1359 to $t1 from $fp-5444
	  add $t2, $t0, $t1	
	  sw $t2, -5448($fp)	# spill _tmp1360 from $t2 to $fp-5448
	# _tmp1361 = _tmp1360 + _tmp1358
	  lw $t0, -5448($fp)	# fill _tmp1360 to $t0 from $fp-5448
	  lw $t1, -5440($fp)	# fill _tmp1358 to $t1 from $fp-5440
	  add $t2, $t0, $t1	
	  sw $t2, -5452($fp)	# spill _tmp1361 from $t2 to $fp-5452
	# _tmp1362 = *(_tmp1361)
	  lw $t0, -5452($fp)	# fill _tmp1361 to $t0 from $fp-5452
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -5456($fp)	# spill _tmp1362 from $t2 to $fp-5456
	# _tmp1363 = *(_tmp1362)
	  lw $t0, -5456($fp)	# fill _tmp1362 to $t0 from $fp-5456
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -5460($fp)	# spill _tmp1363 from $t2 to $fp-5460
	# _tmp1364 = *(_tmp1363 + 20)
	  lw $t0, -5460($fp)	# fill _tmp1363 to $t0 from $fp-5460
	  lw $t2, 20($t0) 	# load with offset
	  sw $t2, -5464($fp)	# spill _tmp1364 from $t2 to $fp-5464
	# PushParam enemyMark
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, 8($fp)	# fill enemyMark to $t0 from $fp+8
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam _tmp1362
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -5456($fp)	# fill _tmp1362 to $t0 from $fp-5456
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp1365 = ACall _tmp1364
	  lw $t0, -5464($fp)	# fill _tmp1364 to $t0 from $fp-5464
	  jalr $t0            	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -5468($fp)	# spill _tmp1365 from $t2 to $fp-5468
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# _tmp1366 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -5472($fp)	# spill _tmp1366 from $t2 to $fp-5472
	# _tmp1367 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -5476($fp)	# spill _tmp1367 from $t2 to $fp-5476
	# _tmp1368 = *(_tmp1366)
	  lw $t0, -5472($fp)	# fill _tmp1366 to $t0 from $fp-5472
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -5480($fp)	# spill _tmp1368 from $t2 to $fp-5480
	# _tmp1369 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -5484($fp)	# spill _tmp1369 from $t2 to $fp-5484
	# _tmp1370 = _tmp1367 < _tmp1369
	  lw $t0, -5476($fp)	# fill _tmp1367 to $t0 from $fp-5476
	  lw $t1, -5484($fp)	# fill _tmp1369 to $t1 from $fp-5484
	  slt $t2, $t0, $t1	
	  sw $t2, -5488($fp)	# spill _tmp1370 from $t2 to $fp-5488
	# _tmp1371 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -5492($fp)	# spill _tmp1371 from $t2 to $fp-5492
	# _tmp1372 = _tmp1368 - _tmp1371
	  lw $t0, -5480($fp)	# fill _tmp1368 to $t0 from $fp-5480
	  lw $t1, -5492($fp)	# fill _tmp1371 to $t1 from $fp-5492
	  sub $t2, $t0, $t1	
	  sw $t2, -5496($fp)	# spill _tmp1372 from $t2 to $fp-5496
	# _tmp1373 = _tmp1372 < _tmp1367
	  lw $t0, -5496($fp)	# fill _tmp1372 to $t0 from $fp-5496
	  lw $t1, -5476($fp)	# fill _tmp1367 to $t1 from $fp-5476
	  slt $t2, $t0, $t1	
	  sw $t2, -5500($fp)	# spill _tmp1373 from $t2 to $fp-5500
	# _tmp1374 = _tmp1370 || _tmp1373
	  lw $t0, -5488($fp)	# fill _tmp1370 to $t0 from $fp-5488
	  lw $t1, -5500($fp)	# fill _tmp1373 to $t1 from $fp-5500
	  or $t2, $t0, $t1	
	  sw $t2, -5504($fp)	# spill _tmp1374 from $t2 to $fp-5504
	# IfZ _tmp1374 Goto arrayAcc_219
	  lw $t0, -5504($fp)	# fill _tmp1374 to $t0 from $fp-5504
	  beqz $t0, arrayAcc_219	# branch if _tmp1374 is zero 
	# _tmp1375 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string159: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string159	# load label
	  sw $t2, -5508($fp)	# spill _tmp1375 from $t2 to $fp-5508
	# PushParam _tmp1375
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -5508($fp)	# fill _tmp1375 to $t0 from $fp-5508
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_219:
	# _tmp1376 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -5512($fp)	# spill _tmp1376 from $t2 to $fp-5512
	# _tmp1377 = _tmp1367 * _tmp1376
	  lw $t0, -5476($fp)	# fill _tmp1367 to $t0 from $fp-5476
	  lw $t1, -5512($fp)	# fill _tmp1376 to $t1 from $fp-5512
	  mul $t2, $t0, $t1	
	  sw $t2, -5516($fp)	# spill _tmp1377 from $t2 to $fp-5516
	# _tmp1378 = _tmp1366 + _tmp1377
	  lw $t0, -5472($fp)	# fill _tmp1366 to $t0 from $fp-5472
	  lw $t1, -5516($fp)	# fill _tmp1377 to $t1 from $fp-5516
	  add $t2, $t0, $t1	
	  sw $t2, -5520($fp)	# spill _tmp1378 from $t2 to $fp-5520
	# _tmp1379 = _tmp1378 + _tmp1376
	  lw $t0, -5520($fp)	# fill _tmp1378 to $t0 from $fp-5520
	  lw $t1, -5512($fp)	# fill _tmp1376 to $t1 from $fp-5512
	  add $t2, $t0, $t1	
	  sw $t2, -5524($fp)	# spill _tmp1379 from $t2 to $fp-5524
	# _tmp1380 = *(_tmp1379)
	  lw $t0, -5524($fp)	# fill _tmp1379 to $t0 from $fp-5524
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -5528($fp)	# spill _tmp1380 from $t2 to $fp-5528
	# _tmp1381 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -5532($fp)	# spill _tmp1381 from $t2 to $fp-5532
	# _tmp1382 = *(_tmp1380)
	  lw $t0, -5528($fp)	# fill _tmp1380 to $t0 from $fp-5528
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -5536($fp)	# spill _tmp1382 from $t2 to $fp-5536
	# _tmp1383 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -5540($fp)	# spill _tmp1383 from $t2 to $fp-5540
	# _tmp1384 = _tmp1381 < _tmp1383
	  lw $t0, -5532($fp)	# fill _tmp1381 to $t0 from $fp-5532
	  lw $t1, -5540($fp)	# fill _tmp1383 to $t1 from $fp-5540
	  slt $t2, $t0, $t1	
	  sw $t2, -5544($fp)	# spill _tmp1384 from $t2 to $fp-5544
	# _tmp1385 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -5548($fp)	# spill _tmp1385 from $t2 to $fp-5548
	# _tmp1386 = _tmp1382 - _tmp1385
	  lw $t0, -5536($fp)	# fill _tmp1382 to $t0 from $fp-5536
	  lw $t1, -5548($fp)	# fill _tmp1385 to $t1 from $fp-5548
	  sub $t2, $t0, $t1	
	  sw $t2, -5552($fp)	# spill _tmp1386 from $t2 to $fp-5552
	# _tmp1387 = _tmp1386 < _tmp1381
	  lw $t0, -5552($fp)	# fill _tmp1386 to $t0 from $fp-5552
	  lw $t1, -5532($fp)	# fill _tmp1381 to $t1 from $fp-5532
	  slt $t2, $t0, $t1	
	  sw $t2, -5556($fp)	# spill _tmp1387 from $t2 to $fp-5556
	# _tmp1388 = _tmp1384 || _tmp1387
	  lw $t0, -5544($fp)	# fill _tmp1384 to $t0 from $fp-5544
	  lw $t1, -5556($fp)	# fill _tmp1387 to $t1 from $fp-5556
	  or $t2, $t0, $t1	
	  sw $t2, -5560($fp)	# spill _tmp1388 from $t2 to $fp-5560
	# IfZ _tmp1388 Goto arrayAcc_220
	  lw $t0, -5560($fp)	# fill _tmp1388 to $t0 from $fp-5560
	  beqz $t0, arrayAcc_220	# branch if _tmp1388 is zero 
	# _tmp1389 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string160: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string160	# load label
	  sw $t2, -5564($fp)	# spill _tmp1389 from $t2 to $fp-5564
	# PushParam _tmp1389
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -5564($fp)	# fill _tmp1389 to $t0 from $fp-5564
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_220:
	# _tmp1390 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -5568($fp)	# spill _tmp1390 from $t2 to $fp-5568
	# _tmp1391 = _tmp1381 * _tmp1390
	  lw $t0, -5532($fp)	# fill _tmp1381 to $t0 from $fp-5532
	  lw $t1, -5568($fp)	# fill _tmp1390 to $t1 from $fp-5568
	  mul $t2, $t0, $t1	
	  sw $t2, -5572($fp)	# spill _tmp1391 from $t2 to $fp-5572
	# _tmp1392 = _tmp1380 + _tmp1391
	  lw $t0, -5528($fp)	# fill _tmp1380 to $t0 from $fp-5528
	  lw $t1, -5572($fp)	# fill _tmp1391 to $t1 from $fp-5572
	  add $t2, $t0, $t1	
	  sw $t2, -5576($fp)	# spill _tmp1392 from $t2 to $fp-5576
	# _tmp1393 = _tmp1392 + _tmp1390
	  lw $t0, -5576($fp)	# fill _tmp1392 to $t0 from $fp-5576
	  lw $t1, -5568($fp)	# fill _tmp1390 to $t1 from $fp-5568
	  add $t2, $t0, $t1	
	  sw $t2, -5580($fp)	# spill _tmp1393 from $t2 to $fp-5580
	# _tmp1394 = *(_tmp1393)
	  lw $t0, -5580($fp)	# fill _tmp1393 to $t0 from $fp-5580
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -5584($fp)	# spill _tmp1394 from $t2 to $fp-5584
	# _tmp1395 = *(_tmp1394)
	  lw $t0, -5584($fp)	# fill _tmp1394 to $t0 from $fp-5584
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -5588($fp)	# spill _tmp1395 from $t2 to $fp-5588
	# _tmp1396 = *(_tmp1395 + 20)
	  lw $t0, -5588($fp)	# fill _tmp1395 to $t0 from $fp-5588
	  lw $t2, 20($t0) 	# load with offset
	  sw $t2, -5592($fp)	# spill _tmp1396 from $t2 to $fp-5592
	# PushParam enemyMark
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, 8($fp)	# fill enemyMark to $t0 from $fp+8
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam _tmp1394
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -5584($fp)	# fill _tmp1394 to $t0 from $fp-5584
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp1397 = ACall _tmp1396
	  lw $t0, -5592($fp)	# fill _tmp1396 to $t0 from $fp-5592
	  jalr $t0            	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -5596($fp)	# spill _tmp1397 from $t2 to $fp-5596
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# _tmp1398 = _tmp1365 && _tmp1397
	  lw $t0, -5468($fp)	# fill _tmp1365 to $t0 from $fp-5468
	  lw $t1, -5596($fp)	# fill _tmp1397 to $t1 from $fp-5596
	  and $t2, $t0, $t1	
	  sw $t2, -5600($fp)	# spill _tmp1398 from $t2 to $fp-5600
	# _tmp1399 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -5604($fp)	# spill _tmp1399 from $t2 to $fp-5604
	# _tmp1400 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -5608($fp)	# spill _tmp1400 from $t2 to $fp-5608
	# _tmp1401 = *(_tmp1399)
	  lw $t0, -5604($fp)	# fill _tmp1399 to $t0 from $fp-5604
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -5612($fp)	# spill _tmp1401 from $t2 to $fp-5612
	# _tmp1402 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -5616($fp)	# spill _tmp1402 from $t2 to $fp-5616
	# _tmp1403 = _tmp1400 < _tmp1402
	  lw $t0, -5608($fp)	# fill _tmp1400 to $t0 from $fp-5608
	  lw $t1, -5616($fp)	# fill _tmp1402 to $t1 from $fp-5616
	  slt $t2, $t0, $t1	
	  sw $t2, -5620($fp)	# spill _tmp1403 from $t2 to $fp-5620
	# _tmp1404 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -5624($fp)	# spill _tmp1404 from $t2 to $fp-5624
	# _tmp1405 = _tmp1401 - _tmp1404
	  lw $t0, -5612($fp)	# fill _tmp1401 to $t0 from $fp-5612
	  lw $t1, -5624($fp)	# fill _tmp1404 to $t1 from $fp-5624
	  sub $t2, $t0, $t1	
	  sw $t2, -5628($fp)	# spill _tmp1405 from $t2 to $fp-5628
	# _tmp1406 = _tmp1405 < _tmp1400
	  lw $t0, -5628($fp)	# fill _tmp1405 to $t0 from $fp-5628
	  lw $t1, -5608($fp)	# fill _tmp1400 to $t1 from $fp-5608
	  slt $t2, $t0, $t1	
	  sw $t2, -5632($fp)	# spill _tmp1406 from $t2 to $fp-5632
	# _tmp1407 = _tmp1403 || _tmp1406
	  lw $t0, -5620($fp)	# fill _tmp1403 to $t0 from $fp-5620
	  lw $t1, -5632($fp)	# fill _tmp1406 to $t1 from $fp-5632
	  or $t2, $t0, $t1	
	  sw $t2, -5636($fp)	# spill _tmp1407 from $t2 to $fp-5636
	# IfZ _tmp1407 Goto arrayAcc_221
	  lw $t0, -5636($fp)	# fill _tmp1407 to $t0 from $fp-5636
	  beqz $t0, arrayAcc_221	# branch if _tmp1407 is zero 
	# _tmp1408 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string161: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string161	# load label
	  sw $t2, -5640($fp)	# spill _tmp1408 from $t2 to $fp-5640
	# PushParam _tmp1408
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -5640($fp)	# fill _tmp1408 to $t0 from $fp-5640
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_221:
	# _tmp1409 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -5644($fp)	# spill _tmp1409 from $t2 to $fp-5644
	# _tmp1410 = _tmp1400 * _tmp1409
	  lw $t0, -5608($fp)	# fill _tmp1400 to $t0 from $fp-5608
	  lw $t1, -5644($fp)	# fill _tmp1409 to $t1 from $fp-5644
	  mul $t2, $t0, $t1	
	  sw $t2, -5648($fp)	# spill _tmp1410 from $t2 to $fp-5648
	# _tmp1411 = _tmp1399 + _tmp1410
	  lw $t0, -5604($fp)	# fill _tmp1399 to $t0 from $fp-5604
	  lw $t1, -5648($fp)	# fill _tmp1410 to $t1 from $fp-5648
	  add $t2, $t0, $t1	
	  sw $t2, -5652($fp)	# spill _tmp1411 from $t2 to $fp-5652
	# _tmp1412 = _tmp1411 + _tmp1409
	  lw $t0, -5652($fp)	# fill _tmp1411 to $t0 from $fp-5652
	  lw $t1, -5644($fp)	# fill _tmp1409 to $t1 from $fp-5644
	  add $t2, $t0, $t1	
	  sw $t2, -5656($fp)	# spill _tmp1412 from $t2 to $fp-5656
	# _tmp1413 = *(_tmp1412)
	  lw $t0, -5656($fp)	# fill _tmp1412 to $t0 from $fp-5656
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -5660($fp)	# spill _tmp1413 from $t2 to $fp-5660
	# _tmp1414 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -5664($fp)	# spill _tmp1414 from $t2 to $fp-5664
	# _tmp1415 = *(_tmp1413)
	  lw $t0, -5660($fp)	# fill _tmp1413 to $t0 from $fp-5660
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -5668($fp)	# spill _tmp1415 from $t2 to $fp-5668
	# _tmp1416 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -5672($fp)	# spill _tmp1416 from $t2 to $fp-5672
	# _tmp1417 = _tmp1414 < _tmp1416
	  lw $t0, -5664($fp)	# fill _tmp1414 to $t0 from $fp-5664
	  lw $t1, -5672($fp)	# fill _tmp1416 to $t1 from $fp-5672
	  slt $t2, $t0, $t1	
	  sw $t2, -5676($fp)	# spill _tmp1417 from $t2 to $fp-5676
	# _tmp1418 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -5680($fp)	# spill _tmp1418 from $t2 to $fp-5680
	# _tmp1419 = _tmp1415 - _tmp1418
	  lw $t0, -5668($fp)	# fill _tmp1415 to $t0 from $fp-5668
	  lw $t1, -5680($fp)	# fill _tmp1418 to $t1 from $fp-5680
	  sub $t2, $t0, $t1	
	  sw $t2, -5684($fp)	# spill _tmp1419 from $t2 to $fp-5684
	# _tmp1420 = _tmp1419 < _tmp1414
	  lw $t0, -5684($fp)	# fill _tmp1419 to $t0 from $fp-5684
	  lw $t1, -5664($fp)	# fill _tmp1414 to $t1 from $fp-5664
	  slt $t2, $t0, $t1	
	  sw $t2, -5688($fp)	# spill _tmp1420 from $t2 to $fp-5688
	# _tmp1421 = _tmp1417 || _tmp1420
	  lw $t0, -5676($fp)	# fill _tmp1417 to $t0 from $fp-5676
	  lw $t1, -5688($fp)	# fill _tmp1420 to $t1 from $fp-5688
	  or $t2, $t0, $t1	
	  sw $t2, -5692($fp)	# spill _tmp1421 from $t2 to $fp-5692
	# IfZ _tmp1421 Goto arrayAcc_222
	  lw $t0, -5692($fp)	# fill _tmp1421 to $t0 from $fp-5692
	  beqz $t0, arrayAcc_222	# branch if _tmp1421 is zero 
	# _tmp1422 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string162: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string162	# load label
	  sw $t2, -5696($fp)	# spill _tmp1422 from $t2 to $fp-5696
	# PushParam _tmp1422
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -5696($fp)	# fill _tmp1422 to $t0 from $fp-5696
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_222:
	# _tmp1423 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -5700($fp)	# spill _tmp1423 from $t2 to $fp-5700
	# _tmp1424 = _tmp1414 * _tmp1423
	  lw $t0, -5664($fp)	# fill _tmp1414 to $t0 from $fp-5664
	  lw $t1, -5700($fp)	# fill _tmp1423 to $t1 from $fp-5700
	  mul $t2, $t0, $t1	
	  sw $t2, -5704($fp)	# spill _tmp1424 from $t2 to $fp-5704
	# _tmp1425 = _tmp1413 + _tmp1424
	  lw $t0, -5660($fp)	# fill _tmp1413 to $t0 from $fp-5660
	  lw $t1, -5704($fp)	# fill _tmp1424 to $t1 from $fp-5704
	  add $t2, $t0, $t1	
	  sw $t2, -5708($fp)	# spill _tmp1425 from $t2 to $fp-5708
	# _tmp1426 = _tmp1425 + _tmp1423
	  lw $t0, -5708($fp)	# fill _tmp1425 to $t0 from $fp-5708
	  lw $t1, -5700($fp)	# fill _tmp1423 to $t1 from $fp-5700
	  add $t2, $t0, $t1	
	  sw $t2, -5712($fp)	# spill _tmp1426 from $t2 to $fp-5712
	# _tmp1427 = *(_tmp1426)
	  lw $t0, -5712($fp)	# fill _tmp1426 to $t0 from $fp-5712
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -5716($fp)	# spill _tmp1427 from $t2 to $fp-5716
	# _tmp1428 = *(_tmp1427)
	  lw $t0, -5716($fp)	# fill _tmp1427 to $t0 from $fp-5716
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -5720($fp)	# spill _tmp1428 from $t2 to $fp-5720
	# _tmp1429 = *(_tmp1428 + 20)
	  lw $t0, -5720($fp)	# fill _tmp1428 to $t0 from $fp-5720
	  lw $t2, 20($t0) 	# load with offset
	  sw $t2, -5724($fp)	# spill _tmp1429 from $t2 to $fp-5724
	# PushParam playerMark
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, 12($fp)	# fill playerMark to $t0 from $fp+12
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam _tmp1427
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -5716($fp)	# fill _tmp1427 to $t0 from $fp-5716
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp1430 = ACall _tmp1429
	  lw $t0, -5724($fp)	# fill _tmp1429 to $t0 from $fp-5724
	  jalr $t0            	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -5728($fp)	# spill _tmp1430 from $t2 to $fp-5728
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# _tmp1431 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -5732($fp)	# spill _tmp1431 from $t2 to $fp-5732
	# _tmp1432 = _tmp1430 == _tmp1431
	  lw $t0, -5728($fp)	# fill _tmp1430 to $t0 from $fp-5728
	  lw $t1, -5732($fp)	# fill _tmp1431 to $t1 from $fp-5732
	  seq $t2, $t0, $t1	
	  sw $t2, -5736($fp)	# spill _tmp1432 from $t2 to $fp-5736
	# _tmp1433 = _tmp1398 && _tmp1432
	  lw $t0, -5600($fp)	# fill _tmp1398 to $t0 from $fp-5600
	  lw $t1, -5736($fp)	# fill _tmp1432 to $t1 from $fp-5736
	  and $t2, $t0, $t1	
	  sw $t2, -5740($fp)	# spill _tmp1433 from $t2 to $fp-5740
	# IfZ _tmp1433 Goto else_223
	  lw $t0, -5740($fp)	# fill _tmp1433 to $t0 from $fp-5740
	  beqz $t0, else_223	# branch if _tmp1433 is zero 
	# _tmp1434 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -5744($fp)	# spill _tmp1434 from $t2 to $fp-5744
	# row = _tmp1434
	  lw $t2, -5744($fp)	# fill _tmp1434 to $t2 from $fp-5744
	  sw $t2, -8($fp)	# spill row from $t2 to $fp-8
	# _tmp1435 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -5748($fp)	# spill _tmp1435 from $t2 to $fp-5748
	# column = _tmp1435
	  lw $t2, -5748($fp)	# fill _tmp1435 to $t2 from $fp-5748
	  sw $t2, -12($fp)	# spill column from $t2 to $fp-12
	# Goto endif_224
	  b endif_224		# unconditional branch
  else_223:
	# _tmp1436 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -5752($fp)	# spill _tmp1436 from $t2 to $fp-5752
	# _tmp1437 = 2
	  li $t2, 2		# load constant value 2 into $t2
	  sw $t2, -5756($fp)	# spill _tmp1437 from $t2 to $fp-5756
	# _tmp1438 = *(_tmp1436)
	  lw $t0, -5752($fp)	# fill _tmp1436 to $t0 from $fp-5752
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -5760($fp)	# spill _tmp1438 from $t2 to $fp-5760
	# _tmp1439 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -5764($fp)	# spill _tmp1439 from $t2 to $fp-5764
	# _tmp1440 = _tmp1437 < _tmp1439
	  lw $t0, -5756($fp)	# fill _tmp1437 to $t0 from $fp-5756
	  lw $t1, -5764($fp)	# fill _tmp1439 to $t1 from $fp-5764
	  slt $t2, $t0, $t1	
	  sw $t2, -5768($fp)	# spill _tmp1440 from $t2 to $fp-5768
	# _tmp1441 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -5772($fp)	# spill _tmp1441 from $t2 to $fp-5772
	# _tmp1442 = _tmp1438 - _tmp1441
	  lw $t0, -5760($fp)	# fill _tmp1438 to $t0 from $fp-5760
	  lw $t1, -5772($fp)	# fill _tmp1441 to $t1 from $fp-5772
	  sub $t2, $t0, $t1	
	  sw $t2, -5776($fp)	# spill _tmp1442 from $t2 to $fp-5776
	# _tmp1443 = _tmp1442 < _tmp1437
	  lw $t0, -5776($fp)	# fill _tmp1442 to $t0 from $fp-5776
	  lw $t1, -5756($fp)	# fill _tmp1437 to $t1 from $fp-5756
	  slt $t2, $t0, $t1	
	  sw $t2, -5780($fp)	# spill _tmp1443 from $t2 to $fp-5780
	# _tmp1444 = _tmp1440 || _tmp1443
	  lw $t0, -5768($fp)	# fill _tmp1440 to $t0 from $fp-5768
	  lw $t1, -5780($fp)	# fill _tmp1443 to $t1 from $fp-5780
	  or $t2, $t0, $t1	
	  sw $t2, -5784($fp)	# spill _tmp1444 from $t2 to $fp-5784
	# IfZ _tmp1444 Goto arrayAcc_225
	  lw $t0, -5784($fp)	# fill _tmp1444 to $t0 from $fp-5784
	  beqz $t0, arrayAcc_225	# branch if _tmp1444 is zero 
	# _tmp1445 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string163: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string163	# load label
	  sw $t2, -5788($fp)	# spill _tmp1445 from $t2 to $fp-5788
	# PushParam _tmp1445
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -5788($fp)	# fill _tmp1445 to $t0 from $fp-5788
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_225:
	# _tmp1446 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -5792($fp)	# spill _tmp1446 from $t2 to $fp-5792
	# _tmp1447 = _tmp1437 * _tmp1446
	  lw $t0, -5756($fp)	# fill _tmp1437 to $t0 from $fp-5756
	  lw $t1, -5792($fp)	# fill _tmp1446 to $t1 from $fp-5792
	  mul $t2, $t0, $t1	
	  sw $t2, -5796($fp)	# spill _tmp1447 from $t2 to $fp-5796
	# _tmp1448 = _tmp1436 + _tmp1447
	  lw $t0, -5752($fp)	# fill _tmp1436 to $t0 from $fp-5752
	  lw $t1, -5796($fp)	# fill _tmp1447 to $t1 from $fp-5796
	  add $t2, $t0, $t1	
	  sw $t2, -5800($fp)	# spill _tmp1448 from $t2 to $fp-5800
	# _tmp1449 = _tmp1448 + _tmp1446
	  lw $t0, -5800($fp)	# fill _tmp1448 to $t0 from $fp-5800
	  lw $t1, -5792($fp)	# fill _tmp1446 to $t1 from $fp-5792
	  add $t2, $t0, $t1	
	  sw $t2, -5804($fp)	# spill _tmp1449 from $t2 to $fp-5804
	# _tmp1450 = *(_tmp1449)
	  lw $t0, -5804($fp)	# fill _tmp1449 to $t0 from $fp-5804
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -5808($fp)	# spill _tmp1450 from $t2 to $fp-5808
	# _tmp1451 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -5812($fp)	# spill _tmp1451 from $t2 to $fp-5812
	# _tmp1452 = *(_tmp1450)
	  lw $t0, -5808($fp)	# fill _tmp1450 to $t0 from $fp-5808
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -5816($fp)	# spill _tmp1452 from $t2 to $fp-5816
	# _tmp1453 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -5820($fp)	# spill _tmp1453 from $t2 to $fp-5820
	# _tmp1454 = _tmp1451 < _tmp1453
	  lw $t0, -5812($fp)	# fill _tmp1451 to $t0 from $fp-5812
	  lw $t1, -5820($fp)	# fill _tmp1453 to $t1 from $fp-5820
	  slt $t2, $t0, $t1	
	  sw $t2, -5824($fp)	# spill _tmp1454 from $t2 to $fp-5824
	# _tmp1455 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -5828($fp)	# spill _tmp1455 from $t2 to $fp-5828
	# _tmp1456 = _tmp1452 - _tmp1455
	  lw $t0, -5816($fp)	# fill _tmp1452 to $t0 from $fp-5816
	  lw $t1, -5828($fp)	# fill _tmp1455 to $t1 from $fp-5828
	  sub $t2, $t0, $t1	
	  sw $t2, -5832($fp)	# spill _tmp1456 from $t2 to $fp-5832
	# _tmp1457 = _tmp1456 < _tmp1451
	  lw $t0, -5832($fp)	# fill _tmp1456 to $t0 from $fp-5832
	  lw $t1, -5812($fp)	# fill _tmp1451 to $t1 from $fp-5812
	  slt $t2, $t0, $t1	
	  sw $t2, -5836($fp)	# spill _tmp1457 from $t2 to $fp-5836
	# _tmp1458 = _tmp1454 || _tmp1457
	  lw $t0, -5824($fp)	# fill _tmp1454 to $t0 from $fp-5824
	  lw $t1, -5836($fp)	# fill _tmp1457 to $t1 from $fp-5836
	  or $t2, $t0, $t1	
	  sw $t2, -5840($fp)	# spill _tmp1458 from $t2 to $fp-5840
	# IfZ _tmp1458 Goto arrayAcc_226
	  lw $t0, -5840($fp)	# fill _tmp1458 to $t0 from $fp-5840
	  beqz $t0, arrayAcc_226	# branch if _tmp1458 is zero 
	# _tmp1459 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string164: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string164	# load label
	  sw $t2, -5844($fp)	# spill _tmp1459 from $t2 to $fp-5844
	# PushParam _tmp1459
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -5844($fp)	# fill _tmp1459 to $t0 from $fp-5844
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_226:
	# _tmp1460 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -5848($fp)	# spill _tmp1460 from $t2 to $fp-5848
	# _tmp1461 = _tmp1451 * _tmp1460
	  lw $t0, -5812($fp)	# fill _tmp1451 to $t0 from $fp-5812
	  lw $t1, -5848($fp)	# fill _tmp1460 to $t1 from $fp-5848
	  mul $t2, $t0, $t1	
	  sw $t2, -5852($fp)	# spill _tmp1461 from $t2 to $fp-5852
	# _tmp1462 = _tmp1450 + _tmp1461
	  lw $t0, -5808($fp)	# fill _tmp1450 to $t0 from $fp-5808
	  lw $t1, -5852($fp)	# fill _tmp1461 to $t1 from $fp-5852
	  add $t2, $t0, $t1	
	  sw $t2, -5856($fp)	# spill _tmp1462 from $t2 to $fp-5856
	# _tmp1463 = _tmp1462 + _tmp1460
	  lw $t0, -5856($fp)	# fill _tmp1462 to $t0 from $fp-5856
	  lw $t1, -5848($fp)	# fill _tmp1460 to $t1 from $fp-5848
	  add $t2, $t0, $t1	
	  sw $t2, -5860($fp)	# spill _tmp1463 from $t2 to $fp-5860
	# _tmp1464 = *(_tmp1463)
	  lw $t0, -5860($fp)	# fill _tmp1463 to $t0 from $fp-5860
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -5864($fp)	# spill _tmp1464 from $t2 to $fp-5864
	# _tmp1465 = *(_tmp1464)
	  lw $t0, -5864($fp)	# fill _tmp1464 to $t0 from $fp-5864
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -5868($fp)	# spill _tmp1465 from $t2 to $fp-5868
	# _tmp1466 = *(_tmp1465 + 20)
	  lw $t0, -5868($fp)	# fill _tmp1465 to $t0 from $fp-5868
	  lw $t2, 20($t0) 	# load with offset
	  sw $t2, -5872($fp)	# spill _tmp1466 from $t2 to $fp-5872
	# PushParam enemyMark
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, 8($fp)	# fill enemyMark to $t0 from $fp+8
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam _tmp1464
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -5864($fp)	# fill _tmp1464 to $t0 from $fp-5864
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp1467 = ACall _tmp1466
	  lw $t0, -5872($fp)	# fill _tmp1466 to $t0 from $fp-5872
	  jalr $t0            	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -5876($fp)	# spill _tmp1467 from $t2 to $fp-5876
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# _tmp1468 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -5880($fp)	# spill _tmp1468 from $t2 to $fp-5880
	# _tmp1469 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -5884($fp)	# spill _tmp1469 from $t2 to $fp-5884
	# _tmp1470 = *(_tmp1468)
	  lw $t0, -5880($fp)	# fill _tmp1468 to $t0 from $fp-5880
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -5888($fp)	# spill _tmp1470 from $t2 to $fp-5888
	# _tmp1471 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -5892($fp)	# spill _tmp1471 from $t2 to $fp-5892
	# _tmp1472 = _tmp1469 < _tmp1471
	  lw $t0, -5884($fp)	# fill _tmp1469 to $t0 from $fp-5884
	  lw $t1, -5892($fp)	# fill _tmp1471 to $t1 from $fp-5892
	  slt $t2, $t0, $t1	
	  sw $t2, -5896($fp)	# spill _tmp1472 from $t2 to $fp-5896
	# _tmp1473 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -5900($fp)	# spill _tmp1473 from $t2 to $fp-5900
	# _tmp1474 = _tmp1470 - _tmp1473
	  lw $t0, -5888($fp)	# fill _tmp1470 to $t0 from $fp-5888
	  lw $t1, -5900($fp)	# fill _tmp1473 to $t1 from $fp-5900
	  sub $t2, $t0, $t1	
	  sw $t2, -5904($fp)	# spill _tmp1474 from $t2 to $fp-5904
	# _tmp1475 = _tmp1474 < _tmp1469
	  lw $t0, -5904($fp)	# fill _tmp1474 to $t0 from $fp-5904
	  lw $t1, -5884($fp)	# fill _tmp1469 to $t1 from $fp-5884
	  slt $t2, $t0, $t1	
	  sw $t2, -5908($fp)	# spill _tmp1475 from $t2 to $fp-5908
	# _tmp1476 = _tmp1472 || _tmp1475
	  lw $t0, -5896($fp)	# fill _tmp1472 to $t0 from $fp-5896
	  lw $t1, -5908($fp)	# fill _tmp1475 to $t1 from $fp-5908
	  or $t2, $t0, $t1	
	  sw $t2, -5912($fp)	# spill _tmp1476 from $t2 to $fp-5912
	# IfZ _tmp1476 Goto arrayAcc_227
	  lw $t0, -5912($fp)	# fill _tmp1476 to $t0 from $fp-5912
	  beqz $t0, arrayAcc_227	# branch if _tmp1476 is zero 
	# _tmp1477 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string165: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string165	# load label
	  sw $t2, -5916($fp)	# spill _tmp1477 from $t2 to $fp-5916
	# PushParam _tmp1477
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -5916($fp)	# fill _tmp1477 to $t0 from $fp-5916
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_227:
	# _tmp1478 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -5920($fp)	# spill _tmp1478 from $t2 to $fp-5920
	# _tmp1479 = _tmp1469 * _tmp1478
	  lw $t0, -5884($fp)	# fill _tmp1469 to $t0 from $fp-5884
	  lw $t1, -5920($fp)	# fill _tmp1478 to $t1 from $fp-5920
	  mul $t2, $t0, $t1	
	  sw $t2, -5924($fp)	# spill _tmp1479 from $t2 to $fp-5924
	# _tmp1480 = _tmp1468 + _tmp1479
	  lw $t0, -5880($fp)	# fill _tmp1468 to $t0 from $fp-5880
	  lw $t1, -5924($fp)	# fill _tmp1479 to $t1 from $fp-5924
	  add $t2, $t0, $t1	
	  sw $t2, -5928($fp)	# spill _tmp1480 from $t2 to $fp-5928
	# _tmp1481 = _tmp1480 + _tmp1478
	  lw $t0, -5928($fp)	# fill _tmp1480 to $t0 from $fp-5928
	  lw $t1, -5920($fp)	# fill _tmp1478 to $t1 from $fp-5920
	  add $t2, $t0, $t1	
	  sw $t2, -5932($fp)	# spill _tmp1481 from $t2 to $fp-5932
	# _tmp1482 = *(_tmp1481)
	  lw $t0, -5932($fp)	# fill _tmp1481 to $t0 from $fp-5932
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -5936($fp)	# spill _tmp1482 from $t2 to $fp-5936
	# _tmp1483 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -5940($fp)	# spill _tmp1483 from $t2 to $fp-5940
	# _tmp1484 = *(_tmp1482)
	  lw $t0, -5936($fp)	# fill _tmp1482 to $t0 from $fp-5936
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -5944($fp)	# spill _tmp1484 from $t2 to $fp-5944
	# _tmp1485 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -5948($fp)	# spill _tmp1485 from $t2 to $fp-5948
	# _tmp1486 = _tmp1483 < _tmp1485
	  lw $t0, -5940($fp)	# fill _tmp1483 to $t0 from $fp-5940
	  lw $t1, -5948($fp)	# fill _tmp1485 to $t1 from $fp-5948
	  slt $t2, $t0, $t1	
	  sw $t2, -5952($fp)	# spill _tmp1486 from $t2 to $fp-5952
	# _tmp1487 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -5956($fp)	# spill _tmp1487 from $t2 to $fp-5956
	# _tmp1488 = _tmp1484 - _tmp1487
	  lw $t0, -5944($fp)	# fill _tmp1484 to $t0 from $fp-5944
	  lw $t1, -5956($fp)	# fill _tmp1487 to $t1 from $fp-5956
	  sub $t2, $t0, $t1	
	  sw $t2, -5960($fp)	# spill _tmp1488 from $t2 to $fp-5960
	# _tmp1489 = _tmp1488 < _tmp1483
	  lw $t0, -5960($fp)	# fill _tmp1488 to $t0 from $fp-5960
	  lw $t1, -5940($fp)	# fill _tmp1483 to $t1 from $fp-5940
	  slt $t2, $t0, $t1	
	  sw $t2, -5964($fp)	# spill _tmp1489 from $t2 to $fp-5964
	# _tmp1490 = _tmp1486 || _tmp1489
	  lw $t0, -5952($fp)	# fill _tmp1486 to $t0 from $fp-5952
	  lw $t1, -5964($fp)	# fill _tmp1489 to $t1 from $fp-5964
	  or $t2, $t0, $t1	
	  sw $t2, -5968($fp)	# spill _tmp1490 from $t2 to $fp-5968
	# IfZ _tmp1490 Goto arrayAcc_228
	  lw $t0, -5968($fp)	# fill _tmp1490 to $t0 from $fp-5968
	  beqz $t0, arrayAcc_228	# branch if _tmp1490 is zero 
	# _tmp1491 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string166: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string166	# load label
	  sw $t2, -5972($fp)	# spill _tmp1491 from $t2 to $fp-5972
	# PushParam _tmp1491
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -5972($fp)	# fill _tmp1491 to $t0 from $fp-5972
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_228:
	# _tmp1492 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -5976($fp)	# spill _tmp1492 from $t2 to $fp-5976
	# _tmp1493 = _tmp1483 * _tmp1492
	  lw $t0, -5940($fp)	# fill _tmp1483 to $t0 from $fp-5940
	  lw $t1, -5976($fp)	# fill _tmp1492 to $t1 from $fp-5976
	  mul $t2, $t0, $t1	
	  sw $t2, -5980($fp)	# spill _tmp1493 from $t2 to $fp-5980
	# _tmp1494 = _tmp1482 + _tmp1493
	  lw $t0, -5936($fp)	# fill _tmp1482 to $t0 from $fp-5936
	  lw $t1, -5980($fp)	# fill _tmp1493 to $t1 from $fp-5980
	  add $t2, $t0, $t1	
	  sw $t2, -5984($fp)	# spill _tmp1494 from $t2 to $fp-5984
	# _tmp1495 = _tmp1494 + _tmp1492
	  lw $t0, -5984($fp)	# fill _tmp1494 to $t0 from $fp-5984
	  lw $t1, -5976($fp)	# fill _tmp1492 to $t1 from $fp-5976
	  add $t2, $t0, $t1	
	  sw $t2, -5988($fp)	# spill _tmp1495 from $t2 to $fp-5988
	# _tmp1496 = *(_tmp1495)
	  lw $t0, -5988($fp)	# fill _tmp1495 to $t0 from $fp-5988
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -5992($fp)	# spill _tmp1496 from $t2 to $fp-5992
	# _tmp1497 = *(_tmp1496)
	  lw $t0, -5992($fp)	# fill _tmp1496 to $t0 from $fp-5992
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -5996($fp)	# spill _tmp1497 from $t2 to $fp-5996
	# _tmp1498 = *(_tmp1497 + 20)
	  lw $t0, -5996($fp)	# fill _tmp1497 to $t0 from $fp-5996
	  lw $t2, 20($t0) 	# load with offset
	  sw $t2, -6000($fp)	# spill _tmp1498 from $t2 to $fp-6000
	# PushParam enemyMark
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, 8($fp)	# fill enemyMark to $t0 from $fp+8
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam _tmp1496
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -5992($fp)	# fill _tmp1496 to $t0 from $fp-5992
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp1499 = ACall _tmp1498
	  lw $t0, -6000($fp)	# fill _tmp1498 to $t0 from $fp-6000
	  jalr $t0            	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -6004($fp)	# spill _tmp1499 from $t2 to $fp-6004
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# _tmp1500 = _tmp1467 && _tmp1499
	  lw $t0, -5876($fp)	# fill _tmp1467 to $t0 from $fp-5876
	  lw $t1, -6004($fp)	# fill _tmp1499 to $t1 from $fp-6004
	  and $t2, $t0, $t1	
	  sw $t2, -6008($fp)	# spill _tmp1500 from $t2 to $fp-6008
	# _tmp1501 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -6012($fp)	# spill _tmp1501 from $t2 to $fp-6012
	# _tmp1502 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -6016($fp)	# spill _tmp1502 from $t2 to $fp-6016
	# _tmp1503 = *(_tmp1501)
	  lw $t0, -6012($fp)	# fill _tmp1501 to $t0 from $fp-6012
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -6020($fp)	# spill _tmp1503 from $t2 to $fp-6020
	# _tmp1504 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -6024($fp)	# spill _tmp1504 from $t2 to $fp-6024
	# _tmp1505 = _tmp1502 < _tmp1504
	  lw $t0, -6016($fp)	# fill _tmp1502 to $t0 from $fp-6016
	  lw $t1, -6024($fp)	# fill _tmp1504 to $t1 from $fp-6024
	  slt $t2, $t0, $t1	
	  sw $t2, -6028($fp)	# spill _tmp1505 from $t2 to $fp-6028
	# _tmp1506 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -6032($fp)	# spill _tmp1506 from $t2 to $fp-6032
	# _tmp1507 = _tmp1503 - _tmp1506
	  lw $t0, -6020($fp)	# fill _tmp1503 to $t0 from $fp-6020
	  lw $t1, -6032($fp)	# fill _tmp1506 to $t1 from $fp-6032
	  sub $t2, $t0, $t1	
	  sw $t2, -6036($fp)	# spill _tmp1507 from $t2 to $fp-6036
	# _tmp1508 = _tmp1507 < _tmp1502
	  lw $t0, -6036($fp)	# fill _tmp1507 to $t0 from $fp-6036
	  lw $t1, -6016($fp)	# fill _tmp1502 to $t1 from $fp-6016
	  slt $t2, $t0, $t1	
	  sw $t2, -6040($fp)	# spill _tmp1508 from $t2 to $fp-6040
	# _tmp1509 = _tmp1505 || _tmp1508
	  lw $t0, -6028($fp)	# fill _tmp1505 to $t0 from $fp-6028
	  lw $t1, -6040($fp)	# fill _tmp1508 to $t1 from $fp-6040
	  or $t2, $t0, $t1	
	  sw $t2, -6044($fp)	# spill _tmp1509 from $t2 to $fp-6044
	# IfZ _tmp1509 Goto arrayAcc_229
	  lw $t0, -6044($fp)	# fill _tmp1509 to $t0 from $fp-6044
	  beqz $t0, arrayAcc_229	# branch if _tmp1509 is zero 
	# _tmp1510 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string167: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string167	# load label
	  sw $t2, -6048($fp)	# spill _tmp1510 from $t2 to $fp-6048
	# PushParam _tmp1510
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -6048($fp)	# fill _tmp1510 to $t0 from $fp-6048
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_229:
	# _tmp1511 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -6052($fp)	# spill _tmp1511 from $t2 to $fp-6052
	# _tmp1512 = _tmp1502 * _tmp1511
	  lw $t0, -6016($fp)	# fill _tmp1502 to $t0 from $fp-6016
	  lw $t1, -6052($fp)	# fill _tmp1511 to $t1 from $fp-6052
	  mul $t2, $t0, $t1	
	  sw $t2, -6056($fp)	# spill _tmp1512 from $t2 to $fp-6056
	# _tmp1513 = _tmp1501 + _tmp1512
	  lw $t0, -6012($fp)	# fill _tmp1501 to $t0 from $fp-6012
	  lw $t1, -6056($fp)	# fill _tmp1512 to $t1 from $fp-6056
	  add $t2, $t0, $t1	
	  sw $t2, -6060($fp)	# spill _tmp1513 from $t2 to $fp-6060
	# _tmp1514 = _tmp1513 + _tmp1511
	  lw $t0, -6060($fp)	# fill _tmp1513 to $t0 from $fp-6060
	  lw $t1, -6052($fp)	# fill _tmp1511 to $t1 from $fp-6052
	  add $t2, $t0, $t1	
	  sw $t2, -6064($fp)	# spill _tmp1514 from $t2 to $fp-6064
	# _tmp1515 = *(_tmp1514)
	  lw $t0, -6064($fp)	# fill _tmp1514 to $t0 from $fp-6064
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -6068($fp)	# spill _tmp1515 from $t2 to $fp-6068
	# _tmp1516 = 2
	  li $t2, 2		# load constant value 2 into $t2
	  sw $t2, -6072($fp)	# spill _tmp1516 from $t2 to $fp-6072
	# _tmp1517 = *(_tmp1515)
	  lw $t0, -6068($fp)	# fill _tmp1515 to $t0 from $fp-6068
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -6076($fp)	# spill _tmp1517 from $t2 to $fp-6076
	# _tmp1518 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -6080($fp)	# spill _tmp1518 from $t2 to $fp-6080
	# _tmp1519 = _tmp1516 < _tmp1518
	  lw $t0, -6072($fp)	# fill _tmp1516 to $t0 from $fp-6072
	  lw $t1, -6080($fp)	# fill _tmp1518 to $t1 from $fp-6080
	  slt $t2, $t0, $t1	
	  sw $t2, -6084($fp)	# spill _tmp1519 from $t2 to $fp-6084
	# _tmp1520 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -6088($fp)	# spill _tmp1520 from $t2 to $fp-6088
	# _tmp1521 = _tmp1517 - _tmp1520
	  lw $t0, -6076($fp)	# fill _tmp1517 to $t0 from $fp-6076
	  lw $t1, -6088($fp)	# fill _tmp1520 to $t1 from $fp-6088
	  sub $t2, $t0, $t1	
	  sw $t2, -6092($fp)	# spill _tmp1521 from $t2 to $fp-6092
	# _tmp1522 = _tmp1521 < _tmp1516
	  lw $t0, -6092($fp)	# fill _tmp1521 to $t0 from $fp-6092
	  lw $t1, -6072($fp)	# fill _tmp1516 to $t1 from $fp-6072
	  slt $t2, $t0, $t1	
	  sw $t2, -6096($fp)	# spill _tmp1522 from $t2 to $fp-6096
	# _tmp1523 = _tmp1519 || _tmp1522
	  lw $t0, -6084($fp)	# fill _tmp1519 to $t0 from $fp-6084
	  lw $t1, -6096($fp)	# fill _tmp1522 to $t1 from $fp-6096
	  or $t2, $t0, $t1	
	  sw $t2, -6100($fp)	# spill _tmp1523 from $t2 to $fp-6100
	# IfZ _tmp1523 Goto arrayAcc_230
	  lw $t0, -6100($fp)	# fill _tmp1523 to $t0 from $fp-6100
	  beqz $t0, arrayAcc_230	# branch if _tmp1523 is zero 
	# _tmp1524 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string168: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string168	# load label
	  sw $t2, -6104($fp)	# spill _tmp1524 from $t2 to $fp-6104
	# PushParam _tmp1524
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -6104($fp)	# fill _tmp1524 to $t0 from $fp-6104
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_230:
	# _tmp1525 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -6108($fp)	# spill _tmp1525 from $t2 to $fp-6108
	# _tmp1526 = _tmp1516 * _tmp1525
	  lw $t0, -6072($fp)	# fill _tmp1516 to $t0 from $fp-6072
	  lw $t1, -6108($fp)	# fill _tmp1525 to $t1 from $fp-6108
	  mul $t2, $t0, $t1	
	  sw $t2, -6112($fp)	# spill _tmp1526 from $t2 to $fp-6112
	# _tmp1527 = _tmp1515 + _tmp1526
	  lw $t0, -6068($fp)	# fill _tmp1515 to $t0 from $fp-6068
	  lw $t1, -6112($fp)	# fill _tmp1526 to $t1 from $fp-6112
	  add $t2, $t0, $t1	
	  sw $t2, -6116($fp)	# spill _tmp1527 from $t2 to $fp-6116
	# _tmp1528 = _tmp1527 + _tmp1525
	  lw $t0, -6116($fp)	# fill _tmp1527 to $t0 from $fp-6116
	  lw $t1, -6108($fp)	# fill _tmp1525 to $t1 from $fp-6108
	  add $t2, $t0, $t1	
	  sw $t2, -6120($fp)	# spill _tmp1528 from $t2 to $fp-6120
	# _tmp1529 = *(_tmp1528)
	  lw $t0, -6120($fp)	# fill _tmp1528 to $t0 from $fp-6120
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -6124($fp)	# spill _tmp1529 from $t2 to $fp-6124
	# _tmp1530 = *(_tmp1529)
	  lw $t0, -6124($fp)	# fill _tmp1529 to $t0 from $fp-6124
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -6128($fp)	# spill _tmp1530 from $t2 to $fp-6128
	# _tmp1531 = *(_tmp1530 + 20)
	  lw $t0, -6128($fp)	# fill _tmp1530 to $t0 from $fp-6128
	  lw $t2, 20($t0) 	# load with offset
	  sw $t2, -6132($fp)	# spill _tmp1531 from $t2 to $fp-6132
	# PushParam playerMark
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, 12($fp)	# fill playerMark to $t0 from $fp+12
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam _tmp1529
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -6124($fp)	# fill _tmp1529 to $t0 from $fp-6124
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp1532 = ACall _tmp1531
	  lw $t0, -6132($fp)	# fill _tmp1531 to $t0 from $fp-6132
	  jalr $t0            	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -6136($fp)	# spill _tmp1532 from $t2 to $fp-6136
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# _tmp1533 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -6140($fp)	# spill _tmp1533 from $t2 to $fp-6140
	# _tmp1534 = _tmp1532 == _tmp1533
	  lw $t0, -6136($fp)	# fill _tmp1532 to $t0 from $fp-6136
	  lw $t1, -6140($fp)	# fill _tmp1533 to $t1 from $fp-6140
	  seq $t2, $t0, $t1	
	  sw $t2, -6144($fp)	# spill _tmp1534 from $t2 to $fp-6144
	# _tmp1535 = _tmp1500 && _tmp1534
	  lw $t0, -6008($fp)	# fill _tmp1500 to $t0 from $fp-6008
	  lw $t1, -6144($fp)	# fill _tmp1534 to $t1 from $fp-6144
	  and $t2, $t0, $t1	
	  sw $t2, -6148($fp)	# spill _tmp1535 from $t2 to $fp-6148
	# IfZ _tmp1535 Goto else_231
	  lw $t0, -6148($fp)	# fill _tmp1535 to $t0 from $fp-6148
	  beqz $t0, else_231	# branch if _tmp1535 is zero 
	# _tmp1536 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -6152($fp)	# spill _tmp1536 from $t2 to $fp-6152
	# row = _tmp1536
	  lw $t2, -6152($fp)	# fill _tmp1536 to $t2 from $fp-6152
	  sw $t2, -8($fp)	# spill row from $t2 to $fp-8
	# _tmp1537 = 2
	  li $t2, 2		# load constant value 2 into $t2
	  sw $t2, -6156($fp)	# spill _tmp1537 from $t2 to $fp-6156
	# column = _tmp1537
	  lw $t2, -6156($fp)	# fill _tmp1537 to $t2 from $fp-6156
	  sw $t2, -12($fp)	# spill column from $t2 to $fp-12
	# Goto endif_232
	  b endif_232		# unconditional branch
  else_231:
	# _tmp1538 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -6160($fp)	# spill _tmp1538 from $t2 to $fp-6160
	# _tmp1539 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -6164($fp)	# spill _tmp1539 from $t2 to $fp-6164
	# _tmp1540 = *(_tmp1538)
	  lw $t0, -6160($fp)	# fill _tmp1538 to $t0 from $fp-6160
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -6168($fp)	# spill _tmp1540 from $t2 to $fp-6168
	# _tmp1541 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -6172($fp)	# spill _tmp1541 from $t2 to $fp-6172
	# _tmp1542 = _tmp1539 < _tmp1541
	  lw $t0, -6164($fp)	# fill _tmp1539 to $t0 from $fp-6164
	  lw $t1, -6172($fp)	# fill _tmp1541 to $t1 from $fp-6172
	  slt $t2, $t0, $t1	
	  sw $t2, -6176($fp)	# spill _tmp1542 from $t2 to $fp-6176
	# _tmp1543 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -6180($fp)	# spill _tmp1543 from $t2 to $fp-6180
	# _tmp1544 = _tmp1540 - _tmp1543
	  lw $t0, -6168($fp)	# fill _tmp1540 to $t0 from $fp-6168
	  lw $t1, -6180($fp)	# fill _tmp1543 to $t1 from $fp-6180
	  sub $t2, $t0, $t1	
	  sw $t2, -6184($fp)	# spill _tmp1544 from $t2 to $fp-6184
	# _tmp1545 = _tmp1544 < _tmp1539
	  lw $t0, -6184($fp)	# fill _tmp1544 to $t0 from $fp-6184
	  lw $t1, -6164($fp)	# fill _tmp1539 to $t1 from $fp-6164
	  slt $t2, $t0, $t1	
	  sw $t2, -6188($fp)	# spill _tmp1545 from $t2 to $fp-6188
	# _tmp1546 = _tmp1542 || _tmp1545
	  lw $t0, -6176($fp)	# fill _tmp1542 to $t0 from $fp-6176
	  lw $t1, -6188($fp)	# fill _tmp1545 to $t1 from $fp-6188
	  or $t2, $t0, $t1	
	  sw $t2, -6192($fp)	# spill _tmp1546 from $t2 to $fp-6192
	# IfZ _tmp1546 Goto arrayAcc_233
	  lw $t0, -6192($fp)	# fill _tmp1546 to $t0 from $fp-6192
	  beqz $t0, arrayAcc_233	# branch if _tmp1546 is zero 
	# _tmp1547 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string169: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string169	# load label
	  sw $t2, -6196($fp)	# spill _tmp1547 from $t2 to $fp-6196
	# PushParam _tmp1547
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -6196($fp)	# fill _tmp1547 to $t0 from $fp-6196
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_233:
	# _tmp1548 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -6200($fp)	# spill _tmp1548 from $t2 to $fp-6200
	# _tmp1549 = _tmp1539 * _tmp1548
	  lw $t0, -6164($fp)	# fill _tmp1539 to $t0 from $fp-6164
	  lw $t1, -6200($fp)	# fill _tmp1548 to $t1 from $fp-6200
	  mul $t2, $t0, $t1	
	  sw $t2, -6204($fp)	# spill _tmp1549 from $t2 to $fp-6204
	# _tmp1550 = _tmp1538 + _tmp1549
	  lw $t0, -6160($fp)	# fill _tmp1538 to $t0 from $fp-6160
	  lw $t1, -6204($fp)	# fill _tmp1549 to $t1 from $fp-6204
	  add $t2, $t0, $t1	
	  sw $t2, -6208($fp)	# spill _tmp1550 from $t2 to $fp-6208
	# _tmp1551 = _tmp1550 + _tmp1548
	  lw $t0, -6208($fp)	# fill _tmp1550 to $t0 from $fp-6208
	  lw $t1, -6200($fp)	# fill _tmp1548 to $t1 from $fp-6200
	  add $t2, $t0, $t1	
	  sw $t2, -6212($fp)	# spill _tmp1551 from $t2 to $fp-6212
	# _tmp1552 = *(_tmp1551)
	  lw $t0, -6212($fp)	# fill _tmp1551 to $t0 from $fp-6212
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -6216($fp)	# spill _tmp1552 from $t2 to $fp-6216
	# _tmp1553 = 2
	  li $t2, 2		# load constant value 2 into $t2
	  sw $t2, -6220($fp)	# spill _tmp1553 from $t2 to $fp-6220
	# _tmp1554 = *(_tmp1552)
	  lw $t0, -6216($fp)	# fill _tmp1552 to $t0 from $fp-6216
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -6224($fp)	# spill _tmp1554 from $t2 to $fp-6224
	# _tmp1555 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -6228($fp)	# spill _tmp1555 from $t2 to $fp-6228
	# _tmp1556 = _tmp1553 < _tmp1555
	  lw $t0, -6220($fp)	# fill _tmp1553 to $t0 from $fp-6220
	  lw $t1, -6228($fp)	# fill _tmp1555 to $t1 from $fp-6228
	  slt $t2, $t0, $t1	
	  sw $t2, -6232($fp)	# spill _tmp1556 from $t2 to $fp-6232
	# _tmp1557 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -6236($fp)	# spill _tmp1557 from $t2 to $fp-6236
	# _tmp1558 = _tmp1554 - _tmp1557
	  lw $t0, -6224($fp)	# fill _tmp1554 to $t0 from $fp-6224
	  lw $t1, -6236($fp)	# fill _tmp1557 to $t1 from $fp-6236
	  sub $t2, $t0, $t1	
	  sw $t2, -6240($fp)	# spill _tmp1558 from $t2 to $fp-6240
	# _tmp1559 = _tmp1558 < _tmp1553
	  lw $t0, -6240($fp)	# fill _tmp1558 to $t0 from $fp-6240
	  lw $t1, -6220($fp)	# fill _tmp1553 to $t1 from $fp-6220
	  slt $t2, $t0, $t1	
	  sw $t2, -6244($fp)	# spill _tmp1559 from $t2 to $fp-6244
	# _tmp1560 = _tmp1556 || _tmp1559
	  lw $t0, -6232($fp)	# fill _tmp1556 to $t0 from $fp-6232
	  lw $t1, -6244($fp)	# fill _tmp1559 to $t1 from $fp-6244
	  or $t2, $t0, $t1	
	  sw $t2, -6248($fp)	# spill _tmp1560 from $t2 to $fp-6248
	# IfZ _tmp1560 Goto arrayAcc_234
	  lw $t0, -6248($fp)	# fill _tmp1560 to $t0 from $fp-6248
	  beqz $t0, arrayAcc_234	# branch if _tmp1560 is zero 
	# _tmp1561 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string170: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string170	# load label
	  sw $t2, -6252($fp)	# spill _tmp1561 from $t2 to $fp-6252
	# PushParam _tmp1561
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -6252($fp)	# fill _tmp1561 to $t0 from $fp-6252
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_234:
	# _tmp1562 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -6256($fp)	# spill _tmp1562 from $t2 to $fp-6256
	# _tmp1563 = _tmp1553 * _tmp1562
	  lw $t0, -6220($fp)	# fill _tmp1553 to $t0 from $fp-6220
	  lw $t1, -6256($fp)	# fill _tmp1562 to $t1 from $fp-6256
	  mul $t2, $t0, $t1	
	  sw $t2, -6260($fp)	# spill _tmp1563 from $t2 to $fp-6260
	# _tmp1564 = _tmp1552 + _tmp1563
	  lw $t0, -6216($fp)	# fill _tmp1552 to $t0 from $fp-6216
	  lw $t1, -6260($fp)	# fill _tmp1563 to $t1 from $fp-6260
	  add $t2, $t0, $t1	
	  sw $t2, -6264($fp)	# spill _tmp1564 from $t2 to $fp-6264
	# _tmp1565 = _tmp1564 + _tmp1562
	  lw $t0, -6264($fp)	# fill _tmp1564 to $t0 from $fp-6264
	  lw $t1, -6256($fp)	# fill _tmp1562 to $t1 from $fp-6256
	  add $t2, $t0, $t1	
	  sw $t2, -6268($fp)	# spill _tmp1565 from $t2 to $fp-6268
	# _tmp1566 = *(_tmp1565)
	  lw $t0, -6268($fp)	# fill _tmp1565 to $t0 from $fp-6268
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -6272($fp)	# spill _tmp1566 from $t2 to $fp-6272
	# _tmp1567 = *(_tmp1566)
	  lw $t0, -6272($fp)	# fill _tmp1566 to $t0 from $fp-6272
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -6276($fp)	# spill _tmp1567 from $t2 to $fp-6276
	# _tmp1568 = *(_tmp1567 + 20)
	  lw $t0, -6276($fp)	# fill _tmp1567 to $t0 from $fp-6276
	  lw $t2, 20($t0) 	# load with offset
	  sw $t2, -6280($fp)	# spill _tmp1568 from $t2 to $fp-6280
	# PushParam enemyMark
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, 8($fp)	# fill enemyMark to $t0 from $fp+8
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam _tmp1566
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -6272($fp)	# fill _tmp1566 to $t0 from $fp-6272
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp1569 = ACall _tmp1568
	  lw $t0, -6280($fp)	# fill _tmp1568 to $t0 from $fp-6280
	  jalr $t0            	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -6284($fp)	# spill _tmp1569 from $t2 to $fp-6284
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# _tmp1570 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -6288($fp)	# spill _tmp1570 from $t2 to $fp-6288
	# _tmp1571 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -6292($fp)	# spill _tmp1571 from $t2 to $fp-6292
	# _tmp1572 = *(_tmp1570)
	  lw $t0, -6288($fp)	# fill _tmp1570 to $t0 from $fp-6288
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -6296($fp)	# spill _tmp1572 from $t2 to $fp-6296
	# _tmp1573 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -6300($fp)	# spill _tmp1573 from $t2 to $fp-6300
	# _tmp1574 = _tmp1571 < _tmp1573
	  lw $t0, -6292($fp)	# fill _tmp1571 to $t0 from $fp-6292
	  lw $t1, -6300($fp)	# fill _tmp1573 to $t1 from $fp-6300
	  slt $t2, $t0, $t1	
	  sw $t2, -6304($fp)	# spill _tmp1574 from $t2 to $fp-6304
	# _tmp1575 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -6308($fp)	# spill _tmp1575 from $t2 to $fp-6308
	# _tmp1576 = _tmp1572 - _tmp1575
	  lw $t0, -6296($fp)	# fill _tmp1572 to $t0 from $fp-6296
	  lw $t1, -6308($fp)	# fill _tmp1575 to $t1 from $fp-6308
	  sub $t2, $t0, $t1	
	  sw $t2, -6312($fp)	# spill _tmp1576 from $t2 to $fp-6312
	# _tmp1577 = _tmp1576 < _tmp1571
	  lw $t0, -6312($fp)	# fill _tmp1576 to $t0 from $fp-6312
	  lw $t1, -6292($fp)	# fill _tmp1571 to $t1 from $fp-6292
	  slt $t2, $t0, $t1	
	  sw $t2, -6316($fp)	# spill _tmp1577 from $t2 to $fp-6316
	# _tmp1578 = _tmp1574 || _tmp1577
	  lw $t0, -6304($fp)	# fill _tmp1574 to $t0 from $fp-6304
	  lw $t1, -6316($fp)	# fill _tmp1577 to $t1 from $fp-6316
	  or $t2, $t0, $t1	
	  sw $t2, -6320($fp)	# spill _tmp1578 from $t2 to $fp-6320
	# IfZ _tmp1578 Goto arrayAcc_235
	  lw $t0, -6320($fp)	# fill _tmp1578 to $t0 from $fp-6320
	  beqz $t0, arrayAcc_235	# branch if _tmp1578 is zero 
	# _tmp1579 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string171: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string171	# load label
	  sw $t2, -6324($fp)	# spill _tmp1579 from $t2 to $fp-6324
	# PushParam _tmp1579
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -6324($fp)	# fill _tmp1579 to $t0 from $fp-6324
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_235:
	# _tmp1580 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -6328($fp)	# spill _tmp1580 from $t2 to $fp-6328
	# _tmp1581 = _tmp1571 * _tmp1580
	  lw $t0, -6292($fp)	# fill _tmp1571 to $t0 from $fp-6292
	  lw $t1, -6328($fp)	# fill _tmp1580 to $t1 from $fp-6328
	  mul $t2, $t0, $t1	
	  sw $t2, -6332($fp)	# spill _tmp1581 from $t2 to $fp-6332
	# _tmp1582 = _tmp1570 + _tmp1581
	  lw $t0, -6288($fp)	# fill _tmp1570 to $t0 from $fp-6288
	  lw $t1, -6332($fp)	# fill _tmp1581 to $t1 from $fp-6332
	  add $t2, $t0, $t1	
	  sw $t2, -6336($fp)	# spill _tmp1582 from $t2 to $fp-6336
	# _tmp1583 = _tmp1582 + _tmp1580
	  lw $t0, -6336($fp)	# fill _tmp1582 to $t0 from $fp-6336
	  lw $t1, -6328($fp)	# fill _tmp1580 to $t1 from $fp-6328
	  add $t2, $t0, $t1	
	  sw $t2, -6340($fp)	# spill _tmp1583 from $t2 to $fp-6340
	# _tmp1584 = *(_tmp1583)
	  lw $t0, -6340($fp)	# fill _tmp1583 to $t0 from $fp-6340
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -6344($fp)	# spill _tmp1584 from $t2 to $fp-6344
	# _tmp1585 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -6348($fp)	# spill _tmp1585 from $t2 to $fp-6348
	# _tmp1586 = *(_tmp1584)
	  lw $t0, -6344($fp)	# fill _tmp1584 to $t0 from $fp-6344
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -6352($fp)	# spill _tmp1586 from $t2 to $fp-6352
	# _tmp1587 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -6356($fp)	# spill _tmp1587 from $t2 to $fp-6356
	# _tmp1588 = _tmp1585 < _tmp1587
	  lw $t0, -6348($fp)	# fill _tmp1585 to $t0 from $fp-6348
	  lw $t1, -6356($fp)	# fill _tmp1587 to $t1 from $fp-6356
	  slt $t2, $t0, $t1	
	  sw $t2, -6360($fp)	# spill _tmp1588 from $t2 to $fp-6360
	# _tmp1589 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -6364($fp)	# spill _tmp1589 from $t2 to $fp-6364
	# _tmp1590 = _tmp1586 - _tmp1589
	  lw $t0, -6352($fp)	# fill _tmp1586 to $t0 from $fp-6352
	  lw $t1, -6364($fp)	# fill _tmp1589 to $t1 from $fp-6364
	  sub $t2, $t0, $t1	
	  sw $t2, -6368($fp)	# spill _tmp1590 from $t2 to $fp-6368
	# _tmp1591 = _tmp1590 < _tmp1585
	  lw $t0, -6368($fp)	# fill _tmp1590 to $t0 from $fp-6368
	  lw $t1, -6348($fp)	# fill _tmp1585 to $t1 from $fp-6348
	  slt $t2, $t0, $t1	
	  sw $t2, -6372($fp)	# spill _tmp1591 from $t2 to $fp-6372
	# _tmp1592 = _tmp1588 || _tmp1591
	  lw $t0, -6360($fp)	# fill _tmp1588 to $t0 from $fp-6360
	  lw $t1, -6372($fp)	# fill _tmp1591 to $t1 from $fp-6372
	  or $t2, $t0, $t1	
	  sw $t2, -6376($fp)	# spill _tmp1592 from $t2 to $fp-6376
	# IfZ _tmp1592 Goto arrayAcc_236
	  lw $t0, -6376($fp)	# fill _tmp1592 to $t0 from $fp-6376
	  beqz $t0, arrayAcc_236	# branch if _tmp1592 is zero 
	# _tmp1593 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string172: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string172	# load label
	  sw $t2, -6380($fp)	# spill _tmp1593 from $t2 to $fp-6380
	# PushParam _tmp1593
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -6380($fp)	# fill _tmp1593 to $t0 from $fp-6380
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_236:
	# _tmp1594 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -6384($fp)	# spill _tmp1594 from $t2 to $fp-6384
	# _tmp1595 = _tmp1585 * _tmp1594
	  lw $t0, -6348($fp)	# fill _tmp1585 to $t0 from $fp-6348
	  lw $t1, -6384($fp)	# fill _tmp1594 to $t1 from $fp-6384
	  mul $t2, $t0, $t1	
	  sw $t2, -6388($fp)	# spill _tmp1595 from $t2 to $fp-6388
	# _tmp1596 = _tmp1584 + _tmp1595
	  lw $t0, -6344($fp)	# fill _tmp1584 to $t0 from $fp-6344
	  lw $t1, -6388($fp)	# fill _tmp1595 to $t1 from $fp-6388
	  add $t2, $t0, $t1	
	  sw $t2, -6392($fp)	# spill _tmp1596 from $t2 to $fp-6392
	# _tmp1597 = _tmp1596 + _tmp1594
	  lw $t0, -6392($fp)	# fill _tmp1596 to $t0 from $fp-6392
	  lw $t1, -6384($fp)	# fill _tmp1594 to $t1 from $fp-6384
	  add $t2, $t0, $t1	
	  sw $t2, -6396($fp)	# spill _tmp1597 from $t2 to $fp-6396
	# _tmp1598 = *(_tmp1597)
	  lw $t0, -6396($fp)	# fill _tmp1597 to $t0 from $fp-6396
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -6400($fp)	# spill _tmp1598 from $t2 to $fp-6400
	# _tmp1599 = *(_tmp1598)
	  lw $t0, -6400($fp)	# fill _tmp1598 to $t0 from $fp-6400
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -6404($fp)	# spill _tmp1599 from $t2 to $fp-6404
	# _tmp1600 = *(_tmp1599 + 20)
	  lw $t0, -6404($fp)	# fill _tmp1599 to $t0 from $fp-6404
	  lw $t2, 20($t0) 	# load with offset
	  sw $t2, -6408($fp)	# spill _tmp1600 from $t2 to $fp-6408
	# PushParam enemyMark
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, 8($fp)	# fill enemyMark to $t0 from $fp+8
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam _tmp1598
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -6400($fp)	# fill _tmp1598 to $t0 from $fp-6400
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp1601 = ACall _tmp1600
	  lw $t0, -6408($fp)	# fill _tmp1600 to $t0 from $fp-6408
	  jalr $t0            	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -6412($fp)	# spill _tmp1601 from $t2 to $fp-6412
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# _tmp1602 = _tmp1569 && _tmp1601
	  lw $t0, -6284($fp)	# fill _tmp1569 to $t0 from $fp-6284
	  lw $t1, -6412($fp)	# fill _tmp1601 to $t1 from $fp-6412
	  and $t2, $t0, $t1	
	  sw $t2, -6416($fp)	# spill _tmp1602 from $t2 to $fp-6416
	# _tmp1603 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -6420($fp)	# spill _tmp1603 from $t2 to $fp-6420
	# _tmp1604 = 2
	  li $t2, 2		# load constant value 2 into $t2
	  sw $t2, -6424($fp)	# spill _tmp1604 from $t2 to $fp-6424
	# _tmp1605 = *(_tmp1603)
	  lw $t0, -6420($fp)	# fill _tmp1603 to $t0 from $fp-6420
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -6428($fp)	# spill _tmp1605 from $t2 to $fp-6428
	# _tmp1606 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -6432($fp)	# spill _tmp1606 from $t2 to $fp-6432
	# _tmp1607 = _tmp1604 < _tmp1606
	  lw $t0, -6424($fp)	# fill _tmp1604 to $t0 from $fp-6424
	  lw $t1, -6432($fp)	# fill _tmp1606 to $t1 from $fp-6432
	  slt $t2, $t0, $t1	
	  sw $t2, -6436($fp)	# spill _tmp1607 from $t2 to $fp-6436
	# _tmp1608 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -6440($fp)	# spill _tmp1608 from $t2 to $fp-6440
	# _tmp1609 = _tmp1605 - _tmp1608
	  lw $t0, -6428($fp)	# fill _tmp1605 to $t0 from $fp-6428
	  lw $t1, -6440($fp)	# fill _tmp1608 to $t1 from $fp-6440
	  sub $t2, $t0, $t1	
	  sw $t2, -6444($fp)	# spill _tmp1609 from $t2 to $fp-6444
	# _tmp1610 = _tmp1609 < _tmp1604
	  lw $t0, -6444($fp)	# fill _tmp1609 to $t0 from $fp-6444
	  lw $t1, -6424($fp)	# fill _tmp1604 to $t1 from $fp-6424
	  slt $t2, $t0, $t1	
	  sw $t2, -6448($fp)	# spill _tmp1610 from $t2 to $fp-6448
	# _tmp1611 = _tmp1607 || _tmp1610
	  lw $t0, -6436($fp)	# fill _tmp1607 to $t0 from $fp-6436
	  lw $t1, -6448($fp)	# fill _tmp1610 to $t1 from $fp-6448
	  or $t2, $t0, $t1	
	  sw $t2, -6452($fp)	# spill _tmp1611 from $t2 to $fp-6452
	# IfZ _tmp1611 Goto arrayAcc_237
	  lw $t0, -6452($fp)	# fill _tmp1611 to $t0 from $fp-6452
	  beqz $t0, arrayAcc_237	# branch if _tmp1611 is zero 
	# _tmp1612 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string173: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string173	# load label
	  sw $t2, -6456($fp)	# spill _tmp1612 from $t2 to $fp-6456
	# PushParam _tmp1612
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -6456($fp)	# fill _tmp1612 to $t0 from $fp-6456
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_237:
	# _tmp1613 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -6460($fp)	# spill _tmp1613 from $t2 to $fp-6460
	# _tmp1614 = _tmp1604 * _tmp1613
	  lw $t0, -6424($fp)	# fill _tmp1604 to $t0 from $fp-6424
	  lw $t1, -6460($fp)	# fill _tmp1613 to $t1 from $fp-6460
	  mul $t2, $t0, $t1	
	  sw $t2, -6464($fp)	# spill _tmp1614 from $t2 to $fp-6464
	# _tmp1615 = _tmp1603 + _tmp1614
	  lw $t0, -6420($fp)	# fill _tmp1603 to $t0 from $fp-6420
	  lw $t1, -6464($fp)	# fill _tmp1614 to $t1 from $fp-6464
	  add $t2, $t0, $t1	
	  sw $t2, -6468($fp)	# spill _tmp1615 from $t2 to $fp-6468
	# _tmp1616 = _tmp1615 + _tmp1613
	  lw $t0, -6468($fp)	# fill _tmp1615 to $t0 from $fp-6468
	  lw $t1, -6460($fp)	# fill _tmp1613 to $t1 from $fp-6460
	  add $t2, $t0, $t1	
	  sw $t2, -6472($fp)	# spill _tmp1616 from $t2 to $fp-6472
	# _tmp1617 = *(_tmp1616)
	  lw $t0, -6472($fp)	# fill _tmp1616 to $t0 from $fp-6472
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -6476($fp)	# spill _tmp1617 from $t2 to $fp-6476
	# _tmp1618 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -6480($fp)	# spill _tmp1618 from $t2 to $fp-6480
	# _tmp1619 = *(_tmp1617)
	  lw $t0, -6476($fp)	# fill _tmp1617 to $t0 from $fp-6476
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -6484($fp)	# spill _tmp1619 from $t2 to $fp-6484
	# _tmp1620 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -6488($fp)	# spill _tmp1620 from $t2 to $fp-6488
	# _tmp1621 = _tmp1618 < _tmp1620
	  lw $t0, -6480($fp)	# fill _tmp1618 to $t0 from $fp-6480
	  lw $t1, -6488($fp)	# fill _tmp1620 to $t1 from $fp-6488
	  slt $t2, $t0, $t1	
	  sw $t2, -6492($fp)	# spill _tmp1621 from $t2 to $fp-6492
	# _tmp1622 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -6496($fp)	# spill _tmp1622 from $t2 to $fp-6496
	# _tmp1623 = _tmp1619 - _tmp1622
	  lw $t0, -6484($fp)	# fill _tmp1619 to $t0 from $fp-6484
	  lw $t1, -6496($fp)	# fill _tmp1622 to $t1 from $fp-6496
	  sub $t2, $t0, $t1	
	  sw $t2, -6500($fp)	# spill _tmp1623 from $t2 to $fp-6500
	# _tmp1624 = _tmp1623 < _tmp1618
	  lw $t0, -6500($fp)	# fill _tmp1623 to $t0 from $fp-6500
	  lw $t1, -6480($fp)	# fill _tmp1618 to $t1 from $fp-6480
	  slt $t2, $t0, $t1	
	  sw $t2, -6504($fp)	# spill _tmp1624 from $t2 to $fp-6504
	# _tmp1625 = _tmp1621 || _tmp1624
	  lw $t0, -6492($fp)	# fill _tmp1621 to $t0 from $fp-6492
	  lw $t1, -6504($fp)	# fill _tmp1624 to $t1 from $fp-6504
	  or $t2, $t0, $t1	
	  sw $t2, -6508($fp)	# spill _tmp1625 from $t2 to $fp-6508
	# IfZ _tmp1625 Goto arrayAcc_238
	  lw $t0, -6508($fp)	# fill _tmp1625 to $t0 from $fp-6508
	  beqz $t0, arrayAcc_238	# branch if _tmp1625 is zero 
	# _tmp1626 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string174: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string174	# load label
	  sw $t2, -6512($fp)	# spill _tmp1626 from $t2 to $fp-6512
	# PushParam _tmp1626
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -6512($fp)	# fill _tmp1626 to $t0 from $fp-6512
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_238:
	# _tmp1627 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -6516($fp)	# spill _tmp1627 from $t2 to $fp-6516
	# _tmp1628 = _tmp1618 * _tmp1627
	  lw $t0, -6480($fp)	# fill _tmp1618 to $t0 from $fp-6480
	  lw $t1, -6516($fp)	# fill _tmp1627 to $t1 from $fp-6516
	  mul $t2, $t0, $t1	
	  sw $t2, -6520($fp)	# spill _tmp1628 from $t2 to $fp-6520
	# _tmp1629 = _tmp1617 + _tmp1628
	  lw $t0, -6476($fp)	# fill _tmp1617 to $t0 from $fp-6476
	  lw $t1, -6520($fp)	# fill _tmp1628 to $t1 from $fp-6520
	  add $t2, $t0, $t1	
	  sw $t2, -6524($fp)	# spill _tmp1629 from $t2 to $fp-6524
	# _tmp1630 = _tmp1629 + _tmp1627
	  lw $t0, -6524($fp)	# fill _tmp1629 to $t0 from $fp-6524
	  lw $t1, -6516($fp)	# fill _tmp1627 to $t1 from $fp-6516
	  add $t2, $t0, $t1	
	  sw $t2, -6528($fp)	# spill _tmp1630 from $t2 to $fp-6528
	# _tmp1631 = *(_tmp1630)
	  lw $t0, -6528($fp)	# fill _tmp1630 to $t0 from $fp-6528
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -6532($fp)	# spill _tmp1631 from $t2 to $fp-6532
	# _tmp1632 = *(_tmp1631)
	  lw $t0, -6532($fp)	# fill _tmp1631 to $t0 from $fp-6532
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -6536($fp)	# spill _tmp1632 from $t2 to $fp-6536
	# _tmp1633 = *(_tmp1632 + 20)
	  lw $t0, -6536($fp)	# fill _tmp1632 to $t0 from $fp-6536
	  lw $t2, 20($t0) 	# load with offset
	  sw $t2, -6540($fp)	# spill _tmp1633 from $t2 to $fp-6540
	# PushParam playerMark
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, 12($fp)	# fill playerMark to $t0 from $fp+12
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam _tmp1631
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -6532($fp)	# fill _tmp1631 to $t0 from $fp-6532
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp1634 = ACall _tmp1633
	  lw $t0, -6540($fp)	# fill _tmp1633 to $t0 from $fp-6540
	  jalr $t0            	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -6544($fp)	# spill _tmp1634 from $t2 to $fp-6544
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# _tmp1635 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -6548($fp)	# spill _tmp1635 from $t2 to $fp-6548
	# _tmp1636 = _tmp1634 == _tmp1635
	  lw $t0, -6544($fp)	# fill _tmp1634 to $t0 from $fp-6544
	  lw $t1, -6548($fp)	# fill _tmp1635 to $t1 from $fp-6548
	  seq $t2, $t0, $t1	
	  sw $t2, -6552($fp)	# spill _tmp1636 from $t2 to $fp-6552
	# _tmp1637 = _tmp1602 && _tmp1636
	  lw $t0, -6416($fp)	# fill _tmp1602 to $t0 from $fp-6416
	  lw $t1, -6552($fp)	# fill _tmp1636 to $t1 from $fp-6552
	  and $t2, $t0, $t1	
	  sw $t2, -6556($fp)	# spill _tmp1637 from $t2 to $fp-6556
	# IfZ _tmp1637 Goto else_239
	  lw $t0, -6556($fp)	# fill _tmp1637 to $t0 from $fp-6556
	  beqz $t0, else_239	# branch if _tmp1637 is zero 
	# _tmp1638 = 2
	  li $t2, 2		# load constant value 2 into $t2
	  sw $t2, -6560($fp)	# spill _tmp1638 from $t2 to $fp-6560
	# row = _tmp1638
	  lw $t2, -6560($fp)	# fill _tmp1638 to $t2 from $fp-6560
	  sw $t2, -8($fp)	# spill row from $t2 to $fp-8
	# _tmp1639 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -6564($fp)	# spill _tmp1639 from $t2 to $fp-6564
	# column = _tmp1639
	  lw $t2, -6564($fp)	# fill _tmp1639 to $t2 from $fp-6564
	  sw $t2, -12($fp)	# spill column from $t2 to $fp-12
	# Goto endif_240
	  b endif_240		# unconditional branch
  else_239:
  endif_240:
  endif_232:
  endif_224:
  endif_216:
  endif_208:
  endif_200:
  endif_192:
  endif_184:
  endif_176:
  endif_168:
  endif_160:
  endif_152:
  endif_144:
  endif_136:
  endif_128:
  endif_120:
	# _tmp1640 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -6568($fp)	# spill _tmp1640 from $t2 to $fp-6568
	# _tmp1641 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -6572($fp)	# spill _tmp1641 from $t2 to $fp-6572
	# _tmp1642 = _tmp1640 - _tmp1641
	  lw $t0, -6568($fp)	# fill _tmp1640 to $t0 from $fp-6568
	  lw $t1, -6572($fp)	# fill _tmp1641 to $t1 from $fp-6572
	  sub $t2, $t0, $t1	
	  sw $t2, -6576($fp)	# spill _tmp1642 from $t2 to $fp-6576
	# _tmp1643 = row == _tmp1642
	  lw $t0, -8($fp)	# fill row to $t0 from $fp-8
	  lw $t1, -6576($fp)	# fill _tmp1642 to $t1 from $fp-6576
	  seq $t2, $t0, $t1	
	  sw $t2, -6580($fp)	# spill _tmp1643 from $t2 to $fp-6580
	# _tmp1644 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -6584($fp)	# spill _tmp1644 from $t2 to $fp-6584
	# _tmp1645 = _tmp1643 == _tmp1644
	  lw $t0, -6580($fp)	# fill _tmp1643 to $t0 from $fp-6580
	  lw $t1, -6584($fp)	# fill _tmp1644 to $t1 from $fp-6584
	  seq $t2, $t0, $t1	
	  sw $t2, -6588($fp)	# spill _tmp1645 from $t2 to $fp-6588
	# IfZ _tmp1645 Goto else_241
	  lw $t0, -6588($fp)	# fill _tmp1645 to $t0 from $fp-6588
	  beqz $t0, else_241	# branch if _tmp1645 is zero 
	# _tmp1646 = *(this)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -6592($fp)	# spill _tmp1646 from $t2 to $fp-6592
	# _tmp1647 = *(_tmp1646 + 12)
	  lw $t0, -6592($fp)	# fill _tmp1646 to $t0 from $fp-6592
	  lw $t2, 12($t0) 	# load with offset
	  sw $t2, -6596($fp)	# spill _tmp1647 from $t2 to $fp-6596
	# PushParam playerMark
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, 12($fp)	# fill playerMark to $t0 from $fp+12
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam column
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -12($fp)	# fill column to $t0 from $fp-12
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam row
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -8($fp)	# fill row to $t0 from $fp-8
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam this
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  sw $t0, 4($sp)	# copy param value to stack
	# ACall _tmp1647
	  lw $t0, -6596($fp)	# fill _tmp1647 to $t0 from $fp-6596
	  jalr $t0            	# jump to function
	# PopParams 16
	  add $sp, $sp, 16	# pop params off stack
	# _tmp1648 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -6600($fp)	# spill _tmp1648 from $t2 to $fp-6600
	# Return _tmp1648
	  lw $t2, -6600($fp)	# fill _tmp1648 to $t2 from $fp-6600
	  move $v0, $t2		# assign return value into $v0
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# Goto endif_242
	  b endif_242		# unconditional branch
  else_241:
	# _tmp1649 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -6604($fp)	# spill _tmp1649 from $t2 to $fp-6604
	# Return _tmp1649
	  lw $t2, -6604($fp)	# fill _tmp1649 to $t2 from $fp-6604
	  move $v0, $t2		# assign return value into $v0
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  endif_242:
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# VTable for class Grid
	  .data
	  .align 2
	  Grid:		# label for class Grid vtable
	  .word Grid_Init
	  .word Grid_Full
	  .word Grid_Draw
	  .word Grid_Update
	  .word Grid_IsMoveLegal
	  .word Grid_GameNotWon
	  .word Grid_BlockedPlay
	  .text
  Computer_Init:
	# BeginFunc 12
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 12	# decrement sp to make space for locals/temps
	# _tmp0 = "0"
	  .data			# create string constant marked with label
	  _string175: .asciiz "0"
	  .text
	  la $t2, _string175	# load label
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
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  Computer_TakeTurn:
	# BeginFunc 172
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 172	# decrement sp to make space for locals/temps
	# _tmp3 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -20($fp)	# spill _tmp3 from $t2 to $fp-20
	# legalMove = _tmp3
	  lw $t2, -20($fp)	# fill _tmp3 to $t2 from $fp-20
	  sw $t2, -16($fp)	# spill legalMove from $t2 to $fp-16
	# _tmp4 = *(human)
	  lw $t0, 12($fp)	# fill human to $t0 from $fp+12
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -24($fp)	# spill _tmp4 from $t2 to $fp-24
	# _tmp5 = *(_tmp4)
	  lw $t0, -24($fp)	# fill _tmp4 to $t0 from $fp-24
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -28($fp)	# spill _tmp5 from $t2 to $fp-28
	# PushParam human
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, 12($fp)	# fill human to $t0 from $fp+12
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp6 = ACall _tmp5
	  lw $t0, -28($fp)	# fill _tmp5 to $t0 from $fp-28
	  jalr $t0            	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -32($fp)	# spill _tmp6 from $t2 to $fp-32
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp7 = *(this)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -36($fp)	# spill _tmp7 from $t2 to $fp-36
	# _tmp8 = *(_tmp7)
	  lw $t0, -36($fp)	# fill _tmp7 to $t0 from $fp-36
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -40($fp)	# spill _tmp8 from $t2 to $fp-40
	# PushParam this
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp9 = ACall _tmp8
	  lw $t0, -40($fp)	# fill _tmp8 to $t0 from $fp-40
	  jalr $t0            	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -44($fp)	# spill _tmp9 from $t2 to $fp-44
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp10 = *(grid)
	  lw $t0, 8($fp)	# fill grid to $t0 from $fp+8
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -48($fp)	# spill _tmp10 from $t2 to $fp-48
	# _tmp11 = *(_tmp10 + 24)
	  lw $t0, -48($fp)	# fill _tmp10 to $t0 from $fp-48
	  lw $t2, 24($t0) 	# load with offset
	  sw $t2, -52($fp)	# spill _tmp11 from $t2 to $fp-52
	# PushParam _tmp9
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -44($fp)	# fill _tmp9 to $t0 from $fp-44
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam _tmp6
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -32($fp)	# fill _tmp6 to $t0 from $fp-32
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam grid
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, 8($fp)	# fill grid to $t0 from $fp+8
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp12 = ACall _tmp11
	  lw $t0, -52($fp)	# fill _tmp11 to $t0 from $fp-52
	  jalr $t0            	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -56($fp)	# spill _tmp12 from $t2 to $fp-56
	# PopParams 12
	  add $sp, $sp, 12	# pop params off stack
	# _tmp13 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -60($fp)	# spill _tmp13 from $t2 to $fp-60
	# _tmp14 = _tmp12 == _tmp13
	  lw $t0, -56($fp)	# fill _tmp12 to $t0 from $fp-56
	  lw $t1, -60($fp)	# fill _tmp13 to $t1 from $fp-60
	  seq $t2, $t0, $t1	
	  sw $t2, -64($fp)	# spill _tmp14 from $t2 to $fp-64
	# IfZ _tmp14 Goto else_243
	  lw $t0, -64($fp)	# fill _tmp14 to $t0 from $fp-64
	  beqz $t0, else_243	# branch if _tmp14 is zero 
  loopBegin_245:
	# _tmp15 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -68($fp)	# spill _tmp15 from $t2 to $fp-68
	# _tmp16 = legalMove == _tmp15
	  lw $t0, -16($fp)	# fill legalMove to $t0 from $fp-16
	  lw $t1, -68($fp)	# fill _tmp15 to $t1 from $fp-68
	  seq $t2, $t0, $t1	
	  sw $t2, -72($fp)	# spill _tmp16 from $t2 to $fp-72
	# IfZ _tmp16 Goto loopEnd_246
	  lw $t0, -72($fp)	# fill _tmp16 to $t0 from $fp-72
	  beqz $t0, loopEnd_246	# branch if _tmp16 is zero 
	# _tmp17 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -76($fp)	# spill _tmp17 from $t2 to $fp-76
	# _tmp18 = 2
	  li $t2, 2		# load constant value 2 into $t2
	  sw $t2, -80($fp)	# spill _tmp18 from $t2 to $fp-80
	# _tmp19 = *(gRnd)
	  lw $t0, 0($gp)	# fill gRnd to $t0 from $gp+0
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -84($fp)	# spill _tmp19 from $t2 to $fp-84
	# _tmp20 = *(_tmp19 + 8)
	  lw $t0, -84($fp)	# fill _tmp19 to $t0 from $fp-84
	  lw $t2, 8($t0) 	# load with offset
	  sw $t2, -88($fp)	# spill _tmp20 from $t2 to $fp-88
	# PushParam _tmp18
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -80($fp)	# fill _tmp18 to $t0 from $fp-80
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam _tmp17
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -76($fp)	# fill _tmp17 to $t0 from $fp-76
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam gRnd
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, 0($gp)	# fill gRnd to $t0 from $gp+0
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp21 = ACall _tmp20
	  lw $t0, -88($fp)	# fill _tmp20 to $t0 from $fp-88
	  jalr $t0            	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -92($fp)	# spill _tmp21 from $t2 to $fp-92
	# PopParams 12
	  add $sp, $sp, 12	# pop params off stack
	# row = _tmp21
	  lw $t2, -92($fp)	# fill _tmp21 to $t2 from $fp-92
	  sw $t2, -8($fp)	# spill row from $t2 to $fp-8
	# _tmp22 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -96($fp)	# spill _tmp22 from $t2 to $fp-96
	# _tmp23 = 2
	  li $t2, 2		# load constant value 2 into $t2
	  sw $t2, -100($fp)	# spill _tmp23 from $t2 to $fp-100
	# _tmp24 = *(gRnd)
	  lw $t0, 0($gp)	# fill gRnd to $t0 from $gp+0
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -104($fp)	# spill _tmp24 from $t2 to $fp-104
	# _tmp25 = *(_tmp24 + 8)
	  lw $t0, -104($fp)	# fill _tmp24 to $t0 from $fp-104
	  lw $t2, 8($t0) 	# load with offset
	  sw $t2, -108($fp)	# spill _tmp25 from $t2 to $fp-108
	# PushParam _tmp23
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -100($fp)	# fill _tmp23 to $t0 from $fp-100
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam _tmp22
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -96($fp)	# fill _tmp22 to $t0 from $fp-96
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam gRnd
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, 0($gp)	# fill gRnd to $t0 from $gp+0
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp26 = ACall _tmp25
	  lw $t0, -108($fp)	# fill _tmp25 to $t0 from $fp-108
	  jalr $t0            	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -112($fp)	# spill _tmp26 from $t2 to $fp-112
	# PopParams 12
	  add $sp, $sp, 12	# pop params off stack
	# column = _tmp26
	  lw $t2, -112($fp)	# fill _tmp26 to $t2 from $fp-112
	  sw $t2, -12($fp)	# spill column from $t2 to $fp-12
	# _tmp27 = *(grid)
	  lw $t0, 8($fp)	# fill grid to $t0 from $fp+8
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -116($fp)	# spill _tmp27 from $t2 to $fp-116
	# _tmp28 = *(_tmp27 + 16)
	  lw $t0, -116($fp)	# fill _tmp27 to $t0 from $fp-116
	  lw $t2, 16($t0) 	# load with offset
	  sw $t2, -120($fp)	# spill _tmp28 from $t2 to $fp-120
	# PushParam column
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -12($fp)	# fill column to $t0 from $fp-12
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam row
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -8($fp)	# fill row to $t0 from $fp-8
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam grid
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, 8($fp)	# fill grid to $t0 from $fp+8
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp29 = ACall _tmp28
	  lw $t0, -120($fp)	# fill _tmp28 to $t0 from $fp-120
	  jalr $t0            	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -124($fp)	# spill _tmp29 from $t2 to $fp-124
	# PopParams 12
	  add $sp, $sp, 12	# pop params off stack
	# legalMove = _tmp29
	  lw $t2, -124($fp)	# fill _tmp29 to $t2 from $fp-124
	  sw $t2, -16($fp)	# spill legalMove from $t2 to $fp-16
	# Goto loopBegin_245
	  b loopBegin_245		# unconditional branch
  loopEnd_246:
	# _tmp30 = *(this)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -128($fp)	# spill _tmp30 from $t2 to $fp-128
	# _tmp31 = *(_tmp30)
	  lw $t0, -128($fp)	# fill _tmp30 to $t0 from $fp-128
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -132($fp)	# spill _tmp31 from $t2 to $fp-132
	# PushParam this
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp32 = ACall _tmp31
	  lw $t0, -132($fp)	# fill _tmp31 to $t0 from $fp-132
	  jalr $t0            	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -136($fp)	# spill _tmp32 from $t2 to $fp-136
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp33 = *(grid)
	  lw $t0, 8($fp)	# fill grid to $t0 from $fp+8
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -140($fp)	# spill _tmp33 from $t2 to $fp-140
	# _tmp34 = *(_tmp33 + 12)
	  lw $t0, -140($fp)	# fill _tmp33 to $t0 from $fp-140
	  lw $t2, 12($t0) 	# load with offset
	  sw $t2, -144($fp)	# spill _tmp34 from $t2 to $fp-144
	# PushParam _tmp32
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -136($fp)	# fill _tmp32 to $t0 from $fp-136
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam column
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -12($fp)	# fill column to $t0 from $fp-12
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam row
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -8($fp)	# fill row to $t0 from $fp-8
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam grid
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, 8($fp)	# fill grid to $t0 from $fp+8
	  sw $t0, 4($sp)	# copy param value to stack
	# ACall _tmp34
	  lw $t0, -144($fp)	# fill _tmp34 to $t0 from $fp-144
	  jalr $t0            	# jump to function
	# PopParams 16
	  add $sp, $sp, 16	# pop params off stack
	# _tmp35 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -148($fp)	# spill _tmp35 from $t2 to $fp-148
	# _tmp36 = row + _tmp35
	  lw $t0, -8($fp)	# fill row to $t0 from $fp-8
	  lw $t1, -148($fp)	# fill _tmp35 to $t1 from $fp-148
	  add $t2, $t0, $t1	
	  sw $t2, -152($fp)	# spill _tmp36 from $t2 to $fp-152
	# row = _tmp36
	  lw $t2, -152($fp)	# fill _tmp36 to $t2 from $fp-152
	  sw $t2, -8($fp)	# spill row from $t2 to $fp-8
	# _tmp37 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -156($fp)	# spill _tmp37 from $t2 to $fp-156
	# _tmp38 = column + _tmp37
	  lw $t0, -12($fp)	# fill column to $t0 from $fp-12
	  lw $t1, -156($fp)	# fill _tmp37 to $t1 from $fp-156
	  add $t2, $t0, $t1	
	  sw $t2, -160($fp)	# spill _tmp38 from $t2 to $fp-160
	# column = _tmp38
	  lw $t2, -160($fp)	# fill _tmp38 to $t2 from $fp-160
	  sw $t2, -12($fp)	# spill column from $t2 to $fp-12
	# _tmp39 = "\nThe computer's move is row "
	  .data			# create string constant marked with label
	  _string176: .asciiz "\nThe computer's move is row "
	  .text
	  la $t2, _string176	# load label
	  sw $t2, -164($fp)	# spill _tmp39 from $t2 to $fp-164
	# PushParam _tmp39
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -164($fp)	# fill _tmp39 to $t0 from $fp-164
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# PushParam row
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -8($fp)	# fill row to $t0 from $fp-8
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintInt
	  jal _PrintInt      	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp40 = " and column "
	  .data			# create string constant marked with label
	  _string177: .asciiz " and column "
	  .text
	  la $t2, _string177	# load label
	  sw $t2, -168($fp)	# spill _tmp40 from $t2 to $fp-168
	# PushParam _tmp40
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -168($fp)	# fill _tmp40 to $t0 from $fp-168
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# PushParam column
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -12($fp)	# fill column to $t0 from $fp-12
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintInt
	  jal _PrintInt      	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp41 = ".\n"
	  .data			# create string constant marked with label
	  _string178: .asciiz ".\n"
	  .text
	  la $t2, _string178	# load label
	  sw $t2, -172($fp)	# spill _tmp41 from $t2 to $fp-172
	# PushParam _tmp41
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -172($fp)	# fill _tmp41 to $t0 from $fp-172
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# Goto endif_244
	  b endif_244		# unconditional branch
  else_243:
	# _tmp42 = "Ha! The computer blocked you from winning!\n"
	  .data			# create string constant marked with label
	  _string179: .asciiz "Ha! The computer blocked you from winning!\n"
	  .text
	  la $t2, _string179	# load label
	  sw $t2, -176($fp)	# spill _tmp42 from $t2 to $fp-176
	# PushParam _tmp42
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -176($fp)	# fill _tmp42 to $t0 from $fp-176
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
  endif_244:
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# VTable for class Computer
	  .data
	  .align 2
	  Computer:		# label for class Computer vtable
	  .word Player_GetMark
	  .word Player_GetName
	  .word Computer_Init
	  .word Computer_TakeTurn
	  .text
  _InitGame:
	# BeginFunc 24
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 24	# decrement sp to make space for locals/temps
	# _tmp0 = "\nWelcome to TicTacToe!\n"
	  .data			# create string constant marked with label
	  _string180: .asciiz "\nWelcome to TicTacToe!\n"
	  .text
	  la $t2, _string180	# load label
	  sw $t2, -8($fp)	# spill _tmp0 from $t2 to $fp-8
	# PushParam _tmp0
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -8($fp)	# fill _tmp0 to $t0 from $fp-8
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp1 = "---------------------\n"
	  .data			# create string constant marked with label
	  _string181: .asciiz "---------------------\n"
	  .text
	  la $t2, _string181	# load label
	  sw $t2, -12($fp)	# spill _tmp1 from $t2 to $fp-12
	# PushParam _tmp1
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -12($fp)	# fill _tmp1 to $t0 from $fp-12
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp2 = "Please enter a random number seed: "
	  .data			# create string constant marked with label
	  _string182: .asciiz "Please enter a random number seed: "
	  .text
	  la $t2, _string182	# load label
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
	# _tmp4 = *(gRnd)
	  lw $t0, 0($gp)	# fill gRnd to $t0 from $gp+0
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -24($fp)	# spill _tmp4 from $t2 to $fp-24
	# _tmp5 = *(_tmp4)
	  lw $t0, -24($fp)	# fill _tmp4 to $t0 from $fp-24
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -28($fp)	# spill _tmp5 from $t2 to $fp-28
	# PushParam _tmp3
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -20($fp)	# fill _tmp3 to $t0 from $fp-20
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam gRnd
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, 0($gp)	# fill gRnd to $t0 from $gp+0
	  sw $t0, 4($sp)	# copy param value to stack
	# ACall _tmp5
	  lw $t0, -28($fp)	# fill _tmp5 to $t0 from $fp-28
	  jalr $t0            	# jump to function
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  main:
	# BeginFunc 324
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 324	# decrement sp to make space for locals/temps
	# _tmp7 = 8
	  li $t2, 8		# load constant value 8 into $t2
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
	# _tmp9 = Grid
	  la $t2, Grid	# load label
	  sw $t2, -44($fp)	# spill _tmp9 from $t2 to $fp-44
	# *(_tmp8) = _tmp9
	  lw $t0, -44($fp)	# fill _tmp9 to $t0 from $fp-44
	  lw $t2, -40($fp)	# fill _tmp8 to $t2 from $fp-40
	  sw $t0, 0($t2) 	# store with offset
	# grid = _tmp8
	  lw $t2, -40($fp)	# fill _tmp8 to $t2 from $fp-40
	  sw $t2, -8($fp)	# spill grid from $t2 to $fp-8
	# _tmp10 = 12
	  li $t2, 12		# load constant value 12 into $t2
	  sw $t2, -48($fp)	# spill _tmp10 from $t2 to $fp-48
	# PushParam _tmp10
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -48($fp)	# fill _tmp10 to $t0 from $fp-48
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp11 = LCall _Alloc
	  jal _Alloc         	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -52($fp)	# spill _tmp11 from $t2 to $fp-52
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp12 = Human
	  la $t2, Human	# load label
	  sw $t2, -56($fp)	# spill _tmp12 from $t2 to $fp-56
	# *(_tmp11) = _tmp12
	  lw $t0, -56($fp)	# fill _tmp12 to $t0 from $fp-56
	  lw $t2, -52($fp)	# fill _tmp11 to $t2 from $fp-52
	  sw $t0, 0($t2) 	# store with offset
	# human = _tmp11
	  lw $t2, -52($fp)	# fill _tmp11 to $t2 from $fp-52
	  sw $t2, -12($fp)	# spill human from $t2 to $fp-12
	# _tmp13 = 12
	  li $t2, 12		# load constant value 12 into $t2
	  sw $t2, -60($fp)	# spill _tmp13 from $t2 to $fp-60
	# PushParam _tmp13
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -60($fp)	# fill _tmp13 to $t0 from $fp-60
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp14 = LCall _Alloc
	  jal _Alloc         	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -64($fp)	# spill _tmp14 from $t2 to $fp-64
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp15 = Computer
	  la $t2, Computer	# load label
	  sw $t2, -68($fp)	# spill _tmp15 from $t2 to $fp-68
	# *(_tmp14) = _tmp15
	  lw $t0, -68($fp)	# fill _tmp15 to $t0 from $fp-68
	  lw $t2, -64($fp)	# fill _tmp14 to $t2 from $fp-64
	  sw $t0, 0($t2) 	# store with offset
	# computer = _tmp14
	  lw $t2, -64($fp)	# fill _tmp14 to $t2 from $fp-64
	  sw $t2, -16($fp)	# spill computer from $t2 to $fp-16
	# _tmp16 = 8
	  li $t2, 8		# load constant value 8 into $t2
	  sw $t2, -72($fp)	# spill _tmp16 from $t2 to $fp-72
	# PushParam _tmp16
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -72($fp)	# fill _tmp16 to $t0 from $fp-72
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp17 = LCall _Alloc
	  jal _Alloc         	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -76($fp)	# spill _tmp17 from $t2 to $fp-76
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp18 = rndModule
	  la $t2, rndModule	# load label
	  sw $t2, -80($fp)	# spill _tmp18 from $t2 to $fp-80
	# *(_tmp17) = _tmp18
	  lw $t0, -80($fp)	# fill _tmp18 to $t0 from $fp-80
	  lw $t2, -76($fp)	# fill _tmp17 to $t2 from $fp-76
	  sw $t0, 0($t2) 	# store with offset
	# gRnd = _tmp17
	  lw $t2, -76($fp)	# fill _tmp17 to $t2 from $fp-76
	  sw $t2, 0($gp)	# spill gRnd from $t2 to $gp+0
	# LCall _InitGame
	  jal _InitGame      	# jump to function
	# _tmp19 = *(grid)
	  lw $t0, -8($fp)	# fill grid to $t0 from $fp-8
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -84($fp)	# spill _tmp19 from $t2 to $fp-84
	# _tmp20 = *(_tmp19)
	  lw $t0, -84($fp)	# fill _tmp19 to $t0 from $fp-84
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -88($fp)	# spill _tmp20 from $t2 to $fp-88
	# PushParam grid
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -8($fp)	# fill grid to $t0 from $fp-8
	  sw $t0, 4($sp)	# copy param value to stack
	# ACall _tmp20
	  lw $t0, -88($fp)	# fill _tmp20 to $t0 from $fp-88
	  jalr $t0            	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp21 = *(human)
	  lw $t0, -12($fp)	# fill human to $t0 from $fp-12
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -92($fp)	# spill _tmp21 from $t2 to $fp-92
	# _tmp22 = *(_tmp21 + 8)
	  lw $t0, -92($fp)	# fill _tmp21 to $t0 from $fp-92
	  lw $t2, 8($t0) 	# load with offset
	  sw $t2, -96($fp)	# spill _tmp22 from $t2 to $fp-96
	# PushParam human
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -12($fp)	# fill human to $t0 from $fp-12
	  sw $t0, 4($sp)	# copy param value to stack
	# ACall _tmp22
	  lw $t0, -96($fp)	# fill _tmp22 to $t0 from $fp-96
	  jalr $t0            	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp23 = *(computer)
	  lw $t0, -16($fp)	# fill computer to $t0 from $fp-16
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -100($fp)	# spill _tmp23 from $t2 to $fp-100
	# _tmp24 = *(_tmp23 + 8)
	  lw $t0, -100($fp)	# fill _tmp23 to $t0 from $fp-100
	  lw $t2, 8($t0) 	# load with offset
	  sw $t2, -104($fp)	# spill _tmp24 from $t2 to $fp-104
	# PushParam computer
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -16($fp)	# fill computer to $t0 from $fp-16
	  sw $t0, 4($sp)	# copy param value to stack
	# ACall _tmp24
	  lw $t0, -104($fp)	# fill _tmp24 to $t0 from $fp-104
	  jalr $t0            	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp25 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -108($fp)	# spill _tmp25 from $t2 to $fp-108
	# moveLegal = _tmp25
	  lw $t2, -108($fp)	# fill _tmp25 to $t2 from $fp-108
	  sw $t2, -28($fp)	# spill moveLegal from $t2 to $fp-28
	# _tmp26 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -112($fp)	# spill _tmp26 from $t2 to $fp-112
	# gameOver = _tmp26
	  lw $t2, -112($fp)	# fill _tmp26 to $t2 from $fp-112
	  sw $t2, -32($fp)	# spill gameOver from $t2 to $fp-32
	# _tmp27 = *(grid)
	  lw $t0, -8($fp)	# fill grid to $t0 from $fp-8
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -116($fp)	# spill _tmp27 from $t2 to $fp-116
	# _tmp28 = *(_tmp27 + 8)
	  lw $t0, -116($fp)	# fill _tmp27 to $t0 from $fp-116
	  lw $t2, 8($t0) 	# load with offset
	  sw $t2, -120($fp)	# spill _tmp28 from $t2 to $fp-120
	# PushParam grid
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -8($fp)	# fill grid to $t0 from $fp-8
	  sw $t0, 4($sp)	# copy param value to stack
	# ACall _tmp28
	  lw $t0, -120($fp)	# fill _tmp28 to $t0 from $fp-120
	  jalr $t0            	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
  loopBegin_247:
	# _tmp29 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -124($fp)	# spill _tmp29 from $t2 to $fp-124
	# _tmp30 = gameOver == _tmp29
	  lw $t0, -32($fp)	# fill gameOver to $t0 from $fp-32
	  lw $t1, -124($fp)	# fill _tmp29 to $t1 from $fp-124
	  seq $t2, $t0, $t1	
	  sw $t2, -128($fp)	# spill _tmp30 from $t2 to $fp-128
	# IfZ _tmp30 Goto loopEnd_248
	  lw $t0, -128($fp)	# fill _tmp30 to $t0 from $fp-128
	  beqz $t0, loopEnd_248	# branch if _tmp30 is zero 
	# _tmp31 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -132($fp)	# spill _tmp31 from $t2 to $fp-132
	# moveLegal = _tmp31
	  lw $t2, -132($fp)	# fill _tmp31 to $t2 from $fp-132
	  sw $t2, -28($fp)	# spill moveLegal from $t2 to $fp-28
  loopBegin_249:
	# _tmp32 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -136($fp)	# spill _tmp32 from $t2 to $fp-136
	# _tmp33 = moveLegal == _tmp32
	  lw $t0, -28($fp)	# fill moveLegal to $t0 from $fp-28
	  lw $t1, -136($fp)	# fill _tmp32 to $t1 from $fp-136
	  seq $t2, $t0, $t1	
	  sw $t2, -140($fp)	# spill _tmp33 from $t2 to $fp-140
	# IfZ _tmp33 Goto loopEnd_250
	  lw $t0, -140($fp)	# fill _tmp33 to $t0 from $fp-140
	  beqz $t0, loopEnd_250	# branch if _tmp33 is zero 
	# _tmp34 = *(human)
	  lw $t0, -12($fp)	# fill human to $t0 from $fp-12
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -144($fp)	# spill _tmp34 from $t2 to $fp-144
	# _tmp35 = *(_tmp34 + 12)
	  lw $t0, -144($fp)	# fill _tmp34 to $t0 from $fp-144
	  lw $t2, 12($t0) 	# load with offset
	  sw $t2, -148($fp)	# spill _tmp35 from $t2 to $fp-148
	# PushParam human
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -12($fp)	# fill human to $t0 from $fp-12
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp36 = ACall _tmp35
	  lw $t0, -148($fp)	# fill _tmp35 to $t0 from $fp-148
	  jalr $t0            	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -152($fp)	# spill _tmp36 from $t2 to $fp-152
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# row = _tmp36
	  lw $t2, -152($fp)	# fill _tmp36 to $t2 from $fp-152
	  sw $t2, -20($fp)	# spill row from $t2 to $fp-20
	# _tmp37 = *(human)
	  lw $t0, -12($fp)	# fill human to $t0 from $fp-12
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -156($fp)	# spill _tmp37 from $t2 to $fp-156
	# _tmp38 = *(_tmp37 + 16)
	  lw $t0, -156($fp)	# fill _tmp37 to $t0 from $fp-156
	  lw $t2, 16($t0) 	# load with offset
	  sw $t2, -160($fp)	# spill _tmp38 from $t2 to $fp-160
	# PushParam human
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -12($fp)	# fill human to $t0 from $fp-12
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp39 = ACall _tmp38
	  lw $t0, -160($fp)	# fill _tmp38 to $t0 from $fp-160
	  jalr $t0            	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -164($fp)	# spill _tmp39 from $t2 to $fp-164
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# column = _tmp39
	  lw $t2, -164($fp)	# fill _tmp39 to $t2 from $fp-164
	  sw $t2, -24($fp)	# spill column from $t2 to $fp-24
	# _tmp40 = *(grid)
	  lw $t0, -8($fp)	# fill grid to $t0 from $fp-8
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -168($fp)	# spill _tmp40 from $t2 to $fp-168
	# _tmp41 = *(_tmp40 + 16)
	  lw $t0, -168($fp)	# fill _tmp40 to $t0 from $fp-168
	  lw $t2, 16($t0) 	# load with offset
	  sw $t2, -172($fp)	# spill _tmp41 from $t2 to $fp-172
	# PushParam column
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -24($fp)	# fill column to $t0 from $fp-24
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam row
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -20($fp)	# fill row to $t0 from $fp-20
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam grid
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -8($fp)	# fill grid to $t0 from $fp-8
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp42 = ACall _tmp41
	  lw $t0, -172($fp)	# fill _tmp41 to $t0 from $fp-172
	  jalr $t0            	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -176($fp)	# spill _tmp42 from $t2 to $fp-176
	# PopParams 12
	  add $sp, $sp, 12	# pop params off stack
	# moveLegal = _tmp42
	  lw $t2, -176($fp)	# fill _tmp42 to $t2 from $fp-176
	  sw $t2, -28($fp)	# spill moveLegal from $t2 to $fp-28
	# _tmp43 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -180($fp)	# spill _tmp43 from $t2 to $fp-180
	# _tmp44 = moveLegal == _tmp43
	  lw $t0, -28($fp)	# fill moveLegal to $t0 from $fp-28
	  lw $t1, -180($fp)	# fill _tmp43 to $t1 from $fp-180
	  seq $t2, $t0, $t1	
	  sw $t2, -184($fp)	# spill _tmp44 from $t2 to $fp-184
	# IfZ _tmp44 Goto else_251
	  lw $t0, -184($fp)	# fill _tmp44 to $t0 from $fp-184
	  beqz $t0, else_251	# branch if _tmp44 is zero 
	# _tmp45 = "Try again. The square is already taken.\n"
	  .data			# create string constant marked with label
	  _string183: .asciiz "Try again. The square is already taken.\n"
	  .text
	  la $t2, _string183	# load label
	  sw $t2, -188($fp)	# spill _tmp45 from $t2 to $fp-188
	# PushParam _tmp45
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -188($fp)	# fill _tmp45 to $t0 from $fp-188
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# Goto endif_252
	  b endif_252		# unconditional branch
  else_251:
	# _tmp46 = *(human)
	  lw $t0, -12($fp)	# fill human to $t0 from $fp-12
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -192($fp)	# spill _tmp46 from $t2 to $fp-192
	# _tmp47 = *(_tmp46)
	  lw $t0, -192($fp)	# fill _tmp46 to $t0 from $fp-192
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -196($fp)	# spill _tmp47 from $t2 to $fp-196
	# PushParam human
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -12($fp)	# fill human to $t0 from $fp-12
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp48 = ACall _tmp47
	  lw $t0, -196($fp)	# fill _tmp47 to $t0 from $fp-196
	  jalr $t0            	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -200($fp)	# spill _tmp48 from $t2 to $fp-200
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp49 = *(grid)
	  lw $t0, -8($fp)	# fill grid to $t0 from $fp-8
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -204($fp)	# spill _tmp49 from $t2 to $fp-204
	# _tmp50 = *(_tmp49 + 12)
	  lw $t0, -204($fp)	# fill _tmp49 to $t0 from $fp-204
	  lw $t2, 12($t0) 	# load with offset
	  sw $t2, -208($fp)	# spill _tmp50 from $t2 to $fp-208
	# PushParam _tmp48
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -200($fp)	# fill _tmp48 to $t0 from $fp-200
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam column
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -24($fp)	# fill column to $t0 from $fp-24
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam row
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -20($fp)	# fill row to $t0 from $fp-20
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam grid
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -8($fp)	# fill grid to $t0 from $fp-8
	  sw $t0, 4($sp)	# copy param value to stack
	# ACall _tmp50
	  lw $t0, -208($fp)	# fill _tmp50 to $t0 from $fp-208
	  jalr $t0            	# jump to function
	# PopParams 16
	  add $sp, $sp, 16	# pop params off stack
  endif_252:
	# Goto loopBegin_249
	  b loopBegin_249		# unconditional branch
  loopEnd_250:
	# _tmp51 = *(grid)
	  lw $t0, -8($fp)	# fill grid to $t0 from $fp-8
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -212($fp)	# spill _tmp51 from $t2 to $fp-212
	# _tmp52 = *(_tmp51 + 20)
	  lw $t0, -212($fp)	# fill _tmp51 to $t0 from $fp-212
	  lw $t2, 20($t0) 	# load with offset
	  sw $t2, -216($fp)	# spill _tmp52 from $t2 to $fp-216
	# PushParam human
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -12($fp)	# fill human to $t0 from $fp-12
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam grid
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -8($fp)	# fill grid to $t0 from $fp-8
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp53 = ACall _tmp52
	  lw $t0, -216($fp)	# fill _tmp52 to $t0 from $fp-216
	  jalr $t0            	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -220($fp)	# spill _tmp53 from $t2 to $fp-220
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# _tmp54 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -224($fp)	# spill _tmp54 from $t2 to $fp-224
	# _tmp55 = _tmp53 == _tmp54
	  lw $t0, -220($fp)	# fill _tmp53 to $t0 from $fp-220
	  lw $t1, -224($fp)	# fill _tmp54 to $t1 from $fp-224
	  seq $t2, $t0, $t1	
	  sw $t2, -228($fp)	# spill _tmp55 from $t2 to $fp-228
	# IfZ _tmp55 Goto else_253
	  lw $t0, -228($fp)	# fill _tmp55 to $t0 from $fp-228
	  beqz $t0, else_253	# branch if _tmp55 is zero 
	# _tmp56 = *(human)
	  lw $t0, -12($fp)	# fill human to $t0 from $fp-12
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -232($fp)	# spill _tmp56 from $t2 to $fp-232
	# _tmp57 = *(_tmp56 + 4)
	  lw $t0, -232($fp)	# fill _tmp56 to $t0 from $fp-232
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -236($fp)	# spill _tmp57 from $t2 to $fp-236
	# PushParam human
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -12($fp)	# fill human to $t0 from $fp-12
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp58 = ACall _tmp57
	  lw $t0, -236($fp)	# fill _tmp57 to $t0 from $fp-236
	  jalr $t0            	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -240($fp)	# spill _tmp58 from $t2 to $fp-240
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# PushParam _tmp58
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -240($fp)	# fill _tmp58 to $t0 from $fp-240
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp59 = ", you won!\n"
	  .data			# create string constant marked with label
	  _string184: .asciiz ", you won!\n"
	  .text
	  la $t2, _string184	# load label
	  sw $t2, -244($fp)	# spill _tmp59 from $t2 to $fp-244
	# PushParam _tmp59
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -244($fp)	# fill _tmp59 to $t0 from $fp-244
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp60 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -248($fp)	# spill _tmp60 from $t2 to $fp-248
	# gameOver = _tmp60
	  lw $t2, -248($fp)	# fill _tmp60 to $t2 from $fp-248
	  sw $t2, -32($fp)	# spill gameOver from $t2 to $fp-32
	# Goto endif_254
	  b endif_254		# unconditional branch
  else_253:
	# _tmp61 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -252($fp)	# spill _tmp61 from $t2 to $fp-252
	# _tmp62 = gameOver == _tmp61
	  lw $t0, -32($fp)	# fill gameOver to $t0 from $fp-32
	  lw $t1, -252($fp)	# fill _tmp61 to $t1 from $fp-252
	  seq $t2, $t0, $t1	
	  sw $t2, -256($fp)	# spill _tmp62 from $t2 to $fp-256
	# _tmp63 = *(grid)
	  lw $t0, -8($fp)	# fill grid to $t0 from $fp-8
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -260($fp)	# spill _tmp63 from $t2 to $fp-260
	# _tmp64 = *(_tmp63 + 4)
	  lw $t0, -260($fp)	# fill _tmp63 to $t0 from $fp-260
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -264($fp)	# spill _tmp64 from $t2 to $fp-264
	# PushParam grid
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -8($fp)	# fill grid to $t0 from $fp-8
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp65 = ACall _tmp64
	  lw $t0, -264($fp)	# fill _tmp64 to $t0 from $fp-264
	  jalr $t0            	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -268($fp)	# spill _tmp65 from $t2 to $fp-268
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp66 = _tmp62 && _tmp65
	  lw $t0, -256($fp)	# fill _tmp62 to $t0 from $fp-256
	  lw $t1, -268($fp)	# fill _tmp65 to $t1 from $fp-268
	  and $t2, $t0, $t1	
	  sw $t2, -272($fp)	# spill _tmp66 from $t2 to $fp-272
	# IfZ _tmp66 Goto else_255
	  lw $t0, -272($fp)	# fill _tmp66 to $t0 from $fp-272
	  beqz $t0, else_255	# branch if _tmp66 is zero 
	# _tmp67 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -276($fp)	# spill _tmp67 from $t2 to $fp-276
	# gameOver = _tmp67
	  lw $t2, -276($fp)	# fill _tmp67 to $t2 from $fp-276
	  sw $t2, -32($fp)	# spill gameOver from $t2 to $fp-32
	# _tmp68 = "There was a tie...You all lose!\n"
	  .data			# create string constant marked with label
	  _string185: .asciiz "There was a tie...You all lose!\n"
	  .text
	  la $t2, _string185	# load label
	  sw $t2, -280($fp)	# spill _tmp68 from $t2 to $fp-280
	# PushParam _tmp68
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -280($fp)	# fill _tmp68 to $t0 from $fp-280
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# Goto endif_256
	  b endif_256		# unconditional branch
  else_255:
	# _tmp69 = *(computer)
	  lw $t0, -16($fp)	# fill computer to $t0 from $fp-16
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -284($fp)	# spill _tmp69 from $t2 to $fp-284
	# _tmp70 = *(_tmp69 + 12)
	  lw $t0, -284($fp)	# fill _tmp69 to $t0 from $fp-284
	  lw $t2, 12($t0) 	# load with offset
	  sw $t2, -288($fp)	# spill _tmp70 from $t2 to $fp-288
	# PushParam human
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -12($fp)	# fill human to $t0 from $fp-12
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam grid
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -8($fp)	# fill grid to $t0 from $fp-8
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam computer
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -16($fp)	# fill computer to $t0 from $fp-16
	  sw $t0, 4($sp)	# copy param value to stack
	# ACall _tmp70
	  lw $t0, -288($fp)	# fill _tmp70 to $t0 from $fp-288
	  jalr $t0            	# jump to function
	# PopParams 12
	  add $sp, $sp, 12	# pop params off stack
  endif_256:
  endif_254:
	# _tmp71 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -292($fp)	# spill _tmp71 from $t2 to $fp-292
	# _tmp72 = gameOver == _tmp71
	  lw $t0, -32($fp)	# fill gameOver to $t0 from $fp-32
	  lw $t1, -292($fp)	# fill _tmp71 to $t1 from $fp-292
	  seq $t2, $t0, $t1	
	  sw $t2, -296($fp)	# spill _tmp72 from $t2 to $fp-296
	# _tmp73 = *(grid)
	  lw $t0, -8($fp)	# fill grid to $t0 from $fp-8
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -300($fp)	# spill _tmp73 from $t2 to $fp-300
	# _tmp74 = *(_tmp73 + 20)
	  lw $t0, -300($fp)	# fill _tmp73 to $t0 from $fp-300
	  lw $t2, 20($t0) 	# load with offset
	  sw $t2, -304($fp)	# spill _tmp74 from $t2 to $fp-304
	# PushParam computer
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -16($fp)	# fill computer to $t0 from $fp-16
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam grid
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -8($fp)	# fill grid to $t0 from $fp-8
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp75 = ACall _tmp74
	  lw $t0, -304($fp)	# fill _tmp74 to $t0 from $fp-304
	  jalr $t0            	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -308($fp)	# spill _tmp75 from $t2 to $fp-308
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# _tmp76 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -312($fp)	# spill _tmp76 from $t2 to $fp-312
	# _tmp77 = _tmp75 == _tmp76
	  lw $t0, -308($fp)	# fill _tmp75 to $t0 from $fp-308
	  lw $t1, -312($fp)	# fill _tmp76 to $t1 from $fp-312
	  seq $t2, $t0, $t1	
	  sw $t2, -316($fp)	# spill _tmp77 from $t2 to $fp-316
	# _tmp78 = _tmp72 && _tmp77
	  lw $t0, -296($fp)	# fill _tmp72 to $t0 from $fp-296
	  lw $t1, -316($fp)	# fill _tmp77 to $t1 from $fp-316
	  and $t2, $t0, $t1	
	  sw $t2, -320($fp)	# spill _tmp78 from $t2 to $fp-320
	# IfZ _tmp78 Goto else_257
	  lw $t0, -320($fp)	# fill _tmp78 to $t0 from $fp-320
	  beqz $t0, else_257	# branch if _tmp78 is zero 
	# _tmp79 = "Loser -- the computer won!\n"
	  .data			# create string constant marked with label
	  _string186: .asciiz "Loser -- the computer won!\n"
	  .text
	  la $t2, _string186	# load label
	  sw $t2, -324($fp)	# spill _tmp79 from $t2 to $fp-324
	# PushParam _tmp79
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -324($fp)	# fill _tmp79 to $t0 from $fp-324
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp80 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -328($fp)	# spill _tmp80 from $t2 to $fp-328
	# gameOver = _tmp80
	  lw $t2, -328($fp)	# fill _tmp80 to $t2 from $fp-328
	  sw $t2, -32($fp)	# spill gameOver from $t2 to $fp-32
	# Goto endif_258
	  b endif_258		# unconditional branch
  else_257:
  endif_258:
	# Goto loopBegin_247
	  b loopBegin_247		# unconditional branch
  loopEnd_248:
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
