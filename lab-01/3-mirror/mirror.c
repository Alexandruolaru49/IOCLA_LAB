#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#define MAX_STR_LEN 100

void mirror(char *s)
{
	/* TODO */
	int inceput = 0, sfarsit = strlen(s) - 1;
	char aux;
	while(inceput < sfarsit) {
		aux = *(s + inceput);
		*(s + inceput) = *(s + sfarsit);
		*(s + sfarsit) = aux;
		inceput ++;
		sfarsit --;
	}
	printf("%s\n", s);
}

int main()
{
	/* TODO: Test function */
	char *p = malloc(MAX_STR_LEN);
	scanf("%s", p);
	mirror(p);
	free(p);
	return 0;
}

