;an exercise to learn about temporary variables

section .text
global find
find:
    ;null check
    test edi, edi
    jz error_return
    ; Provide your implementation here
    push rbp ; save the old base pointer
    mov rbp, rsp ; move the base pointer to where the current stack pointer is 
    sub rsp, 16; allocate 12 bytes of space
    start equ -4
    end equ -8
    mid equ -12
    
    mov dword [rbp + start], 0
    mov dword [rbp + end], esi
    sub dword [rbp + end], 1
loop:
    mov eax, [rbp + start]              ; eax = start
    cmp eax, [rbp + end]              ; compare start and end
    jg error_return
    mov eax, [rbp + end]; eax = end
    sub eax, [rbp + start]; eax = (end - start)
    shr eax, 1; eax = (end - start) / 2
    add eax, [rbp + start]
    mov dword [rbp + mid], eax;mid = (end - start) / 2
    
    mov ecx, [rbp - 12]
    shl ecx, 2; get the address in the array, since address is 64 bit then use 64 bit wide register
    add rcx, rdi
    mov eax, [rcx];
    cmp eax, edx
    je found
    jl update_start
    jg update_end
update_end:
    mov eax, [rbp + mid] 
    sub eax, 1
    mov dword [rbp + end], eax
    jmp loop
update_start:
    mov eax, [rbp + mid] 
    add eax, 1
    mov dword [rbp + start], eax
    jmp loop
found:
    mov eax, [rbp + mid]
    jmp cleanup
error_return:
    mov eax, -1
cleanup:
    mov rsp, rbp
    pop rbp;
    ret
%ifidn __OUTPUT_FORMAT__,elf64
section .note.GNU-stack noalloc noexec nowrite progbits
%endif
