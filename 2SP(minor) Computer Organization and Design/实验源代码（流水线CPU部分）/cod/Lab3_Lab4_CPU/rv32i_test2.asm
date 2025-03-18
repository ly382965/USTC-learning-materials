.data
.text
L0: # Randomly initialize GPR
    lui         x0, 0xEEBB4
    addi        x0, x0, 0xFFFFFEE5
    lui         x1, 0x977F6
    addi        x1, x1, 0x37A
    lui         x2, 0xC8D8A
    addi        x2, x2, 0xFFFFFAF9
    lui         x3, 0xC398E
    addi        x3, x3, 0xFFFFF9E4
    lui         x4, 0x798A9
    addi        x4, x4, 0xFFFFFEEC
    lui         x5, 0xAC694
    addi        x5, x5, 0x6
    lui         x6, 0x7280F
    addi        x6, x6, 0xFFFFFF73
    lui         x7, 0x62F6A
    addi        x7, x7, 0x1FF
    lui         x8, 0xCEA25
    addi        x8, x8, 0x745
    lui         x9, 0x8F813
    addi        x9, x9, 0x59A
    lui         x10, 0xBA4A8
    addi        x10, x10, 0x57
    lui         x11, 0x5ED7F
    addi        x11, x11, 0xFFFFFF88
    lui         x12, 0xEB442
    addi        x12, x12, 0xFFFFFC19
    lui         x13, 0x616C7
    addi        x13, x13, 0x25D
    lui         x14, 0x9A601
    addi        x14, x14, 0xFFFFF9FA
    lui         x15, 0xB26D8
    addi        x15, x15, 0xFFFFFDFA
    lui         x16, 0x9E696
    addi        x16, x16, 0x69F
    lui         x17, 0x87A7E
    addi        x17, x17, 0x567
    lui         x18, 0xE3CDF
    addi        x18, x18, 0xFFFFFB56
    lui         x19, 0xCD5FB
    addi        x19, x19, 0x291
    lui         x20, 0x61244
    addi        x20, x20, 0xC7
    lui         x21, 0xE46F0
    addi        x21, x21, 0x487
    lui         x22, 0x94C81
    addi        x22, x22, 0x595
    lui         x23, 0xF72E5
    addi        x23, x23, 0xFFFFFBBC
    lui         x24, 0xE8EA9
    addi        x24, x24, 0xFFFFF87E
    lui         x25, 0x848A1
    addi        x25, x25, 0xFFFFF91E
    lui         x26, 0x1AE41
    addi        x26, x26, 0xBF
    lui         x27, 0x83E75
    addi        x27, x27, 0xFFFFFBE0
    lui         x28, 0xCC1B0
    addi        x28, x28, 0x1C
    lui         x29, 0x12039
    addi        x29, x29, 0x386
    lui         x30, 0x827A7
    addi        x30, x30, 0xFFFFFE2D
    lui         x31, 0xED00F
    addi        x31, x31, 0xFFFFFFB8
L1: # Test 0-0: j
    j           L2
    j           fail
L2: # Test 0-1: j
    j           L3
    j           fail
L3: # Test 1-0: jal
    jal         x20, L4
    j           fail
L4: # jal target
    lui         x29, 0x400
    addi        x29, x29, 0x114
    bne         x20, x29, fail
L5: # Test 1-1: jal
    jal         x26, L6
    j           fail
L6: # jal target
    lui         x11, 0x400
    addi        x11, x11, 0x128
    bne         x26, x11, fail
L7: # Test 2-0: jalr
    lui         x5, 0x400
    addi        x5, x5, 0xFFFFF9EA
    jalr        x27, 0x75E(x5)
    j           fail
L8: # jalr target
    lui         x18, 0x400
    addi        x18, x18, 0x144
    bne         x27, x18, fail
L9: # Test 2-1: jalr
    lui         x2, 0x400
    addi        x2, x2, 0x601
    jalr        x29, 0xFFFFFB63(x2)
    j           fail
L10: # jalr target
    lui         x2, 0x400
    addi        x2, x2, 0x160
    bne         x29, x2, fail
L11: # Test 3-0: beq
    beq         x7, x0, fail
L12: # Test 3-1: beq
    beq         x9, x29, fail
L13: # Test 3-2: beq
    beq         x12, x15, fail
L14: # Test 4-0: bne
    bne         x19, x11, L15
    j           fail
L15: # Test 4-1: bne
    bne         x17, x6, L16
    j           fail
L16: # Test 4-2: bne
    bne         x8, x23, L17
    j           fail
L17: # Test 5-0: blt
    blt         x6, x30, fail
L18: # Test 5-1: blt
    blt         x11, x18, L19
    j           fail
L19: # Test 5-2: blt
    blt         x11, x22, fail
L20: # Test 6-0: bge
    bge         x16, x21, fail
L21: # Test 6-1: bge
    bge         x28, x17, L22
    j           fail
L22: # Test 6-2: bge
    bge         x24, x26, fail
L23: # Test 7-0: bltu
    bltu        x10, x12, L24
    j           fail
L24: # Test 7-1: bltu
    bltu        x14, x14, fail
L25: # Test 7-2: bltu
    bltu        x28, x28, fail
L26: # Test 8-0: bgeu
    bgeu        x3, x31, fail
L27: # Test 8-1: bgeu
    bgeu        x27, x7, fail
L28: # Test 8-2: bgeu
    bgeu        x25, x22, fail
L29: # Test 9-0: lw
    lui         x4, 0x10027
    addi        x4, x4, 0x331
    lw          x19, 0xFFFFFB07(x4)
    lui         x13, 0x0
    addi        x13, x13, 0x0
    bne         x19, x13, fail
L30: # Test 9-1: lw
    lui         x9, 0x10039
    addi        x9, x9, 0xFFFFFDBD
    lw          x3, 0x577(x9)
    lui         x16, 0x0
    addi        x16, x16, 0x0
    bne         x3, x16, fail
L31: # Test 9-2: lw
    lui         x31, 0x10012
    addi        x31, x31, 0x317
    lw          x15, 0x1DD(x31)
    lui         x21, 0x0
    addi        x21, x21, 0x0
    bne         x15, x21, fail
L32: # Test 10-0: lh
    lui         x2, 0x1002A
    addi        x2, x2, 0xFFFFFFB7
    lh          x13, 0x719(x2)
    lui         x2, 0x0
    addi        x2, x2, 0x0
    bne         x13, x2, fail
L33: # Test 10-1: lh
    lui         x31, 0x10030
    addi        x31, x31, 0xFFFFFA11
    lh          x20, 0xFFFFFBA3(x31)
    lui         x23, 0x0
    addi        x23, x23, 0x0
    bne         x20, x23, fail
L34: # Test 10-2: lh
    lui         x31, 0x10023
    addi        x31, x31, 0x3F9
    lh          x23, 0xFFFFFFC5(x31)
    lui         x4, 0x0
    addi        x4, x4, 0x0
    bne         x23, x4, fail
L35: # Test 11-0: lb
    lui         x12, 0x10018
    addi        x12, x12, 0x5E2
    lb          x2, 0xFFFFFA36(x12)
    lui         x7, 0x0
    addi        x7, x7, 0x0
    bne         x2, x7, fail
L36: # Test 11-1: lb
    lui         x29, 0x10012
    addi        x29, x29, 0x285
    lb          x22, 0x570(x29)
    lui         x6, 0x0
    addi        x6, x6, 0x0
    bne         x22, x6, fail
L37: # Test 11-2: lb
    lui         x12, 0x10028
    addi        x12, x12, 0xC5
    lb          x12, 0x474(x12)
    lui         x13, 0x0
    addi        x13, x13, 0x0
    bne         x12, x13, fail
L38: # Test 12-0: lhu
    lui         x27, 0x1001C
    addi        x27, x27, 0xFFFFFD06
    lhu         x30, 0x8A(x27)
    lui         x10, 0x0
    addi        x10, x10, 0x0
    bne         x30, x10, fail
L39: # Test 12-1: lhu
    lui         x9, 0x1003E
    addi        x9, x9, 0x27A
    lhu         x2, 0x50(x9)
    lui         x30, 0x0
    addi        x30, x30, 0x0
    bne         x2, x30, fail
L40: # Test 12-2: lhu
    lui         x19, 0x1001A
    addi        x19, x19, 0xFFFFF9F7
    lhu         x17, 0xFFFFF8E3(x19)
    lui         x15, 0x0
    addi        x15, x15, 0x0
    bne         x17, x15, fail
L41: # Test 13-0: lbu
    lui         x18, 0x10032
    addi        x18, x18, 0xFFFFFAD4
    lbu         x2, 0xFFFFFB19(x18)
    lui         x31, 0x0
    addi        x31, x31, 0x0
    bne         x2, x31, fail
L42: # Test 13-1: lbu
    lui         x4, 0x1003D
    addi        x4, x4, 0xFFFFFB3B
    lbu         x21, 0xFFFFFF43(x4)
    lui         x25, 0x0
    addi        x25, x25, 0x0
    bne         x21, x25, fail
L43: # Test 13-2: lbu
    lui         x6, 0x10018
    addi        x6, x6, 0x5AE
    lbu         x23, 0x262(x6)
    lui         x13, 0x0
    addi        x13, x13, 0x0
    bne         x23, x13, fail
L44: # Test 14-0: sw
    lui         x19, 0x10037
    addi        x19, x19, 0x30D
    sw          x10, 0x4AB(x19)
    lui         x4, 0x10038
    addi        x4, x4, 0xFFFFFC46
    lbu         x5, 0xFFFFFB72(x4)
    lui         x13, 0x0
    addi        x13, x13, 0x0
    bne         x5, x13, fail
    lui         x11, 0x10037
    addi        x11, x11, 0x783
    lbu         x31, 0x35(x11)
    lui         x5, 0x0
    addi        x5, x5, 0x0
    bne         x31, x5, fail
    lui         x8, 0x10038
    addi        x8, x8, 0xFFFFFD86
    lbu         x31, 0xFFFFFA32(x8)
    lui         x4, 0x0
    addi        x4, x4, 0x0
    bne         x31, x4, fail
    lui         x16, 0x10037
    addi        x16, x16, 0x31C
    lbu         x27, 0x49C(x16)
    lui         x2, 0x0
    addi        x2, x2, 0x0
    bne         x27, x2, fail
L45: # Test 14-1: sw
    lui         x21, 0x10017
    addi        x21, x21, 0xFFFFFC20
    sw          x7, 0xFFFFF880(x21)
    lui         x31, 0x10016
    addi        x31, x31, 0x498
    lbu         x10, 0x8(x31)
    lui         x5, 0x0
    addi        x5, x5, 0x0
    bne         x10, x5, fail
    lui         x28, 0x10017
    addi        x28, x28, 0xFFFFF8AB
    lbu         x2, 0xFFFFFBF5(x28)
    lui         x16, 0x0
    addi        x16, x16, 0x0
    bne         x2, x16, fail
    lui         x12, 0x10016
    addi        x12, x12, 0xFFFFFF68
    lbu         x17, 0x538(x12)
    lui         x25, 0x0
    addi        x25, x25, 0x0
    bne         x17, x25, fail
    lui         x22, 0x10016
    addi        x22, x22, 0xFFFFFF7A
    lbu         x21, 0x526(x22)
    lui         x15, 0x0
    addi        x15, x15, 0x0
    bne         x21, x15, fail
L46: # Test 14-2: sw
    lui         x18, 0x10039
    addi        x18, x18, 0x6C
    sw          x29, 0x7D8(x18)
    lui         x25, 0x1003A
    addi        x25, x25, 0xFFFFFD8F
    lbu         x24, 0xFFFFFAB5(x25)
    lui         x15, 0x0
    addi        x15, x15, 0x85
    bne         x24, x15, fail
    lui         x7, 0x1003A
    addi        x7, x7, 0xFFFFFBEE
    lbu         x23, 0xFFFFFC56(x7)
    lui         x5, 0x0
    addi        x5, x5, 0x85
    bne         x23, x5, fail
    lui         x21, 0x1003A
    addi        x21, x21, 0xFFFFFB4D
    lbu         x30, 0xFFFFFCF7(x21)
    lui         x18, 0x0
    addi        x18, x18, 0x85
    bne         x30, x18, fail
    lui         x25, 0x10039
    addi        x25, x25, 0x47E
    lbu         x14, 0x3C6(x25)
    lui         x6, 0x0
    addi        x6, x6, 0x85
    bne         x14, x6, fail
L47: # Test 15-0: sb
    lui         x5, 0x10028
    addi        x5, x5, 0x98
    sb          x21, 0xFFFFFE28(x5)
    lui         x2, 0x10028
    addi        x2, x2, 0xFFFFFB8A
    lbu         x11, 0x336(x2)
    lui         x3, 0x0
    addi        x3, x3, 0x4D
    bne         x11, x3, fail
    lui         x29, 0x10028
    addi        x29, x29, 0x242
    lbu         x30, 0xFFFFFC7E(x29)
    lui         x3, 0x0
    addi        x3, x3, 0x4D
    bne         x30, x3, fail
    lui         x3, 0x10028
    addi        x3, x3, 0x1C
    lbu         x10, 0xFFFFFEA4(x3)
    lui         x21, 0x0
    addi        x21, x21, 0x4D
    bne         x10, x21, fail
    lui         x15, 0x10027
    addi        x15, x15, 0x7A9
    lbu         x26, 0x717(x15)
    lui         x20, 0x0
    addi        x20, x20, 0x4D
    bne         x26, x20, fail
L48: # Test 15-1: sb
    lui         x5, 0x10036
    addi        x5, x5, 0xB6
    sb          x20, 0x13F(x5)
    lui         x11, 0x10036
    addi        x11, x11, 0x321
    lbu         x6, 0xFFFFFED3(x11)
    lui         x20, 0x0
    addi        x20, x20, 0x0
    bne         x6, x20, fail
    lui         x30, 0x10036
    addi        x30, x30, 0xFFFFFBF0
    lbu         x2, 0x604(x30)
    lui         x3, 0x0
    addi        x3, x3, 0x0
    bne         x2, x3, fail
    lui         x24, 0x10036
    addi        x24, x24, 0xFFFFFABA
    lbu         x30, 0x73A(x24)
    lui         x7, 0x0
    addi        x7, x7, 0x0
    bne         x30, x7, fail
    lui         x30, 0x10036
    addi        x30, x30, 0x5E7
    lbu         x13, 0xFFFFFC0D(x30)
    lui         x20, 0x0
    addi        x20, x20, 0x0
    bne         x13, x20, fail
L49: # Test 15-2: sb
    lui         x18, 0x1002A
    addi        x18, x18, 0xFFFFFAFA
    sb          x9, 0x767(x18)
    lui         x24, 0x1002B
    addi        x24, x24, 0xFFFFF8C4
    lbu         x21, 0xFFFFF99C(x24)
    lui         x16, 0x0
    addi        x16, x16, 0x0
    bne         x21, x16, fail
    lui         x12, 0x1002B
    addi        x12, x12, 0xFFFFF80B
    lbu         x5, 0xFFFFFA55(x12)
    lui         x10, 0x0
    addi        x10, x10, 0x0
    bne         x5, x10, fail
    lui         x23, 0x1002A
    addi        x23, x23, 0x329
    lbu         x26, 0xFFFFFF37(x23)
    lui         x11, 0x0
    addi        x11, x11, 0x0
    bne         x26, x11, fail
    lui         x11, 0x1002A
    addi        x11, x11, 0x1AD
    lbu         x7, 0xB3(x11)
    lui         x13, 0x0
    addi        x13, x13, 0x0
    bne         x7, x13, fail
L50: # Test 16-0: sh
    lui         x3, 0x10029
    addi        x3, x3, 0x317
    sh          x23, 0x72F(x3)
    lui         x5, 0x1002A
    addi        x5, x5, 0xFFFFFCE6
    lbu         x8, 0xFFFFFD5E(x5)
    lui         x14, 0x0
    addi        x14, x14, 0x0
    bne         x8, x14, fail
    lui         x29, 0x1002A
    addi        x29, x29, 0x163
    lbu         x15, 0xFFFFF8E1(x29)
    lui         x6, 0x0
    addi        x6, x6, 0x0
    bne         x15, x6, fail
    lui         x6, 0x1002A
    addi        x6, x6, 0xFFFFFEC8
    lbu         x31, 0xFFFFFB7C(x6)
    lui         x19, 0x0
    addi        x19, x19, 0x0
    bne         x31, x19, fail
    lui         x2, 0x1002A
    addi        x2, x2, 0xFFFFFBDB
    lbu         x0, 0xFFFFFE69(x2)
    lui         x11, 0x0
    addi        x11, x11, 0x0
    bne         x0, x11, fail
L51: # Test 16-1: sh
    lui         x7, 0x1001F
    addi        x7, x7, 0x6EE
    sh          x31, 0x2F6(x7)
    lui         x10, 0x10020
    addi        x10, x10, 0xFFFFF860
    lbu         x14, 0x184(x10)
    lui         x16, 0x0
    addi        x16, x16, 0x0
    bne         x14, x16, fail
    lui         x8, 0x1001F
    addi        x8, x8, 0x720
    lbu         x28, 0x2C4(x8)
    lui         x15, 0x0
    addi        x15, x15, 0x0
    bne         x28, x15, fail
    lui         x20, 0x10020
    addi        x20, x20, 0xFFFFF8F3
    lbu         x7, 0xF1(x20)
    lui         x11, 0x0
    addi        x11, x11, 0x0
    bne         x7, x11, fail
    lui         x2, 0x1001F
    addi        x2, x2, 0x45D
    lbu         x19, 0x587(x2)
    lui         x2, 0x0
    addi        x2, x2, 0x0
    bne         x19, x2, fail
L52: # Test 16-2: sh
    lui         x4, 0x10019
    addi        x4, x4, 0x329
    sh          x19, 0xFFFFFD69(x4)
    lui         x1, 0x10019
    addi        x1, x1, 0x3BF
    lbu         x4, 0xFFFFFCD1(x1)
    lui         x5, 0x0
    addi        x5, x5, 0x0
    bne         x4, x5, fail
    lui         x12, 0x10019
    addi        x12, x12, 0x699
    lbu         x31, 0xFFFFF9F7(x12)
    lui         x16, 0x0
    addi        x16, x16, 0x0
    bne         x31, x16, fail
    lui         x20, 0x10019
    addi        x20, x20, 0x69A
    lbu         x24, 0xFFFFF9F6(x20)
    lui         x23, 0x0
    addi        x23, x23, 0x0
    bne         x24, x23, fail
    lui         x30, 0x10019
    addi        x30, x30, 0x59C
    lbu         x5, 0xFFFFFAF4(x30)
    lui         x4, 0x0
    addi        x4, x4, 0x0
    bne         x5, x4, fail
win: # Win label
    lui         x4, 0x0
    addi        x4, x4, 0x0
    j           end
fail: # Fail label
    lui         x4, 0x0
    addi        x4, x4, 0xFFFFFFFF
    j           end
end:
    nop
    ebreak
