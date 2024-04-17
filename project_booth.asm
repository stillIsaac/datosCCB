load_a_q0:
	MOV  A, 0
	MOV  Q0, 0

load_q1:
MOV  ACC, CTE
	Q1
	MOV  DPTR, ACC
	MOV  ACC, [DPTR]
	MOV  Q1, ACC


load_multiplicand:
	MOV  ACC, CTE
	MULTIPLICAND
	MOV  DPTR, ACC
	MOV  ACC, [DPTR]
	MOV  M, ACC

load_multiplier:
	MOV  ACC, CTE
	MULTIPLIER
	MOV  DPTR, ACC
	MOV  ACC, [DPTR]
	MOV  Q, ACC

load_count:
	MOV  ACC, CTE
	N
	MOV  DPTR, ACC
	MOV  ACC, [DPTR]
	MOV  COUNT, ACC
WHILE_N:
IF_Q1_Q0:
	MOV X, Q0 			// X Es una variable auxiliar que va a almacenar 
	XOR X, Q1
	CMP X, 1
	COND1
COND2:
	SHIFT_RIGHT	


COND1:
	MOV Y, Q0
	AND Y, 1
	MOV ACC, Y
	JN
	SUM_AM
	
 	
SUM_AM:
	ADD A, M
	
SHIFT_RIGHT:
	SHIFTR Q, A
	SHIFTR Q0, Q 
REDUCE_COUNTER:	
	ADD N, -1
	MOV ACC, N
	JN
	WHILE_N
	JMP CTE
	END_LOOP


END_LOOP:
	CONCAT A,Q
	MOV ACC, A
	RET
	


SHIFTR

