PROMPT="[%n@%m]:%1~%(!.# .%% )"
RPROMPT="[%d]"

## 補完関数を増やす
fpath=($ZDOTDIR/functions/completions/src(N-/) $ZDOTDIR/functions/misc-completion(N-/) ${fpath})

autoload -Uz compinit
compinit -u

HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt share_history
setopt auto_pushd
setopt pushd_ignore_dups
setopt complete_aliases
setopt list_packed
setopt nolistbeep
setopt transient_rprompt
setopt hist_no_store
setopt auto_menu
setopt extended_glob
setopt notify
setopt nonomatch

bindkey -e

## 重複パスを登録しない
typeset -U path cdpath fpath manpath

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z} r:|[-_.]=**'

# load .zshrc_*
[ -f $ZDOTDIR/.zshrc_`uname`  ] && . $ZDOTDIR/.zshrc_`uname`
[ -f $ZDOTDIR/.zshrc_local    ] && . $ZDOTDIR/.zshrc_local
[ -f $ZDOTDIR/.zshrc_external ] && . $ZDOTDIR/.zshrc_external
[ -f $ZDOTDIR/.zshrc_alias    ] && . $ZDOTDIR/.zshrc_alias
[ -f $ZDOTDIR/.zshrc_misc     ] && . $ZDOTDIR/.zshrc_misc
