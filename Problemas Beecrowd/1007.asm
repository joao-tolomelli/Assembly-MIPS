.data

	final_disp: .asciiz "DIFERENÇA = "

.text
	#Leitura do primeiro valor 
	li $v0, 5
	syscall
	move $t0, $v0	#armazenando o primeiro valor em $t0
	
	#Leitura do segundo valor
	li $v0, 5
	syscall
	mul $t0, $t0, $v0	#$t0 = $t0*$v0
	
	#Leitura do terceiro valor
	li $v0, 5
	syscall
	move $t1, $v0
	
	#Leitura do quarto valor
	li $v0, 5
	syscall
	mul $t1, $t1, $v0	#$t1 = $t1*$v0
	
	#Operação final $t0 - $t1
	sub $t2, $t0, $t1
	
	#Imprimindo resultado final
	li $v0, 4
	la $a0, final_disp
	syscall
	li $v0, 1
	move $a0, $t2
	syscall
	