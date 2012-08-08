
set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'
" required by FuzzyFinder
Bundle 'L9'
Bundle 'FuzzyFinder'

Bundle 'The-NERD-tree'
" Bundle 'grep.vim'
Bundle 'mileszs/ack.vim'

set grepprg=ack

Bundle 'taglist.vim'
Bundle 'cscope_macros.vim'

" Bundle 'Conque-Shell'
Bundle 'lrvick/Conque-Shell'
Bundle 'sessionman.vim'

" Programming
Bundle 'a.vim'
Bundle 'project.tar.gz'
Bundle 'matchit.zip'
Bundle 'anzaika/go.vim'
Bundle 'OOP-javascript-indentation'
Bundle 'jQuery'
Bundle 'vim-coffee-script'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-rake'
Bundle 'tpope/vim-bundler'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-abolish'
Bundle 'tpope/vim-liquid'
Bundle 'railscasts'
Bundle 'scrooloose/nerdcommenter'
Bundle 'vcscommand.vim'
Bundle 'Align'
Bundle 'greyblake/vim-preview'

" supertab
Bundle 'ervandew/supertab'
" Bundle 'SuperTab-continued.'

Bundle 'kien/ctrlp.vim'
Bundle 'scrooloose/syntastic'

" Snippets
"
"Bundle 'git://github.com/MarcWeber/vim-addon-mw-utils.git'
"Bundle 'git://github.com/tomtom/tlib_vim.git'
"Bundle 'honza/snipmate-snippets'
"Bundle 'git://github.com/garbas/vim-snipmate.git'
"garbas/vim-snipmate can't work well with supertab

Bundle 'msanders/snipmate.vim'

" Syntax highlight
Bundle 'cucumber.zip'
" Bundle 'Markdown'
Bundle 'tangledhelix/vim-octopress'
autocmd BufNewFile,BufRead *.markdown setf octopress
Bundle 'vim-less'
Bundle 'chaquotay/ftl-vim-syntax'
autocmd BufNewFile,BufRead *.ftl setf html.ftl

set ffs=unix,dos
set history=400

set fencs=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
"set mouse=a

"Enable filetype plugin
filetype plugin on
filetype indent on
set expandtab shiftwidth=2 softtabstop=2 tabstop=2
autocmd FileType c :set cindent
autocmd FileType c :set expandtab shiftwidth=2 softtabstop=8 tabstop=8
autocmd FileType h :set expandtab shiftwidth=2 softtabstop=8 tabstop=8
autocmd FileType cpp :set cindent
autocmd FileType ruby :set makeprg=ruby\ -c\ % errorformat=%f:%l:\ %m
autocmd Bufenter *.hs compiler ghc

" set cscope tag search
set cst
set incsearch
" set nobackup
" set number
set ruler
set showcmd
" set nohls
syntax on
set laststatus=2
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
set autoindent
set ignorecase
set smartcase
" set autochdir
" colors desert
colors railscasts

" tabs
map tt :tabnew<CR>
map td :tabclose<CR>
map tn :tabnext<CR>
map tp :tabprev<CR>

" window
nmap <silent> <A-j> :res +2<cr>
nmap <silent> <A-k> :res -2<cr>
nmap <silent> <A-1> :vert res -2<cr>
nmap <silent> <A-h> :vert res -2<cr>
nmap <silent> <A-l> :vert res +2<cr>

" compress multi-empty lines to one
nmap <C-g>j :silent! g/^$/,/./-j<cr>
" delete blank lines
nmap <C-g>d :silent! g/^$/d<cr>

" Use CTRL-S for saving, also in Insert mode
noremap <C-S>    :w<CR>
vnoremap <C-S>    <C-C>:w<CR>
inoremap <C-S>    <C-O>:w<CR>

" copy & paste {{{

if has("gui_running")
  " CTRL-x is Cut
  vnoremap <C-x> "+x

  " CTRL-Insert is Copy
  " SHIFT-Insert is Paste

  " visual mode
  vnoremap <C-Insert> "+y
  vnoremap <S-Insert> "+gP

  " normal mode
  nnoremap <S-Insert> "+gP
  " insert mode
  inoremap <S-Insert> <ESC>"+pa

  " command line mode, :help cmdline-editing
  cnoremap <C-Insert> <C-Y>
  cnoremap <S-Insert> <C-R>+
endif

" copy & paste }}}

" make sure backspace key can move from current line
" http://vim.wikia.com/wiki/Backspace_and_delete_problems
set backspace=indent,eol,start

let g:SuperTabNoCompleteAfter = ['\s', ',', ':', '"', '#']

map <silent> <F6> :FufTag<CR>
map <silent> <F7> :FufBuffer<CR>
map! <silent> <F8> :FufFile<CR>

nnoremap <silent> sb :FufBuffer<CR>
nnoremap <silent> sf :FufFile<CR>
nnoremap <silent> st :FufTag<CR>
nnoremap <silent> sm :FufMruFile<CR>

let g:fuf_modesDisable = []
let g:fuf_ignoreCase = 1
let g:fuf_file_exclude = '\v\~$|\.(o|exe|dll|bak|orig|swp|swo)$|(^|[/\\])\.(CVS|svn|hg|git|bzr)($|[/\\])'

let g:fuf_abbrevMap = {
  \'^vim:' : [ '~/.vim/**/' ],
\}

" TagList
nmap <silent> <F4> :TlistToggle<CR>
let Tlist_Use_Right_Window = 1
" Displaying tags for only one file
let Tlist_Show_One_File = 1

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
nnoremap <silent> <Leader>t :CtrlP<CR>

" NERDTree
nmap <silent> <F2> :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.pyc$', '\~$', '\.rbc', '\.swp', '\.swo']
let g:netrw_browse_split = 0
let g:netrw_liststyle = 3

" Strip trailing whitespace
function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction
" autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()
nmap <Leader>sw :call <SID>StripTrailingWhitespaces()<CR>

nnoremap <silent> <F3> :Ack<CR>

map <F5> :VCSBlame<CR>

" NERD commenter
vmap cm <leader>c<Space>gv
nmap cm <leader>c<Space>

" vim-rails
let g:rails_ctags_arguments = "--languages=-javascript --exclude=tmp --exclude=.svn --exclude=.git --exclude=*.sql"

if filereadable(expand("~/.vim/.vimrc"))
  source ~/.vim/.vimrc
endif

" vim: ft=vim
