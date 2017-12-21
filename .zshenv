# add .scripts to PATH
export PATH="$HOME/.scripts:$PATH"
export PGDATA="/var/lib/postgres/data"

# some more ls aliases
alias ll='ls -alFh'
alias la='ls -A'
alias l='ls -CF'
alias l.='ls -ld .[^.]*'
alias md='mkdir -p'

# Git aliases
alias gca='git commit -a'
alias gc='git commit'

alias gl='git log --pretty="%C(auto) %h %s"'
alias gls='gl -n 20' # Think `git log short`
alias glt='gl --after="yesterday"' # Think `git log today`

alias gs='git status'

alias gd='git diff'
alias gdw='git diff -w'

alias gdc='git diff --cached'
alias gdcw='git diff --cached -w'

alias gr='git reset HEAD'
alias grh='git reset --hard HEAD'

# Alias for hub
hub > /dev/null 2>&1
if [ $? -eq 0 ]; then
  eval "$(hub alias -s)"
fi

alias art='php artisan'

# Alias for MySql Workbench
alias mysql-workbench='vncdesk 1'

# Alias for yaourt
# alias pacman=yaourt

# Alias for compiling NPOI mono projects
alias nmcs='mcs -pkg:dotnet -r:/home/scallywag/www/npoi-dotnet4/NPOI.dll '
