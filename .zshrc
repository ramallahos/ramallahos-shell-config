HISTFILE=~/.zsh_history
HISTSIZE=20000
SAVEHIST=20000
fpath=(~/.zsh/functions/ $fpath)
fpath=($HOME/.zsh/functions $fpath)
e_normal=`echo -e "¥033[0;30m"`
e_RED=`echo -e "¥033[1;31m"`
e_BLUE=`echo -e "¥033[1;36m"`
if [ -d "$HOME/.bin" ] ;
  then PATH="$HOME/.bin:$PATH"
fi
if [ -d "$HOME/.local/bin" ] ;
  then PATH="$HOME/.local/bin:$PATH"
fi

if [ -d "$HOME/Applications" ] ;
  then PATH="$HOME/Applications:$PATH"
fi
PATH="$HOME/.emacs.d/bin:$PATH"
PATH=$PATH:$HOME/.rvm/bin
shopt -s autocd
shopt -s cdspell
shopt -s cmdhist
shopt -s dotglob
shopt -s histappend
shopt -s expand_aliases
shopt -s checkwinsize
export TERM="xterm-256color"
export HISTORY_IGNORE="(ls|cd|pwd|exit|sudo reboot|history|cd -|cd ..)"
bindkey -v
[[ $- != *i* ]] && return
case ${TERM} in
  xterm*|rxvt*|Eterm*|aterm|kterm|gnome*|alacritty|st|konsole*)
    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\007"'
        ;;
  screen*)
    PROMPT_COMMAND='echo -ne "\033_${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\033\\"'
    ;;
esac
SAVEIFS=$IFS
IFS=$(echo -en "\n\b")
function extract {
 if [ -z "$1" ]; then
    echo "Usage: extract <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz>"
    echo "       extract <path/file_name_1.ext> [path/file_name_2.ext] [path/file_name_3.ext]"
 else
    for n in "$@"
    do
      if [ -f "$n" ] ; then
          case "${n%,}" in
            *.cbt|*.tar.bz2|*.tar.gz|*.tar.xz|*.tbz2|*.tgz|*.txz|*.tar)
                         tar xvf "$n"       ;;
            *.lzma)      unlzma ./"$n"      ;;
            *.bz2)       bunzip2 ./"$n"     ;;
            *.cbr|*.rar)       unrar x -ad ./"$n" ;;
            *.gz)        gunzip ./"$n"      ;;
            *.cbz|*.epub|*.zip)       unzip ./"$n"       ;;
            *.z)         uncompress ./"$n"  ;;
            *.7z|*.arj|*.cab|*.cb7|*.chm|*.deb|*.dmg|*.iso|*.lzh|*.msi|*.pkg|*.rpm|*.udf|*.wim|*.xar)
                         7z x ./"$n"        ;;
            *.xz)        unxz ./"$n"        ;;
            *.exe)       cabextract ./"$n"  ;;
            *.cpio)      cpio -id < ./"$n"  ;;
            *.cba|*.ace)      unace x ./"$n"      ;;
            *.Z)         uncompress $1;;
            *.tar.zst)   tar xf $1    ;;
            *)
                         echo "extract: '$n' - unknown archive method"
                         return 1
                         ;;
          esac
      else
          echo "'$n' - file does not exist"
          return 1
      fi
    done
fi
}
IFS=$SAVEIFS
SUDO_PROMPT="PROCEED WITH CAUTION...PASSWORD:"
autoload -U compinit
zmodload zsh/complist
compinit
_comp_options+=(globdots)
bindkey -v
export KEYTIMEOUT=1
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char
[ -f "$HOME/.config/shortcutrc" ] && source "$HOME/.config/shortcutrc"
[ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc"
[ -f "$HOME/.config/promt_prefix"] && source "$HOME/.config/promt_prefix"
[ -f "$HOME/.config/promt"] && source "$HOME/.config/promt"
autoload -U promptinit; promptinit
eval "$(starship init zsh)"

ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
HIST_STAMPS="mm/dd/yyyy"
export MANPATH="/usr/local/man:$MANPATH"
export LANG=en_US.UTF-8
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

setopt GLOB_DOTS
unsetopt SHARE_HISTORY
[[ $- != *i* ]] && return
export HISTCONTROL=ignoreboth:erasedups
export VISUAL='emacsclient -c -a "emacs"'
#PS1='[\u@\h \W]\$ '
[[ -f ~/.zshrc-personal ]] && . ~/.zshrc-personal
if [ -r ~/.zshrc -a -r ~/.zshrc.global -a ! -r ~/.zshrc.local ] ; then
    printf '-!-\n'
    printf '-!- Looks like you are using the old zshrc layout of grml.\n'
    printf '-!- Please read the notes in the grml-zsh-refcard, being'
    printf '-!- available at: http://grml.org/zsh/\n'
    printf '-!-\n'
    printf '-!- If you just want to get rid of this warning message execute:\n'
    printf '-!-        touch ~/.zshrc.local\n'
    printf '-!-\n'
fi
setopt nonomatch
setopt printexitvalue
setopt interactivecomments
zstyle ':completion:*' completer _complete _correct _approximate expand prefix suffix _expand_alias menu select
export MANWIDTH=${MANWIDTH:-80}
cdpath=(.. ~)
stty erase "^?"

colorscript random







# a=30
# #x=$(( RANDOM % $a )) ## if you uncomment this line then x starts from 0 and ends at a-1
# x=$(seq $a | shuf -n 1)
# if [ $x = 1 ];
# then
#     neofetch
# elif [ $x = 2 ];
# then
#     pfetch
# elif [ $x = 3 ];
# then
#     fm6000
# elif [ $x = 4 ];
# then
#     curl rate.sx
# elif [ $x = 5 ];
# then
#     cornyjokes
# elif [ $x = 6 ];
# then
#     whatami
# elif [ $x = 7 ];
# then
#     watch -n1 "date '+%D%n%T'|figlet -k" | lolcat
# elif [ $x = 8 ];
# then
#     fortune | cowsay -f sodomized
# elif [ $x = 9 ];
# then
#     fortune | cowsay -f $(ls /usr/share/cows/|shuf -n 1) | lolcat
# elif [ $x = 10 ];
# then
#     doge
# elif [ $x = 11 ];
# then
#     asciiquarium | lolcat
# elif [ $x = 12 ];
# then
#     fortune | xcowsay
# elif [ $x = 13 ];
# then
#     figlet I use Arch BTW | lolcat
# elif [ $x = 14 ];
# then
#     colorscript random
# elif [ $x = 15 ];
# then
#     fortune | nms | lolcat
# elif [ $x = 16 ];
# then
#     aafire
# elif [ $x = 17 ];
# then
#     sl -F | lolcat
# elif [ $x = 18 ];
# then
#     yes I Use Arch BTW | lolcat
# elif [ $x = 19 ];
# then
#     oneko
# elif [ $x = 20 ];
# then
#     fortune | espeak
# elif [ $x = 21 ];
# then
#     man baby | lolcat
# elif [ $x = 22 ];
# then
#     for i in {1..12}; do for j in $(seq 1 $i); do echo -ne $iÃ—$j=$((i*j))\\t;done; echo;done | lolcat
# elif [ $x = 23 ];
# then
#     echo "I Use Arch BTW" | pv -qL 10 | lolcat
# elif [ $x = 24 ];
# then
#     hollywood
# elif [ $x = 25 ];
# then
#     fortune | ponysay
# elif [ $x = 26 ];
# then
#     genact
# elif [ $x = 27 ];
# then
#     echo 2
# else
#     true
# fi

