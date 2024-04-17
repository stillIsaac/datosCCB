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
	MOV  	M, ACC		#poner el valor de MULTIPLICAND en la variable Q1

load_multiplier:
	MOV  	ACC, CTE	#cargar la dirección de MULTIPLIER en ACC
	MULTIPLIER  	
	MOV	    DPTR, ACC  	# mover la dirección de MULTIPLIER al DPTR
	MOV  	ACC, [DPTR] #Cargar el valor de MULTIPLIER en ACC
	MOV  	Q, ACC  	#poner el valor de MULTIPLIER en la variable Q1

load_count:
	MOV  	ACC, CTE	#cargar la dirección de N en ACC
	N
	MOV  	DPTR, ACC	# mover la dirección de N al DPTR
	MOV  	ACC, [DPTR]	#Cargar el valor de N en ACC
	MOV  	COUNT, ACC	#poner el valor de N en la variable Q1

WHILE_N:
IF_Q1_Q0:
	MOV 	X, Q0 			// X Es una variable auxiliar que va a almacenar 
	XOR 	X, Q1
	CMP 	X, 1
	COND1
COND2:
	SHIFT_RIGHT	


COND1:
	MOV 	Y, Q0
	AND 	Y, 1
	MOV 	ACC, Y
	JN
	SUM_AM
	
 	
SUM_AM:
	ADD 	A, M
	
SHIFT_RIGHT:
	SHIFTR 	Q, A
	SHIFTR 	Q0, Q 
REDUCE_COUNTER:	
	ADD 	N, -1
	MOV 	ACC, N
	JN
	WHILE_N
	JMP CTE
	END_LOOP


END_LOOP:
	CONCAT 	A,Q
	MOV 	ACC, A
	RET
	


SHIFTR

