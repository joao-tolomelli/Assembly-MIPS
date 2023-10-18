#C�digo para demonstrar o uso de jal e jr
.data
	msg_1:	.asciiz	"Insira dois n�meros\n"
	msg_2:	.asciiz "O resto da divis�o entre os numeros �: "
.text
###################################################################################

#Mensagem incial
	li	$v0, 4
	la	$a0, msg_1
	syscall

#Inserindo dados
	li	$v0, 5
	syscall
	move	$a0, $v0	#primeiro n�mero lido armazenado em $a0
	li	$v0, 5
	syscall
	move	$a1, $v0	#segundo n�mero lido armazenado em $a1
	
#Saltando para a "fun��o" esto_div
	jal	resto_div	#armazena o endere�o dessa linha em $ra
	
#armazenando o valor da divis�o em $s0
	move $s0, $v0
	
#Mensagem final
	li	$v0, 4
	la	$a0, msg_2
	syscall
	li	$v0, 1
	move $a0, $s0
	syscall
	
#Fim do c�digo
	li	$v0, 10
	syscall
	
###################################################################################
resto_div:
	div	$a0, $a1
	mfhi	$v0
	jr	$ra	#retorna para a linha onde o jal foi executado

	
