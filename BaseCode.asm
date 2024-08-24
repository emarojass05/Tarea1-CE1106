TITLE Área y Perímetro de un Trapecio o Cuadrado
INCLUDE 'EMU8086.INC'
CR EQU 13
LF EQU 10

;---------------------------------------------
.MODEL SMALL
.STACK 200 ; Se define la pila
.DATA ; Se definen datos
       mensaje1 DB cr,lf,'Programa que calcula el área y perímetro de un trapecio o un cuadrado.$'
       mensaje2 DB cr,lf,'Ingresa la base menor del trapecio: (presiona enter)$'
       mensaje3 DB cr,lf,'Ingresa la base mayor del trapecio: (presiona enter)$'
       mensaje4 DB cr,lf,'Presiona cualquier tecla para continuar.$'
       mensaje5 DB cr,lf,'Presiona 1 para calcular trapecio, 2 para calcular cuadrado, 3 para rectangulo,o presiona 0 para salir.$'
       mensaje6 DB cr,lf,'Ingresa la altura del trapecio: (presiona enter)$'
       mensaje7 DB cr,lf,'Ingresa el lado del cuadrado: (presiona enter)$'
       mensaje8 DB cr,lf,'El Area del cuadrado es: $'
       mensaje9 DB cr,lf,' y su perímetro es: $'
       mensaje10 DB cr,lf,'El Area del trapecio es: $'
       mensaje11 DB cr,lf,'Ingresa la longitud del lado no paralelo del trapecio isoceles: (presiona enter)$'
       mensaje12 DB cr,lf,' y su perimetro es: $'
       mensaje13 DB cr,lf, 'Ingresa el ancho del rectangulo: (presiona enter)$'
       mensaje14 DB cr,lf, 'Ingresa el largo del rectangulo: (presiona enter)$'
       mensaje15 DB cr,lf,'El Area del rectangulo es: $'
       mensaje16 DB cr,lf,' y su perimetro es: $'
       salir DB cr,lf,'Saliendo del programa, presione cualquier tecla...$'

       f1 DW ?
       f2 DW ?
       f3 DW ?
       f4 DW ?

       resultado DB cr,lf,'El resultado es: $'
       espa DB ' ',cr,lf,'$'

       c  EQU 02

;----------------------------------------------------------------
.CODE Area
    DEFINE_SCAN_NUM
    DEFINE_PRINT_NUM_UNS
    jmp inicio

inicio:
    MOV ax, Data
    MOV DS, AX

    MOV AH, 00H
    MOV AL, 03H
    INT 10H

    MOV AH, 09H
    LEA DX, mensaje1
    INT 21H

    LEA DX, espa
    INT 21H

    MOV AH, 09H
    LEA DX, mensaje5
    INT 21H

    LEA DX, espa
    INT 21H

    MOV AH, 01H
    INT 21H

    SUB AL, 30H
    CMP AL, 00H
    JE fin
    CMP AL, 01H
    JE trapecio
    CMP AL, 02H
    JE cuadrado
    CMP AL, 03H
    JE rectangulo
    JMP inicio

trapecio:
    MOV AH, 00H
    MOV AL, 03H
    INT 10H

    MOV AH, 09H
    LEA DX, mensaje2
    INT 21H

    CALL SCAN_NUM
    MOV f1, CX 

    MOV AH, 09H
    LEA DX, mensaje3
    INT 21H 

    CALL SCAN_NUM
    MOV f2, CX

    MOV AH, 09H
    LEA DX, mensaje6
    INT 21H 

    CALL SCAN_NUM
    MOV f3, CX

    ; Calcular el área del trapecio: ((base menor + base mayor) / 2) * altura
    MOV AX, f1      ; base menor
    ADD AX, f2      ; base menor + base mayor
    MOV BX, c       ; 2
    DIV BL          ; (base menor + base mayor) / 2
    MOV BX, f3      ; altura
    MUL BX          ; ((base menor + base mayor) / 2) * altura

    MOV SI, AX      ; Guardar el área en SI

    LEA DX, mensaje11
    MOV AH, 09H
    INT 21H

    CALL SCAN_NUM
    MOV f4, CX      ; lado no paralelo del trapecio isósceles

    ; Calcular el perímetro del trapecio: base menor + base mayor + 2 * lado no paralelo
    MOV AX, f1      ; base menor
    ADD AX, f2      ; base menor + base mayor
    MOV BX, f4      ; lado no paralelo
    ADD AX, BX      ; base menor + base mayor + lado no paralelo
    ADD AX, BX      ; base menor + base mayor + 2 * lado no paralelo

    MOV DI, AX      ; Guardar el perímetro en DI

    ; Mostrar el área y el perímetro del trapecio en una sola línea
    MOV AH, 09H
    LEA DX, mensaje10
    INT 21H
    MOV AX, SI
    CALL PRINT_NUM_UNS

    LEA DX, mensaje12
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
    JMP inicio

cuadrado:
    MOV AH, 00H
    MOV AL, 03H
    INT 10H

    MOV AH, 09H
    LEA DX, mensaje7
    INT 21H

    CALL SCAN_NUM
    MOV f1, CX      ; Lado del cuadrado

    ; Calcular el área del cuadrado: lado * lado
    MOV AX, f1      ; lado
    MUL AX          ; lado * lado

    MOV SI, AX      ; Guardar el área en SI

    ; Calcular el perímetro del cuadrado: 4 * lado
    MOV AX, f1      ; lado
    MOV BX, 4       ; 4
    MUL BX          ; 4 * lado

    MOV DI, AX      ; Guardar el perímetro en DI

    ; Mostrar el área y el perímetro del cuadrado en una sola línea
    MOV AH, 09H
    LEA DX, mensaje8
    INT 21H
    MOV AX, SI
    CALL PRINT_NUM_UNS

    LEA DX, mensaje9
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
    JMP inicio   
    
rectangulo:
    MOV AH, 00H
    MOV AL, 03H
    INT 10H

    MOV AH, 09H
    LEA DX, mensaje13 ; Mensaje para ingresar el ancho
    INT 21H

    CALL SCAN_NUM
    MOV f1, CX ; Guardar el ancho en f1

    MOV AH, 09H
    LEA DX, mensaje14 ; Mensaje para ingresar el largo
    INT 21H 

    CALL SCAN_NUM
    MOV f2, CX ; Guardar el largo en f2

    ; Calcular el Área del rectángulo: largo * ancho
    MOV AX, f1      ; ancho
    MOV BX, f2      ; largo
    MUL BX          ; ancho * largo

    MOV SI, AX      ; Guardar el Area en SI

    ; Calcular el perímetro del rectángulo: 2 * (largo + ancho)
    MOV AX, f1      ; ancho
    ADD AX, f2      ; ancho + largo
    MOV BX, 2       ; multiplicador para el perímetro
    MUL BX          ; 2 * (ancho + largo)

    MOV DI, AX      ; Guardar el perímetro en DI

    ; Mostrar el área y el perímetro del rectángulo en una sola línea
    MOV AH, 09H
    LEA DX, mensaje15 ; Mostrar mensaje del área del rectángulo
    INT 21H
    MOV AX, SI
    CALL PRINT_NUM_UNS

    LEA DX, mensaje16 ; Mostrar mensaje del perímetro del rectángulo
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
    JMP inicio

    

fin:
    MOV AH, 09H
    LEA DX, salir
    INT 21H 

    MOV AH, 01h
    INT 21H

    MOV AH, 01H
    MOV AL, 03H
    INT 10H 

    MOV AX, 4C00h
    INT 21h

.EXIT
END
