#include <stdio.h>
#include <stdbool.h>

int main() {

	bool conditional;

	//int array[24] = { 4,4,2,2,0,0,1,2,0,0,3,4,
	//	0,0,0,0,0,0,0,0,1,2,3,4};

	//int* a0 = &array[0]; //i, j ,k, l size
	//int* a1 = &array[4]; //0, 0, 1, 2 frame
	//int* a2 = &array[20]; //1, 2, 3, 4 window

	/*int array[36] = { 4,4,4,4,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,
	9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9, };

	int* a0 = &array[0];
	int* a1 = &array[4];
	int* a2 = &array[20];
	*/

	int array[276] = { 16, 16, 4, 4,
	0, 1, 2, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
		1, 2, 3, 4, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15,
			2, 3, 32, 1, 2, 3, 12, 14, 16, 18, 20, 22, 24, 26, 28, 30,
			3, 4, 1, 2, 3, 4, 18, 21, 24, 27, 30, 33, 36, 39, 42, 45,
			0, 4, 2, 3, 4, 5, 24, 28, 32, 36, 40, 44, 48, 52, 56, 60,
			0, 5, 3, 4, 5, 6, 30, 35, 40, 45, 50, 55, 60, 65, 70,  75,
			0, 6, 12, 18, 24, 30, 36, 42, 48, 54, 60, 66, 72, 78, 84, 90,
			0, 4, 14, 21, 28, 35, 42, 49, 56, 63, 70, 77, 84, 91, 98, 105,
			0, 8, 16, 24, 32, 40, 48, 56, 64, 72, 80, 88, 96, 104, 112, 120,
			0, 9, 18, 27, 36, 45, 54, 63, 72, 81, 90, 99, 108, 117, 126, 135,
			0, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100, 110, 120, 130, 140, 150,
			0, 11, 22, 33, 44, 55, 66, 77, 88, 99, 110, 121, 132, 143, 154, 165,
			0, 12, 24, 36, 48, 60, 72, 84, 96, 108, 120, 132, 0, 1, 2, 3,
			0, 13, 26, 39, 52, 65, 78, 91, 104, 114, 130, 143, 1, 2, 3, 4,
			0, 14, 28, 42, 56, 70, 84, 98, 112, 126, 140, 154, 2, 3, 4, 5,
			0, 15, 30, 45, 60, 75, 90, 105, 120, 135, 150, 165, 3, 4, 5, 6,
			0, 1, 2, 3,
			1, 2, 3, 4,
			2, 3, 4, 5,
			3, 4, 5, 6 };

	int* a0 = &array[0];
	int* a1 = &array[4];
	int* a2 = &array[260];


	//int array[292] = { 16, 16, 4, 8,
	//		 7, 5, 8, 8, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0,
	//		 7, 5, 8, 8, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0,
	//		 7, 5, 8, 8, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0,
	//		 7, 5, 8, 8, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0,
	//		 0, 4, 2, 3, 4, 5, 24, 28, 32, 36, 40, 44, 48, 52, 56, 60,
	//		 0, 5, 3, 4, 5, 6, 30, 35, 40, 45, 0, 0, 0, 0, 70,  75,
	//		 0, 6, 12, 18, 24, 30, 36, 42, 48, 54, 0, 0, 0, 0, 84, 90,
	//		 0, 4, 8, 8, 8, 8, 42, 49, 56, 63, 0, 0, 0, 0, 98, 105,
	//		 0, 1, 8, 8, 8, 8, 48, 56, 64, 72, 0, 0, 0, 0, 112, 120,
	//		 0, 1, 8, 8, 8, 8, 54, 63, 72, 81, 90, 99, 108, 117, 126, 135,
	//		 0, 10, 8, 8, 8, 8, 60, 70, 80, 90, 100, 110, 120, 130, 140, 150,
	//		 0, 11, 22, 33, 44, 55, 66, 77, 88, 99, 110, 121, 132, 143, 154, 165,
	//		 9, 9, 9, 9, 48, 60, 72, 84, 96, 108, 120, 132, 0, 1, 2, 3,
	//		 9, 9, 9, 9, 52, 65, 78, 91, 104, 114, 130, 143, 1, 2, 3, 4,
	//		 9, 9, 9, 9, 56, 70, 84, 98, 112, 126, 140, 154, 2, 3, 4, 5,
	//		 9, 9, 9, 9, 60, 75, 90, 105, 120, 135, 150, 165, 3, 4, 5, 6,
	//		 0, 0, 0, 0, 0, 0, 0, 0,
	//		 0, 0, 0, 0, 0, 0, 0, 0,
	//		 0, 0, 0, 0, 0, 0, 0, 0,
	//		 0, 0, 0, 0, 0, 0, 0, 0 };

	//int* a0 = &array[0];
	//int* a1 = &array[4];
	//int* a2 = &array[260];


	int* s1 = a1; //current top left corner of frame

	//find number of windows that fit in column
	int* t0 = a0;     //t0 = i
	int* t1 = a0 + 1; //t1 = j
	int* t2 = a0 + 2; //t2 = k
	int* t3 = a0 + 3; //t3 = l

	int t4 = *t1 - *t3 + 1; //t4 = j - l + 1

	int t5;

	int s2 = 0;
	int s3 = 0;

	


columnRight:
	conditional = (t4 == 0); //beq t4, 0, row
	if (conditional) {
		printf("\n");

		t5 = *t0 - *t2 + s2; //t5 = i - k + 0

		if (t5 == 0) {
			goto exit;
		}

		s1 = s1 - 1;
		s1 = s1 + *t1;


		s2 = s2 - 1;
		goto rowDown;
	}
	
	//do SAD on frame
	printf("%d ", *s1);

	s1 = s1 + 1;
	t4 = t4 - 1;
	goto columnRight;

rowDown:
	conditional = (t5 == 0);
	if (conditional) {
		printf("\n");
		s1 = s1 - *t1;
		s1 = s1 - 1;

		t4 = *t1 - *t3 + s3;

		if (t4 == 0) {
			goto exit;
		}

		s3 = s3 - 1;
		goto columnLeft;
	}

	//do SAD functuion
	printf("%d ", *s1);


	s1 = s1 + *t1; //move down a row
	t5 = t5 - 1; 
	goto rowDown;
		
columnLeft:
	conditional = (t4 == 0);
		if (conditional) {
			printf("\n");
			
			s1 = s1 + 1;
			s1 = s1 - *t1;
			
			t5 = *t0 - *t2 + s2;
			
			if (t5 == 0) {
				goto exit;
			}
			
			s2 = s2 - 1;

			goto rowUp;
		}
		//do SAD function
		printf("%d ", *s1);

		s1 = s1 - 1;
		t4 = t4 - 1;
		goto columnLeft;

rowUp:
		conditional = (t5 == 0);
		if (conditional) {
			printf("\n");
			s1 = s1 + *t1;
			s1 = s1 + 1;
			
			t4 = *t1 - *t3 + s3;
			
			if (t4 == 0) {
				goto exit;
			}
			
			s3 = s3 - 1;

			goto columnRight;
		}
		printf("%d ", *s1);

		s1 = s1 - *t1;
		t5 = t5 - 1;

		goto rowUp;
	
exit:


		return 0;
}