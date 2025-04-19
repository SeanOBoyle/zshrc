#!/bin/zsh

# For sudo-ing aliases
# https://wiki.archlinux.org/index.php/Sudo#Passing_aliases
alias sudo='sudo '

# Ensure languages are set
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Ensure editor is set
export EDITOR=vim
export SVN_EDITOR=vim

# This fixes using SSH in urxvt
if [[ $TERM == 'rxvt-unicode' ]] ; then
    export TERM='xterm'
fi

#
# OS Detection
#

UNAME=`uname`
UNAME_KERNEL_VERSION=`uname -v`

# Fallback info
CURRENT_OS='Linux'
DISTRO='NA'
DISTRO_REL='current'

if [[ $UNAME == 'Darwin' ]]; then
    CURRENT_OS='OS X'
    DISTRO_REL='current'
elif [[ $UNAME == 'Linux' ]]; then

    if [[ -f /etc/redhat-release ]]; then
        # CentOS or Redhat?
        if grep -q "CentOS" /etc/redhat-release; then
            DISTRO='CentOS'
        else
            DISTRO='RHEL'
        fi

        # Still have some old RHEL distros around -- mark 6,7 as current
        if grep -q "release 7" /etc/redhat-release; then
            DISTRO_REL='current'
        elif grep -q "release 6" /etc/redhat-release; then
            DISTRO_REL='current'
        else
            DISTRO_REL='old'
        fi
    elif [[ $UNAME_KERNEL_VERSION == *rodete* ]]; then
        DISTRO='Rodete'
	DISTRO_REL='current'
    else
        # Assume Ubuntu if it's not RHEL
        DISTRO='Ubuntu'
        DISTRO_REL='current'

        if  [[ $UNAME_KERNEL_VERSION == *"Microsoft"* ]]; then
            DISTRO='UbuntuMicrosoft'
        fi

    fi
else
    DISTRO='Unknown'
    DISTRO_REL='current'
fi

# Setup VirtualEnvWrapper
export WORKON_HOME=$HOME/.virtualenvs

# Set ZDOTDIR if you want to re-home Zsh.
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-$HOME/.config}
export XDG_DATA_HOME=${XDG_DATA_HOME:-$HOME/.local/share}
export XDG_CACHE_HOME=${XDG_CACHE_HOME:-$HOME/.cache}
export ZDOTDIR=${ZDOTDIR:-$XDG_CONFIG_HOME/zsh}

# Ensure path arrays do not contain duplicates.
typeset -gU path fpath

# Set the list of directories that zsh searches for commands.
path=(
  $HOME/{,s}bin(N)
  $HOME/.local/{,s}bin(N)
  /opt/{homebrew,local}/{,s}bin(N)
  /usr/local/{,s}bin(N)
  $path
)
