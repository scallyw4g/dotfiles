" ----------------------------------- Pathogen settings
execute pathogen#infect()
syntax on

" Allows file type detection for plugins with Vim and allows automatic
" indentation
filetype plugin indent on
" Change <leader> to , from \
let mapleader=","

" Solarized Colorscheme
syntax enable 
set background=dark
colorscheme solarized

" ----------------------------------- Numbering 
set relativenumber
" Show current line number
" au BufReadPost,BufNewFile * set relativenumber
set number

" ----------------------------------- SEARCHING
" Incsearch searches the document for a string each time a character is added
" to the string 
set incsearch
" Search Highlighting
set hlsearch
" Ignores case sensitivity when searching for a string
set ignorecase
" If your search string is mixed case smartcase will only match that exact
" string
set smartcase


" ----------------------------------- Ruby and Rails autocomplete 
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1 
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1

" ----------------------------------- LaTeX
" Force grep to display filenames even when searching through a single file
" This has something to do with autocomplete in latex
set grepprg=grep\ -nH\ $*
" So empty .tex files still load vim-latex
let g:tex_flavor='latex'

"let g:Tex_CompileRule_pdf = 'pdflatex --interaction=nonstopmode $*'
let g:Tex_DefaultTargetFormat = 'pdf'
"let g:Tex_ViewRule_pdf = 'fbpdf' 

" ----------------------------------- Custom Keymaps

" set ,d to delete current file
:nmap <leader>d :call delete(expand('%'))<CR>


" ----------------------------------- ctrl-P Settings

let g:ctrlp_custom_ignore = '\v\~$|\.(o|swp|pyc|wav|mp3|ogg|blend)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])|__init__\.py'
let g:ctrlp_working_path_mode = 0
let g:ctrlp_dotfiles = 0
let g:ctrlp_switch_buffer = 0
let g:ctrlp_extensions = ['buffertag', 'tag', 'line', 'dir']

" ----------------------------------- Misc Settings
" Word wrapping at edge of window
set wrap
set linebreak
set nolist
" Spell Check
setlocal spell spelllang=en_us

" The minimum number of lines to show above/below the cursor
set scrolloff=5

set clipboard=unnamed
set tabstop=2 shiftwidth=2 expandtab
set noexpandtab|retab! "Use tabs, not spaces

set ttymouse=xterm2

set runtimepath^=~/.vim/bundle/ctrlp.vim

" This is set in case this file is ever loaded with the -u flag, otherwise it
" is redundant as far as I can tell
set nocompatible																			 

" Reloads vim when the .vimrc gets modified
augroup myvimrc
		au!
		au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END

	" Local Dirs
set backupdir =~/.vim/backups
set directory=~/.vim/swaps
set undodir=~/.vim/undo
