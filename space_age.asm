; an exercise to learn about floating point operations in x86 and static memory
section .data
    days dd 365.25;
    mercury_ratio dd 0.2408467;
    venus_ratio dd 0.61519726;
    mars_ratio dd 1.8808158;
    jupiter_ratio dd 11.862615;
    saturn_ratio dd 29.447498;
    uranus_ratio dd 84.016846;
    neptune_ratio dd 164.79132;
section .text
global age
age:
    mov eax, esi;
    cvtsi2ss xmm0, eax;
    ; convert seconds to years secs / 60 * 60 * 24 * 365
    mov eax, 60;
    mov ebx, 60
    mul ebx;
    mov ebx, 24;
    mul ebx;
    cvtsi2ss xmm1, eax;
    mulss xmm1, [rel days];
    divss xmm0, xmm1; get the age on earth
    mov eax, edi;
    test eax, eax;
    jz mercury;
    sub eax, 1;
    test eax, eax;
    jz venus;
    sub eax, 2;
    test eax, eax;
    jz mars;
    sub eax, 1;
    test eax, eax;
    jz jupiter;
    sub eax, 1;
    test eax, eax;
    jz saturn;
    
    sub eax, 1;
    test eax, eax;
    jz uranus;
    sub eax, 1;
    test eax, eax;
    jz neptune;
    
    ret
mercury: 
    movss xmm1, [rel mercury_ratio]; mercury_ratio is relative to isp, this becomes xmm1?
    divss xmm0, xmm1;
    ret
venus:
    movss xmm1, [rel venus_ratio];
    divss xmm0, xmm1;
    ret
mars:
    movss xmm1, [rel mars_ratio];
    divss xmm0, xmm1;
    ret 
jupiter:
    movss xmm1, [rel jupiter_ratio];
    divss xmm0, xmm1;
    ret 
saturn:
    movss xmm1, [rel saturn_ratio];
    divss xmm0, xmm1;
    ret 
uranus:
    movss xmm1, [rel uranus_ratio];
    divss xmm0, xmm1;
    ret 
neptune:
    movss xmm1, [rel neptune_ratio];
    divss xmm0, xmm1;
    ret 


%ifidn __OUTPUT_FORMAT__,elf64
section .note.GNU-stack noalloc noexec nowrite progbits
%endif
