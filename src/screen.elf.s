
screen.elf:     file format elf32-bigmips


Disassembly of section .text:

00400000 <start>:
  400000:	3c1d7fff 	lui	sp,0x7fff
  400004:	37bdfffc 	ori	sp,sp,0xfffc
  400008:	0c100035 	jal	4000d4 <main>
  40000c:	08100003 	j	40000c <start+0xc>

00400010 <paintSpider>:
  400010:	27bdffe0 	addiu	sp,sp,-32
  400014:	24020012 	li	v0,18
  400018:	afb00010 	sw	s0,16(sp)
  40001c:	3c101001 	lui	s0,0x1001
  400020:	afb10014 	sw	s1,20(sp)
  400024:	a2020014 	sb	v0,20(s0)
  400028:	26110014 	addiu	s1,s0,20
  40002c:	2402002c 	li	v0,44
  400030:	00002825 	move	a1,zero
  400034:	24040007 	li	a0,7
  400038:	afbf001c 	sw	ra,28(sp)
  40003c:	afb20018 	sw	s2,24(sp)
  400040:	a2220001 	sb	v0,1(s1)
  400044:	0c100076 	jal	4001d8 <set_color>
  400048:	92250001 	lbu	a1,1(s1)
  40004c:	92040014 	lbu	a0,20(s0)
  400050:	3c111001 	lui	s1,0x1001
  400054:	0c100084 	jal	400210 <set_cursor>
  400058:	24040008 	li	a0,8
  40005c:	0c10008d 	jal	400234 <put_char>
  400060:	26320004 	addiu	s2,s1,4
  400064:	24040008 	li	a0,8
  400068:	0c10008d 	jal	400234 <put_char>
  40006c:	92020014 	lbu	v0,20(s0)
  400070:	92450001 	lbu	a1,1(s2)
  400074:	92240004 	lbu	a0,4(s1)
  400078:	24420001 	addiu	v0,v0,1
  40007c:	a2020014 	sb	v0,20(s0)
  400080:	0c100084 	jal	400210 <set_cursor>
  400084:	24040059 	li	a0,89
  400088:	0c10008d 	jal	400234 <put_char>
  40008c:	24040064 	li	a0,100
  400090:	0c10003c 	jal	4000f0 <delay_ms>
  400094:	1000fff3 	b	400064 <paintSpider+0x54>

00400098 <player>:
  400098:	3c021001 	lui	v0,0x1001
  40009c:	2403000e 	li	v1,14
  4000a0:	27bdffe8 	addiu	sp,sp,-24
  4000a4:	a0430004 	sb	v1,4(v0)
  4000a8:	24050026 	li	a1,38
  4000ac:	24420004 	addiu	v0,v0,4
  4000b0:	24030026 	li	v1,38
  4000b4:	2404000e 	li	a0,14
  4000b8:	a0430001 	sb	v1,1(v0)
  4000bc:	afbf0014 	sw	ra,20(sp)
  4000c0:	0c100084 	jal	400210 <set_cursor>
  4000c4:	24040059 	li	a0,89
  4000c8:	0c10008d 	jal	400234 <put_char>
  4000cc:	0c100047 	jal	40011c <keypad_init>
  4000d0:	0c100004 	jal	400010 <paintSpider>

004000d4 <main>:
  4000d4:	27bdffe8 	addiu	sp,sp,-24
  4000d8:	afbf0014 	sw	ra,20(sp)
  4000dc:	0c1000bc 	jal	4002f0 <clear_screen>
  4000e0:	00002825 	move	a1,zero
  4000e4:	24040007 	li	a0,7
  4000e8:	0c100076 	jal	4001d8 <set_color>
  4000ec:	0c100026 	jal	400098 <player>

004000f0 <delay_ms>:
  4000f0:	3c08ffff 	lui	t0,0xffff
  4000f4:	8d090008 	lw	t1,8(t0)
  4000f8:	00000000 	nop
  4000fc:	01244820 	add	t1,t1,a0

00400100 <.dm_loop>:
  400100:	8d0a0008 	lw	t2,8(t0)
  400104:	00000000 	nop
  400108:	0149582b 	sltu	t3,t2,t1
  40010c:	1560fffc 	bnez	t3,400100 <.dm_loop>
  400110:	00000000 	nop
  400114:	03e00008 	jr	ra
  400118:	00000000 	nop

0040011c <keypad_init>:
  40011c:	3c081001 	lui	t0,0x1001
  400120:	ad000000 	sw	zero,0(t0)
  400124:	03e00008 	jr	ra
  400128:	00000000 	nop

0040012c <keypad_getkey>:
  40012c:	3c08ffff 	lui	t0,0xffff
  400130:	81080004 	lb	t0,4(t0)
  400134:	24090008 	li	t1,8
  400138:	240b0001 	li	t3,1
  40013c:	00005025 	move	t2,zero

00400140 <.gk_loop>:
  400140:	11490018 	beq	t2,t1,4001a4 <.gk_end_loop>
  400144:	00000000 	nop
  400148:	010b6024 	and	t4,t0,t3
  40014c:	000b5840 	sll	t3,t3,0x1
  400150:	11800011 	beqz	t4,400198 <.gk_inc_loop>
  400154:	00000000 	nop
  400158:	3c081001 	lui	t0,0x1001
  40015c:	8d080000 	lw	t0,0(t0)
  400160:	3c09ffff 	lui	t1,0xffff
  400164:	8d290008 	lw	t1,8(t1)
  400168:	00000000 	nop
  40016c:	0128582b 	sltu	t3,t1,t0
  400170:	11600002 	beqz	t3,40017c <.set_key>
  400174:	00000000 	nop
  400178:	00001025 	move	v0,zero

0040017c <.set_key>:
  40017c:	252900c8 	addiu	t1,t1,200
  400180:	3c081001 	lui	t0,0x1001
  400184:	ad090000 	sw	t1,0(t0)
  400188:	01401025 	move	v0,t2
  40018c:	24420001 	addiu	v0,v0,1
  400190:	03e00008 	jr	ra
  400194:	00000000 	nop

00400198 <.gk_inc_loop>:
  400198:	254a0001 	addiu	t2,t2,1
  40019c:	08100050 	j	400140 <.gk_loop>
  4001a0:	00000000 	nop

004001a4 <.gk_end_loop>:
  4001a4:	00001025 	move	v0,zero
  4001a8:	03e00008 	jr	ra
  4001ac:	00000000 	nop

004001b0 <divide>:
  4001b0:	acc00000 	sw	zero,0(a2)
  4001b4:	0085102b 	sltu	v0,a0,a1
  4001b8:	10400002 	beqz	v0,4001c4 <divide+0x14>
  4001bc:	ace40000 	sw	a0,0(a3)
  4001c0:	03e00008 	jr	ra
  4001c4:	8cc20000 	lw	v0,0(a2)
  4001c8:	00852023 	subu	a0,a0,a1
  4001cc:	24420001 	addiu	v0,v0,1
  4001d0:	acc20000 	sw	v0,0(a2)
  4001d4:	1000fff7 	b	4001b4 <divide+0x4>

004001d8 <set_color>:
  4001d8:	00052900 	sll	a1,a1,0x4
  4001dc:	3084000f 	andi	a0,a0,0xf
  4001e0:	00a42825 	or	a1,a1,a0
  4001e4:	3c021001 	lui	v0,0x1001
  4001e8:	a0450018 	sb	a1,24(v0)
  4001ec:	03e00008 	jr	ra

004001f0 <get_color>:
  4001f0:	3c031001 	lui	v1,0x1001
  4001f4:	90620018 	lbu	v0,24(v1)
  4001f8:	3042000f 	andi	v0,v0,0xf
  4001fc:	a0820000 	sb	v0,0(a0)
  400200:	90620018 	lbu	v0,24(v1)
  400204:	00021102 	srl	v0,v0,0x4
  400208:	a0a20000 	sb	v0,0(a1)
  40020c:	03e00008 	jr	ra

00400210 <set_cursor>:
  400210:	2c820028 	sltiu	v0,a0,40
  400214:	10400006 	beqz	v0,400230 <set_cursor+0x20>
  400218:	2ca20050 	sltiu	v0,a1,80
  40021c:	10400004 	beqz	v0,400230 <set_cursor+0x20>
  400220:	3c021001 	lui	v0,0x1001
  400224:	a0440017 	sb	a0,23(v0)
  400228:	3c021001 	lui	v0,0x1001
  40022c:	a0450016 	sb	a1,22(v0)
  400230:	03e00008 	jr	ra

00400234 <put_char>:
  400234:	3c071001 	lui	a3,0x1001
  400238:	2403000a 	li	v1,10
  40023c:	90e20017 	lbu	v0,23(a3)
  400240:	3c061001 	lui	a2,0x1001
  400244:	14830006 	bne	a0,v1,400260 <put_char+0x2c>
  400248:	2c430027 	sltiu	v1,v0,39
  40024c:	10600002 	beqz	v1,400258 <put_char+0x24>
  400250:	24420001 	addiu	v0,v0,1
  400254:	a0e20017 	sb	v0,23(a3)
  400258:	a0c00016 	sb	zero,22(a2)
  40025c:	03e00008 	jr	ra
  400260:	3c031001 	lui	v1,0x1001
  400264:	90630018 	lbu	v1,24(v1)
  400268:	90c50016 	lbu	a1,22(a2)
  40026c:	00031a00 	sll	v1,v1,0x8
  400270:	00642025 	or	a0,v1,a0
  400274:	00021880 	sll	v1,v0,0x2
  400278:	00621821 	addu	v1,v1,v0
  40027c:	00031900 	sll	v1,v1,0x4
  400280:	00651821 	addu	v1,v1,a1
  400284:	00031840 	sll	v1,v1,0x1
  400288:	3408b800 	li	t0,0xb800
  40028c:	01031821 	addu	v1,t0,v1
  400290:	a4640000 	sh	a0,0(v1)
  400294:	2ca3004f 	sltiu	v1,a1,79
  400298:	10600003 	beqz	v1,4002a8 <put_char+0x74>
  40029c:	24a50001 	addiu	a1,a1,1
  4002a0:	a0c50016 	sb	a1,22(a2)
  4002a4:	03e00008 	jr	ra
  4002a8:	24420001 	addiu	v0,v0,1
  4002ac:	a0c00016 	sb	zero,22(a2)
  4002b0:	a0e20017 	sb	v0,23(a3)
  4002b4:	03e00008 	jr	ra

004002b8 <puts>:
  4002b8:	00804825 	move	t1,a0
  4002bc:	80840000 	lb	a0,0(a0)
  4002c0:	14800001 	bnez	a0,4002c8 <puts+0x10>
  4002c4:	03e00008 	jr	ra
  4002c8:	27bdffe8 	addiu	sp,sp,-24
  4002cc:	afbf0014 	sw	ra,20(sp)
  4002d0:	308400ff 	andi	a0,a0,0xff
  4002d4:	25290001 	addiu	t1,t1,1
  4002d8:	0c10008d 	jal	400234 <put_char>
  4002dc:	81240000 	lb	a0,0(t1)
  4002e0:	1480fffb 	bnez	a0,4002d0 <puts+0x18>
  4002e4:	8fbf0014 	lw	ra,20(sp)
  4002e8:	27bd0018 	addiu	sp,sp,24
  4002ec:	03e00008 	jr	ra

004002f0 <clear_screen>:
  4002f0:	3c021001 	lui	v0,0x1001
  4002f4:	90420018 	lbu	v0,24(v0)
  4002f8:	3403b800 	li	v1,0xb800
  4002fc:	00021200 	sll	v0,v0,0x8
  400300:	34420020 	ori	v0,v0,0x20
  400304:	3404cac0 	li	a0,0xcac0
  400308:	a4620000 	sh	v0,0(v1)
  40030c:	24630002 	addiu	v1,v1,2
  400310:	1464fffd 	bne	v1,a0,400308 <clear_screen+0x18>
  400314:	3c021001 	lui	v0,0x1001
  400318:	a0400017 	sb	zero,23(v0)
  40031c:	3c021001 	lui	v0,0x1001
  400320:	a0400016 	sb	zero,22(v0)
  400324:	03e00008 	jr	ra

Disassembly of section .data:

10010000 <next_key_time>:
10010000:	00000000 	nop

Disassembly of section .gnu.attributes:

00000000 <.gnu.attributes>:
   0:	41000000 	bc0f	4 <_gp+0x4>
   4:	0f676e75 	jal	d9db9d4 <clear_screen+0xd5db6e4>
   8:	00010000 	sll	zero,at,0x0
   c:	00070401 	0x70401

Disassembly of section .bss:

10010004 <locat>:
10010004:	00000000 	nop

10010008 <spider>:
	...

10010010 <bgColor>:
	...

10010011 <fgColor>:
10010011:	0000      	addiu	s0,sp,0
	...

10010014 <loc>:
	...

10010016 <cursor_col>:
	...

10010017 <cursor_row>:
	...

10010018 <chr_attr>:
	...
