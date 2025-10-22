; para executar é só usar o nasm e o qemu i386
; nasm -f bin boot.asm -o boot.bin
; qemu-system-i386 -fda boot.bin

[ORG 0x7C00]
BITS 16
 
start:
    XOR AX, AX
    MOV DS, AX
    MOV ES, AX
    MOV SS, AX
    MOV SP, 0x7C00
 
    MOV SI, fxck
 
print_loop:
    LODSB
    OR AL, AL
    JZ gozei
 
    MOV AH, 0x0E
    INT 0x10
 
    JMP print_loop
 
gozei:
    CLI
    HLT
    JMP gozei
 
fxck: DB "eu amo o artemis :3", 0x0D, 0x0A, 0
 
times 510 - ($ - $$) DB 0
DW 0xAA55
