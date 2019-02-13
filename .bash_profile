PATH=$PATH:$HOME/bin

PATH="~/bin:${PATH}"
export PATH

#calibre commands
PATH="/Applications/calibre.app/Contents/console.app/Contents/MacOS:${PATH}"
export PATH

# locate updatefd command
PATH="/usr/libexec/:${PATH}"
export PATH

# Setting PATH for Python 3.6
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}"
export PATH

# change colors of bash prompt. Comment out to use default
export CLICOLOR=1
export LSCOLORS=AxBxfxDxcxhxhxCxaCexex

PATH="/usr/X11/bin:${PATH}"
export PATH


parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}


export PS1="\e[1:30m\u@\h:\e[m\e[38;5;130m\w\e[m\e[0;90m\$(parse_git_branch)\e[m \n\$"
#export PS1="\e[0:37\u@\h:\e[m\e[1;32m\w\e[m\e[1;30m\$(parse_git_branch)\e[m \n\$"

alias cp='cp -i'
alias mv='mv -i'
