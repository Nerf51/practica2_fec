#Problema 1

.data
array_byte: .byte 60, 61, 62, 63
array_media: .half 10, 20, 30, 40
array_palabra: .word -1, -2, -3, -4
.text
.globl main
main:
la $t1, array_media #Apunta a la dirección del 1º elemento del array_media
lh  $s0, 0($t1) #Carga el 1º elemento del vector en s0
lh $s1, 2($t1) #Carga el 2º elemento del vector en s1
lh $s2, 4($t1) #Carga el 3º elemento del vector en s2
lh $s3, 6($t1) #Carga el 4º elemento del vector en s3

#Problema 2

.data
array_byte: .byte 60, 61, 62, 63
array_media: .half 10, 20, 30, 40
array_palabra: .word -1, -2, -3, -4
.text
.globl main
main:
la $t1, array_palabra #Apunta a la dirección del 1º elemento del array_palabra
lw  $s0, 0($t1) #Carga el 1º elemento del vector en s0
lw $s1, 4($t1) #Carga el 2º elemento del vector en s1
lw $s2, 8($t1) #Carga el 3º elemento del vector en s2
lw $s3, 12($t1) #Carga el 4º elemento del vector en s3

#Problema 3

.data
array_byte: .byte 60, 61, 62, 63
array_media: .half 10, 20, 30, 40
array_palabra: .word -1, -2, -3, -4
.text
.globl main
main:
la $t1, array_media #Apunta a la dirección del 1º elemento del array_media
lh  $s0, 0($t1) #Carga el 1º elemento del vector en s0
lh $s1, 2($t1) #Carga el 2º elemento del vector en s1
lh $s2, 4($t1) #Carga el 3º elemento del vector en s2
lh $s3, 6($t1) #Carga el 4º elemento del vector en s3

move $a0, $s0
li $v0, 1
syscall
move $a0, $s2
syscall

#Problema 4

.data
array_byte: .byte 60, 61, 62, 63
array_media: .half 10, 20, 30, 40
array_palabra: .word -1, -2, -3, -4
espacio: .asciiz ", "
.text
.globl main
main:
la $t1, array_palabra #Apunta a la dirección del 1º elemento del array_palabra
lh  $s0, 0($t1) #Carga el 1º elemento del vector en s0
lh $s1, 4($t1) #Carga el 2º elemento del vector en s1
lh $s2, 8($t1) #Carga el 3º elemento del vector en s2
lh $s3, 12($t1) #Carga el 4º elemento del vector en s3
 move $a0, $s1
li $v0, 1
syscall
li $v0, 4
la $a0, espacio
syscall
move $a0, $s3
li $v0, 1
syscall

#Problema 5

.data
numero1: .word 100
numero2:  .word -10
resultado: .space 4
.text
.globl main
main:
lw $t0, numero1
lw $t1, numero2
add $t3, $t0, $t1
sw $t3, resultado

#Problema 6

.data
valor: .word 0xa, 0xb, 0x01, 0x02
.text
.globl main
main:
move $t0, $zero # $t0<-- "indice" con valor inicial 0
move $t1, $zero # $t1<-- "suma" con valor inicial 0
li $t2, 4 # $t2<-- constante
la $s0, valor # $s0<-- puntero a ‘valor’
bucle: 
mul $t3, $t0, $t2 # t3 = 2*indice + 2*indice = 4 * indice
add $t4, $s0, $t3 # Suma del desplazamiento a la dirección base, t1= base +4*i
lw $s1, 0($t4) # Carga del elemento referenciado por la dirección guardada en t1, se carga en s1
add $t1, $t1, $s1 # Suma el elemento a la suma anterior
add $t0, $t0, 1 # Incremento del indice
blt $t0, $t2, bucle # Repite el bucle si no se ha llegado al ultimo elemento (indice<4)

#Problema 7      OBSERVACIONES: PREGUNTAR DUDA ACERCA DEL MÉTODO DE DIRECCIONAMIENTO

.data
valor: .word 0xa, 0xb, 0x01, 0x02
.text
.globl main
main:
move $t0, $zero # $t0<-- "indice" con valor inicial 0
move $t1, $zero # $t1<-- "suma" con valor inicial 0
li $t2, 0
la $s0, valor # $s0<-- puntero a ‘valor’
bucle: 
lw $s1, $t2($s0)
add $t1, $t1, $s1 # Suma el elemento a la suma anterior
add $t2, $t2, 4
lw $s1, $t2($s0)
add $t0, $t0, 1 # Incremento del indice
blt $t0, $t2, bucle # Repite el bucle si no se ha llegado al ultimo elemento (indice<4)

#Problema 8

.data
valor: .word 0xa, 0xb, 0x01, 0x02
.text
.globl main
main:
move $t0, $zero # $t0<-- "indice" con valor inicial 0
move $t1, $zero # $t1<-- "suma" con valor inicial 0
li $t2, 4 # $t2<-- constante
la $s0, valor # $s0<-- puntero a ‘valor’
bucle: 
lw $s1, 0($s0) # Carga del elemento referenciado por la dirección guardada en t1, se
add $s0, $s0, 4 # Aumentar una palabra el puntero del array
add $t1, $t1, $s1 # Suma el elemento a la suma anterior
add $t0, $t0, 1 # Incremento del indice
blt $t0, $t2, bucle # Repite el bucle si no se ha llegado al ultimo elemento (indice<4)

#Problema 9

.data
valor: .word 0xa, 0xb, 0x01, 0x02
texto: .asciiz "La suma es: "
.text
.globl main
main:
move $t0, $zero # $t0<-- "indice" con valor inicial 0
move $t1, $zero # $t1<-- "suma" con valor inicial 0
li $t2, 4 # $t2<-- constante
la $s0, valor # $s0<-- puntero a ‘valor’
bucle: 
lw $s1, 0($s0) # Carga del elemento referenciado por la dirección guardada en t1, se
add $s0, $s0, 4 # Aumentar una palabra el puntero del array
add $t1, $t1, $s1 # Suma el elemento a la suma anterior
add $t0, $t0, 1 # Incremento del indice
blt $t0, $t2, bucle # Repite el bucle si no se ha llegado al ultimo elemento (indice<4)
li $v0, 4
la $a0, texto
syscall
li $v0, 1
move $a0, $t1
syscall

#Problema 10

.data
valor: .half 0xa, 0xb, 0x01, 0x02
texto: .asciiz "La suma es: "
.text
.globl main
main:
move $t0, $zero # $t0<-- "indice" con valor inicial 0
move $t1, $zero # $t1<-- "suma" con valor inicial 0
li $t2, 4 # $t2<-- constante
la $s0, valor # $s0<-- puntero a ‘valor’
bucle: 
lh $s1, 0($s0) # Carga del elemento referenciado por la dirección guardada en t1, se
add $s0, $s0, 2 # Aumentar media palabra el puntero del array
add $t1, $t1, $s1 # Suma el elemento a la suma anterior
add $t0, $t0, 1 # Incremento del indice
blt $t0, $t2, bucle # Repite el bucle si no se ha llegado al ultimo elemento (indice<4)
li $v0, 4
la $a0, texto
syscall
li $v0, 1
move $a0, $t1
syscall

#Problema 11

.data
valor: .half 0xa, 0xb, 0x01, 0x02
suma: .word 0
texto: .asciiz "La suma es: "
.text
.globl main
main:
move $t0, $zero # $t0<-- "indice" con valor inicial 0
move $t1, $zero # $t1<-- "suma" con valor inicial 0
li $t2, 4 # $t2<-- constante
la $s0, valor # $s0<-- puntero a ‘valor’
bucle: 
lh $s1, 0($s0) # Carga del elemento referenciado por la dirección guardada en t1, se
add $s0, $s0, 2 # Aumentar media palabra el puntero del array
add $t1, $t1, $s1 # Suma el elemento a la suma anterior
add $t0, $t0, 1 # Incremento del indice
blt $t0, $t2, bucle # Repite el bucle si no se ha llegado al ultimo elemento (indice<4)
sw $t1, suma
li $v0, 4
la $a0, texto
syscall
li $v0, 1
lw $a0, suma
syscall

#Problema 12

.data
array1: .word 5, 13, -7, -5, 17
.text
.globl main
main:

#Problema 13

.data
array1: .word 2, 34, 12, -4, 6
espacios: .space 8
array2: .word 2, 34, 12, -4, 6
.text
.globl main
main:

#Problema 14

.data
array: .word 9, -9, -2, -5
indice: .asciiz "Indice: "
valor: .asciiz ", Valor: "
.text
.globl main
main:
li $t0, 1 # Valor del indice del array (Se obvia el primer elemento)
la $s0, array # Puntero a la primera dirección de memoria del array
move $s1, $zero # $s1 contiene el índice del elemento mayor, por defecto el primero
lw $s2, 0($s0) # $s2 contiene el valor del elemento mayor, por defecto el primero
bucle:
addi $s0, $s0, 4 # Se aumenta 4 bytes el puntero $s0 para pasar a la siguiente casilla
lw $t1, 0($s0) # $t1 contiene el elemento temporal que se va a comparar con el actualmente mayor
ble $t1, $s2, actualizaciones # Si el elemento temporal <= elemento mayor actualmente, entonces pasa a las actualizaciones
move $s1, $t0 # Si no, el elemento temporal pasa a ser el mayor actualmente
lw $s2, 0($s0) # Se guarda el índice del elemento temporal
actualizaciones:
addi $t0, $t0, 1 # Aumentamos en 1 el índice general del bucle
bltu $t0, 4, bucle # Comprobamos si el índice es menor que el número de elementos (4), y si es así salta a bucle para otra iteración
imprimir: #Instrucciones para imprimir los resultados
la $a0, indice # Cargar en el primer argumento la cadena de texto ("Indice")
li $v0, 4 # Cargar el servicio para imprimir cadenas de texto
syscall # Ejecutar el servicio syscall
move $a0, $s1 # Cargar el entero del índice en el primer argumento
li $v0, 1 # Cargar el servicio para imprimir enteros
syscall # Ejecutar el servicio syscall
la $a0, valor # Cargar en el primer argumento la cadena de texto ("Valor")
li $v0, 4 # Cargar el servicio para imprimir cadenas de texto
syscall # Ejecutar el servicio syscall
move $a0, $s2 # Cargar el entero del valor en el primer argumento
li $v0, 1 # Cargar el servicio para imprimir enteros
syscall # Ejecutar el servicio syscall

#Problema 15

.data # Reservar espacio de memoria para las cadenas de texto
texto1: .asciiz "Ingrese el primer numero: "
texto2: .asciiz "Ingrese el segundo numero: "
texto3: .asciiz "La suma de los numeros inroducidos es: "
.text
.globl main
main:
la $a0, texto1 # Cargar la dirección de memoria de la primera cadena de texto
li $v0, 4 # Especificar el servicio de imprimir cadenas de texto
syscall # Ejecutar el servicio syscall
li $v0, 5 # Especificar el servicio de pedir un número entero al usuario
syscall # Ejecutar el servicio syscall
move $s0, $v0 # Guardar el número introducido en $s0
la $a0, texto2 # Cargar la dirección de memoria de la segunda cadena de texto
li $v0, 4 # Especificar el servicio de imprimir cadenas de 
syscall # Ejecutar el servicio syscall
li $v0, 5 # Especificar el servicio de pedir un número entero al usuario
syscall # Ejecutar el servicio syscall
move $s1, $v0 # Guardar el número introducido en $s1
add $s3, $s0, $s1 # Sumar los numeros introducidos y guardar el resultado en $s3
imprimir:
la $a0, texto3 # Cargar la dirección de memoria de la tercera cadena de texto
li $v0, 4 # Especificar el servicio de imprimir cadenas de texto
syscall # Ejecutar el servicio syscall
move $a0, $s3 # Cargar el resultado obtenido de la suma en el primer argumento
li $v0, 1 # Especificar el servicio de imprimir enteros
syscall # Ejecutar el servicio syscall

#Problema 16

.data # Definición del array y las cadenas de texto
array: .byte 1, 3, 5, 7, 9, 2, 4, 6, 8, 10
texto1: .asciiz "Array={"
separador: .asciiz ", "
fin: .asciiz "}"
.text
.globl main
main:
move $t0, $zero # Indice del array
la $s0, array # Puntero del array en $s0
la $a0, texto1 # Cargar el primer texto en el primer argumento
li $v0, 4 # Especificar el servicio de imprimir cadenas de texto
syscall # Ejecutar el servicio syscall
bucle:
lb $t1, 0($s0) # Guardar el elemento (1  byte) temporalmente en $t1
imprimir:
move $a0, $t1 # Cargar el elemento guardado en el primer argumento
li $v0, 1 # Especificar el servicio de imprimir enteros
syscall # Ejecutar el servicio syscall
beq $t0, 9, actualizaciones # Si es el último elemento, pasar a actualizaciones directamente y no imprimir un separador (, )
la $a0, separador # Cargar el texto de separador en el primer argumento
li $v0, 4 # Especificar el servicio de imprimir cadenas de texto
syscall # Ejecutar el servicio syscall
actualizaciones:
addi $t0, $t0, 1 # Aumentar en 1 el índice del array
addi $s0, $s0, 1 # Aumentar 1 byte la dirección de memoria del puntero al array para apuntar al siguiente elemento
bltu $t0, 10, bucle # Si el índice es menor que 10, hacer otra iteración
final:
la $a0, fin # Cargar el texto de cierre en el primer argumento
li $v0, 4 # Especificar el servicio de imprimir cadenas de texto 
syscall # Ejecutar el servicio syscall
