	# standard Decaf preamble 
	  .text
	  .align 2
	  .globl main
  _ReadArray:
	# BeginFunc 128
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 128	# decrement sp to make space for locals/temps
	# _tmp4 = "How many scores? "
	  .data			# create string constant marked with label
	  _string1: .asciiz "How many scores? "
	  .text
	  la $t2, _string1	# load label
	  sw $t2, -24($fp)	# spill _tmp4 from $t2 to $fp-24
	# PushParam _tmp4
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -24($fp)	# fill _tmp4 to $t0 from $fp-24
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp5 = LCall _ReadInteger
	  jal _ReadInteger   	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -28($fp)	# spill _tmp5 from $t2 to $fp-28
	# numScores = _tmp5
	  lw $t2, -28($fp)	# fill _tmp5 to $t2 from $fp-28
	  sw $t2, -20($fp)	# spill numScores from $t2 to $fp-20
	# _tmp6 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -32($fp)	# spill _tmp6 from $t2 to $fp-32
	# _tmp7 = numScores < _tmp6
	  lw $t0, -20($fp)	# fill numScores to $t0 from $fp-20
	  lw $t1, -32($fp)	# fill _tmp6 to $t1 from $fp-32
	  slt $t2, $t0, $t1	
	  sw $t2, -36($fp)	# spill _tmp7 from $t2 to $fp-36
	# IfZ _tmp7 Goto allocate_0
	  lw $t0, -36($fp)	# fill _tmp7 to $t0 from $fp-36
	  beqz $t0, allocate_0	# branch if _tmp7 is zero 
	# _tmp8 = "Decaf runtime error: Array size is <= 0\n"
	  .data			# create string constant marked with label
	  _string2: .asciiz "Decaf runtime error: Array size is <= 0\n"
	  .text
	  la $t2, _string2	# load label
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
  allocate_0:
	# _tmp9 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -44($fp)	# spill _tmp9 from $t2 to $fp-44
	# _tmp10 = numScores * _tmp9
	  lw $t0, -20($fp)	# fill numScores to $t0 from $fp-20
	  lw $t1, -44($fp)	# fill _tmp9 to $t1 from $fp-44
	  mul $t2, $t0, $t1	
	  sw $t2, -48($fp)	# spill _tmp10 from $t2 to $fp-48
	# _tmp11 = _tmp10 + _tmp9
	  lw $t0, -48($fp)	# fill _tmp10 to $t0 from $fp-48
	  lw $t1, -44($fp)	# fill _tmp9 to $t1 from $fp-44
	  add $t2, $t0, $t1	
	  sw $t2, -52($fp)	# spill _tmp11 from $t2 to $fp-52
	# PushParam _tmp11
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -52($fp)	# fill _tmp11 to $t0 from $fp-52
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp12 = LCall _Alloc
	  jal _Alloc         	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -56($fp)	# spill _tmp12 from $t2 to $fp-56
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# *(_tmp12) = numScores
	  lw $t0, -20($fp)	# fill numScores to $t0 from $fp-20
	  lw $t2, -56($fp)	# fill _tmp12 to $t2 from $fp-56
	  sw $t0, 0($t2) 	# store with offset
	# arr = _tmp12
	  lw $t2, -56($fp)	# fill _tmp12 to $t2 from $fp-56
	  sw $t2, -16($fp)	# spill arr from $t2 to $fp-16
	# _tmp13 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -60($fp)	# spill _tmp13 from $t2 to $fp-60
	# i = _tmp13
	  lw $t2, -60($fp)	# fill _tmp13 to $t2 from $fp-60
	  sw $t2, -8($fp)	# spill i from $t2 to $fp-8
  loopBegin_1:
	# _tmp14 = *(arr)
	  lw $t0, -16($fp)	# fill arr to $t0 from $fp-16
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -64($fp)	# spill _tmp14 from $t2 to $fp-64
	# _tmp15 = i < _tmp14
	  lw $t0, -8($fp)	# fill i to $t0 from $fp-8
	  lw $t1, -64($fp)	# fill _tmp14 to $t1 from $fp-64
	  slt $t2, $t0, $t1	
	  sw $t2, -68($fp)	# spill _tmp15 from $t2 to $fp-68
	# IfZ _tmp15 Goto loopEnd_2
	  lw $t0, -68($fp)	# fill _tmp15 to $t0 from $fp-68
	  beqz $t0, loopEnd_2	# branch if _tmp15 is zero 
	# _tmp16 = "Enter next number: "
	  .data			# create string constant marked with label
	  _string3: .asciiz "Enter next number: "
	  .text
	  la $t2, _string3	# load label
	  sw $t2, -72($fp)	# spill _tmp16 from $t2 to $fp-72
	# PushParam _tmp16
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -72($fp)	# fill _tmp16 to $t0 from $fp-72
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp17 = LCall _ReadInteger
	  jal _ReadInteger   	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -76($fp)	# spill _tmp17 from $t2 to $fp-76
	# num = _tmp17
	  lw $t2, -76($fp)	# fill _tmp17 to $t2 from $fp-76
	  sw $t2, -12($fp)	# spill num from $t2 to $fp-12
	# _tmp18 = *(arr)
	  lw $t0, -16($fp)	# fill arr to $t0 from $fp-16
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
	# IfZ _tmp24 Goto arrayAcc_3
	  lw $t0, -104($fp)	# fill _tmp24 to $t0 from $fp-104
	  beqz $t0, arrayAcc_3	# branch if _tmp24 is zero 
	# _tmp25 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string4: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string4	# load label
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
  arrayAcc_3:
	# _tmp26 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -112($fp)	# spill _tmp26 from $t2 to $fp-112
	# _tmp27 = i * _tmp26
	  lw $t0, -8($fp)	# fill i to $t0 from $fp-8
	  lw $t1, -112($fp)	# fill _tmp26 to $t1 from $fp-112
	  mul $t2, $t0, $t1	
	  sw $t2, -116($fp)	# spill _tmp27 from $t2 to $fp-116
	# _tmp28 = arr + _tmp27
	  lw $t0, -16($fp)	# fill arr to $t0 from $fp-16
	  lw $t1, -116($fp)	# fill _tmp27 to $t1 from $fp-116
	  add $t2, $t0, $t1	
	  sw $t2, -120($fp)	# spill _tmp28 from $t2 to $fp-120
	# _tmp29 = _tmp28 + _tmp26
	  lw $t0, -120($fp)	# fill _tmp28 to $t0 from $fp-120
	  lw $t1, -112($fp)	# fill _tmp26 to $t1 from $fp-112
	  add $t2, $t0, $t1	
	  sw $t2, -124($fp)	# spill _tmp29 from $t2 to $fp-124
	# *(_tmp29) = num
	  lw $t0, -12($fp)	# fill num to $t0 from $fp-12
	  lw $t2, -124($fp)	# fill _tmp29 to $t2 from $fp-124
	  sw $t0, 0($t2) 	# store with offset
	# _tmp30 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -128($fp)	# spill _tmp30 from $t2 to $fp-128
	# _tmp31 = i + _tmp30
	  lw $t0, -8($fp)	# fill i to $t0 from $fp-8
	  lw $t1, -128($fp)	# fill _tmp30 to $t1 from $fp-128
	  add $t2, $t0, $t1	
	  sw $t2, -132($fp)	# spill _tmp31 from $t2 to $fp-132
	# i = _tmp31
	  lw $t2, -132($fp)	# fill _tmp31 to $t2 from $fp-132
	  sw $t2, -8($fp)	# spill i from $t2 to $fp-8
	# Goto loopBegin_1
	  b loopBegin_1		# unconditional branch
  loopEnd_2:
	# Return arr
	  lw $t2, -16($fp)	# fill arr to $t2 from $fp-16
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
  _Sort:
	# BeginFunc 344
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 344	# decrement sp to make space for locals/temps
	# _tmp3 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -20($fp)	# spill _tmp3 from $t2 to $fp-20
	# i = _tmp3
	  lw $t2, -20($fp)	# fill _tmp3 to $t2 from $fp-20
	  sw $t2, -8($fp)	# spill i from $t2 to $fp-8
  loopBegin_4:
	# _tmp4 = *(arr)
	  lw $t0, 4($fp)	# fill arr to $t0 from $fp+4
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -24($fp)	# spill _tmp4 from $t2 to $fp-24
	# _tmp5 = i < _tmp4
	  lw $t0, -8($fp)	# fill i to $t0 from $fp-8
	  lw $t1, -24($fp)	# fill _tmp4 to $t1 from $fp-24
	  slt $t2, $t0, $t1	
	  sw $t2, -28($fp)	# spill _tmp5 from $t2 to $fp-28
	# IfZ _tmp5 Goto loopEnd_5
	  lw $t0, -28($fp)	# fill _tmp5 to $t0 from $fp-28
	  beqz $t0, loopEnd_5	# branch if _tmp5 is zero 
	# _tmp6 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -32($fp)	# spill _tmp6 from $t2 to $fp-32
	# _tmp7 = i - _tmp6
	  lw $t0, -8($fp)	# fill i to $t0 from $fp-8
	  lw $t1, -32($fp)	# fill _tmp6 to $t1 from $fp-32
	  sub $t2, $t0, $t1	
	  sw $t2, -36($fp)	# spill _tmp7 from $t2 to $fp-36
	# j = _tmp7
	  lw $t2, -36($fp)	# fill _tmp7 to $t2 from $fp-36
	  sw $t2, -12($fp)	# spill j from $t2 to $fp-12
	# _tmp8 = *(arr)
	  lw $t0, 4($fp)	# fill arr to $t0 from $fp+4
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -40($fp)	# spill _tmp8 from $t2 to $fp-40
	# _tmp9 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -44($fp)	# spill _tmp9 from $t2 to $fp-44
	# _tmp10 = i < _tmp9
	  lw $t0, -8($fp)	# fill i to $t0 from $fp-8
	  lw $t1, -44($fp)	# fill _tmp9 to $t1 from $fp-44
	  slt $t2, $t0, $t1	
	  sw $t2, -48($fp)	# spill _tmp10 from $t2 to $fp-48
	# _tmp11 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -52($fp)	# spill _tmp11 from $t2 to $fp-52
	# _tmp12 = _tmp8 - _tmp11
	  lw $t0, -40($fp)	# fill _tmp8 to $t0 from $fp-40
	  lw $t1, -52($fp)	# fill _tmp11 to $t1 from $fp-52
	  sub $t2, $t0, $t1	
	  sw $t2, -56($fp)	# spill _tmp12 from $t2 to $fp-56
	# _tmp13 = _tmp12 < i
	  lw $t0, -56($fp)	# fill _tmp12 to $t0 from $fp-56
	  lw $t1, -8($fp)	# fill i to $t1 from $fp-8
	  slt $t2, $t0, $t1	
	  sw $t2, -60($fp)	# spill _tmp13 from $t2 to $fp-60
	# _tmp14 = _tmp10 || _tmp13
	  lw $t0, -48($fp)	# fill _tmp10 to $t0 from $fp-48
	  lw $t1, -60($fp)	# fill _tmp13 to $t1 from $fp-60
	  or $t2, $t0, $t1	
	  sw $t2, -64($fp)	# spill _tmp14 from $t2 to $fp-64
	# IfZ _tmp14 Goto arrayAcc_6
	  lw $t0, -64($fp)	# fill _tmp14 to $t0 from $fp-64
	  beqz $t0, arrayAcc_6	# branch if _tmp14 is zero 
	# _tmp15 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string5: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string5	# load label
	  sw $t2, -68($fp)	# spill _tmp15 from $t2 to $fp-68
	# PushParam _tmp15
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -68($fp)	# fill _tmp15 to $t0 from $fp-68
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_6:
	# _tmp16 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -72($fp)	# spill _tmp16 from $t2 to $fp-72
	# _tmp17 = i * _tmp16
	  lw $t0, -8($fp)	# fill i to $t0 from $fp-8
	  lw $t1, -72($fp)	# fill _tmp16 to $t1 from $fp-72
	  mul $t2, $t0, $t1	
	  sw $t2, -76($fp)	# spill _tmp17 from $t2 to $fp-76
	# _tmp18 = arr + _tmp17
	  lw $t0, 4($fp)	# fill arr to $t0 from $fp+4
	  lw $t1, -76($fp)	# fill _tmp17 to $t1 from $fp-76
	  add $t2, $t0, $t1	
	  sw $t2, -80($fp)	# spill _tmp18 from $t2 to $fp-80
	# _tmp19 = _tmp18 + _tmp16
	  lw $t0, -80($fp)	# fill _tmp18 to $t0 from $fp-80
	  lw $t1, -72($fp)	# fill _tmp16 to $t1 from $fp-72
	  add $t2, $t0, $t1	
	  sw $t2, -84($fp)	# spill _tmp19 from $t2 to $fp-84
	# _tmp20 = *(_tmp19)
	  lw $t0, -84($fp)	# fill _tmp19 to $t0 from $fp-84
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -88($fp)	# spill _tmp20 from $t2 to $fp-88
	# val = _tmp20
	  lw $t2, -88($fp)	# fill _tmp20 to $t2 from $fp-88
	  sw $t2, -16($fp)	# spill val from $t2 to $fp-16
  loopBegin_7:
	# _tmp21 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -92($fp)	# spill _tmp21 from $t2 to $fp-92
	# _tmp22 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -96($fp)	# spill _tmp22 from $t2 to $fp-96
	# _tmp23 = _tmp21 - _tmp22
	  lw $t0, -92($fp)	# fill _tmp21 to $t0 from $fp-92
	  lw $t1, -96($fp)	# fill _tmp22 to $t1 from $fp-96
	  sub $t2, $t0, $t1	
	  sw $t2, -100($fp)	# spill _tmp23 from $t2 to $fp-100
	# _tmp24 = _tmp23 < j
	  lw $t0, -100($fp)	# fill _tmp23 to $t0 from $fp-100
	  lw $t1, -12($fp)	# fill j to $t1 from $fp-12
	  slt $t2, $t0, $t1	
	  sw $t2, -104($fp)	# spill _tmp24 from $t2 to $fp-104
	# IfZ _tmp24 Goto loopEnd_8
	  lw $t0, -104($fp)	# fill _tmp24 to $t0 from $fp-104
	  beqz $t0, loopEnd_8	# branch if _tmp24 is zero 
	# _tmp25 = *(arr)
	  lw $t0, 4($fp)	# fill arr to $t0 from $fp+4
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -108($fp)	# spill _tmp25 from $t2 to $fp-108
	# _tmp26 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -112($fp)	# spill _tmp26 from $t2 to $fp-112
	# _tmp27 = j < _tmp26
	  lw $t0, -12($fp)	# fill j to $t0 from $fp-12
	  lw $t1, -112($fp)	# fill _tmp26 to $t1 from $fp-112
	  slt $t2, $t0, $t1	
	  sw $t2, -116($fp)	# spill _tmp27 from $t2 to $fp-116
	# _tmp28 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -120($fp)	# spill _tmp28 from $t2 to $fp-120
	# _tmp29 = _tmp25 - _tmp28
	  lw $t0, -108($fp)	# fill _tmp25 to $t0 from $fp-108
	  lw $t1, -120($fp)	# fill _tmp28 to $t1 from $fp-120
	  sub $t2, $t0, $t1	
	  sw $t2, -124($fp)	# spill _tmp29 from $t2 to $fp-124
	# _tmp30 = _tmp29 < j
	  lw $t0, -124($fp)	# fill _tmp29 to $t0 from $fp-124
	  lw $t1, -12($fp)	# fill j to $t1 from $fp-12
	  slt $t2, $t0, $t1	
	  sw $t2, -128($fp)	# spill _tmp30 from $t2 to $fp-128
	# _tmp31 = _tmp27 || _tmp30
	  lw $t0, -116($fp)	# fill _tmp27 to $t0 from $fp-116
	  lw $t1, -128($fp)	# fill _tmp30 to $t1 from $fp-128
	  or $t2, $t0, $t1	
	  sw $t2, -132($fp)	# spill _tmp31 from $t2 to $fp-132
	# IfZ _tmp31 Goto arrayAcc_9
	  lw $t0, -132($fp)	# fill _tmp31 to $t0 from $fp-132
	  beqz $t0, arrayAcc_9	# branch if _tmp31 is zero 
	# _tmp32 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string6: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string6	# load label
	  sw $t2, -136($fp)	# spill _tmp32 from $t2 to $fp-136
	# PushParam _tmp32
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -136($fp)	# fill _tmp32 to $t0 from $fp-136
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_9:
	# _tmp33 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -140($fp)	# spill _tmp33 from $t2 to $fp-140
	# _tmp34 = j * _tmp33
	  lw $t0, -12($fp)	# fill j to $t0 from $fp-12
	  lw $t1, -140($fp)	# fill _tmp33 to $t1 from $fp-140
	  mul $t2, $t0, $t1	
	  sw $t2, -144($fp)	# spill _tmp34 from $t2 to $fp-144
	# _tmp35 = arr + _tmp34
	  lw $t0, 4($fp)	# fill arr to $t0 from $fp+4
	  lw $t1, -144($fp)	# fill _tmp34 to $t1 from $fp-144
	  add $t2, $t0, $t1	
	  sw $t2, -148($fp)	# spill _tmp35 from $t2 to $fp-148
	# _tmp36 = _tmp35 + _tmp33
	  lw $t0, -148($fp)	# fill _tmp35 to $t0 from $fp-148
	  lw $t1, -140($fp)	# fill _tmp33 to $t1 from $fp-140
	  add $t2, $t0, $t1	
	  sw $t2, -152($fp)	# spill _tmp36 from $t2 to $fp-152
	# _tmp37 = *(_tmp36)
	  lw $t0, -152($fp)	# fill _tmp36 to $t0 from $fp-152
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -156($fp)	# spill _tmp37 from $t2 to $fp-156
	# _tmp38 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -160($fp)	# spill _tmp38 from $t2 to $fp-160
	# _tmp39 = _tmp37 - _tmp38
	  lw $t0, -156($fp)	# fill _tmp37 to $t0 from $fp-156
	  lw $t1, -160($fp)	# fill _tmp38 to $t1 from $fp-160
	  sub $t2, $t0, $t1	
	  sw $t2, -164($fp)	# spill _tmp39 from $t2 to $fp-164
	# _tmp40 = _tmp39 < val
	  lw $t0, -164($fp)	# fill _tmp39 to $t0 from $fp-164
	  lw $t1, -16($fp)	# fill val to $t1 from $fp-16
	  slt $t2, $t0, $t1	
	  sw $t2, -168($fp)	# spill _tmp40 from $t2 to $fp-168
	# IfZ _tmp40 Goto else_10
	  lw $t0, -168($fp)	# fill _tmp40 to $t0 from $fp-168
	  beqz $t0, else_10	# branch if _tmp40 is zero 
	# Goto loopEnd_8
	  b loopEnd_8		# unconditional branch
	# Goto endif_11
	  b endif_11		# unconditional branch
  else_10:
  endif_11:
	# _tmp41 = *(arr)
	  lw $t0, 4($fp)	# fill arr to $t0 from $fp+4
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -172($fp)	# spill _tmp41 from $t2 to $fp-172
	# _tmp42 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -176($fp)	# spill _tmp42 from $t2 to $fp-176
	# _tmp43 = j < _tmp42
	  lw $t0, -12($fp)	# fill j to $t0 from $fp-12
	  lw $t1, -176($fp)	# fill _tmp42 to $t1 from $fp-176
	  slt $t2, $t0, $t1	
	  sw $t2, -180($fp)	# spill _tmp43 from $t2 to $fp-180
	# _tmp44 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -184($fp)	# spill _tmp44 from $t2 to $fp-184
	# _tmp45 = _tmp41 - _tmp44
	  lw $t0, -172($fp)	# fill _tmp41 to $t0 from $fp-172
	  lw $t1, -184($fp)	# fill _tmp44 to $t1 from $fp-184
	  sub $t2, $t0, $t1	
	  sw $t2, -188($fp)	# spill _tmp45 from $t2 to $fp-188
	# _tmp46 = _tmp45 < j
	  lw $t0, -188($fp)	# fill _tmp45 to $t0 from $fp-188
	  lw $t1, -12($fp)	# fill j to $t1 from $fp-12
	  slt $t2, $t0, $t1	
	  sw $t2, -192($fp)	# spill _tmp46 from $t2 to $fp-192
	# _tmp47 = _tmp43 || _tmp46
	  lw $t0, -180($fp)	# fill _tmp43 to $t0 from $fp-180
	  lw $t1, -192($fp)	# fill _tmp46 to $t1 from $fp-192
	  or $t2, $t0, $t1	
	  sw $t2, -196($fp)	# spill _tmp47 from $t2 to $fp-196
	# IfZ _tmp47 Goto arrayAcc_12
	  lw $t0, -196($fp)	# fill _tmp47 to $t0 from $fp-196
	  beqz $t0, arrayAcc_12	# branch if _tmp47 is zero 
	# _tmp48 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string7: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string7	# load label
	  sw $t2, -200($fp)	# spill _tmp48 from $t2 to $fp-200
	# PushParam _tmp48
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -200($fp)	# fill _tmp48 to $t0 from $fp-200
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_12:
	# _tmp49 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -204($fp)	# spill _tmp49 from $t2 to $fp-204
	# _tmp50 = j * _tmp49
	  lw $t0, -12($fp)	# fill j to $t0 from $fp-12
	  lw $t1, -204($fp)	# fill _tmp49 to $t1 from $fp-204
	  mul $t2, $t0, $t1	
	  sw $t2, -208($fp)	# spill _tmp50 from $t2 to $fp-208
	# _tmp51 = arr + _tmp50
	  lw $t0, 4($fp)	# fill arr to $t0 from $fp+4
	  lw $t1, -208($fp)	# fill _tmp50 to $t1 from $fp-208
	  add $t2, $t0, $t1	
	  sw $t2, -212($fp)	# spill _tmp51 from $t2 to $fp-212
	# _tmp52 = _tmp51 + _tmp49
	  lw $t0, -212($fp)	# fill _tmp51 to $t0 from $fp-212
	  lw $t1, -204($fp)	# fill _tmp49 to $t1 from $fp-204
	  add $t2, $t0, $t1	
	  sw $t2, -216($fp)	# spill _tmp52 from $t2 to $fp-216
	# _tmp53 = *(_tmp52)
	  lw $t0, -216($fp)	# fill _tmp52 to $t0 from $fp-216
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -220($fp)	# spill _tmp53 from $t2 to $fp-220
	# _tmp54 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -224($fp)	# spill _tmp54 from $t2 to $fp-224
	# _tmp55 = j + _tmp54
	  lw $t0, -12($fp)	# fill j to $t0 from $fp-12
	  lw $t1, -224($fp)	# fill _tmp54 to $t1 from $fp-224
	  add $t2, $t0, $t1	
	  sw $t2, -228($fp)	# spill _tmp55 from $t2 to $fp-228
	# _tmp56 = *(arr)
	  lw $t0, 4($fp)	# fill arr to $t0 from $fp+4
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
	# IfZ _tmp62 Goto arrayAcc_13
	  lw $t0, -256($fp)	# fill _tmp62 to $t0 from $fp-256
	  beqz $t0, arrayAcc_13	# branch if _tmp62 is zero 
	# _tmp63 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string8: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string8	# load label
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
  arrayAcc_13:
	# _tmp64 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -264($fp)	# spill _tmp64 from $t2 to $fp-264
	# _tmp65 = _tmp55 * _tmp64
	  lw $t0, -228($fp)	# fill _tmp55 to $t0 from $fp-228
	  lw $t1, -264($fp)	# fill _tmp64 to $t1 from $fp-264
	  mul $t2, $t0, $t1	
	  sw $t2, -268($fp)	# spill _tmp65 from $t2 to $fp-268
	# _tmp66 = arr + _tmp65
	  lw $t0, 4($fp)	# fill arr to $t0 from $fp+4
	  lw $t1, -268($fp)	# fill _tmp65 to $t1 from $fp-268
	  add $t2, $t0, $t1	
	  sw $t2, -272($fp)	# spill _tmp66 from $t2 to $fp-272
	# _tmp67 = _tmp66 + _tmp64
	  lw $t0, -272($fp)	# fill _tmp66 to $t0 from $fp-272
	  lw $t1, -264($fp)	# fill _tmp64 to $t1 from $fp-264
	  add $t2, $t0, $t1	
	  sw $t2, -276($fp)	# spill _tmp67 from $t2 to $fp-276
	# *(_tmp67) = _tmp53
	  lw $t0, -220($fp)	# fill _tmp53 to $t0 from $fp-220
	  lw $t2, -276($fp)	# fill _tmp67 to $t2 from $fp-276
	  sw $t0, 0($t2) 	# store with offset
	# _tmp68 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -280($fp)	# spill _tmp68 from $t2 to $fp-280
	# _tmp69 = j - _tmp68
	  lw $t0, -12($fp)	# fill j to $t0 from $fp-12
	  lw $t1, -280($fp)	# fill _tmp68 to $t1 from $fp-280
	  sub $t2, $t0, $t1	
	  sw $t2, -284($fp)	# spill _tmp69 from $t2 to $fp-284
	# j = _tmp69
	  lw $t2, -284($fp)	# fill _tmp69 to $t2 from $fp-284
	  sw $t2, -12($fp)	# spill j from $t2 to $fp-12
	# Goto loopBegin_7
	  b loopBegin_7		# unconditional branch
  loopEnd_8:
	# _tmp70 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -288($fp)	# spill _tmp70 from $t2 to $fp-288
	# _tmp71 = j + _tmp70
	  lw $t0, -12($fp)	# fill j to $t0 from $fp-12
	  lw $t1, -288($fp)	# fill _tmp70 to $t1 from $fp-288
	  add $t2, $t0, $t1	
	  sw $t2, -292($fp)	# spill _tmp71 from $t2 to $fp-292
	# _tmp72 = *(arr)
	  lw $t0, 4($fp)	# fill arr to $t0 from $fp+4
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -296($fp)	# spill _tmp72 from $t2 to $fp-296
	# _tmp73 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -300($fp)	# spill _tmp73 from $t2 to $fp-300
	# _tmp74 = _tmp71 < _tmp73
	  lw $t0, -292($fp)	# fill _tmp71 to $t0 from $fp-292
	  lw $t1, -300($fp)	# fill _tmp73 to $t1 from $fp-300
	  slt $t2, $t0, $t1	
	  sw $t2, -304($fp)	# spill _tmp74 from $t2 to $fp-304
	# _tmp75 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -308($fp)	# spill _tmp75 from $t2 to $fp-308
	# _tmp76 = _tmp72 - _tmp75
	  lw $t0, -296($fp)	# fill _tmp72 to $t0 from $fp-296
	  lw $t1, -308($fp)	# fill _tmp75 to $t1 from $fp-308
	  sub $t2, $t0, $t1	
	  sw $t2, -312($fp)	# spill _tmp76 from $t2 to $fp-312
	# _tmp77 = _tmp76 < _tmp71
	  lw $t0, -312($fp)	# fill _tmp76 to $t0 from $fp-312
	  lw $t1, -292($fp)	# fill _tmp71 to $t1 from $fp-292
	  slt $t2, $t0, $t1	
	  sw $t2, -316($fp)	# spill _tmp77 from $t2 to $fp-316
	# _tmp78 = _tmp74 || _tmp77
	  lw $t0, -304($fp)	# fill _tmp74 to $t0 from $fp-304
	  lw $t1, -316($fp)	# fill _tmp77 to $t1 from $fp-316
	  or $t2, $t0, $t1	
	  sw $t2, -320($fp)	# spill _tmp78 from $t2 to $fp-320
	# IfZ _tmp78 Goto arrayAcc_14
	  lw $t0, -320($fp)	# fill _tmp78 to $t0 from $fp-320
	  beqz $t0, arrayAcc_14	# branch if _tmp78 is zero 
	# _tmp79 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string9: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string9	# load label
	  sw $t2, -324($fp)	# spill _tmp79 from $t2 to $fp-324
	# PushParam _tmp79
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -324($fp)	# fill _tmp79 to $t0 from $fp-324
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_14:
	# _tmp80 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -328($fp)	# spill _tmp80 from $t2 to $fp-328
	# _tmp81 = _tmp71 * _tmp80
	  lw $t0, -292($fp)	# fill _tmp71 to $t0 from $fp-292
	  lw $t1, -328($fp)	# fill _tmp80 to $t1 from $fp-328
	  mul $t2, $t0, $t1	
	  sw $t2, -332($fp)	# spill _tmp81 from $t2 to $fp-332
	# _tmp82 = arr + _tmp81
	  lw $t0, 4($fp)	# fill arr to $t0 from $fp+4
	  lw $t1, -332($fp)	# fill _tmp81 to $t1 from $fp-332
	  add $t2, $t0, $t1	
	  sw $t2, -336($fp)	# spill _tmp82 from $t2 to $fp-336
	# _tmp83 = _tmp82 + _tmp80
	  lw $t0, -336($fp)	# fill _tmp82 to $t0 from $fp-336
	  lw $t1, -328($fp)	# fill _tmp80 to $t1 from $fp-328
	  add $t2, $t0, $t1	
	  sw $t2, -340($fp)	# spill _tmp83 from $t2 to $fp-340
	# *(_tmp83) = val
	  lw $t0, -16($fp)	# fill val to $t0 from $fp-16
	  lw $t2, -340($fp)	# fill _tmp83 to $t2 from $fp-340
	  sw $t0, 0($t2) 	# store with offset
	# _tmp84 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -344($fp)	# spill _tmp84 from $t2 to $fp-344
	# _tmp85 = i + _tmp84
	  lw $t0, -8($fp)	# fill i to $t0 from $fp-8
	  lw $t1, -344($fp)	# fill _tmp84 to $t1 from $fp-344
	  add $t2, $t0, $t1	
	  sw $t2, -348($fp)	# spill _tmp85 from $t2 to $fp-348
	# i = _tmp85
	  lw $t2, -348($fp)	# fill _tmp85 to $t2 from $fp-348
	  sw $t2, -8($fp)	# spill i from $t2 to $fp-8
	# Goto loopBegin_4
	  b loopBegin_4		# unconditional branch
  loopEnd_5:
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  _PrintArray:
	# BeginFunc 88
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 88	# decrement sp to make space for locals/temps
	# _tmp1 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -12($fp)	# spill _tmp1 from $t2 to $fp-12
	# i = _tmp1
	  lw $t2, -12($fp)	# fill _tmp1 to $t2 from $fp-12
	  sw $t2, -8($fp)	# spill i from $t2 to $fp-8
	# _tmp2 = "Sorted results: "
	  .data			# create string constant marked with label
	  _string10: .asciiz "Sorted results: "
	  .text
	  la $t2, _string10	# load label
	  sw $t2, -16($fp)	# spill _tmp2 from $t2 to $fp-16
	# PushParam _tmp2
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -16($fp)	# fill _tmp2 to $t0 from $fp-16
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
  loopBegin_15:
	# _tmp3 = *(arr)
	  lw $t0, 4($fp)	# fill arr to $t0 from $fp+4
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -20($fp)	# spill _tmp3 from $t2 to $fp-20
	# _tmp4 = i < _tmp3
	  lw $t0, -8($fp)	# fill i to $t0 from $fp-8
	  lw $t1, -20($fp)	# fill _tmp3 to $t1 from $fp-20
	  slt $t2, $t0, $t1	
	  sw $t2, -24($fp)	# spill _tmp4 from $t2 to $fp-24
	# IfZ _tmp4 Goto loopEnd_16
	  lw $t0, -24($fp)	# fill _tmp4 to $t0 from $fp-24
	  beqz $t0, loopEnd_16	# branch if _tmp4 is zero 
	# _tmp5 = *(arr)
	  lw $t0, 4($fp)	# fill arr to $t0 from $fp+4
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -28($fp)	# spill _tmp5 from $t2 to $fp-28
	# _tmp6 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -32($fp)	# spill _tmp6 from $t2 to $fp-32
	# _tmp7 = i < _tmp6
	  lw $t0, -8($fp)	# fill i to $t0 from $fp-8
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
	# _tmp10 = _tmp9 < i
	  lw $t0, -44($fp)	# fill _tmp9 to $t0 from $fp-44
	  lw $t1, -8($fp)	# fill i to $t1 from $fp-8
	  slt $t2, $t0, $t1	
	  sw $t2, -48($fp)	# spill _tmp10 from $t2 to $fp-48
	# _tmp11 = _tmp7 || _tmp10
	  lw $t0, -36($fp)	# fill _tmp7 to $t0 from $fp-36
	  lw $t1, -48($fp)	# fill _tmp10 to $t1 from $fp-48
	  or $t2, $t0, $t1	
	  sw $t2, -52($fp)	# spill _tmp11 from $t2 to $fp-52
	# IfZ _tmp11 Goto arrayAcc_17
	  lw $t0, -52($fp)	# fill _tmp11 to $t0 from $fp-52
	  beqz $t0, arrayAcc_17	# branch if _tmp11 is zero 
	# _tmp12 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string11: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string11	# load label
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
  arrayAcc_17:
	# _tmp13 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -60($fp)	# spill _tmp13 from $t2 to $fp-60
	# _tmp14 = i * _tmp13
	  lw $t0, -8($fp)	# fill i to $t0 from $fp-8
	  lw $t1, -60($fp)	# fill _tmp13 to $t1 from $fp-60
	  mul $t2, $t0, $t1	
	  sw $t2, -64($fp)	# spill _tmp14 from $t2 to $fp-64
	# _tmp15 = arr + _tmp14
	  lw $t0, 4($fp)	# fill arr to $t0 from $fp+4
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
	  _string12: .asciiz " "
	  .text
	  la $t2, _string12	# load label
	  sw $t2, -80($fp)	# spill _tmp18 from $t2 to $fp-80
	# PushParam _tmp18
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -80($fp)	# fill _tmp18 to $t0 from $fp-80
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp19 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -84($fp)	# spill _tmp19 from $t2 to $fp-84
	# _tmp20 = i + _tmp19
	  lw $t0, -8($fp)	# fill i to $t0 from $fp-8
	  lw $t1, -84($fp)	# fill _tmp19 to $t1 from $fp-84
	  add $t2, $t0, $t1	
	  sw $t2, -88($fp)	# spill _tmp20 from $t2 to $fp-88
	# i = _tmp20
	  lw $t2, -88($fp)	# fill _tmp20 to $t2 from $fp-88
	  sw $t2, -8($fp)	# spill i from $t2 to $fp-8
	# Goto loopBegin_15
	  b loopBegin_15		# unconditional branch
  loopEnd_16:
	# _tmp21 = "\n"
	  .data			# create string constant marked with label
	  _string13: .asciiz "\n"
	  .text
	  la $t2, _string13	# load label
	  sw $t2, -92($fp)	# spill _tmp21 from $t2 to $fp-92
	# PushParam _tmp21
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -92($fp)	# fill _tmp21 to $t0 from $fp-92
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
	# BeginFunc 16
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 16	# decrement sp to make space for locals/temps
	# _tmp1 = "\nThis program will read in a bunch of numbers an..."
	  .data			# create string constant marked with label
	  _string14: .asciiz "\nThis program will read in a bunch of numbers and print them\n"
	  .text
	  la $t2, _string14	# load label
	  sw $t2, -12($fp)	# spill _tmp1 from $t2 to $fp-12
	# PushParam _tmp1
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -12($fp)	# fill _tmp1 to $t0 from $fp-12
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp2 = "back out in sorted order.\n\n"
	  .data			# create string constant marked with label
	  _string15: .asciiz "back out in sorted order.\n\n"
	  .text
	  la $t2, _string15	# load label
	  sw $t2, -16($fp)	# spill _tmp2 from $t2 to $fp-16
	# PushParam _tmp2
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -16($fp)	# fill _tmp2 to $t0 from $fp-16
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp3 = LCall _ReadArray
	  jal _ReadArray     	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -20($fp)	# spill _tmp3 from $t2 to $fp-20
	# arr = _tmp3
	  lw $t2, -20($fp)	# fill _tmp3 to $t2 from $fp-20
	  sw $t2, -8($fp)	# spill arr from $t2 to $fp-8
	# PushParam arr
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -8($fp)	# fill arr to $t0 from $fp-8
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _Sort
	  jal _Sort          	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# PushParam arr
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -8($fp)	# fill arr to $t0 from $fp-8
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintArray
	  jal _PrintArray    	# jump to function
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
	beqz $t5, eloop3
	addi $t3, 1
	addi $t0, 1
	addi $t1, 1
	#bne $t3,$t4,bloop3
	b bloop3
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
SPACE2:.asciiz "AAA.\n"
