SOURCE = $(wildcard *.asm)
OBJECTS = $(SOURCE:.asm=.o)

all: hello forloop

forloop: forloop.o
	gcc -o $@ $@.o

hello: hello.o
	gcc -o $@ $@.o
	
forloop.o: forloop.asm
	nasm -f elf -l $(@:.o=.lst) $<

hello.o: hello.asm
	nasm -f elf -l $(@:.o=.lst) $<

clean:
	-rm -f $(OBJECTS) $(OBJECTS:.o=.lst) forloop hello
#
#hello: hello.o
#	gcc -o $@ $@.o	
#	
#hello.o: hello.asm
#	nasm -f elf -l hello.lst hello.asm
#
#forloop: forloop.o
#	gcc -o $@ $@.o	
#	
#forloop.o: forloop.asm
#	nasm -f elf -l forloop.lst forloop.asm
#	
#clean:
#	-rm -f forloop.lst forloop.o forloop
