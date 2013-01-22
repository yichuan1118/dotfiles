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
Bundle 'mileszs/ack.vim'
Bundle 'godlygeek/tabular'
Bundle 'tpope/vim-surround'
Bundle 'scrooloose/syntastic'
Bundle 'scrooloose/nerdtree'
Bundle 'jistr/vim-nerdtree-tabs'
Bundle 'pangloss/vim-javascript'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'tomtom/tcomment_vim'
Bundle 'teramako/jscomplete-vim'
Bundle 'myhere/vim-nodejs-complete'
" Bundle 'wincent/Command-T'
Bundle 'molokai'
Bundle 'sjl/gundo.vim'
Bundle 'wombat256.vim'
Bundle 'jnurmine/Zenburn'

Bundle 'davidoc/taskpaper.vim'
" Bundle 'maksimr/vim-jsbeautify'
Bundle 'ZeusTheTrueGod/vim-format-js'
Bundle 'majutsushi/tagbar'
Bundle 'kchmck/vim-coffee-script'
Bundle 'nathanaelkane/vim-indent-guides'
"Bundle 'sontek/rope-vim'
" Bundle 'klen/python-mode'
Bundle 'LaTeX-Box-Team/LaTeX-Box'
" Bundle 'Shougo/neocomplcache'
Bundle 'kien/ctrlp.vim'
Bundle 'ervandew/supertab'
Bundle 'davidhalter/jedi-vim'
" Bundle 'VimClojure'
Bundle 'Townk/vim-autoclose'
Bundle 'Lokaltog/vim-powerline'
Bundle 'digitaltoad/vim-jade'
" Bundle 'ivanov/vim-ipython'

if iCanHazVundle == 0
	echo "Installing Bundles, please ignore key map error messages"
	echo ""
	:BundleInstall
endif
" Setting up Vundle - the vim plugin bundler end



filetype plugin indent on     " required!

syntax on

" set listchars=tab:>.,trail:~,extends:>,precedes:<
"set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
"set list listchars=tab:\|_,trail:·
set list listchars=tab:»·,trail:·
" set tabstop=4
" set shiftwidth=4
"set expandtab
set autoindent
" set cindent
set smarttab

" Allow deleting selection without updating the clipboard (yank buffer)
"nnoremap x "_x
"nnoremap X "_X

"noremap p p`]
"noremap P P`]

"noremap dd "_dd
"





let mapleader=','
let maplocalleader=','

nmap <leader><leader>= :Tabularize/=<CR>
vmap <leader><leader>= :Tabularize/=<CR>
nmap <leader><leader>: :Tabularize/:<CR>
vmap <leader><leader>: :Tabularize/:<CR>

set backspace=2 
let s:uname = system("uname")
if has("unix")
	if s:uname == "Darwin\n"
		" Do Mac stuff here
		set guifont=Monaco:h14
		" vim -> Skim
		map <silent> <Leader>lk :silent !/Applications/Skim.app/Contents/SharedSupport/displayline
					\ <C-R>=line('.')<CR> "<C-R>=LatexBox_GetOutputFile()<CR>" "%:p" <CR>
	elseif s:uname[0:5] == "CYGWIN"
		" Cygwin backspace fix
		set backspace=2 " make backspace work like most other apps
		set guifont=Bitstream\ Vera\ Sans\ Mono\ 10
	endif
endif

"Search increamental search, case insensitive
set ignorecase
set smartcase
set incsearch

" NERDTree on launch
"autocmd VimEnter * NERDTree
"autocmd BufEnter * NERDTreeMirror
"autocmd VimEnter * wincmd w
let g:nerdtree_tabs_open_on_gui_startup = 0


nnoremap <silent> <F8> :TagbarToggle<CR>
nnoremap <silent> <F9> :NERDTreeTabsToggle<CR>

" autocmd FileType javascript :setl omnifunc=jscomplete#CompleteJS



let g:tagbar_type_javascript = { 'ctagsbin' : 'jsctags' }


" vim-nodejs-complete
autocmd FileType javascript let g:node_usejscomplete = 1
" let g:node_usejscomplete = 1
set cot=menuone,preview,longest


map <leader>r :NERDTreeFind<cr>
nmap <F5> :Ack!<space>

" C-Space for omnifunc
" inoremap <expr> <C-Space> pumvisible() \|\| &omnifunc == '' ?
"			\ "\<lt>C-n>" :
"			\ "\<lt>C-x>\<lt>C-o><c-r>=pumvisible() ?" .
"			\ "\"\\<lt>c-n>\\<lt>c-p>\\<lt>c-n>\" :" .
"			\ "\" \\<lt>bs>\\<lt>C-n>\"\<CR>"
" imap <C-@> <C-Space>

" Highlight current word
" autocmd CursorMoved * exe printf('match NonText /\V\<%s\>/', escape(expand('<cword>'), '/\'))

" easy motion
" Default is <leader><leader>
"let g:EasyMotion_leader_key = '<leader>'

" CommandT
let g:CommandTAcceptSelectionMap = '<C-t>'
let g:CommandTAcceptSelectionTabMap = '<CR>'


" Coffeescript
" vmap <leader>c <esc>:'<,'>:CoffeeCompile<CR>
" map <leader>c :CoffeeCompile<CR>
" autocmd FileType coffee setlocal et sta sw=2 ts=2 sts=2 list listchars=tab:<+ nocindent
" autocmd FileType coffee setlocal foldmethod=indent
" autocmd FileType coffee map <F6> <ESC>:CoffeeCompile vertical<CR>
" command -nargs=1 C CoffeeCompile | :<args>

" Taskpaper
let g:task_paper_date_format = "%Y-%m-%dT%H:%M:%S%z"

" Auto change pwd
"autocmd BufEnter * if expand("%:p:h") !~ '^/tmp' | silent! lcd %:p:h | endif

map <leader>w <c-w><c-w>

" Colors
set background=dark
colorscheme wombat256mod

set hlsearch

if has("gui_running")
	set guioptions=egmrt
	hi Search          guifg=#ffffe0 guibg=#284f28
	hi IncSearch       guibg=#f8f893 guifg=#385f38
else
	let g:indent_guides_auto_colors = 0
	autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=black ctermbg=black
	autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=darkgrey ctermbg=darkgrey
	set t_Co=256

	" colorscheme zenburn
	" Use some color from zenburn
	" if &t_Co > 255
	hi IncSearch       ctermbg=228   ctermfg=238
	hi Search          ctermfg=230   ctermbg=236
	hi incsearch       ctermbg=228
	hi search          ctermbg=238
	" endif
endif


" let g:indent_guides_guide_size = 1
" let g:indent_guides_enable_on_vim_startup = 1
nmap <silent> <Leader>ig <Plug>IndentGuidesToggle

autocmd Filetype javascript setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype jade setlocal ts=2 sts=2 sw=2 expandtab

let s:formatjs_keep_blank_lines = 1

" Format JSON 
map <leader>jt  <Esc>:.!python -m json.tool<CR>


" Python
autocmd FileType python setlocal ts=4 sts=4 sw=4 expandtab
autocmd FileType python noremap <F6> :!python %<CR>
autocmd FileType python setlocal number
" let g:pymode_doc = 0
" autocmd FileType python map K :call RopeShowDoc()<CR>

" Avoid ESC
" :inoremap ff <Esc>

" If you prefer the Omni-Completion tip window to close when a selection is
" made, these lines close it on movement in insert mode or when leaving
" insert mode
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" Disable GUI cursor blinking
set guicursor+=a:blinkon0

" Clojure
" let vimclojure#WantNailgun = 1
" let g:vimclojure#HighlightBuiltins = 1
" let g:vimclojure#ParenRainbow = 1

" JS folding
set foldmethod=syntax
set foldlevelstart=1

" let javaScript_fold=1         " JavaScript

" Auto close
let g:AutoClosePairs_add = "\""

" Powerline
set laststatus=1   " Always show the statusline
set encoding=utf-8 " Necessary to show Unicode glyphs
" let g:Powerline_symbols = 'unicode'
" let g:Powerline_theme = 'solarized256'
let g:Powerline_colorscheme = 'solarized256'

"CtrlP
let g:ctrlp_extensions = ['line']
" let g:ctrlp_cmd = 'CtrlPMixed'

" The silver searcher
let g:ackprg = 'ag --nogroup --nocolor --column'

" Supertab
let g:SuperTabDefaultCompletionType = "context"
let g:jedi#popup_on_dot = 0
