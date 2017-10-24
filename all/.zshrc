# prompt
if [ "`whoami`" = "root" ] ; then
    p_color=blue
else
    p_color=yellow
fi
PROMPT=$'%B%F{${p_color}}%n@%M%f%b %3F%~%f %1v\n$ '

# env
export LANG=ja_JP.UTF-8
export EDITOR=vim

export CONSCRIPT_HOME="$HOME/.conscript"
export CONSCRIPT_OPTS="-XX:MaxPermSize=512M -Dfile.encoding=UTF-8"

# PATH
for i in sbin bin opt/bin .rbenv/bin .conscript/bin anaconda3/bin
do
  USERPATH=$USERPATH:$HOME/$i
done
PATH=$USERPATH:$PATH

# alias
. ~/.aliases

# ***env
if /usr/bin/which rbenv > /dev/null 2>&1 ; then
  eval "$(rbenv init -)"
fi

# my environment
[ -e ~/.zshrc.local ] && source ~/.zshrc.local
