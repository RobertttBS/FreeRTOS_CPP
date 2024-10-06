################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../common/third_party/FreeRTOS/portable/MemMang/heap_4.c 

OBJS += \
./common/third_party/FreeRTOS/portable/MemMang/heap_4.o 

C_DEPS += \
./common/third_party/FreeRTOS/portable/MemMang/heap_4.d 


# Each subdirectory must supply rules for building sources it contributes
common/third_party/FreeRTOS/portable/MemMang/%.o common/third_party/FreeRTOS/portable/MemMang/%.su common/third_party/FreeRTOS/portable/MemMang/%.cyclo: ../common/third_party/FreeRTOS/portable/MemMang/%.c common/third_party/FreeRTOS/portable/MemMang/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F411xE -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"/Users/robert/Documents/RTOS-Udemy/RTOS_workspace/cpp/common/third_party/SEGGER/SEGGER" -I"/Users/robert/Documents/RTOS-Udemy/RTOS_workspace/cpp/common/third_party/SEGGER/config" -I"/Users/robert/Documents/RTOS-Udemy/RTOS_workspace/cpp/common/third_party/SEGGER/OS" -I"/Users/robert/Documents/RTOS-Udemy/RTOS_workspace/cpp/common/third_party/FreeRTOS/portable/GCC/ARM_CM4F" -I"/Users/robert/Documents/RTOS-Udemy/RTOS_workspace/cpp/common/third_party/FreeRTOS/include" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-common-2f-third_party-2f-FreeRTOS-2f-portable-2f-MemMang

clean-common-2f-third_party-2f-FreeRTOS-2f-portable-2f-MemMang:
	-$(RM) ./common/third_party/FreeRTOS/portable/MemMang/heap_4.cyclo ./common/third_party/FreeRTOS/portable/MemMang/heap_4.d ./common/third_party/FreeRTOS/portable/MemMang/heap_4.o ./common/third_party/FreeRTOS/portable/MemMang/heap_4.su

.PHONY: clean-common-2f-third_party-2f-FreeRTOS-2f-portable-2f-MemMang

