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
volatile uint32_t stackUsage = 0;
volatile uint32_t heapUsage = 0;
volatile uint32_t frames = 0;

extern "C" {
void metrics_print(void);
}

int main()
{
    Qul::initHardware();

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
    _qul_app.exec();
}

static void Matrics_Thread(void *argument)
{
    (void) argument;
    while (1) {
        metrics_print();
        // HAL_Delay(100);
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

    stackUsage = (QUL_STACK_SIZE - uxTaskGetStackHighWaterMark(GUItaskHandler)) * sizeof(StackType_t);
    heapUsage = configTOTAL_HEAP_SIZE - xPortGetFreeHeapSize();

    if (elapsed_ms >= 1000)
    {
        last_time = current_ms;
        frames = framecounter - last_frames;
        last_frames = framecounter;

        StatusProvider::instance().update(GetTaskCPUUsage(GUItaskHandler),
                                          stackUsage / 1024,
                                          heapUsage / 1024,
                                          frames,
                                          render_time);
        render_time = 0;
    }
}
}
