L0: # Randomly initialize GPR
    lui         x0, 0x900A2
    nop
    nop
    addi        x0, x0, 0x7F7
    nop
    nop
    lui         x1, 0xFCBBC
    nop
    nop
    addi        x1, x1, 0x210
    nop
    nop
    lui         x2, 0xA2BE3
    nop
    nop
    addi        x2, x2, 0xFFFFFEDE
    nop
    nop
    lui         x3, 0xE4AA7
    nop
    nop
    addi        x3, x3, 0xFFFFFE91
    nop
    nop
    lui         x4, 0xFBA4D
    nop
    nop
    addi        x4, x4, 0x409
    nop
    nop
    lui         x5, 0xDD3A5
    nop
    nop
    addi        x5, x5, 0xF9
    nop
    nop
    lui         x6, 0xE5AB2
    nop
    nop
    addi        x6, x6, 0xFFFFFACD
    nop
    nop
    lui         x7, 0xCAB0F
    nop
    nop
    addi        x7, x7, 0xFFFFFF85
    nop
    nop
    lui         x8, 0x5B654
    nop
    nop
    addi        x8, x8, 0xFFFFFAE9
    nop
    nop
    lui         x9, 0x555F6
    nop
    nop
    addi        x9, x9, 0xFFFFFEA1
    nop
    nop
    lui         x10, 0xB9A6A
    nop
    nop
    addi        x10, x10, 0x217
    nop
    nop
    lui         x11, 0xD0ACE
    nop
    nop
    addi        x11, x11, 0x408
    nop
    nop
    lui         x12, 0x2CD17
    nop
    nop
    addi        x12, x12, 0xFFFFFE11
    nop
    nop
    lui         x13, 0xC667C
    nop
    nop
    addi        x13, x13, 0xFFFFFDE5
    nop
    nop
    lui         x14, 0xC5B84
    nop
    nop
    addi        x14, x14, 0x451
    nop
    nop
    lui         x15, 0x40640
    nop
    nop
    addi        x15, x15, 0xFFFFFE87
    nop
    nop
    lui         x16, 0xA9EE4
    nop
    nop
    addi        x16, x16, 0xFFFFFF5D
    nop
    nop
    lui         x17, 0xC937A
    nop
    nop
    addi        x17, x17, 0xFFFFFF41
    nop
    nop
    lui         x18, 0x79ABA
    nop
    nop
    addi        x18, x18, 0xFFFFFBC0
    nop
    nop
    lui         x19, 0x212F8
    nop
    nop
    addi        x19, x19, 0x255
    nop
    nop
    lui         x20, 0xF6A35
    nop
    nop
    addi        x20, x20, 0x67B
    nop
    nop
    lui         x21, 0xBFCB0
    nop
    nop
    addi        x21, x21, 0xFFFFFE3D
    nop
    nop
    lui         x22, 0x1A00F
    nop
    nop
    addi        x22, x22, 0x4F
    nop
    nop
    lui         x23, 0x6556E
    nop
    nop
    addi        x23, x23, 0xFFFFF85D
    nop
    nop
    lui         x24, 0x45007
    nop
    nop
    addi        x24, x24, 0x5BD
    nop
    nop
    lui         x25, 0x4EC49
    nop
    nop
    addi        x25, x25, 0xFFFFF87C
    nop
    nop
    lui         x26, 0x26F63
    nop
    nop
    addi        x26, x26, 0xA1
    nop
    nop
    lui         x27, 0x7E609
    nop
    nop
    addi        x27, x27, 0x404
    nop
    nop
    lui         x28, 0x32236
    nop
    nop
    addi        x28, x28, 0xFFFFFD07
    nop
    nop
    lui         x29, 0xCC3BD
    nop
    nop
    addi        x29, x29, 0x27A
    nop
    nop
    lui         x30, 0x65087
    nop
    nop
    addi        x30, x30, 0x5CD
    nop
    nop
    lui         x31, 0x94AC7
    nop
    nop
    addi        x31, x31, 0xFFFFFA34
    nop
    nop
L1: # Test 0-0: lw
    lui         x23, 0x10016
    nop
    nop
    addi        x23, x23, 0x2EC
    nop
    nop
    lw          x19, 0xFFFFFE64(x23)
    nop
    nop
    lui         x1, 0x0
    nop
    nop
    addi        x1, x1, 0x0
    nop
    nop
    bne         x19, x1, fail
    nop
    nop
L2: # Test 1-0: lhu
    lui         x24, 0x10030
    nop
    nop
    addi        x24, x24, 0xFFFFFADC
    nop
    nop
    lhu         x24, 0xFFFFFA3C(x24)
    nop
    nop
    lui         x12, 0x0
    nop
    nop
    addi        x12, x12, 0x0
    nop
    nop
    bne         x24, x12, fail
    nop
    nop
L3: # Test 2-0: lbu
    lui         x23, 0x1002C
    nop
    nop
    addi        x23, x23, 0x590
    nop
    nop
    lbu         x1, 0xFFFFFBB8(x23)
    nop
    nop
    lui         x3, 0x0
    nop
    nop
    addi        x3, x3, 0x0
    nop
    nop
    bne         x1, x3, fail
    nop
    nop
L4: # Test 3-0: sb
    lui         x6, 0x10028
    nop
    nop
    addi        x6, x6, 0xFFFFFFD5
    nop
    nop
    sb          x28, 0x4C0(x6)
    nop
    nop
    lui         x16, 0x10028
    nop
    nop
    addi        x16, x16, 0x459
    nop
    nop
    lbu         x30, 0x3B(x16)
    nop
    nop
    lui         x20, 0x0
    nop
    nop
    addi        x20, x20, 0x0
    nop
    nop
    bne         x30, x20, fail
    nop
    nop
    lui         x4, 0x10028
    nop
    nop
    addi        x4, x4, 0x71D
    nop
    nop
    lbu         x29, 0xFFFFFD77(x4)
    nop
    nop
    lui         x19, 0x0
    nop
    nop
    addi        x19, x19, 0x0
    nop
    nop
    bne         x29, x19, fail
    nop
    nop
    lui         x31, 0x10029
    nop
    nop
    addi        x31, x31, 0xFFFFF822
    nop
    nop
    lbu         x26, 0xFFFFFC72(x31)
    nop
    nop
    lui         x18, 0x0
    nop
    nop
    addi        x18, x18, 0x0
    nop
    nop
    bne         x26, x18, fail
    nop
    nop
    lui         x30, 0x10029
    nop
    nop
    addi        x30, x30, 0xFFFFFB84
    nop
    nop
    lbu         x25, 0xFFFFF910(x30)
    nop
    nop
    lui         x11, 0x0
    nop
    nop
    addi        x11, x11, 0x0
    nop
    nop
    bne         x25, x11, fail
    nop
    nop
L5: # Test 4-0: sh
    lui         x1, 0x10035
    nop
    nop
    addi        x1, x1, 0x1C3
    nop
    nop
    sh          x26, 0xFFFFF995(x1)
    nop
    nop
    lui         x1, 0x10035
    nop
    nop
    addi        x1, x1, 0x2B7
    nop
    nop
    lbu         x19, 0xFFFFF8A1(x1)
    nop
    nop
    lui         x11, 0x0
    nop
    nop
    addi        x11, x11, 0x0
    nop
    nop
    bne         x19, x11, fail
    nop
    nop
    lui         x2, 0x10034
    nop
    nop
    addi        x2, x2, 0x572
    nop
    nop
    lbu         x1, 0x5E6(x2)
    nop
    nop
    lui         x20, 0x0
    nop
    nop
    addi        x20, x20, 0x0
    nop
    nop
    bne         x1, x20, fail
    nop
    nop
    lui         x28, 0x10035
    nop
    nop
    addi        x28, x28, 0xFFFFF818
    nop
    nop
    lbu         x26, 0x340(x28)
    nop
    nop
    lui         x15, 0x0
    nop
    nop
    addi        x15, x15, 0x0
    nop
    nop
    bne         x26, x15, fail
    nop
    nop
    lui         x25, 0x10035
    nop
    nop
    addi        x25, x25, 0x44
    nop
    nop
    lbu         x14, 0xFFFFFB14(x25)
    nop
    nop
    lui         x27, 0x0
    nop
    nop
    addi        x27, x27, 0x0
    nop
    nop
    bne         x14, x27, fail
    nop
    nop
win: # Win label
    lui         x4, 0x0
    nop
    nop
    addi        x4, x4, 0x0
    nop
    nop
    j           end
    nop
    nop
fail: # Fail label
    lui         x4, 0x0
    nop
    nop
    addi        x4, x4, 0xFFFFFFFF
    nop
    nop
    j           end
    nop
    nop
end:
    ebreak
