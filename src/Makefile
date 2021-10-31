
all: run

kernel.bin: kernel-entry.o kernel.o
	ld.lld -m elf_i386 -o $@ -Ttext 0x1000 $^ --oformat binary

kernel-entry.o: kernel-entry.asm
	nasm $< -f elf -o $@

kernel.o: kernel.c
	clang -target i686-pc-elf -ffreestanding -c $< -o $@

mbr.bin: mbr.asm
	nasm $< -f bin -o $@

os-image.bin: mbr.bin kernel.bin
	cat $^ > $@
run: os-image.bin
    qemu-system-i386 -fda os-image.bin  -L "C:\Program Files\qemu


clean:
	$(RM) *.bin *.o *.dis