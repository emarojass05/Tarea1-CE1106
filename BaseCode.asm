
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
       mensajeLR DB cr,lf,'Ingresa el largo del rectangulo: (presiona enter)$'
       mensajeANR DB cr,lf,'Ingresa el ancho del rectangulo: (presiona enter)$'
       
       ;Mensajes del Círculo
       mensajeCirculo DB CR, LF, 'Este es el círculo, presione 1 para pasar a los cálculos y 0 para volver al inicio$'
       mensajeAreaCirculo DB CR, LF, 'Área del círculo:$' 
       mensajeACirculo DB CR, LF, 'El área del círculo es:$'
       mensajePeriCirculo DB CR, LF, 'Perímetro del círculo:$'
       mensajePCirculo DB CR, LF, 'El perímetro del círculo es:$' 
       mensajeRadio DB CR, LF, 'Ingrese el radio del circulo:$'
       
       ; Datos del rombo
       mensajeRombo DB CR, LF, 'Este es el rombo, presione 1 para pasar a los cálculos y 0 para volver al inicio$'
       mensajeDiag1 DB CR, LF, 'Ingrese la longitud de la diagonal 1: (presione enter)$'
       mensajeDiag2 DB CR, LF, 'Ingrese la longitud de la diagonal 2: (presione enter)$'
       mensajeAreaRombo DB CR, LF, 'El área del rombo es: $'
       mensajePeriRombo DB CR, LF, 'El perímetro del rombo es: $'   
       
       ; Datos del Pentagono
       mensajePentagono DB CR, LF, 'Este es el pentagono, presione 1 para pasar a los cálculos y 0 para volver al inicio$'
       mensajeLadoP DB CR, LF, 'Ingrese la longitud del lado del pentágono: (presione enter)$'
       mensajeAreaP DB CR, LF, 'El área del pentágono es: $'
       mensajePeriP DB CR, LF, 'El perímetro del pentágono es: $'   
       
       ; Datos del Paralelogramo
       mensajeParalelogramo DB CR, LF, 'Este es el paralelogramo, presione 1 para pasar a los cálculos y 0 para volver al inicio$'
       mensajeBase DB CR, LF, 'Ingrese la longitud de la base del paralelogramo: (presione enter)$'
       mensajeAltura DB CR, LF, 'Ingrese la altura del paralelogramo: (presione enter)$'
       mensajeAreaPar DB CR, LF, 'El área del paralelogramo es: $'
       mensajePeriPar DB CR, LF, 'El perímetro del paralelogramo es: $'
       
       ; Datos del Hexágono
       mensajeHexagono DB CR, LF, 'Este es el hexágono, presione 1 para pasar a los cálculos y 0 para volver al inicio$'
       mensajeLadoH DB CR, LF, 'Ingrese la longitud del lado del hexágono: (presione enter)$'
       mensajeAreaH DB CR, LF, 'El área del hexágono es: $'
       mensajePeriH DB CR, LF, 'El perímetro del hexágono es: $'

       
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
    
    JMP inicio

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
    
    JMP inicio

calcular_areaCirculo:
    MOV AH, 00H
    MOV AL, 03H
    INT 10H

    MOV AH, 09H
    LEA DX, mensajeAreaCirculo
    INT 21H
    
    LEA DX, espa
    INT 21H                      
    
    LEA DX, mensajeRadio
    INT 21H
    
    CALL SCAN_NUM
    MOV i1, CX      ; radio del círculo

    ; Calcular el Area del circulo: PI * radio * radio
    MOV AX, i1      ; radio
    MUL AX          ; radio * radio
    MOV BX, 3
    MUL BX     ; 3 * (radio * radio)
    MOV SI, AX      ; Guardar el área en SI

    MOV AH, 09H
    LEA DX, mensajeACirculo
    INT 21H
    MOV AX, SI
    CALL PRINT_NUM_UNS 
    
    LEA DX, espa
    INT 21H

    LEA DX, mensaje4
    INT 21H

    MOV AH, 01H
    INT 21H
    JMP inicio 

calcular_perimetroCirculo:
    MOV AH, 00H
    MOV AL, 03H
    INT 10H

    MOV AH, 09H
    LEA DX, mensajePeriCirculo
    INT 21H
    
    LEA DX, espa
    INT 21H
    
    LEA DX, mensajeRadio
    INT 21H
    
    CALL SCAN_NUM
    MOV i1, CX      ; radio del círculo
    
    ; Calcular el perímetro del círculo: 2 * PI * radio
    MOV AX, i1      ; radio
    MOV BX, 2
    MUL BX     ; 2 * radio
    MOV BX, 3
    MUL BX     ; 3 * (2 * radio)
    MOV DI, AX      ; Guardar el perímetro en DI

    MOV AH, 09H
    LEA DX, mensajePCirculo
    INT 21H
    MOV AX, DI
    CALL PRINT_NUM_UNS
    
    LEA DX, espa
    INT 21H

    LEA DX, mensaje4
    INT 21H

    MOV AH, 01H
    INT 21H
    JMP inicio

; Código del rombo
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
    
    JMP inicio

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
    
    JMP inicio

calcular_areaRombo:
    MOV AH, 00H
    MOV AL, 03H
    INT 10H

    MOV AH, 09H
    LEA DX, mensajeDiag1
    INT 21H
    
    LEA DX, espa
    INT 21H
    
    CALL SCAN_NUM
    MOV i1, CX      ; Diagonal 1
    
    MOV AH, 09H
    LEA DX, mensajeDiag2
    INT 21H
    
    LEA DX, espa
    INT 21H
    
    CALL SCAN_NUM
    MOV i2, CX      ; Diagonal 2

    ; Cálculo del área: (Diagonal 1 * Diagonal 2) / 2
    MOV AX, i1
    MUL i2          ; Diagonal 1 * Diagonal 2
    MOV BX, 2
    DIV BX          ; (Diagonal 1 * Diagonal 2) / 2
    MOV SI, AX      ; Guardar el área en SI

    MOV AH, 09H
    LEA DX, mensajeAreaRombo
    INT 21H
    MOV AX, SI
    CALL PRINT_NUM_UNS 
    
    LEA DX, espa
    INT 21H

    LEA DX, mensaje4
    INT 21H

    MOV AH, 01H
    INT 21H
    JMP inicio

calcular_perimetroRombo:
    MOV AH, 00H
    MOV AL, 03H
    INT 10H

    MOV AH, 09H
    LEA DX, mensajeDiag1
    INT 21H
    
    LEA DX, espa
    INT 21H
    
    CALL SCAN_NUM
    MOV i1, CX      ; Diagonal 1
    
    MOV AH, 09H
    LEA DX, mensajeDiag2
    INT 21H
    
    LEA DX, espa
    INT 21H
    
    CALL SCAN_NUM
    MOV i2, CX      ; Diagonal 2

    ; Cálculo del perímetro: 2 * (Diagonal 1 + Diagonal 2)
    MOV AX, i1
    ADD AX, i2      ; Diagonal 1 + Diagonal 2
    MOV BX, 2
    MUL BX          ; 2 * (Diagonal 1 + Diagonal 2)
    MOV DI, AX      ; Guardar el perímetro en DI

    MOV AH, 09H
    LEA DX, mensajePeriRombo
    INT 21H
    MOV AX, DI
    CALL PRINT_NUM_UNS
    
    LEA DX, espa
    INT 21H

    LEA DX, mensaje4
    INT 21H

    MOV AH, 01H
    INT 21H
    JMP inicio

; Código del Pentágono
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
    
    JMP inicio

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
    
    JMP inicio

calcular_areaPentagono:
    MOV AH, 00H
    MOV AL, 03H
    INT 10H

    MOV AH, 09H
    LEA DX, mensajeLadoP
    INT 21H
    
    LEA DX, espa
    INT 21H
    
    CALL SCAN_NUM
    MOV i1, CX      ; Lado del pentágono
    
    ; Cálculo del área: (sqrt(5 * (5 + 2 * sqrt(5))) / 4) * lado^2
    MOV AX, i1
    MUL AX          ; Lado^2
    MOV BX, 172     ; Aproximación de (sqrt(5 * (5 + 2 * sqrt(5))) / 4)
    DIV BX          ; (lado^2 * 172) / 4
    MOV SI, AX      ; Guardar el área en SI

    MOV AH, 09H
    LEA DX, mensajeAreaP
    INT 21H
    MOV AX, SI
    CALL PRINT_NUM_UNS 
    
    LEA DX, espa
    INT 21H

    LEA DX, mensaje4
    INT 21H

    MOV AH, 01H
    INT 21H
    JMP inicio

calcular_perimetroPentagono:
    MOV AH, 00H
    MOV AL, 03H
    INT 10H

    MOV AH, 09H
    LEA DX, mensajeLadoP
    INT 21H
    
    LEA DX, espa
    INT 21H
    
    CALL SCAN_NUM
    MOV i1, CX      ; Lado del pentágono

    ; Cálculo del perímetro: 5 * lado
    MOV AX, i1
    MOV BX, 5
    MUL BX          ; 5 * lado
    MOV DI, AX      ; Guardar el perímetro en DI

    MOV AH, 09H
    LEA DX, mensajePeriP
    INT 21H
    MOV AX, DI
    CALL PRINT_NUM_UNS
    
    LEA DX, espa
    INT 21H

    LEA DX, mensaje4
    INT 21H

    MOV AH, 01H
    INT 21H
    JMP inicio    
    
; Código del Paralelogramo
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
    
    JMP inicio

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
    
    JMP inicio

calcular_areaParalelogramo:
    MOV AH, 00H
    MOV AL, 03H
    INT 10H

    MOV AH, 09H
    LEA DX, mensajeBase
    INT 21H
    
    LEA DX, espa
    INT 21H
    
    CALL SCAN_NUM
    MOV i1, CX      ; Base del paralelogramo
    
    MOV AH, 09H
    LEA DX, mensajeAltura
    INT 21H
    
    LEA DX, espa
    INT 21H
    
    CALL SCAN_NUM
    MOV i2, CX      ; Altura del paralelogramo

    ; Cálculo del área: base * altura
    MOV AX, i1
    MUL i2          ; base * altura
    MOV SI, AX      ; Guardar el área en SI

    MOV AH, 09H
    LEA DX, mensajeAreaPar
    INT 21H
    MOV AX, SI
    CALL PRINT_NUM_UNS 
    
    LEA DX, espa
    INT 21H

    LEA DX, mensaje4
    INT 21H

    MOV AH, 01H
    INT 21H
    JMP inicio

calcular_perimetroParalelogramo:
    MOV AH, 00H
    MOV AL, 03H
    INT 10H

    MOV AH, 09H
    LEA DX, mensajeBase
    INT 21H
    
    LEA DX, espa
    INT 21H
    
    CALL SCAN_NUM
    MOV i1, CX      ; Base del paralelogramo
    
    MOV AH, 09H
    LEA DX, mensajeAltura
    INT 21H
    
    LEA DX, espa
    INT 21H
    
    CALL SCAN_NUM
    MOV i2, CX      ; Altura del paralelogramo

    ; Cálculo del perímetro: 2 * (base + altura)
    MOV AX, i1
    ADD AX, i2      ; base + altura
    MOV BX, 2
    MUL BX          ; 2 * (base + altura)
    MOV DI, AX      ; Guardar el perímetro en DI

    MOV AH, 09H
    LEA DX, mensajePeriPar
    INT 21H
    MOV AX, DI
    CALL PRINT_NUM_UNS
    
    LEA DX, espa
    INT 21H

    LEA DX, mensaje4
    INT 21H

    MOV AH, 01H
    INT 21H
    JMP inicio         
   
    ; Código del Hexágono
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
    
    JMP inicio

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
    
    JMP inicio

calcular_areaHexagono:
    MOV AH, 00H
    MOV AL, 03H
    INT 10H

    MOV AH, 09H
    LEA DX, mensajeLadoH
    INT 21H
    
    LEA DX, espa
    INT 21H
    
    CALL SCAN_NUM
    MOV i1, CX      ; Lado del hexágono
    
    ; Cálculo del área: ((3 * sqrt(3)) / 2) * lado^2
    MOV AX, i1
    MUL AX          ; Lado^2
    MOV BX, 155     ; Aproximación de ((3 * sqrt(3)) / 2)
    DIV BX          ; (lado^2 * 155) / 2
    MOV SI, AX      ; Guardar el área en SI

    MOV AH, 09H
    LEA DX, mensajeAreaH
    INT 21H
    MOV AX, SI
    CALL PRINT_NUM_UNS 
    
    LEA DX, espa
    INT 21H

    LEA DX, mensaje4
    INT 21H

    MOV AH, 01H
    INT 21H
    JMP inicio

calcular_perimetroHexagono:
    MOV AH, 00H
    MOV AL, 03H
    INT 10H

    MOV AH, 09H
    LEA DX, mensajeLadoH
    INT 21H
    
    LEA DX, espa
    INT 21H
    
    CALL SCAN_NUM
    MOV i1, CX      ; Lado del hexágono

    ; Cálculo del perímetro: 6 * lado
    MOV AX, i1
    MOV BX, 6
    MUL BX          ; 6 * lado
    MOV DI, AX      ; Guardar el perímetro en DI

    MOV AH, 09H
    LEA DX, mensajePeriH
    INT 21H
    MOV AX, DI
    CALL PRINT_NUM_UNS
    
    LEA DX, espa
    INT 21H

    LEA DX, mensaje4
    INT 21H

    MOV AH, 01H
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
