set nocompatible               " be iMproved
filetype off                   " required!

" Setting up Vundle - the vim plugin bundler
let iCanHazVundle=1
let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
if !filereadable(vundle_readme)
	echo "Installing Vundle.."
	echo ""
	silent !mkdir -p ~/.vim/bundle
	silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
	let iCanHazVundle=0
endif
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
"Add your bundles here
"
" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My Bundles here:
"
" original repos on github
Bundle 'mileszs/ack.vim'
Bundle 'godlygeek/tabular'
Bundle 'tpope/vim-surround'
Bundle 'scrooloose/syntastic'
Bundle 'scrooloose/nerdtree'
Bundle 'pangloss/vim-javascript'
Bundle 'tomtom/tcomment_vim'
Bundle 'guileen/vim-node'
Bundle 'teramako/jscomplete-vim'
Bundle 'myhere/vim-nodejs-complete'
Bundle 'wincent/Command-T'
Bundle 'molokai'
Bundle 'wombat256.vim'
Bundle 'davidoc/taskpaper.vim'
Bundle 'maksimr/vim-jsbeautify'
" Bundle 'majutsushi/tagbar'
Bundle 'Lokaltog/vim-easymotion'


if iCanHazVundle == 0
	echo "Installing Bundles, please ignore key map error messages"
	echo ""
	:BundleInstall
endif
" Setting up Vundle - the vim plugin bundler end





filetype plugin indent on     " required!

syntax on
colorscheme wombat256mod

"set listchars=tab:>.,trail:~,extends:>,precedes:<
":set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
"set list
"set list listchars=tab:\|_,trail:·
set list listchars=tab:»·,trail:·
set tabstop=4
set shiftwidth=4
"set expandtab


" Allow deleting selection without updating the clipboard (yank buffer)
"nnoremap x "_x
"nnoremap X "_X

"noremap p p`]
"noremap P P`]

"noremap dd "_dd


" nnoremap <silent> <F3> :TagbarToggle<CR>

let mapleader=','
nmap <leader>a= :Tabularize/=<CR>
vmap <leader>a= :Tabularize/=<CR>
nmap <leader>a: :Tabularize/:<CR>
vmap <leader>a: :Tabularize/:<CR>

set guifont=Monaco:h14

" if has("gui_running")
" 	set guioptions=egmrt
" endif

"Search increamental search, case insensitive
set ignorecase
set smartcase
set incsearch

let g:jsbeautify = {'indent_size': 1, 'indent_char': '\t'}
autocmd FileType javascript noremap <buffer>  <c-g> :call JsBeautify()<cr>
" for html
autocmd FileType html noremap <buffer> <c-g> :call HtmlBeautify()<cr>
" for css or scss
autocmd FileType css noremap <buffer> <c-g> :call CSSBeautify()<cr>

" vim-nodejs-complete
let g:node_usejscomplete = 1
set cot=menuone,preview,longest

" easy motion
let g:EasyMotion_leader_key = '<Leader>'

" C-Space for omnifunc
inoremap <expr> <C-Space> pumvisible() \|\| &omnifunc == '' ?
\ "\<lt>C-n>" :
\ "\<lt>C-x>\<lt>C-o><c-r>=pumvisible() ?" .
\ "\"\\<lt>c-n>\\<lt>c-p>\\<lt>c-n>\" :" .
\ "\" \\<lt>bs>\\<lt>C-n>\"\<CR>"
imap <C-@> <C-Space>

autocmd CursorMoved * exe printf('match NonText /\V\<%s\>/', escape(expand('<cword>'), '/\'))
