	# standard Decaf preamble 
	  .text
	  .align 2
	  .globl main
  main:
	# BeginFunc 124
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 124	# decrement sp to make space for locals/temps
	# _tmp3 = "Enter array size: "
	  .data			# create string constant marked with label
	  _string1: .asciiz "Enter array size: "
	  .text
	  la $t2, _string1	# load label
	  sw $t2, -24($fp)	# spill _tmp3 from $t2 to $fp-24
	# PushParam _tmp3
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -24($fp)	# fill _tmp3 to $t0 from $fp-24
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp4 = LCall _ReadInteger
	  jal _ReadInteger   	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -28($fp)	# spill _tmp4 from $t2 to $fp-28
	# size = _tmp4
	  lw $t2, -28($fp)	# fill _tmp4 to $t2 from $fp-28
	  sw $t2, -12($fp)	# spill size from $t2 to $fp-12
	# _tmp5 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -32($fp)	# spill _tmp5 from $t2 to $fp-32
	# _tmp6 = size < _tmp5
	  lw $t0, -12($fp)	# fill size to $t0 from $fp-12
	  lw $t1, -32($fp)	# fill _tmp5 to $t1 from $fp-32
	  slt $t2, $t0, $t1	
	  sw $t2, -36($fp)	# spill _tmp6 from $t2 to $fp-36
	# IfZ _tmp6 Goto allocate_0
	  lw $t0, -36($fp)	# fill _tmp6 to $t0 from $fp-36
	  beqz $t0, allocate_0	# branch if _tmp6 is zero 
	# _tmp7 = "Decaf runtime error: Array size is <= 0\n"
	  .data			# create string constant marked with label
	  _string2: .asciiz "Decaf runtime error: Array size is <= 0\n"
	  .text
	  la $t2, _string2	# load label
	  sw $t2, -40($fp)	# spill _tmp7 from $t2 to $fp-40
	# PushParam _tmp7
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -40($fp)	# fill _tmp7 to $t0 from $fp-40
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  allocate_0:
	# _tmp8 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -44($fp)	# spill _tmp8 from $t2 to $fp-44
	# _tmp9 = size * _tmp8
	  lw $t0, -12($fp)	# fill size to $t0 from $fp-12
	  lw $t1, -44($fp)	# fill _tmp8 to $t1 from $fp-44
	  mul $t2, $t0, $t1	
	  sw $t2, -48($fp)	# spill _tmp9 from $t2 to $fp-48
	# _tmp10 = _tmp9 + _tmp8
	  lw $t0, -48($fp)	# fill _tmp9 to $t0 from $fp-48
	  lw $t1, -44($fp)	# fill _tmp8 to $t1 from $fp-44
	  add $t2, $t0, $t1	
	  sw $t2, -52($fp)	# spill _tmp10 from $t2 to $fp-52
	# PushParam _tmp10
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -52($fp)	# fill _tmp10 to $t0 from $fp-52
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp11 = LCall _Alloc
	  jal _Alloc         	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -56($fp)	# spill _tmp11 from $t2 to $fp-56
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# *(_tmp11) = size
	  lw $t0, -12($fp)	# fill size to $t0 from $fp-12
	  lw $t2, -56($fp)	# fill _tmp11 to $t2 from $fp-56
	  sw $t0, 0($t2) 	# store with offset
	# array = _tmp11
	  lw $t2, -56($fp)	# fill _tmp11 to $t2 from $fp-56
	  sw $t2, -8($fp)	# spill array from $t2 to $fp-8
	# PushParam size
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -12($fp)	# fill size to $t0 from $fp-12
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam array
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -8($fp)	# fill array to $t0 from $fp-8
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _populateArray
	  jal _populateArray 	# jump to function
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# _tmp12 = "allocation successful\n"
	  .data			# create string constant marked with label
	  _string3: .asciiz "allocation successful\n"
	  .text
	  la $t2, _string3	# load label
	  sw $t2, -60($fp)	# spill _tmp12 from $t2 to $fp-60
	# PushParam _tmp12
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -60($fp)	# fill _tmp12 to $t0 from $fp-60
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
  loopBegin_1:
	# _tmp13 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -64($fp)	# spill _tmp13 from $t2 to $fp-64
	# IfZ _tmp13 Goto loopEnd_2
	  lw $t0, -64($fp)	# fill _tmp13 to $t0 from $fp-64
	  beqz $t0, loopEnd_2	# branch if _tmp13 is zero 
	# _tmp14 = "Enter the element's index you want to access: "
	  .data			# create string constant marked with label
	  _string4: .asciiz "Enter the element's index you want to access: "
	  .text
	  la $t2, _string4	# load label
	  sw $t2, -68($fp)	# spill _tmp14 from $t2 to $fp-68
	# PushParam _tmp14
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -68($fp)	# fill _tmp14 to $t0 from $fp-68
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp15 = LCall _ReadInteger
	  jal _ReadInteger   	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -72($fp)	# spill _tmp15 from $t2 to $fp-72
	# index = _tmp15
	  lw $t2, -72($fp)	# fill _tmp15 to $t2 from $fp-72
	  sw $t2, -16($fp)	# spill index from $t2 to $fp-16
	# _tmp16 = "Value is: "
	  .data			# create string constant marked with label
	  _string5: .asciiz "Value is: "
	  .text
	  la $t2, _string5	# load label
	  sw $t2, -76($fp)	# spill _tmp16 from $t2 to $fp-76
	# PushParam _tmp16
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -76($fp)	# fill _tmp16 to $t0 from $fp-76
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp17 = *(array)
	  lw $t0, -8($fp)	# fill array to $t0 from $fp-8
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -80($fp)	# spill _tmp17 from $t2 to $fp-80
	# _tmp18 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -84($fp)	# spill _tmp18 from $t2 to $fp-84
	# _tmp19 = index < _tmp18
	  lw $t0, -16($fp)	# fill index to $t0 from $fp-16
	  lw $t1, -84($fp)	# fill _tmp18 to $t1 from $fp-84
	  slt $t2, $t0, $t1	
	  sw $t2, -88($fp)	# spill _tmp19 from $t2 to $fp-88
	# _tmp20 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -92($fp)	# spill _tmp20 from $t2 to $fp-92
	# _tmp21 = _tmp17 - _tmp20
	  lw $t0, -80($fp)	# fill _tmp17 to $t0 from $fp-80
	  lw $t1, -92($fp)	# fill _tmp20 to $t1 from $fp-92
	  sub $t2, $t0, $t1	
	  sw $t2, -96($fp)	# spill _tmp21 from $t2 to $fp-96
	# _tmp22 = _tmp21 < index
	  lw $t0, -96($fp)	# fill _tmp21 to $t0 from $fp-96
	  lw $t1, -16($fp)	# fill index to $t1 from $fp-16
	  slt $t2, $t0, $t1	
	  sw $t2, -100($fp)	# spill _tmp22 from $t2 to $fp-100
	# _tmp23 = _tmp19 || _tmp22
	  lw $t0, -88($fp)	# fill _tmp19 to $t0 from $fp-88
	  lw $t1, -100($fp)	# fill _tmp22 to $t1 from $fp-100
	  or $t2, $t0, $t1	
	  sw $t2, -104($fp)	# spill _tmp23 from $t2 to $fp-104
	# IfZ _tmp23 Goto arrayAcc_3
	  lw $t0, -104($fp)	# fill _tmp23 to $t0 from $fp-104
	  beqz $t0, arrayAcc_3	# branch if _tmp23 is zero 
	# _tmp24 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string6: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string6	# load label
	  sw $t2, -108($fp)	# spill _tmp24 from $t2 to $fp-108
	# PushParam _tmp24
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -108($fp)	# fill _tmp24 to $t0 from $fp-108
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_3:
	# _tmp25 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -112($fp)	# spill _tmp25 from $t2 to $fp-112
	# _tmp26 = index * _tmp25
	  lw $t0, -16($fp)	# fill index to $t0 from $fp-16
	  lw $t1, -112($fp)	# fill _tmp25 to $t1 from $fp-112
	  mul $t2, $t0, $t1	
	  sw $t2, -116($fp)	# spill _tmp26 from $t2 to $fp-116
	# _tmp27 = array + _tmp26
	  lw $t0, -8($fp)	# fill array to $t0 from $fp-8
	  lw $t1, -116($fp)	# fill _tmp26 to $t1 from $fp-116
	  add $t2, $t0, $t1	
	  sw $t2, -120($fp)	# spill _tmp27 from $t2 to $fp-120
	# _tmp28 = _tmp27 + _tmp25
	  lw $t0, -120($fp)	# fill _tmp27 to $t0 from $fp-120
	  lw $t1, -112($fp)	# fill _tmp25 to $t1 from $fp-112
	  add $t2, $t0, $t1	
	  sw $t2, -124($fp)	# spill _tmp28 from $t2 to $fp-124
	# _tmp29 = *(_tmp28)
	  lw $t0, -124($fp)	# fill _tmp28 to $t0 from $fp-124
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -128($fp)	# spill _tmp29 from $t2 to $fp-128
	# PushParam _tmp29
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -128($fp)	# fill _tmp29 to $t0 from $fp-128
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintInt
	  jal _PrintInt      	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp30 = "\n"
	  .data			# create string constant marked with label
	  _string7: .asciiz "\n"
	  .text
	  la $t2, _string7	# load label
	  sw $t2, -132($fp)	# spill _tmp30 from $t2 to $fp-132
	# PushParam _tmp30
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -132($fp)	# fill _tmp30 to $t0 from $fp-132
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# Goto loopBegin_1
	  b loopBegin_1		# unconditional branch
  loopEnd_2:
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  _populateArray:
	# BeginFunc 152
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 152	# decrement sp to make space for locals/temps
	# _tmp1 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -16($fp)	# spill _tmp1 from $t2 to $fp-16
	# index = _tmp1
	  lw $t2, -16($fp)	# fill _tmp1 to $t2 from $fp-16
	  sw $t2, -8($fp)	# spill index from $t2 to $fp-8
  loopBegin_4:
	# _tmp2 = index < siz
	  lw $t0, -8($fp)	# fill index to $t0 from $fp-8
	  lw $t1, 8($fp)	# fill siz to $t1 from $fp+8
	  slt $t2, $t0, $t1	
	  sw $t2, -20($fp)	# spill _tmp2 from $t2 to $fp-20
	# IfZ _tmp2 Goto loopEnd_5
	  lw $t0, -20($fp)	# fill _tmp2 to $t0 from $fp-20
	  beqz $t0, loopEnd_5	# branch if _tmp2 is zero 
	# _tmp3 = 100
	  li $t2, 100		# load constant value 100 into $t2
	  sw $t2, -24($fp)	# spill _tmp3 from $t2 to $fp-24
	# _tmp4 = siz * _tmp3
	  lw $t0, 8($fp)	# fill siz to $t0 from $fp+8
	  lw $t1, -24($fp)	# fill _tmp3 to $t1 from $fp-24
	  mul $t2, $t0, $t1	
	  sw $t2, -28($fp)	# spill _tmp4 from $t2 to $fp-28
	# _tmp5 = _tmp4 + index
	  lw $t0, -28($fp)	# fill _tmp4 to $t0 from $fp-28
	  lw $t1, -8($fp)	# fill index to $t1 from $fp-8
	  add $t2, $t0, $t1	
	  sw $t2, -32($fp)	# spill _tmp5 from $t2 to $fp-32
	# _tmp6 = *(arr)
	  lw $t0, 4($fp)	# fill arr to $t0 from $fp+4
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -36($fp)	# spill _tmp6 from $t2 to $fp-36
	# _tmp7 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -40($fp)	# spill _tmp7 from $t2 to $fp-40
	# _tmp8 = index < _tmp7
	  lw $t0, -8($fp)	# fill index to $t0 from $fp-8
	  lw $t1, -40($fp)	# fill _tmp7 to $t1 from $fp-40
	  slt $t2, $t0, $t1	
	  sw $t2, -44($fp)	# spill _tmp8 from $t2 to $fp-44
	# _tmp9 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -48($fp)	# spill _tmp9 from $t2 to $fp-48
	# _tmp10 = _tmp6 - _tmp9
	  lw $t0, -36($fp)	# fill _tmp6 to $t0 from $fp-36
	  lw $t1, -48($fp)	# fill _tmp9 to $t1 from $fp-48
	  sub $t2, $t0, $t1	
	  sw $t2, -52($fp)	# spill _tmp10 from $t2 to $fp-52
	# _tmp11 = _tmp10 < index
	  lw $t0, -52($fp)	# fill _tmp10 to $t0 from $fp-52
	  lw $t1, -8($fp)	# fill index to $t1 from $fp-8
	  slt $t2, $t0, $t1	
	  sw $t2, -56($fp)	# spill _tmp11 from $t2 to $fp-56
	# _tmp12 = _tmp8 || _tmp11
	  lw $t0, -44($fp)	# fill _tmp8 to $t0 from $fp-44
	  lw $t1, -56($fp)	# fill _tmp11 to $t1 from $fp-56
	  or $t2, $t0, $t1	
	  sw $t2, -60($fp)	# spill _tmp12 from $t2 to $fp-60
	# IfZ _tmp12 Goto arrayAcc_6
	  lw $t0, -60($fp)	# fill _tmp12 to $t0 from $fp-60
	  beqz $t0, arrayAcc_6	# branch if _tmp12 is zero 
	# _tmp13 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string8: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string8	# load label
	  sw $t2, -64($fp)	# spill _tmp13 from $t2 to $fp-64
	# PushParam _tmp13
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -64($fp)	# fill _tmp13 to $t0 from $fp-64
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_6:
	# _tmp14 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -68($fp)	# spill _tmp14 from $t2 to $fp-68
	# _tmp15 = index * _tmp14
	  lw $t0, -8($fp)	# fill index to $t0 from $fp-8
	  lw $t1, -68($fp)	# fill _tmp14 to $t1 from $fp-68
	  mul $t2, $t0, $t1	
	  sw $t2, -72($fp)	# spill _tmp15 from $t2 to $fp-72
	# _tmp16 = arr + _tmp15
	  lw $t0, 4($fp)	# fill arr to $t0 from $fp+4
	  lw $t1, -72($fp)	# fill _tmp15 to $t1 from $fp-72
	  add $t2, $t0, $t1	
	  sw $t2, -76($fp)	# spill _tmp16 from $t2 to $fp-76
	# _tmp17 = _tmp16 + _tmp14
	  lw $t0, -76($fp)	# fill _tmp16 to $t0 from $fp-76
	  lw $t1, -68($fp)	# fill _tmp14 to $t1 from $fp-68
	  add $t2, $t0, $t1	
	  sw $t2, -80($fp)	# spill _tmp17 from $t2 to $fp-80
	# *(_tmp17) = _tmp5
	  lw $t0, -32($fp)	# fill _tmp5 to $t0 from $fp-32
	  lw $t2, -80($fp)	# fill _tmp17 to $t2 from $fp-80
	  sw $t0, 0($t2) 	# store with offset
	# _tmp18 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -84($fp)	# spill _tmp18 from $t2 to $fp-84
	# _tmp19 = index + _tmp18
	  lw $t0, -8($fp)	# fill index to $t0 from $fp-8
	  lw $t1, -84($fp)	# fill _tmp18 to $t1 from $fp-84
	  add $t2, $t0, $t1	
	  sw $t2, -88($fp)	# spill _tmp19 from $t2 to $fp-88
	# index = _tmp19
	  lw $t2, -88($fp)	# fill _tmp19 to $t2 from $fp-88
	  sw $t2, -8($fp)	# spill index from $t2 to $fp-8
	# Goto loopBegin_4
	  b loopBegin_4		# unconditional branch
  loopEnd_5:
	# _tmp20 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -92($fp)	# spill _tmp20 from $t2 to $fp-92
	# index = _tmp20
	  lw $t2, -92($fp)	# fill _tmp20 to $t2 from $fp-92
	  sw $t2, -8($fp)	# spill index from $t2 to $fp-8
  loopBegin_7:
	# _tmp21 = index < siz
	  lw $t0, -8($fp)	# fill index to $t0 from $fp-8
	  lw $t1, 8($fp)	# fill siz to $t1 from $fp+8
	  slt $t2, $t0, $t1	
	  sw $t2, -96($fp)	# spill _tmp21 from $t2 to $fp-96
	# IfZ _tmp21 Goto loopEnd_8
	  lw $t0, -96($fp)	# fill _tmp21 to $t0 from $fp-96
	  beqz $t0, loopEnd_8	# branch if _tmp21 is zero 
	# _tmp22 = *(arr)
	  lw $t0, 4($fp)	# fill arr to $t0 from $fp+4
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -100($fp)	# spill _tmp22 from $t2 to $fp-100
	# _tmp23 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -104($fp)	# spill _tmp23 from $t2 to $fp-104
	# _tmp24 = index < _tmp23
	  lw $t0, -8($fp)	# fill index to $t0 from $fp-8
	  lw $t1, -104($fp)	# fill _tmp23 to $t1 from $fp-104
	  slt $t2, $t0, $t1	
	  sw $t2, -108($fp)	# spill _tmp24 from $t2 to $fp-108
	# _tmp25 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -112($fp)	# spill _tmp25 from $t2 to $fp-112
	# _tmp26 = _tmp22 - _tmp25
	  lw $t0, -100($fp)	# fill _tmp22 to $t0 from $fp-100
	  lw $t1, -112($fp)	# fill _tmp25 to $t1 from $fp-112
	  sub $t2, $t0, $t1	
	  sw $t2, -116($fp)	# spill _tmp26 from $t2 to $fp-116
	# _tmp27 = _tmp26 < index
	  lw $t0, -116($fp)	# fill _tmp26 to $t0 from $fp-116
	  lw $t1, -8($fp)	# fill index to $t1 from $fp-8
	  slt $t2, $t0, $t1	
	  sw $t2, -120($fp)	# spill _tmp27 from $t2 to $fp-120
	# _tmp28 = _tmp24 || _tmp27
	  lw $t0, -108($fp)	# fill _tmp24 to $t0 from $fp-108
	  lw $t1, -120($fp)	# fill _tmp27 to $t1 from $fp-120
	  or $t2, $t0, $t1	
	  sw $t2, -124($fp)	# spill _tmp28 from $t2 to $fp-124
	# IfZ _tmp28 Goto arrayAcc_9
	  lw $t0, -124($fp)	# fill _tmp28 to $t0 from $fp-124
	  beqz $t0, arrayAcc_9	# branch if _tmp28 is zero 
	# _tmp29 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string9: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string9	# load label
	  sw $t2, -128($fp)	# spill _tmp29 from $t2 to $fp-128
	# PushParam _tmp29
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -128($fp)	# fill _tmp29 to $t0 from $fp-128
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  arrayAcc_9:
	# _tmp30 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -132($fp)	# spill _tmp30 from $t2 to $fp-132
	# _tmp31 = index * _tmp30
	  lw $t0, -8($fp)	# fill index to $t0 from $fp-8
	  lw $t1, -132($fp)	# fill _tmp30 to $t1 from $fp-132
	  mul $t2, $t0, $t1	
	  sw $t2, -136($fp)	# spill _tmp31 from $t2 to $fp-136
	# _tmp32 = arr + _tmp31
	  lw $t0, 4($fp)	# fill arr to $t0 from $fp+4
	  lw $t1, -136($fp)	# fill _tmp31 to $t1 from $fp-136
	  add $t2, $t0, $t1	
	  sw $t2, -140($fp)	# spill _tmp32 from $t2 to $fp-140
	# _tmp33 = _tmp32 + _tmp30
	  lw $t0, -140($fp)	# fill _tmp32 to $t0 from $fp-140
	  lw $t1, -132($fp)	# fill _tmp30 to $t1 from $fp-132
	  add $t2, $t0, $t1	
	  sw $t2, -144($fp)	# spill _tmp33 from $t2 to $fp-144
	# _tmp34 = *(_tmp33)
	  lw $t0, -144($fp)	# fill _tmp33 to $t0 from $fp-144
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -148($fp)	# spill _tmp34 from $t2 to $fp-148
	# PushParam _tmp34
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -148($fp)	# fill _tmp34 to $t0 from $fp-148
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintInt
	  jal _PrintInt      	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp35 = "\n"
	  .data			# create string constant marked with label
	  _string10: .asciiz "\n"
	  .text
	  la $t2, _string10	# load label
	  sw $t2, -152($fp)	# spill _tmp35 from $t2 to $fp-152
	# PushParam _tmp35
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -152($fp)	# fill _tmp35 to $t0 from $fp-152
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp36 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -156($fp)	# spill _tmp36 from $t2 to $fp-156
	# _tmp37 = index + _tmp36
	  lw $t0, -8($fp)	# fill index to $t0 from $fp-8
	  lw $t1, -156($fp)	# fill _tmp36 to $t1 from $fp-156
	  add $t2, $t0, $t1	
	  sw $t2, -160($fp)	# spill _tmp37 from $t2 to $fp-160
	# index = _tmp37
	  lw $t2, -160($fp)	# fill _tmp37 to $t2 from $fp-160
	  sw $t2, -8($fp)	# spill index from $t2 to $fp-8
	# Goto loopBegin_7
	  b loopBegin_7		# unconditional branch
  loopEnd_8:
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
