#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return



export HISTSIZE=10000
export EDITOR=vim
export OPENCV_LOG_LEVEL=ERROR
OPENCV_LOG_LEVEL=ERROR
export HISTCONTROL=ignoreboth:erasedups
alias ls='ls --color=auto'
alias perm="stat -c '%A %a %h %U %G %s %y %n' *| sed 's/\.[[:digit:]]\+[ ]\+-[[:digit:]]\+/ /'"
alias sudo='sudo -E'
alias grep='grep --color=auto'
alias vi='vim'
alias svi='sudo -E vim'
alias sudo='sudo -E'
alias pacman='sudo pacman'
alias makepkg='makepkg -si'
alias dnsrecon='/home/bergsm/prog/dnsrecon/dnsrecon.py'
alias batt='acpi'
alias find='sudo find'
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
alias btbuds='bluetoothctl connect 70:26:05:CB:89:54'
alias btbudsx='bluetoothctl disconnect 70:26:05:CB:89:54'
alias arctis='bluetoothctl connect 28:9A:4B:21:87:7E'
alias arctisx='bluetoothctl disconnect 28:9A:4B:21:87:7E'
alias mouse='bluetoothctl connect ED:F3:84:65:9B:EC'
alias mousex='bluetoothctl disconnect ED:F3:84:65:9B:EC'
alias testwifi='ping 8.8.8.8'
alias open='xdg-open'
alias openvpn='sudo openvpn'
alias vpnhome='sudo openvpn $HOME/vpn/home.conf'
alias killvpn='sudo killall openvpn'
alias bton='bluetoothctl power on'
alias btoff='bluetoothctl power off'
alias docker='sudo docker'
alias flameshot='flameshot gui'
alias audio='pavucontrol'
alias moni-xbox='sudo ddcutil setvcp 60 0x12'
#alias moni-ext='sudo ddcutil setvcp 60 0x11'
alias moni-redhat='sudo ddcutil setvcp 60 0x11'
alias moni-mac='sudo ddcutil setvcp 60 0x0f'
alias gdb='gdb --args'


#dmenu
# Import the colors.
. "${HOME}/.cache/wal/colors.sh"

# Create the alias.
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

#alias lock='(bash /home/bergsm/pics/shutdown2/shutdown.sh lock & > /dev/null 2>&1)'
alias lock='multilockscreen -l blur > /dev/null 2>&1'

set -o vi

. "${HOME}/.cache/wal/colors.sh"


#PS1='[\u@\h \W]\$ '
PS1="\n\e[38;5;7m\u\e[38;5;256m@\e[38;5;239m\h:\e[m\e[38;5;4m\w\e[m\e[0;90m\$(parse_git_branch)\e[m \n\$"

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

WWW_HOME=https://www.google.com; export WWW_HOME

# pywal
#setsid wal -i ~/pics/startup/hacker-87.png
(cat ~/.cache/wal/sequences &)
