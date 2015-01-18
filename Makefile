
all:i386 x86_64

i386:
	nasm -f elf32 kernel.asm -o kernel.o
#	gcc -c kernel2.c -o kernel2.o -mtune=i686
	gcc -c kernel2.c -o kernel2.o -m32
	ld -m elf_i386 -T link.ld -o kernel-helloworld kernel.o kernel2.o

x86_64:
	nasm -f elf64 kernel.asm -o kernel_x86_64.o
	gcc -c kernel2.c -o kernel2_x86_64.o
	ld -m elf_x86_64 -T link_x86_64.ld -o kernel-helloworld_x86_64 kernel_x86_64.o kernel2_x86_64.o

clean:
	rm -rf *.o kernel-helloworld kernel-helloworld_x86_64

install :
	cp kernel-helloworld /boot/

#/boot/grub/grub.cfg
#menuentry 'kernel helloworld'{
#	set root='hd0,msdos8'
#	multiboot /boot/kernel-helloworld ro
#}
	
