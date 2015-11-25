; array.asm
;
; assemble: nasm -f elf -l array.lst array.asm
; link:     gcc -o array array.o
; run:      array

;;;;;;;;;; data section ;;;;;;;;;;

      SECTION .data

;;;;;;;;;; bss section ;;;;;;;;;;

      SECTION .bss
arr:  times 10 resb 1
len:  equ $-arr

;;;;;;;;;; text section ;;;;;;;;;;

      SECTION .text
      global main
main:
      mov ecx,9

loopstart:
      mov edx, [arr + ecx]
      imul ebx, ecx, 2
      mov [edx], ebx
      dec ecx
      jnz loopstart

print: 
      mov edx, len
      mov ecx, arr
      mov ebx, 1
      mov eax, 4
      int 0x80

exit:
      mov ebx,0
      mov eax,1
      int 0x80
