.section .text
.globl _start

_start:
    auipc   x1 , 0x0A500
    sw      x1 ,  4(x1)
    lui     x2 , 0x9876A
    addi    x2 , x2, 0x5A5
    sw      x2 ,  8(x1)
    slli    x3 , x2, 1
    sw      x3 , 12(x1)
    slli    x4 , x2, 2
    sw      x4 , 16(x1)
    slli    x5 , x2, 4
    sw      x5 , 20(x1)
    slli    x6 , x2, 8
    sw      x6 , 24(x1)
    slli    x7 , x2, 16
    sw      x7 , 28(x1)
    slli    x8 , x2, 31
    sw      x8 , 32(x1)
    srai    x9 , x2, 1
    sw      x9 , 36(x1)
    srai    x10, x2, 2
    sw      x10, 40(x1)
    srai    x11, x2, 4
    sw      x11, 44(x1)
    srai    x12, x2, 8
    sw      x12, 48(x1)
    srai    x13, x2, 16
    sw      x13, 52(x1)
    srai    x14, x2, 31
    sw      x14, 56(x1)
    srli    x15, x2, 1
    sw      x15, 60(x1)
    srli    x16, x2, 2
    sw      x16, 64(x1)
    srli    x17, x2, 4
    sw      x17, 68(x1)
    srli    x18, x2, 8
    sw      x18, 72(x1)
    srli    x19, x2, 16
    sw      x19, 76(x1)
    srli    x20, x2, 31
    sw      x20, 80(x1)
    slti    x0 , x0, -256
