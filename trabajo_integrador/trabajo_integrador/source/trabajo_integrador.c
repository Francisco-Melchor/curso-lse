#include <stdio.h>
#include "board.h"
#include "peripherals.h"
#include "pin_mux.h"
#include "clock_config.h"
#include "fsl_debug_console.h"
#include "task.h"
#include "Wrappers.h"
#include "FreeRTOS.h"
#include "app_tasks.h"


#define BH1750_ADDR	0x5c
#define S1	16
#define S2	25
#define USER_BTN	4
#define LED_B	29
#define ADC_POT_CH		0



int main(void) {

	BOARD_BootClockFRO30M();
	BOARD_InitDebugConsole();
	    gpio_pin_config_t config = { kGPIO_DigitalOutput, 0 };
	    GPIO_PortInit(GPIO, 0);
	    GPIO_PinInit(GPIO, 0, 28, &config);
	    GPIO_PinWrite(GPIO, 0, 28, 0);


	xTaskCreate(
		task_init,
		"Init",
		tskINIT_STACK,
		NULL,
		tskINIT_PRIORITY,
		NULL
	);

	xTaskCreate(
		task_time,
		"Time",
		tskTIME_STACK,
		NULL,
		tskTIME_PRIORITY,
		NULL
	);

	xTaskCreate(
		task_CONSOLA,
		"CONSOLA",
		tskCONSOLA_STACK,
		NULL,
		tskCONSOLA_PRIORITY,
		NULL
	);

	xTaskCreate(
		task_bh1750,
		"BH1750",
		tskBH1750_STACK,
		NULL,
		tskBH1750_PRIORITY,
		NULL
	);

	xTaskCreate(
		task_btn,
		"Button",
		tskBTN_STACK,
		NULL,
		tskBTN_PRIORITY,
		NULL
	);

	xTaskCreate(
		task_display_write,
		"Write",
		tskDISPLAY_WRITE_STACK,
		NULL,
		tskDISPLAY_WRITE_PRIORITY,
		&handle_display
	);

	xTaskCreate(
		task_adc_read,
		"ADC",
		tskADC_READ_STACK,
		NULL,
		tskADC_READ_PRIORITY,
		NULL
	);

	xTaskCreate(
		task_pwm,
		"PWM",
		tskPWM_STACK,
		NULL,
		tskPWM_PRIORITY,
		NULL
	);

	vTaskStartScheduler();

    while(1);
    return 0;
}
