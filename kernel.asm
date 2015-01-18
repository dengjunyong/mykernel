;;kernel.asm,
bits 32;

section .text;代码段
	; 多重引导规范
	align 4
	dd 0x1BADB002; 魔数
	dd 0x00; 标志
	dd - (0x1BADB002 + 0x00); 校验和

global start;全局变量
extern kmain

start:
	cli;禁止终端
	call kmain;
	hlt;终止CPU运行
