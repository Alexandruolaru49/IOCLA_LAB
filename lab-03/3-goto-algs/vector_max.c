#include <stdio.h>

void main(void)
{
	int v[] = {4, 1, 2, -17, 15, 22, 6, 2};
	int max;
	int i;

	/* TODO: Implement finding the maximum value in the vector */
	max = v[0];
	printf("%d\n", max);
	i = 1;
skip:
printf("%d\n", i);
	if(v[i] > max) {
		max = v[i];
	}
	i++;
	if(i >= 8) goto exit;
	goto skip;

	
exit:
	printf("Maximul din vector este: %d", max);
	return;
	
}
