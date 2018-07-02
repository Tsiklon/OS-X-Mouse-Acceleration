#!/usr/bin/env bash
##
## - mouseaccel.sh
##
## A script to set mouse acceleration under OS X
##  - Reports, sets and deletes current Mouse Acceleration value
##
## 2018 - Damien Nugent
##

# OS Detection
detect () {
 if ! [[ $(uname) = "Darwin" ]]; then
  echo "This is only for use on OS X systems"
  exit 1
 fi
 }

# Status
status () {
  detect
  /usr/bin/defaults read .GlobalPreferences com.apple.mouse.scaling
 }

# Off
off () {
  detect
  /usr/bin/defaults write .GlobalPreferences com.apple.mouse.scaling -1
 }

# Default
default () {
  detect
  /usr/bin/defaults write .GlobalPreferences com.apple.mouse.scaling 2
 }

# Delete
delete () {
  detect
  /usr/bin/defaults delete .GlobalPreferences com.apple.mouse.scaling
 }

# Custom
custom () {
  /usr/bin/defaults write .GlobalPreferences com.apple.mouse.scaling "$1"
 }

case "$1" in
  'status')
    status
    ;;
  
  'off')
    off
    ;;
  
  'default')
    default
    ;;

  'delete')
    delete
    ;;

  'custom')
    detect
    if [[ -z "$2" ]]; then
     echo "Provide a value between -1 and 9 to set the Mouse Acceleration"
    else 
     numb1='^-?[0-9]+$'
     numb2='^-[2-9]+$'
     if [[ $2 =~ $numb1 ]] && ! [[ $2 =~ $numb2 ]]; then
     custom "$2"
     else
      echo "Provide a Number between -1 and 9"
     fi
    fi
    ;;
   
  *)
   echo "Usage: $0 status|off|default|delete|custom"
   exit 1
   ;;
esac
