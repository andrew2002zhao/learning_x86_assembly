;an exercise to learn about loops
section .text
global distance
distance:
    ; Provide your implementation here
    ; this now gives me two addresses ?
    mov rcx, 0; start a counter of 0
    ; compare byte by byte and i guess read the null termination?
.loop:
    mov al, [rdi];
    mov bl, [rsi];
    
    test al, al;
    jz .a_end;
    ;al is not 0
    test bl, bl;
    jz .diff_length;
   
    cmp al, bl;
    jne .increment_counter;
    inc rdi;
    inc rsi;
   
    jmp .loop;
.increment_counter:
    inc rsi;
    inc rdi;
    inc rcx;
    jmp .loop;
.a_end:
    test bl, bl;
    jnz .diff_length;
    mov rax, rcx;
    ret;
.diff_length:
    mov rax, -1;
    ret;
%ifidn __OUTPUT_FORMAT__,elf64
section .note.GNU-stack noalloc noexec nowrite progbits
%endif
