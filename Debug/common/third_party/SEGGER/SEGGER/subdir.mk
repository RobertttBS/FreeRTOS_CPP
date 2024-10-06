################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../common/third_party/SEGGER/SEGGER/SEGGER_RTT.c \
../common/third_party/SEGGER/SEGGER/SEGGER_RTT_printf.c \
../common/third_party/SEGGER/SEGGER/SEGGER_SYSVIEW.c 

S_UPPER_SRCS += \
../common/third_party/SEGGER/SEGGER/SEGGER_RTT_ASM_ARMv7M.S 

OBJS += \
./common/third_party/SEGGER/SEGGER/SEGGER_RTT.o \
./common/third_party/SEGGER/SEGGER/SEGGER_RTT_ASM_ARMv7M.o \
./common/third_party/SEGGER/SEGGER/SEGGER_RTT_printf.o \
./common/third_party/SEGGER/SEGGER/SEGGER_SYSVIEW.o 

S_UPPER_DEPS += \
./common/third_party/SEGGER/SEGGER/SEGGER_RTT_ASM_ARMv7M.d 

C_DEPS += \
./common/third_party/SEGGER/SEGGER/SEGGER_RTT.d \
./common/third_party/SEGGER/SEGGER/SEGGER_RTT_printf.d \
./common/third_party/SEGGER/SEGGER/SEGGER_SYSVIEW.d 


# Each subdirectory must supply rules for building sources it contributes
common/third_party/SEGGER/SEGGER/%.o common/third_party/SEGGER/SEGGER/%.su common/third_party/SEGGER/SEGGER/%.cyclo: ../common/third_party/SEGGER/SEGGER/%.c common/third_party/SEGGER/SEGGER/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F411xE -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"/Users/robert/Documents/RTOS-Udemy/RTOS_workspace/cpp/common/third_party/SEGGER/SEGGER" -I"/Users/robert/Documents/RTOS-Udemy/RTOS_workspace/cpp/common/third_party/SEGGER/config" -I"/Users/robert/Documents/RTOS-Udemy/RTOS_workspace/cpp/common/third_party/SEGGER/OS" -I"/Users/robert/Documents/RTOS-Udemy/RTOS_workspace/cpp/common/third_party/FreeRTOS/portable/GCC/ARM_CM4F" -I"/Users/robert/Documents/RTOS-Udemy/RTOS_workspace/cpp/common/third_party/FreeRTOS/include" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
common/third_party/SEGGER/SEGGER/%.o: ../common/third_party/SEGGER/SEGGER/%.S common/third_party/SEGGER/SEGGER/subdir.mk
	arm-none-eabi-gcc -mcpu=cortex-m4 -g3 -DDEBUG -c -I/Users/robert/Documents/RTOS-Udemy/RTOS_workspace/common/third_party/SEGGER/config -I/Users/robert/Documents/RTOS-Udemy/RTOS_workspace/common/third_party/SEGGER/SEGGER -x assembler-with-cpp -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@" "$<"

clean: clean-common-2f-third_party-2f-SEGGER-2f-SEGGER

clean-common-2f-third_party-2f-SEGGER-2f-SEGGER:
	-$(RM) ./common/third_party/SEGGER/SEGGER/SEGGER_RTT.cyclo ./common/third_party/SEGGER/SEGGER/SEGGER_RTT.d ./common/third_party/SEGGER/SEGGER/SEGGER_RTT.o ./common/third_party/SEGGER/SEGGER/SEGGER_RTT.su ./common/third_party/SEGGER/SEGGER/SEGGER_RTT_ASM_ARMv7M.d ./common/third_party/SEGGER/SEGGER/SEGGER_RTT_ASM_ARMv7M.o ./common/third_party/SEGGER/SEGGER/SEGGER_RTT_printf.cyclo ./common/third_party/SEGGER/SEGGER/SEGGER_RTT_printf.d ./common/third_party/SEGGER/SEGGER/SEGGER_RTT_printf.o ./common/third_party/SEGGER/SEGGER/SEGGER_RTT_printf.su ./common/third_party/SEGGER/SEGGER/SEGGER_SYSVIEW.cyclo ./common/third_party/SEGGER/SEGGER/SEGGER_SYSVIEW.d ./common/third_party/SEGGER/SEGGER/SEGGER_SYSVIEW.o ./common/third_party/SEGGER/SEGGER/SEGGER_SYSVIEW.su

.PHONY: clean-common-2f-third_party-2f-SEGGER-2f-SEGGER

