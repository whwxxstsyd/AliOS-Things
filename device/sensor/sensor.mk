NAME := sensor

$(NAME)_TYPE := kernel

$(NAME)_SOURCES += \
        hal/sensor_hal.c \
        hal/sensor_drv_api.c \
        drv/drv_humi_bosch_bme280.c \
        drv/drv_acc_bosch_bma253.c \
        drv/drv_baro_bosch_bmp280.c \
        drv/drv_acc_gyro_st_lsm6dsl.c\
        drv/drv_baro_st_lps22hb.c \
        drv/drv_acc_mir3_da213B.c \
        drv/drv_acc_mir3_da215.c \
        drv/drv_acc_mir3_da217.c \
        drv/drv_acc_mir3_da270.c \
        drv/drv_acc_mir3_da312B.c \
        drv/drv_acc_mir3_da380B.c \
        drv/drv_als_ps_liteon_ltr553.c \
        drv/drv_temp_humi_sensirion_shtc1.c \
        drv/drv_temp_humi_sensirion_sht3x.c \
        drv/drv_temp_humi_st_hts221.c \
        drv/drv_mag_st_lis3mdl.c \
        drv/drv_mag_temp_memsic_mmc3680kj.c \
        drv/drv_als_ams_tcs3400.c  \
        drv/drv_als_ps_ams_tmd2725.c \
        drv/drv_temp_adi_adt7410.c \
        drv/drv_acc_adi_adxl355.c \
        drv/drv_acc_adi_adxl345.c
		

GLOBAL_INCLUDES += .
GLOBAL_DEFINES      += AOS_SENSOR

#GLOBAL_DEFINES      += AOS_SENSOR_HUMI_BOSCH_BME280
#GLOBAL_DEFINES      += AOS_SENSOR_ACC_BOSCH_BMA253
#GLOBAL_DEFINES      += AOS_SENSOR_BARO_BOSCH_BMP280
#GLOBAL_DEFINES      += AOS_SENSOR_ACC_ST_LSM6DSL
#GLOBAL_DEFINES      += AOS_SENSOR_GYRO_ST_LSM6DSL
#GLOBAL_DEFINES      += AOS_SENSOR_BARO_ST_LPS22HB
#GLOBAL_DEFINES      += AOS_SENSOR_ACC_SUPPORT_STEP
#GLOBAL_DEFINES      += AOS_SENSOR_MAG_ST_LIS3MDL  

#GLOBAL_DEFINES       += AOS_SENSOR_ACC_MIR3_DA213B
#GLOBAL_DEFINES       += AOS_SENSOR_ACC_MIR3_DA215
#GLOBAL_DEFINES       += AOS_SENSOR_ACC_MIR3_DA217
#GLOBAL_DEFINES       += AOS_SENSOR_ACC_MIR3_DA270
#GLOBAL_DEFINES       += AOS_SENSOR_ACC_MIR3_DA312B
#GLOBAL_DEFINES       += AOS_SENSOR_ACC_MIR3_DA380B

#GLOBAL_DEFINES       += AOS_SENSOR_ALS_LITEON_LTR553
#GLOBAL_DEFINES       += AOS_SENSOR_PS_LITEON_LTR553
#GLOBAL_DEFINES      += AOS_SENSOR_TEMP_SENSIRION_SHTC1
#GLOBAL_DEFINES      += AOS_SENSOR_HUMI_SENSIRION_SHTC1

#GLOBAL_DEFINES       += AOS_SENSOR_ALS_AMS_TCS3400
#GLOBAL_DEFINES       += AOS_SENSOR_ALS_AMS_TMD2725
#GLOBAL_DEFINES       += AOS_SENSOR_PS_AMS_TMD2725

#GLOBAL_DEFINES      += AOS_SENSOR_TEMP_SENSIRION_SHT3X
#GLOBAL_DEFINES      += AOS_SENSOR_HUMI_SENSIRION_SHT3X

#GLOBAL_DEFINES      += AOS_SENSOR_ACC_ADI_ADXL345
#GLOBAL_DEFINES      += AOS_SENSOR_ACC_ADI_ADXL355
#GLOBAL_DEFINES      += AOS_SENSOR_TEMP_ADI_ADT7410

