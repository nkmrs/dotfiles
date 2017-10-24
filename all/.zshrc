# prompt
if [ "`whoami`" = "root" ] ; then
    p_color=blue
else
    p_color=yellow
fi
PROMPT=$'%B%F{${p_color}}%n@%M%f%b %3F%~%f %1v\n$ '

# my environment
source ~/.dotfiles

[ -e ~/.zshrc.local ] && source ~/.zshrc.local
