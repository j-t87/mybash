#!/bin/bash

eval `dircolors -b`

# Text colors
c_black="\e[0;30m"
c_blue="\e[0;34m"
c_green="\e[0;32m"
c_cyan="\e[0;36m"
c_red="\e[0;31m"
c_purple="\e[0;35m"

# Duplicate text colors
c_brown="\e[0;33m"
c_lightgrey="\e[0;37m"
c_darkgrey="\e[1;30m"
c_lightblue="\e[1;34m"
c_lightgreen="\e[1;32m"
c_lightcyan="\e[1;36m"
c_lightred="\e[1;31m"
c_lightpurple="\e[1;35m"
c_lightyellow="\e[1;37m"
c_white="\e[0;30m"

# No color or highlight
c_n="\e[0m"

# Color arrays
c_arr=(${c_black} ${c_blue} ${c_green} ${c_cyan} \
       ${c_red} ${c_purple} ${c_brown} ${c_lightgrey} \
       ${c_darkgrey} ${c_lightblue} ${c_lightgreen} ${c_lightcyan} \
       ${c_lightred} ${c_lightpurple} ${c_lightyellow} ${c_white})

# Print a large line break
function br()
{
  local highlight="tput smso"
  
  # Get number of columns of the window
  c=$(tput cols)
  
  if [ "${br_i}" = "" ]; then
    br_i=$(( RANDOM % 6 + 1 ))
  fi
  
  # Increment color index
  br_i=$(( $br_i + 1 ))
  if [ $br_i = 7 ]; then
    br_i=1
  fi
  
  # Print three wide highlighted lines
  printf "%b${c}s%b%b%${c}s%b%b${c}s%b" \
         "${c_arr[0]}`$highlight`" "" "${c_n}\n" \
         "${c_arr[${br_i}]}`$highlight`" "" "${c_n}\n" \
         "${c_arr[0]}`$highlight`" "" "${c_n}\n"
}
