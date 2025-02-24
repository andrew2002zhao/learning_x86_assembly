;an exercise to learn about division and modulus in x86
section .text
global leap_year
leap_year:
    ; Provide your implementation here 
    mov rax, rdi;
     ; test divisibility of 400
    mov rbx, 400;
    xor rdx, rdx; effective way to 0 a register
    idiv rbx;
    test rdx, rdx; this is an assembly trick to check if a value is 0
    jz leap;
    mov rax, rdi;
    mov rbx, 100;
    xor rdx, rdx; clear rdx register
    idiv rbx;
    test rdx, rdx;
    jz not_leap;
    mov rax, rdi;
    mov rbx, 4;
    xor rdx, rdx; 
    idiv rbx;
    test rdx, rdx;
    jz leap;
    jmp not_leap;
not_leap:
    mov rax, 0;
    ret;
leap:
    mov rax, 1;
    ret;
   
%ifidn __OUTPUT_FORMAT__,elf64
section .note.GNU-stack noalloc noexec nowrite progbits
%endif
