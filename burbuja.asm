.data
	myArray: .space 16
	newLine: .asciiz "\n"
.text
	main:
		addi $s0, $zero, 8
		addi $s1, $zero, 10
		addi $s2, $zero, 3
		addi $s3, $zero, 5
		
		# indice
		addi $t0, $zero, 0
		# almacenar datos en el array
		sw $s0, myArray($t0)
		   addi $t0, $t0, 4
		sw $s1, myArray($t0)
		   addi $t0, $t0, 4
		sw $s2, myArray($t0)
		   addi $t0, $t0, 4
		sw $s3, myArray($t0)
		   addi $t0, $t0, 4
		
		addi $t0, $zero, 0  
		# bucle externo		
		while1:
			beq $t0, 16, then # mientras i < 4 (16 en palabra)
			addi $t0, $t0, 4
			addi $t1, $zero, 0 # j = 0
			addi $t2, $zero, 4 # k = 1
			# bucle interno
			while2:
				beq $t1, 16, while1 # mientras j < 4 (16 en palabra)
				
				lw $s0, myArray($t1)
				lw $s1, myArray($t2)
				
				bgt $s0, $s1, then2 # verificar si [i] > [i+1]
				# aumentar los indices
				addi $t1, $t1, 4  # j++ 
				addi $t2, $t2, 4  # k++ 
				j while2 
			then2: 
				# proceso swap
			 	lw $s0, myArray($t1)
				lw $s1, myArray($t2)
				sw $s1, myArray($t1)
				sw $s0, myArray($t2)
				# aumentar los indices
				addi $t1, $t1, 4 # j++
				addi $t2, $t2, 4 # k++
				j while2
			   
		then:
		  	 # inicializar bucle en 0
		  	 addi $t0, $zero, 0
		  	 while3:
		   		 # mostrar resultados 
		        	 beq $t0, 16, exit
		         
		        	 li $v0, 1
		        	 lw $a0, myArray($t0)
		        	 syscall
		        	 # saldo de linea
		        	 li $v0, 4
		        	 la $a0, newLine
		        	 syscall
		         
		        	 addi $t0, $t0, 4
		        	 j while3
		  exit:
		  	# finalizar programa
		   	li $v0, 10
		   	syscall		