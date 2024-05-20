#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

stty -ixon
export PROMPT_COMMAND='history -a'
export HISTSIZE=10000
export EDITOR=vim
export BROWSER=firefox
#export OPENCV_LOG_LEVEL=ERROR
#OPENCV_LOG_LEVEL=ERROR
export HISTCONTROL=ignoreboth:erasedups
#export HISTCONTROL=ignoreboth
alias ls='ls --color=auto'
alias perm="stat -c '%A %a %h %U %G %s %y %n' *| sed 's/\.[[:digit:]]\+[ ]\+-[[:digit:]]\+/ /'"
alias grep='grep --color=auto'
#alias grep='rg'
alias vi='vim'
alias svi='sudo -E vim'
alias sudo='sudo -E'
alias pacman='sudo pacman'
alias makepkg='makepkg -si'
alias batt='acpi'
#alias find='sudo find'
#alias find='fd'
alias updatedb='sudo updatedb'
alias calc='bc -l'
alias weather='curl -Ss https://wttr.in?0'
alias webcam='ffmpeg -f v4l2 -video_size 640x480 -i /dev/video0 -c:v libx264 -preset ultrafast /home/bergsm/vids/webcam.mp4'
alias ir='ffmpeg -f v4l2 -video_size 640x480 -i /dev/video2 -c:v libx264 -preset ultrafast /home/bergsm/vids/webcam.mp4'
alias wifi='sudo wifi-menu'
alias pachist='cat /var/log/pacman.log | grep installed'
alias screenshot='maim -s ~/pics/screenshots/$(date '+%b%d%Y_%H%M').png'
alias screenshotcopy='maim -s | xclip -selection clipboard -t image/png'
alias sscp='maim -s | xclip -selection clipboard -t image/png'
alias testwifi='ping 8.8.8.8'
alias open='xdg-open'
alias openvpn='sudo openvpn'
#alias vpnhome='sudo openvpn $HOME/vpn/home.conf'
alias vpnhome='sudo openvpn $HOME/vpn/motile.conf'
alias killvpn='sudo killall openvpn'
alias bton='bluetoothctl power on'
alias btoff='bluetoothctl power off'
alias docker='sudo docker'
#alias flameshot='flameshot gui'
alias audio='pavucontrol'
alias moni-xbox='sudo ddcutil setvcp 60 0x12'
#alias moni-ext='sudo ddcutil setvcp 60 0x11'
#alias moni-redhat='sudo ddcutil setvcp 60 0x10; sudo usbip detach -p 00'
alias moni-redhat='sudo ddcutil setvcp 60 0x10'
alias moni_bright='sudo ddcutil setvcp 10 80'
alias moni_dim='sudo ddcutil setvcp 10 0'
alias gdb='gdb --args'
alias logout='i3-msg exit'
alias gif='gifview -a'
alias cppman='sudo cppman'
alias valgrind_full='valgrind --leak-check=full --error-exitcode=1 --tool=memcheck --track-origins=yes --errors-for-leak-kinds=definite --show-leak-kinds=definite'
#TODO
alias startjerb='vboxmanage startvm Fedora'
alias savejerb='vboxmanage controlvm Fedora savestate'
alias quitjerb='vboxmanage controlvm Fedora poweroff'
alias resetjerb='vboxmanage controlvm Fedora reset'
alias headphones='echo -e "connect 14:3F:A6:C4:51:F4" | bluetoothctl'
alias hotspot='nmcli dev wifi connect Pixel_5028 password Bevo4life!'
#alias antlr='antlr4'


# Import the colors.
. "${HOME}/.cache/wal/colors.sh"

# Create the alias.
#alias dmenu='dmenu_run -nb "$color0" -nf "$color15" -sb "$color1" -sf "$color15"'
alias dmen='dmenu_run -nb "$color0" -nf "$color15" -sb "$color1" -sf "$color15"'

LS_COLORS="ex=32"

aur() {
    git clone https://aur.archlinux.org/"$1".git
}

back() {
    nohup $1 >/dev/null 2>&1 &
}

reinc() {
    killall $1
    nohup $1 >/dev/null 2>&1 &
}

pdflatex() {
    pdflatex $1
    wait 3
    rm $1.log $1.aux
}

stopx() {
    #bash /home/bergsm/pics/shutdown2/shutdown.sh > /dev/null 2>&1
    i3-msg exit
    sudo chvt 1
}

spool_print() {
    lp -o media=A8 $1
}

#alias lock='(bash /home/bergsm/pics/shutdown2/shutdown.sh lock & > /dev/null 2>&1)'
#alias lock='multilockscreen -l blur > /dev/null 2>&1'

set -o vi
bind -m vi-command 'Control-l: clear-screen'
bind -m vi-insert 'Control-l: clear-screen'



#PS1='[\u@\h \W]\$ '
#PS1="\n\e[38;5;7m\u\e[38;5;256m@\e[38;5;239m\h:\e[m\e[38;5;4m\w\e[m\e[0;90m\$(parse_git_branch)\e[m \n\$"
PS1="\n\e[38;5;7m\u\e[38;5;4m@\e[38;5;239m\h:\e[m\e[38;5;4m\w\e[m\e[0;90m\$(parse_git_branch)\e[m \n\$"

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

WWW_HOME=https://www.google.com; export WWW_HOME

# pywal
#setsid wal -i ~/pics/startup/hacker-87.png
(cat ~/.cache/wal/sequences &)
. "$HOME/.cargo/env"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/shawn/prog/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/shawn/prog/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/shawn/prog/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/shawn/prog/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

