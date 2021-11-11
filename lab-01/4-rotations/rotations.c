#include <stdio.h>

void rotate_left(int *number, int bits)
{
	/* TODO */
	unsigned int aux = -1;
	aux = aux << (sizeof(*number) * 8 - bits);
	aux = aux & (*number);
	aux = aux >> (sizeof(*number) * 8 - bits);
	*number = (*number) << bits;
	*number = (*number) | aux;
}


void rotate_right(int *number, int bits)
{
	/* TODO */
	unsigned int aux = -1;
	aux = aux >> (sizeof(*number) * 8 - bits);
	aux = aux & (*number);
	aux = aux << (sizeof(*number) * 8 - bits);
	*number = (*number) >> bits;
	*number = (*number) | aux;
	
}

int main()
{
	/* TODO: Test functions */
	int n = 0x80000000;
	printf("%d\n", n);
	rotate_left(&n,1);
	printf("%d\n\n", n);
	n = 0x00000001;
	printf("%d\n", n);
	rotate_right(&n, 16);
	printf("%d\n", n);

	return 0;
}

