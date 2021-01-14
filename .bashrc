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

# native NTFS symlinks
export CYGWIN=winsymlinks:nativestrict
# https://stackoverflow.com/questions/18654162/enable-native-ntfs-symbolic-links-for-cygwin

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

# set terminal title
PROMPT_COMMAND='echo -en "\033]0;'"$HOSTNAME"'\a"'

# custom prompt
if [ -f "${HOME}/.bash_prompt" ]; then
  source "${HOME}/.bash_prompt"
fi

#export __PS1_plane='\[\e[32m\]\u@\h \[\e[33m\]\w\[\e[0m\] \[\e[30m\]\[\e[1m\]\D{%d.%m.%Y %T}\[\e[0m\]\n\$ '

# custom prompt: time and date added
#export PS1='\[\e]0;\w\a\]\n\[\e[32m\]\u@\h \[\e[33m\]\w\[\e[0m\] \[\e[30m\]\[\e[1m\]\D{%d.%m.%Y %T}\[\e[0m\]\n\$ '

# if subshell, add to prompt
#[[ $SHLVL > 1 ]] && \
#    export PS1='\[\e]0;\w\a\]\n\[\e[32m\]\u@\h [$SHLVL] \[\e[33m\]\w\[\e[0m\] \[\e[30m\]\[\e[1m\]\D{%d.%m.%Y %T}\[\e[0m\]\n\$ '
  # export PS1='\[\e]0;\w\a\]\n\[\e[32m\]\u@\h [$SHLVL] \[\e[33m\]\w\[\e[0m\]\n\$ '



# include hidden (dot-started) filenames with glob (*)
shopt -s dotglob

# iextended globbing: ?(patrn 0-1) *(patrn 0+) +(patrn 1+) @(choices) !(not)
shopt -s extglob

# check bg jobs before exit
shopt -s checkjobs

# to run from non-interactive
# shopt -s expand_aliases

if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval         "$(dircolors -b)"
fi

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


# export ORD=~/ord

PATH="/home/theo/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/theo/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/theo/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/theo/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/theo/perl5"; export PERL_MM_OPT;


. ~/.flutterrc

