[bits 16]
Kernerl_OFFSET equ 0x1000
mov [BOOT_DRIVE], dl

mov bp , 0x9000
mov sp , bp

call load_kernel
call switch_to_32bit

jmp $

%include "disk.asm"
%include "gdt.asm"
%include "switch-to-32bit.asm"

[bits 16]
load_kernel:
    mov bx,Kernerl_OFFSET
    mov dh,2
    mov dl,[BOOT_DRIVE]
    call disk_load
    ret

[bits 32]
 Begin_32BIT:
    call Kernerl_OFFSET
    jmp $

BOOT_DRIVE db 0
global Begin_32BIT
times 510 - ($-$$) db 0

dw 0xaa55
