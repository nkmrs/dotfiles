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

# my environment
[ -e ~/.zshenv.local ] && source ~/.zshenv.local
