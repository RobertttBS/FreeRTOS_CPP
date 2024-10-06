################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../common/third_party/FreeRTOS/croutine.c \
../common/third_party/FreeRTOS/event_groups.c \
../common/third_party/FreeRTOS/list.c \
../common/third_party/FreeRTOS/queue.c \
../common/third_party/FreeRTOS/stream_buffer.c \
../common/third_party/FreeRTOS/tasks.c \
../common/third_party/FreeRTOS/timers.c 

OBJS += \
./common/third_party/FreeRTOS/croutine.o \
./common/third_party/FreeRTOS/event_groups.o \
./common/third_party/FreeRTOS/list.o \
./common/third_party/FreeRTOS/queue.o \
./common/third_party/FreeRTOS/stream_buffer.o \
./common/third_party/FreeRTOS/tasks.o \
./common/third_party/FreeRTOS/timers.o 

C_DEPS += \
./common/third_party/FreeRTOS/croutine.d \
./common/third_party/FreeRTOS/event_groups.d \
./common/third_party/FreeRTOS/list.d \
./common/third_party/FreeRTOS/queue.d \
./common/third_party/FreeRTOS/stream_buffer.d \
./common/third_party/FreeRTOS/tasks.d \
./common/third_party/FreeRTOS/timers.d 


# Each subdirectory must supply rules for building sources it contributes
common/third_party/FreeRTOS/%.o common/third_party/FreeRTOS/%.su common/third_party/FreeRTOS/%.cyclo: ../common/third_party/FreeRTOS/%.c common/third_party/FreeRTOS/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F411xE -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"/Users/robert/Documents/RTOS-Udemy/RTOS_workspace/cpp/common/third_party/SEGGER/SEGGER" -I"/Users/robert/Documents/RTOS-Udemy/RTOS_workspace/cpp/common/third_party/SEGGER/config" -I"/Users/robert/Documents/RTOS-Udemy/RTOS_workspace/cpp/common/third_party/SEGGER/OS" -I"/Users/robert/Documents/RTOS-Udemy/RTOS_workspace/cpp/common/third_party/FreeRTOS/portable/GCC/ARM_CM4F" -I"/Users/robert/Documents/RTOS-Udemy/RTOS_workspace/cpp/common/third_party/FreeRTOS/include" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-common-2f-third_party-2f-FreeRTOS

clean-common-2f-third_party-2f-FreeRTOS:
	-$(RM) ./common/third_party/FreeRTOS/croutine.cyclo ./common/third_party/FreeRTOS/croutine.d ./common/third_party/FreeRTOS/croutine.o ./common/third_party/FreeRTOS/croutine.su ./common/third_party/FreeRTOS/event_groups.cyclo ./common/third_party/FreeRTOS/event_groups.d ./common/third_party/FreeRTOS/event_groups.o ./common/third_party/FreeRTOS/event_groups.su ./common/third_party/FreeRTOS/list.cyclo ./common/third_party/FreeRTOS/list.d ./common/third_party/FreeRTOS/list.o ./common/third_party/FreeRTOS/list.su ./common/third_party/FreeRTOS/queue.cyclo ./common/third_party/FreeRTOS/queue.d ./common/third_party/FreeRTOS/queue.o ./common/third_party/FreeRTOS/queue.su ./common/third_party/FreeRTOS/stream_buffer.cyclo ./common/third_party/FreeRTOS/stream_buffer.d ./common/third_party/FreeRTOS/stream_buffer.o ./common/third_party/FreeRTOS/stream_buffer.su ./common/third_party/FreeRTOS/tasks.cyclo ./common/third_party/FreeRTOS/tasks.d ./common/third_party/FreeRTOS/tasks.o ./common/third_party/FreeRTOS/tasks.su ./common/third_party/FreeRTOS/timers.cyclo ./common/third_party/FreeRTOS/timers.d ./common/third_party/FreeRTOS/timers.o ./common/third_party/FreeRTOS/timers.su

.PHONY: clean-common-2f-third_party-2f-FreeRTOS

