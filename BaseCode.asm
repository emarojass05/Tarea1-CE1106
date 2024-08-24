TITLE Area de un trapecio
INCLUDE 'EMU8086.INC'
CR EQU 13
LF EQU 10

;---------------------------------------------
.MODEL SMALL
.STACK 200 ; Se define la pila
.DATA ; Se definen datos
       mensaje1 DB cr,lf,'Programa que calcula el area de un trapecio.$'
       mensaje2 DB cr,lf,'Ingresa la base menor: (presiona enter)$'
       mensaje3 DB cr,lf,'Ingresa la base mayor: (presiona enter)$'
       mensaje4 DB cr,lf,'Presiona cualquier tecla para continuar$'
       mensaje5 DB cr,lf,'Presiona 1 para calcular el area del trapecio o  presiona 0 para salir.$'
       mensaje6 DB cr,lf,'Ingresa la altura: (presiona enter)$'
       mensaje10 DB cr,lf,'El area del trapecio es:$'
       salir DB cr,lf,'Saliendo del programa presione cualquier tecla..$'

       f1 DW ?
       f2 DW ?
       f3 DW ?

       resultado DB cr,lf,'el area del trapecio es : $'
       espa DB ' ',cr,lf,'$'

       c  equ 02

;----------------------------------------------------------------
.CODE Area
    DEFINE_SCAN_NUM
    DEFINE_PRINT_NUM_UNS
    jmp inicio

inicio:
    MOV ax,Data
    MOV DS,AX

    MOV AH,00H
    MOV AL,03H
    INT 10H

    MOV AH,09H
    LEA DX,mensaje1
    INT 21H

    LEA DX,espa
    INT 21H

    MOV AH,09H
    LEA DX,mensaje5
    INT 21H

    LEA DX,espa
    INT 21H

    MOV AH,01H
    INT 21H

    SUB AL,30H
    CMP AL,00H
    JE fin
    CMP AL,01H
    JE multiplica

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
    LEA DX,mensaje6
    INT 21H 

    CALL SCAN_NUM
    MOV f3,CX

    MOV AH,09H
    LEA DX,resultado
    INT 21H

    MOV AX,f1 ; base menor
    ADD AX,f2 ; base menor + base mayor
    MOV BX,c  ; 2
    DIV BL    ; (base menor + base mayor) / 2
    MOV BX,f3 ; altura
    MUL BX    ; ((base menor + base mayor) / 2) * altura

    MOV CX,AX ; Guardar el resultado en CX
    CALL PRINT_NUM_UNS ; Imprimir el número

    LEA DX,espa
    INT 21H

    LEA DX,mensaje4
    INT 21H

    MOV AH,01h
    INT 21H
    JMP inicio

fin:
    MOV AH,09H
    LEA DX,salir
    INT 21H 

    MOV AH,01h
    INT 21H

    MOV AH,01H
    MOV AL,03H
    INT 10H 

    MOV AX,4C00h
    INT 21h

.EXIT
END
