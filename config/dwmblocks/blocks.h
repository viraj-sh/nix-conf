//Modify this file to change what commands output to your statusbar, and recompile using the make command.
static const Block blocks[] = {
	/*Icon*/	/*Command*/		/*Update Interval*/	/*Update Signal*/
	{"", "date '+%I:%M %p - %a, %d %b %Y'",					5,		0},
	{" ", "free | awk '/^Mem/ { printf \"%.0f%%\", $3/$2 * 100 }'",	30,		0},
	{" ", "top -bn1 | awk '/^%Cpu/ { printf \"%.0f%%\", 100 - $8 }'",	5,		0},
	{"⏻ ", "/home/virajs-desktop/nix-conf/scripts/power.sh",	0,		0},
};

//sets delimiter between status commands. NULL character ('\0') means no delimiter.
static char delim[] = " | ";
static unsigned int delimLen = 5;
