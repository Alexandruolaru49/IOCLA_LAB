#include <stdio.h>

/**
 * Afisati adresele elementelor din vectorul "v" impreuna cu valorile
 * de la acestea.
 * Parcurgeti adresele, pe rand, din octet in octet,
 * din 2 in 2 octeti si apoi din 4 in 4.
 */

int main() {
    int v[] = {0xCAFEBABE, 0xDEADBEEF, 0x0B00B135, 0xBAADF00D, 0xDEADC0DE};
    /*
    	DIN 4 IN 4 OCTETI
    */
    int *p = v;
    int i;

    for(i = 0; i < 5; i++) {
    	printf("%p -> %x\n", (p), *(p));
    	p++;
    }
    printf("\n\n");
    /*
    	DIN 2 IN 2 OCTETI
    }
    */
    short *q = (short*)v;
    
    for(i = 0; i < 10; i++){
    	printf("%p -> %hx\n", (q), *(q));
    	q++;
    }
    printf("\n\n");
    /*
    	DIN 1 IN 1 OCTET
    */
    char *c = (char*)v;
    
    for(i = 0; i < 20; i++) {
    	printf("%p -> %hhx\n", (c), *(c));
    	c++;
    }
    

    return 0;
}
