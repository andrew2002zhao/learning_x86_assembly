section .text
global steps
steps:
    test edi, edi;must be edi for negatives to test for signed bit
    jle error
    
    mov rax, rdi
    mov rsi, 0
loop:
    cmp rax, 1
    je end

    xor rdx, rdx; 
    mov rbx, 2
    
    mov rcx, rax 
    div rbx ;divide by 2
    mov rax, rcx
    
    cmp rdx, 1
    je odd
    jne even
odd:
    mov rbx, 3
    mul rbx
    inc rax
    inc rsi
    jmp loop
even:
    shr rax, 1
    inc rsi
    jmp loop
error:
    mov rsi, -1
end:
    mov rax, rsi
    ret

%ifidn __OUTPUT_FORMAT__,elf64
section .note.GNU-stack noalloc noexec nowrite progbits
%endif
