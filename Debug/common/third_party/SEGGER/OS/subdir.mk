################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../common/third_party/SEGGER/OS/SEGGER_SYSVIEW_FreeRTOS.c 

OBJS += \
./common/third_party/SEGGER/OS/SEGGER_SYSVIEW_FreeRTOS.o 

C_DEPS += \
./common/third_party/SEGGER/OS/SEGGER_SYSVIEW_FreeRTOS.d 


# Each subdirectory must supply rules for building sources it contributes
common/third_party/SEGGER/OS/%.o common/third_party/SEGGER/OS/%.su common/third_party/SEGGER/OS/%.cyclo: ../common/third_party/SEGGER/OS/%.c common/third_party/SEGGER/OS/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F411xE -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"/Users/robert/Documents/RTOS-Udemy/RTOS_workspace/cpp/common/third_party/SEGGER/SEGGER" -I"/Users/robert/Documents/RTOS-Udemy/RTOS_workspace/cpp/common/third_party/SEGGER/config" -I"/Users/robert/Documents/RTOS-Udemy/RTOS_workspace/cpp/common/third_party/SEGGER/OS" -I"/Users/robert/Documents/RTOS-Udemy/RTOS_workspace/cpp/common/third_party/FreeRTOS/portable/GCC/ARM_CM4F" -I"/Users/robert/Documents/RTOS-Udemy/RTOS_workspace/cpp/common/third_party/FreeRTOS/include" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-common-2f-third_party-2f-SEGGER-2f-OS

clean-common-2f-third_party-2f-SEGGER-2f-OS:
	-$(RM) ./common/third_party/SEGGER/OS/SEGGER_SYSVIEW_FreeRTOS.cyclo ./common/third_party/SEGGER/OS/SEGGER_SYSVIEW_FreeRTOS.d ./common/third_party/SEGGER/OS/SEGGER_SYSVIEW_FreeRTOS.o ./common/third_party/SEGGER/OS/SEGGER_SYSVIEW_FreeRTOS.su

.PHONY: clean-common-2f-third_party-2f-SEGGER-2f-OS

