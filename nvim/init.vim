call plug#begin()

Plug 'mg979/vim-visual-multi'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'lervag/vimtex'
Plug 'preservim/nerdtree'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

source $HOME/.config/nvim/plug-config/ultisnips.vim
source $HOME/.config/nvim/plug-config/coc.vim
source $HOME/.config/nvim/plug-config/vimtex.vim

set number                      " enable line numbers
set noswapfile                  " no swap file
set backspace=indent,eol,start  " let Let backspace delete indentations
set ignorecase                  " case insensitive 
set hlsearch                    " highlight search 
set incsearch                   " incremental search
set encoding=utf-8              " utf-8 encoding
set tabstop=4                   " number of columns occupied by a tab 
set softtabstop=4               " see multiple spaces as tabstops so <BS> does the right thing
set expandtab                   " converts tabs to white space
set shiftwidth=4                " width for autoindents
set autoindent                  " indent a new line the same amount as the line just typed
set mouse=a                     " enable mouse click
set splitright                  " split panes to right & below
set splitbelow                  " 
set rnu
set wildignore+=*/node_modules/*,*/dist/*,*/__pycache__/*,*/venv/*
set scrolloff=2

nnoremap <F2>  :NERDTreeToggle <CR>
nnoremap <C-s> :w!             <CR>
nnoremap <C-y> :wq!            <CR>
nnoremap <C-q> :q!             <CR>

syntax on
colorscheme gruvbox
hi Normal guibg=NONE ctermbg=NONE
