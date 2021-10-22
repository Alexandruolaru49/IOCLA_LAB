#include <stdio.h>
#include <stdlib.h>

void print_binary(int number, int nr_bits)
{
	/* TODO */
	char s[100] = "\0";
	int i;
	for(i = nr_bits - 1; i >= 0; i--) {
		if(number % 2 == 0) {
			s[i] = '0';
		}
		else s[i] = '1';
		number = number / 2;
	}
	printf("0b");
	for(i = 0; i < nr_bits; i++) {
		printf("%c", s[i]);
	}
	printf("\n");
}

void check_parity(int *numbers, int n)
{
	int i;
	for(i = 0; i < n; i++) {
		if(((*(numbers + i)) % 2) == 0) {
			print_binary((*(numbers + i)), 10);
		}
		else {
			printf("0x%x\n", *(numbers + i));
		}
	}
}


int main()
{
	/*TODO: Test functions */
	int v[5] = {214, 71, 84, 134, 86};
	check_parity(v, 5);
	return 0;
}

