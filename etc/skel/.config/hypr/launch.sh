#!/usr/bin/env sh

# More info : https://github.com/jaagr/polybar/wiki

# Install the following applications for polybar and icons in polybar if you are on ArcoLinuxD
# awesome-terminal-fonts
# Tip : There are other interesting fonts that provide icons like nerd-fonts-complete
# --log=error
# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar > /dev/null; do sleep 1; done

desktop=$(echo $DESKTOP_SESSION)
count=$(xrandr --query | grep " connected" | cut -d" " -f1 | wc -l)

case $desktop in

    hypr|/usr/share/xsessions/hypr)
    if type "xrandr" > /dev/null; then
      for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
        MONITOR=$m polybar --reload mainbar0 -c ~/.config/hypr/polybar/polybartop.config &
        MONITOR=$m polybar --reload mainbar0 -c ~/.config/hypr/polybar/polybarbottom.config &
      done
    else
    MONITOR=$m polybar --reload mainbar0 -c ~/.config/hypr/polybar/polybartop.config &
    MONITOR=$m polybar --reload mainbar0 -c ~/.config/hypr/polybar/polybarbottom.config &
    fi
esac