#!/bin/sh

# Change wallpaper for day/night time

#if [ "$1" = period-changed ]; then
#    #TODO night happens too early. Perhaps add a delay to time with sunset?
#    case $3 in
#        #nested case statement case $3 in transition $2 in day/night would make the transition happen earlier
#        night)
#            echo night > $HOME/.config/redshift/status
#            #sed -i '/gtk-application-prefer-dark-theme = /d' $HOME/.config/gtk-3.0/settings.ini
#            #echo gtk-application-prefer-dark-theme = true >> $HOME/.config/gtk-3.0/settings.ini
#            sed -i "s/theme = cura-light/theme = cura-dark/g" $HOME/.config/cura/*/cura.cfg
#            sed -i "s/background \#000000BB/background \#0000007B/g" $HOME/.config/i3/config
#            bash $HOME/.config/redshift/nightLight &
#            pid=$!
#            #sed -i "s/URxvt.shading: 40/URxvt.shading: 20/g" $HOME/.Xresources
#            wallpaper $HOME/pics/wallpapers/wallpaper_night
#            wait $pid
#            ;;
#        daytime)
#            echo day > $HOME/.config/redshift/status
#            #sed -i '/gtk-application-prefer-dark-theme = /d' $HOME/.config/gtk-3.0/settings.ini
#            #echo gtk-application-prefer-dark-theme = false >> $HOME/.config/gtk-3.0/settings.ini
#            sed -i "s/theme = cura-dark/theme = cura-light/g" $HOME/.config/cura/*/cura.cfg
#            sed -i "s/background \#0000007B/background \#000000BB/g" $HOME/.config/i3/config
#            bash $HOME/.config/redshift/dayLight &
#            pid=$!
#            #sed -i "s/URxvt.shading: 20/URxvt.shading: 40/g" $HOME/.Xresources
#            wallpaper $HOME/pics/wallpapers/wallpaper_day
#            wal -i $HOME/pics/wallpapers/wallpaper_day -b "#000000" -a 75 >> /dev/null 2>&1
#            wait $pid
#            ;;
#        transition)
#            case $2 in
#                # Going to night
#                daytime)
#                    echo sunset > $HOME/.config/redshift/status
#                    #sed -i '/gtk-application-prefer-dark-theme = /d' $HOME/.config/gtk-3.0/settings.ini
#                    #echo gtk-application-prefer-dark-theme = true >> $HOME/.config/gtk-3.0/settings.ini
#                    sed -i "s/theme = cura-light/theme = cura-dark/g" $HOME/.config/cura/*/cura.cfg
#                    sed -i "s/background \#000000BB/background \#0000007B/g" $HOME/.config/i3/config
#                    bash $HOME/.config/redshift/nightLight &
#                    pid=$!
#                    #sed -i "s/URxvt.shading: 40/URxvt.shading: 20/g" $HOME/.Xresources
#                    wallpaper $HOME/pics/wallpapers/wallpaper_sunset
#                    wait $pid
#                    ;;
#                # Going to daytime
#                night)
#                    echo sunrise > $HOME/.config/redshift/status
#                    #sed -i '/gtk-application-prefer-dark-theme = /d' $HOME/.config/gtk-3.0/settings.ini
#                    #echo gtk-application-prefer-dark-theme = false >> $HOME/.config/gtk-3.0/settings.ini
#                    sed -i "s/theme = cura-dark/theme = cura-light/g" $HOME/.config/cura/*/cura.cfg
#                    sed -i "s/background \#000000BB/background \#0000007B/g" $HOME/.config/i3/config
#
#                    bash $HOME/.config/redshift/dayLight &
#                    pid=$!
#                    #sed -i "s/URxvt.shading: 20/URxvt.shading: 40/g" $HOME/.Xresources
#                    wallpaper $HOME/pics/wallpapers/wallpaper_sunrise
#                    wal -i $HOME/pics/wallpapers/wallpaper_sunrise -b "#000000" -a 75 >> /dev/null 2>&1
#                    wait $pid
#                    ;;
#            esac
#    esac
#fi

