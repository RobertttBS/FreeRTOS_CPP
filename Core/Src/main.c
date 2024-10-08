/* USER CODE BEGIN Header */
/**
 ******************************************************************************
 * @file           : main.c
 * @brief          : Main program body
 ******************************************************************************
 * @attention
 *
 * Copyright (c) 2024 STMicroelectronics.
 * All rights reserved.
 *
 * This software is licensed under terms that can be found in the LICENSE file
 * in the root directory of this software component.
 * If no LICENSE file comes with this software, it is provided AS-IS.
 *
 ******************************************************************************
 */
/* USER CODE END Header */
/* Includes ------------------------------------------------------------------*/
#include "main.h"

/* Private includes ----------------------------------------------------------*/
/* USER CODE BEGIN Includes */
#include <stdio.h>
#include "FreeRTOS.h"
#include "task.h"
#include "semphr.h"
#include "queue.h"
/* USER CODE END Includes */

/* Private typedef -----------------------------------------------------------*/
/* USER CODE BEGIN PTD */

/* USER CODE END PTD */

/* Private define ------------------------------------------------------------*/
/* USER CODE BEGIN PD */

/* USER CODE END PD */

/* Private macro -------------------------------------------------------------*/
/* USER CODE BEGIN PM */

/* USER CODE END PM */

/* Private variables ---------------------------------------------------------*/

/* USER CODE BEGIN PV */
#define DWT_CTRL          (*((volatile uint32_t *) 0xE0001000))
/* USER CODE END PV */

/* Private function prototypes -----------------------------------------------*/
void SystemClock_Config(void);
static void MX_GPIO_Init(void);
/* USER CODE BEGIN PFP */
SemaphoreHandle_t xSemaphore1;
SemaphoreHandle_t xSemaphore2;

TaskHandle_t task1_handle;
TaskHandle_t task2_handle;
TaskHandle_t task3_handle;
TaskHandle_t btn_handle;

void SEGGER_UART_init(U32 baud);
static void task1_handler(void *param);
static void task2_handler(void *param);
static void task3_handler(void *param);
static void btn_handler(void *param);

volatile TaskHandle_t nxt_del_handle;
/* USER CODE END PFP */

/* Private user code ---------------------------------------------------------*/
/* USER CODE BEGIN 0 */

/* USER CODE END 0 */

/**
 * @brief  The application entry point.
 * @retval int
 */
int main(void) {

	/* USER CODE BEGIN 1 */

	BaseType_t status;
	/* USER CODE END 1 */

	/* MCU Configuration--------------------------------------------------------*/

	/* Reset of all peripherals, Initializes the Flash interface and the Systick. */
	HAL_Init();

	/* USER CODE BEGIN Init */

	/* USER CODE END Init */

	/* Configure the system clock */
	SystemClock_Config();

	/* USER CODE BEGIN SysInit */

	/* USER CODE END SysInit */

	/* Initialize all configured peripherals */
	MX_GPIO_Init();
	/* USER CODE BEGIN 2 */
	// Enable CYCCNT counter.
	DWT_CTRL |= (1 << 0);

	// Start SEGGER Uart (segger_uart.c)
	SEGGER_UART_init(921600);

	// Start SEGGER
	SEGGER_SYSVIEW_Conf();

	xSemaphore1 = xSemaphoreCreateMutex(4);
	xSemaphore2 = xSemaphoreCreateMutex(4);

	status = xTaskCreate(task1_handler, "task-1", 200, "task1: Turn on the led",
			3, &task1_handle);
	configASSERT(status == pdPASS);

	nxt_del_handle = task1_handle;

	status = xTaskCreate(task2_handler, "task-2", 200,
			"task2: Turn off the led", 2, &task2_handle);
	configASSERT(status == pdPASS);

//  status = xTaskCreate(task3_handler, "task-3", 200, "task3: Do nothing", 1, &task3_handle);
//  configASSERT(status == pdPASS);

//  status = xTaskCreate(btn_handler, "btn", 200, "Button Task: ", 4, &btn_handle);
//  configASSERT(status == pdPASS);

	vTaskStartScheduler();

	/* USER CODE END 2 */

	/* Infinite loop */
	/* USER CODE BEGIN WHILE */
	while (1) {
		/* USER CODE END WHILE */

		/* USER CODE BEGIN 3 */
	}
	/* USER CODE END 3 */
}

/**
 * @brief System Clock Configuration
 * @retval None
 */
void SystemClock_Config(void) {
	RCC_OscInitTypeDef RCC_OscInitStruct = { 0 };
	RCC_ClkInitTypeDef RCC_ClkInitStruct = { 0 };

	/** Configure the main internal regulator output voltage
	 */
	__HAL_RCC_PWR_CLK_ENABLE();
	__HAL_PWR_VOLTAGESCALING_CONFIG(PWR_REGULATOR_VOLTAGE_SCALE1);

	/** Initializes the RCC Oscillators according to the specified parameters
	 * in the RCC_OscInitTypeDef structure.
	 */
	RCC_OscInitStruct.OscillatorType = RCC_OSCILLATORTYPE_HSI;
	RCC_OscInitStruct.HSIState = RCC_HSI_ON;
	RCC_OscInitStruct.HSICalibrationValue = RCC_HSICALIBRATION_DEFAULT;
	RCC_OscInitStruct.PLL.PLLState = RCC_PLL_ON;
	RCC_OscInitStruct.PLL.PLLSource = RCC_PLLSOURCE_HSI;
	RCC_OscInitStruct.PLL.PLLM = 16;
	RCC_OscInitStruct.PLL.PLLN = 168;
	RCC_OscInitStruct.PLL.PLLP = RCC_PLLP_DIV2;
	RCC_OscInitStruct.PLL.PLLQ = 4;
	if (HAL_RCC_OscConfig(&RCC_OscInitStruct) != HAL_OK) {
		Error_Handler();
	}

	/** Initializes the CPU, AHB and APB buses clocks
	 */
	RCC_ClkInitStruct.ClockType = RCC_CLOCKTYPE_HCLK | RCC_CLOCKTYPE_SYSCLK
			| RCC_CLOCKTYPE_PCLK1 | RCC_CLOCKTYPE_PCLK2;
	RCC_ClkInitStruct.SYSCLKSource = RCC_SYSCLKSOURCE_PLLCLK;
	RCC_ClkInitStruct.AHBCLKDivider = RCC_SYSCLK_DIV1;
	RCC_ClkInitStruct.APB1CLKDivider = RCC_HCLK_DIV2;
	RCC_ClkInitStruct.APB2CLKDivider = RCC_HCLK_DIV1;

	if (HAL_RCC_ClockConfig(&RCC_ClkInitStruct, FLASH_LATENCY_2) != HAL_OK) {
		Error_Handler();
	}
}

/**
 * @brief GPIO Initialization Function
 * @param None
 * @retval None
 */
static void MX_GPIO_Init(void) {
	GPIO_InitTypeDef GPIO_InitStruct = { 0 };
	/* USER CODE BEGIN MX_GPIO_Init_1 */
	/* USER CODE END MX_GPIO_Init_1 */

	/* GPIO Ports Clock Enable */
	__HAL_RCC_GPIOC_CLK_ENABLE();
	__HAL_RCC_GPIOA_CLK_ENABLE();

	/*Configure GPIO pin Output Level */
	HAL_GPIO_WritePin(LD2_GPIO_Port, LD2_Pin, GPIO_PIN_RESET);

	/*Configure GPIO pin : PC13 */
	GPIO_InitStruct.Pin = GPIO_PIN_13;
	GPIO_InitStruct.Mode = GPIO_MODE_INPUT;
	GPIO_InitStruct.Pull = GPIO_NOPULL;
	HAL_GPIO_Init(GPIOC, &GPIO_InitStruct);

	/*Configure GPIO pins : PA2 PA3 */
	GPIO_InitStruct.Pin = GPIO_PIN_2 | GPIO_PIN_3;
	GPIO_InitStruct.Mode = GPIO_MODE_AF_PP;
	GPIO_InitStruct.Pull = GPIO_NOPULL;
	GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_VERY_HIGH;
	GPIO_InitStruct.Alternate = GPIO_AF7_USART2;
	HAL_GPIO_Init(GPIOA, &GPIO_InitStruct);

	/*Configure GPIO pin : LD2_Pin */
	GPIO_InitStruct.Pin = LD2_Pin;
	GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
	GPIO_InitStruct.Pull = GPIO_NOPULL;
	GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
	HAL_GPIO_Init(LD2_GPIO_Port, &GPIO_InitStruct);

	/* USER CODE BEGIN MX_GPIO_Init_2 */
	/* USER CODE END MX_GPIO_Init_2 */
}

/* USER CODE BEGIN 4 */
static void task1_handler(void *param) {

	while (1) {
		vTaskDelay(pdMS_TO_TICKS(5000));
		// Delay 1000 ms
		SEGGER_SYSVIEW_PrintfTarget("Task1 delay 5000 ms\n");
		vTaskDelay(pdMS_TO_TICKS(5000));

		SEGGER_SYSVIEW_PrintfTarget("Task1 compute 2000 ms\n");
		HAL_Delay(2000);

		SEGGER_SYSVIEW_PrintfTarget("Task1 take semaphore 2\n");
		if ( xSemaphoreTake(xSemaphore2,
				( TickType_t ) pdMS_TO_TICKS(10000)) == pdTRUE) {
			SEGGER_SYSVIEW_PrintfTarget("Task1 compute 3000 ms: R2\n");
			HAL_Delay(3000);

			//Take xSemaphore1
			SEGGER_SYSVIEW_PrintfTarget("Task1 take semaphore 1\n");
			if ( xSemaphoreTake(xSemaphore1,
					(TickType_t) pdMS_TO_TICKS(10000)) == pdTRUE) {
				SEGGER_SYSVIEW_PrintfTarget("Task1 compute 3000 ms: R1, R2\n");
				HAL_Delay(3000);

				SEGGER_SYSVIEW_PrintfTarget("Task1 give semaphore1\n");
				xSemaphoreGive(xSemaphore1);
			} else {
				SEGGER_SYSVIEW_PrintfTarget("Task1 fail taking semaphore 1\n");
			}

			SEGGER_SYSVIEW_PrintfTarget("Task1 compute 3000 ms: R2\n");
			HAL_Delay(3000);

			xSemaphoreGive(xSemaphore2);
			SEGGER_SYSVIEW_PrintfTarget("Task1 give semaphore 2\n");
		} else {
			SEGGER_SYSVIEW_PrintfTarget("Task1 fail taking semaphore 2\n");
		}

		SEGGER_SYSVIEW_PrintfTarget("Task1 delay 10000 ms\n");
		vTaskDelay(pdMS_TO_TICKS(10000));
	}
}

static void task2_handler(void *param) {

	while (1) {
		vTaskDelay(pdMS_TO_TICKS(5000));
		SEGGER_SYSVIEW_PrintfTarget("Task2 compute 2000 ms\n");
		HAL_Delay(2000);

		SEGGER_SYSVIEW_PrintfTarget("Task2 take semaphore 1\n");
		if ( xSemaphoreTake(xSemaphore1,
				( TickType_t ) pdMS_TO_TICKS(10000)) == pdTRUE) {
			SEGGER_SYSVIEW_PrintfTarget("Task2 compute 6000 ms: R1\n");
			HAL_Delay(6000);

			// task2 take semaphore2
			SEGGER_SYSVIEW_PrintfTarget("Task2 take semaphore2\n");
			if ( xSemaphoreTake(xSemaphore2,
					( TickType_t ) pdMS_TO_TICKS(10000)) == pdTRUE) {
				SEGGER_SYSVIEW_PrintfTarget("Task2 compute 2000 ms: R1, R2\n");
				HAL_Delay(2000);

				SEGGER_SYSVIEW_PrintfTarget("Task2 give semaphore 2\n");
				xSemaphoreGive(xSemaphore2);
			} else {
				SEGGER_SYSVIEW_PrintfTarget("Task2 fail taking semaphore 2\n");
			}
			SEGGER_SYSVIEW_PrintfTarget("Task2 compute 2000 ms: R1\n");
			HAL_Delay(2000);

			SEGGER_SYSVIEW_PrintfTarget("Task2 give semaphore 1\n");
			xSemaphoreGive(xSemaphore1);
		} else {
			SEGGER_SYSVIEW_PrintfTarget("Task2 fail taking semaphore 1\n");
		}

		SEGGER_SYSVIEW_PrintfTarget("Task2 delay 1000 ms\n");
		vTaskDelay(pdMS_TO_TICKS(1000));
	}
}

static void task3_handler(void *param) {
	BaseType_t status;

	while (1) {
		SEGGER_SYSVIEW_PrintfTarget("Task 3\n");
		status = xTaskNotifyWait(0, 0, NULL, pdMS_TO_TICKS(1000));
		if (status == pdTRUE) {
			vTaskSuspendAll();
			nxt_del_handle = btn_handle;
			xTaskResumeAll();
			vTaskSuspend(NULL);
		}
	}
}

static void btn_handler(void *param) {
	uint8_t btn_read = 0;
	uint8_t prev_read = 1;

	btn_read = HAL_GPIO_ReadPin(BTN_GPIO_Port, BTN_Pin);
	vTaskDelay(pdMS_TO_TICKS(10));

	while (1) {
		btn_read = HAL_GPIO_ReadPin(BTN_GPIO_Port, BTN_Pin);

		if (btn_read) {
			if (!prev_read) {
				if (nxt_del_handle != btn_handle) {
					SEGGER_SYSVIEW_PrintfTarget("Notify a task to shutdown\n");
					xTaskNotify(nxt_del_handle, 0, eNoAction);
				} else {
					SEGGER_SYSVIEW_PrintfTarget("Resume all tasks\n");
					nxt_del_handle = task1_handle;
					vTaskResume(task1_handle);
					vTaskResume(task2_handle);
					vTaskResume(task3_handle);
				}
			}
		}

		prev_read = btn_read;
		vTaskDelay(pdMS_TO_TICKS(10)); // 每 10 ms 檢查一次
	}
}

/* USER CODE END 4 */

/**
 * @brief  Period elapsed callback in non blocking mode
 * @note   This function is called  when TIM4 interrupt took place, inside
 * HAL_TIM_IRQHandler(). It makes a direct call to HAL_IncTick() to increment
 * a global variable "uwTick" used as application time base.
 * @param  htim : TIM handle
 * @retval None
 */
void HAL_TIM_PeriodElapsedCallback(TIM_HandleTypeDef *htim) {
	/* USER CODE BEGIN Callback 0 */

	/* USER CODE END Callback 0 */
	if (htim->Instance == TIM4) {
		HAL_IncTick();
	}
	/* USER CODE BEGIN Callback 1 */

	/* USER CODE END Callback 1 */
}

/**
 * @brief  This function is executed in case of error occurrence.
 * @retval None
 */
void Error_Handler(void) {
	/* USER CODE BEGIN Error_Handler_Debug */
	/* User can add his own implementation to report the HAL error return state */
	__disable_irq();
	while (1) {
	}
	/* USER CODE END Error_Handler_Debug */
}

#ifdef  USE_FULL_ASSERT
/**
  * @brief  Reports the name of the source file and the source line number
  *         where the assert_param error has occurred.
  * @param  file: pointer to the source file name
  * @param  line: assert_param error line source number
  * @retval None
  */
void assert_failed(uint8_t *file, uint32_t line)
{
  /* USER CODE BEGIN 6 */
  /* User can add his own implementation to report the file name and line number,
     ex: printf("Wrong parameters value: file %s on line %d\r\n", file, line) */
  /* USER CODE END 6 */
}
#endif /* USE_FULL_ASSERT */
