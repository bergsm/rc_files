#xrandr --output HDMI-A-0 --auto --pos 0x0 --output eDP --primary --auto --pos 576x2160 --scale 1.4x1.4
xrandr --output DP-0 --mode 3440x1440 --rate 165.00 --output HDMI-0 --off
#xrandr --output HDMI-A-0 --mode 2650x1440 --pos 0x0 --output eDP --primary --auto --pos 576x2160 --scale 1.8x1.8


#xmodmap $HOME/.Xmodmap
setxkbmap -layout us
#setxkbmap -option caps:swapescape
xbindkeys --poll-rc
#keyboard repeat rates (delay, repeat)
xset r rate 200 50
#turn off screensaver and monitor sleep
#xset dpms 0 0 300
xset dpms 0 0 0
xset s off
xset b off
#xset s 1200 1200
#xset s 30 30
#xhost si:localuser:boinc

xrdb $HOME/.Xresources
#Help prevent touchpad movements while typing
#syndaemon -i 0.25 -t -K -R -d

#cp /home/shawn/prog/rc_files/us_logi /usr/share/X11/xkb/symbols/us
#setxkbmap -layout us

#exec dbus-launch dwm
#exec --no-startup-id /usr/bin/gwe --hide-window
#exec dbus-launch i3;
#exec --no-startup-id /usr/bin/flameshot
exec i3;
#exec dbus-launch cutefish-session;
