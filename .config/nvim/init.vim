" keybindings {{{

let mapleader = ","
let g:mapleader = ","

" make jj act as ESC in insert mode
inoremap jj <ESC>

" Fast saving
nmap <leader>w :w<cr>

" Save files with root privliges.
cmap w!! w !sudo tee % >/dev/null

" Fast quitting
nmap <leader>q :q<cr>

" Always exit all files.
cnoreabbrev q qa

" disable the arrow keys for good
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" fast copy/paste from system
noremap <Leader>y "*y
noremap <Leader>p "*p
noremap <Leader>Y "+y
noremap <Leader>P "+p

" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /
map <c-space> ?

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Maps Tab to indent blocks of text in visual mode.
vmap <TAB> >gv
vmap <BS> <gv

" Move a line of text using ALT+[jk]
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

" Visual mode pressing * or # searches for the current selection
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>

" }}}

" Plugins {{{

" check if vim-plug is installed, if not, download and install it
if empty(glob('~/.config/nvim/autoload/plug.vim'))
	silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
		\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/plugged')
Plug 'https://github.com/ctrlpvim/ctrlp.vim.git'
Plug 'https://github.com/joshdick/onedark.vim.git'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
	" Maps ss to surround word
	nmap ss ysiw
	" Maps sl to surround line
	nmap sl yss
	" Surround Visual selection
	vmap s S
Plug 'scrooloose/nerdcommenter'
Plug 'easymotion/vim-easymotion'
	" <Leader>f{char} to move to {char}
	map  <Leader>f <Plug>(easymotion-bd-f)
	nmap <Leader>f <Plug>(easymotion-overwin-f)
Plug 'tpope/vim-repeat'
Plug 'sheerun/vim-polyglot'
Plug 'nathanaelkane/vim-indent-guides'
	let g:indent_guides_enable_on_vim_startup = 1
	"let g:indent_guides_start_level= 2
	"let g:indent_guides_guide_size= 1
Plug 'bronson/vim-trailing-whitespace'
Plug 'junegunn/vim-easy-align'
Plug 'reedes/vim-colors-pencil'
	"let g:pencil_higher_contrast_ui = 0   " 0=low (def), 1=high
	"let g:pencil_neutral_headings = 1   " 0=blue (def), 1=normal
	"let g:pencil_neutral_code_bg = 1   " 0=gray (def), 1=normal
	"let g:pencil_gutter_color = 1      " 0=mono (def), 1=color
	"let g:pencil_spell_undercurl = 1       " 0=underline, 1=undercurl (def)
	let g:pencil_terminal_italics = 1
Plug 'ayu-theme/ayu-vim'
call plug#end()

filetype plugin on

" }}}

" functionality {{{

set encoding=utf-8
scriptencoding utf-8

set updatetime=500 "show plugins effects in 500ms

set mouse-=a "disable mouse click

set history=1000 "amount of changes vim remembers

set autoread "auto read when file is changed from outside editor

set wildmenu "enable wild menu

set wildignore=*.o,*~,*.pyc,node_modules,*.git,_site,bourbon,.*  "files wild menu ignores

" fuck backups
set nobackup
set nowb
set noswapfile

" searching
set ignorecase "ignore case
set smartcase "be smart about case
set hlsearch "highlight search result
set incsearch "incremental search

set lazyredraw "good for performance

set magic "magic on - for regular expressions

set showmatch "show matching brackets

set mat=1 "blink 1/10th of a second when matching brackets

" tab stuff
set noexpandtab "use tabs instead of spaces
set shiftwidth=4 " 1 tab ===
set tabstop=4    " === 4 spaces
set softtabstop=4
set smarttab "smart indent

" linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

set foldmethod=marker
set foldlevel=99
set foldlevelstart=0

" }}}

" UI stuff {{{

set noshowmode
set noruler
set laststatus=0
set noshowcmd
set shortmess=atI

" disable all sounds
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" always show numbers
set relativenumber
set numberwidth=2
set so=7 "offset 7 lines from cursor when moving vertically

syntax on

if (has("nvim"))
	let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

if (has("termguicolors"))
	set termguicolors
endif

set cursorline
"set background=dark
"let ayucolor="light"
"let ayucolor="mirage"
let ayucolor="dark"
colorscheme ayu

" text stuff
set listchars=tab:▸\ ,trail:·,eol:¬,nbsp:_ " show invisible characters
set breakindent "softwrapped lines keep indent level
let g:enable_bold_font = 1
let g:enable_italic_font = 1

" }}}

" Auto Commands {{{

augroup General
    au!
	autocmd BufWritePre * :%s/\s\+$//e " remove whitespace on save
augroup END

" }}}

" Misc {{{

" Change pwd to file location.
set autochdir

"set clipboard+=unnamedplus
set nostartofline
set notimeout
set nottimeout
set nrformats-=octal

" }}}
