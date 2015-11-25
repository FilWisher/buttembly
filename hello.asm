; hello.asm
;
; assemble: nasm -f elf -l hello.lst hello.asm
; link:     gcc -o hello hello.o
; run:      hello

;;;;;;;;;; data section ;;;;;;;;;;

      section.data
msg:  db "Hello world", 10
len:  equ $-msg

;;;;;;;;;; text section ;;;;;;;;;;

      section.text
      global main
main:
      mov edx,len           
      mov ecx,msg
      mov ebx,1
      mov eax,4
      int 0x80
      
      mov ebx,0
      mov eax,1
      int 0x80
