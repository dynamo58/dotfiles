" YOINK https://github.com/pajlada/dotfiles/blob/master/.config/nvim/init.vim

set number                      " enable line numbers
set wrap                        " enable line wrapping
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

set wildignore+=*/node_modules/*,*/dist/*,*/__pycache__/*,*/venv/*

syntax on

if &t_Co == 256
    " If we're on a 256-color terminal, use pixelmuerto color scheme
    colorscheme pixelmuerto
    hi Normal guibg=NONE ctermbg=NONE
else
    " Else fall back to ron
    colorscheme ron
    hi CursorLine term=bold cterm=bold guibg=Grey40
endif