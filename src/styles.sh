#!/bin/bash

TEXT_RESET=$(tput sgr0)

TEXT_BLACK=$(tput setaf 0)
TEXT_RED=$(tput setaf 1)
TEXT_GREEN=$(tput setaf 2)
TEXT_YELLOW=$(tput setaf 3)
TEXT_BLUE=$(tput setaf 4)
TEXT_PURPLE=$(tput setaf 5)
TEXT_CYAN=$(tput setaf 6)
TEXT_WHITE=$(tput setaf 7)
TEXT_GRAY=$(tput setaf 8)

TEXT_BOLD=$(tput bold)

HEAVY_DIVIDER="$TEXT_GRAY$TEXT_BOLD========================================================================$TEXT_RESET"
LIGHT_DIVIDER="$TEXT_GRAY$TEXT_BOLD------------------------------------------------------------------------$TEXT_RESET"
