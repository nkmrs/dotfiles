autoload -U compinit
compinit 
autoload -Uz colors
colors
setopt auto_pushd
setopt correct
setopt cdable_vars
setopt prompt_subst
autoload -Uz add-zsh-hook
autoload -Uz vcs_info
autoload -Uz zmv

# key bind
bindkey -e

#入力途中の履歴補完
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^p" history-beginning-search-backward-end
bindkey "^n" history-beginning-search-forward-end

# history
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_dups     # ignore duplication command history list
setopt share_history        # share command history data 
setopt histignorespace
setopt hist_no_store

# git setting
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "+"    # 適当な文字列に変更する
zstyle ':vcs_info:git:*' unstagedstr "-"  # 適当の文字列に変更する
zstyle ':vcs_info:git:*' formats '[%b]%c%u'
zstyle ':vcs_info:git:*' actionformats '[%b|%a]%c%u'
_update_vcs_info_msg() {
    psvar=()
    LANG=en_US.UTF-8 vcs_info
    psvar[1]="$vcs_info_msg_0_"
}
add-zsh-hook precmd _update_vcs_info_msg

# prompt
if [ "`whoami`" = "root" ] ; then
    p_color=blue
else
    p_color=yellow
fi
PROMPT=$'%B%F{${p_color}}%n@%M%f%b %3F%~%f %1v\n$ '

# peco
function peco-history-selection() {
    BUFFER=`history -n 1 | tac  | awk '!a[$0]++' | peco`
    CURSOR=$#BUFFER
    zle reset-prompt
}
zle -N peco-history-selection
bindkey '^R' peco-history-selection

# conoha
if [ -r ~/.conoha.conf ] ; then
    . ~/.conoha.conf
fi

# rbenv
if /usr/bin/which rbenv > /dev/null 2>&1 ; then
  eval "$(rbenv init -)"
fi

# alias
. ~/.aliases

# my environment
[ -e ~/.zshrc.local ] && source ~/.zshrc.local
