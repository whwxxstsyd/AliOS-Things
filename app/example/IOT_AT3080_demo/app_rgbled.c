/**
 * Copyright (c) 2018 Microchip Technology Inc. and its subsidiaries.
 *
 * \page License
 *
 * Subject to your compliance with these terms, you may use Microchip
 * software and any derivatives exclusively with Microchip products.
 * It is your responsibility to comply with third party license terms applicable
 * to your use of third party software (including open source software) that
 * may accompany Microchip software.
 *
 * THIS SOFTWARE IS SUPPLIED BY MICROCHIP "AS IS". NO WARRANTIES,
 * WHETHER EXPRESS, IMPLIED OR STATUTORY, APPLY TO THIS SOFTWARE,
 * INCLUDING ANY IMPLIED WARRANTIES OF NON-INFRINGEMENT, MERCHANTABILITY,
 * AND FITNESS FOR A PARTICULAR PURPOSE. IN NO EVENT WILL MICROCHIP BE
 * LIABLE FOR ANY INDIRECT, SPECIAL, PUNITIVE, INCIDENTAL OR CONSEQUENTIAL
 * LOSS, DAMAGE, COST OR EXPENSE OF ANY KIND WHATSOEVER RELATED TO THE
 * SOFTWARE, HOWEVER CAUSED, EVEN IF MICROCHIP HAS BEEN ADVISED OF THE
 * POSSIBILITY OR THE DAMAGES ARE FORESEEABLE.  TO THE FULLEST EXTENT
 * ALLOWED BY LAW, MICROCHIP'S TOTAL LIABILITY ON ALL CLAIMS IN ANY WAY
 * RELATED TO THIS SOFTWARE WILL NOT EXCEED THE AMOUNT OF FEES, IF ANY,
 * THAT YOU HAVE PAID DIRECTLY TO MICROCHIP FOR THIS SOFTWARE.
 *
 */
#include "mx_debug.h"
#include "mx_common.h"
#include "alicloud_sds.h"

#include "drv_board.h"
#include "main.h"

static float bright = 100.0;
static float saturation = 100.0;
static float hue = 50.0;
static bool  light_on = true;

mx_status rgbled_task_init(void)
{
	alisds_attr_t attr;
	color_led_open_hsb(hue, saturation, bright);

	attr.name = "Saturation";
	attr.type = ALI_ATT_TYPE_INT;
	attr.read_func = handle_read_cur_saturation;
	attr.write_func = handle_write_cur_saturation;
	alisds_attr_init(ALI_HANDLE_SATURATION, attr);

	attr.name = "Luminance";
	attr.type = ALI_ATT_TYPE_INT;
	attr.read_func = handle_read_cur_bright;
	attr.write_func = handle_write_cur_bright;
	alisds_attr_init(ALI_HANDLE_BRIGHTNESS, attr);

	attr.name = "Hue";
	attr.type = ALI_ATT_TYPE_INT;
	attr.read_func = handle_read_cur_hue;
	attr.write_func = handle_write_cur_hue;
	alisds_attr_init(ALI_HANDLE_HUE, attr);

	attr.name = "lampswitch";
	attr.type = ALI_ATT_TYPE_BOOL;
	attr.read_func = handle_read_cur_light_switch;
	attr.write_func = handle_write_cur_light_switch;
	alisds_attr_init(ALI_HANDLE_LIGHT_SWITCH, attr);

	return kNoErr;
}


/* RGB led attribute handlers */
mx_status handle_write_cur_saturation	(alisds_att_val_t value)
{
	saturation = (float)value.intValue;
	if (light_on == true) {
		color_led_open_hsb(hue, saturation, bright);
	}
	return kNoErr;
}
mx_status handle_write_cur_bright		(alisds_att_val_t value)
{
	bright = (float)value.intValue;
	if (light_on == true) {
		color_led_open_hsb(hue, saturation, bright);
	}
	return kNoErr;
}

mx_status handle_write_cur_hue			(alisds_att_val_t value)
{
	hue = (float)value.intValue;
	if (light_on == true) {
		app_log("Light: %.2f, %.2f, %.2f", hue, saturation, bright);
		color_led_open_hsb(hue, saturation, bright);
	}
	return kNoErr;
}

mx_status handle_write_cur_light_switch(alisds_att_val_t value)
{
	light_on = value.boolValue;
	if (light_on == true) {
		color_led_open_hsb(hue, saturation, bright);
	}
	else {
		color_led_close();
	}
	return kNoErr;
}


mx_status handle_read_cur_saturation(alisds_att_val_t *value)
{
	(*value).intValue = (int)saturation;
	return kNoErr;
}

mx_status handle_read_cur_bright(alisds_att_val_t *value)
{
	(*value).intValue = (int)bright;
	return kNoErr;
}

mx_status handle_read_cur_hue(alisds_att_val_t *value)
{
	(*value).intValue = (int)hue;
	return kNoErr;
}

mx_status handle_read_cur_light_switch(alisds_att_val_t *value)
{
	(*value).boolValue = light_on;
	return kNoErr;
}