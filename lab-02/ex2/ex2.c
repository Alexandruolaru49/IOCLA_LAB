#include <stdio.h>
#include <string.h>
#include <stdlib.h>

char* delete_first(char *s, char *pattern) {
	char *p = strdup(s);
	char *q = strstr(p, pattern);
	strcpy(q, q + strlen(pattern));
	return p;
}

int main(){
	char *s = "Ana are mere";
	printf("%s\n\n", s);
	char *pattern = "re";
	char *f = delete_first(s, pattern);
	// Decomentati linia dupa ce ati implementat functia delete_first.
	printf("%s\n", f);
	free(f);
	
	return 0;
}
