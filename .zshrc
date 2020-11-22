PROMPT="[%n@%m]:%1~%(!.# .%% )"
RPROMPT="[%d]"

## 補完関数を増やす
fpath=($ZDOTDIR/functions/completions/src(N-/) $ZDOTDIR/functions/misc-completion(N-/) ${fpath})

autoload -Uz compinit
compinit -u

HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

setopt auto_cd
setopt auto_menu
setopt auto_pushd
setopt complete_aliases
setopt correct
setopt extended_glob
setopt hist_ignore_all_dups
setopt hist_ignore_dups
setopt hist_no_store
setopt hist_save_no_dups
setopt list_packed
setopt notify
setopt nolistbeep
setopt nonomatch
setopt print_eight_bit
setopt pushd_ignore_dups
setopt share_history
setopt transient_rprompt

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
