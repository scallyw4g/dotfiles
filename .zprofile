# add .scripts to PATH
export PATH="$HOME/.scripts:$PATH"
export PGDATA="/var/lib/postgres/data"

# startx
[[ DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
