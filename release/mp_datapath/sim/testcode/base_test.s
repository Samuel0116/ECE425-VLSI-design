.section .text
.globl _start

_start:
    auipc   x1 , 0x0A500
    sw      x1 ,  4(x1)
    lui     x2 , 0xAA55A
    sw      x2 ,  8(x1)
    bne     x1 , x2, target1
    sw      x0 ,  0(x1)
target1:
    lui     x3 , %hi(target2)
    jalr    x4 , %lo(target2)(x3)
    sw      x0 ,  0(x1)
target2:
    sw      x4 , 16(x1)
    addi    x5 , x0, 0x233
    sw      x5 , 20(x1)
    addi    x6 , x0, -1
    sw      x6 , 24(x1)
    slti    x7 , x5, 0x232
    sw      x7 , 28(x1)
    slti    x8 , x5, 0x234
    sw      x8 , 32(x1)
    slti    x9 , x6, 0
    sw      x9 , 36(x1)
    sltiu   x10, x6, 0
    sw      x10, 40(x1)
    sub     x11, x4, x3
    sw      x11, 44(x1)
    lb      x12, -3(x4)
    sw      x12, 48(x1)
    lbu     x13, -3(x4)
    sw      x13, 52(x1)
    lh      x14, -4(x4)
    sw      x14, 56(x1)
    lhu     x15, -4(x4)
    sw      x15, 60(x1)
    lw      x16, -4(x4)
    sw      x16, 64(x1)
    xor     x17, x2, x4
    sw      x17, 68(x1)
    and     x18, x2, x16
    sw      x18, 72(x1)
    slti    x0 , x0, -256
