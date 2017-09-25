# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install

# プロンプト
# 1行表示
PROMPT="%F{cyan}%m:%~ %n$ %f"

#for zsh-completions
fpath=(/usr/local/share/zsh-completions $fpath)
autoload -Uz compinit
compinit -u
autoload -Uz colors
colors
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
alias md2pdf='pandoc -f markdown -V documentclass=ltjarticle -V geometry:margin=1in --latex-engine=lualatex'
alias md2pdf-ref='pandoc -f markdown -V documentclass=ltjarticle -V geometry:margin=1in --latex-engine=lualatex --filter pandoc-crossref'
# C で標準出力をクリップボードにコピーする
# mollifier delta blog : http://mollifier.hatenablog.com/entry/20100317/p1
alias -g C='| pbcopy'

export PATH=/opt/local/bin:/opt/local/sbin:~/bin:$PATH
export GOPATH=$HOME/.go/
export PATH=$HOME/.rbenv/bin:~/Library/Python/2.7/bin:~/.go/bin:$PATH
export PATH=/Applications/microchip/xc8/v1.35/bin:$PATH
export PATH=/usr/local/share/git-core/contrib/diff-highlight:$PATH
export PATH=$HOME/isrb2:$PATH
export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig
eval "$(rbenv init -)"
