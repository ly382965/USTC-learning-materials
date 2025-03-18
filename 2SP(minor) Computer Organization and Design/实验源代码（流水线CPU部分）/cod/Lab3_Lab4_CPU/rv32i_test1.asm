L0: # Randomly initialize GPR
    lui         x0, 0x70089
    addi        x0, x0, 0xFFFFF800
    lui         x1, 0x5B2BD
    addi        x1, x1, 0xFFFFFEDA
    lui         x2, 0x32C89
    addi        x2, x2, 0xFFFFFC42
    lui         x3, 0x8E257
    addi        x3, x3, 0x3D2
    lui         x4, 0x97C3C
    addi        x4, x4, 0xFFFFFF83
    lui         x5, 0x2A114
    addi        x5, x5, 0xFFFFFE05
    lui         x6, 0xAE515
    addi        x6, x6, 0xFFFFFC21
    lui         x7, 0xBC80F
    addi        x7, x7, 0x494
    lui         x8, 0xEFC5
    addi        x8, x8, 0xFFFFFFE6
    lui         x9, 0xC1D0D
    addi        x9, x9, 0xFFFFF9F0
    lui         x10, 0x985AE
    addi        x10, x10, 0x3BC
    lui         x11, 0x751E8
    addi        x11, x11, 0x52F
    lui         x12, 0x4C10F
    addi        x12, x12, 0x25E
    lui         x13, 0x85969
    addi        x13, x13, 0x62D
    lui         x14, 0xE29B1
    addi        x14, x14, 0x519
    lui         x15, 0xE577E
    addi        x15, x15, 0x5BA
    lui         x16, 0x443E1
    addi        x16, x16, 0x746
    lui         x17, 0x2D2AD
    addi        x17, x17, 0xFFFFF95A
    lui         x18, 0xB0F45
    addi        x18, x18, 0x6D4
    lui         x19, 0x2634C
    addi        x19, x19, 0x5E7
    lui         x20, 0x1697F
    addi        x20, x20, 0xFFFFF9A6
    lui         x21, 0x3DC8
    addi        x21, x21, 0xFFFFF91B
    lui         x22, 0xC58FF
    addi        x22, x22, 0x797
    lui         x23, 0x5C44B
    addi        x23, x23, 0x1A7
    lui         x24, 0x738B7
    addi        x24, x24, 0x3CE
    lui         x25, 0x60CFA
    addi        x25, x25, 0x49E
    lui         x26, 0x8F197
    addi        x26, x26, 0x62
    lui         x27, 0x658B9
    addi        x27, x27, 0xFFFFFB15
    lui         x28, 0x4B2AD
    addi        x28, x28, 0xFFFFFBF0
    lui         x29, 0xAA312
    addi        x29, x29, 0xFFFFFA1A
    lui         x30, 0x36906
    addi        x30, x30, 0x274
    lui         x31, 0xD2C2A
    addi        x31, x31, 0xFFFFFBB5
L1: # Test 0-0: add
    add         x25, x14, x7
    lui         x24, 0x9F1C1
    addi        x24, x24, 0xFFFFF9AD
    bne         x25, x24, fail
L2: # Test 0-1: add
    add         x24, x27, x20
    lui         x28, 0x7C237
    addi        x28, x28, 0x4BB
    bne         x24, x28, fail
L3: # Test 0-2: add
    add         x29, x2, x29
    lui         x14, 0xDCF9A
    addi        x14, x14, 0x65C
    bne         x29, x14, fail
L4: # Test 1-0: sub
    sub         x27, x6, x18
    lui         x22, 0xFD5CF
    addi        x22, x22, 0x54D
    bne         x27, x22, fail
L5: # Test 1-1: sub
    sub         x13, x7, x11
    lui         x26, 0x47627
    addi        x26, x26, 0xFFFFFF65
    bne         x13, x26, fail
L6: # Test 1-2: sub
    sub         x23, x6, x0
    lui         x15, 0xAE515
    addi        x15, x15, 0xFFFFFC21
    bne         x23, x15, fail
L7: # Test 2-0: sll
    sll         x26, x20, x10
    lui         x25, 0x60000
    addi        x25, x25, 0x0
    bne         x26, x25, fail
L8: # Test 2-1: sll
    sll         x0, x15, x29
    lui         x19, 0x0
    addi        x19, x19, 0x0
    bne         x0, x19, fail
L9: # Test 2-2: sll
    sll         x24, x14, x6
    lui         x4, 0xB9F35
    addi        x4, x4, 0xFFFFFCB8
    bne         x24, x4, fail
L10: # Test 3-0: srl
    srl         x18, x3, x4
    lui         x22, 0x0
    addi        x22, x22, 0x8E
    bne         x18, x22, fail
L11: # Test 3-1: srl
    srl         x2, x10, x12
    lui         x28, 0x0
    addi        x28, x28, 0x2
    bne         x2, x28, fail
L12: # Test 3-2: srl
    srl         x27, x23, x9
    lui         x22, 0xB
    addi        x22, x22, 0xFFFFFE51
    bne         x27, x22, fail
L13: # Test 4-0: sra
    sra         x11, x25, x3
    lui         x21, 0x2
    addi        x21, x21, 0xFFFFF800
    bne         x11, x21, fail
L14: # Test 4-1: sra
    sra         x5, x4, x4
    lui         x7, 0x0
    addi        x7, x7, 0xFFFFFFB9
    bne         x5, x7, fail
L15: # Test 4-2: sra
    sra         x30, x4, x21
    lui         x11, 0xB9F35
    addi        x11, x11, 0xFFFFFCB8
    bne         x30, x11, fail
L16: # Test 5-0: slt
    slt         x27, x3, x20
    lui         x19, 0x0
    addi        x19, x19, 0x1
    bne         x27, x19, fail
L17: # Test 5-1: slt
    slt         x16, x2, x10
    lui         x3, 0x0
    addi        x3, x3, 0x0
    bne         x16, x3, fail
L18: # Test 5-2: slt
    slt         x12, x16, x20
    lui         x16, 0x0
    addi        x16, x16, 0x1
    bne         x12, x16, fail
L19: # Test 5-3: slt
    slt         x28, x12, x22
    lui         x8, 0x0
    addi        x8, x8, 0x1
    bne         x28, x8, fail
L20: # Test 6-0: sltu
    sltu        x6, x25, x14
    lui         x11, 0x0
    addi        x11, x11, 0x1
    bne         x6, x11, fail
L21: # Test 6-1: sltu
    sltu        x29, x3, x8
    lui         x15, 0x0
    addi        x15, x15, 0x1
    bne         x29, x15, fail
L22: # Test 6-2: sltu
    sltu        x27, x16, x25
    lui         x2, 0x0
    addi        x2, x2, 0x1
    bne         x27, x2, fail
L23: # Test 6-3: sltu
    sltu        x11, x10, x7
    lui         x25, 0x0
    addi        x25, x25, 0x1
    bne         x11, x25, fail
L24: # Test 7-0: and
    and         x20, x3, x7
    lui         x14, 0x0
    addi        x14, x14, 0x0
    bne         x20, x14, fail
L25: # Test 7-1: and
    and         x9, x14, x5
    lui         x13, 0x0
    addi        x13, x13, 0x0
    bne         x9, x13, fail
L26: # Test 7-2: and
    and         x11, x11, x9
    lui         x31, 0x0
    addi        x31, x31, 0x0
    bne         x11, x31, fail
L27: # Test 8-0: or
    or          x17, x15, x27
    lui         x30, 0x0
    addi        x30, x30, 0x1
    bne         x17, x30, fail
L28: # Test 8-1: or
    or          x20, x15, x5
    lui         x19, 0x0
    addi        x19, x19, 0xFFFFFFB9
    bne         x20, x19, fail
L29: # Test 8-2: or
    or          x3, x14, x13
    lui         x11, 0x0
    addi        x11, x11, 0x0
    bne         x3, x11, fail
L30: # Test 9-0: xor
    xor         x14, x15, x0
    lui         x18, 0x0
    addi        x18, x18, 0x1
    bne         x14, x18, fail
L31: # Test 9-1: xor
    xor         x6, x15, x29
    lui         x24, 0x0
    addi        x24, x24, 0x0
    bne         x6, x24, fail
L32: # Test 9-2: xor
    xor         x16, x26, x20
    lui         x5, 0xA0000
    addi        x5, x5, 0xFFFFFFB9
    bne         x16, x5, fail
L33: # Test 10-0: addi
    addi        x28, x12, 0x3A1
    lui         x31, 0x0
    addi        x31, x31, 0x3A2
    bne         x28, x31, fail
L34: # Test 10-1: addi
    addi        x15, x15, 0xFFFFFE71
    lui         x30, 0x0
    addi        x30, x30, 0xFFFFFE72
    bne         x15, x30, fail
L35: # Test 10-2: addi
    addi        x31, x2, 0x4A1
    lui         x19, 0x0
    addi        x19, x19, 0x4A2
    bne         x31, x19, fail
L36: # Test 10-3: addi
    addi        x30, x28, 0xFFFFFEB3
    lui         x28, 0x0
    addi        x28, x28, 0x255
    bne         x30, x28, fail
L37: # Test 11-0: slli
    slli        x1, x20, 0xB
    lui         x27, 0xFFFDD
    addi        x27, x27, 0xFFFFF800
    bne         x1, x27, fail
L38: # Test 11-1: slli
    slli        x13, x16, 0x4
    lui         x12, 0x0
    addi        x12, x12, 0xFFFFFB90
    bne         x13, x12, fail
L39: # Test 11-2: slli
    slli        x30, x2, 0x1
    lui         x23, 0x0
    addi        x23, x23, 0x2
    bne         x30, x23, fail
L40: # Test 11-3: slli
    slli        x25, x24, 0x11
    lui         x30, 0x0
    addi        x30, x30, 0x0
    bne         x25, x30, fail
L41: # Test 11-4: slli
    slli        x27, x27, 0x1A
    lui         x21, 0x0
    addi        x21, x21, 0x0
    bne         x27, x21, fail
L42: # Test 12-0: srli
    srli        x10, x23, 0x19
    lui         x18, 0x0
    addi        x18, x18, 0x0
    bne         x10, x18, fail
L43: # Test 12-1: srli
    srli        x23, x1, 0x1F
    lui         x27, 0x0
    addi        x27, x27, 0x1
    bne         x23, x27, fail
L44: # Test 12-2: srli
    srli        x2, x17, 0x0
    lui         x25, 0x0
    addi        x25, x25, 0x1
    bne         x2, x25, fail
L45: # Test 12-3: srli
    srli        x9, x20, 0x13
    lui         x4, 0x2
    addi        x4, x4, 0xFFFFFFFF
    bne         x9, x4, fail
L46: # Test 12-4: srli
    srli        x6, x10, 0x18
    lui         x18, 0x0
    addi        x18, x18, 0x0
    bne         x6, x18, fail
L47: # Test 13-0: srai
    srai        x28, x13, 0x1C
    lui         x8, 0x0
    addi        x8, x8, 0xFFFFFFFF
    bne         x28, x8, fail
L48: # Test 13-1: srai
    srai        x25, x31, 0x1F
    lui         x13, 0x0
    addi        x13, x13, 0x0
    bne         x25, x13, fail
L49: # Test 13-2: srai
    srai        x22, x9, 0x2
    lui         x9, 0x0
    addi        x9, x9, 0x7FF
    bne         x22, x9, fail
L50: # Test 13-3: srai
    srai        x15, x24, 0x1D
    lui         x10, 0x0
    addi        x10, x10, 0x0
    bne         x15, x10, fail
L51: # Test 13-4: srai
    srai        x12, x15, 0x19
    lui         x29, 0x0
    addi        x29, x29, 0x0
    bne         x12, x29, fail
L52: # Test 14-0: slti
    slti        x1, x30, 0xFFFFF801
    lui         x30, 0x0
    addi        x30, x30, 0x0
    bne         x1, x30, fail
L53: # Test 14-1: slti
    slti        x1, x19, 0x52D
    lui         x18, 0x0
    addi        x18, x18, 0x1
    bne         x1, x18, fail
L54: # Test 14-2: slti
    slti        x19, x8, 0x36
    lui         x13, 0x0
    addi        x13, x13, 0x1
    bne         x19, x13, fail
L55: # Test 14-3: slti
    slti        x30, x18, 0x482
    lui         x8, 0x0
    addi        x8, x8, 0x1
    bne         x30, x8, fail
L56: # Test 14-4: slti
    slti        x25, x11, 0xFFFFFC93
    lui         x4, 0x0
    addi        x4, x4, 0x0
    bne         x25, x4, fail
L57: # Test 15-0: sltiu
    sltiu       x28, x5, 0xFFFFFF37
    lui         x11, 0x0
    addi        x11, x11, 0x1
    bne         x28, x11, fail
L58: # Test 15-1: sltiu
    sltiu       x25, x7, 0x313
    lui         x19, 0x0
    addi        x19, x19, 0x0
    bne         x25, x19, fail
L59: # Test 15-2: sltiu
    sltiu       x10, x22, 0x74
    lui         x6, 0x0
    addi        x6, x6, 0x0
    bne         x10, x6, fail
L60: # Test 15-3: sltiu
    sltiu       x22, x20, 0x309
    lui         x9, 0x0
    addi        x9, x9, 0x0
    bne         x22, x9, fail
L61: # Test 15-4: sltiu
    sltiu       x2, x17, 0xFFFFFF70
    lui         x28, 0x0
    addi        x28, x28, 0x1
    bne         x2, x28, fail
L62: # Test 16-0: andi
    andi        x12, x6, 0x2E5
    lui         x4, 0x0
    addi        x4, x4, 0x0
    bne         x12, x4, fail
L63: # Test 16-1: andi
    andi        x7, x6, 0xFFFFFE7C
    lui         x13, 0x0
    addi        x13, x13, 0x0
    bne         x7, x13, fail
L64: # Test 16-2: andi
    andi        x21, x17, 0xFFFFFA65
    lui         x20, 0x0
    addi        x20, x20, 0x1
    bne         x21, x20, fail
L65: # Test 16-3: andi
    andi        x16, x29, 0x697
    lui         x2, 0x0
    addi        x2, x2, 0x0
    bne         x16, x2, fail
L66: # Test 16-4: andi
    andi        x28, x20, 0x300
    lui         x16, 0x0
    addi        x16, x16, 0x0
    bne         x28, x16, fail
L67: # Test 17-0: ori
    ori         x2, x7, 0xFFFFF831
    lui         x27, 0x0
    addi        x27, x27, 0xFFFFF831
    bne         x2, x27, fail
L68: # Test 17-1: ori
    ori         x26, x28, 0x56D
    lui         x11, 0x0
    addi        x11, x11, 0x56D
    bne         x26, x11, fail
L69: # Test 17-2: ori
    ori         x24, x20, 0x73B
    lui         x2, 0x0
    addi        x2, x2, 0x73B
    bne         x24, x2, fail
L70: # Test 17-3: ori
    ori         x28, x0, 0xFFFFFB79
    lui         x21, 0x0
    addi        x21, x21, 0xFFFFFB79
    bne         x28, x21, fail
L71: # Test 17-4: ori
    ori         x11, x10, 0x5B8
    lui         x10, 0x0
    addi        x10, x10, 0x5B8
    bne         x11, x10, fail
L72: # Test 18-0: xori
    xori        x22, x4, 0xFFFFFBB7
    lui         x24, 0x0
    addi        x24, x24, 0xFFFFFBB7
    bne         x22, x24, fail
L73: # Test 18-1: xori
    xori        x22, x21, 0x1A7
    lui         x12, 0x0
    addi        x12, x12, 0xFFFFFADE
    bne         x22, x12, fail
L74: # Test 18-2: xori
    xori        x28, x26, 0xFFFFFE82
    lui         x24, 0x0
    addi        x24, x24, 0xFFFFFBEF
    bne         x28, x24, fail
L75: # Test 18-3: xori
    xori        x21, x26, 0x511
    lui         x22, 0x0
    addi        x22, x22, 0x7C
    bne         x21, x22, fail
L76: # Test 18-4: xori
    xori        x7, x14, 0x402
    lui         x14, 0x0
    addi        x14, x14, 0x403
    bne         x7, x14, fail
L77: # Test 19-0: lui
    lui         x20, 0xEC775
    lui         x14, 0xEC775
    addi        x14, x14, 0x0
    bne         x20, x14, fail
L78: # Test 19-1: lui
    lui         x13, 0x1D5EA
    lui         x14, 0x1D5EA
    addi        x14, x14, 0x0
    bne         x13, x14, fail
L79: # Test 19-2: lui
    lui         x7, 0x85528
    lui         x3, 0x85528
    addi        x3, x3, 0x0
    bne         x7, x3, fail
L80: # Test 19-3: lui
    lui         x4, 0x6F627
    lui         x7, 0x6F627
    addi        x7, x7, 0x0
    bne         x4, x7, fail
L81: # Test 19-4: lui
    lui         x24, 0xEBB3A
    lui         x17, 0xEBB3A
    addi        x17, x17, 0x0
    bne         x24, x17, fail
L82: # Test 20-0: auipc
    auipc       x27, 0xC8173
    lui         x14, 0xC8573
    addi        x14, x14, 0x610
    bne         x27, x14, fail
L83: # Test 20-1: auipc
    auipc       x3, 0x15FB9
    lui         x1, 0x163B9
    addi        x1, x1, 0x620
    bne         x3, x1, fail
L84: # Test 20-2: auipc
    auipc       x14, 0xDCB52
    lui         x2, 0xDCF52
    addi        x2, x2, 0x630
    bne         x14, x2, fail
L85: # Test 20-3: auipc
    auipc       x7, 0x79FEC
    lui         x5, 0x7A3EC
    addi        x5, x5, 0x640
    bne         x7, x5, fail
L86: # Test 20-4: auipc
    auipc       x22, 0x4736D
    lui         x20, 0x4776D
    addi        x20, x20, 0x650
    bne         x22, x20, fail
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
