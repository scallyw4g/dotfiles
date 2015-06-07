# Duh
export EDITOR=vim

# some completion speeding
__git_files () {
    _wanted files expl 'local files' _files
}

# Check for local tree.sh for custom command or fall back to default tree
tree () {
	if [ -x "./tree.sh" ] && [ $# -eq 0 ]; then
		./tree.sh
	else
		command tree $*
	fi
}

zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle :compinstall filename '/home/scallywag/.zshrc'

autoload -Uz compinit promptinit
promptinit
compinit

zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache
zstyle ':completion:*' menu select
zstyle ':completion:*' accept-exact '*(N)'
setopt completealiases

# Completion for lowercase vbox commands
compdef vboxmanage=VBoxManage
compdef vboxheadless=VBoxHeadless


# Set prompt styling
# Adapted from code found at <https://gist.github.com/1712320>.

setopt prompt_subst
autoload -U colors && colors # Enable colors in prompt

# Modify the colors and symbols in these variables as desired.
GIT_PROMPT_SYMBOL="%{$fg[blue]%}±"
GIT_PROMPT_PREFIX="%{$fg[green]%}[%{$reset_color%}"
GIT_PROMPT_SUFFIX="%{$fg[green]%}]%{$reset_color%}"
GIT_PROMPT_AHEAD="%{$fg[red]%}ANUM%{$reset_color%}"
GIT_PROMPT_BEHIND="%{$fg[cyan]%}BNUM%{$reset_color%}"
GIT_PROMPT_MERGING="%{$fg_bold[magenta]%}⚡︎%{$reset_color%}"
GIT_PROMPT_UNTRACKED="%{$fg_bold[red]%}●%{$reset_color%}"
GIT_PROMPT_MODIFIED="%{$fg_bold[yellow]%}●%{$reset_color%}"
GIT_PROMPT_STAGED="%{$fg_bold[green]%}●%{$reset_color%}"

# Show Git branch/tag, or name-rev if on detached head
parse_git_branch() {
  (git symbolic-ref -q HEAD || git name-rev --name-only --no-undefined --always HEAD) 2> /dev/null
}

# Show different symbols as appropriate for various Git repository states
parse_git_state() {

  # Compose this value via multiple conditional appends.
  local GIT_STATE=""

  local NUM_AHEAD="$(git log --oneline @{u}.. 2> /dev/null | wc -l | tr -d ' ')"
  if [ "$NUM_AHEAD" -gt 0 ]; then
    GIT_STATE=$GIT_STATE${GIT_PROMPT_AHEAD//NUM/$NUM_AHEAD}
  fi

  local NUM_BEHIND="$(git log --oneline ..@{u} 2> /dev/null | wc -l | tr -d ' ')"
  if [ "$NUM_BEHIND" -gt 0 ]; then
    GIT_STATE=$GIT_STATE${GIT_PROMPT_BEHIND//NUM/$NUM_BEHIND}
  fi

  local GIT_DIR="$(git rev-parse --git-dir 2> /dev/null)"
  if [ -n $GIT_DIR ] && test -r $GIT_DIR/MERGE_HEAD; then
    GIT_STATE=$GIT_STATE$GIT_PROMPT_MERGING
  fi

  if [[ -n $(git ls-files --other --exclude-standard 2> /dev/null) ]]; then
    GIT_STATE=$GIT_STATE$GIT_PROMPT_UNTRACKED
  fi

  if ! git diff --quiet 2> /dev/null; then
    GIT_STATE=$GIT_STATE$GIT_PROMPT_MODIFIED
  fi

  if ! git diff --cached --quiet 2> /dev/null; then
    GIT_STATE=$GIT_STATE$GIT_PROMPT_STAGED
  fi

  if [[ -n $GIT_STATE ]]; then
    echo "$GIT_PROMPT_PREFIX$GIT_STATE$GIT_PROMPT_SUFFIX"
  fi

}

# If inside a Git repository, print its branch and state
git_prompt_string() {
  local git_where="$(parse_git_branch)"
  [ -n "$git_where" ] && echo "$GIT_PROMPT_SYMBOL$(parse_git_state)$GIT_PROMPT_PREFIX%{$fg[yellow]%}${git_where#(refs/heads/|tags/)}$GIT_PROMPT_SUFFIX"
}

# Functions to be fired before prompt is printed
precmd_functions=(stopJobsCount)

# possibly provides access to $#jobstates associative array
# zmodload zsh/parameter

stopJobsCount () {
	local stopJobs=$#jobstates
	if [ $stopJobs = '0' ]; then
		STOPPEDJOBS=''
	elif [ $stopJobs = '1' ]; then
		STOPPEDJOBS=$stopJobs' job '
	else
		STOPPEDJOBS=$stopJobs' jobs '
	fi
}

# Set the right-hand prompt
RPS1='$(git_prompt_string)'

PROMPT='%F{blue}%n@%m %F{yellow}$STOPPEDJOBS%F{blue}%c${vcs_info_msg_0_} %(?/%F{blue}/%F{red})%% %F{blue}'

# Increase history size
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=3000
setopt appendhistory autocd
unsetopt beep

# vi mode
bindkey -v

# kill lag when escaping to vi mode
export KEYTIMEOUT=1

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias l.='ls -ld .[^.]*'
alias md='mkdir -p'
alias ..='cd ..'

# Git aliases
alias gcam='git commit -am'
alias gcm='git commit -m'
alias gl='git log --pretty=oneline'
alias gs='git status'
alias gd='git diff'

# Alias for hub
eval "$(hub alias -s)"

# Rbenv stuff
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

export PGDATA="/var/lib/postgres/data"
export PATH=$HOME/bin:$PATH

export MONO_PATH=/home/scallywag/www/test-mono-app/NPOI-Binary/dotnet4
export MCS_COLORS=errors=red
# Alias for compiling NPOI mono projects
alias nmcs='mcs -pkg:dotnet -r:/home/scallywag/www/npoi-dotnet4/NPOI.dll '

# Disable <C-s> scroll-lock / SFC on-off
stty -ixon
