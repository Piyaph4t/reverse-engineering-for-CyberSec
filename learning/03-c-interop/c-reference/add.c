#include <stdio.h>
#include <string.h>
extern long toInteger10(long len, const char * str);

int main(){

	char num1[6]={0};
	char num2[6]={0};
	printf("number1: ");
	scanf("%5s",num1);
	printf("number2: ");
	scanf("%5s",num2);
	
	int len = 5;
	long n1 = toInteger10(strlen(num1), num1);
	long n2 = toInteger10(strlen(num2), num2);
	
	long result = n1 + n2;
	printf("your result is here : %lld", result);
	return 0;
}
