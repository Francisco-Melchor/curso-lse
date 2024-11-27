################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../source/app_tasks.c \
../source/mtb.c \
../source/semihost_hardfault.c \
../source/trabajo_integrador.c \
../source/wrappers.c 

C_DEPS += \
./source/app_tasks.d \
./source/mtb.d \
./source/semihost_hardfault.d \
./source/trabajo_integrador.d \
./source/wrappers.d 

OBJS += \
./source/app_tasks.o \
./source/mtb.o \
./source/semihost_hardfault.o \
./source/trabajo_integrador.o \
./source/wrappers.o 


# Each subdirectory must supply rules for building sources it contributes
source/%.o: ../source/%.c source/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: MCU C Compiler'
	arm-none-eabi-gcc -DCPU_LPC845M301JBD48 -DCPU_LPC845M301JBD48_cm0plus -DSDK_OS_BAREMETAL -DSDK_DEBUGCONSOLE=0 -DCR_INTEGER_PRINTF -DPRINTF_FLOAT_ENABLE=0 -D__MCUXPRESSO -D__USE_CMSIS -DDEBUG -D__REDLIB__ -I"C:\Users\fmelc\Documents\GitHub\curso-lse\workspace_lpc845\trabajo_integrador\board" -I"C:\Users\fmelc\Documents\GitHub\curso-lse\workspace_lpc845\trabajo_integrador\source" -I"C:\Users\fmelc\Documents\GitHub\curso-lse\workspace_lpc845\trabajo_integrador\component\uart" -I"C:\Users\fmelc\Documents\GitHub\curso-lse\workspace_lpc845\trabajo_integrador\drivers" -I"C:\Users\fmelc\Documents\GitHub\curso-lse\workspace_lpc845\trabajo_integrador\CMSIS" -I"C:\Users\fmelc\Documents\GitHub\curso-lse\workspace_lpc845\trabajo_integrador\device" -I"C:\Users\fmelc\Documents\GitHub\curso-lse\workspace_lpc845\trabajo_integrador\utilities" -I"C:\Users\fmelc\Documents\GitHub\curso-lse\lpc845\ejemplos\freertos\inc" -O0 -fno-common -g3 -gdwarf-4 -Wall -c -ffunction-sections -fdata-sections -fno-builtin -fmerge-constants -fmacro-prefix-map="$(<D)/"= -mcpu=cortex-m0plus -mthumb -D__REDLIB__ -fstack-usage -specs=redlib.specs -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.o)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


clean: clean-source

clean-source:
	-$(RM) ./source/app_tasks.d ./source/app_tasks.o ./source/mtb.d ./source/mtb.o ./source/semihost_hardfault.d ./source/semihost_hardfault.o ./source/trabajo_integrador.d ./source/trabajo_integrador.o ./source/wrappers.d ./source/wrappers.o

.PHONY: clean-source

