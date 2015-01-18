
void kmain()
{
	char *str = "hello world!";
	char *vidptr = (char *)0xb8000; //显存开始地址
	unsigned int i = 0;
	unsigned int j = 0;
	//清空屏幕,共25行,每行80个字符,每个字符2个字节
	//每个字符用2个字节表示,第一个字节ASCII,第二个字节是属性字节,包括颜色等属性
	while (j < 80 * 25 * 2)
	{

		vidptr[j] = ' ';
		vidptr[j + 1] = 0x07;
		j += 2;
	}
	j = 0;
	while (str[j] != 0)
	{
		vidptr[i] = str[j];
		vidptr[i + 1] = 0x07;
		j++;
		i += 2;
	}
	return;
} 

