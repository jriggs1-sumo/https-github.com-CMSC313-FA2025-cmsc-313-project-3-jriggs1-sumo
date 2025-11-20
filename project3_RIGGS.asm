; declares the amount of bits
bits 64
global main

; variables w/ values
section .data
file_name:      db "input.bin", 0
base64_alphabet: db "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/", 0

; reserves space for variables to be filled later  
section .bss
input_bytes:    resb 48
encoded_bytes:  resb 65

section .text
main:

    xor rsi, rsi    ; clears out rsi
    xor rdx, rdx    ; clears out rdx
    ; opens input.bin and store its input in r12
    mov rax, 2      ; set to 2 for syscall open 
    mov rdi, [file_name]    
    syscall
    mov r12, rax

    ; reads from input.bin 
    mov rax, 0
    mov rdi, r12
    mov rsi, [input_bytes]  ; where data is stored
    mov rdx, 48
    syscall

    ; copies the data to output 
    mov rcx, 48
    mov rsi, [input_bytes]
    mov rdi, [encoded_bytes]
