#include <stdio.h>
#include <math.h>
#include <stdbool.h>
#include "stm32f4xx.h"                  // Device header
#include "Init.h"
#include "PID.h"
#include "work.h"

int i;
float* alfa;
float beta;
int x;
char Direction;
bool Trigger = 0;
int Prev = 0;
int Set_Point2 = 90;


void Init(void)
{
	RCC->CR = 0x01000001;
	RCC->PLLCFGR = 0x04005A10;
	RCC->CFGR = 0x0000940A;
	RCC->CR = 0x01000081;
//	RCC->CR = RCC->CR | 0x01000001;
//	RCC->PLLCFGR = RCC->PLLCFGR | 0x04005410;
//	RCC->CFGR = RCC->CFGR | 0xC0609400;
//	RCC->CR = RCC->CR | 0x01000081;
//	RCC->CR = RCC->CR | 0x00000001;
//	RCC->PLLCFGR = RCC->PLLCFGR | 0x07013002;
//	RCC->CFGR = RCC->CFGR | 0xC0600002;
//	RCC->CR = RCC->CR | 0x01000001;
//	SystemClock_Config();
	GPIO_Config();
//	Timer5_Config();
//	Timer2_Config();
//	Encoder_Config();
//	DAC_Config();
//	NVIC_Enable();
//	Set_Factors();
	
}

void Prog(void)
{
//	if (Direction > 0)
//	{
//		GPIOG->ODR = 0x2000;
//	}
//	else 
//	{
//		GPIOG->ODR = 0x4000;
//	}
	GPIOG->ODR = ~GPIOG->ODR;
}

void TIM5_IRQHandler(void)
{
//	GPIOG->ODR = 0x2000;
//	GPIOG->ODR = ~GPIOG->ODR;
	TIM5->SR = 0x000000000;
	TIM5->CNT = 0x00000000;
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
//	DAC->SWTRIGR = DAC->SWTRIGR | 0x00000003;
	GPIOG->ODR = 0x4000;	
}

void TIM2_IRQHandler(void)
{
	TIM2->SR = 0x000000000;
	TIM2->CNT = 0x000000000;
//	GPIOG->ODR = ~GPIOG->ODR;
	Set_Point2 = ~Set_Point2;
//	Asign();
}


