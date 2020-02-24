# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install

#for zsh-completions
fpath=(/usr/local/share/zsh-completions $fpath)
autoload -Uz compinit
compinit -u
autoload -Uz colors
colors
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git:*' formats '%c%u%b'
zstyle ':vcs_info:git:*' actionformats '%c%u%b|%a'
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

setopt print_eight_bit
setopt ignore_eof
setopt interactive_comments
setopt auto_cd
setopt pushd_ignore_dups
setopt share_history
setopt hist_ignore_all_dups
setopt hist_reduce_blanks
setopt extended_glob

alias vv="g++ --std=c++11 -O2 -Wall"
alias vi="vim"
alias ls='ls -Ga'
alias grep='grep -E --color=auto'
alias mkdir='mkdir -p'
alias sudo='sudo '
alias rot13='tr A-Za-z N-ZA-Mn-za-m'
alias g='cd $(ghq root)/$(ghq list | peco)'
alias gh='hub browse $(ghq list | peco | cut -d "/" -f 2,3)'
# C で標準出力をクリップボードにコピーする
# mollifier delta blog : http://mollifier.hatenablog.com/entry/20100317/p1
alias -g C='| pbcopy'

# プロンプト
# 1行表示
function left-prompt {
  FIRST='178m%}'
  FIRST_B='237m%}'
  SECOND='007m%}'
  SECOND_B='067m%}'

  FG='%{[38;5;'
  BG='%{[30;48;5;'
  RESET='%{[0m%}'
  USER_AND_HOST="${BG}${FIRST_B}${FG}${FIRST}"
  DIR="${BG}${SECOND_B}${FG}${SECOND}"

  echo "${USER_AND_HOST}%n@%m ${BG}${SECOND_B}${FG}${FIRST_B} ${DIR}%~ \$${RESET}${FG}${SECOND_B} ${RESET}"
}
PROMPT=`left-prompt`
RPROMPT="%(?..%F{red}-%?-)%1(v|%F{green}[%F{yellow}%1v%F{green}]%f|)"
local _cmd=''
local _lastdir=''
preexec() {
  _cmd="$1"
  _lastdir="$PWD"
}
update_vcs_info() {
  psvar=()
  LANG=en_US.UTF-8 vcs_info
  [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}
precmd() {
  _r=$?
  case "${_cmd}" in
    git*|stg*) update_vcs_info ;;
    *) [ "${_lastdir}" != "$PWD" ] && update_vcs_info ;;
  esac
  return $_r
}

if [ "$(uname)" = 'Darwin' ]; then
  export LSCOLORS=xbfxcxdxbxegedabagacad
  alias ls='ls -G'
else
  alias ls='ls --color=auto'
fi

funciton md2pdf (){ pandoc -f markdown -V documentclass=ltjarticle -V geometry:margin=1in --pdf-engine=lualatex $@ -o ${1%.*}.pdf }

funciton md2pdf-ref (){ pandoc -f markdown -V documentclass=ltjarticle -V geometry:margin=1in --pdf-engine=lualatex --filter pandoc-crossref $@ -o ${1%.*}.pdf }

export LANG=ja_JP.UTF-8
export LESSCHARSET=utf-8

export PATH=/opt/local/bin:/opt/local/sbin:~/bin:$PATH
export GOPATH=$HOME/.go/
export PATH=$HOME/.rbenv/bin:~/Library/Python/2.7/bin:~/.go/bin:$PATH
export PATH=$HOME/perl5/bin:$PATH
export PATH=$HOME/.anyenv/bin:$PATH
export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig
eval "$(anyenv init -)"
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
