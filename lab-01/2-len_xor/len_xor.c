#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>

int my_strlen(const char *str)
{
	/* TODO */
	int len = 0;

	while(*str) {
		len++;
		str++;
	}
	return len;	
}

void equality_check(const char *str)
{
	//TODO 
	int i;
	int len = my_strlen(str);
	
	for(i = 0; i < len; i++) {
		if( ((*(str + i)) ^ *(str + ((i + (1 << i))) % len ))== 0)
			printf("Adresa 1 a caracterului %c : %p  si Adresa 2 a caracterului %c : %p", *(str + i), (str + i), *(str + ((i + (1 << i))) % len ), (str + ((i + (1 << i))) % len ));
	}
}


int main(void)
{
	/* TODO: Test functions */
	printf("len = %d\n",my_strlen("eu"));
	equality_check("aab");
	return 0;
}



