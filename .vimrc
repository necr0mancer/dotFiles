"{{{ Looks
" -----------------------------------------------------------------------------

" turn on syntax highlighting
syntax on

" show line numbers
set number relativenumber
" hi LineNr ctermbg=NONE ctermfg=darkgrey

" display all matching results when using tab completion
set wildmenu

" highlight the 81st character so everything can still look good in smaller
" terminals :)
highlight OverLength ctermbg=magenta ctermfg=black
match OverLength /\%81v\+/

" -----------------------------------------------------------------------------
"}}}


"{{{ Search
" -----------------------------------------------------------------------------

" ignore case when searching
set ignorecase

" when searching, try to be smart about cases
" what ive noticed is that when searching with only lowercase, the uppercase
" words are also shown. But if you search with uppercase, only uppercase is
" shown.
set smartcase

" show search matches as you type
set incsearch

" highlight matching search patterns
set hlsearch

" make doube <Esc> clear search highlights
nnoremap <silent> <Esc><Esc> <Esc>:nohlsearch<CR><Esc>

" -----------------------------------------------------------------------------
"}}}


"{{{ Plugins
" -----------------------------------------------------------------------------

" plugin management
call plug#begin(expand('~/.vim/plugged'))

" Plug 'vim-airline/vim-airline'
Plug 'itchyny/lightline.vim'
Plug 'arcticicestudio/nord-vim'

call plug#end()

" -----------------------------------------------------------------------------
"}}}

colorscheme nord
set laststatus=2
" set number

let g:lightline = {
	\ 'colorscheme': 'nord',
	\ }

"{{{ Functions
" -----------------------------------------------------------------------------

" yank to clipboard with xclip
function! ClipboardYank()
	call system('xclip -i -selection clipboard', @@)
endfunction

" paste from clipboard with xclip
function! ClipboardPaste()
	let @@ = system('xclip -o -selection clipboard')
endfunction

" -----------------------------------------------------------------------------
"}}}

"{{{ Command Mappings
" -----------------------------------------------------------------------------

" in case i need root permissions to edit a file, and I didn't open as root or
" with sudo, can save/write file with w!!
cmap w!! w !sudo tee % >/dev/null

" -----------------------------------------------------------------------------
"}}}

"{{{ misc/uncategorized
"------------------------------------------------------------------------------

" search down into subfolders
" provides tab-completion for all file related tasks
set path+=**

" save the undotree to a file when exiting a buffer
set undofile
set undolevels=1000
set undodir=~/.config/nvim/tmp/undo
if !isdirectory(expand(&undodir))
	call mkdir(expand(&undodir), 'p')
endif

" autoreload file when it gets changed externally
" for example "echo hi > file.txt"
" Source:
" https://unix.staxexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim/383044#383044
" trigger `autoread` when file changes on disk
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
" notification after file changed
autocmd FileChangedShellPost *
 \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

set encoding=utf-8

" stops producing A B C D when pressing the arrow keys (this may only be
" needed for vi and not vim)
" i've also read that is sets compatability to vim only
set nocompatible

" fixes common backspace problems
set backspace=indent,eol,start

" fold code blocks - i only use this in config files to keep them organized
" zo - open fold
" zc - close fold
set foldmethod=marker
hi Folded ctermfg=white

" -----------------------------------------------------------------------------
"}}}
