/* See LICENSE file for copyright and license details. */
/* Default settings; can be overriden by command line. */

static int topbar = 1;                      /* -b  option; if 0, dmenu appears at bottom     */
/* -fn option overrides fonts[0]; default X11 font or font set */
static const char *fonts[] = {
  "SF Mono:style=Regular:size=27",
};

static const char *prompt      = NULL;      /* -p  option; prompt to the left of input field */
static const char *colors[SchemeLast][2] = {
  /*     fg         bg       */
  [SchemeNorm] = { "#bbbbbb", "#10161C" },
  [SchemeSel] = { "#eeeeee", "#262626" },
  [SchemeOut] = { "#000000", "#e35430" },
};
static const unsigned int alphas[SchemeLast][2] = {
  /*               fgalpha bgalphga  */
  [SchemeNorm] = { OPAQUE, TRANSPARENT },
  [SchemeSel]  = { OPAQUE, TRANSPARENT },
  [SchemeOut]  = { OPAQUE, TRANSPARENT },
};

/* -l option; if nonzero, dmenu uses vertical list with given number of lines */
static unsigned int lines      = 0;

/*
 * Characters not considered part of a word while deleting words
 * for example: " /?\"&[]"
 */
static const char worddelimiters[] = " ";
