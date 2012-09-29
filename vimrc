set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My Bundles here:
"
" original repos on github
Bundle 'pangloss/vim-javascript'
" vim-scripts repos
" non github repos
Bundle 'wombat256.vim'
Bundle 'taskpaper.vim'
" ...

filetype plugin indent on     " required!

syntax on

"set listchars=tab:>.,trail:~,extends:>,precedes:<
":set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
"set list
"set list listchars=tab:\|_,trail:·
set list listchars=tab:»·,trail:·
set tabstop=4
set shiftwidth=4
set expandtab


"allow deleting selection without updating the clipboard (yank buffer)
"nnoremap x "_x
"nnoremap X "_X


"noremap p p`]
"noremap P P`]

"noremap dd "_dd
if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif
set t_Co=256
colorscheme wombat256mod


set ignorecase
set smartcase
set incsearch
