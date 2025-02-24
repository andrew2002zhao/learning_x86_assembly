section .text
global square_root
square_root:
    ; Provide your implementation here
    mov eax, edi;
    ; but we want integer return types ????????
    cvtsi2ss xmm0, eax;
    sqrtss xmm0, xmm0;
    cvtss2si eax, xmm0;
    
    ret
%ifidn __OUTPUT_FORMAT__,elf64
section .note.GNU-stack noalloc noexec nowrite progbits
%endif