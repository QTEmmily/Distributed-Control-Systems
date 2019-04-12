#include "stm32f4xx_hal.h"

//void SystemClock_Config(void)
//{

//  RCC_OscInitTypeDef RCC_OscInitStruct;
//  RCC_ClkInitTypeDef RCC_ClkInitStruct;

//  __PWR_CLK_ENABLE();

//  __HAL_PWR_VOLTAGESCALING_CONFIG(PWR_REGULATOR_VOLTAGE_SCALE1);

//  RCC_OscInitStruct.OscillatorType = RCC_OSCILLATORTYPE_HSI;
//  RCC_OscInitStruct.HSIState = RCC_HSI_ON;
//  RCC_OscInitStruct.HSICalibrationValue = 16;
//  RCC_OscInitStruct.PLL.PLLState = RCC_PLL_ON;
//  RCC_OscInitStruct.PLL.PLLSource = RCC_PLLSOURCE_HSI;
//  RCC_OscInitStruct.PLL.PLLM = 8;
//  RCC_OscInitStruct.PLL.PLLN = 90;
//  RCC_OscInitStruct.PLL.PLLP = RCC_PLLP_DIV2;
//  RCC_OscInitStruct.PLL.PLLQ = 4;
//  HAL_RCC_OscConfig(&RCC_OscInitStruct);

//  HAL_PWREx_ActivateOverDrive();

//  RCC_ClkInitStruct.ClockType = RCC_CLOCKTYPE_HCLK|RCC_CLOCKTYPE_SYSCLK
//                              |RCC_CLOCKTYPE_PCLK1|RCC_CLOCKTYPE_PCLK2;
//  RCC_ClkInitStruct.SYSCLKSource = RCC_SYSCLKSOURCE_PLLCLK;
//  RCC_ClkInitStruct.AHBCLKDivider = RCC_SYSCLK_DIV1;
//  RCC_ClkInitStruct.APB1CLKDivider = RCC_HCLK_DIV4;
//  RCC_ClkInitStruct.APB2CLKDivider = RCC_HCLK_DIV2;
//  HAL_RCC_ClockConfig(&RCC_ClkInitStruct, FLASH_LATENCY_5);

//  HAL_SYSTICK_Config(HAL_RCC_GetHCLKFreq()/1000);

//  HAL_SYSTICK_CLKSourceConfig(SYSTICK_CLKSOURCE_HCLK);

//  /* SysTick_IRQn interrupt configuration */
//  HAL_NVIC_SetPriority(SysTick_IRQn, 0, 0);
//}

void Timer5_Config(void)
{
	TIM5->CR1 = 0x0000;
	TIM5->PSC = 0x0013;
	TIM5->ARR = 0x019F; //0x0050
	TIM5->DIER = 0x0001;
	TIM5->CR1 = 0x0001;
}

void Timer2_Config(void)
{
	TIM2->CR1 = 0x0000;
	TIM2->PSC = 0x03E7;
	TIM2->ARR = 0x7FFF; //0x0050
	TIM2->DIER = 0x0001;
	TIM2->CR1 = 0x0001;
}

void Encoder_Config(void)
{
	TIM1->CR1 = 0x0000;
	TIM1->SMCR = TIM1->SMCR | 0x0053;
	TIM1->CCMR1 = TIM1->CCMR1  | 0x0101;
	TIM1->EGR = TIM1->EGR | 0x0001;
	TIM1->CCER = TIM1->CCER | 0x0011;
	TIM1->DIER = TIM1->DIER | 0x0006;
	TIM1->ARR = 0x07D0; //0x03E8 0x01F4 0x07D0 0x0780
	TIM1->CR1 = 0x0001;
	
	GPIOE->MODER = 0x00880000;
	GPIOE->AFR[1] = 0x00001010;
}

void GPIO_Config(void)
{
	RCC->AHB1ENR = 0xF0;
	RCC->APB1ENR = RCC->APB1ENR | 0x20000009;
	RCC->APB2ENR = RCC->APB2ENR | 0x00000701;
	
	GPIOG->MODER = 0x55555555;
	GPIOG->ODR = 0x0000;
}

void DAC_Config(void)
{
	DAC->CR = DAC->CR | 0x00390039;
  DAC->DHR12R2 = 2048;
	DAC->SWTRIGR = DAC->SWTRIGR | 0x00000003;	
}

void NVIC_Enable(void)
{
	NVIC_EnableIRQ(TIM5_IRQn);
	NVIC_EnableIRQ(TIM2_IRQn);
}
