static const Block blocks[] = {
  /*Icon*/  /*Command*/   /*Update Interval*/ /*Update Signal*/
  {"", "cat /tmp/recordingicon 2>/dev/null",  0,  9},
  {"🔋", "cat /sys/class/power_supply/BAT0/capacity",  5,  3},
  {"% ", "setxkbmap -query | grep layout | tail -c -3", 0, 30}, //⌨
  {" ",  "weather", 18000,  5},
  {" 📆",  "date '+%d.%m.%Y. (%a)'",  60, 1},
  {" 🕗",  "date '+%H:%M '",  10, 1},
};

//Sets delimiter between status commands.
static char *delim = "";
