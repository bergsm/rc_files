PATH=$PATH:$HOME/bin
PATH="~/bin:${PATH}"
export PATH

#calibre commands
PATH="/Volumes/HDD/Apps/calibre.app/Contents/console.app/Contents/MacOS:${PATH}"
export PATH

# locate updatefd command
PATH="/usr/libexec/:${PATH}"
export PATH

# JUNIT framework
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk-9.0.1.jdk/Contents/Home/
export JUNIT_HOME=/Library/JUNIT/junit4.10
export CLASSPATH=$CLASSPATH:$JUNIT_HOME/junit-4.10.jar


# X11
PATH="/usr/X11/bin:${PATH}"
export PATH

# TODO darken file dirs if possible
# change colors of bash ls. Comment out to use default
export CLICOLOR=1
export LSCOLORS=AxBxfxDxcxhxhxCxaCexex

# don't put duplicate lines or lines starting with space in the history
HISTCONTROL=ignoreboth
# Increase history size
HISTSIZE=100000
HISTFILESIZE=100000

# show current time
echo Current time: $(date)
# show current date
# requires weather python script from getWeather project
#weather

# use vim keybindings
set -o vi

parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

#orange
#export PS1="\n\e[1:30m\u@\h:\e[m\e[38;5;130m\w\e[m\e[0;90m\$(parse_git_branch)\e[m \n\$"
#green
#export PS1="\n\e[1:30m\u@\h:\e[m\e[38;5;28m\w\e[m\e[0;90m\$(parse_git_branch)\e[m \n\$"
# blue
#TODO colorize working directory from dark to light
#TODO change color for which git branch (master vs feature)
#TODO flash git branch if change?
#TODO lighten path up a little
export PS1="\n\e[38;5;67m\u\e[38;5;255m@\e[38;5;238m\h:\e[m\e[38;5;67m\w\e[m\e[0;90m\$(parse_git_branch)\e[m \n\$"

alias cp='cp -i'
alias mv='mv -i'
alias vi='vim'
#alias rm='rm -i'
#alias clion='open /Volumes/SSD/Applications/CLion.app'
alias grep='grep --color=auto'
#alias find='find ./ -name'
#TODO find function
#alias python='python3'

# rename function
rename() {
    for i in $1*
    do
        mv "$i" "${i/$1/$2}"
    done
}

# file path function
fp () {
    case "$1" in
        /*) printf '%s\n' "$1";;
    *) printf '%s\n' "$PWD/$1";;
esac
}
