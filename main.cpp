#include "stm32u5g9j_dk2_qt_benchmark.h"
#include "stm32u5g9xx.h"
#include "stm32u5xx_hal.h"

#include <qul/application.h>
#include <qul/qul.h>
#ifdef APP_SAFE_RENDERER
#include <qul/imagedecoders/saferendererbitmapdecoder.h>
#endif

#include <platforminterface/log.h>
#include <FreeRTOS.h>
#include <task.h>
#include "StatusProvider.h"

#ifndef QUL_STACK_SIZE
#error QUL_STACK_SIZE must be defined.
#endif

TaskHandle_t GUItaskHandler;
static void Qul_Thread(void *argument);
static void Matrics_Thread(void *argument);
volatile uint32_t framecounter = 0;
volatile uint64_t render_start = 0;
volatile uint64_t render_end = 0;
volatile uint64_t render_time = 0;
float percentage = 0;
static uint32_t last_time = 0;
static uint32_t last_frames = 0;
volatile uint32_t current_ms = 0;
volatile uint32_t elapsed_ms = 0;
volatile uint32_t frames = 0;
StatusProvider statusProvider;

volatile uint32_t totalRamUsed = 0;

extern "C" {
void metrics_print(void);
// Declare Internal Flash Symbols
extern uint32_t _sidata;       // Start of Data in Flash
extern uint32_t _sdata;        // Start of Data in RAM
extern uint32_t _edata;        // End of Data in RAM
extern uint32_t _sbss;         // Start of BSS in RAM
extern uint32_t _ebss;         // End of BSS in RAM
extern uint32_t __Stack_Size;

// Declare External OSPI Symbols (The ones we added)
extern uint32_t __ospi_font_start__;
extern uint32_t __ospi_font_end__;
extern uint32_t __ospi_mres_start__;
extern uint32_t __ospi_mres_end__;
extern uint32_t __ospi_res_start__;
extern uint32_t __ospi_res_end__;
}

int main()
{
    Qul::initHardware();
    CoreDebug->DEMCR |= CoreDebug_DEMCR_TRCENA_Msk;
    DWT->CYCCNT = 0;
    DWT->CTRL |= DWT_CTRL_CYCCNTENA_Msk;

#ifdef APP_SAFE_RENDERER
    static SafeRendererBitmapDecoder srbDecoder;
    Qul::Application::addImageDecoder(&srbDecoder);
#endif

    Qul::initPlatform();
    if (xTaskCreate(Qul_Thread, "Qul_Thread", QUL_STACK_SIZE, 0, 4, &GUItaskHandler) != pdPASS) {
        Qul::PlatformInterface::log("Task creation failed!.\r\n");
        configASSERT(false);
    }
    if (xTaskCreate(Matrics_Thread, "Matrics_Thread", QUL_STACK_SIZE, 0, 4, 0) != pdPASS) {
        Qul::PlatformInterface::log("Task creation failed!.\r\n");
        configASSERT(false);
    }

    vTaskStartScheduler();

    // Should not reach this point
    return 1;
}

static void Qul_Thread(void *argument)
{
    (void) argument;
    Qul::Application _qul_app;

    static struct ::stm32u5g9j_dk2_qt_benchmark _qul_item;
    _qul_app.setRootItem(&_qul_item);
#ifdef APP_DEFAULT_UILANGUAGE
    _qul_app.settings().uiLanguage.setValue(APP_DEFAULT_UILANGUAGE);
#endif
    _qul_item.setStatus.setValue(&statusProvider);
    _qul_app.exec();
}

static void Matrics_Thread(void *argument)
{
    (void) argument;
    while (1) {
        metrics_print();
    }
}

int GetTaskCPUUsage(TaskHandle_t thread_id)
{
    static uint32_t lastTotalRunTime = 0;
    static uint32_t lastTaskRunTime = 0;

    UBaseType_t taskCount;
    TaskStatus_t *pxTaskStatusArray;
    configRUN_TIME_COUNTER_TYPE totalRunTime;
    int result = 0;

    taskCount = uxTaskGetNumberOfTasks();
    pxTaskStatusArray = (TaskStatus_t *)pvPortMalloc(taskCount * sizeof(TaskStatus_t));

    if (pxTaskStatusArray != NULL) {
        taskCount = uxTaskGetSystemState(pxTaskStatusArray, taskCount, &totalRunTime);
        uint32_t deltaTotal = totalRunTime - lastTotalRunTime;

        if (deltaTotal > 0) {
            for (UBaseType_t i = 0; i < taskCount; i++) {
                if (pxTaskStatusArray[i].xHandle == (TaskHandle_t)thread_id) {
                    uint32_t deltaTask = pxTaskStatusArray[i].ulRunTimeCounter - lastTaskRunTime;
                    percentage = ((float)deltaTask / (float)deltaTotal) * 100.0f;
                    result = (int)percentage;

                    lastTaskRunTime = pxTaskStatusArray[i].ulRunTimeCounter;
                    break;
                }
            }
        }
        lastTotalRunTime = totalRunTime;
        vPortFree(pxTaskStatusArray);
    }
    return result;
}

void configureTimerForRunTimeStats(void)
{
    RCC->APB1ENR1 |= RCC_APB1ENR1_TIM2EN;
    __DSB();
    __ISB();

    RCC->APB1RSTR1 |= RCC_APB1RSTR1_TIM2RST;
    RCC->APB1RSTR1 &= ~RCC_APB1RSTR1_TIM2RST;

    TIM2->CR1 = 0;
    TIM2->PSC = 40;
    TIM2->ARR = 0xFFFFFFFF;
    TIM2->EGR = TIM_EGR_UG;
    TIM2->CR1 |= TIM_CR1_CEN;
}

unsigned long getRunTimeCounterValue(void)
{
    return TIM2->CNT;
}

extern "C" {
void vApplicationStackOverflowHook(TaskHandle_t xTask, signed char *pcTaskName)
{
    (void) xTask;
    (void) pcTaskName;

    Qul::PlatformInterface::log("vApplicationStackOverflowHook");
    configASSERT(false);
}

void vApplicationMallocFailedHook(void)
{
    Qul::PlatformInterface::log("vApplicationMallocFailedHook");
    configASSERT(false);
}

void metrics_print(void)
{
    current_ms = HAL_GetTick();
    elapsed_ms = current_ms - last_time;

    totalRamUsed = ((uint32_t)&_edata - (uint32_t)&_sdata) +
                   ((uint32_t)&_ebss - (uint32_t)&_sbss) +
                   configTOTAL_HEAP_SIZE +
                   (uint32_t)&__Stack_Size;

    uint32_t flash_start = 0x08000000;
    uint32_t data_size   = (uint32_t)&_edata - (uint32_t)&_sdata;
    uint32_t internal_flash_usage = ((uint32_t)&_sidata - flash_start) + data_size;

    uint32_t ospi_font = (uint32_t)&__ospi_font_end__ - (uint32_t)&__ospi_font_start__;
    uint32_t ospi_mres = (uint32_t)&__ospi_mres_end__ - (uint32_t)&__ospi_mres_start__;
    uint32_t ospi_res = (uint32_t)&__ospi_res_end__ - (uint32_t)&__ospi_res_start__;
    uint32_t external_memory_usage = ospi_font + ospi_mres + ospi_res;

    if (elapsed_ms >= 1000)
    {
        last_time = current_ms;
        frames = framecounter - last_frames;
        last_frames = framecounter;

        statusProvider.update(GetTaskCPUUsage(GUItaskHandler), totalRamUsed/(1024 * 1024), internal_flash_usage/1024, external_memory_usage/(1024 * 1024), frames, render_time);
        render_time = 0;
    }
}
}
