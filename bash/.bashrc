
#!/usr/bin/bash
# shellcheck disable=SC1090

# If not running interactively, don't do anything
case $- in
*i*) ;; # interactive
*) return ;; 
esac

# ---------------------- local utility functions ---------------------

_have()      { type "$1" &>/dev/null; }
_source_if() { [[ -r "$1" ]] && source "$1"; }

# ----------------------- environment variables ----------------------
#                           (also see envx)

export USER="$(whoami)"
export GITUSER="mrbooshehri"
export REPOS="$HOME/Repos"
export GHREPOS="$REPOS/github.com/$GITUSER"
export DOTFILES="$GHREPOS/dot"
export SCRIPTS="$DOTFILES/scripts"
export SNIPPETS="$DOTFILES/snippets"
export HELP_BROWSER=lynx
export DESKTOP="$HOME/Desktop"
export DOCUMENTS="$HOME/Documents"
export DOWNLOADS="$HOME/Downloads"
export TEMPLATES="$HOME/Templates"
export PUBLIC="$HOME/Public"
export PRIVATE="$HOME/Private"
export PICTURES="$HOME/Pictures"
export MUSIC="$HOME/Music"
export VIDEOS="$HOME/Videos"
export PDFS="$DOCUMENTS/PDFS"
export NOTES="$DOCUMENTS/Notes"
export HDD="/mnt/1TB"
export EXDOCUMENTS="$HDD/Documents"
export EXDOWNLOADS="$HDD/Downloads"
export EXPICTURES="$HDD/Pictures"
export EXMUSIC="$HDD/Music"
export EXVIDEOS="$HDD/Videos"
export VIRTUALMACHINES="$HDD/$EXDOCUMENTS/Virtual\ Machines"
export WORKSPACES="$HOME/Workspaces" # container home dirs for mounting
export ZETDIR="$GHREPOS/zet"
export CLIP_DIR="$VIDEOS/Clips"
export CLIP_VOLUME=0
export CLIP_SCREEN=0
export TERM=xterm-256color
export HRULEWIDTH=73
export EDITOR=vi
export VISUAL=vi
export EDITOR_PREFIX=vi
export GOPRIVATE="github.com/$GITUSER/*,gitlab.com/$GITUSER/*"
export GOPATH="$HOME/.local/share/go"
export GOBIN="$HOME/.local/bin"
export LESS_TERMCAP_mb="[35m" # magenta
export LESS_TERMCAP_md="[33m" # yellow
export LESS_TERMCAP_me="" # "0m"
export LESS_TERMCAP_se="" # "0m"
export LESS_TERMCAP_so="[34m" # blue
export LESS_TERMCAP_ue="" # "0m"
export LESS_TERMCAP_us="[4m"  # underline

[[ -d /.vim/spell ]] && export VIMSPELL=("$HOME/.vim/spell/*.add")

# ------------------------------- pager ------------------------------

if [[ -x /usr/bin/lesspipe ]]; then
  export LESSOPEN="| /usr/bin/lesspipe %s";
  export LESSCLOSE="/usr/bin/lesspipe %s %s";
fi

# ----------------------------- dircolors ----------------------------

if _have dircolors; then
  if [[ -r "$HOME/.dircolors" ]]; then
    eval "$(dircolors -b "$HOME/.dircolors")"
  else
    eval "$(dircolors -b)"
  fi
fi

# ------------------------------- path -------------------------------

pathappend() {
  declare arg
  for arg in "$@"; do
    test -d "$arg" || continue
    PATH=${PATH//":$arg:"/:}
    PATH=${PATH/#"$arg:"/}
    PATH=${PATH/%":$arg"/}
    export PATH="${PATH:+"$PATH:"}$arg"
  done
} && export pathappend

pathprepend() {
  for arg in "$@"; do
    test -d "$arg" || continue
    PATH=${PATH//:"$arg:"/:}
    PATH=${PATH/#"$arg:"/}
    PATH=${PATH/%":$arg"/}
    export PATH="$arg${PATH:+":${PATH}"}"
  done
} && export pathprepend

# remember last arg will be first in path
pathprepend \
  "$HOME/.local/bin" \
  "$SCRIPTS" 

pathappend \
  /usr/local/bin \
  /usr/local/sbin \
  /usr/sbin \
  /usr/bin \
  /sbin \
  /bin

# ------------------------------ cdpath ------------------------------

#export CDPATH=".:$GHREPOS:$DOT:$REPOS:/media/$USER:$HOME"

# ------------------------ bash shell options ------------------------

shopt -s checkwinsize
shopt -s expand_aliases
shopt -s globstar
shopt -s dotglob
shopt -s extglob
shopt -s cdspell

# ------------------------------ history -----------------------------

export HISTCONTROL=ignoreboth
export HISTSIZE=5000
export HISTFILESIZE=10000

set -o vi
shopt -s histappend

# --------------------------- smart prompt ---------------------------
#                 (keeping in bashrc for portability)

PROMPT_LONG=20
PROMPT_MAX=95
PROMPT_AT=@

# Bash Colors 
# Regular
#   Value 	Color
#\e[0;30m 	Black
#\e[0;31m 	Red
#\e[0;32m 	Green
#\e[0;33m 	Yellow
#\e[0;34m 	Blue
#\e[0;35m 	Purple
#\e[0;36m 	Cyan
# \e[0;37m 	White
# Bold
# Value 	Color
# \e[1;30m 	Black
# \e[1;31m 	Red
# \e[1;32m 	Green
# \e[1;33m 	Yellow
# \e[1;34m 	Blue
# \e[1;35m 	Purple
# \e[1;36m 	Cyan
# \e[1;37m 	White
# Backgrond
#Value 	Color
#\e[40m 	Black
#\e[41m 	Red
#\e[42m 	Green
#\e[43m 	Yellow
#\e[44m 	Blue
#\e[45m 	Purple
#\e[46m 	Cyan
#\\e[47m 	White
# High Intensty
# Value 	Color
#\e[0;90m 	Black
#\e[0;91m 	Red
#\e[0;92m 	Green
#\e[0;93m 	Yellow
#\e[0;94m 	Blue
#\e[0;95m 	Purple
#\e[0;96m 	Cyan
#\e[0;97m 	White
# Bold High Intensty
# Value 	Color
#\e[1;90m 	Black
#\e[1;91m 	Red
#\e[1;92m 	Green
#\e[1;93m 	Yellow
#\e[1;94m 	Blue
#\e[1;95m 	Purple
#\e[1;96m 	Cyan
#\e[1;97m 	White
# High Intensty backgrounds
# Value 	Color
#\e[0;100m 	Black
#\e[0;101m 	Red
#\e[0;102m 	Green
#\e[0;103m 	Yellow
#\e[0;104m 	Blue
#\e[0;105m 	Purple
#\e[0;106m 	Cyan
#\e[0;107m 	White
# Reset
# Value 	Color
#\e[0m 	Reset


__ps1() {
  local P='$' dir="${PWD##*/}" B countme short long double\
    r='\[\e[31m\]' g='\[\e[30m\]' h='\[\e[34m\]' \
    u='\[\e[33m\]' p='\[\e[34m\]' w='\[\e[35m\]' \
    b='\[\e[36m\]' x='\[\e[0m\]'

  [[ $EUID == 0 ]] && P='#' && u=$r && p=$u # root
  [[ $PWD = / ]] && dir=/
  [[ $PWD = "$HOME" ]] && dir='~'

  B=$(git branch --show-current 2>/dev/null)
  [[ $dir = "$B" ]] && B=.
  countme="$USER$PROMPT_AT$(hostname):$dir($B)\$ "

  [[ $B = master || $B = main ]] && b="$r"
  [[ -n "$B" ]] && B="$w($b$B$w)"

  short="$u\u$g$PROMPT_AT$h\h$g:$w$dir$B$p$P$x "
  long="$w╔ $u\u$g$PROMPT_AT$h\h$g:$w$dir$B\n$w╚ $p$P$x "
  double="$w╔ $u\u$g$PROMPT_AT$h\h$g:$w$dir\n$w║ $B\n$w╚ $p$P$x "

  if (( ${#countme} > PROMPT_MAX )); then
    PS1="$double"
  elif (( ${#countme} > PROMPT_LONG )); then
    PS1="$long"
  else
    PS1="$short"
  fi
}
PROMPT_COMMAND="__ps1"

# ------------------------------ aliases -----------------------------
#      (use exec scripts instead, which work from vim and subprocs)

unalias -a
alias dot='cd $DOTFILES'
alias scripts='cd $SCRIPTS'
alias snippets='cd $SNIPPETS'
alias ls='ls --color=auto --group-directories-first'
alias free='free -h'
alias df='df -h'
alias rm='rm -i'
alias mv='mv -i'
alias chmox='chmod +x'
alias temp='cd $(mktemp -d)'
alias view='vi -R' # which is usually linked to vim
alias clear='printf "\e[H\e[2J"'
alias grep="grep -P"
alias autoremove="sudo pacman -Rns $(pacman -Qdtq)"
alias ..="cd .."
alias :q="exit"
alias '?'=duck
alias '??'=google
alias '???'=brave

_have vim && alias vi=vim

# ----------------------------- keyboard -----------------------------

_have setxkbmap && test -n "$DISPLAY" && \
  setxkbmap -option caps:escape &>/dev/null

## ----------------------------- functions ----------------------------

clonerepo() {
  local repo="$1"
  local repo="${repo#https://github.com/}"
  local user="${repo%%/*}"
  local name="${repo##*/}"
  local userd="$REPOS/github.com/$user"
  local path="$userd/$name"
  [[ -d "$path" ]] && cd "$path" && return
  mkdir -p "$userd"
  cd "$userd"
  if [[ "$user" == "$GITUSER" ]]; then
    git clone "git@github.com:$GITUSER/$name.git"
  else 
    git clone "https://github.com/$user/$name.git"
  fi
  cd "$name"
} && export -f clonerepo

extr()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1     ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

source $DOTFILES/snippets/dirFileHelper	# Directory and file helper
source $DOTFILES/snippets/transfersh		# transfersh
source $DOTFILES/snippets/cambinary		# seach in cambridge dictionary
source $DOTFILES/snippets/haste		# hastebin online clipboard
source $DOTFILES/snippets/markdownPreview # hastebin online clipboard


# ------------- source external dependencies / completion ------------

owncomp=(
  pdf md yt gl auth config sshkey 
)

for i in "${owncomp[@]}"; do complete -C "$i" "$i"; done

_have gh && . <(gh completion -s bash)
_have pandoc && . <(pandoc --bash-completion)
_have docker && _source_if "$HOME/.local/share/docker/completion" # d
_have docker-compose && complete -F _docker_compose dc # dc 
