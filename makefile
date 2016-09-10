CC=gcc
CFLAGS ?= -I. # standard variable,without this implicit rule don't add -I. and fails compilation for local header file


#for creating .o in directory
OBJECTS= $(addprefix $(OBJDIR)/,file1.o file2.o file3.o)
FLAGS= -c 
OBJDIR:= objdir

#this is standard variable use for deleting a.out if it fails on middle
.DELLETE_ON_ERROR:a.out

all:a.out 
a.out:$(OBJECTS) 
	gcc -o a.out $(OBJECTS)


#path in VPATH or vpath directive is used to search for target/prerequisites after checking current directory
#VPATH=./dir1/  #this will also work in place of vpath

#vpath(small letter) directives:3 type
#vpath pattern directives (set path in directive for search pattern)
#vpath pattern (clear old search directory for pattern)
#vpath (clear all old serach directory set)
vpath %.c ./dir1/

#pattern rule for creating .o in directory from .c file
$(OBJDIR)/%.o:%.c
#	gcc $(FLAGS) $(CFLAGS) -o $@ $*.c  #this also works as $* represent stem
	gcc $(FLAGS) $(CFLAGS) -o $@ $< 

#this is order only prerequisite(normal|order only), which is helpful for relation like: create directory if .o need to build, but don't build/rebuild .o if directory timestamp has changed!!
$(OBJECTS): | create

create:
	mkdir -p $(OBJDIR)

#print any makefile variable
print-%: 
	@echo '$*=$($*)'


#.PHONY advantage: go ahead even file with same name available, doesn't check implicit rules for phony target(performance).
.PHONY:clean
clean:
	rm $(OBJECTS)
	rm a.out 

.SECONDEXPANSION:
VAR1=one
first:$(VAR1)  #it will be one
second:$$(VAR1)  #it will be three
VAR1=two
VAR1=three


.SECONDEXPANSION:
main_OBJS := file1.o
lib_OBJS := file1.o file2.o
#main lib: $($@_OBJS) #this doesn't work
main lib: $$($$@_OBJS)


#default rule if target not found(unknown target)
.DEFAULT:
	@echo I am default as no rule found


#This rule uses print as an empty target file; Empty Target Files to Record Events. (The automatic variable ‘$?’ is used to print only those files that have changed)
print: *.c
	@echo $?
	touch print




