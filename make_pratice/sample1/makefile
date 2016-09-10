
all:a.out

a.out:file1.o file2.o file3.o
	gcc -o a.out file1.o file2.o file3.o

file1.o:file1.c
	gcc -c -I. file1.c

file2.o:file2.c
	gcc -c -I. file2.c

file3.o:file3.c
	gcc -c -I. file3.c

clean:
	rm *.o
	rm a.out 
