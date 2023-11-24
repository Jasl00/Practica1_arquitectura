.data
Input:     .asciiz "\nPonga un numero: "
Input2:    .asciiz "\nPonga un numero: "
Output:    .asciiz "\nresultado: "
.text

li $v0, 4
la $a0, Input #pide primer numero
syscall
li $v0, 5 #lo lee
syscall
move $t0, $v0 #lo guarda a una variable temporal
li $v0, 4
la $a0, Input2 #segundo numero
syscall
li $v0, 5 #lo lee 
syscall
move $t1, $v0 #lo guarda variable temporal
jal sum # hace la llamada recursiva
move $t4, $v0 #pasa el resultado a una variable temporal
li $v0, 4
la $a0, Output #resultado 
syscall
add $a0, $t4, $zero #agrega el resultado 
li $v0,1  #imprime
syscall 
li $v0, 10
syscall  #fin

sum: slti $t3, $t0,  1 # comprueba si n <= 0
beq $t0, $zero, sum_exit # salto a sum_exit si n <= 0
add $t1, $t1, $t0 # suma n a acc
addi $t0, $t0, -1 # decrementa n
j sum # salto a sum
sum_exit:
add $v0, $t1, $zero # devuelve el valor acc
jr $ra # retorno de rutina

