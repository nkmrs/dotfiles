# env
export LANG=ja_JP.UTF-8
export EDITOR=vim

export GOPATH=$HOME/go
export LS_COLORS="di=01;35:ow=01;31:tw=01;31"

export CONSCRIPT_HOME="$HOME/.conscript"
export CONSCRIPT_OPTS="-XX:MaxPermSize=512M -Dfile.encoding=UTF-8"

# PATH
for i in sbin bin opt/bin .rbenv/bin .conscript/bin anaconda3/bin
do
  USERPATH=$USERPATH:$HOME/$i
done
PATH=$USERPATH:$GOPATH/bin:$PATH

# my environment
[ -e ~/.zshenv.local ] && source ~/.zshenv.local
