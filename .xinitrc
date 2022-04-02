#xrandr --output HDMI-A-0 --auto --pos 0x0 --output eDP --primary --auto --pos 576x2160 --scale 1.4x1.4
xrandr --output HDMI-A-0 --auto --pos 0x0 --output eDP --primary --auto --pos 656x1440 --scale 1x1
#xrandr --output HDMI-A-0 --mode 2650x1440 --pos 0x0 --output eDP --primary --auto --pos 576x2160 --scale 1.8x1.8


xmodmap ~/.Xmodmap
xbindkeys --poll-rc
#keyboard repeat rates (delay, repeat)
xset r rate 200 50
#turn off screensaver and monitor sleep
xset dpms 0 0 0
xset s off
xset b off
#xset s 1200 1200
#xset s 30 30

xrdb /home/bergsm/.Xresources
#Help prevent touchpad movements while typing
syndaemon -i 0.25 -t -K -R -d

#exec dbus-launch dwm
exec dbus-launch i3;
