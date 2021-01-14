#!/bin/bash
# sorry for hashbang, it's just for correct language determining by npp

# Interactive operation...
alias rm='rm -i'
# cp: -d = --no-dereference --preserve=links
# cp: -T, --no-target-directory = treat DEST as a normal file
alias cp='cp -i'
alias mv='mv -i'

# alias whence='type -a'                        # where, of a sort
alias grep='grep --color'                     # show differences in colour
alias egrep='egrep --color=auto'              # show differences in colour
alias fgrep='fgrep --color=auto'              # show differences in colour

# Some shortcuts for different directory listings
# alias ls='ls -hF --color=tty'                 # classify files in colour
alias dir='ls --color=auto --format=vertical'
alias vdir='ls --color=auto --format=long'

alias ls='ls --color=auto'
# alias ll='ls -l'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias l.='ls -d .* --color=auto'
alias lli='ls -alFi'

alias scr='screen'

alias cx='chmod +x' 

alias e='vim'
alias v='vim -M'

alias wg++='PATH=/cygdrive/c/mingw/mingw64/bin/:''"'"$PATH"'"'' g++'

#alias ee='TERM=linux && ee'
alias ee='sbl'

alias he='hexedit'

alias md='mkdir'
alias ren='prename'
alias bkp='bkp.sh'
alias cd-up='. cd-up' # cd to parent dir of symlink's target
alias cd-to='. cd-to' # cd to THE dir of symlink's target 
alias md5='md5deep -r'
alias bcf='bc -l ~/.config/bcrc'
alias googler='BROWSER=links googler -n 5'
alias gclip_pwd='p="$(cygpath -w "$(pwd)")"; printf "%s" "${p%\\n}" | gclip'
alias gpwd='gclip_pwd'
alias ppwd='cygpath -m "$(pclip | perl -pe '"'"'s/^[\s]*"(.*)"[\s]*$/$1/'"'"')"'
alias pclip_cd='cd "$(ppwd)"'

# to highlight source
# (first apt-cyg install source-highlight)
# alias lessh='LESSOPEN="| /usr/bin/src-hilite-lesspipe.sh %s" less -M -R '
alias pless='LESSOPEN="| pygmentize -f terminal256 -O style=native -g %s" less -M -R '
alias less_='LESSOPEN="| pygmentize -f terminal256 -O style=native -g %s" less -M -R '
alias pcat="pygmentize -f terminal256 -O style=native -g"
alias cat_="pygmentize -f terminal256 -O style=native -g"


# to run GUI applications
alias chrome='cygstart chrome'
alias firefox='cygstart firefox'

# ssh
alias ssh-nr='ssh root@192.168.1.200'
alias ssh-urs='ssh theo@192.168.1.220'
alias ssh-p='ssh pi@192.168.1.121'
alias ssh-rl='ssh vagrant@192.168.10.10'
alias ssh-tlx='ssh theo@192.168.1.135'

alias ssh-nr-out='ssh root@212.80.57.11 -p 200'


# ad hoc
alias nmap="/cygdrive/c/Program\ Files\ \(x86\)/Nmap/nmap"
alias rlab='. rlab'
alias cal='cal -m'
