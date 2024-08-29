
TITLE Area de un trapecio
INCLUDE 'EMU8086.INC'
CR EQU 13
LF EQU 10

;---------------------------------------------
.MODEL SMALL
.STACK 200 ; Se define la pila
.DATA ; Se definen datos
       mensaje1 DB cr,lf,'GeometryTEC$'
       mensajeF DB CR, LF, 'Que figura te gustaria seleccionar?', CR, LF, LF
        DB '1. Trapecio', CR, LF
        DB '2. Triangulo', CR, LF
        DB '3. Cuadrado', CR, LF
        DB '4. Rectangulo', CR, LF
        DB '5. Circulo', CR, LF
        DB '6. Rombo', CR, LF
        DB '7. Pentagono', CR, LF
        DB '8. Paralelogramo', CR, LF
        DB '9. Hexagono', '$'

        mensajeT DB cr,lf,'Este es el trapecio, presione 1 para pasar a los calculos y 0 para volver al INICIO.$'
        mensajeC DB cr,lf,'Presione 1 para calcular el area y 2 para calcular el perimetro.$'
        mensaje2 DB cr,lf,'Ingrese la base menor del trapecio y presione ENTER: $'
        mensaje3 DB cr,lf,'Ingrese la base mayor del trapecio y presione ENTER: $'
        mensaje4 DB cr,lf,'Presione cualquier tecla para continuar.$'
        mensaje5 DB cr,lf,'Presione 1 si esta activo y 0 para salir.$'
        mensaje6 DB cr,lf,'Ingrese la altura del trapecio y presione ENTER: $'
        mensaje10 DB cr,lf,'El area del trapecio es: $' 
        mensajePT DB cr,lf,'El perimetro del trapecio es: $'
        mensajeBMT DB cr,lf,'Ingrese la base menor del trapecio y presione ENTER: $'
        mensajeBMAT DB cr,lf,'Ingrese la base mayor del trapecio y presione ENTER: $'
        mensajeDT DB cr,lf,'Ingrese la diagonal del trapecio y presione ENTER: $'
        mensajeRPT DB cr,lf,'El perimetro del trapecio es: $'
        salir DB cr,lf,'Saliendo del programa. Presione cualquier tecla...$'
        
        ;Mensajes de Triangulo
        mensaje12 DB cr,lf,'El area del triangulo es: $'
        mensajeCt DB cr,lf,'Presione 1 para calcular el area y 2 para calcular el perimetro.$'
        mensajeTri DB cr,lf,'Este es el triangulo, presione 1 para pasar a los calculos y 0 para volver al INICIO.$'
        mensaje6Tri DB cr,lf,'Ingrese la altura del triangulo y presione ENTER: $'
        mensaje2Tri DB cr,lf,'Ingrese el lado del triangulo y presione ENTER: $'
        mensajeBTR DB cr,lf,'Ingrese la base del triangulo y presione ENTER: $'
        mensaje123 DB cr,lf,'El perimetro del triangulo es: $'
        
        ;Mensajes del Cuadrado
        mensajeCU DB cr,lf,'Este es el cuadrado, presione 1 para pasar a los calculos y 0 para volver al INICIO.$'
        mensajeCA DB cr,lf,'El area del cuadrado es: $' 
        mensajeAC DB cr,lf,'El area del cuadrado es: $'
        mensajeCPE DB cr,lf,'El perimetro del cuadrado es: $'
        mensajePC DB cr,lf,'El perimetro del cuadrado es: $'
        mensajeLC DB cr,lf,'Ingrese el lado del cuadrado y presione ENTER: $'   
        
        ;Mensajes del Rectangulo
        mensajeR DB cr,lf,'Este es el rectangulo, presione 1 para pasar a los calculos y 0 para volver al INICIO.$'
        mensajeRA DB cr,lf,'El area del rectangulo es: $' 
        mensajeAR DB cr,lf,'El area del rectangulo es: $'
        mensajeRP DB cr,lf,'El perimetro del rectangulo es: $'
        mensajePR DB cr,lf,'El perimetro del rectangulo es: $'  
        mensajeLR DB cr,lf,'Ingrese el largo del rectangulo y presione ENTER: $'
        mensajeANR DB cr,lf,'Ingrese el ancho del rectangulo y presione ENTER: $'
        
        ;Mensajes del Circulo
        mensajeCirculo DB cr,lf,'Este es el circulo, presione 1 para pasar a los calculos y 0 para volver al INICIO.$'
        mensajeAreaCirculo DB cr,lf,'El area del circulo es: $' 
        mensajeACirculo DB cr,lf,'El area del circulo es: $'
        mensajePeriCirculo DB cr,lf,'El perimetro del circulo es: $'
        mensajePCirculo DB cr,lf,'El perimetro del circulo es: $' 
        mensajeRadio DB cr,lf,'Ingrese el radio del circulo y presione ENTER: $'
        
        ;Mensajes del Rombo
        mensajeRombo DB cr,lf,'Este es el rombo, presione 1 para pasar a los calculos y 0 para volver al INICIO.$'
        mensajeDiag1 DB cr,lf,'Ingrese la longitud de la diagonal 1 del rombo y presione ENTER: $'
        mensajeDiag2 DB cr,lf,'Ingrese la longitud de la diagonal 2 del rombo y presione ENTER: $'
        mensajeAreaRombo DB cr,lf,'El area del rombo es: $'
        mensajePeriRombo DB cr,lf,'El perimetro del rombo es: $'   
        
        ;Mensajes del Pentagono
        mensajePentagono DB cr,lf,'Este es el pentagono, presione 1 para pasar a los calculos y 0 para volver al INICIO.$'
        mensajeLadoP DB cr,lf,'Ingrese la longitud del lado del pentagono y presione ENTER: $'
        mensajeAreaP DB cr,lf,'El area del pentagono es: $'
        mensajePeriP DB cr,lf,'El perimetro del pentagono es: $'   
        mensajeApotPen DB cr,lf,'Ingrese la longitud del apotema del pentagono y presione ENTER: $'
        
        ;Mensajes del Paralelogramo
        mensajeParalelogramo DB cr,lf,'Este es el paralelogramo, presione 1 para pasar a los calculos y 0 para volver al INICIO.$'
        mensajeBase DB cr,lf,'Ingrese la longitud de la base del paralelogramo y presione ENTER: $'
        mensajeAltura DB cr,lf,'Ingrese la altura del paralelogramo y presione ENTER: $'
        mensajeAreaPar DB cr,lf,'El area del paralelogramo es: $'
        mensajePeriPar DB cr,lf,'El perimetro del paralelogramo es: $'
        
        ;Mensajes del Hexagono
        mensajeHexagono DB cr,lf,'Este es el hexagono, presione 1 para pasar a los calculos y 0 para volver al INICIO.$'
        mensajeLadoH DB cr,lf,'Ingrese la longitud del lado del hexagono y presione ENTER: $'
        mensajeAreaH DB cr,lf,'El area del hexagono es: $'
        mensajePeriH DB cr,lf,'El perimetro del hexagono es: $'
        mensajeApotH DB cr,lf,'Ingrese la longitud del apotema del hexagono y presione ENTER: $'
        

       
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
       
       ti1 DW ?
       ti2 DW ?
       ti3 DW ?
      
       tf1 DW ?
       tf2 DW ?
       tf3 DW ?
                 
       total_int_input DW ?
       total_float_input DW ?
       next_digit DW ?
             
       
       buffer DB 7, ?

       resultado DB cr,lf,'El area del trapecio es:$'
       resultadoTri DB cr,lf,'El area del triangulo es:$'
       resultadoTriP DB cr,lf,'El perimetro del triangulo es:$'
       espa DB ' ',cr,lf,'$'

       c  equ 02
       a  equ 03
       

;----------------------------------------------------------------
.CODE Area
    DEFINE_PRINT_NUM_UNS
    jmp INICIO
 
 
 ;Funcion para imprimir un caracter desde DL    
PRINT_CHAR:
    MOV AH, 02H
	INT 21H
	RET
	
	   
 ; Funcion para leer los inputs del teclado (strings) y obtener su valor numerico   
 SCAN_NUM:
    MOV AH, 0AH        ; Funcion para buffered input
    LEA DX, buffer     ; Cargar la direcci�n del buffer
    INT 21H      

    LEA SI, [buffer+2] ; I�ndice al primer caracter del buffer
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
    MOV next_digit, 0   ; Limpiar variable del digito temporal
    ADD next_digit, AX  ; Cargar digito temporal (AX) en su variable correspondiente                      
    MOV AX, total_int_input ; Cargar el numero total actual en AX
    MUL BX              ; Multiplica por 10 el numero actual para hacer espacio para el siguiente digito 
    ADD AX, next_digit  ; Suma el nuevo digito temporal al numero actual
    MOV next_digit, 0   ; Limpiar variable del digito temporal       
    MOV total_int_input, AX ; Mover el valor numerico final a su variable

    JMP NEXT_NUMBER     ; Repetir para el siguiente char   

BEGIN_FLOATS:
    MOV CH, 2
    
NEXT_FLOAT_NUMBER:
    DEC CL             ; Decrementar contador de caracteres
    JL  END_FLOATS_CONVERSION ; Si CL < 0, ya se leyeron todos los chars
    DEC CH
    JL  END_CONVERSION ; Si CH < 0, se alcanzo el limite de cifras float

    MOV AL, [SI]       ; Almacenar el caracter del [SI] en AL
    INC SI             ; Siguiente char
    SUB AL, '0'        ; ASCII -> Valor numerico
    XOR AH, AH         ; Limpiar AH

    MOV BX, 10         
    MOV next_digit, 0   ; Limpiar variable del digito temporal
    ADD next_digit, AX  ; Cargar digito temporal (AX) en su variable correspondiente                      
    MOV AX, total_float_input ; Cargar el numero total actual en AX
    MUL BX              ; Multiplica por 10 el numero actual para hacer espacio para el siguiente digito 
    ADD AX, next_digit  ; Suma el nuevo digito temporal al numero actual
    MOV next_digit, 0   ; Limpiar variable del digito temporal       
    MOV total_float_input, AX ; Mover el valor numerico final a su variable

    JMP NEXT_FLOAT_NUMBER     ; Repetir para el siguiente char
    
END_FLOATS_CONVERSION:
    CMP total_float_input, 10 
    JL  FILL_FLOAT      ; Si se obtiene un float de una cifra, se multiplica por 10 para que complete los dos espacios para fraccionales
    JMP END_CONVERSION
    
FILL_FLOAT:
    MOV AX, total_float_input
    MOV BX, 10
    MUL BX
    MOV total_float_input, AX
    JMP END_CONVERSION
    
END_CONVERSION:
    MOV CX, total_int_input ; Valor numerico entero final -> CX
    MOV total_int_input, 0 ; Limpiar var.
    MOV DX, total_float_input ; Valor numerico float final -> DX
    MOV total_float_input, 0 ; Limpiar var.
     
    RET
    
; Suma de numeros float (ti1 + ti2)[int] + (tf1 + tf2)[float] = ti3[int] + tf3[float]
FLOAT_ADD:
    MOV ti3, 0
    MOV tf3, 0
    
    MOV AX, ti1 ; Carga ti1
    ADD AX, ti2 ; Sumar ti1 + ti2
    MOV ti3, AX ; Resultado en ti3
    
    MOV AX, tf1 ; Carga tf1
    ADD AX, tf2 ; Sumar tf1 + tf2
    MOV tf3, AX ; Resultado en tf3
    CMP tf3, 100; Verificar si hay acarreo
    JGE INC_INT; Agregar acarreo a la parte entera
    
CARRY_ADDED:
    MOV ti1, 0
    MOV ti2, 0
    MOV tf1, 0
    MOV tf2, 0
    RET
    
INC_INT:
    INC ti3
    SUB tf3, 100
    JMP CARRY_ADDED  
    
FLOAT_DIV:
    ; ti1 x ti2
    MOV ti3, 0
    MOV tf3, 0
    MOV AX, ti1
    DIV ti2
    MOV ti3, AX
    
    ; ti2 x tf1
    MOV AX, ti2
    MUL tf1
    MOV BX, 100
    DIV BX
    ADD ti3, AX
    ADD tf3, DX
    
    ; ti1 x tf2
    MOV AX, ti1
    MUL tf2
    MOV BX, 100
    DIV BX
    ADD ti3, AX
    ADD tf3, DX
    
    ; tf1 x tf2
    MOV AX, tf1
    MUL tf2
    MOV BX, 10000
    DIV BX
    ADD tf3, AX
    CMP tf3, 100
    JGE ADD_MUL_CARRY ; Verificar si hay carry de la parte flotante
    

; Multiplicacion de floats ti1 x ti2 + ti2 x tf1 / 100 + ti1 x tf2 / 100 + tf1 x tf2 / 10000    
FLOAT_MUL:
    ; ti1 x ti2
    MOV ti3, 0
    MOV tf3, 0
    MOV AX, ti1
    MUL ti2
    MOV ti3, AX
    
    ; ti2 x tf1
    MOV AX, ti2
    MUL tf1
    MOV BX, 100
    DIV BX
    ADD ti3, AX
    ADD tf3, DX
    
    ; ti1 x tf2
    MOV AX, ti1
    MUL tf2
    MOV BX, 100
    DIV BX
    ADD ti3, AX
    ADD tf3, DX
    
    ; tf1 x tf2
    MOV AX, tf1
    MUL tf2
    MOV BX, 10000
    DIV BX
    ADD tf3, DX
    CMP tf3, 100
    JGE ADD_MUL_CARRY ; Verificar si hay carry de la parte flotante
    
MUL_CARRY_ADDED:
    MOV CX, ti3
    MOV DX, tf3
    RET
    
ADD_MUL_CARRY:
    SUB tf3, 100
    INC ti3
    JMP MUL_CARRY_ADDED  
    
FLOAT_DIV_2:
    MOV ti3, 0
    MOV tf3, 0
    MOV AX,tf1
    MUL ti2 
    MOV BX, 4
    DIV BX
    ADD tf3,AX
    MOV AX,ti1
    MUL ti2 
    MOV BX, 4
    DIV BX
    ADD ti3,AX
    JMP FILL_INT_DIV

FILL_INT_DIV:
    CMP DX, 10
    JLE FILL_FLOAT_DIV
    JMP END_FLOAT_DIV
    
FILL_FLOAT_DIV:
    MOV AX, DX
    MOV BX,10
    MUL BX
    ADD tf3, AX
    JMP END_FLOAT_DIV
    
END_FLOAT_DIV:
    MOV CX, ti3
    MOV DX, tf3
    ret    
    
    
    
    
PRINT_FLOAT_NUM:    
    ; Imprimir parte entera
    MOV AX, ti3
    CALL PRINT_NUM_UNS
    ; Imprimir punto
    MOV DL, 46
    CALL PRINT_CHAR
    ; Imprimir parte fraccional
    MOV AX, tf3
    CALL PRINT_NUM_UNS
    RET
    
; Ciclo para calcular los datos de una nueva figura o salir
END_FIGURE:
    LEA DX,mensaje4
    CALL PRINTLN
    
    MOV AH,07H
    INT 21H  
    
    CALL NEW_SCREEN

    JMP inicio

; Funcion para imprimir el contenido de DX y un espacio
PRINTLN:
    MOV AH, 09H
    INT 21H

    LEA DX, espa
    INT 21H
    RET
    
; Funcion para crear un nuevo display   
NEW_SCREEN:
    MOV AH, 00H
    MOV AL, 03H
    INT 10H
    RET

; Funcion para imprimir el contenido de DX    
PRINT:
    MOV AH, 09H
    INT 21H
    RET 

INICIO:
    MOV ax,Data
    MOV DS,AX

    ; Mostrar el mensaje inicial
    MOV AH,09H
    LEA DX,mensaje1
    INT 21H

    LEA DX,espa
    INT 21H

    ; Mostrar el mensaje de confirmacion
    MOV AH,09H
    LEA DX,mensaje5
    INT 21H

    LEA DX,espa
    INT 21H

    ; Leer la entrada del usuario
    MOV AH,07H
    INT 21H
    SUB AL,30H        ; Convertir de ASCII a numero

    ; Comparar la entrada
    CMP AL,00H
    JE fin            ; Si la entrada es 0, ir al final (salir del programa)
    CMP AL,01H
    JE seleccion_figura

    ; Si la entrada no es 0 ni 1, volver al INICIO
    JMP INICIO

seleccion_figura:
    ; Mostrar el mensaje de seleccion de figura
    MOV AH,09H
    LEA DX,mensajeF
    INT 21H

    LEA DX,espa
    INT 21H

    ; Leer la entrada del usuario para la figura
    MOV AH,07H
    INT 21H
    SUB AL,30H        ; Convertir de ASCII a numero

    ; Comparar la entrada para la figura
    CMP AL,01H
    JE trapecio     ; Si la entrada es 1, ir a la rutina de calculo
    
    CMP AL, 02H
    JE triangulo
    
    CMP AL, 03H
    JE cuadrado
    
    CMP AL, 04H
    JE RECTANGULO
    
    CMP AL,5H
    JE CIRCULO
    
    CMP AL,6H
    JE ROMBO
               
    CMP AL,7H
    JE PENTAGONO
    
    CMP AL,8H
    JE PARALELOGRAMO
    
    CMP AL,9H
    JE HEXAGONO           
               
               

    ; Si la entrada no es 1, volver al INICIO
    JMP INICIO

;TRAPECIO 
trapecio:
    LEA DX, mensajeT    
    CALL PRINTLN
    
    MOV AH,01H
    INT 21H
    SUB AL,30H
    
    CMP AL, 01H
    JE seleccion_calculoT
    
    JMP INICIO
    
seleccion_calculoT:
    LEA DX,mensajeC
    CALL PRINTLN
    
    MOV AH,01H
    INT 21H
    SUB AL,30H 
    
    CMP AL,01H
    JE multiplica
    
    CMP AL, 02H
    JE PerimetroT 
    
    JMP INICIO
    
    

multiplica:
   CALL NEW_SCREEN 
                        
    LEA DX,mensaje2
    CALL PRINT    
    CALL SCAN_NUM
    MOV ti1, CX
    MOV tf1, DX  
    
    
    LEA DX,mensaje3
    CALL PRINT    
    CALL SCAN_NUM     
    MOV ti2, CX
    MOV tf2, DX 
    CALL FLOAT_ADD
    MOV CX, ti3
    MOV DX ,tf3
    MOV ti1, CX
    MOV tf1, DX
 
    
    LEA DX,mensaje6
    CALL PRINT    
    CALL SCAN_NUM     
    MOV ti2, CX
    MOV tf2, DX 
    CALL FLOAT_MUL
    MOV CX, ti3
    MOV DX ,tf3
    MOV ti1, CX
    MOV tf1, DX     
    MOV ti2,2
    MOV tf2, 0 
    CALL FLOAT_DIV_2    
    

    
    LEA DX, mensaje10
    CALL PRINT  
      
    CALL PRINT_FLOAT_NUM
    
    
    JMP END_FIGURE
    


PerimetroT:

    CALL NEW_SCREEN
    
    LEA DX,mensajeDT
    CALL PRINT    
    CALL SCAN_NUM
    MOV ti1, CX
    MOV tf1, DX 
    MOV ti2, 2
    MOV tf2, 0
    CALL FLOAT_MUL
    MOV CX,ti3
    MOV DX,tf3
    MOV ti1, CX
    MOV tf1, DX  
    
    
    LEA DX,mensaje2
    CALL PRINT    
    CALL SCAN_NUM     
    MOV ti2, CX
    MOV tf2, DX 
    CALL FLOAT_ADD
    MOV CX,ti3
    MOV DX,tf3
    MOV ti1, CX
    MOV tf1, DX   
    
    LEA DX,mensaje3
    CALL PRINT    
    CALL SCAN_NUM     
    MOV ti2, CX
    MOV tf2, DX 
    CALL FLOAT_ADD
    

    
    LEA DX, mensajePT
    CALL PRINT  
      
    
   
    CALL PRINT_FLOAT_NUM
    
    JMP END_FIGURE 


    
;TRIANGULO
triangulo:
    MOV AH, 09H
    LEA DX, mensajeTri    
    INT 21H
    
    LEA DX, espa
    INT 21H
    
    MOV AH,01H
    INT 21H
    SUB AL,30H
    
    CMP AL, 01H
    JE seleccion_calculoTri
    
    JMP INICIO
    
seleccion_calculoTri:
    MOV AH, 09H
    LEA DX,mensajeCt
    INT 21H
    
    LEA DX, espa
    INT 21H
    
    MOV AH,01H
    INT 21H
    SUB AL,30H 
    
    CMP AL,01H
    JE multiplica_tri
    
    CMP AL, 02H
    JE perimetro_Tri 
    
    JMP INICIO
         
multiplica_tri:
    CALL NEW_SCREEN
                        
    LEA DX,mensajeBTR
    CALL PRINT    
    CALL SCAN_NUM
    MOV ti1, CX
    MOV tf1, DX  
    
    
    LEA DX,mensaje6Tri
    CALL PRINT    
    CALL SCAN_NUM     
    MOV ti2, CX
    MOV tf2, DX 
    CALL FLOAT_MUL
    MOV CX, ti3
    MOV DX ,tf3
    MOV ti1, CX
    MOV tf1, DX     
    MOV ti2,2
    MOV tf2, 0 
    CALL FLOAT_DIV_2    
    
    
    LEA DX, mensaje12
    CALL PRINT  
      
    CALL PRINT_FLOAT_NUM
    
    JMP END_FIGURE
    
     
    
perimetro_Tri:
    CALL NEW_SCREEN
    
    LEA DX,mensaje2Tri
    CALL PRINTLN
    
    CALL SCAN_NUM
    MOV ti1, CX
    MOV tf1,DX
    MOV ti2,3
    MOV tf2,0 
    
     
   
    LEA DX, mensaje123
    CALL PRINT
  
    
    CALL FLOAT_MUL

    
    CALL PRINT_FLOAT_NUM

    JMP END_FIGURE
    
;CUADRADO

cuadrado:
    MOV AH, 09H
    LEA DX, mensajeCU    
    INT 21H
    
    LEA DX, espa
    INT 21H
    
    MOV AH,01H
    INT 21H
    SUB AL,30H
    
    CMP AL, 01H
    JE seleccion_calculoC
    
    JMP INICIO
    
seleccion_calculoC:
    MOV AH, 09H
    LEA DX,mensajeCt
    INT 21H
    
    LEA DX, espa
    INT 21H
    
    MOV AH,01H
    INT 21H
    SUB AL,30H 
    
    CMP AL,01H
    JE multiplica_Cua
    
    CMP AL, 02H
    JE perimetro_Cua 
    
    JMP INICIO
    
    
multiplica_Cua:
    CALL NEW_SCREEN                      
    
    LEA DX,mensajeLC
    CALL PRINTLN
    
    CALL SCAN_NUM
    MOV ti1, CX
    MOV tf1, DX
    MOV ti2, CX
    MOV tf2, DX
    
    LEA DX, mensajeAC
    CALL PRINT  
    
    CALL FLOAT_MUL  
    
   
    CALL PRINT_FLOAT_NUM
    
    JMP END_FIGURE  
    
perimetro_Cua:
    CALL NEW_SCREEN

    LEA DX, mensajeLC
    CALL PRINT
    
    CALL SCAN_NUM
    MOV ti1, CX
    MOV tf1,DX
    MOV ti2,4
    MOV tf2,0 
    
    LEA DX, mensajePC
    CALL PRINT
  
    
    CALL FLOAT_MUL

    
    CALL PRINT_FLOAT_NUM
    
    
    JMP END_FIGURE
    
Rectangulo:
    MOV AH, 09H
    LEA DX, mensajeR    
    INT 21H
    
    LEA DX, espa
    INT 21H
    
    MOV AH,01H
    INT 21H
    SUB AL,30H
    
    CMP AL, 01H
    JE seleccion_calculoR 

seleccion_calculoR:
    MOV AH, 09H
    LEA DX,mensajeCt
    INT 21H
    
    LEA DX, espa
    INT 21H
    
    MOV AH,01H
    INT 21H
    SUB AL,30H 
    
    CMP AL,01H
    JE multiplica_Rec
    
    CMP AL, 02H
    JE perimetro_Rec 
    
    
    JMP INICIO
  
multiplica_Rec:
    CALL NEW_SCREEN
                 
    LEA DX,mensajeLR
    CALL PRINT    
    CALL SCAN_NUM
    MOV ti1, CX
    MOV tf1, DX 
                                                                                 
    LEA DX,mensajeANR
    CALL PRINT    
    CALL SCAN_NUM 
    MOV ti2, CX
    MOV tf2, DX
    CALL FLOAT_MUL 
    
    LEA DX, mensajeRA
    CALL PRINT  
      
    CALL PRINT_FLOAT_NUM
    
    JMP END_FIGURE
    
perimetro_Rec:
    CALL NEW_SCREEN

    LEA DX,mensajeLR
    CALL PRINT
      
    CALL SCAN_NUM
    MOV ti1, CX
    MOV tf1, DX
    
    
    LEA DX,mensajeANR
    CALL PRINT
        
    CALL SCAN_NUM 
    MOV ti2, CX
    MOV tf2, DX 
    CALL FLOAT_ADD
    MOV CX,ti3
    MOV DX,tf3 
    MOV ti1, CX
    MOV tf1, DX 
    MOV ti2, 2
    MOV tf2, 0 
    CALL FLOAT_MUL
    
    LEA DX, mensajeRP
    CALL PRINT  
      
    CALL PRINT_FLOAT_NUM
    
    JMP END_FIGURE     

; CIRCULO

circulo:
    MOV AH, 00H
    MOV AL, 03H
    INT 10H

    MOV AH, 09H
    LEA DX, mensajeCirculo
    INT 21H
    
    LEA DX, espa
    INT 21H
    
    MOV AH, 01H
    INT 21H
    SUB AL, 30H
    
    CMP AL, 01H
    JE seleccion_calculoCirculo
    
    JMP INICIO

seleccion_calculoCirculo:
    MOV AH, 09H
    LEA DX, mensajeCt
    INT 21H
    
    LEA DX, espa
    INT 21H
    
    MOV AH, 01H
    INT 21H
    SUB AL, 30H 
    
    CMP AL, 01H
    JE calcular_areaCirculo
    
    CMP AL, 02H
    JE calcular_perimetroCirculo 
    
    JMP INICIO

calcular_areaCirculo:
    CALL NEW_SCREEN  
                        
    LEA DX,mensajeRadio
    CALL PRINT
        
    CALL SCAN_NUM
    MOV ti1, CX
    MOV tf1, DX 
    MOV ti2, CX
    MOV tf2, DX
                                                                                 
    CALL FLOAT_MUL
    MOV CX, ti3  
    MOV DX, ti3 
    
    MOV ti1, CX
    MOV tf1, DX 
                                                                     
    MOV ti2, 3
    MOV tf2, 14  
    CALL FLOAT_MUL
    

    LEA DX, mensajeACirculo
    CALL PRINT  
      
    CALL PRINT_FLOAT_NUM
    
    JMP END_FIGURE

calcular_perimetroCirculo:
    CALL NEW_SCREEN
                        
    LEA DX,mensajeRadio
    CALL PRINT    
    CALL SCAN_NUM
    MOV ti1, CX
    MOV tf1, DX 
                                                                                 
    MOV ti2, 3
    MOV tf2, 14
    CALL FLOAT_MUL
    MOV CX, ti3  
    MOV DX, ti3 
    
    MOV ti1, CX
    MOV tf1, DX 
                                                                                 
    MOV ti2, 2
    MOV tf2, 0  
    CALL FLOAT_MUL
    

    LEA DX, mensajePCirculo
    CALL PRINT  

    CALL PRINT_FLOAT_NUM
    
    JMP END_FIGURE

; Codigo del rombo
rombo:
    MOV AH, 09H
    LEA DX, mensajeRombo    
    INT 21H
    
    LEA DX, espa
    INT 21H
    
    MOV AH, 01H
    INT 21H
    SUB AL, 30H
    
    CMP AL, 01H
    JE seleccion_calculoRombo
    
    JMP INICIO

seleccion_calculoRombo:
    MOV AH, 09H
    LEA DX, mensajeCt
    INT 21H
    
    LEA DX, espa
    INT 21H
    
    MOV AH, 01H
    INT 21H
    SUB AL, 30H 
    
    CMP AL, 01H
    JE calcular_areaRombo
    
    CMP AL, 02H
    JE calcular_perimetroRombo 
    
    JMP INICIO

calcular_areaRombo:
    CALL NEW_SCREEN
                        
    LEA DX,mensajeDiag1
    CALL PRINT    
    CALL SCAN_NUM
    MOV ti1, CX
    MOV tf1, DX  
    
    
    LEA DX,mensajeDiag2
    CALL PRINT    
    CALL SCAN_NUM     
    MOV ti2, CX
    MOV tf2, DX 
    CALL FLOAT_MUL
    MOV CX, ti3
    MOV DX ,tf3
    MOV ti1, CX
    MOV tf1, DX     
    MOV ti2,2
    MOV tf2, 0 
    CALL FLOAT_DIV_2    
    
    
    LEA DX, mensajeAreaRombo
    CALL PRINT  

    CALL PRINT_FLOAT_NUM
    
    JMP END_FIGURE

calcular_perimetroRombo:
    CALL NEW_SCREEN
    
    LEA DX,mensajeDiag1
    CALL PRINT
    
    CALL SCAN_NUM
    MOV ti1, CX
    MOV tf1,DX
    MOV ti2,4
    MOV tf2,0 
    
     
   
    LEA DX, mensajePeriRombo
    CALL PRINT
  
    CALL FLOAT_MUL

    CALL PRINT_FLOAT_NUM
    
    
    JMP END_FIGURE

; Codigo del Pentagono
pentagono:
    MOV AH, 09H
    LEA DX, mensajePentagono    
    INT 21H
    
    LEA DX, espa
    INT 21H
    
    MOV AH, 01H
    INT 21H
    SUB AL, 30H
    
    CMP AL, 01H
    JE seleccion_calculoPentagono
    
    JMP INICIO

seleccion_calculoPentagono:
    MOV AH, 09H
    LEA DX, mensajeCt
    INT 21H
    
    LEA DX, espa
    INT 21H
    
    MOV AH, 01H
    INT 21H
    SUB AL, 30H 
    
    CMP AL, 01H
    JE calcular_areaPentagono
    
    CMP AL, 02H
    JE calcular_perimetroPentagono 
    
    JMP INICIO

calcular_areaPentagono:
    CALL NEW_SCREEN  
                        
    LEA DX, mensajeLadoP
    CALL PRINT    
    CALL SCAN_NUM
    MOV ti1, CX
    MOV tf1,DX
    MOV ti2,5
    MOV tf2,0
    CALL FLOAT_MUL
    MOV CX, ti3
    MOV DX ,tf3
    MOV ti1, CX
    MOV tf1, DX   
    
    
    LEA DX,mensajeApotPen
    CALL PRINT    
    CALL SCAN_NUM     
    MOV ti2, CX
    MOV tf2, DX 
    CALL FLOAT_MUL
    MOV CX, ti3
    MOV DX ,tf3
    MOV ti1, CX
    MOV tf1, DX     
    MOV ti2,2
    MOV tf2, 0 
    CALL FLOAT_DIV_2    
    
    
    LEA DX, mensajeAreaP
    CALL PRINT  
      
    CALL PRINT_FLOAT_NUM
    
    JMP END_FIGURE

calcular_perimetroPentagono:
    CALL NEW_SCREEN
    
    LEA DX,mensajeLadoP
    CALL PRINT
    
    CALL SCAN_NUM
    MOV ti1, CX
    MOV tf1,DX
    MOV ti2,5
    MOV tf2,0
    
     
   
    LEA DX, mensajePeriP
    CALL PRINT

    CALL FLOAT_MUL

    CALL PRINT_FLOAT_NUM
    
    JMP END_FIGURE   
    
; Codigo del Paralelogramo
paralelogramo:
    MOV AH, 09H
    LEA DX, mensajeParalelogramo    
    INT 21H
    
    LEA DX, espa
    INT 21H
    
    MOV AH, 01H
    INT 21H
    SUB AL, 30H
    
    CMP AL, 01H
    JE seleccion_calculoParalelogramo
    
    JMP INICIO

seleccion_calculoParalelogramo:
    MOV AH, 09H
    LEA DX, mensajeCt
    INT 21H
    
    LEA DX, espa
    INT 21H
    
    MOV AH, 01H
    INT 21H
    SUB AL, 30H 
    
    CMP AL, 01H
    JE calcular_areaParalelogramo
    
    CMP AL, 02H
    JE calcular_perimetroParalelogramo 
    
    JMP INICIO

calcular_areaParalelogramo:
    CALL NEW_SCREEN
                    
    LEA DX,mensajeBase
    CALL PRINT    
    CALL SCAN_NUM
    MOV ti1, CX
    MOV tf1, DX 
    CALL FLOAT_MUL

    LEA DX, mensajeAltura
    CALL PRINT    
    CALL SCAN_NUM 
    MOV ti2, CX
    MOV tf2, DX
    CALL FLOAT_MUL
    
    
    
    LEA DX, mensajeAreaPar
    CALL PRINT  
      
    CALL PRINT_FLOAT_NUM
    
    JMP END_FIGURE

calcular_perimetroParalelogramo:
    CALL NEW_SCREEN 
                        
    LEA DX,mensajeBase
    CALL PRINT    
    CALL SCAN_NUM
    MOV ti1, CX
    MOV tf1, DX
    
    
    LEA DX,mensajeAltura
    CALL PRINT    
    CALL SCAN_NUM 
    MOV ti2, CX
    MOV tf2, DX 
    CALL FLOAT_ADD
    MOV CX,ti3
    MOV DX,tf3 
    MOV ti1, CX
    MOV tf1, DX 
    MOV ti2, 2
    MOV tf2, 0 
    CALL FLOAT_MUL
    
    LEA DX, mensajePeriPar
    CALL PRINT  

    CALL PRINT_FLOAT_NUM
    JMP END_FIGURE         
   
    ; Codigo del Hexagono
hexagono:
    MOV AH, 09H
    LEA DX, mensajeHexagono    
    INT 21H
    
    LEA DX, espa
    INT 21H
    
    MOV AH, 01H
    INT 21H
    SUB AL, 30H
    
    CMP AL, 01H
    JE seleccion_calculoHexagono
    
    JMP INICIO

seleccion_calculoHexagono:
    MOV AH, 09H
    LEA DX, mensajeCt
    INT 21H
    
    LEA DX, espa
    INT 21H
    
    MOV AH, 01H
    INT 21H
    SUB AL, 30H 
    
    CMP AL, 01H
    JE calcular_areaHexagono
    
    CMP AL, 02H
    JE calcular_perimetroHexagono 
    
    JMP INICIO

calcular_areaHexagono:
    CALL NEW_SCREEN
                      
    LEA DX,mensajeLadoH
    CALL PRINT
        
    CALL SCAN_NUM
    MOV ti1, CX
    MOV tf1, DX                                                                            
    MOV ti2, 3
    MOV tf2, 0
    CALL FLOAT_MUL
    MOV CX, ti3  
    MOV DX, ti3  
    MOV ti1, CX
    MOV tf1, DX 
                        
    LEA DX,mensajeApotH
    CALL PRINT    
    CALL SCAN_NUM
    MOV ti2, CX
    MOV tf2, DX 
                                                                                  
    CALL FLOAT_MUL
    

    LEA DX, mensajeAreaH
    CALL PRINT  
      
   
    CALL PRINT_FLOAT_NUM
    
    JMP END_FIGURE

calcular_perimetroHexagono:
    CALL NEW_SCREEN

    LEA DX,mensajeLadoH
    CALL PRINT
    
    CALL SCAN_NUM
    MOV ti1, CX
    MOV tf1,DX
    MOV ti2,6
    MOV tf2,0 

    LEA DX, mensajePeriH
    CALL PRINT
  
    
    CALL FLOAT_MUL

    
    CALL PRINT_FLOAT_NUM
    
    
    JMP END_FIGURE
fin:
    MOV AH,09H
    LEA DX,salir
    INT 21H 

    MOV AH,01H
    INT 21H

    MOV AH,01H
    MOV AL,03H
    INT 10H 

    MOV AX,4C00h
    INT 21h

.EXIT
END
