load_a_q0:
	MOV		A, 0 		#cargar el valor 00000000 en A, se toma por defecto que al cargar 0 se cargan los 8 bits en 0 de la variable 
	MOV  	Q0, 0	  	#cargar el valor 00000000 en Q0, se toma por defecto que al cargar 0 se cargan los 8 bits en 0 de la variable

load_q1:
	MOV		ACC, CTE	#cargar la dirección de Q1 en ACC
	Q1
	MOV  	DPTR, ACC	# mover la dirección de Q1 al DPTR
	MOV  	ACC, [DPTR]	#Cargar el valor de Q1 en ACC
	MOV  	Q1, ACC		#poner el valor de Q1 en la variable Q1


load_multiplicand:
	MOV  	ACC, CTE	#cargar la dirección de MULTIPLICAND en ACC
	MULTIPLICAND		
	MOV  	DPTR, ACC	# mover la dirección de MULTIPLICAND al DPTR
	MOV  	ACC, [DPTR]	#Cargar el valor de MULTIPLICAND en ACC
	MOV  	Q, ACC		#poner el valor de MULTIPLICAND en la variable M

load_multiplier:
	MOV  	ACC, CTE	#cargar la dirección de MULTIPLIER en ACC
	MULTIPLIER  	
	MOV	    DPTR, ACC  	# mover la dirección de MULTIPLIER al DPTR
	MOV  	ACC, [DPTR] #Cargar el valor de MULTIPLIER en ACC
	MOV  	M, ACC  	#poner el valor de MULTIPLIER en la variable Q

load_count:
	MOV  	ACC, CTE	#cargar la dirección de N en ACC
	N
	MOV  	DPTR, ACC	# mover la dirección de N al DPTR
	MOV  	ACC, [DPTR]	#Cargar el valor de N en ACC
	MOV  	COUNT, ACC	#poner el valor de N en la variable Q1

WHILE_N:
IF_Q1_Q0:
	MOV 	X, Q0 		#Mover el valor de Q0 a X
	XOR 	X, Q1		#Hacer un XOR entre X y Q1 y almacenar el valor en X
	CMP 	X, 1		#Comparar X con 1
	COND1				#Si X = 1 es porque o es 01 o es 10 y entonces se ejecuta la función COND1
COND2:
	SHIFT_RIGHT			# Si X = 0 es porque o es 00 o es 11, entonces se hace un shift a derecha


COND1:
	MOV 	Y, Q0		#Mover el valor de Q0 a Y
	MOV 	ACC, Y		#Mover el resultado del AND a ACC
	JN					# Revisar if(Y == 0)
	SUB_AM				#Si, sí, entocnes SUB_AM
	JMP		CTE			# Y != 0
 	SUM_AM


SUM_AM:
	ADD 	A, M		# A = A + M
	JMP		CTE			#Ir a  SHIFT_RIGHT
	SHIFT_RIGHT

SUB_AM:
	SUB 	A, M		# A = A - M
	JMP		CTE			#Ir a  SHIFT_RIGHT
	SHIFT_RIGHT

SHIFT_RIGHT:
	MOV 	CARRY1, 0	#Iniciar una variable carry1 en 0
	MOV 	CARRY2, 0	#Iniciar una variable carry2 en 0
	SHIFTR 	CARRY1, A	# Hacer una shift a derecha y almacenar el último número que tenía antes del shift, en CARRY1
	SHIFTR	CARRY2, Q	# Hacer una shift a derecha y almacenar el último número que tenía antes del shift, en CARRY2
	ADD_C	Q, CARRY1	# Añadir el CARRY1 a A en el primer bit
	ADD		Q0, CARRY2	# Añadir CARRY2 a Q0
	JMP		CTE			##Ir a  REDUCE_COUNTER
	REDUCE_COUNTER
 
REDUCE_COUNTER:	
	ADD 	N, -1		#Restar a N -1
	MOV 	ACC, N		#Cargar N en ACC
	JN					#Revisar if(N == 0) 
	END_LOOP			# Si N == 0 ir a END_LOOP
	JMP 	CTE
	WHILE_N				#Si N != 0 ir WHILE_N


END_LOOP:
	MOV 	W, A		#Mover el valor de a en W que es una variable de 16 bits
	CONCAT 	W,Q			#Luego, concantenar es decir añadir la última parte de Q a W
	MOV 	ACC, W		#Mover  W a ACC
	RET					#Retornar el resultado de la multiplicación que está en W
	


SHIFTR

