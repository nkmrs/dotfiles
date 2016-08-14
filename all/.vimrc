" -----------------------
" display
" -----------------------
" set nomodeline
set number
set ruler

set autoindent
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set backspace=start

set undodir=~/.vim/undo
set backupdir=~/.vim/tmp

" -----------------------
" syntax color
" -----------------------
syntax on
colorscheme desert

autocmd BufNewFile,BufRead *.erls set filetype=erlang
autocmd BufNewFile,BufRead *.cbls set filetype=cobol

" -----------------------
" plugins
" -----------------------
" vundle
filetype off
set rtp+=~/.vim/vundle.git
call vundle#rc()
Bundle 'derekwyatt/vim-scala'
filetype plugin indent on
