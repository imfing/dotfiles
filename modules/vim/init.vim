"++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
"                                                                              "
"                       __   _ _ _ __ ___  _ __ ___                            "
"                       \ \ / / | '_ ` _ \| '__/ __|                           "
"                        \ V /| | | | | | | | | (__                            "
"                         \_/ |_|_| |_| |_|_|  \___|                           "
"                                                                              "
"                                                                              "
"++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"


set langmenu=en_US                          " set to English menu
let $LANG = 'en_US'

set nocompatible                            " use Vim

filetype on                                 " filetype
filetype plugin indent on

"=====================================================
""" Vim-plug settings
"=====================================================

call plug#begin(stdpath('data') . '/plugged')

Plug 'scrooloose/nerdtree'                  " nerdtree
Plug 'itchyny/lightline.vim'                " status bar

Plug 'tpope/vim-fugitive'                   " git plugin

Plug 'sheerun/vim-polyglot'                 " language support
Plug 'mhinz/vim-startify'                   " start screen

Plug 'joshdick/onedark.vim'                 " color schemes
"Plug 'flazz/vim-colorschemes'

"Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

"=====================================================
"" General settings
"=====================================================

syntax on                                   " syntax highlighting

colorscheme onedark                         " color scheme

set termguicolors
set cursorline

set encoding=utf-8                          " file encoding

set number                                  " show line numbers
set ruler
set ttyfast                                 " terminal acceleration

set tabstop=4                               " 4 whitespaces for tabs visual presentation
set shiftwidth=4                            " shift lines by 4 spaces
set smarttab                                " set tabs for a shifttabs logic
set expandtab                               " expand tabs into spaces
set autoindent smartindent                  " indent when moving to the next line while writing code

set showmatch                               " shows matching part of bracket pairs (), [], {}
set matchpairs+=<:>                         " highlight match pairs

set magic                                   " regular expression
set title                                   " display title

set nobackup 	                            " no backup files
set nowritebackup                           " only in case you don't want a backup file while editing
set noswapfile 	                            " no swap files

set backspace=indent,eol,start              " fix common backspace problems

set nowrap                                  " line wrap
set history=1000                            " history

set autoread                                " reload files when changed on disk, i.e. via `git checkout`
set shortmess=atI
set noshowmode
set showcmd

set selection=inclusive
set selectmode=mouse,key

set scrolloff=10                            " let 10 lines before/after cursor during scroll

set clipboard+=unnamed                      " use system clipboard
set laststatus=2

set exrc                                    " enable usage of additional .vimrc files from working directory
set secure                                  " prohibit .vimrc files to execute shell, create files, etc...

set pastetoggle=<C-p>                       " toggle paste mode

"=====================================================
"" Search settings
"=====================================================

set incsearch                               " incremental search
set hlsearch                                " highlight search results
set ignorecase                              " ignore search cases
set smartcase                               " unless there is capital

"=====================================================
"" Plugin settings
"=====================================================

let g:lightline = {
            \ 'colorscheme': 'onedark',
            \ }

" Some key remapping
map <C-n> :NERDTreeToggle<CR>

"=====================================================
"" Keybindings
"=====================================================

inoremap <C-a> <Home>
inoremap <C-e> <End>
inoremap <C-v> <ESC>"+pa

" Quick Esc 
inoremap jj <Esc>
inoremap jk <Esc>

" Easy window navigation
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l
nnoremap <C-H> <C-W>h

" Quick yanking to the end of the line
nnoremap Y y$

" Jump to matching pairs easily, with Tab
nnoremap <Tab> %
vnoremap <Tab> %

" Folding
nnoremap <Space> za
vnoremap <Space> za

" Map ; to : and save a million keystrokes
" ex mode commands made easy Áî®‰∫éÂø´ÈÄüËøõÂÖ•ÂëΩ‰ª§Ë°å
nnoremap ; :

" Shift+H goto head of the line, Shift+L goto end of the line
nnoremap H ^
nnoremap L $

" Tab
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>

" Auto indent pasted text
"nnoremap p p=`]<C-o>
"nnoremap P P=`]<C-o>
