%include "../io.mac"

section .text
    global main
    extern printf

main:
    ;cele doua multimi se gasesc in eax si ebx
    mov eax, 139
    mov ebx, 169
    PRINTF32 `%u\n\x0`, eax ; afiseaza prima multime
    PRINTF32 `%u\n\x0`, ebx ; afiseaza cea de-a doua multime

    ; TODO1: reuniunea a doua multimi
    OR eax, ebx
    
    PRINTF32 `%u\n\x0`, eax
    
    ; TODO2: adaugarea unui element in multime
    mov ecx, 1
    shl ecx, 2
    OR eax, ecx
    
    PRINTF32 `%u\n\x0`, eax
    mov ecx, 1
    shl ecx, 4
    OR eax, ecx

    PRINTF32 `%u\n\x0`, eax

    ; TODO3: intersectia a doua multimi
    AND eax, ebx
    PRINTF32 `%u\n\x0`, eax

    ; TODO4: complementul unei multimi
    mov ecx, 255
    XOR eax, ecx
    PRINTF32 `%u\n\x0`, eax
    
    ; TODO5: eliminarea unui element
    mov ecx, 1
    shl ecx, 1
    XOR ecx, 255
    AND eax, ecx
    PRINTF32 `%u\n\x0`, eax


    ; TODO6: diferenta de multimi EAX-EBX
    xor ebx, 255
    AND eax, ebx
    PRINTF32 `%u\n\x0`, eax
    ret
