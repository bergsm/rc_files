PATH=$PATH:$HOME/bin


alias sudo='sudo -E'

# Setting PATH for Python 3.6
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}"
export PATH

export CLICOLOR=1
exportLSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export PS1="\e[0:31m\u@\h:\e[m\e[0;32m\w\e[m\e[1;34m\$(parse_git_branch)\e[m \n\$"
