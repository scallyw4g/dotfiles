execute pathogen#infect()
syntax on
filetype plugin indent on

nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode
set number
set clipboard=unnamed

set ttymouse=xterm2

set runtimepath^=~/.vim/bundle/ctrlp.vim

:nmap <c-c> :w<CR>
:imap <c-c> <Esc>:w<CR>a
:imap <c-c> <Esc><c-c>

:syntax enable

"ctrl-P Settings
let g:ctrlp_custom_ignore = '\v\~$|\.(o|swp|pyc|wav|mp3|ogg|blend)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])|__init__\.py'
let g:ctrlp_working_path_mode = 0
let g:ctrlp_dotfiles = 0
let g:ctrlp_switch_buffer = 0
let g:ctrlp_extensions = ['buffertag', 'tag', 'line', 'dir']
