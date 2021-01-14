#!/bin/bash
# sorry for hashbang, it's just for correct language determining by npp

# The latest version as installed by the Cygwin Setup program can
# always be found at /etc/defaults/etc/skel/.bashrc
# Modifying /etc/skel/.bashrc directly will prevent
# setup from updating it.

# If not running interactively, don't do anything
# [[ "$-" != *i* ]] && return

# echo "$PATH" | perl -pe 's/:/\n/g'
# echo '===='
# cygpath -pu "$(reg query "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" | grep ' Path' | cut -c30-)" | perl -pe 's/:/\n/g'
# cygpath -pu "`reg query "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" | grep ' Path' | cut -c30-`" | perl -pe 's/:/\n/g'


# fix '$PATH': add paths into front of $PATH
# NB: priority here in reverse order!
declare -a cyg_paths=(
	'/bin'
	'/usr/local/bin'
	'/home/theo/bin'
)
PATH=":${PATH}:"
for P in "${cyg_paths[@]}"; do
	PATH=${PATH//:$P:/:}
	PATH=":$P${PATH}"
done
PATH=${PATH/#:/}; PATH=${PATH/%:/}
# fixed


# custom prompt: time and date added
export PS1='\[\e]0;\w\a\]\n\[\e[32m\]\u@\h \[\e[33m\]\w\[\e[0m\] \[\e[30m\]\[\e[1m\]\D{%d.%m.%Y %T}\[\e[0m\]\n\$ '

# if subshell, add to prompt
[[ $SHLVL > 1 ]] && \
    export PS1='\[\e]0;\w\a\]\n\[\e[32m\]\u@\h [$SHLVL] \[\e[33m\]\w\[\e[0m\] \[\e[30m\]\[\e[1m\]\D{%d.%m.%Y %T}\[\e[0m\]\n\$ '
  # export PS1='\[\e]0;\w\a\]\n\[\e[32m\]\u@\h [$SHLVL] \[\e[33m\]\w\[\e[0m\]\n\$ '

# get hidden (dot-started) filenames with *
shopt -s dotglob

# check bg jobs before exit
shopt -s checkjobs

# to run from non-interactive
# shopt -s expand_aliases

eval "`dircolors -b /etc/DIR_COLORS`"
# Some people use a different file for aliases
if [ -f "${HOME}/.bash_aliases" ]; then
  source "${HOME}/.bash_aliases"
fi

# Some people use a different file for functions
# if [ -f "${HOME}/.bash_functions" ]; then
  # source "${HOME}/.bash_functions"
# fi

# For colors in 'less'
if [ -f "${HOME}/.lesscolorc" ]; then
  source "${HOME}/.lesscolorc"
fi


# Umask
#
# /etc/profile sets 022, removing write perms to group + others.
# Set a more restrictive umask: i.e. no exec perms for others:
# umask 027
# Paranoid: neither group nor others have any perms:
# umask 077

# . ~/bin/.bash-preexec-enable.sh

# . bin/.bash-preexec-simple-intercept.sh

# for bc calculator
# export BC_ENV_ARGS=$HOME/.config/.bcrc

export ORD=~/ord
