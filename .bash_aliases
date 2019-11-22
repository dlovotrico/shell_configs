#!/bin/bash

# terminal title bar
wname() { echo -en "\033]0;$@\007"; }
alias ranger='wname ranger; ranger'
alias ncmpcpp='wname ncmpcpp; ncmpcpp'




# systemd
alias ssysup='sudo systemctl start'
alias ssysdown='sudo systemctl stop'
alias ssysre='sudo systemctl restart'
alias ssyson='sudo systemctl enable'
alias ssysoff='sudo systemctl disable'
alias ssysstat='sudo systemctl status'
alias ssyslsall='sudo systemctl list-units'
alias ssyslstim='sudo systemctl list-timers'
alias ssyslsfail='sudo systemctl --failed'
alias ssyslog='sudo journalctl -xe'

alias sysup='systemctl --user start'
alias sysdown='systemctl --user stop'
alias sysre='systemctl --user restart'
alias syson='systemctl --user enable'
alias sysoff='systemctl --user disable'
alias sysstat='systemctl --user status'
alias syslsall='systemctl --user list-units'
alias syslstim='systemctl --user list-timers'
alias syslsfail='systemctl --user --failed'
alias syslog='journalctl -xe'




# navigation
alias cdd='cd ..'
alias cd2='cd ../..'
alias cd3='cd ../../..'
alias cd4='cd ../../../..'
alias cd5='cd ../../../../..'

md () { mkdir -p "$@" && cd "$@"; }




# grep
# color support
# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi




# vim
alias vim='wname vim; vim'
alias testvim='vim ~/Documents/code/eudyptula/01-helloworld/hello_world.c'
vimp () { vim $( find "$@" -maxdepth 1 -type f ); }




# administration
alias dirsize='du -h -d 1 | sort -rh | less'
alias filesize='du -hS | sort -rh | less'
alias p8='ping -c 3 8.8.8.8'




#ls
alias la='ls -A'
alias lh='ls -alFh'
alias ll='ls -alF'
alias cls="ls -lha --color=always -F --group-directories-first |awk '{k=0;s=0;for(i=0;i<=8;i++){;k+=((substr(\$1,i+2,1)~/[rwxst]/)*2^(8-i));};j=4;for(i=4;i<=10;i+=3){;s+=((substr(\$1,i,1)~/[stST]/)*j);j/=2;};if(k){;printf(\"%0o%0o \",s,k);};print;}'"
alias lstree="ls -R | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/   /' -e 's/-/|/'"





# fix sudo
alias sudo='sudo '
alias sudoe='sudo -E '




# useful for long-running commands: <command>; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\=\s*//;s/[;&|]\s*alert$//'\'')"'

