/* slstatus configuration */
/* See LICENSE file for copyright and license details. */

/* interval between updates (in ms) */
const unsigned int interval = 5000;

/* text to show if no value can be retrieved */
static const char unknown_str[] = "n/a";

/* maximum output string length */
#define MAXLEN 2048

/* output formats */
static const struct arg args[] = {
	/* function, format, argument */
    { cpu_perc,     " %s%%  ", "NULL" },
    { ram_perc,     " %s%%  ", "NULL" },
    { temp,         " %sC  ",  "/sys/class/thermal/thermal_zone0/temp" },
    { backlight_perc, "󰃞 %s  ", "intel_backlight" },
    { vol_perc,     "󰕾 %s%%  ", "/dev/mixer" },
	{ datetime,     "%s ",     "%b %d %a, %I:%M %p" },
};
