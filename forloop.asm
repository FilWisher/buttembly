; forloop.asm
;
; assemble: nasm -f elf -l forloop.lst forloop.asm
; link:     gcc -o forloop forloop.o
; run:      forloop

;;;;;;;;;; data section ;;;;;;;;;;

      section.data
msg:  db "Hello world", 10
len:  equ $-msg

;;;;;;;;;; text section ;;;;;;;;;;

      section.text
      global main
main:
      mov cx,10
loopstart:
      push cx
      mov edx,len           
      mov ecx,msg
      mov ebx,1
      mov eax,4
      int 0x80
      pop cx
      dec cx
      jnz loopstart
      
      mov ebx,0
      mov eax,1
      int 0x80
