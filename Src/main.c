#include <stdio.h>
#include "stm32f4xx.h"                  // Device header

int main(void)
{
	Init();
	
	while(1)
	{
		Prog();
	}
}