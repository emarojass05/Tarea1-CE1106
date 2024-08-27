
TITLE Area de un trapecio
INCLUDE 'EMU8086.INC'
CR EQU 13
LF EQU 10

;---------------------------------------------
.MODEL SMALL
.STACK 200 ; Se define la pila
.DATA ; Se definen datos
       mensaje1 DB cr,lf,'Calculadora de Figuras$'
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

       mensajeT DB cr,lf,'Este es el trapecio, presione 1 para pasar a los calculos y 0 para volver al inicio$'
       mensajeC DB cr,lf,'Presione 1 para Area y 2 para perimetro?$'
       mensaje2 DB cr,lf,'Ingresa la base menor: (presiona enter)$'
       mensaje3 DB cr,lf,'Ingresa la base mayor: (presiona enter)$'
       mensaje4 DB cr,lf,'Presiona cualquier tecla para continuar$'
       mensaje5 DB cr,lf,'Presiona 1 si estas activo y 0 para salir.$'
       mensaje6 DB cr,lf,'Ingresa la altura: (presiona enter)$'
       mensaje10 DB cr,lf,'El area del trapecio es:$' 
       mensajePT DB  cr,lf, 'El perimetro del trapecio es: $'
       mensajeBMT DB cr,lf,'Ingrese el valor de la base menor del Trapecio:  $'
       mensajeBMAT DB cr,lf,'Ingrese el valor de la base mayor del Trapecio: $' 
       mensajeDT DB cr,lf,'Ingrese el valor de la diagonal del Trapecio$'
       mensajeRPT DB cr,lf,'El perimetro del trapecio es de: $'
       salir DB cr,lf,'Saliendo del programa presione cualquier tecla..$'
       
       
        
       
       ;Mensajes de Triangulo
       mensaje12 DB cr,lf,'El area del triangulo es:$'
       mensajeCt DB cr,lf,'Presione 1 para Area y 2 para perimetro?$'
       mensajeTri DB cr,lf,'Este es el triangulo, presione 1 para pasar a los calculos y 0 para volver al inicio$'
       mensaje6Tri DB cr,lf,'Ingresa la altura: (presiona enter)$'
       mensaje2Tri DB cr,lf,'Ingresa el lado del triangulo: (presiona enter)$'
       mensaje123 DB cr,lf,'El perimetro del triangulo es:$'
       
       
       ;Mensajes del Cuadrado
       mensajeCU DB cr,lf,'Este es el cuadrado, presione 1 para pasar a los calculos y 0 para volver al inicio$'
       mensajeCA DB cr,lf,'Area del cuadrado:$' 
       mensajeAC DB cr,lf,'El area del cuadrado es:$'
       mensajeCPE DB cr,lf,'Perimetro del cuadrado:$'
       mensajePC DB cr,lf,'El perimetro del cuadrado es:$'   
       
       ;Mensajes del Rectangulo
       mensajeR DB cr, lf, 'Este es el rectangulo, presione 1 para pasar a los calculos y 0 para volver al inicio$'
       mensajeRA DB cr,lf,'Area del rectangulo:$' 
       mensajeAR DB cr,lf,'El area del rectangulo es:$'
       mensajeRP DB cr,lf,'Perimetro del rectangulo:$'
       mensajePR DB cr,lf,'El perimetro del rectangulo es:$'  
       mensajeLR DB cr,lf,'Ingresa la el largo del rectangulo: (presiona enter)$'
       mensajeANR DB cr,lf,'Ingresa el ancho del rectangulo: (presiona enter)$'

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

       resultado DB cr,lf,'El area del trapecio es:$'
       resultadoTri DB cr,lf,'El area del triangulo es:$'
       resultadoTriP DB cr,lf,'El perimetro del triangulo es:$'
       espa DB ' ',cr,lf,'$'

       c  equ 02
       a  equ 03
       

;----------------------------------------------------------------
.CODE Area
    DEFINE_PRINT_NUM_UNS
    jmp inicio
    
    
 SCAN_NUM:
    MOV AH, 0AH        ; Funcion para buffered input
    LEA DX, buffer     ; Cargar la dirección del buffer
    INT 21H      

    LEA SI, [buffer+2] ; Índice al primer caracter del buffer
    MOV CL, [buffer+1] ; Cantidad de caracteres del input 

NEXT_NUMBER:
    DEC CL             ; Decrementar contador de caracteres
    JL  END_CONVERSION ; Si CL < 0, ya se leyeron todos los chars 

    MOV AL, [SI]       ; Almacenar el caracter del [SI] en AL
    INC SI             ; Siguiente char
    ;CMP AL, '.'        ; Leer el punto y comenzar la conversion de la parte fraccional
    ;JZ  BEGIN_FLOATS
    SUB AL, '0'        ; ASCII -> Valor numérico
    XOR AH, AH         ; Limpiar AH

    MOV BX, 10         
    MOV next_digit, 0   ; Limpiar variable del dígito temporal
    ADD next_digit, AX  ; Cargar dígito temporal (AX) en su variable correspondiente                      
    MOV AX, total_int_input ; Cargar el número total actual en AX
    MUL BX              ; Multiplica por 10 el numero actual para hacer espacio para el siguiente dígito 
    ADD AX, next_digit  ; Añade el nuevo dígito temporal al número actual
    MOV next_digit, 0   ; Limpiar variable del dígito temporal       
    MOV total_int_input, AX ; Mover el valor numérico final a su variable

    JMP NEXT_NUMBER     ; Repetir para el siguiente char   

BEGIN_FLOATS:
    MOV CH, 2
    
NEXT_FLOAT_NUMBER:
    DEC CL             ; Decrementar contador de caracteres
    DEC CH
    JL  END_CONVERSION ; Si CL o CH < 0, ya se leyeron todos los chars o se alcanzó el límite de cifras float

    MOV AL, [SI]       ; Almacenar el caracter del [SI] en AL
    INC SI             ; Siguiente char
    SUB AL, '0'        ; ASCII -> Valor numérico
    XOR AH, AH         ; Limpiar AH

    MOV BX, 10         
    MOV next_digit, 0   ; Limpiar variable del dígito temporal
    ADD next_digit, AX  ; Cargar dígito temporal (AX) en su variable correspondiente                      
    MOV AX, total_float_input ; Cargar el número total actual en AX
    MUL BX              ; Multiplica por 10 el numero actual para hacer espacio para el siguiente dígito 
    ADD AX, next_digit  ; Añade el nuevo dígito temporal al número actual
    MOV next_digit, 0   ; Limpiar variable del dígito temporal       
    MOV total_float_input, AX ; Mover el valor numérico final a su variable

    JMP NEXT_FLOAT_NUMBER     ; Repetir para el siguiente char

END_CONVERSION:
    MOV CX, total_int_input ; Valor numérico entero final -> CX
    MOV total_int_input, 0 ; Limpiar var.
    MOV DX, total_float_input ; Valor numérico float final -> DX
    MOV total_float_input, 0 ; Limpiar var.
     
    RET


; Función para imprimir el contenido de DX y un espacio
PRINTLN:
    MOV AH, 09H
    INT 21H

    LEA DX, espa
    INT 21H
    RET
; Función para crear un nuevo display   
NEW_SCREEN:
    MOV AH, 00H
    MOV AL, 03H
    INT 10H
    RET

; Función para imprimir el contenido de DX    
PRINT:
    MOV AH, 09H
    INT 21H
    RET 

inicio:
    MOV ax,Data
    MOV DS,AX

    ; Mostrar el mensaje inicial
    MOV AH,09H
    LEA DX,mensaje1
    INT 21H

    LEA DX,espa
    INT 21H

    ; Mostrar el mensaje de confirmación
    MOV AH,09H
    LEA DX,mensaje5
    INT 21H

    LEA DX,espa
    INT 21H

    ; Leer la entrada del usuario
    MOV AH,01H
    INT 21H
    SUB AL,30H        ; Convertir de ASCII a número

    ; Comparar la entrada
    CMP AL,00H
    JE fin            ; Si la entrada es 0, ir al final (salir del programa)
    CMP AL,01H
    JE seleccion_figura

    ; Si la entrada no es 0 ni 1, volver al inicio
    JMP inicio

seleccion_figura:
    ; Mostrar el mensaje de selección de figura
    MOV AH,09H
    LEA DX,mensajeF
    INT 21H

    LEA DX,espa
    INT 21H

    ; Leer la entrada del usuario para la figura
    MOV AH,01H
    INT 21H
    SUB AL,30H        ; Convertir de ASCII a número

    ; Comparar la entrada para la figura
    CMP AL,01H
    JE trapecio     ; Si la entrada es 1, ir a la rutina de cálculo
    
    CMP AL, 02H
    JE triangulo
    
    CMP AL, 03H
    JE cuadrado
    
    CMP AL, 04H
    JE RECTANGULO
    
   

    ; Si la entrada no es 1, volver al inicio
    JMP inicio

;TRAPECIO 
trapecio:
    MOV AH, 09H
    LEA DX, mensajeT    
    INT 21H
    
    LEA DX, espa
    INT 21H
    
    MOV AH,01H
    INT 21H
    SUB AL,30H
    
    CMP AL, 01H
    JE seleccion_calculoT
    
    JMP inicio
    
seleccion_calculoT:
    MOV AH, 09H
    LEA DX,mensajeC
    INT 21H
    
    LEA DX, espa
    INT 21H
    
    MOV AH,01H
    INT 21H
    SUB AL,30H 
    
    CMP AL,01H
    JE multiplica
    
    CMP AL, 02H
    JE PerimetroT 
    
    JMP inicio
    
    

multiplica:
    MOV AH,00H
    MOV AL,03H
    INT 10H

    MOV AH,09H
    LEA DX,mensaje10
    INT 21H  

    LEA DX,espa
    INT 21H

    LEA DX,mensaje2
    INT 21H

    CALL SCAN_NUM
    MOV i1,CX 

    MOV AH,09H
    LEA DX,mensaje3
    INT 21H 

    CALL SCAN_NUM
    MOV i2,CX

    MOV AH,09H
    LEA DX,mensaje6Tri
    INT 21H 

    CALL SCAN_NUM
    MOV i3,CX

    MOV AH,09H
    LEA DX,resultado
    INT 21H 
    
    LEA DX, espa
    CALL PRINT

    MOV AX,i1        ; base menor
    ADD AX,i2        ; base menor + base mayor
    MOV BX,c         ; 2
    DIV BL           ; (base menor + base mayor) / 2
    MOV BX,i3        ; altura
    MUL BX           ; ((base menor + base mayor) / 2) * altura

    MOV CX,AX        ; Guardar el resultado en CX
    CALL PRINT_NUM_UNS ; Imprimir el número

    LEA DX,espa
    INT 21H

    LEA DX,mensaje4
    INT 21H

    MOV AH,01H
    INT 21H
    JMP inicio       ; Regresar al inicio
    


PerimetroT:

    MOV AH, 00H
    MOV AL, 03H
    INT 10H
    
    MOV AH, 09H
    LEA DX, mensajePT
    INT 21H
    
    LEA DX, espa
    INT 21H
        
    LEA DX, mensajeBMT
    INT 21H
    
    CALL SCAN_NUM
    MOV i1, CX
    
    
    LEA DX, espa
    CALL PRINT  
    
    
    LEA DX, mensajeDT
    INT 21H
    
    CALL SCAN_NUM
    MOV i2, CX   
        
    LEA DX, espa
    CALL PRINT
    
    MOV AH, 09H
    LEA DX, mensajeBMAT
    INT 21H
    
    CALL SCAN_NUM
    MOV i3, CX   
    
    LEA DX, espa
    CALL PRINT
    
    MOV AH, 09H
    LEA DX, mensajeRPT
    INT 21H
    
    ; Multiplicar i2 por 2
    MOV AX, i2
    ADD AX, AX   ; AX = i2 * 2
    
    ; Sumar i1, i3 y el resultado de i2 * 2
    ADD AX, i1   ; AX = i1 + (i2 * 2)
    ADD AX, i3   ; AX = i1 + i3 + i2 * 2)
            
    ; Guardar el resultado final en CX
    MOV CX, AX   ; CX = AX 
    
    CALL PRINT_NUM_UNS
    
    LEA DX, espa
    INT 21H
    
    LEA DX, mensaje4
    INT 21H
    
    MOV AH, 01H
    INT 21H
    JMP inicio


    
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
    
    JMP inicio
    
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
    
    JMP inicio
         
multiplica_tri:
    MOV AH,00H
    MOV AL,03H
    INT 10H

    MOV AH,09H
    LEA DX,mensaje12
    INT 21H  

    LEA DX,espa
    INT 21H

    LEA DX,mensaje2Tri
    INT 21H

    CALL SCAN_NUM
    MOV i1,CX 

    MOV AH,09H
    LEA DX,mensaje6
    INT 21H 

    CALL SCAN_NUM
    MOV i3,CX

    MOV AH,09H
    LEA DX,resultadoTri
    INT 21H

    MOV AX,i1        ; base
    MOV BX,i3        ; altura
    MUL BX           ; base * altura
    MOV BX,c         ; 2
    DIV BX           ; (base * altura) / 2


    MOV CX,AX        ; Guardar el resultado en CX
    CALL PRINT_NUM_UNS ; Imprimir el número

    LEA DX,espa
    INT 21H

    LEA DX,mensaje4
    INT 21H

    MOV AH,01H
    INT 21H
    JMP inicio       ; Regresar al inicio
    
perimetro_Tri:
    MOV AH,00H
    MOV AL,03H
    INT 10H

    MOV AH,09H
    LEA DX,mensaje123
    INT 21H  

    LEA DX,espa
    INT 21H

    LEA DX,mensaje2Tri
    INT 21H

    CALL SCAN_NUM
    MOV i1,CX 

    MOV AH,09H
    LEA DX,resultadoTriP
    INT 21H

    MOV AX,i1        ;largo
    MOV BX,a         ; 3
    MUL BX           


    MOV CX,AX        ; Guardar el resultado en CX
    CALL PRINT_NUM_UNS ; Imprimir el número

    LEA DX,espa
    INT 21H

    LEA DX,mensaje4
    INT 21H

    MOV AH,01H
    INT 21H
    JMP inicio       ; Regresar al inicio
    
    


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
    
    JMP inicio
    
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
    
    JMP inicio
    
    
multiplica_Cua:
    MOV AH, 00H
    MOV AL, 03H
    INT 10H

    MOV AH, 09H
    LEA DX, mensajeCA
    INT 21H
    
    LEA DX, espa
    INT 21H                      
    
    LEA DX,mensaje2
    INT 21H
    
    CALL SCAN_NUM
    MOV i1, CX  
    
    MOV AX, i1      ; lado
    MUL AX          ; lado * lado
    MOV SI, AX  
    
    MOV AH, 09H
    LEA DX, mensajeAC
    INT 21H
    MOV AX, SI
    CALL PRINT_NUM_UNS 
    
     LEA DX,espa
    INT 21H

    LEA DX,mensaje4
    INT 21H

    MOV AH,01H
    INT 21H
    JMP inicio 
    
perimetro_Cua:
    MOV AH, 00H
    MOV AL, 03H
    INT 10H

    MOV AH, 09H
    LEA DX, mensajeCPE
    INT 21H
    
    LEA DX, espa
    INT 21H
    
    LEA DX,mensaje2
    INT 21H
    
    CALL SCAN_NUM
    MOV i1, CX  
    
    MOV AX, i1      ; lado
    MOV BX, 4       ; 4
    MUL BX          ; 4 * lado

    MOV DI, AX    
    
    MOV AH, 09H
    LEA DX, mensajePC
    INT 21H
    MOV AX, SI
    CALL PRINT_NUM_UNS
    
     LEA DX,espa
    INT 21H

    LEA DX,mensaje4
    INT 21H

    MOV AH,01H
    INT 21H
    JMP inicio
    
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
    
    
    JMP inicio
  
multiplica_Rec:
    MOV AH, 00H
    MOV AL, 03H
    INT 10H

    MOV AH, 09H
    LEA DX, mensajeRA
    INT 21H
    
    LEA DX, espa
    INT 21H                      
    
      LEA DX,mensajeLR
    INT 21H
    
    CALL SCAN_NUM
    MOV i1, CX 
    
    LEA DX, espa
    CALL PRINT
    
    LEA DX, mensajeANR
    INT 21H
    
    CALL SCAN_NUM
    MOV i2, CX   
    
    MOV AX, i1      ; ancho
    MOV BX, i2      ; largo
    MUL BX          ; ancho * largo

    MOV SI, AX      ; Guardar el Area en SI  
    
    MOV AH, 09H
    LEA DX, mensajeAR
    INT 21H
    MOV AX, SI
    CALL PRINT_NUM_UNS 
    
     LEA DX,espa
    INT 21H

    LEA DX,mensaje4
    INT 21H

    MOV AH,01H
    INT 21H
    JMP inicio
    
perimetro_Rec:
    MOV AH, 00H
    MOV AL, 03H
    INT 10H

    MOV AH, 09H
    LEA DX, mensajeRP
    INT 21H
    
    LEA DX, espa
    INT 21H                      
    
    LEA DX,mensajeLR
    INT 21H
    
    CALL SCAN_NUM
    MOV i1, CX 
    
    LEA DX, espa
    CALL PRINT
    
    LEA DX, mensajeANR
    INT 21H
    
    CALL SCAN_NUM
    MOV i2, CX 
    
    MOV AX, i1      ; ancho
    ADD AX, i2      ; ancho + largo
    MOV BX, 2       ; multiplicador para el perímetro
    MUL BX          ; 2 * (ancho + largo)

    MOV DI, AX      ; Guardar el perímetro en DI
    
    MOV AH, 09H
    LEA DX, mensajePR
    INT 21H
    MOV AX, DI
    CALL PRINT_NUM_UNS 
    
     LEA DX,espa
    INT 21H

    LEA DX,mensaje4
    INT 21H

    MOV AH,01H
    INT 21H
    JMP inicio      
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
