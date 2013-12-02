	# standard Decaf preamble 
	  .text
	  .align 2
	  .globl main
  Student_initiate:
	# BeginFunc 12
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 12	# decrement sp to make space for locals/temps
	# _tmp0 = 10
	  li $t2, 10		# load constant value 10 into $t2
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
  Student_printA:
	# BeginFunc 12
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 12	# decrement sp to make space for locals/temps
	# _tmp0 = "Class: "
	  .data			# create string constant marked with label
	  _string1: .asciiz "Class: "
	  .text
	  la $t2, _string1	# load label
	  sw $t2, -8($fp)	# spill _tmp0 from $t2 to $fp-8
	# PushParam _tmp0
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -8($fp)	# fill _tmp0 to $t0 from $fp-8
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp1 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -12($fp)	# spill _tmp1 from $t2 to $fp-12
	# PushParam _tmp1
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -12($fp)	# fill _tmp1 to $t0 from $fp-12
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintInt
	  jal _PrintInt      	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp2 = "\n"
	  .data			# create string constant marked with label
	  _string2: .asciiz "\n"
	  .text
	  la $t2, _string2	# load label
	  sw $t2, -16($fp)	# spill _tmp2 from $t2 to $fp-16
	# PushParam _tmp2
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -16($fp)	# fill _tmp2 to $t0 from $fp-16
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
	# VTable for class Student
	  .data
	  .align 2
	  Student:		# label for class Student vtable
	  .word Student_initiate
	  .word Student_printA
	  .text
  main:
	# BeginFunc 36
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 36	# decrement sp to make space for locals/temps
	# _tmp1 = 8
	  li $t2, 8		# load constant value 8 into $t2
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
	# _tmp3 = Student
	  la $t2, Student	# load label
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
	# _tmp6 = 100
	  li $t2, 100		# load constant value 100 into $t2
	  sw $t2, -32($fp)	# spill _tmp6 from $t2 to $fp-32
	# a = _tmp6
	  lw $t2, -32($fp)	# fill _tmp6 to $t2 from $fp-32
	  sw $t2, 0($gp)	# spill a from $t2 to $gp+0
	# _tmp7 = *(s)
	  lw $t0, -8($fp)	# fill s to $t0 from $fp-8
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -36($fp)	# spill _tmp7 from $t2 to $fp-36
	# _tmp8 = *(_tmp7 + 4)
	  lw $t0, -36($fp)	# fill _tmp7 to $t0 from $fp-36
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -40($fp)	# spill _tmp8 from $t2 to $fp-40
	# PushParam s
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -8($fp)	# fill s to $t0 from $fp-8
	  sw $t0, 4($sp)	# copy param value to stack
	# ACall _tmp8
	  lw $t0, -40($fp)	# fill _tmp8 to $t0 from $fp-40
	  jalr $t0            	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _globalPrint
	  jal _globalPrint   	# jump to function
	# LCall _localPrint
	  jal _localPrint    	# jump to function
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  _globalPrint:
	# BeginFunc 8
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 8	# decrement sp to make space for locals/temps
	# _tmp0 = "Global: "
	  .data			# create string constant marked with label
	  _string3: .asciiz "Global: "
	  .text
	  la $t2, _string3	# load label
	  sw $t2, -8($fp)	# spill _tmp0 from $t2 to $fp-8
	# PushParam _tmp0
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -8($fp)	# fill _tmp0 to $t0 from $fp-8
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# PushParam a
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, 0($gp)	# fill a to $t0 from $gp+0
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintInt
	  jal _PrintInt      	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp1 = "\n"
	  .data			# create string constant marked with label
	  _string4: .asciiz "\n"
	  .text
	  la $t2, _string4	# load label
	  sw $t2, -12($fp)	# spill _tmp1 from $t2 to $fp-12
	# PushParam _tmp1
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -12($fp)	# fill _tmp1 to $t0 from $fp-12
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
  _localPrint:
	# BeginFunc 16
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 16	# decrement sp to make space for locals/temps
	# _tmp1 = 50
	  li $t2, 50		# load constant value 50 into $t2
	  sw $t2, -12($fp)	# spill _tmp1 from $t2 to $fp-12
	# a = _tmp1
	  lw $t2, -12($fp)	# fill _tmp1 to $t2 from $fp-12
	  sw $t2, -8($fp)	# spill a from $t2 to $fp-8
	# _tmp2 = "Local: "
	  .data			# create string constant marked with label
	  _string5: .asciiz "Local: "
	  .text
	  la $t2, _string5	# load label
	  sw $t2, -16($fp)	# spill _tmp2 from $t2 to $fp-16
	# PushParam _tmp2
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -16($fp)	# fill _tmp2 to $t0 from $fp-16
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# PushParam a
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -8($fp)	# fill a to $t0 from $fp-8
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintInt
	  jal _PrintInt      	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp3 = "\n"
	  .data			# create string constant marked with label
	  _string6: .asciiz "\n"
	  .text
	  la $t2, _string6	# load label
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
