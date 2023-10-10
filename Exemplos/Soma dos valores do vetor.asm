#Codigo para obter a soma dos valores de um vetor 
.data
	vetor_0:	.byte 1,2,3
	somatorio:	.word 0
	
.text
	#acesso ao vetor
	la	$t0, vetor_0	
	li	$t4, 0		#registrador para iteração
	li	$s0, 0	#acumulador
	
loop:	#printar os valores do vetor_0
	lb	$t3, 0($t0)
	add	$s0, $s0, $t3
	li	$v0, 1
	move	$a0, $t3
	syscall
	addi	$t0, $t0, 1	#Incrementa o endereço em mais 1, passando para o proximo inteiro do vetor
	addi	$t4, $t4, 1
	bgt	$t4, 2, fim	#Após 3 iterações pular para o fim
	j loop

fim:	#encerra o programa
	la	$t0, somatorio	#carrega o endereço do somatorio no reg $t0
	sw	$s0, 0($t0)	#armazena o dado de $s0 no endereço do somatório
	li	$v0, 1		#Imprimir o valor do somatório
	move	$a0, $s0
	syscall
	li	$v0, 10
	syscall
