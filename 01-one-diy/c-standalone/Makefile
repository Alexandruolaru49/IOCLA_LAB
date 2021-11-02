CFLAGS = -fno-PIC -m32 -g
LDFLAGS = -nostdinc -nostdlib -no-pie -m32
AS = nasm
ASFLAGS = -f elf32

.DEFAULT_GOAL: all

.PHONY: all clean

all: name

name: name.o 
	ld -dynamic-linker /lib/ld-linux.so.2 -m elf_i386 -o $@ /usr/lib32/crt1.o /usr/lib32/crti.o $^ -lc /usr/lib32/crtn.o

name.o: name.c

start.o: start.asm
	$(AS) $(ASFLAGS) -o $@ $<

puts.o: puts.asm
	$(AS) $(ASFLAGS) -o $@ $<

clean:
	-rm -f hello hello.o start.o puts.o
	-rm -f *~
