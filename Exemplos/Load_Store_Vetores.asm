#Codigo para testar as fun��es de Load e Store no MIPS com vetores
.data
	vetor_0:	.byte 1,2,3
	vetor_1:	.word
			.space 12
	
.text
	#acesso ao vetor
	la	$t0, vetor_0	
	li	$t4, 0		#registrador para itera��o
	
loop:	#printar os valores do vetor_0
	lb	$t3, 0($t0)
	li	$v0, 1
	move	$a0, $t3
	syscall
	addi	$t0, $t0, 1	#Incrementa o endere�o em mais 1, passando para o proximo inteiro do vetor
	addi	$t4, $t4, 1
	bgt	$t4, 2, fim	#Ap�s 3 itera��es pular para o fim
	j loop

fim:	#encerra o programa
	li	$v0, 10
	syscall