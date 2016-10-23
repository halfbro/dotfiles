# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt incappendhistory autocd extendedglob nomatch
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/matt/.zshrc'

autoload -Uz compinit
autoload -U history-search-end
compinit
# End of lines added by compinstall

# Use neovim as editor of choice
export EDITOR=nvim
PATH=$PATH:/home/matt/.gem/ruby/2.3.0/bin
export PATH
export XDG_CONFIG_HOME=/home/matt/.config
export STEAM_FRAME_FORCE_CLOSE=1

# Use vim style keybinds by default
bindkey -v

# Bind up/down to search history using current text
# Also add the history-search-end function
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end

bindkey "^[[A" history-beginning-search-backward-end
bindkey "^[[B" history-beginning-search-forward-end

# Match files from both ends
setopt completeinword

# Match case insensitively
zstyle ':completion:*' matcher-list 'm:{a-zA-z}={A-Za-z}'
setopt auto_list

autoload -U colors && colors
PROMPT="%n@%~ > "

alias vim=nvim
alias XResUpdate="xrdb -merge ~/.Xresources"
alias ls="ls --color=always"
alias "zathuralast"='zathura /home/matt/Downloads/"$(ls -lt /home/matt/Downloads | head -n 2 | tail -c +62)"'

# alias tis100="~/GOG\ Games/TIS\ 100/start.sh"
alias Parkitect="~/Parkitect/Parkitect.x86_64"

insert_sudo () { zle beginning-of-line; zle -U "sudo " }
zle -N insert-sudo insert_sudo
bindkey "^[s" insert-sudo

bindkey "^?" backward-delete-char

alias eve="WINEARCH=win32 WINEPREFIX=~/Wine/eve32 wine ~/Wine/eve32/dosdevices/c:/EVE/Launcher/evelauncher.exe"

transfer() { if [ $# -eq 0 ]; then echo "No arguments specified. Usage:\necho transfer /tmp/test.md\ncat /tmp/test.md | transfer test.md"; return 1; fi 
tmpfile=$( mktemp -t transferXXX ); if tty -s; then basefile=$(basename "$1" | sed -e 's/[^a-zA-Z0-9._-]/-/g'); curl --progress-bar --upload-file "$1" "https://transfer.sh/$basefile" >> $tmpfile; else curl --progress-bar --upload-file "-" "https://transfer.sh/$1" >> $tmpfile ; fi; cat $tmpfile; rm -f $tmpfile; }; alias transfer=transfer
