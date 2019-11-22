# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac


# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
export TERM=xterm-256color     # if it gives an error then
                               # install ncurses-term


function exitstatus {
   EXITSTATUS="$?"
   RED="\[$(tput setaf 1)\]"
   GRN="\[$(tput setaf 2)\]"
   BLU="\[$(tput setaf 81)\]" 
   MAG="\[$(tput setaf 75)\]"
   GRA="\[$(tput setaf 249)\]"

                          
   BOLD="\[\033[1m\]"
   OFF="\[$(tput sgr0)\]" 

   # Store the IP address
   # Uncomment this line if you aren't using the option 2.
   # THEIP=$(dig @resolver1.opendns.com ANY myip.opendns.com +short)
                           
    # Option 1: Show the localhost
    BASEPROMPT="${BOLD}${RED}\u${OFF}@${MAG}\h${OFF} ${BLU}$(pwd)${OFF}"
    # Option 2: show the IP
    # BASEPROMPT="${BOLD}${RED}\u${OFF}@${BOLD}${MAG}$THEIP${OFF} ${BLU}$(pwd)${OFF} "

   if [ "${EXITSTATUS}" -eq 0 ]
   then
       STATUSPROMPT="${BOLD}${GRN}>${OFF}"
   else
       STATUSPROMPT="${BOLD}${RED}>${OFF}"
   fi

   # CHECK IF WE'RE IN A SSH CONNECTION
   # If one of the variables SSH_CLIENT or SSH_TTY is defined, it's an ssh session.
   # If the login shell's parent process name is sshd, it's an ssh session.

   # This will make the prompt get enclosed in [brackets] if the shell is in a 
   # SSH connection.
   if [ -n "$SSH_CLIENT" ]; then
       # - the space between the variables determines the margin
       #   of the prompt
       PS1="${GRA}[${OFF}${BASEPROMPT}${GRA}]${OFF} ${STATUSPROMPT} "
   else
       PS1="${BASEPROMPT} ${STATUSPROMPT} "
   fi

#   if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
#       SESSION_TYPE=remote
#       # many other tests omitted
#   else
#       case $(ps -o comm= -p $PPID) in
#       sshd|*/sshd) SESSION_TYPE=remote;;
#       esac
#   fi
#
#   # Now we format the prompt.
#   if [ -n $SESSION_TYPE ]
#   then
#       PS1="${BASEPROMT} ${STATUSPROMPT}"
#   else
#       PS1="${BASEPROMT} [${STATUSPROMPT}]"
#   fi

 }   
                                                                                                                                     
   PROMPT_COMMAND=exitstatus


else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi


unset color_prompt force_color_prompt


# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac




# Commands colors (colors for ls, dir, grep, etc)
# Section moved into .bash_aliases




# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
#alias ll='ls -l'
#alias la='ls -A'
#alias l='ls -CF'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
