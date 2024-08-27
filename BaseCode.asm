
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

       f1 DW ?
       f2 DW ?
       f3 DW ?
       f4 DW ?

       resultado DB cr,lf,'El area del trapecio es: $'
       resultadoTri DB cr,lf,'El area del triangulo es: $'
       resultadoTriP DB cr,lf,'El perimetro del triangulo es: $'
       espa DB ' ',cr,lf,'$'

       c  equ 02
       a  equ 03
       

;----------------------------------------------------------------
.CODE Area
    DEFINE_SCAN_NUM
    DEFINE_PRINT_NUM_UNS
    jmp inicio

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

    ; Si la entrada no es 1, volver al inicio
    JMP inicio

;Trapecio funciones    
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
    MOV f1,CX 

    MOV AH,09H
    LEA DX,mensaje3
    INT 21H 

    CALL SCAN_NUM
    MOV f2,CX

    MOV AH,09H
    LEA DX,mensaje6Tri
    INT 21H 

    CALL SCAN_NUM
    MOV f3,CX

    MOV AH,09H
    LEA DX,resultado
    INT 21H

    MOV AX,f1        ; base menor
    ADD AX,f2        ; base menor + base mayor
    MOV BX,c         ; 2
    DIV BL           ; (base menor + base mayor) / 2
    MOV BX,f3        ; altura
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
    
;Triangulo funciones

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
    MOV f1, CX
    
    LEA DX, espa
    INT 21H
    
    
    LEA DX, mensajeDT
    INT 21H
    
    CALL SCAN_NUM
    MOV f2, CX   
        
    LEA DX, espa
    INT 21H
    
    MOV AH, 09H
    LEA DX, mensajeBMAT
    INT 21H
    
    CALL SCAN_NUM
    MOV f3, CX   
    
    LEA DX, espa
    INT 21H
    
    MOV AH, 09H
    LEA DX, mensajeRPT
    INT 21H
    
    ; Multiplicar f2 por 2
    MOV AX, f2
    ADD AX, AX   ; AX = f2 * 2
    
    ; Sumar f1, f3 y el resultado de f2 * 2
    ADD AX, f1   ; AX = f1 + (f2 * 2)
    ADD AX, f3   ; AX = f1 + f3 + (f2 * 2)
    
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
    MOV f1,CX 

    MOV AH,09H
    LEA DX,mensaje6
    INT 21H 

    CALL SCAN_NUM
    MOV f3,CX

    MOV AH,09H
    LEA DX,resultadoTri
    INT 21H

    MOV AX,f1        ;largo
    MOV BX,c         ; 2
    DIV BL           ; (largo) / 2
    MOV BX,f3        ; altura
    MUL BX           ; (largo / 2) * altura

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
    MOV f1,CX 

    MOV AH,09H
    LEA DX,resultadoTriP
    INT 21H

    MOV AX,f1        ;largo
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
