.data
	final_disp: .asciiz "MEDIA = "
	zero: .float 0.0
	value_1: .float 3.5
	value_2: .float 7.5
.text
	#lendo o primeiro float
	li $v0, 6
	syscall	#valor lido é armazenado no reg $f0
	
	#Pasando o valor lido para o reg $f12
	lwc1 $f1, zero	#atribui o a constante zero ao reg $f1
	add.s $f12, $f0, $f1
	lwc1 $f2, value_1
	mul.s $f12, $f12, $f2 #Multiplicando pelo peso 
	
	#lendo o segundo float
	li $v0, 6
	syscall	#valor lido é armazenado no reg $f0
	
	#Pasando o valor lido para o reg $f11
	add.s $f11, $f0, $f1
	lwc1 $f3, value_2
	mul.s $f11, $f11, $f3 #Multiplicando pelo peso 
	
	#Disvisão
	add.s $f1, $f2, $f3	# f1 = f2 + f3 = 11
	add.s $f12, $f12, $f11	# f12 = f12 + f11
	div.s $f12, $f12, $f1	#f12 = f12/f1 = f12/11
	
	#Imprimindo valor final
	li $v0, 4
	la $a0, final_disp
	syscall
	li $v0, 2 #O float impresso sempre deve estar armazenado em $f12
	syscall
	
	