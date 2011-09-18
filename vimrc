
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
Bundle 'SuperTab-continued.'
Bundle 'grep.vim'
Bundle 'taglist.vim'

" Programming
Bundle 'a.vim'
Bundle 'project.tar.gz'
Bundle 'matchit.zip'
Bundle 'anzaika/go.vim'
Bundle 'OOP-javascript-indentation'
Bundle 'jQuery'
Bundle 'rails.vim'
Bundle 'The-NERD-Commenter'
Bundle 'vcscommand.vim'
Bundle 'Align'

" Snippets
Bundle 'gh:gmarik/snipmate.vim.git'
" Syntax highlight
Bundle 'cucumber.zip'
Bundle 'Markdown'
Bundle 'vim-less'

autocmd BufNewFile,BufRead *.less setf less
autocmd BufNewFile,BufRead *.feature setf cucumber

set tags=./tags
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
" autocmd FileType ruby :set tags+=~/.rvm/gems/ree-1.8.7-2011.03/gems/tags
autocmd FileType ruby :set makeprg=ruby\ -c\ % errorformat=%f:%l:\ %m
autocmd Bufenter *.hs compiler ghc

" set cscope tag search
set cst
set incsearch
set nobackup
set number
set ruler
set showcmd
" set nohls
syntax on
set laststatus=2
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
set autoindent
set autochdir
colors desert

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
nmap <C-g>d :silent! g/^$/d<cr>

" Use CTRL-S for saving, also in Insert mode
noremap <C-S>    :update<CR>
vnoremap <C-S>    <C-C>:update<CR>
inoremap <C-S>    <C-O>:update<CR>

" copy & paste {{{

if has("gui_running")
  " CTRL-x is Cut
  vmap <C-x> "+x

  " CTRL-Insert is Copy
  vmap <C-Insert> "+y

  " SHIFT-Insert is Paste
  " visual mode
  vmap <S-Insert> "+gP
  " normal mode
  nmap <S-Insert> "+gP
  " insert mode
  imap <S-Insert> <ESC>"+gPa
endif

" copy & paste }}}

" make sure backspace key can move from current line
" http://vim.wikia.com/wiki/Backspace_and_delete_problems
set backspace=indent,eol,start

nnoremap <silent> <F5> :FufFile<CR>
nmap <silent> <F6> :FufTag<CR>
nmap <silent> <F7> :FufBuffer<CR>

let g:fuf_modesDisable = []
let g:fuf_ignoreCase = 1

let g:fuf_abbrevMap = {
  \'^vim:' : [ '~/.vim/**/' ],
\}

" TagList
nmap <silent> <F4> :TlistToggle<CR>
let Tlist_Use_Right_Window = 1
" Displaying tags for only one file
let Tlist_Show_One_File = 1

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
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

nnoremap <silent> <F12> :Rgrep<CR>

if filereadable(expand("~/.vim/.vimrc"))
  source ~/.vim/.vimrc
endif

" vim: ft=vim
