" Apparently this must be first
" This is set in case this file is ever loaded with the -u flag, otherwise it
" is redundant as far as I can tell
set nocompatible

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ----------------------------------- Vundle settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'

Plugin 'altercation/vim-colors-solarized'
Plugin 'crusoexia/vim-monokai'

Plugin 'omnisharp/omnisharp-vim'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-rake'
Plugin 'tpope/vim-bundler'
Plugin 'scrooloose/syntastic'

Plugin 'sirver/ultisnips'

Plugin 'vim-scripts/autoclose'

Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-fugitive'
Plugin 'kien/ctrlp.vim'

Plugin 'mileszs/ack.vim'

Plugin 'bling/vim-airline'
call vundle#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"----------------------------------- Misc Custom Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Allows file type detection for plugins with Vim and allows automatic
" indentation
filetype plugin indent on

" Solarized Colorscheme
syntax enable
set background=dark
colorscheme solarized
highlight clear SignColumn

highlight Normal ctermfg=12 ctermbg=NONE
highlight SpecialKey ctermfg=10 ctermbg=NONE cterm=NONE
highlight LineNr ctermfg=12 ctermbg=NONE
highlight CursorLineNr ctermfg=5 ctermbg=NONE
highlight folded cterm=bold ctermbg=NONE ctermfg=10
highlight SpellBad ctermbg=NONE

" Toggle background colors
call togglebg#map("<F9>")

" This hides buffers instead of closing them
" No more saving before you ,,
" no more lost history and marks when you ,,
" MUST HAVE!
set hidden

" Change leader to ,
let mapleader=','

" Setting for eclim/YCM completion
let g:EclimCompletionMethod = 'omnifunc'

" Axe swap and backup flies
" http://jeffkreeftmeijer.com/2010/git-your-act-together/
set nobackup
set noswapfile

" Automatically read in changed files with no annoying prompt
set autoread

" Show relative line numbers
set relativenumber
" except for the line the cursor is on - show the actual line number
set number

" show trailing whitespace, tabs and lines extending off the page
set list
set listchars=tab:\|\ ,trail:.,extends:#,nbsp:.

" Strip trailing whitespace on every save
function! StripWS()
	:%s/\s\+$//e
endfunction

" No word wrapping at edge of window
set nowrap
"
" Set Vimperatorrc as vimfile
autocmd BufNewFile,BufRead .vimperatorrc set ft=vim

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ----------------------------------- STATUSLINE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set noruler
set laststatus=2

" Powerline font
let g:airline_powerline_fonts = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ----------------------------------- Custom Keymaps
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Edit .vimrc
nmap <silent> <Leader>ev :e ~/.vimrc<CR>

" Edit .zshrc
nmap <silent> <Leader>ez :e ~/.zshrc<CR>

" Edit bspwmrc
nmap <silent> <Leader>eb :e ~/.config/bspwm/bspwmrc<CR>

" Edit bspwmrc
nmap <silent> <Leader>ex :e ~/.config/sxhkd/sxhkdrc<CR>

" Edit current filetypes snippets file
nmap <silent> <Leader>es :UltiSnipsEdit<CR>

" Save all files
nmap <silent> <Leader>S :wa<CR>

" Save current buffer
nmap <silent> <Leader>s :w<CR>

" Open Gblame
nmap <Leader>gb :Gblame<CR>

" Save a file with sudo
cmap w!! w !sudo tee %

" buffer toggle
nmap <Leader><Leader> <C-^>

" set ,d to delete current file
nmap <Leader>d :call delete(expand('%'))<CR>

" esc insert mode
imap jk <esc>

" break <C-c>; it doesn't fire InsertLeave autocommands, which is bad apparently
" http://valloric.github.io/YouCompleteMe/#faq
map <C-c> <esc>iStopit<esc>

" Maven clean/build
" map <F4> :Mvn clean<CR>
map <F5> :Mvn clean package<CR>
map <F6> :Mvn clean package<CR>:Java<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ------------------------------------ Folding
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set foldmethod=syntax
set foldlevelstart=99

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ------------------------------------ Splitting
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set splitbelow
set splitright

nnoremap <C-h> <C-W><C-H>
" nnoremap <C-j> <C-W><C-j>
nnoremap <C-k> <C-W><C-k>
nnoremap <C-l> <C-W><C-l>

nnoremap <Leader>> <C-w>10>
nnoremap <Leader>< <C-w>10<

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ------------------------------------ Tabbing
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <Leader><C-l> :tabnext<CR>
nnoremap <Leader><C-h> :tabprevious<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ----------------------------------- SEARCHING
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Incsearch searches the document for a string each time a character is added
" to the string
set incsearch
" Search Highlighting is annoying
" set hlsearch

" Ignores case sensitivity when searching for a string
set ignorecase
" If your search string is mixed case smartcase will only match that exact
" string
set smartcase

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ----------------------------------- Ultisnips Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" My vim hasn't been compiled with python3 support;
" force ultisnips to use python2
let g:UltiSnipsUsePythonVersion = 2

" Set trigger combo to ctrl-j
let g:UltiSnipsExpandTrigger="<c-f>"
let g:UltiSnipsJumpForwardTrigger="<c-f>"
let g:UltiSnipsJumpBackwardTrigger="<c-F>"

" Set UltiSnipEdit to open in a vertical split
let g:UltiSnipsEditSplit = 'vertical'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ----------------------------------- ctrl-P Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:ctrlp_follow_symlinks = 1
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_root_markers = ['Gemfile']
" let g:ctrlp_dotfiles = 0
" let g:ctrlp_switch_buffer = 0
" let g:ctrlp_extensions = ['buffertag', 'tag', 'line', 'dir']
 let g:ctrlp_custom_ignore = {
		\ 'dir':'\v[\/]\.git$|.*/db/migrate|.*/cache',
		\ }

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ----------------------------------- LaTeX
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Force grep to display filenames even when searching through a single file
" This has something to do with autocomplete in latex
set grepprg=grep\ -nH\ $*

" So empty .tex files still load vim-latex
let g:tex_flavor='latex'

"let g:Tex_CompileRule_pdf = 'pdflatex --interaction=nonstopmode $*'
let g:Tex_DefaultTargetFormat = 'pdf'
"let g:Tex_ViewRule_pdf = 'fbpdf'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ------------------------------ LANGUAGES --------------------
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set scss as css files for syntax highlighting
autocmd BufNewFile,BufRead *.scss set ft=css
" Set deface as html
autocmd BufNewFile,BufRead *.deface set ft=html

" ----------------------------------- Ruby and Rails autocomplete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ----------------------------------- Ctags
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Searches for tags file in current folder and works its way up to
" root looking for one.
set tags=./tags;/

set linebreak

" Current file directory expansion
cnoremap %% <C-R>=expand('%:p:h').'/'<cr>

" Spell Check
setlocal spell spelllang=en_us

" The minimum number of lines to show above/below the cursor
set scrolloff=7

" toggles between set paste && set nopaste
" paste mode disables autoindenting so you can paste shit into vim happily
set pastetoggle=<F2>

set clipboard=unnamed

" Set tabs to 2 spaces
set tabstop=2 shiftwidth=2 expandtab
set noexpandtab|retab! "Use tabs, not spaces

set mouse=a
set ttymouse=urxvt

" Reloads vim when the .vimrc gets modified
augroup myvimrc
		au!
		au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END

	" Local Dirs
set undodir=~/.vim/undo



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  Custom Functions
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! UpdateVimRC()
		for server in split(serverlist())
			call remote_send(server, '<Esc>:source $HOME/.vim/.vimrc<CR>')
		endfor
 endfunction

augroup myvimrchooks
au!

autocmd bufwritepost .vimrc call UpdateVimRC()
augroup END

" Closes the scratch window after a completion
" autocmd InsertLeave * if pumvisible() == 0 | pclose | endif


""function MkNonExDir(file, buf)
""	if empty(getbufvar(a:buf, '&buftype')) && a:file!~#'\v^\w+\:\/'
""			let dir=fnamemodify(a:file, ':h')
""			if !isdirectory(dir)
""					call mkdir(dir, 'p')
""			endif
""	endif
""endfunction
""augroup BWCCreateDir
""	autocmd!
""	autocmd BufWritePre * :call MkNonExDir(expand('<afile>'), +expand('<abuf>'))
""augroup END

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CSCOPE settings for vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" This file contains some boilerplate settings for vim's cscope interface,
" plus some keyboard mappings that I've found useful.
"
" USAGE:
" -- vim 6:			Stick this file in your ~/.vim/plugin directory (or in a
"								'plugin' directory in some other directory that is in your
"								'runtimepath'.
"
" -- vim 5:			Stick this file somewhere and 'source cscope.vim' it from
"								your ~/.vimrc file (or cut and paste it into your .vimrc).
"
" NOTE:
" These key maps use multiple keystrokes (2 or 3 keys).  If you find that vim
" keeps timing you out before you can complete them, try changing your timeout
" settings, as explained below.
"
" Happy cscoping,
"
" Jason Duell				jduell@alumni.princeton.edu			2002/3/7
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" This tests to see if vim was configured with the '--enable-cscope' option
" when it was compiled.  If it wasn't, time to recompile vim...
if has("cscope")

		""""""""""""" Standard cscope/vim boilerplate

		" use both cscope and ctag for 'ctrl-]', ':ta', and 'vim -t'
		set cscopetag

		" check cscope for definition of a symbol before checking ctags: set to 1
		" if you want the reverse search order.
		set csto=0

		" add any cscope database in current directory
		if filereadable("cscope.out")
				cs add cscope.out
		" else add the database pointed to by environment variable
		elseif $CSCOPE_DB != ""
				cs add $CSCOPE_DB
		endif

		" show msg when any other cscope db added
		set cscopeverbose


		""""""""""""" My cscope/vim key mappings
		"
		" The following maps all invoke one of the following cscope search types:
		"
		"		's'		symbol: find all references to the token under cursor
		"		'g'		global: find global definition(s) of the token under cursor
		"		'c'		calls:	find all calls to the function name under cursor
		"		't'		text:		find all instances of the text under cursor
		"		'e'		egrep:	egrep search for the word under cursor
		"		'f'		file:		open the filename under cursor
		"		'i'		includes: find files that include the filename under cursor
		"		'd'		called: find functions that function under cursor calls
		"
		" Below are three sets of the maps: one set that just jumps to your
		" search result, one that splits the existing vim window horizontally and
		" diplays your search result in the new window, and one that does the same
		" thing, but does a vertical split instead (vim 6 only).
		"
		" I've used CTRL-\ and CTRL-@ as the starting keys for these maps, as it's
		" unlikely that you need their default mappings (CTRL-\'s default use is
		" as part of CTRL-\ CTRL-N typemap, which basically just does the same
		" thing as hitting 'escape': CTRL-@ doesn't seem to have any default use).
		" If you don't like using 'CTRL-@' or CTRL-\, , you can change some or all
		" of these maps to use other keys.	One likely candidate is 'CTRL-_'
		" (which also maps to CTRL-/, which is easier to type).  By default it is
		" used to switch between Hebrew and English keyboard mode.
		"
		" All of the maps involving the <cfile> macro use '^<cfile>$': this is so
		" that searches over '#include <time.h>" return only references to
		" 'time.h', and not 'sys/time.h', etc. (by default cscope will return all
		" files that contain 'time.h' as part of their name).


		" To do the first type of search, hit 'CTRL-\', followed by one of the
		" cscope search types above (s,g,c,t,e,f,i,d).	The result of your cscope
		" search will be displayed in the current window.  You can use CTRL-T to
		" go back to where you were before the search.
		"

		nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
		nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
		nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
		nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
		nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
		nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
		nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
		nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>


		" Using 'CTRL-spacebar' (intepreted as CTRL-@ by vim) then a search type
		" makes the vim window split horizontally, with search result displayed in
		" the new window.
		"
		" (Note: earlier versions of vim may not have the :scs command, but it
		" can be simulated roughly via:
		"		 nmap <C-@>s <C-W><C-S> :cs find s <C-R>=expand("<cword>")<CR><CR>

		nmap <C-@>s :scs find s <C-R>=expand("<cword>")<CR><CR>
		nmap <C-@>g :scs find g <C-R>=expand("<cword>")<CR><CR>
		nmap <C-@>c :scs find c <C-R>=expand("<cword>")<CR><CR>
		nmap <C-@>t :scs find t <C-R>=expand("<cword>")<CR><CR>
		nmap <C-@>e :scs find e <C-R>=expand("<cword>")<CR><CR>
		nmap <C-@>f :scs find f <C-R>=expand("<cfile>")<CR><CR>
		nmap <C-@>i :scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
		nmap <C-@>d :scs find d <C-R>=expand("<cword>")<CR><CR>


		" Hitting CTRL-space *twice* before the search type does a vertical
		" split instead of a horizontal one (vim 6 and up only)
		"
		" (Note: you may wish to put a 'set splitright' in your .vimrc
		" if you prefer the new window on the right instead of the left

		nmap <C-@><C-@>s :vert scs find s <C-R>=expand("<cword>")<CR><CR>
		nmap <C-@><C-@>g :vert scs find g <C-R>=expand("<cword>")<CR><CR>
		nmap <C-@><C-@>c :vert scs find c <C-R>=expand("<cword>")<CR><CR>
		nmap <C-@><C-@>t :vert scs find t <C-R>=expand("<cword>")<CR><CR>
		nmap <C-@><C-@>e :vert scs find e <C-R>=expand("<cword>")<CR><CR>
		nmap <C-@><C-@>f :vert scs find f <C-R>=expand("<cfile>")<CR><CR>
		nmap <C-@><C-@>i :vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
		nmap <C-@><C-@>d :vert scs find d <C-R>=expand("<cword>")<CR><CR>


		""""""""""""" key map timeouts
		"
		" By default Vim will only wait 1 second for each keystroke in a mapping.
		" You may find that too short with the above typemaps.	If so, you should
		" either turn off mapping timeouts via 'notimeout'.
		"
		"set notimeout
		"
		" Or, you can keep timeouts, by uncommenting the timeoutlen line below,
		" with your own personal favorite value (in milliseconds):
		"
		set timeoutlen=1000
		"
		" Either way, since mapping timeout settings by default also set the
		" timeouts for multicharacter 'keys codes' (like <F1>), you should also
		" set ttimeout and ttimeoutlen: otherwise, you will experience strange
		" delays as vim waits for a keystroke after you hit ESC (it will be
		" waiting to see if the ESC is actually part of a key code like <F1>).
		"
		set ttimeout
		"
		" personally, I find a tenth of a second to work well for key code
		" timeouts. If you experience problems and have a slow terminal or network
		" connection, set it higher.	If you don't set ttimeoutlen, the value for
		" timeoutlent (default: 1000 = 1 second, which is sluggish) is used.
		"
		"set ttimeoutlen=100

endif


