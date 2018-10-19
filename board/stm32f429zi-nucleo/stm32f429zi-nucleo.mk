NAME := stm32f429zi-nucleo


$(NAME)_TYPE := kernel
MODULE               := 1062
HOST_ARCH            := Cortex-M4
HOST_MCU_FAMILY      := stm32f4xx_cube
SUPPORT_BINS         := no
HOST_MCU_NAME        := STM32F429ZIT6
ENABLE_VFP           := 1

$(NAME)_SOURCES += aos/board_partition.c \
                   aos/soc_init.c
                   
$(NAME)_SOURCES += Src/stm32f4xx_hal_msp.c \
                   Src/can.c \
                   Src/eth.c \
                   Src/gpio.c \
                   Src/usart.c \
                   Src/usb_otg.c \
                   Src/main.c

#depends on sal module if select sal function via build option "sal=1"
ifeq (1,$(sal))
$(NAME)_COMPONENTS += sal
module ?= wifi.mk3060
else
$(NAME)_SOURCES += ethernetif.c
$(NAME)_COMPONENTS += network.lwip
endif



                   
ifeq ($(COMPILER), armcc)
$(NAME)_SOURCES += startup_stm32l433xx_keil.s    
else ifeq ($(COMPILER), iar)
$(NAME)_SOURCES += startup_stm32l433xx_iar.s  
else
$(NAME)_SOURCES += startup_stm32f429xx.s
endif

GLOBAL_INCLUDES += . \
                   hal/ \
                   aos/ \
                   Inc/
				   
GLOBAL_CFLAGS += -DSTM32F429xx -DCENTRALIZE_MAPPING

ifeq ($(COMPILER),armcc)
GLOBAL_LDFLAGS += -L --scatter=board/starterkit/STM32L433.sct
else ifeq ($(COMPILER),iar)
GLOBAL_LDFLAGS += --config STM32L433.icf
else
GLOBAL_LDFLAGS += -T board/stm32f429zi-nucleo/STM32F429ZITx_FLASH.ld
endif



CONFIG_SYSINFO_PRODUCT_MODEL := ALI_AOS_f429-nucleo
CONFIG_SYSINFO_DEVICE_NAME := f429-nucleo

GLOBAL_CFLAGS += -DSYSINFO_OS_VERSION=\"$(CONFIG_SYSINFO_OS_VERSION)\"
GLOBAL_CFLAGS += -DSYSINFO_PRODUCT_MODEL=\"$(CONFIG_SYSINFO_PRODUCT_MODEL)\"
GLOBAL_CFLAGS += -DSYSINFO_DEVICE_NAME=\"$(CONFIG_SYSINFO_DEVICE_NAME)\"
