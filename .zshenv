# add .scripts to PATH
export PATH="$HOME/.scripts:$PATH"
export PATH="$HOME/emsdk:$HOME/emsdk/clang/fastcomp/build_incoming_64/bin:$HOME/emsdk/node/8.9.1_64bit/bin:$HOME/emsdk/emscripten/incoming:$HOME/emsdk/binaryen/master_64bit_binaryen/bin:$PATH"
export PGDATA="/var/lib/postgres/data"

# some more ls aliases
alias ll='ls -alFh'
alias la='ls -A'
alias l='ls -CF'
alias l.='ls -ld .[^.]*'
alias md='mkdir -p'

# Git aliases
alias gca='git commit -a --verbose'
alias gc='git commit --verbose'

function GitLogFunc()
{
  ColumnDelimeter='!@#$%^&*&^%$#@!'
  git log --pretty="%C(auto) %h $ColumnDelimeter %an $ColumnDelimeter %s" "$@" | column -t -s "$ColumnDelimeter"
}

alias gl='GitLogFunc | less -R'
alias gls='GitLogFunc -n 20' # Think `git log short`
alias glt='GitLogFunc --after="yesterday"' # Think `git log today`

alias gs='git status'

alias gd='git diff --color | diff-so-fancy | less -R'
alias gdw='git diff -w --color | diff-so-fancy | less -R'

alias gdc='git diff --cached --color | diff-so-fancy | less -R'
alias gdcw='git diff --cached -w --color | diff-so-fancy | less -R'

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
