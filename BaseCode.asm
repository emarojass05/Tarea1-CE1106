
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

       mensajeT DB cr,lf,'Este es el trapecio, presione 1 para pasar a los calculos y 0 para volver al INICIO$'
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
       mensajeTri DB cr,lf,'Este es el triangulo, presione 1 para pasar a los calculos y 0 para volver al INICIO$'
       mensaje6Tri DB cr,lf,'Ingresa la altura: (presiona enter)$'
       mensaje2Tri DB cr,lf,'Ingresa el lado del triangulo: (presiona enter)$'
       mensaje123 DB cr,lf,'El perimetro del triangulo es:$'
       
       
       ;Mensajes del Cuadrado
       mensajeCU DB cr,lf,'Este es el cuadrado, presione 1 para pasar a los calculos y 0 para volver al INICIO$'
       mensajeCA DB cr,lf,'Area del cuadrado:$' 
       mensajeAC DB cr,lf,'El area del cuadrado es:$'
       mensajeCPE DB cr,lf,'Perimetro del cuadrado:$'
       mensajePC DB cr,lf,'El perimetro del cuadrado es:$'   
       
       ;Mensajes del Rectangulo
       mensajeR DB cr, lf, 'Este es el rectangulo, presione 1 para pasar a los calculos y 0 para volver al INICIO$'
       mensajeRA DB cr,lf,'Area del rectangulo:$' 
       mensajeAR DB cr,lf,'El area del rectangulo es:$'
       mensajeRP DB cr,lf,'Perimetro del rectangulo:$'
       mensajePR DB cr,lf,'El perimetro del rectangulo es:$'  
       mensajeLR DB cr,lf,'Ingresa el largo del rectangulo: (presiona enter)$'
       mensajeANR DB cr,lf,'Ingresa el ancho del rectangulo: (presiona enter)$'
       
       ;Mensajes del Circulo
       mensajeCirculo DB CR, LF, 'Este es el circulo, presione 1 para pasar a los calculos y 0 para volver al INICIO$'
       mensajeAreaCirculo DB CR, LF, 'Área del circulo:$' 
       mensajeACirculo DB CR, LF, 'El area del circulo es:$'
       mensajePeriCirculo DB CR, LF, 'Perimetro del circulo:$'
       mensajePCirculo DB CR, LF, 'El perimetro del circulo es:$' 
       mensajeRadio DB CR, LF, 'Ingrese el radio del circulo:$'
       
       ; Datos del rombo
       mensajeRombo DB CR, LF, 'Este es el rombo, presione 1 para pasar a los calculos y 0 para volver al INICIO$'
       mensajeDiag1 DB CR, LF, 'Ingrese la longitud de la diagonal 1: (presione enter)$'
       mensajeDiag2 DB CR, LF, 'Ingrese la longitud de la diagonal 2: (presione enter)$'
       mensajeAreaRombo DB CR, LF, 'El area del rombo es: $'
       mensajePeriRombo DB CR, LF, 'El perimetro del rombo es: $'   
       
       ; Datos del Pentagono
       mensajePentagono DB CR, LF, 'Este es el pentagono, presione 1 para pasar a los calculos y 0 para volver al INICIO$'
       mensajeLadoP DB CR, LF, 'Ingrese la longitud del lado del pentagono: (presione enter)$'
       mensajeAreaP DB CR, LF, 'El area del pentagono es: $'
       mensajePeriP DB CR, LF, 'El perimetro del pentagono es: $'   
       
       ; Datos del Paralelogramo
       mensajeParalelogramo DB CR, LF, 'Este es el paralelogramo, presione 1 para pasar a los calculos y 0 para volver al INICIO$'
       mensajeBase DB CR, LF, 'Ingrese la longitud de la base del paralelogramo: (presione enter)$'
       mensajeAltura DB CR, LF, 'Ingrese la altura del paralelogramo: (presione enter)$'
       mensajeAreaPar DB CR, LF, 'El area del paralelogramo es: $'
       mensajePeriPar DB CR, LF, 'El perimetro del paralelogramo es: $'
       
       ; Datos del Hexagono
       mensajeHexagono DB CR, LF, 'Este es el hexagono, presione 1 para pasar a los calculos y 0 para volver al INICIO$'
       mensajeLadoH DB CR, LF, 'Ingrese la longitud del lado del hexagono: (presione enter)$'
       mensajeAreaH DB CR, LF, 'El area del hexagono es: $'
       mensajePeriH DB CR, LF, 'El perimetro del hexagono es: $'

       
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
    
INC_INT:
    INC ti3
    SUB tf3, 100
    JMP CARRY_ADDED
    
CARRY_ADDED:
    MOV ti1, 0
    MOV ti2, 0
    MOV tf1, 0
    MOV tf2, 0
    RET

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
    
    JMP INICIO
    
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
    
    JMP INICIO
    
    

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
    MOV f1, DX 

    MOV AH,09H
    LEA DX,mensaje3
    INT 21H 

    CALL SCAN_NUM
    MOV i2,CX
    MOV f2, DX
    
    
    MOV AH,09H
    LEA DX,mensaje6
    INT 21H 

    CALL SCAN_NUM
    MOV i3,CX
    MOV f3, DX

    MOV AH,09H
    LEA DX,resultado
    INT 21H 
    
    LEA DX, espa
    CALL PRINT

    MOV AX,i1
    MOV DX, f1        
    MOV ti1, AX
    MOV tf1, DX
    
    MOV AX,i2
    MOV DX, f2        
    MOV ti2, AX
    MOV tf2, DX
    
    
    
    CALL FLOAT_ADD ; base menor + base mayor
    
    MOV AX, ti3       
    MOV BX,c         ; 2
    DIV BX           ; (base menor + base mayor) / 2
    MOV ti1,AX
    
    MOV AX, tf3       
    MOV BX,c         ; 2
    DIV BX           ; (base menor + base mayor) / 2
    MOV tf1,AX       ; altura
    
    MOV CX, i3
    MOV DX, f3
    
    MOV ti2, CX
    MOV tf2, DX
     
    CALL FLOAT_MUL         ; ((base menor + base mayor) / 2) * altura

    CALL PRINT_FLOAT_NUM ; Imprimir el numero

    LEA DX,espa
    INT 21H

    LEA DX,mensaje4
    INT 21H

    MOV AH,01H
    INT 21H
    JMP INICIO       ; Regresar al INICIO
    


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
    JMP INICIO


    
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
    CALL PRINT_NUM_UNS ; Imprimir el numero

    LEA DX,espa
    INT 21H

    LEA DX,mensaje4
    INT 21H

    MOV AH,01H
    INT 21H
    JMP INICIO       ; Regresar al INICIO
    
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
    CALL PRINT_NUM_UNS ; Imprimir el numero

    LEA DX,espa
    INT 21H

    LEA DX,mensaje4
    INT 21H

    MOV AH,01H
    INT 21H
    JMP INICIO       ; Regresar al INICIO
    
    


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
    MOV ti1, CX
    MOV tf1, DX
    MOV ti2, CX
    MOV tf2, DX
    
    LEA DX, mensajeAC
    CALL PRINT  
    
    CALL FLOAT_MUL  
    
   
    CALL PRINT_FLOAT_NUM
    
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
    MOV ti1, CX
    MOV tf1,DX
    MOV ti2,4
    MOV tf2,0 
    
     
   
    LEA DX, mensajePC
    CALL PRINT
  
    
    CALL FLOAT_MUL

    
    CALL PRINT_FLOAT_NUM
    
    
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
    
    
    JMP INICIO
  
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
    JMP INICIO
    
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
    MOV BX, 2       ; multiplicador para el perimetro
    MUL BX          ; 2 * (ancho + largo)

    MOV DI, AX      ; Guardar el perimetro en DI
    
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
    JMP INICIO         

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
    MOV i1, CX      ; radio del circulo

    ; Calcular el Area del circulo: PI * radio * radio
    MOV AX, i1      ; radio
    MUL AX          ; radio * radio
    MOV BX, 3
    MUL BX     ; 3 * (radio * radio)
    MOV SI, AX      ; Guardar el area en SI

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
    JMP INICIO 

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
    MOV i1, CX      ; radio del circulo
    
    ; Calcular el perimetro del circulo: 2 * PI * radio
    MOV AX, i1      ; radio
    MOV BX, 2
    MUL BX     ; 2 * radio
    MOV BX, 3
    MUL BX     ; 3 * (2 * radio)
    MOV DI, AX      ; Guardar el perimetro en DI

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
    JMP INICIO

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

    ; Calculo del area: (Diagonal 1 * Diagonal 2) / 2
    MOV AX, i1
    MUL i2          ; Diagonal 1 * Diagonal 2
    MOV BX, 2
    DIV BX          ; (Diagonal 1 * Diagonal 2) / 2
    MOV SI, AX      ; Guardar el area en SI

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
    JMP INICIO

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

    ; Calculo del perimetro: 2 * (Diagonal 1 + Diagonal 2)
    MOV AX, i1
    ADD AX, i2      ; Diagonal 1 + Diagonal 2
    MOV BX, 2
    MUL BX          ; 2 * (Diagonal 1 + Diagonal 2)
    MOV DI, AX      ; Guardar el perimetro en DI

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
    JMP INICIO

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
    MOV AH, 00H
    MOV AL, 03H
    INT 10H

    MOV AH, 09H
    LEA DX, mensajeLadoP
    INT 21H
    
    LEA DX, espa
    INT 21H
    
    CALL SCAN_NUM
    MOV i1, CX      ; Lado del pentagono
    
    ; Calculo del area: (sqrt(5 * (5 + 2 * sqrt(5))) / 4) * lado^2
    MOV AX, i1
    MUL AX          ; Lado^2
    MOV BX, 172     ; Aproximacion de (sqrt(5 * (5 + 2 * sqrt(5))) / 4)
    DIV BX          ; (lado^2 * 172) / 4
    MOV SI, AX      ; Guardar el area en SI

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
    JMP INICIO

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
    MOV i1, CX      ; Lado del pentagono

    ; Calculo del perimetro: 5 * lado
    MOV AX, i1
    MOV BX, 5
    MUL BX          ; 5 * lado
    MOV DI, AX      ; Guardar el perimetro en DI

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
    JMP INICIO    
    
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

    ; Calculo del area: base * altura
    MOV AX, i1
    MUL i2          ; base * altura
    MOV SI, AX      ; Guardar el area en SI

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
    JMP INICIO

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

    ; Calculo del perimetro: 2 * (base + altura)
    MOV AX, i1
    ADD AX, i2      ; base + altura
    MOV BX, 2
    MUL BX          ; 2 * (base + altura)
    MOV DI, AX      ; Guardar el perimetro en DI

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
    JMP INICIO         
   
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
    MOV AH, 00H
    MOV AL, 03H
    INT 10H

    MOV AH, 09H
    LEA DX, mensajeLadoH
    INT 21H
    
    LEA DX, espa
    INT 21H
    
    CALL SCAN_NUM
    MOV i1, CX      ; Lado del hexagono
    
    ; Calculo del area: ((3 * sqrt(3)) / 2) * lado^2
    MOV AX, i1
    MUL AX          ; Lado^2
    MOV BX, 155     ; Aproximacion de ((3 * sqrt(3)) / 2)
    DIV BX          ; (lado^2 * 155) / 2
    MOV SI, AX      ; Guardar el area en SI

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
    JMP INICIO

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
    MOV i1, CX      ; Lado del hexagono

    ; Calculo del perimetro: 6 * lado
    MOV AX, i1
    MOV BX, 6
    MUL BX          ; 6 * lado
    MOV DI, AX      ; Guardar el perimetro en DI

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
    JMP INICIO

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
