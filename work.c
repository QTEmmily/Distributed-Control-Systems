#include <stdio.h>
#include <math.h>
#include <stdbool.h>
#include "stm32f4xx.h"                  // Device header


int i;
float* alfa;
float beta;
int x;
char Direction;
bool Trigger = 0;
int Prev = 0;
int Current;


void Init(void)
{
	RCC->CR = RCC->CR | 0x00000001;
	RCC->PLLCFGR = RCC->PLLCFGR | 0x07013002;
	RCC->CFGR = RCC->CFGR | 0xC0600002;
	RCC->CR = RCC->CR | 0x01000001;
//	SystemClock_Config();
	GPIO_Config();
	Timer5_Config();
	Encoder_Config();
	DAC_Config();
	NVIC_Enable();
}

void Prog(void)
{
	if (Direction > 0)
	{
		GPIOG->ODR = 0x2000;
	}
	else 
	{
		GPIOG->ODR = 0x4000;
	}
}

void TIM5_IRQHandler(void)
{
	//GPIOG->ODR = 0x4000;
	TIM5->SR = 0x000000000;
	beta = TIM1->CCR1;
//	Current = TIM1->CCR1;
	Direction = TIM1->CR1;
	
	Direction = Direction & 16;
	
	alfa = (float*) PID_Calc(&beta);
	
	if (*alfa < 0)
	{
		DAC->DHR12R1 = 2048;
		DAC->DHR12R2 = 0 - *alfa;
	}
	else
	{
		DAC->DHR12R1 = *alfa;
		DAC->DHR12R2 = 2048;
	}
	
	//DAC->DHR12R1 = *alfa;

	//	Prev = Current;
	DAC->SWTRIGR = DAC->SWTRIGR | 0x00000003;	
}

