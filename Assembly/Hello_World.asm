.data

msg: .asciiz "Hello World!"
.text

li $v0, 4 # Numero 4 significa imprimir String
la $a0, msg # carrega o endereco da String
syscall