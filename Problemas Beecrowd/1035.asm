.data
	msg_1: .asciiz "Valores aceitos"
	msg_2: .asciiz "Valores nao aceitos"
.text
	#Leitura dos dados
	li $v0, 5
	syscall
	move $t0, $v0	#A
	li $v0, 5
	syscall
	move $t1, $v0	#B
	li $v0, 5
	syscall
	move $t2, $v0	#C
	li $v0, 5
	syscall
	move $t3, $v0	#D
	
	#Valores compostos
	add $t4, $t0, $t1	#soma A + B
	add $t5, $t2, $t3	#soma C + D
	li $s7, 2
	div $t0, $s7
	mfhi $t6
	
	#Testes
	bgt $t2,$t1, Exit_2
	bgt $t0, $t3, Exit_2
	bgt $t4, $t5, Exit_2
	bgt $zero, $t2, Exit_2
	bgt $zero, $t3, Exit_2
	bgtz $t6, Exit_2
	
Exit_1:
	li $v0, 4
	la $a0, msg_1
	syscall
	li $v0, 10
	syscall

Exit_2:
	li $v0, 4
	la $a0, msg_2
	syscall
	li $v0, 10
	syscall