section .data
    num1 db 5
    num2 db 3
    res db 0

section .bss
    resb 1

section .text
    global _start

_start:
    ; Cargar los números en registros
    mov al, [num1]
    add al, [num2]
    mov [res], al

    ; Convertir el resultado a ASCII
    add [res], '0'

    ; Preparar los parámetros para sys_write
    mov eax, 4          ; sys_write
    mov ebx, 1          ; file descriptor (stdout)
    mov ecx, res        ; dirección del resultado
    mov edx, 1          ; longitud del resultado
    int 0x80            ; llamada al sistema

    ; Salir del programa
    mov eax, 1          ; sys_exit
    xor ebx, ebx        ; código de salida
    int 0x80            ; llamada al sistema
