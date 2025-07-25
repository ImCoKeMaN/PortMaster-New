#!/bin/bash

XDG_DATA_HOME=${XDG_DATA_HOME:-$HOME/.local/share}

if [ -d "/opt/system/Tools/PortMaster/" ]; then
  controlfolder="/opt/system/Tools/PortMaster"
elif [ -d "/opt/tools/PortMaster/" ]; then
  controlfolder="/opt/tools/PortMaster"
elif [ -d "$XDG_DATA_HOME/PortMaster/" ]; then
  controlfolder="$XDG_DATA_HOME/PortMaster"
else
  controlfolder="/roms/ports/PortMaster"
fi

source $controlfolder/control.txt
[ -f "${controlfolder}/mod_${CFW_NAME}.txt" ] && source "${controlfolder}/mod_${CFW_NAME}.txt"
get_controls

GAMEDIR="/$directory/ports/openjazz"

cd $GAMEDIR

$ESUDO chmod 666 /dev/tty1
$ESUDO chmod 666 /dev/uinput
$GPTOKEYB "OpenJazz.${DEVICE_ARCH}" -c "$GAMEDIR/openjazz.gptk" &

if [ -n "$(pgrep sway)" ]; then
  timeout 7 watch swaymsg '[app_id=OpenJazz] fullscreen enable' &
fi

unset SDL_BLITTER_DISABLED

if [[ -e "/usr/share/plymouth/themes/text.plymouth" ]]; then
  SDL_GAMECONTROLLERCONFIG="$sdl_controllerconfig" LD_PRELOAD=/usr/lib/aarch64-linux-gnu/libSDL2-2.0.so.0.10.0 ./OpenJazz.${DEVICE_ARCH} -f "$GAMEDIR/gamedata" 2>&1 | tee $GAMEDIR/log.txt
else
  SDL_GAMECONTROLLERCONFIG="$sdl_controllerconfig" ./OpenJazz.${DEVICE_ARCH} -f "$GAMEDIR/gamedata" 2>&1 | tee $GAMEDIR/log.txt
fi
$ESUDO kill -9 $(pidof gptokeyb)
$ESUDO systemctl restart oga_events &
printf "\033c" >> /dev/tty1

