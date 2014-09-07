# add .scripts to PATH
export PATH="$HOME/.scripts:$PATH"

# startx
[[ DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx

# bash coloring
PS1='\[\e[0;32m\]\u\[\e[m\] \[\e[1;34m\]\w\[\e[m\] \[\e[1;32m\]\$\[\e[m\] \[\e[1;37m\]'


