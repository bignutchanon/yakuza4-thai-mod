; Disassembly of the byte arrays in dinput8.cpp (generated with capstone, x86-64).
; These are the only machine-code bytes the DLL writes into the game. Absolute addresses below are
; for image base 0x140000000; at runtime dinput8.cpp rewrites them for the real (ASLR) base.

; ---- CAVE: Thai mark stacking (carry cave) ----
; placed at Yakuza4.exe base + 0x120425b (listing uses base 0x140000000)
; entered by a 5-byte jmp written at base + 0x6750f3 (PATCH_RVA); the 10 original bytes it replaces are
; re-executed at the end of the cave, then it jumps back to base + 0x6750fd (RET_RVA).
; imm64 at +2  = address of the 256-byte TBL (1 = Thai combining mark, 0 = normal glyph)
; imm64 at +29 = address of a 0x14-byte scratch area (pending advance of the previous glyph)
; logic: looks up the previous and current text byte in TBL and adjusts the pen-advance registers
; (xmm6/xmm7, via the scratch area) so a Thai combining mark is drawn over the preceding consonant
; instead of after it. Register/memory arithmetic only: no calls, no system calls, no I/O.
000000014120425b  48 b8 fb 42 20 41 01 00 00 00        movabs rax, 0x1412042fb
0000000141204265  41 0f b6 4f ff                       movzx ecx, byte ptr [r15 - 1]
000000014120426a  0f b6 14 08                          movzx edx, byte ptr [rax + rcx]
000000014120426e  41 0f b6 0f                          movzx ecx, byte ptr [r15]
0000000141204272  0f b6 0c 08                          movzx ecx, byte ptr [rax + rcx]
0000000141204276  48 b8 e3 42 20 41 01 00 00 00        movabs rax, 0x1412042e3
0000000141204280  85 c9                                test ecx, ecx
0000000141204282  74 28                                je 0x1412042ac
0000000141204284  85 d2                                test edx, edx
0000000141204286  75 1a                                jne 0x1412042a2
0000000141204288  c5 f8 10 00                          vmovups xmm0, xmmword ptr [rax]
000000014120428c  c5 f8 58 c6                          vaddps xmm0, xmm0, xmm6
0000000141204290  c5 f8 11 00                          vmovups xmmword ptr [rax], xmm0
0000000141204294  c5 fa 10 40 10                       vmovss xmm0, dword ptr [rax + 0x10]
0000000141204299  c5 fa 58 c7                          vaddss xmm0, xmm0, xmm7
000000014120429d  c5 fa 11 40 10                       vmovss dword ptr [rax + 0x10], xmm0
00000001412042a2  c5 c8 57 f6                          vxorps xmm6, xmm6, xmm6
00000001412042a6  c5 c0 57 ff                          vxorps xmm7, xmm7, xmm7
00000001412042aa  eb 25                                jmp 0x1412042d1
00000001412042ac  85 d2                                test edx, edx
00000001412042ae  75 0b                                jne 0x1412042bb
00000001412042b0  c5 c8 58 30                          vaddps xmm6, xmm6, xmmword ptr [rax]
00000001412042b4  c5 c2 58 78 10                       vaddss xmm7, xmm7, dword ptr [rax + 0x10]
00000001412042b9  eb 09                                jmp 0x1412042c4
00000001412042bb  c5 f8 10 30                          vmovups xmm6, xmmword ptr [rax]
00000001412042bf  c5 fa 10 78 10                       vmovss xmm7, dword ptr [rax + 0x10]
00000001412042c4  c5 f8 57 c0                          vxorps xmm0, xmm0, xmm0
00000001412042c8  c5 f8 11 00                          vmovups xmmword ptr [rax], xmm0
00000001412042cc  c5 fa 11 40 10                       vmovss dword ptr [rax + 0x10], xmm0
00000001412042d1  c4 e3 49 21 c6 4e                    vinsertps xmm0, xmm6, xmm6, 0x4e
00000001412042d7  c5 22 58 df                          vaddss xmm11, xmm11, xmm7
00000001412042db  e9 1d 0e 47 ff                       jmp 0x1406750fd

; ---- MEAS_CODE: line-width measure fix (centering) ----
; placed at Yakuza4.exe base + 0x1204400 (listing uses base 0x140000000)
; entered by a jmp written at base + 0x66ff33 (MEAS_SITE) over 'inc esi; mov r13d, edi';
; skips the 'inc esi' (width +1) when TBL[byte] marks a Thai combining mark, so centred Thai text
; is measured without its zero-width marks. Returns to base + 0x66ff38 (MEAS_RET).
0000000141204400  50                                   push rax
0000000141204401  52                                   push rdx
0000000141204402  0f b6 03                             movzx eax, byte ptr [rbx]
0000000141204405  48 ba fb 42 20 41 01 00 00 00        movabs rdx, 0x1412042fb
000000014120440f  80 3c 02 00                          cmp byte ptr [rdx + rax], 0
0000000141204413  75 02                                jne 0x141204417
0000000141204415  ff c6                                inc esi
0000000141204417  5a                                   pop rdx
0000000141204418  58                                   pop rax
0000000141204419  41 89 fd                             mov r13d, edi
000000014120441c  e9 17 bb 46 ff                       jmp 0x14066ff38

