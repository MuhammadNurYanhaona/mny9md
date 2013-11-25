	# standard Decaf preamble 
	  .text
	  .align 2
	  .globl main
  Student_printDetail:
	# BeginFunc 20
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 20	# decrement sp to make space for locals/temps
	# _tmp0 = "Part of detail: "
	  .data			# create string constant marked with label
	  _string1: .asciiz "Part of detail: "
	  .text
	  la $t2, _string1	# load label
	  sw $t2, -12($fp)	# spill _tmp0 from $t2 to $fp-12
	# PushParam _tmp0
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -12($fp)	# fill _tmp0 to $t0 from $fp-12
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp1 = *(this)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -16($fp)	# spill _tmp1 from $t2 to $fp-16
	# _tmp2 = *(_tmp1 + 4)
	  lw $t0, -16($fp)	# fill _tmp1 to $t0 from $fp-16
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -20($fp)	# spill _tmp2 from $t2 to $fp-20
	# _tmp3 = ACall _tmp2
	  lw $t0, -20($fp)	# fill _tmp2 to $t0 from $fp-20
	  jalr $t0            	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -24($fp)	# spill _tmp3 from $t2 to $fp-24
	# PushParam _tmp3
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -24($fp)	# fill _tmp3 to $t0 from $fp-24
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp4 = "\n"
	  .data			# create string constant marked with label
	  _string2: .asciiz "\n"
	  .text
	  la $t2, _string2	# load label
	  sw $t2, -28($fp)	# spill _tmp4 from $t2 to $fp-28
	# PushParam _tmp4
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -28($fp)	# fill _tmp4 to $t0 from $fp-28
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
  Student_getName:
	# BeginFunc 4
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 4	# decrement sp to make space for locals/temps
	# _tmp0 = "need appropriate permission"
	  .data			# create string constant marked with label
	  _string3: .asciiz "need appropriate permission"
	  .text
	  la $t2, _string3	# load label
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
	# VTable for class Student
	  .data
	  .align 2
	  Student:		# label for class Student vtable
	  .word Person_getAge
	  .word Student_getName
	  .word Student_printDetail
	  .text
  Fruit_isTasty:
	# BeginFunc 4
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 4	# decrement sp to make space for locals/temps
	# _tmp0 = 1
	  li $t2, 1		# load constant value 1 into $t2
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
  Fruit_printDesc:
	# BeginFunc 4
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 4	# decrement sp to make space for locals/temps
	# _tmp0 = "From fruit: "
	  .data			# create string constant marked with label
	  _string4: .asciiz "From fruit: "
	  .text
	  la $t2, _string4	# load label
	  sw $t2, -12($fp)	# spill _tmp0 from $t2 to $fp-12
	# PushParam _tmp0
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -12($fp)	# fill _tmp0 to $t0 from $fp-12
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _printDetail
	  jal _printDetail   	# jump to function
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# VTable for class Fruit
	  .data
	  .align 2
	  Fruit:		# label for class Fruit vtable
	  .word Person_getAge
	  .word Person_getName
	  .word Fruit_isTasty
	  .word Fruit_printDesc
	  .text
  Person_getAge:
	# BeginFunc 4
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 4	# decrement sp to make space for locals/temps
	# _tmp0 = *(this + 8)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 8($t0) 	# load with offset
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
  Person_getName:
	# BeginFunc 4
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 4	# decrement sp to make space for locals/temps
	# _tmp0 = "there is no setter method"
	  .data			# create string constant marked with label
	  _string5: .asciiz "there is no setter method"
	  .text
	  la $t2, _string5	# load label
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
	# VTable for class Person
	  .data
	  .align 2
	  Person:		# label for class Person vtable
	  .word Person_getAge
	  .word Person_getName
	  .text
  main:
	# BeginFunc 96
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 96	# decrement sp to make space for locals/temps
	# _tmp3 = 20
	  li $t2, 20		# load constant value 20 into $t2
	  sw $t2, -24($fp)	# spill _tmp3 from $t2 to $fp-24
	# PushParam _tmp3
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -24($fp)	# fill _tmp3 to $t0 from $fp-24
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp4 = LCall _Alloc
	  jal _Alloc         	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -28($fp)	# spill _tmp4 from $t2 to $fp-28
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp5 = Student
	  la $t2, Student	# load label
	  sw $t2, -32($fp)	# spill _tmp5 from $t2 to $fp-32
	# *(_tmp4) = _tmp5
	  lw $t0, -32($fp)	# fill _tmp5 to $t0 from $fp-32
	  lw $t2, -28($fp)	# fill _tmp4 to $t2 from $fp-28
	  sw $t0, 0($t2) 	# store with offset
	# student = _tmp4
	  lw $t2, -28($fp)	# fill _tmp4 to $t2 from $fp-28
	  sw $t2, 0($gp)	# spill student from $t2 to $gp+0
	# _tmp6 = 20
	  li $t2, 20		# load constant value 20 into $t2
	  sw $t2, -36($fp)	# spill _tmp6 from $t2 to $fp-36
	# PushParam _tmp6
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -36($fp)	# fill _tmp6 to $t0 from $fp-36
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp7 = LCall _Alloc
	  jal _Alloc         	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -40($fp)	# spill _tmp7 from $t2 to $fp-40
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp8 = Fruit
	  la $t2, Fruit	# load label
	  sw $t2, -44($fp)	# spill _tmp8 from $t2 to $fp-44
	# *(_tmp7) = _tmp8
	  lw $t0, -44($fp)	# fill _tmp8 to $t0 from $fp-44
	  lw $t2, -40($fp)	# fill _tmp7 to $t2 from $fp-40
	  sw $t0, 0($t2) 	# store with offset
	# fruit = _tmp7
	  lw $t2, -40($fp)	# fill _tmp7 to $t2 from $fp-40
	  sw $t2, 4($gp)	# spill fruit from $t2 to $gp+4
	# _tmp9 = 12
	  li $t2, 12		# load constant value 12 into $t2
	  sw $t2, -48($fp)	# spill _tmp9 from $t2 to $fp-48
	# PushParam _tmp9
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -48($fp)	# fill _tmp9 to $t0 from $fp-48
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp10 = LCall _Alloc
	  jal _Alloc         	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -52($fp)	# spill _tmp10 from $t2 to $fp-52
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp11 = Person
	  la $t2, Person	# load label
	  sw $t2, -56($fp)	# spill _tmp11 from $t2 to $fp-56
	# *(_tmp10) = _tmp11
	  lw $t0, -56($fp)	# fill _tmp11 to $t0 from $fp-56
	  lw $t2, -52($fp)	# fill _tmp10 to $t2 from $fp-52
	  sw $t0, 0($t2) 	# store with offset
	# person = _tmp10
	  lw $t2, -52($fp)	# fill _tmp10 to $t2 from $fp-52
	  sw $t2, 8($gp)	# spill person from $t2 to $gp+8
	# _tmp12 = *(student)
	  lw $t0, 0($gp)	# fill student to $t0 from $gp+0
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -60($fp)	# spill _tmp12 from $t2 to $fp-60
	# _tmp13 = *(_tmp12 + 4)
	  lw $t0, -60($fp)	# fill _tmp12 to $t0 from $fp-60
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -64($fp)	# spill _tmp13 from $t2 to $fp-64
	# PushParam student
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, 0($gp)	# fill student to $t0 from $gp+0
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp14 = ACall _tmp13
	  lw $t0, -64($fp)	# fill _tmp13 to $t0 from $fp-64
	  jalr $t0            	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -68($fp)	# spill _tmp14 from $t2 to $fp-68
	# PushParam _tmp14
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -68($fp)	# fill _tmp14 to $t0 from $fp-68
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp15 = "\n"
	  .data			# create string constant marked with label
	  _string6: .asciiz "\n"
	  .text
	  la $t2, _string6	# load label
	  sw $t2, -72($fp)	# spill _tmp15 from $t2 to $fp-72
	# PushParam _tmp15
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -72($fp)	# fill _tmp15 to $t0 from $fp-72
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp16 = *(fruit)
	  lw $t0, 4($gp)	# fill fruit to $t0 from $gp+4
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -76($fp)	# spill _tmp16 from $t2 to $fp-76
	# _tmp17 = *(_tmp16 + 4)
	  lw $t0, -76($fp)	# fill _tmp16 to $t0 from $fp-76
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -80($fp)	# spill _tmp17 from $t2 to $fp-80
	# PushParam fruit
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, 4($gp)	# fill fruit to $t0 from $gp+4
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp18 = ACall _tmp17
	  lw $t0, -80($fp)	# fill _tmp17 to $t0 from $fp-80
	  jalr $t0            	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -84($fp)	# spill _tmp18 from $t2 to $fp-84
	# PushParam _tmp18
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -84($fp)	# fill _tmp18 to $t0 from $fp-84
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp19 = "\n"
	  .data			# create string constant marked with label
	  _string7: .asciiz "\n"
	  .text
	  la $t2, _string7	# load label
	  sw $t2, -88($fp)	# spill _tmp19 from $t2 to $fp-88
	# PushParam _tmp19
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -88($fp)	# fill _tmp19 to $t0 from $fp-88
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp20 = *(student)
	  lw $t0, 0($gp)	# fill student to $t0 from $gp+0
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -92($fp)	# spill _tmp20 from $t2 to $fp-92
	# _tmp21 = *(_tmp20 + 8)
	  lw $t0, -92($fp)	# fill _tmp20 to $t0 from $fp-92
	  lw $t2, 8($t0) 	# load with offset
	  sw $t2, -96($fp)	# spill _tmp21 from $t2 to $fp-96
	# PushParam student
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, 0($gp)	# fill student to $t0 from $gp+0
	  sw $t0, 4($sp)	# copy param value to stack
	# ACall _tmp21
	  lw $t0, -96($fp)	# fill _tmp21 to $t0 from $fp-96
	  jalr $t0            	# jump to function
	# _tmp22 = *(fruit)
	  lw $t0, 4($gp)	# fill fruit to $t0 from $gp+4
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -100($fp)	# spill _tmp22 from $t2 to $fp-100
	# _tmp23 = *(_tmp22 + 12)
	  lw $t0, -100($fp)	# fill _tmp22 to $t0 from $fp-100
	  lw $t2, 12($t0) 	# load with offset
	  sw $t2, -104($fp)	# spill _tmp23 from $t2 to $fp-104
	# PushParam fruit
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, 4($gp)	# fill fruit to $t0 from $gp+4
	  sw $t0, 4($sp)	# copy param value to stack
	# ACall _tmp23
	  lw $t0, -104($fp)	# fill _tmp23 to $t0 from $fp-104
	  jalr $t0            	# jump to function
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  _printDetail:
	# BeginFunc 4
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 4	# decrement sp to make space for locals/temps
	# _tmp0 = "this is a global name\n"
	  .data			# create string constant marked with label
	  _string8: .asciiz "this is a global name\n"
	  .text
	  la $t2, _string8	# load label
	  sw $t2, -12($fp)	# spill _tmp0 from $t2 to $fp-12
	# PushParam _tmp0
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -12($fp)	# fill _tmp0 to $t0 from $fp-12
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
