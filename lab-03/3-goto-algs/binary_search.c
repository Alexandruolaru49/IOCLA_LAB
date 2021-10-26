#include <stdio.h>

void main(void)
{
	int v[] =  {1, 2, 15, 51, 53, 66, 202, 7000};
	int dest = v[2]; /* 15 */
	int start = 0;
	int end = sizeof(v) / sizeof(int) - 1;
	int mij;
	/* TODO: Implement binary search */

	if(start <= end) {
		goto pas1;
	}

	if(start > end) {
		return;
	}

	pas1:
		mij = (start + end) / 2;
		if(v[mij] == dest) {
			goto gasit;
		}

		if(v[mij] < dest) {
			start = mij;
			goto pas1;
		}

		if(v[mij] > dest) {
			end = mij;
			goto pas1;
		}
	

gasit: 
	printf("Am gasit numarul in vector, care se afla pe pozitia %d", mij);
	return; 
}
