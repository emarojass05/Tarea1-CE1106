TITLE �rea y Per�metro de un Trapecio o Cuadrado
INCLUDE 'EMU8086.INC'
CR EQU 13
LF EQU 10

;---------------------------------------------
.MODEL SMALL
.STACK 200 ; Se deFINe la pila
.DATA ; Se deFINen datos

; mensajes de inicio
       mensaje1 DB cr,lf,'Programa que calcula el �rea y per�metro de un trapecio o un cuadrado.$'
       mensaje2 DB cr,lf,'Presiona 1 para calcular trapecio, 2 para calcular cuadrado, 3 para rectangulo,4 para el rombo, 5 para el pentagono, 6 para el hexagono, 7 para el paralelogramo, 8 para el circulo o presiona 0 para salir.$'
 
       
; mensajes para el trapecio
       mensaje3 DB cr,lf,'Ingresa la base mayor del trapecio: (presiona enter)$'
       mensaje4 DB cr,lf,'Presiona cualquier tecla para continuar.$'  
       mensaje5 DB cr,lf,'Ingresa la base menor del trapecio: (presiona enter)$'
       mensaje6 DB cr,lf,'Ingresa la altura del trapecio: (presiona enter)$'
       mensaje7 DB cr,lf,'Ingresa la longitud del lado no paralelo del trapecio isoceles: (presiona enter)$'
       mensaje8 DB cr,lf,'El Area del trapecio es: $'
       
; mensajes para el cuadrado
       mensaje9 DB cr,lf,'Ingresa el lado del cuadrado: (presiona enter)$'
       mensaje10 DB cr,lf,'El Area del cuadrado es: $'       
       
; mensajes para el rectangulo       
       mensaje11 DB cr,lf, 'Ingresa el ancho del rectangulo: (presiona enter)$'
       mensaje12 DB cr,lf, 'Ingresa el largo del rectangulo: (presiona enter)$'
       mensaje13 DB cr,lf,'El Area del rectangulo es: $'              
       
; mensajes para el rombo
       mensaje14 DB cr,lf, 'Ingresa la diagonal menor del rombo$'
       mensaje15 DB cr,lf, 'Ingresa la diagonal mayor del rombo$'
       mensaje16 DB cr,lf, 'Ingresa el lado del rombo$'
       mensaje17 DB cr,lf, 'El area del rombo es: $'
       
; mensajes para el pentagono
       mensaje18 DB cr,lf, 'Ingresa el lado del pentagono$'
       mensaje19 DB cr,lf, 'Ingresa el apotema del pentagono$'
       mensaje20 DB cr,lf, 'El area del pentagono es: $'   
       
; mensajes para el hexagono
       mensaje21 DB cr,lf, 'Ingresa el lado del hexagono$'
       mensaje22 DB cr,lf, 'Ingresa el apotema del hexagono$'
       mensaje23 DB cr,lf, 'El area del hexagono es: $'

; mensajes para el paralelogramo
       mensaje24 DB cr,lf, 'Ingresa la base del paralelogramo: $'
       mensaje25 DB cr,lf, 'Ingresa el lado oblicuo del paralelogramo: $'
       mensaje26 DB cr,lf, 'Ingresa la altura del paralelogramo: $'
       mensaje27 DB cr,lf, 'El area del paralelogramo es: $'
       
; mensajes para el circulo
       mensaje28 DB cr,lf, 'Ingresa el radio del circulo: $'
       mensaje29 DB cr,lf, 'El area del circulo es: $' 
       
       
; mensaje para el perimetro
       mensajep DB cr,lf,' y su per�metro es: $'
       
; mensaje de salida      
       salir DB cr,lf,'Saliendo del programa, presione cualquier tecla...$'
       
       i1 DW ?
       i2 DW ?
       i3 DW ?
       i4 DW ?
       i5 DW ? 
       i6 DW ?
       i7 DW ?
       i8 DW ?
              
       f1 DW ?
       f2 DW ?
       f3 DW ?
       f4 DW ?
       f5 DW ? 
       f6 DW ?
       f7 DW ?
       f8 DW ?
                 
       total_int_input DW ?
       total_float_input DW ?
       next_digit DW ?
             
       
       buffer DB 7, ?

       resultado DB cr,lf,'El resultado es: $'
       espa DB ' ',cr,lf,'$'

       c  EQU 02

;----------------------------------------------------------------
.CODE Area
    JMP INICIO 
    
; Funci�n para leer los inputs del teclado (strings) y obtener su valor num�rico
SCAN_NUM:
    MOV AH, 0AH        ; Funcion para buffered input
    LEA DX, buffer     ; Cargar la direcci�n del buffer
    INT 21H      

    LEA SI, [buffer+2] ; �ndice al primer caracter del buffer
    MOV CL, [buffer+1] ; Cantidad de caracteres del input 

NEXT_NUMBER:
    DEC CL             ; Decrementar contador de caracteres
    JL  END_CONVERSION ; Si CL < 0, ya se leyeron todos los chars 

    MOV AL, [SI]       ; Almacenar el caracter del [SI] en AL
    INC SI             ; Siguiente char
    CMP AL, '.'        ; Leer el punto y comenzar la conversion de la parte fraccional
    JZ  BEGIN_FLOATS
    SUB AL, '0'        ; ASCII -> Valor num�rico
    XOR AH, AH         ; Limpiar AH

    MOV BX, 10         
    MOV next_digit, 0   ; Limpiar variable del d�gito temporal
    ADD next_digit, AX  ; Cargar d�gito temporal (AX) en su variable correspondiente                      
    MOV AX, total_int_input ; Cargar el n�mero total actual en AX
    MUL BX              ; Multiplica por 10 el numero actual para hacer espacio para el siguiente d�gito 
    ADD AX, next_digit  ; A�ade el nuevo d�gito temporal al n�mero actual
    MOV next_digit, 0   ; Limpiar variable del d�gito temporal       
    MOV total_int_input, AX ; Mover el valor num�rico final a su variable

    JMP NEXT_NUMBER     ; Repetir para el siguiente char   

BEGIN_FLOATS:
    MOV CH, 2
    
NEXT_FLOAT_NUMBER:
    DEC CL             ; Decrementar contador de caracteres
    DEC CH
    JL  END_CONVERSION ; Si CL o CH < 0, ya se leyeron todos los chars o se alcanz� el l�mite de cifras float

    MOV AL, [SI]       ; Almacenar el caracter del [SI] en AL
    INC SI             ; Siguiente char
    SUB AL, '0'        ; ASCII -> Valor num�rico
    XOR AH, AH         ; Limpiar AH

    MOV BX, 10         
    MOV next_digit, 0   ; Limpiar variable del d�gito temporal
    ADD next_digit, AX  ; Cargar d�gito temporal (AX) en su variable correspondiente                      
    MOV AX, total_float_input ; Cargar el n�mero total actual en AX
    MUL BX              ; Multiplica por 10 el numero actual para hacer espacio para el siguiente d�gito 
    ADD AX, next_digit  ; A�ade el nuevo d�gito temporal al n�mero actual
    MOV next_digit, 0   ; Limpiar variable del d�gito temporal       
    MOV total_float_input, AX ; Mover el valor num�rico final a su variable

    JMP NEXT_FLOAT_NUMBER     ; Repetir para el siguiente char

END_CONVERSION:
    MOV CX, total_int_input ; Valor num�rico entero final -> CX
    MOV total_int_input, 0 ; Limpiar var.
    MOV DX, total_float_input ; Valor num�rico float final -> DX
    MOV total_float_input, 0 ; Limpiar var.
     
    RET
    
DEFINE_PRINT_NUM_UNS

; Funci�n para imprimir el contenido de DX y un espacio
PRINTLN:
    MOV AH, 09H
    INT 21H

    LEA DX, espa
    INT 21H
    RET
; Funci�n para crear un nuevo display   
NEW_SCREEN:
    MOV AH, 00H
    MOV AL, 03H
    INT 10H
    RET

; Funci�n para imprimir el contenido de DX    
PRINT:
    MOV AH, 09H
    INT 21H
    RET

INICIO:
    MOV ax, Data
    MOV DS, AX

    CALL NEW_SCREEN

    LEA DX, mensaje2
    MOV AH, 09H
    INT 21H

    MOV AH, 07H
    INT 21H

    SUB AL, 30H
    CMP AL, 00H
    JE FIN
    CMP AL, 01H
    JE trapecio
    CMP AL, 02H
    JE cuadrado
    CMP AL, 03H
    JE rectangulo
    CMP AL, 04H
    JE rombo 
    CMP AL, 05H
    JE pentagono 
    CMP AL, 06H
    JE hexagono
    CMP AL, 07
    JE paralelogramo 
    CMP AL, 08
    JE circulo
    JMP INICIO

trapecio:
    MOV AH, 00H
    MOV AL, 03H
    INT 10H

    MOV AH, 09H
    LEA DX, mensaje5
    INT 21H

    CALL SCAN_NUM
    MOV i1, CX 

    MOV AH, 09H
    LEA DX, mensaje3
    INT 21H 

    CALL SCAN_NUM
    MOV i2, CX

    MOV AH, 09H
    LEA DX, mensaje6
    INT 21H 

    CALL SCAN_NUM
    MOV i3, CX

; Calcular el �rea del trapecio: ((base menor + base mayor) / 2) * altura
    MOV AX, i1      ; base menor
    ADD AX, i2      ; base menor + base mayor
    MOV BX, c       ; 2
    DIV BL          ; (base menor + base mayor) / 2
    MOV BX, i3      ; altura
    MUL BX          ; ((base menor + base mayor) / 2) * altura

    MOV SI, AX      ; Guardar el �rea en SI

    LEA DX, mensaje7
    MOV AH, 09H
    INT 21H

    CALL SCAN_NUM
    MOV i4, CX      ; lado no paralelo del trapecio is�sceles

; Calcular el per�metro del trapecio: base menor + base mayor + 2 * lado no paralelo
    MOV AX, i1      ; base menor
    ADD AX, i2      ; base menor + base mayor
    MOV BX, i4      ; lado no paralelo
    ADD AX, BX      ; base menor + base mayor + lado no paralelo
    ADD AX, BX      ; base menor + base mayor + 2 * lado no paralelo

    MOV DI, AX      ; Guardar el per�metro en DI

; Mostrar el �rea y el per�metro del trapecio en una sola l�nea
    MOV AH, 09H
    LEA DX, mensaje8
    INT 21H
    MOV AX, SI
    CALL PRINT_NUM_UNS

    LEA DX, mensajep
    MOV AH, 09H
    INT 21H
    MOV AX, DI
    CALL PRINT_NUM_UNS

    LEA DX, espa
    INT 21H

    LEA DX, mensaje4
    INT 21H

    MOV AH, 01h
    INT 21H
    JMP INICIO

cuadrado:
    MOV AH, 00H
    MOV AL, 03H
    INT 10H

    MOV AH, 09H
    LEA DX, mensaje9
    INT 21H

    CALL SCAN_NUM
    MOV i1, CX      ; Lado del cuadrado

; Calcular el �rea del cuadrado: lado * lado
    MOV AX, i1      ; lado
    MUL AX          ; lado * lado

    MOV SI, AX      ; Guardar el �rea en SI

; Calcular el per�metro del cuadrado: 4 * lado
    MOV AX, i1      ; lado
    MOV BX, 4       ; 4
    MUL BX          ; 4 * lado

    MOV DI, AX      ; Guardar el per�metro en DI

; Mostrar el �rea y el per�metro del cuadrado en una sola l�nea
    MOV AH, 09H
    LEA DX, mensaje10
    INT 21H
    MOV AX, SI
    CALL PRINT_NUM_UNS

    LEA DX, mensajep
    MOV AH, 09H
    INT 21H
    MOV AX, DI
    CALL PRINT_NUM_UNS

    LEA DX, espa
    MOV AH, 09H
    INT 21H

    LEA DX, mensaje4
    INT 21H

    MOV AH, 01h
    INT 21H
    JMP INICIO 
      
    
rectangulo:
    MOV AH, 00H
    MOV AL, 03H
    INT 10H

    MOV AH, 09H
    LEA DX, mensaje11 ; Mensaje para ingresar el ancho
    INT 21H

    CALL SCAN_NUM
    MOV i1, CX ; Guardar el ancho en i1

    MOV AH, 09H
    LEA DX, mensaje12 ; Mensaje para ingresar el largo
    INT 21H 

    CALL SCAN_NUM
    MOV i2, CX ; Guardar el largo en i2

; Calcular el �rea del rect�ngulo: largo * ancho
    MOV AX, i1      ; ancho
    MOV BX, i2      ; largo
    MUL BX          ; ancho * largo

    MOV SI, AX      ; Guardar el Area en SI

; Calcular el per�metro del rect�ngulo: 2 * (largo + ancho)
    MOV AX, i1      ; ancho
    ADD AX, i2      ; ancho + largo
    MOV BX, 2       ; multiplicador para el per�metro
    MUL BX          ; 2 * (ancho + largo)

    MOV DI, AX      ; Guardar el per�metro en DI

; Mostrar el �rea y el per�metro del rect�ngulo en una sola l�nea
    MOV AH, 09H
    LEA DX, mensaje13 ; Mostrar mensaje del �rea del rect�ngulo
    INT 21H
    MOV AX, SI
    CALL PRINT_NUM_UNS

    LEA DX, mensajep ; Mostrar mensaje del per�metro del rect�ngulo
    MOV AH, 09H
    INT 21H
    MOV AX, DI
    CALL PRINT_NUM_UNS

    LEA DX, espa
    MOV AH, 09H
    INT 21H

    LEA DX, mensaje4
    INT 21H

    MOV AH, 01h
    INT 21H
    JMP INICIO 
    
    
rombo:
    MOV AH, 00H
    MOV AL, 03H
    INT 10H

    MOV AH, 09H
    LEA DX, mensaje14
    INT 21H

    CALL SCAN_NUM
    MOV i1, CX 

    MOV AH, 09H
    LEA DX, mensaje15
    INT 21H 

    CALL SCAN_NUM
    MOV i2, CX  
    
    
    MOV AH, 09H
    LEA DX, mensaje16
    INT 21H 

    CALL SCAN_NUM
    MOV i3, CX

; Calcular el �rea del rombo: ((base menor * base mayor) / 2)
    MOV AX, i1      ; diagonal menor
    MOV BX, i2      ; diagonal mayor
    MUL BX          ; diagonal menor * diagonal mayor
    MOV BX, c       ; 2
    DIV BL          ; (diagonal menor * diagonal mayor) / 2
    
    MOV SI, AX      ; Guardar el �rea en SI


; Calcular el per�metro del rombo: lado * 4
    MOV AX, i3      ; lado
    MOV BX, 4      ; 4
    MUL BX
    MOV DI, AX      ; Guardar el per�metro en DI

; Mostrar el �rea y el per�metro del rombo en una sola l�nea
    MOV AH, 09H
    LEA DX, mensaje17
    INT 21H
    MOV AX, SI
    CALL PRINT_NUM_UNS

    LEA DX, mensajep
    MOV AH, 09H
    INT 21H
    MOV AX, DI
    CALL PRINT_NUM_UNS

    LEA DX, espa
    INT 21H

    LEA DX, mensaje4
    INT 21H

    MOV AH, 01h
    INT 21H
    JMP INICIO

    
pentagono:
    MOV AH, 00H
    MOV AL, 03H
    INT 10H

    MOV AH, 09H
    LEA DX, mensaje18
    INT 21H

    CALL SCAN_NUM
    MOV i1, CX 

    MOV AH, 09H
    LEA DX, mensaje19
    INT 21H 

    CALL SCAN_NUM
    MOV i2, CX
    
    
; Calcular el per�metro del pentagono: lado * 5
    MOV AX, i1      ; lado
    MOV BX, 5       ; 5
    MUL BX
    MOV DI, AX      ; Guardar el per�metro en DI 
     

; Calcular el �rea del pentagono: ((perimetro * apotema) / 2)
    MOV BX,AX
    MOV AX, i2
    MUL BX
    MOV BX, 2
    DIV BX
    MOV SI, AX      ; Guardar el �rea en SI



; Mostrar el �rea y el per�metro del rombo en una sola l�nea
    MOV AH, 09H
    LEA DX, mensaje20
    INT 21H
    MOV AX, SI
    CALL PRINT_NUM_UNS

    LEA DX, mensajep
    MOV AH, 09H
    INT 21H
    MOV AX, DI
    CALL PRINT_NUM_UNS

    LEA DX, espa
    INT 21H

    LEA DX, mensaje4
    INT 21H

    MOV AH, 01h
    INT 21H
    JMP INICIO      
    
hexagono:
    MOV AH, 00H
    MOV AL, 03H
    INT 10H

    MOV AH, 09H
    LEA DX, mensaje21
    INT 21H

    CALL SCAN_NUM
    MOV i1, CX 

    MOV AH, 09H
    LEA DX, mensaje22
    INT 21H 

    CALL SCAN_NUM
    MOV i2, CX
    
    
; Calcular el per�metro del hexagono: lado * 6
    MOV AX, i1      ; lado
    MOV BX, 6       ; 6
    MUL BX
    MOV DI, AX      ; Guardar el per�metro en DI 
     

; Calcular el �rea del hexagono: ((perimetro * apotema) / 2)
    MOV BX,AX
    MOV AX, i2
    MUL BX
    MOV BX, 2
    DIV BX
    MOV SI, AX      ; Guardar el �rea en SI



; Mostrar el �rea y el per�metro del hexagono en una sola l�nea
    MOV AH, 09H
    LEA DX, mensaje23
    INT 21H
    MOV AX, SI
    CALL PRINT_NUM_UNS

    LEA DX, mensajep
    MOV AH, 09H
    INT 21H
    MOV AX, DI
    CALL PRINT_NUM_UNS

    LEA DX, espa
    INT 21H

    LEA DX, mensaje4
    INT 21H

    MOV AH, 01h
    INT 21H
    JMP INICIO       
    
paralelogramo:
    MOV AH, 00H
    MOV AL, 03H
    INT 10H

    MOV AH, 09H
    LEA DX, mensaje24
    INT 21H

    CALL SCAN_NUM
    MOV i1, CX 

    MOV AH, 09H
    LEA DX, mensaje25
    INT 21H 

    CALL SCAN_NUM
    MOV i2, CX 
    
    MOV AH, 09H
    LEA DX, mensaje26
    INT 21H 

    CALL SCAN_NUM
    MOV i3, CX
    
    
; Calcular el per�metro del paralelogramo: base * 2 + lado * 2
    MOV AX, i1      ; base
    ADD AX, i2      ; base + lado
    MOV BX, 2       ; multiplicador para el per�metro
    MUL BX
    MOV DI, AX      ; Guardar el per�metro en DI 
     

; Calcular el �rea del hexagono: base * altura
    MOV AX, i1
    MOV BX, i3
    MUL BX
    MOV SI, AX      ; Guardar el �rea en SI



; Mostrar el �rea y el per�metro del hexagono en una sola l�nea
    MOV AH, 09H
    LEA DX, mensaje27
    INT 21H
    MOV AX, SI
    CALL PRINT_NUM_UNS

    LEA DX, mensajep
    MOV AH, 09H
    INT 21H
    MOV AX, DI
    CALL PRINT_NUM_UNS

    LEA DX, espa
    INT 21H

    LEA DX, mensaje4
    INT 21H

    MOV AH, 01h
    INT 21H
    JMP INICIO
    
circulo:
    MOV AH, 00H
    MOV AL, 03H
    INT 10H

    MOV AH, 09H
    LEA DX, mensaje28
    INT 21H

    CALL SCAN_NUM
    MOV i1, CX      ; radio del circulo

; Calcular el �rea del circulo: pi * radio * radio
    MOV AX, i1      ; radio
    MUL AX          ; radio * radio
    MOV BX, 3
    MUL BX
    MOV SI, AX      ; Guardar el �rea en SI

; Calcular el per�metro del circulo: 2 * PI * R
    MOV AX, i1      ; lado
    MOV BX, 3       ; 4
    MUL BX
    MOV BX, 2
    MUL BX          

    MOV DI, AX      ; Guardar el per�metro en DI

; Mostrar el �rea y el per�metro del circulo en una sola l�nea
    MOV AH, 09H
    LEA DX, mensaje29
    INT 21H
    MOV AX, SI
    CALL PRINT_NUM_UNS

    LEA DX, mensajep
    MOV AH, 09H
    INT 21H
    MOV AX, DI
    CALL PRINT_NUM_UNS

    LEA DX, espa
    INT 21H

    LEA DX, mensaje4
    INT 21H

    MOV AH, 01h
    INT 21H
    JMP INICIO

    

FIN:
    MOV AH, 09H
    LEA DX, salir
    INT 21H 

    MOV AH, 07H
    INT 21H

    MOV AH, 01H
    MOV AL, 03H
    INT 10H 

    MOV AX, 4C00h
    INT 21h

.EXIT
END
