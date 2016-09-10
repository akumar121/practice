OBJECTS= file1.o file2.o file3.o
MAKE=gcc
FLAGS= -c 
all:a.out
CFLAGS ?= -I. # standard variable,without this implicit rule don't add -I. and fails compilation for local header file
a.out:$(OBJECTS)
	gcc -o a.out $(OBJECTS)

file3.o:file3.c
	gcc $(FLAGS) $(CFLAGS) file3.c


clean:
	rm *.o
	rm a.out 
