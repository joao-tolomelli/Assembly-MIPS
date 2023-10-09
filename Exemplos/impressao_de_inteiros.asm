.data
	explicação: .asciiz "Este programa imprime numeros de 1 até o valor desejado \nInsira o número desejado:"
	pedido: .asciiz "Insira o número desejado:"
.text
	#Impressão dos dados iniciais
	li $v0, 4
	la $a0, explicação
	syscall
	#i = 0
	li	$t0, 0
	#entrada de inteiro
	li	$v0, 5
	syscall
	move	$t9, $v0
	
while:	
	beq	$t0, $t9, saida	#se t0 = t9 --> ir para "saida"
	#i = i + 1
	addi	$t0, $t0, 1
	#printar $t0
	move	$a0, $t0
	li	$v0, 1
	syscall	
	#quebra de linha
	li	$v0, 11
	li	$a0, '\n'
	syscall
	j	while	#ir para "while"
	
saida:	#encerra o programa
	li	$v0, 10
	syscall