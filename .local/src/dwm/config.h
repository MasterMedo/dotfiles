/* See LICENSE file for copyright and license details. */

/* Constants */
#define TERMINAL "st"
#define TERMCLASS "St"

/* appearance */
static const unsigned int borderpx  = 0;  // border pixel of windows
static const unsigned int snap      = 32; // snap pixel
static const unsigned int gappih    = 15; // horiz inner gap between windows
static const unsigned int gappiv    = 15; // vert inner gap between windows
static const unsigned int gappoh    = 15; // horiz outer gap
static const unsigned int gappov    = 15; // vert outer gap
static const int swallowfloating    = 0;  // 1 means swallow floating
static const int smartgaps          = 0;  // no outer gap with only one window
static const int showbar            = 0;  // 0 means no bar
static const int topbar             = 1;  // 0 means bottom bar
static const char *fonts[]          = { "SF Mono:size=27" };
static char dmenufont[]             = "SF Mono:size=27";
static char normbgcolor[]           = "#222222";
static char normbordercolor[]       = "#444444";
static char normfgcolor[]           = "#bbbbbb";
static char selfgcolor[]            = "#eeeeee";
static char selbordercolor[]        = "#ffd700";
static char selbgcolor[]            = "#444444";
static char *colors[][3] = {
       /*               fg           bg           border   */
       [SchemeNorm] = { normfgcolor, normbgcolor, normbordercolor },
       [SchemeSel]  = { selfgcolor,  selbgcolor,  selbordercolor  },
};

typedef struct {
  const char *name;
  const void *cmd;
} Sp;

const char *spcmd1[] = {TERMINAL, "-n", "spterm", "-g", "120x34", NULL };
const char *spcmd2[] = {TERMINAL, "-n", "spcalc", "-f", "monospace:size=16",
                        "-g", "50x20", "-e", "bc", "-lq", NULL };

static Sp scratchpads[] = {
  /* name          cmd  */
  {"spterm",      spcmd1},
  {"spranger",    spcmd2},
};

/* tagging */
static const char *tags[] = { "🐇", "🌍", "", "ᴥ", "🐨", "🎥", "🐾", "💻", "😻" };

static const Rule rules[] = {
  /* xprop(1):
   *  WM_CLASS(STRING) = instance, class
   *  WM_NAME(STRING) = title
  */
  /* class instance title tags mask isfloating isterminal noswallow  monitor */
  { "Gimp",     NULL,     NULL,           1 << 8,   0,  0,  0,  -1 },
  { TERMCLASS,  NULL,     NULL,           0,        0,  1,  0,  -1 },
  { NULL,       NULL,     "Event Tester", 0,        0,  0,  1,  -1 },
  { NULL,      "spterm",  NULL,           SPTAG(0), 1,  1,  0,  -1 },
  { NULL,      "spcalc",  NULL,           SPTAG(1), 1,  1,  0,  -1 },
};

/* layout(s) */
static const float mfact     = 0.55; // factor of master area size [0.05..0.95]
static const int nmaster     = 1;    // number of clients in master area
static const int resizehints = 1;    // respect size hints in tiled resizals
#define FORCE_VSPLIT 1  // nrowgrid layout: force vertical split
#include "vanitygaps.c"
static const Layout layouts[] = {
  /* symbol     arrange function 🔆 */
  { "◧",  tile },                   // Master left, slaves right
  { "⬒",  bstack },                 // Master on top, slaves on bottom
  { "@",  spiral },                 // Fibonacci spiral
  { "⅏",  dwindle },                // Decreasing in size right and leftward
  { "📚", deck },                   // Master left, slaves stacked right
  { "📺", monocle },                // All windows on top of one another
  { "🇲",  centeredmaster },         // Master in middle, slaves on sides
  { "•",  centeredfloatingmaster }, // Same but master floats
  { "🍃", NULL },                   // floating
  { NULL, NULL },
};

/* key definitions */
#define MODKEY Mod4Mask
#define TAGKEYS(KEY,TAG) \
  { MODKEY,                       KEY,  view,       {.ui = 1 << TAG} }, \
  { MODKEY|ControlMask,           KEY,  toggleview, {.ui = 1 << TAG} }, \
  { MODKEY|ShiftMask,             KEY,  tag,        {.ui = 1 << TAG} }, \
  { MODKEY|ControlMask|ShiftMask, KEY,  toggletag,  {.ui = 1 << TAG} },

#define STACKKEYS(MOD,ACTION) \
  { MOD,  XK_j, ACTION##stack,  {.i = INC(+1) } }, \
  { MOD,  XK_k, ACTION##stack,  {.i = INC(-1) } },
/*{ MOD,  XK_v, ACTION##stack,  {.i = 0 } }, \ */
/*{ MOD,  XK_a, ACTION##stack,  {.i = PREVSEL } }, \ */
/*{ MOD,  XK_z, ACTION##stack,  {.i = 2 } }, \ */
/*{ MOD,  XK_x, ACTION##stack,  {.i = -1 } }, */

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */
static char dmenumon[2] = "0"; // component of dmenucmd, manipulated in spawn()
static const char *dmenucmd[] = { "dmenu_run",
                                  "-m",   dmenumon,
                                  "-fn",  dmenufont,
                                  "-nb",  normbgcolor,
                                  "-nf",  normfgcolor,
                                  "-sb",  selbgcolor,
                                  "-sf",  selfgcolor, NULL };

static const char *termcmd[]  = { TERMINAL, NULL };

#include <X11/XF86keysym.h>
#include "shiftview.c"
static Key keys[] = {
  STACKKEYS(MODKEY, focus)
  STACKKEYS(MODKEY|ShiftMask, push)
  TAGKEYS(XK_1, 0)
  TAGKEYS(XK_2, 1)
  TAGKEYS(XK_3, 2)
  TAGKEYS(XK_4, 3)
  TAGKEYS(XK_5, 4)
  TAGKEYS(XK_6, 5)
  TAGKEYS(XK_7, 6)
  TAGKEYS(XK_8, 7)
  TAGKEYS(XK_9, 8)
/*  modifier          key           func    argument */
  { MODKEY,           XK_Escape,    spawn,  SHCMD("us-gr") },
/*{ MODKEY|ShiftMask, XK_Escape,    spawn,  SHCMD("") }, */
/*{ MODKEY,           XK_F1,        spawn,  SHCMD("") }, */
/*{ MODKEY,           XK_F2,        spawn,  SHCMD("tutorialvids") }, */
/*{ MODKEY,           XK_F3,        spawn,  SHCMD("displayselect") }, */
/*{ MODKEY,           XK_F4,        spawn,  SHCMD()") }, */
/*{ MODKEY,           XK_F5,        xrdb,   {.v = NULL } }, */
/*{ MODKEY,           XK_F6,        spawn,  SHCMD("torwrap") }, */
/*{ MODKEY,           XK_F7,        spawn,  SHCMD("td-toggle") }, */
/*{ MODKEY,           XK_F8,        spawn,  SHCMD("mw -Y") }, */
/*{ MODKEY,           XK_F9,        spawn,  SHCMD("dmenumount") }, */
/*{ MODKEY,           XK_F10,       spawn,  SHCMD("dmenuumount") }, */
/*{ MODKEY,           XK_F11,       spawn,  SHCMD("") }, */
/*{ MODKEY,           XK_F12,       xrdb,   {.v = NULL } }, */

/*{ MODKEY,           XK_grave,     spawn,  SHCMD("dmenuunicode") }, */
/*{ MODKEY|ShiftMask, XK_grave,     spawn,  SHCMD("") }, */
  { MODKEY,           XK_minus,     spawn,  SHCMD("pamixer --allow-boost -d 5") },
  { MODKEY|ShiftMask, XK_minus,     spawn,  SHCMD("pamixer --allow-boost -d 15") },
  { MODKEY,           XK_equal,     spawn,  SHCMD("pamixer --allow-boost -i 5") },
  { MODKEY|ShiftMask, XK_equal,     spawn,  SHCMD("pamixer --allow-boost -i 15") },
/*{ MODKEY,           XK_BackSpace, spawn,  SHCMD("") }, */
  { MODKEY|ShiftMask, XK_BackSpace, spawn,  SHCMD("sudo reboot") },
  { MODKEY,           XK_Tab,       view,   {0} },
/*{ MODKEY|ShiftMask, XK_Tab,       spawn,  SHCMD("") }, */
  { MODKEY,           XK_Return,    spawn,          {.v = termcmd } },
/*{ MODKEY|ShiftMask, XK_Return,    togglescratch,  {.ui = 0} }, */
/*{ MODKEY,           XK_bracketleft,   spawn,          SHCMD("") }, */
/*{ MODKEY|ShiftMask, XK_bracketleft,   spawn,          SHCMD("") }, */
/*{ MODKEY,           XK_bracketright,  spawn,          SHCMD("") }, */
/*{ MODKEY|ShiftMask, XK_bracketright,  spawn,          SHCMD("") }, */
/*{ MODKEY,           XK_semicolon,     shiftview,      { .i = 1 } }, */
/*{ MODKEY|ShiftMask, XK_semicolon,     shifttag,       { .i = 1 } }, */
/*{ MODKEY,           XK_apostrophe,    togglescratch,  {.ui = 1} }, */
/*{ MODKEY|ShiftMask, XK_apostrophe,    spawn,          SHCMD("") }, */
/*{ MODKEY,           XK_backslash,     view,           {0} }, */
/*{ MODKEY|ShiftMask, XK_backslash,     spawn,          SHCMD("") }, */
/*{ MODKEY,           XK_comma,         spawn,          SHCMD("") }, */
/*{ MODKEY|ShiftMask, XK_comma,         spawn,          SHCMD("") }, */
/*{ MODKEY,           XK_period,        spawn,          SHCMD("") }, */
/*{ MODKEY|ShiftMask, XK_period,        spawn,          SHCMD("") }, */
  { MODKEY,           XK_Left,          focusmon,       {.i = -1 } },
  { MODKEY|ShiftMask, XK_Left,          tagmon,         {.i = -1 } },
  { MODKEY,           XK_Right,         focusmon,       {.i = +1 } },
  { MODKEY|ShiftMask, XK_Right,         tagmon,         {.i = +1 } },
/*{ MODKEY,           XK_Page_Up,       shiftview,      {.i = -1 } }, */
/*{ MODKEY|ShiftMask, XK_Page_Up,       shifttag,       {.i = -1 } }, */
/*{ MODKEY,           XK_Page_Down,     shiftview,      {.i = +1 } }, */
/*{ MODKEY|ShiftMask, XK_Page_Down,     shifttag,       {.i = +1 } }, */
/*{ MODKEY,           XK_Insert,        spawn,          SHCMD("") }, */
  { MODKEY,           XK_space,         spawn,          SHCMD("us-hr") },
/*{ MODKEY|ShiftMask, XK_space,         togglefloating, {0} }, */
  { 0,                XK_Print,         spawn,    SHCMD("flameshot gui") },
/*{ ShiftMask,        XK_Print,         spawn,    SHCMD("maimpick") }, */
/*{ MODKEY,           XK_Print,         spawn,    SHCMD("dmenurecord") }, */
/*{ MODKEY|ShiftMask, XK_Print,         spawn,    SHCMD("") }, */
/*{ MODKEY,           XK_Delete,        spawn,    SHCMD("") }, */
/*{ MODKEY,           XK_Scroll_Lock,   spawn,    SHCMD("") }, */

/*  modifier          key   func        argument */
  { MODKEY,           XK_0, view,       {.ui = ~0 } },
  { MODKEY|ShiftMask, XK_0, tag,        {.ui = ~0 } },
  { MODKEY,           XK_q, killclient, {0} },
/*{ MODKEY|ShiftMask, XK_q, spawn,      SHCMD("") }, */
/*{ MODKEY,           XK_w, spawn,      SHCMD("$BROWSER") }, */
/*{ MODKEY|ShiftMask, XK_w, spawn,      SHCMD("") }, */
/*{ MODKEY,           XK_e, spawn,      SHCMD("") }, */
/*{ MODKEY|ShiftMask, XK_e, spawn,      SHCMD("") }, */
  { MODKEY,           XK_r, spawn,      SHCMD(TERMINAL " -e lf") },
  { MODKEY|ShiftMask, XK_r, spawn,      SHCMD("kill -HUP $(pidof -s dwm)") },
  { MODKEY,           XK_t, setlayout,  {.v = &layouts[0]} }, // tile
  { MODKEY|ShiftMask, XK_t, setlayout,  {.v = &layouts[1]} }, // bstack
  { MODKEY,           XK_y, setlayout,  {.v = &layouts[2]} }, // spiral
  { MODKEY|ShiftMask, XK_y, setlayout,  {.v = &layouts[3]} }, // dwindle
  { MODKEY,           XK_u, setlayout,  {.v = &layouts[4]} }, // deck
  { MODKEY|ShiftMask, XK_u, setlayout,  {.v = &layouts[5]} }, // monocle
  { MODKEY,           XK_i, spawn,      SHCMD(TERMINAL " -e htop") },
/*{ MODKEY|ShiftMask, XK_i, setlayout,  {.v = &layouts[7]} }, */
  { MODKEY,           XK_o, setlayout,  {.v = &layouts[6]} }, // centeredmaster
  { MODKEY|ShiftMask, XK_o, setlayout,  {.v = &layouts[7]} }, // centerFmaster
  { MODKEY,           XK_p, spawn,      SHCMD("picom &") },
  { MODKEY|ShiftMask, XK_p, spawn,      SHCMD("killall picom") },
/*{ MODKEY,           XK_a, togglegaps, {0} }, */
/*{ MODKEY|ShiftMask, XK_a, defaultgaps,  {0} }, */
  { MODKEY,           XK_s, togglesticky, {0} },
/*{ MODKEY|ShiftMask, XK_s, spawn,      SHCMD("") }, */
  { MODKEY,           XK_d, spawn,      {.v = dmenucmd } },
/*{ MODKEY,           XK_d, spawn,      SHCMD("") } }, */
  { MODKEY,           XK_f, togglefullscr,  {0} },
  { MODKEY|ShiftMask, XK_f, setlayout,  {.v = &layouts[8]} }, // float
  { MODKEY,           XK_g, togglegaps, {0} },
/*{ MODKEY|ShiftMask, XK_g, defaultgaps,{0} }, */
/*{ MODKEY,           XK_g, shiftview,  { .i = -1 } }, */
/*{ MODKEY|ShiftMask, XK_g, shifttag,   { .i = -1 } }, */
  { MODKEY,           XK_h, setmfact,   {.f = -0.05} },
/*{ MODKEY,           XK_j, spawn,      SHCMD("") }, */
/*{ MODKEY|ShiftMask, XK_j, spawn,      SHCMD("") }, */
/*{ MODKEY,           XK_k, spawn,      SHCMD("") }, */
/*{ MODKEY|ShiftMask, XK_k, spawn,      SHCMD("") }, */
  { MODKEY,           XK_l, setmfact,   {.f = +0.05} },
  { MODKEY,           XK_z, zoom,       {0} },
/*{ MODKEY|ShiftMask, XK_z, spawn,      SHCMD("") }, */
/*{ MODKEY,           XK_x, incrgaps,   {.i = -3 } }, */
  { MODKEY|ShiftMask, XK_x, spawn,      SHCMD("sudo shutdown -h now") },
  { MODKEY,           XK_c, spawn,      SHCMD("dmenurecord") },
  { MODKEY|ShiftMask, XK_c, spawn,      SHCMD("camtoggle") },
/*{ MODKEY,           XK_v, spawn,      SHCMD("") }, */
/*{ MODKEY|ShiftMask, XK_v, spawn,      SHCMD("") }, */
  { MODKEY,           XK_b, togglebar,  {0} },
/*{ MODKEY|ShiftMask, XK_b, spawn,      SHCMD("") }, */
  { MODKEY,           XK_n, spawn,      SHCMD("screenkey") },
  { MODKEY|ShiftMask, XK_n, spawn,      SHCMD("killall screenkey") },
  { MODKEY,           XK_m, incnmaster, {.i = +1 } },
  { MODKEY|ShiftMask, XK_m, incnmaster, {.i = -1 } },

  /* Find the pressed key with 'xev' */
  { 0, XF86XK_AudioMute,          spawn,  SHCMD("pamixer --toggle-mute") },
  { 0, XF86XK_AudioRaiseVolume,   spawn,  SHCMD("pamixer --allow-boost -i 3") },
  { 0, XF86XK_AudioLowerVolume,   spawn,  SHCMD("pamixer --allow-boost -d 3") },
  { 0, XF86XK_AudioMicMute,       spawn,  SHCMD("pacmd list-sources | grep -oP 'index: \\d+' | awk '{ print $2 }' | xargs -I{} pactl set-source-mute {} toggle") },
  { 0, XF86XK_MonBrightnessUp,    spawn,  SHCMD("xbacklight -inc 15") },
  { 0, XF86XK_MonBrightnessDown,  spawn,  SHCMD("xbacklight -dec 15") },
  { 0, XF86XK_Display,            spawn,  SHCMD("arandr") },
/*{ 0, XF86XK_WLAN,               spawn,  SHCMD("connman toggle wifi") }, */
/*{ 0, XF86XK_Tools,              spawn,  SHCMD("settings") }, */
/*{ 0, XF86XK_Search,             spawn,  SHCMD("connman toggle bt") }, */
  { 0, XF86XK_LaunchA,            spawn,  SHCMD("onboard") },
/*{ 0, XF86XK_Explorer,           spawn,  SHCMD("favorite app") }, */
/*{ 0, XF86XK_AudioPrev,          spawn,  SHCMD("mpc prev") }, */
/*{ 0, XF86XK_AudioNext,          spawn,  SHCMD("mpc next") }, */
/*{ 0, XF86XK_AudioPause,         spawn,  SHCMD("mpc pause") }, */
/*{ 0, XF86XK_AudioPlay,          spawn,  SHCMD("mpc play") }, */
/*{ 0, XF86XK_AudioStop,          spawn,  SHCMD("mpc stop") }, */
/*{ 0, XF86XK_AudioRewind,        spawn,  SHCMD("mpc seek -10") }, */
/*{ 0, XF86XK_AudioForward,       spawn,  SHCMD("mpc seek +10") }, */
/*{ 0, XF86XK_AudioMedia,         spawn,  SHCMD(TERMINAL " -e ncmpcpp") }, */
/*{ 0, XF86XK_PowerOff,           spawn,  SHCMD("sysact") }, */
/*{ 0, XF86XK_Calculator,         spawn,  SHCMD(TERMINAL " -e bc -l") }, */
/*{ 0, XF86XK_Sleep,              spawn,  SHCMD("sudo -A zzz") }, */
/*{ 0, XF86XK_WWW,                spawn,  SHCMD("$BROWSER") }, */
/*{ 0, XF86XK_DOS,                spawn,  SHCMD(TERMINAL) }, */
/*{ 0, XF86XK_ScreenSaver,        spawn,  SHCMD("") }, */
/*{ 0, XF86XK_TaskPane,           spawn,  SHCMD(TERMINAL " -e htop") }, */
/*{ 0, XF86XK_Mail,               spawn,  SHCMD() }, */
/*{ 0, XF86XK_MyComputer,         spawn,  SHCMD(TERMINAL " -e lf /") }, */
/*{ 0, XF86XK_Battery,            spawn,  SHCMD("") }, */
/*{ 0, XF86XK_Launch1,            spawn,  SHCMD("xset dpms force off") }, */
/*{ 0, XF86XK_TouchpadToggle,     spawn,  SHCMD("") }, */
/*{ 0, XF86XK_TouchpadOff,        spawn,  SHCMD("synclient TouchpadOff=1") },*/
/*{ 0, XF86XK_TouchpadOn,         spawn,  SHCMD("synclient TouchpadOff=0") },*/

/*{ MODKEY|Mod4Mask,              XK_h, incrgaps,     {.i = +1 } }, */
/*{ MODKEY|Mod4Mask,              XK_l, incrgaps,     {.i = -1 } }, */
/*{ MODKEY|Mod4Mask|ShiftMask,    XK_h, incrogaps,    {.i = +1 } }, */
/*{ MODKEY|Mod4Mask|ShiftMask,    XK_l, incrogaps,    {.i = -1 } }, */
/*{ MODKEY|Mod4Mask|ControlMask,  XK_h, incrigaps,    {.i = +1 } }, */
/*{ MODKEY|Mod4Mask|ControlMask,  XK_l, incrigaps,    {.i = -1 } }, */
/*{ MODKEY|Mod4Mask|ShiftMask,    XK_0, defaultgaps,  {0} }, */
/*{ MODKEY,                       XK_y, incrihgaps,   {.i = +1 } }, */
/*{ MODKEY,                       XK_o, incrihgaps,   {.i = -1 } }, */
/*{ MODKEY|ControlMask,           XK_y, incrivgaps,   {.i = +1 } }, */
/*{ MODKEY|ControlMask,           XK_o, incrivgaps,   {.i = -1 } }, */
/*{ MODKEY|Mod4Mask,              XK_y, incrohgaps,   {.i = +1 } }, */
/*{ MODKEY|Mod4Mask,              XK_o, incrohgaps,   {.i = -1 } }, */
/*{ MODKEY|ShiftMask,             XK_y, incrovgaps,   {.i = +1 } }, */
/*{ MODKEY|ShiftMask,             XK_o, incrovgaps,   {.i = -1 } }, */

};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText,
   ClkClientWin, or ClkRootWin */
static Button buttons[] = {
  /* click          event mask  button    function      argument */
#ifndef __OpenBSD__
  { ClkStatusText,  0,          Button1,  sigdwmblocks, {.i = 1} },
  { ClkStatusText,  0,          Button2,  sigdwmblocks, {.i = 2} },
  { ClkStatusText,  0,          Button3,  sigdwmblocks, {.i = 3} },
  { ClkStatusText,  0,          Button4,  sigdwmblocks, {.i = 4} },
  { ClkStatusText,  0,          Button5,  sigdwmblocks, {.i = 5} },
  { ClkStatusText,  ShiftMask,  Button1,  sigdwmblocks, {.i = 6} },
#endif
/*{ ClkStatusText,  ShiftMask,  Button3,  spawn,        SHCMD("") }, */
  { ClkClientWin,   MODKEY,     Button1,  movemouse,    {0} },
  { ClkClientWin,   MODKEY,     Button2,  defaultgaps,  {0} },
  { ClkClientWin,   MODKEY,     Button3,  resizemouse,  {0} },
  { ClkClientWin,   MODKEY,     Button4,  incrgaps,     {.i = +1} },
  { ClkClientWin,   MODKEY,     Button5,  incrgaps,     {.i = -1} },
  { ClkTagBar,      0,          Button1,  view,         {0} },
  { ClkTagBar,      0,          Button3,  toggleview,   {0} },
  { ClkTagBar,      MODKEY,     Button1,  tag,          {0} },
  { ClkTagBar,      MODKEY,     Button3,  toggletag,    {0} },
  { ClkTagBar,      0,          Button4,  shiftview,    {.i = -1} },
  { ClkTagBar,      0,          Button5,  shiftview,    {.i = 1} },
  { ClkRootWin,     0,          Button2,  togglebar,    {0} },
};
